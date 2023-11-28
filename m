Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=80x24.org header.i=@80x24.org header.b="AiCXWlKf"
Received: from dcvr.yhbt.net (dcvr.yhbt.net [173.255.242.215])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B71A1727
	for <workflows@vger.kernel.org>; Tue, 28 Nov 2023 10:20:04 -0800 (PST)
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
	by dcvr.yhbt.net (Postfix) with ESMTP id F34611F406;
	Tue, 28 Nov 2023 18:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=80x24.org;
	s=selector1; t=1701195604;
	bh=zE94oUBhfCObe0OpSOR5LxUkm8GPVhWrankBoZ5oRO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AiCXWlKfnJJ9p6V76iMqjw9IUB0Qn4jZjQthuu7d5pI0stN3gOHYa4Y9TxMYAgdiU
	 05jXasRzC/BqWBMxWX/tpQvgqTaM8kogAJcRKNsiEUnvWcykBq1OiNsMr2/jMPbmXX
	 jF/NwV42g2d72hpE1EjqbHp0tbgaa5tfaVHAns0Q=
Date: Tue, 28 Nov 2023 18:20:03 +0000
From: Eric Wong <e@80x24.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: meta@public-inbox.org, workflows@vger.kernel.org
Subject: Re: extra search flags and params? (ispatch, replycount, ...)
Message-ID: <20231128182003.M860390@dcvr>
References: <20231128001028.M189230@dcvr>
 <20231128-classy-brown-muskrat-7f07b1@nitro>
 <20231128173509.M955004@dcvr>
 <20231128-pretty-sidewinder-of-pluck-a61b0a@meerkat>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231128-pretty-sidewinder-of-pluck-a61b0a@meerkat>

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Tue, Nov 28, 2023 at 05:35:09PM +0000, Eric Wong wrote:
> > > I understand the reasoning, but I'm not sure we should be trying too hard to
> > > make public-inbox a patch tracking platform. What makes lei great is ability
> > > to automatically find and retrieve entire threads -- I feel like we should
> > > leave series tracking to other platforms that already exist (patchwork,
> > > patchew, etc).
> > 
> > I was thinking more along the lines of readers just trying to
> > find trying to find non-patch discussions.
> 
> Ah. I think here is enough to just say "s:* AND NOT s:PATCH" without
> introducing additional xapian indexing parameters. Though, perhaps the web
> interface can also gain a "collapse threads" view?

topics_new.html / topics_active.html endpoints?
Also, '&t' is a weird accident that happens to work:

https://yhbt.net/lore/git/?q=s:*+AND+NOT+s:PATCH&t

I suppose that's OK for the majority of cases.

Though being able to find unanswered threads could be helpful.

> > > This made me realize that there's actually a multitude of ways the same patch
> > > can be represented (diff-algorithm, number of context lines, etc) that would
> > > cause git-patch-id to return a different value for the exact same commit.
> > 
> > Yeah, post-image blob abbreviations are probably the way to go.
> > 
> > Fwiw, solver only uses post-image blob abbreviations and the
> > filename as a hint.  I rolled it out a few hours ago on yhbt.net/lore
> > and it seems to be solving kernel blobs just fine, but the
> > debug log is choosing random git URLs.
> 
> Ah, neat! That said, what happens if a series was applied with "git am -3" and
> the post-image blob abbreviations are necessarily different? (I may be
> misunderstanding the approach, please correct me if I do.)

The resulting blob will be retrievable directly via git once
it's pushed to a mirrored repo.  solver tries to look for a blob
in git, first, before trying to search+apply patches[1].

Right now I'm only clamping to 3 coderepos for performance
reasons, but that limitation is going away.  But I need a nap,
first :x


[1] solver could reverse the order to look for the mails first
    if we wanted to see the fullest email history of a blob,
    but it's much slower because it has to do a lot more work
    (hitting Xapian and runing git apply+ls-files for every
    single patch).

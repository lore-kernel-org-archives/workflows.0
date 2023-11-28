Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D680F39AC2
	for <workflows@vger.kernel.org>; Tue, 28 Nov 2023 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kh8FKXP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 311ACC433C8;
	Tue, 28 Nov 2023 17:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701193772;
	bh=y1e3RYOuKwJ96l9EZTbseRsZWi3EOi60zGjuh8tfoB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kh8FKXP5PPAKxg0Yni6hXaUiGg3jrLjZcIRwciuB6ZipgWNMnfRu+V8IuZ/wWw9So
	 IKONMxIdYiyKfXycwfchaGVs7GbroMTFFajhtWXuytDxRVKkoQM54r94akr4wiI7qQ
	 n/0iuXGZgrNCgt5Wg0FBiUQLZZReK6BUZIHYlGMg=
Date: Tue, 28 Nov 2023 12:49:31 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Eric Wong <e@80x24.org>
Cc: meta@public-inbox.org, workflows@vger.kernel.org
Subject: Re: extra search flags and params? (ispatch, replycount, ...)
Message-ID: <20231128-pretty-sidewinder-of-pluck-a61b0a@meerkat>
References: <20231128001028.M189230@dcvr>
 <20231128-classy-brown-muskrat-7f07b1@nitro>
 <20231128173509.M955004@dcvr>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231128173509.M955004@dcvr>

On Tue, Nov 28, 2023 at 05:35:09PM +0000, Eric Wong wrote:
> > I understand the reasoning, but I'm not sure we should be trying too hard to
> > make public-inbox a patch tracking platform. What makes lei great is ability
> > to automatically find and retrieve entire threads -- I feel like we should
> > leave series tracking to other platforms that already exist (patchwork,
> > patchew, etc).
> 
> I was thinking more along the lines of readers just trying to
> find trying to find non-patch discussions.

Ah. I think here is enough to just say "s:* AND NOT s:PATCH" without
introducing additional xapian indexing parameters. Though, perhaps the web
interface can also gain a "collapse threads" view?

> > This made me realize that there's actually a multitude of ways the same patch
> > can be represented (diff-algorithm, number of context lines, etc) that would
> > cause git-patch-id to return a different value for the exact same commit.
> 
> Yeah, post-image blob abbreviations are probably the way to go.
> 
> Fwiw, solver only uses post-image blob abbreviations and the
> filename as a hint.  I rolled it out a few hours ago on yhbt.net/lore
> and it seems to be solving kernel blobs just fine, but the
> debug log is choosing random git URLs.

Ah, neat! That said, what happens if a series was applied with "git am -3" and
the post-image blob abbreviations are necessarily different? (I may be
misunderstanding the approach, please correct me if I do.)

-K

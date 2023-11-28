Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=80x24.org header.i=@80x24.org header.b="b6Rilupb"
Received: from dcvr.yhbt.net (dcvr.yhbt.net [173.255.242.215])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D6910CA
	for <workflows@vger.kernel.org>; Tue, 28 Nov 2023 09:35:10 -0800 (PST)
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
	by dcvr.yhbt.net (Postfix) with ESMTP id 098071F406;
	Tue, 28 Nov 2023 17:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=80x24.org;
	s=selector1; t=1701192910;
	bh=rc+SldNPri6ZmucvFyTlwvWHPPqJQn3lJNE1CrBcWNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b6Rilupbl2XFhC9AD/M1aHWMZ200NX3OcFWiiregUPHqn8jba+HCTNm04OE8rqGKX
	 Ex1itePl1mt5ggW5XG1m80qCqll5DA/IaBTHGoNSl2pMFdp7Wzmyy1iq7V9sUeMooR
	 87ARXSDd0H9SorRjBl8LuXxBdOWGHk1edbOgEsSQ=
Date: Tue, 28 Nov 2023 17:35:09 +0000
From: Eric Wong <e@80x24.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: meta@public-inbox.org, workflows@vger.kernel.org
Subject: Re: extra search flags and params? (ispatch, replycount, ...)
Message-ID: <20231128173509.M955004@dcvr>
References: <20231128001028.M189230@dcvr>
 <20231128-classy-brown-muskrat-7f07b1@nitro>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231128-classy-brown-muskrat-7f07b1@nitro>

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Tue, Nov 28, 2023 at 12:10:28AM +0000, Eric Wong wrote:
> > Would they be useful?
> > 
> > It's not currently possible to quickly search for whether or not
> > a term (e.g. patchid:) is present in a Xapian document.  Having
> > the ability to do so would make it easier to find non-patch messages,
> > or easily filter down to cover letters, bot replies, etc...
> 
> I understand the reasoning, but I'm not sure we should be trying too hard to
> make public-inbox a patch tracking platform. What makes lei great is ability
> to automatically find and retrieve entire threads -- I feel like we should
> leave series tracking to other platforms that already exist (patchwork,
> patchew, etc).

I was thinking more along the lines of readers just trying to
find trying to find non-patch discussions.  I'm not really
interested in the tracking part, more just being able to quickly
find discussion related to a commit.

> > I don't think any of these would be required to get "lei rediff"
> > working on entire patchsets, though (it only does individual
> > messages, currently).
> 
> Incidentally, I've recently discovered that relying on git-patch-id to match
> commits to message archives has some important flaws. Linus was actually the
> one who caused this when he recommended that maintainers switch to using the
> "histogram" diff algorithm instead of the default ("myers").

Yeah, -cindex was actually built to support joins on pre or post-image
blob OIDs, too, just need to clamp to a 7 char hex abbreviation.
Even Subjects <=> commit titles could be made to work with the
way our indices are setup.

> This made me realize that there's actually a multitude of ways the same patch
> can be represented (diff-algorithm, number of context lines, etc) that would
> cause git-patch-id to return a different value for the exact same commit.

Yeah, post-image blob abbreviations are probably the way to go.

Fwiw, solver only uses post-image blob abbreviations and the
filename as a hint.  I rolled it out a few hours ago on yhbt.net/lore
and it seems to be solving kernel blobs just fine, but the
debug log is choosing random git URLs.

(Solver is the thing that powers `lei rediff' and the linkified
hunk headers on public-inbox.org/git since 2019, and now yhbt.net/lore)

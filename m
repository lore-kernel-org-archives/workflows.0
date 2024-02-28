Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F13579B74
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 19:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709148758; cv=none; b=aBPe0Cr8t/Sy6xkB4Ggy8qvWg7+EXrHtohMEkhsvJKD4vW5nvqb6DJOVjV9nn3aDiZb1FY5jj30u6NOn9NknqSGvL9PJFm5HQe7/0XXoBREWWG6kmDgWPCYMaRU2Sxrphoh+sGgtYSWWKQqb+t2fQ7YYr04V7aYUwrjXLWsIPR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709148758; c=relaxed/simple;
	bh=zDBDdxhkpl+y9N/Zc3Tw3tbsikzREggAr6o46hui5Ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvOsAeOX4QJoobXI19LkcYJyj5FW+I1o6+vOv4PkMFImwYH8i1Cc2PnY7x0NXarwF4iQN68sljekDwi7P77hevZuIO1xnkS+EaVu/m2k5/sDOuWJh/trzaEhpHkYPmiWKaujyZJVWNH9Z0neK1tyaF+ANVWmDgT3s/jazal2lSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3Obg18px; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3Obg18px"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Dpq1luyocGQv/sxyjVPfvUqyCaGzg0/LBtSjaqvOnGk=; b=3Obg18px4sVvXKA0SAXrv42i5r
	X9i7EZ11EzffL/v3bFLTxOW2o8ATTn1W9oP7XRREXRmphgXNuX7nHsxFGfpRWJ2usUUD0TGy1V+Ix
	HyCVt3m6UF9ACVGEmkv0RfnX+DJjRcMAm24w6hIKstGazZ2T6AGjy6+6TKy8wBODuFPeMHczP5jnL
	FHnbw0LXpx9pFDcKfwxV6nMEEer9DOCct4t6KbJ+GtzSdrepQJKYOrdWYjblAFrbpdUml0+ZcIe6d
	ePdQJL2AEI3h/nH4kwsyOeqmmPxSaTIZvJfFaBOjZU52T55RJDwCulNfa7NcvRO+lVElWTBI1AVwd
	so6aiomQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfPfP-0000000AgNv-2i5e;
	Wed, 28 Feb 2024 19:32:36 +0000
Date: Wed, 28 Feb 2024 11:32:35 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Message-ID: <Zd-KU5lrdeAk4LiT@bombadil.infradead.org>
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227-flawless-capybara-of-drama-e09653@lemur>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Tue, Feb 27, 2024 at 05:32:34PM -0500, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> I was playing with shell-gpt and wrote a quickie integration that would allow
> retrieving (slimmed-down) threads from lore, feeding them to ChatGPT, and
> asking it to provide some basic analysis of the thread contents. Here's a
> recorded demo session:
> 
> https://asciinema.org/a/643435
> 
> A few notes:
> 
> 1. This is obviously not a replacement for actually reading email, but can
>    potentially be a useful asset for a busy maintainer who just wants a quick
>    summary of a lengthy thread before they look at it in detail.
> 2. This is not free or cheap! To digest a lengthy thread, you can expect
>    ChatGPT to generate enough tokens to cost you $1 or more in API usage fees.
>    I know it's nothing compared to how expensive some of y'all's time is, and
>    you can probably easily get that expensed by your employers, but for many
>    others it's a pretty expensive toy. I managed to make it a bit cheaper by
>    doing some surgery on the threads before feeding them to chatgpt (like
>    removing most of the message headers and throwing out some of the quoted
>    content), but there's a limit to how much we can throw out before the
>    analysis becomes dramatically less useful.
> 3. This only works with ChatGPT-4, as most threads are too long for
>    ChatGPT-3.5 to even process.
> 
> So, the question is -- is this useful at all? Am I wasting time poking in this
> direction, or is this something that would be of benefit to any of you? If the
> latter, I will document how to set this up and commit the thread minimization
> code I hacked together to make it cheaper.

While I probably wouldn't use it day to day, I expect younger
generations might use this more than us older generations to be more
productive, even if they get halluciations.

An LLM trained with more data relevant to patches might be more
suitable, and it is why I wanted the tooling for stable candidate patches
to be opened up, so to enable more exploring in areas like this.

A use case example might be training for identifying subsystems with
more memory safety issues.

Another might be to help to summarize further pull requests in one or
two sentences, or optionally few bullets. So for instance, I try to
document major bullet list changes for modules here:

https://kernelnewbies.org/KernelProjects/modules

So it is easier to track / go down memory lane. Doing this automatically
would allow me to use a tool to do this.

  Luis

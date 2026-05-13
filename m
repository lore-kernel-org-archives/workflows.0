Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E560C2253FC;
	Wed, 13 May 2026 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677250; cv=none; b=ACPSsMdl9CLOQNx4bwaHJhakG4rZUofgIhIgZ42V61xCbmvrtjxWT3XXHBWbLxTDxbp/3b4/P5LYxkBnUr5/E4oK/mzKakGoV6HjWz7LsaN6bCIzQs7hDe1LKxOp8whKQj9etOOF05+tMzFjw0JPw4kBKBDkVHJdcWM03e6o7+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677250; c=relaxed/simple;
	bh=9N+1zuHsLLhEaxJKc1iG6WW5tFR6+PEzdlK3+XgtUpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbgErsgx3EsZr6TqvCR77hNV5HteTzxu/B9Kkxnn634q8n3JSWa4MbW9O4wbUqEDbLhIZozA/LC5TTDZSUZD2KvxkwhEtbGZryZhcGJXeTjjrNzJMBhRwTMhIFHY1yLN6Z5EiORSxhTtPrGfQDA9qvqAu9yUXXLDYcUcpXlDsWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=TvvF9S5l; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="TvvF9S5l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778677244; bh=qBcScveFRQyHvQyox5O4W6sIYubYuCCDhhgq81lAUhQ=;
	h=From:Message-ID:From;
	b=TvvF9S5lPZMzLe6XYC7y1WLmeFYUDothNgTHsC8buVTZyTimDru5Gv9GUWB2sGrfv
	 +Y7dk5Nt4QzJk46SlQ0lK0NhOxBXA6iKsqatXA+7PTkAazMRGZzUYSjpM4lA8z4xAi
	 3T1VUh2gUJUNWicLOnWKCFE3eg44eq0ORC68x7Sc=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 46B91C0A92;
	Wed, 13 May 2026 15:00:44 +0200 (CEST)
Date: Wed, 13 May 2026 15:00:43 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <agR1-2Sj1KO9oM2k@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu>
 <87wlx8o87g.fsf@trenco.lwn.net>
 <2026051333-puzzle-smokiness-8096@gregkh>
 <agRfFoMC2Gcu0Esz@1wt.eu>
 <87ecjfmpzj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ecjfmpzj.fsf@trenco.lwn.net>

On Wed, May 13, 2026 at 06:52:00AM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> > On Wed, May 13, 2026 at 12:29:34PM +0200, Greg KH wrote:
> >> On Tue, May 12, 2026 at 11:20:51AM -0600, Jonathan Corbet wrote:
> >> > Willy Tarreau <w@1wt.eu> writes:
> 
> >> > > +* **Capability-based protection**:
> >> > > +
> >> > > +  * users not having the ``CAP_SYS_ADMIN`` capability may not alter the
> >> > > +    kernel's configuration, memory nor state, change other users' view of the
> >> > > +    file system layout, grant any user capabilities they do not have, nor
> >> > > +    affect the system's availability (shutdown, reboot, panic, hang, or making
> >> > > +    the system unresponsive via unbounded resource exhaustion).
> >> > 
> >> > That is pretty demonstrably not true, and will likely elicit challenges
> >> > at some point.  There are a lot of "make me root" capabilities that
> >> > enable users to do all of those things; consider CAP_DAC_OVERRIDE as an
> >> > obvious example.  I think that just about all of the capabilities will
> >> > enable at least one of those things - that's why the capabilities exist
> >> > in the first place.  So I think this needs to be written far more
> >> > generally.
> >> 
> >> You are right, there are more capabilities, but we get bug reports all
> >> the time that basically come down to "a user with CAP_SYS_ADMIN can go
> >> and do..." which are pointless for us to be handling.  Just got one a
> >> few minutes ago, so LLMs are churning this crap out quite frequently.
> >> 
> >> So any rewording of this to prevent us from getting these pointless
> >> reports would be great.
> >
> > Honestly we're seeing this through the angle of a patch that lists a
> > single paragraph but the doc is already becoming quite long. I'm a bit
> > afraid of adding long enumerations, or sentences which do not immediately
> > translate to something recognizable by reporters. Not that it cannot be
> > done, but I think the current situation warrants incremental improvements
> > by fixing what doesn't work well. And indeed most of the capabilities
> > based reports currently revolve around "I already have CAP_{SYS,NET}_ADMIN
> > and ...". That might remain a good start for now.
> 
> I definitely wouldn't argue for making it longer, and enumerating all of
> the make-me-root capabilities would be silly.  I would consider just
> replacing CAP_SYS_ADMIN with "elevated capabilities" or some such.  That
> might rule out legitimate reports where some capability provides an
> access it shouldn't, but I suspect you could live with that :)

I think it could indeed work like this, without denaturating the rest
of the paragraph and having broader coverage. Do you think you could
amend/update it ? I'm not trying to add you any burden, it's just that
it will take me more time before I provide an update :-/

Thanks,
Willy

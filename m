Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98933A759E;
	Wed, 13 May 2026 11:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778671387; cv=none; b=RNBbM2dXciSBW+lBbGzMGkqTuCk9uR8HIQcHQKfEotW3PLyGKhmuEky/P4Bd1Vl7q49ei6VIHWqnh0ybjVIeI3tswpNP5DsBFB3FmLgk5boGH/iXDnSlH8NPF5CGA1lvgEevOg2EeX6G122t2SeYhSOI0/akQn+Yuq8/nypG2WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778671387; c=relaxed/simple;
	bh=It9HoQH8VG+qOlXWrl0CfAjPpx+N+y6l6uwTD/a2mZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZr0e2aZPuTYX20ZuCVe6Sd/P7Ca78fCzkauRi5eMo4U2zsS+0R6hmgOk0yU4nsSq4nQna9Qhtq+QIykv1AjBhcJG+XQKnw/5YpyoI3q4+nKmJRr15Ohv7hMW9XA6FVbmSBx1x/+SDSrWnjDMdki/2f9dSorjacSdjgGwsdlY08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=REzuS7yT; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="REzuS7yT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778671382; bh=b2oyB0/F5w985hbhe0zre338I/i6GjgeHnXaD2WTnoI=;
	h=From:Message-ID:From;
	b=REzuS7yT8q3pzANfh0ekUHztZRLIqiucCncp5iQcSNLk+jYncHNuC37p/iBR3Ijhm
	 vUjVVH5TO4vkq/F2zYa/j7Pc7++fwBvT7oddMOVMQ/V9ys1ixgxfrGNX21quxbGmVc
	 iohrMT4d7SYWun+w7tLmH3zibSBZpjtbkYV3xwIM=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id B30ACC0A2C;
	Wed, 13 May 2026 13:23:02 +0200 (CEST)
Date: Wed, 13 May 2026 13:23:02 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Leon Romanovsky <leon@kernel.org>,
        skhan@linuxfoundation.org, security@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <agRfFoMC2Gcu0Esz@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu>
 <87wlx8o87g.fsf@trenco.lwn.net>
 <2026051333-puzzle-smokiness-8096@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026051333-puzzle-smokiness-8096@gregkh>

On Wed, May 13, 2026 at 12:29:34PM +0200, Greg KH wrote:
> On Tue, May 12, 2026 at 11:20:51AM -0600, Jonathan Corbet wrote:
> > Willy Tarreau <w@1wt.eu> writes:
> > 
> > > The use of automated tools to find bugs in random locations of the kernel
> > > induces a raise of security reports even if most of them should just be
> > > reported as regular bugs. This patch is an attempt at drawing a line
> > > between what qualifies as a security bug and what does not, hoping to
> > > improve the situation and ease decision on the reporter's side.
> > >
> > > It defers the enumeration to a new file, threat-model.rst, that tries
> > > to enumerate various classes of issues that are and are not security
> > > bugs. This should permit to more easily update this file for various
> > > subsystem-specific rules without having to revisit the security bug
> > > reporting guide.
> > 
> > One thing here:
> > 
> > [...]
> > 
> > > +* **Capability-based protection**:
> > > +
> > > +  * users not having the ``CAP_SYS_ADMIN`` capability may not alter the
> > > +    kernel's configuration, memory nor state, change other users' view of the
> > > +    file system layout, grant any user capabilities they do not have, nor
> > > +    affect the system's availability (shutdown, reboot, panic, hang, or making
> > > +    the system unresponsive via unbounded resource exhaustion).
> > 
> > That is pretty demonstrably not true, and will likely elicit challenges
> > at some point.  There are a lot of "make me root" capabilities that
> > enable users to do all of those things; consider CAP_DAC_OVERRIDE as an
> > obvious example.  I think that just about all of the capabilities will
> > enable at least one of those things - that's why the capabilities exist
> > in the first place.  So I think this needs to be written far more
> > generally.
> 
> You are right, there are more capabilities, but we get bug reports all
> the time that basically come down to "a user with CAP_SYS_ADMIN can go
> and do..." which are pointless for us to be handling.  Just got one a
> few minutes ago, so LLMs are churning this crap out quite frequently.
> 
> So any rewording of this to prevent us from getting these pointless
> reports would be great.

Honestly we're seeing this through the angle of a patch that lists a
single paragraph but the doc is already becoming quite long. I'm a bit
afraid of adding long enumerations, or sentences which do not immediately
translate to something recognizable by reporters. Not that it cannot be
done, but I think the current situation warrants incremental improvements
by fixing what doesn't work well. And indeed most of the capabilities
based reports currently revolve around "I already have CAP_{SYS,NET}_ADMIN
and ...". That might remain a good start for now.

> > As a lower-priority thing, lockdown mode is meant to at least try to
> > provide some stronger guarantees, and lockdown circumvention seems to be
> > normally be viewed as a security bug.  Worth a mention?
> 
> lockdown issues are best discussed on the list where the lockdown people
> are as most of us feel that really isn't a "security" thing at all :)

I don't remember when we last got a report for it but it's not frequent.
Again, I think we should continue to focus on efficiency, i.e. the number
of improperly routed reports we can stop per word written/read.

Willy

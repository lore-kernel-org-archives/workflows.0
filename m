Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8B1355F5C;
	Thu,  2 Apr 2026 19:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775156620; cv=none; b=utqaxK4FyKmOLCFVeIynaT5yajAy43s7zhKQ1u2tq9SRJ4t09tyW1ZA7+ka0B6L0ZfdGkWxQw7wJgC9CR8utDlUbAavEWSxUrPeXfHe7wruECuKbbVWJu9V6IDG7n5LBWe+IztqT4iDYGPJxPrjDw/X+Eh25nhqgNarxntUR0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775156620; c=relaxed/simple;
	bh=+RzFLeVneY4PTj6Epv8AHL9fqZ+I0v5Fm6ELvZovacE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWbe38jfmjFtSfPyPDjPrM5II7pWCjBD+J7jPCwCHftPxDV/2UqnMUf/mA2iRDcFwlDy3/9DR3nNnQqIjVVse+LjZQWKcc7yn5hIgT4mgkHSrsBAGCThj/DyBSfiDNsyUS/Utg7Abk1M2uJyAOSpM3rWhOFPF/ZOQvjLsU8batg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=pxNiGLkK; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="pxNiGLkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775156617; bh=O6yzJnU9hH/ARJx6ZCZ2O2FBmIpzvj8OXH+eQvhCBh4=;
	h=From:Message-ID:From;
	b=pxNiGLkKPUg5nNkauXyj59S7L8MjpvscHri2jxovF4s9K/FIagxc3mnxw/RaPkOc7
	 EBLVh76ljtsk5ZwmEP9iSmneT9BE9+UafDpx54o/K9OKhIY8bWvbgTbOVIG/LT3O6i
	 SJxkUUkfMkBmB6RypVosFTg25ni+nG40uwm3Z+co=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 1775DC0A98;
	Thu, 02 Apr 2026 21:03:37 +0200 (CEST)
Date: Thu, 2 Apr 2026 21:03:36 +0200
From: Willy Tarreau <w@1wt.eu>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: greg@kroah.com, edumazet@google.com, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Documentation: clarify the mandatory and desirable
 info for security reports
Message-ID: <ac69iG5fihUd82yH@1wt.eu>
References: <20260402182655.8636-1-w@1wt.eu>
 <20260402182655.8636-4-w@1wt.eu>
 <18127458-1951-4b44-bcbb-a5747a3b4b6b@infradead.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18127458-1951-4b44-bcbb-a5747a3b4b6b@infradead.org>

Hi Randy,

On Thu, Apr 02, 2026 at 11:50:00AM -0700, Randy Dunlap wrote:
> 
> On 4/2/26 11:26 AM, Willy Tarreau wrote:
> > A significant part of the effort of the security team consists in begging
> > reporters for patch proposals, or asking them to provide them in regular
> > format, and most of the time they're willing to provide this, they just
> > didn't know that it would help. So let's add a section detailing the
> > required and desirable contents in a security report to help reporters
> > write more actionable reports which do not require round trips.
> > 
> > Cc: Eric Dumazet <edumazet@google.com>
> > Cc: Greg KH <greg@kroah.com>
> > Signed-off-by: Willy Tarreau <w@1wt.eu>
> > ---
> >  Documentation/process/security-bugs.rst | 66 ++++++++++++++++++++++---
> >  1 file changed, 59 insertions(+), 7 deletions(-)
> > 
> > diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
> > index 6937fa9fba5a..b243ac24eb12 100644
> > --- a/Documentation/process/security-bugs.rst
> > +++ b/Documentation/process/security-bugs.rst
> > @@ -7,6 +7,65 @@ Linux kernel developers take security very seriously.  As such, we'd
> >  like to know when a security bug is found so that it can be fixed and
> >  disclosed as quickly as possible.
> >  
> > +Preparing your report
> > +---------------------
> > +
> > +Like with any bug report, a security bug report requires a lot of analysis work
> > +from the developers, so the more information you can share about the issue, the
> > +better.  Please review the procedure outlined in
> > +'Documentation/admin-guide/reporting-issues.rst' if you are unclear about what
> 
> Drop the single quote marks.

I just moved this part as-is, and I've been extremely hesitant to change
formatting as I can't easily check the validity of the output.

> > +information is helpful.  The following information are absolutely necessary in
> > +**any** security bug report:
> > +
> > +  * **affected kernel version range**: with no version indication, your report
> > +    will not be processed.  A significant part of reports are for bugs that
> > +    have already been fixed, so it is extremely important that vulnerabilities
> > +    are verified on recent versions (development tree or latest stable
> > +    version), at least by verifying that the code has not changed since the
> > +    version where it was detected.
> > +
> > +  * **description of the problem**: a detailed description of the problem, with
> > +    traces showing its manifestation, and why you consider that the observed
> > +    behavior as a problem in the kernel, is necessary.
> > +
> > +  * **reproducer**: developers will need to be able to reproduce the problem to
> > +    consider a fix as effective.  This includes both a way to trigger the issue
> > +    and a way to confirm it happens.  A reproducer with low complexity
> > +    dependencies will be needed (source code, shell script, sequence of
> > +    instructions, file-system image etc).  Binary-only executables are not
> > +    accepted.  Working exploits are extremely helpful and will not be released
> > +    without consent from the reporter, unless they are already public.  By
> > +    definition if an issue cannot be reproduced, it is not exploitable, thus it
> > +    is not a security bug.
> > +
> > +  * **conditions**: if the bug depends on certain configuration options,
> > +    sysctls, permissions, timing, code modifications etc, these should be
> > +    indicated.
> > +
> > +In addition, the following information are highly desirable:
> > +
> > +  * **suspected location of the bug**: the file names and functions where the
> > +    bug is suspected to be present are very important, at least to help forward
> > +    the report to the appropriate maintainers.  When not possible (for example,
> > +    "system freezes each time I run this command"), the security team will help
> > +    identify the source of the bug.
> > +
> > +  * **a proposed fix**: bug reporters who have analyzed the cause of a bug in
> > +    the source code almost always have an accurate idea on how to fix it,
> > +    because they spent a long time studying it and its implications.  Proposing
> > +    a tested fix will save maintainers a lot of time, even if the fix ends up
> > +    not being the right one, because it helps understand the bug.  When
> > +    proposing a tested fix, please always format it in a way that can be
> > +    immediately merged (see :doc:`regular patch submission
> > +    <../process/submitting-patches>`).  This will save some back-and-forth
> 
> Hm, I don't see anything in submitting-patches.rst called "regular patch submission".
> Is it in some other patch?

Not sure what you mean. Is this supposed to be a sub-section and not just a
title ? On https://www.kernel.org/doc/html/latest/process/security-bugs.html
it appears as the title. This one was already present in the same document
and was moved there without a change.

Thanks a lot for your help!
Willy

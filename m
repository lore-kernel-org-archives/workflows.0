Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4572628D;
	Sat,  9 May 2026 04:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778302141; cv=none; b=cnikvzCJDMYzhx3BgqdFrp3ABFClIVGsAm1CNKNeqhCX6dxcYSlIYmGs303aNglU/44cKPpEIhaqZpQy+LzzgoOA2XMyIU++u6D6lGrRKsQMBfwmkeUTkEcbaqfTPJTG9Yp7SGGFne9DV1OAT0ymak4C60BTGU3rkAT7LwRKmoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778302141; c=relaxed/simple;
	bh=ju+8TLjr2sNy9ozi8owYFHLh5EP6sl2aXApK7vy2V5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbQlcoe/HKm8pVmPgwg/LfauHbYo4/L6mFE8jFKWj3fOVfb9jSBdX0G/MG1pfsPssvZ7IcaobGWn+MekYz/zFNfPza2vS5lH+ZNEHixg7FAqRiBroxVlXOIjZcSgeY2ZX4DOB216XzlOV2N1tHLEUiFY2Gh1mvuBIS/2DhtqIyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=tQLIDzXI; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="tQLIDzXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1778302136; bh=0ahvONzRblcMwglYNfCB9BDSVfL0waUZhsj+2lAkeMU=;
	h=From:Message-ID:From;
	b=tQLIDzXIu0qD8nFHKNv8heNfHpjYEG5PoejBFMV/HcJH5rjHXqojJmsXWIXYZhVjo
	 GFWMV+9U594X+jW0b8KPuwGHVJN1zRWuh6Cc5rMvR25UvH6Mted2GLTBhCKGAkWqIf
	 o6wfgQqzMfJfIAYfPF/RcmqYOiIJv9Juk9FhPPMg=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id AEBAFC0BD2;
	Sat, 09 May 2026 06:48:56 +0200 (CEST)
Date: Sat, 9 May 2026 06:48:56 +0200
From: Willy Tarreau <w@1wt.eu>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: greg@kroah.com, leon@kernel.org, security@kernel.org,
        Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
Message-ID: <af68uG2YIoYqnKbZ@1wt.eu>
References: <20260503113506.5710-1-w@1wt.eu>
 <20260503113506.5710-3-w@1wt.eu>
 <a3ca798c-40ad-4afb-9c6b-35d53430b6d0@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3ca798c-40ad-4afb-9c6b-35d53430b6d0@linuxfoundation.org>

Hi Shuah,

On Fri, May 08, 2026 at 02:52:13PM -0600, Shuah Khan wrote:
> > +What qualifies as a security bug
> > +--------------------------------
> > +
> > +It is important that most bugs are handled publicly so as to involve the widest
> > +possible audience and find the best solution.  By nature, bugs that are handled
> > +in closed discussions between a small set of participants are less likely to
> > +produce the best possible fix (e.g., risk of missing valid use cases, limited
> > +testing abilities).
> > +
> > +It turns out that the majority of the bugs reported via the security team are
> > +just regular bugs that have been improperly qualified as security bugs due to
> > +ignorance or misunderstanding of the Linux kernel's threat model described in
> 
> "lack of understanding" instead of ignorance?

I already had "misunderstanding", here I wanted to express the idea that
people could simply ignore that this file exists (since it's new). Do you
think we shouldn't care about this and just keep "misunderstanding" ?

(...)
> > +The Linux Kernel threat model
> > +=============================
> > +
> > +There are a lot of assumptions regarding what the kernel protects against and
> > +what it does not protect against. These assumptions tend to cause confusion for
> 
> Could simply say "what it does not" or "what the kernel does and does not protect
> against"

Ah OK good point, I'll rephrase it.

> > +* **Configuration**:
> > +
> > +  * outdated kernels and particularly end-of-life branches are out of the scope
> > +    of the kernel's threat model: administrators are responsible for keeping
> > +    their system up to date. For a bug to qualify as a security bug, it must be
> > +    demonstrated that it affects actively maintained versions.
> > +
> > +  * build-level: changes to the kernel configuration that are explicitly
> > +    documented as lowering the security level (e.g. ``CONFIG_NOMMU``), or
> > +    targeted at developers only.
> > +
> > +  * OS-level: changes to command line parameters, sysctls, filesystem
> > +    permissions, user capabilities, exposure of privileged interfaces, that
> > +    explicitly increase exposure by either offering non-default access to
> > +    unprivileged users, or reduce the kernel's ability to enforce some
> > +    protections or mitigations. Example: write access to procfs or debugfs.
> > +
> > +  * issues triggered only when using features intended for development or
> > +    debugging (e.g., lockdep, KASAN, fault-injection): these features are known
> > +    to introduce overhead and potential instability and are not intended for
> > +    production use.
> 
> Can we call out features and tools (the ones in kernel repo)

Sure!

> sched_ext's Kconfig enables
> a few debug options including LOCKDEP
> 
> tools/sched_ext/Kconfig:CONFIG_DEBUG_LOCKDEP=y

It's still there but maybe not visible enough, I should probably write
it in upper case:

   debugging (e.g., lockdep, KASAN, fault-injection):

> > +* **Excess of initial privileges**:
> > +
> > +  * actions performed by a user already possessing the privileges required to
> > +    perform that action or modify that state (e.g. ``CAP_SYS_ADMIN``,
> > +    ``CAP_NET_ADMIN``, ``CAP_SYS_RAWIO``, ``CAP_SYS_MODULE`` with no further
> > +    boundary being crossed).
> > +
> > +  * actions performed in user namespace without permitting anything in the
> > +    initial namespace that was not already permitted to the same user there.
> 
> This was a bit hard to parse - examples might help here

Yeah when rereading it now, I fully agree. I think I should avoid the
double negation here and use a form such as;

  * actions performed in user namespace that do not bypass the restrictions
    imposed to the initial user.

If examples are still needed, I could possibly add: "(e.g. ptrace, signals,
FS or device access, system/network configuration, network binding)".

> > +  * anything performed by the root user in the initial namespace (e.g. kernel
> > +    oops when writing to a privileged device).
> > +
> > +* **Out of production use**:
> > +
> > +  This covers theoretical/probabilistic attacks that rely on laboratory
> > +  conditions with zero system noise, or those requiring an unrealistic number
> > +  of attempts (e.g., billions of trials) that would be detected by standard
> > +  system monitoring long before success, such as:
> > +
> > +  * prediction of random numbers that only works in a totally silent
> > +    environment (such as IP ID, TCP ports or sequence numbers that can only be
> > +    guessed in a lab).
> > +
> > +  * activity observation and information leaks based on probabilistic
> > +    approaches that are prone to measurement noise and not realistically
> > +    reproducible on a production system.
> > +
> > +  * issues that can only be triggered by heavy attacks (e.g. brute force) whose
> > +    impact on the system makes it unlikely or impossible to remain undetected
> > +    before they succeed (e.g. consuming all memory before succeeding).
> > +
> > +  * problems seen only under development simulators, emulators, or combinations
> > +    that do not exist on real systems at the time of reporting (issues
> > +    involving tens of millions of threads, tens of thousands of CPUs,
> > +    unrealistic CPU frequencies, RAM sizes or disk capacities, network speeds.
> > +
> > +  * issues whose reproduction requires hardware modification or emulation,
> > +    including fake USB devices that pretend to be another one.
> > +
> > +  * as well as issues that can be triggered at a cost that is orders of
> > +    magnitude higher than the expected benefits (e.g. fully functional keyboard
> > +    emulator only to retrieve 7 uninitialized bytes in a structure, or
> > +    brute-force method involving millions of connection attempts to guess a
> > +    port number).
> 
> Can we add a section about problems found using experimental or tools
> in development stage?

You mean one more paragraph about CONFIG_EXPERIMENTAL ? Or what else do
you have in mind ? Do not hesiate to propose a paragraph if you have
anything in mind!

(...)

> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> thanks,

Thank you!
Willy

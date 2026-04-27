Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DA2336892;
	Mon, 27 Apr 2026 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303670; cv=none; b=bfu6gqSR5I7WC0yAbUSSdIWBFHuKfsUadY8ke4s85dusQ5QnW8CfN7Zs83sjA0kSiw9d+NMkFK9KbcZJmBGNNI/3xydXuwLwYkULiOyLBwXBbOKwkbue133Zi/1MSyIB1sE0W8f2gnf6TMuydre6N5WQaRLQIY2TMq9mwHZHiW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303670; c=relaxed/simple;
	bh=zr2cueiJF8tmr0tiUGgkGx3yYTveJbdEWTXuuiBJ2D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MP/nKAHcdxPsbUCq8uMIrjXT0HC5zzfYUC6GV3CgRkgQ5mXoWK2hrESTUY+ZLNHwcM9rUYRREGLdF0RAhq8fHq11YfIUGV7VGQk7GjnEVZDFw3LKQUskDPeDmQGaHAZip3iokI94iRTB8WaYnOU1jmIFGP94Yugb/Yvr2ppHg6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=FRWieHPX; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="FRWieHPX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777303666; bh=AzNXzK8YxvD1BpIkwYJD+QtF9XfyxQplr5+zb0yrJIk=;
	h=From:Message-ID:From;
	b=FRWieHPX4scTP4VGKhRCF3EZK3Rl9gpJps0NXTEoY+hXnYur/aZNh4ejK0Ps09Z5t
	 mwoMfA48qzegMJFAz3Xj+JV7DOAY4hHh+Uuld6MvwOfV15TWeJnmwi6ofLAaqC0m9L
	 1fa0BuMEW76H3vEQNYjIHFciM8EobLNK+xqbBsnU=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id ACEE5C0AA5;
	Mon, 27 Apr 2026 17:27:46 +0200 (CEST)
Date: Mon, 27 Apr 2026 17:27:46 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation: security-bugs: explain what is and is
 not a security bug
Message-ID: <ae-Acm2XJ3sR34Il@1wt.eu>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-3-w@1wt.eu>
 <2026042753-ozone-jigsaw-4ad5@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042753-ozone-jigsaw-4ad5@gregkh>

On Mon, Apr 27, 2026 at 07:48:23AM -0600, Greg KH wrote:
> On Sun, Apr 26, 2026 at 06:39:13PM +0200, Willy Tarreau wrote:
> > +In the Linux kernel's threat model, an issue is **not** a security bug, and
> > +should not be reported to the security list, when triggering it requires the
> > +reporter to first undermine the system they are attacking.  This includes, but
> > +is not limited to, behavior that only manifests after the administrator has
> > +explicitly enabled it (loading a module, setting a sysctl, writing to a debugfs
> > +knob, or otherwise using an interface documented as privileged or unsafe); bugs
> > +reachable only through root or CAP_SYS_ADMIN or CAP_NET_ADMIN on a machine the
> > +actor already fully controls, with no further privilege boundary being crossed;
> > +prediction of random numbers that only works in a totally silent environment
> > +(such as IP ID, TCP ports or sequence numbers that can only be guessed in a
> > +lab), issues that appear only in debug, lockdep, KASAN, fault-injection,
> > +CONFIG_NOMMU, or other developer-oriented kernel builds that are not intended
> > +for production use; problems seen only under development simulators, emulators,
> > +or fuzzing harnesses that present hardware or input states which cannot occur
> > +on real systems; bugs that require modified or emulated hardware; missing
> > +hardening or defence-in-depth suggestions with no demonstrable exploit path
> > +(including local ASLR bypass); mounting file systems that would be fixed or
> > +rejected by fsck; and bugs in out-of-tree modules or vendor forks, which should
> > +be reported to the relevant vendor.  Functional and performance regressions,
> > +and disagreements with documented kernel policy (for example, "root can load
> > +modules"), are likewise ordinary bugs or feature requests rather than security
> > +issues, and should be reported via the usual channels.
> 
> This is a great list to start with, but perhaps we should put it in list
> form so that it's easier to read?

In fact that's what I tried first and it was super long with many short
lines, making it possibly worse. But maybe aggregating several short
entries on a line by similarities could work, I can give it a try.

> Also, I can see this turning into a separate document eventually as
> different subsystems should have a chance to weigh in on what they
> consider the threat model to be

My fear if we redirect to other files is that it won't be read again.
However, we could possibly suggest to always look for the subsystem's
specific rules in this subsytem's doc, leaving enough freedom to
maintainers to reject more things.

> (like what the IB subsystem does which I
> don't think you listed above, or the USB subsystem.)

Indeed I didn't list IB (I'm never sure about it, I seem to remember
we simply trust any peer, is that right?), nor did I make specific
mentions for USB which is implicitly covered by "hardware emulation
or modification".

thanks!
Willy

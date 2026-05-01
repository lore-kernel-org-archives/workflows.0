Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2293BF692;
	Fri,  1 May 2026 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643856; cv=none; b=Wt0sD4Se8nsr77xuRX48MTx7/dPhU7vXSWyki1DGXxv6ypF70PP4XFEomKHaQ5gaddmqZx7m+/hAZC07RX/zu7nKI9C2DjDdn68JyYIsVmGdOhBgjqBuvkI8ygNOil5BMnUkMIvAFIDGIvjAsukknqbf6TyLrGi00LrmnC6lD+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643856; c=relaxed/simple;
	bh=keBirguL34ix2kYgYCA4LJsD3nlDCj+F4tuFna/dDeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTWbPNHl8klBOgzSVGDRb5wSUnbXrr/+OzLBthY/3euXCUkulEMS0QcL6/nwh/jWCow3rG8z+XF1Xe0BF3ReMdboclrnzxmuEfvIRgyVyiUUJiFbn9kjrNSgvJj8o15PVu2b0tu/VgHx38X91vEgO4tDh9i9oC4wYcYrmC+9ZOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=twgnkbb7; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="twgnkbb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1777643850; bh=JIGMvkpOMKP7QD2xcwHTrRwg0XVcHc5FGddS7KwHN2k=;
	h=From:Message-ID:From;
	b=twgnkbb7zJtdc0v94+leI4kNnCVwAMmMUKrKdhkZVs3Z3NlY9F23w3vR4WRZq2H0g
	 2v7c1jRlcTwmKLwXQmU7H7zb8UTDyqjyN9vD90Vuc59hxoSf/tUMrMxMrbyRDK1mjA
	 qtK5NOo3FG2U0cLIerRR+ZVZKIAil6bzL6nAQ00E=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id A2BBFC0A7D;
	Fri, 01 May 2026 15:57:30 +0200 (CEST)
Date: Fri, 1 May 2026 15:57:29 +0200
From: Willy Tarreau <w@1wt.eu>
To: Greg KH <greg@kroah.com>
Cc: leon@kernel.org, security@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation: security-bugs: explain what is and is
 not a security bug
Message-ID: <afSxSX8RK0Z4kkOI@1wt.eu>
References: <20260426163914.19449-1-w@1wt.eu>
 <20260426163914.19449-3-w@1wt.eu>
 <2026042753-ozone-jigsaw-4ad5@gregkh>
 <ae-Acm2XJ3sR34Il@1wt.eu>
 <2026042724-bullhorn-bobtail-ae6f@gregkh>
 <ae-LVyDQPVwxesCO@1wt.eu>
 <2026042804-overbook-ripeness-73dd@gregkh>
 <afF2d6RzRf2Flnv7@1wt.eu>
 <2026042945-duress-extenuate-939f@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042945-duress-extenuate-939f@gregkh>

Hi Greg,

On Wed, Apr 29, 2026 at 12:10:51AM -0600, Greg KH wrote:
> On Wed, Apr 29, 2026 at 05:09:43AM +0200, Willy Tarreau wrote:
> > On Tue, Apr 28, 2026 at 03:13:01PM -0600, Greg KH wrote:
> > > > > We can point at other files, as this list is going to get long over
> > > > > time, which is a good thing.
> > > > 
> > > > Sure. I'm just unsure where this could be enumerated, as it's likely
> > > > that there would be just one or two lines max per subsystem for the
> > > > majority of them. Or we could have a totally separate file, "threat
> > > > model", that goes into great lengths detailing all this with sections
> > > > per category or subsystem when they start to grow maybe, and refer only
> > > > to that one from security-bugs ?
> > > 
> > > I think a separate file is good, I know I need to write up what the USB
> > > model is, and it's different from PCI, and different from other
> > > subsystems.  All should probably be documented eventually.
> > 
> > Would you be interested in me trying to initiate a new "threat-model.rst"
> > file that tries to unroll the points mentioned in the list ? I'm concerned
> > that that withuot having many details initially, it could look a bit odd,
> > because the list we currently have would be more suitable for an "other"
> > section.
> 
> Sure, a small file to start with would be good for people to work off
> of and add to.

I'm appending below what I came up with today. It's not a patch, just
a dump of what I've been typing for 3 hours and should go into
process/threat-model.rst I think. If you think it constitutes a good
starting point, then I can make a patch to add it, and update my other
patch to reference it by basically saying "what is excluded from the
kernel threat model in threat-model.rst does not have to be reported
as a security issue".

cheers,
Willy
---

.. _threatmodel:

The Linux Kernel threat model
=============================

There are a lot of assumptions regarding what the kernel protects against and
what it does not protect against. These assumptions tend to cause confusion for
bug reports (security-related ones vs non-security ones), and can complicate
security enforcement when the responsibilities for some boundaries is not clear
between the kernel, distros, administrators and users.

This document tries to clarify the responsibilities of the kernel in this
domain.

The kernel's responsibilities
-----------------------------

The kernel abstracts access to local hardware resources and to remote systems
in a way that allows multiple local users to get a fair share of the available
resources granted to them, and, when the underlying hardware permits, to assign
a level of confidentiality to their communications and to the data they are
processing or storing.

The kernel assumes that the underlying hardware behaves according to its
specifications. This includes the integrity of the CPU's instruction set, the
transparency of the branch prediction unit and the cache units, the consistency
of the Memory Management Unit (MMU), the isolation of DMA-capable peripherals
(e.g., via IOMMU), state transitions in controllers, ranges of values read from
registers, the respect of documented hardware limitations, etc.

When hardware fails to maintain its specified isolation (e.g., CPU bugs,
side-channels, hardware response to unexpected inputs), the kernel will usually
attempt to implement reasonable mitigations. These are best-effort measures
intended to reduce the attack surface or elevate the cost of an attack within
the limits of the hardware's facilities; they do not constitute a
kernel-provided safety guarantee.

Users always perform their activities under the authority of an administrator
who is able to grant or deny various types of permissions that may affect how
users benefit from available resources, or the level of confidentiality of
their activities. Administrators may also delegate all or part of their own
permissions to some users, particularly via capabilities but not only. All this
is performed via configuration (sysctl, file-system permissions etc).

The Linux Kernel applies a certain collection of default settings that match
its threat model. Distros have their own threat model and will come with their
own configuration presets, that the administrator may have to adjust to better
suit their expectations (relax or restrict).

By default, the Linux Kernel guarantees the following protections when running
on common processors featuring privilege levels and memory management units:

- user-based isolation: an unprivileged user may restrict access to their own
  data from other unprivileged users running on the same system. This includes:
  * stored data, via file system permissions
  * in-memory data (pages are not accessible by default to other users)
  * process activity (ptrace is not permitted to other users)
  * inter-process communication (other users may not observe data exchanged via
    UNIX domain sockets or other IPC mechanisms)
  * network communications within the same or with other systems

- capability-based protection:
  * users not having the CAP_SYS_ADMIN capability may not alter the kernel's
    configuration, memory nor state, change other users' view of the file
    system layout, grant any user capabilities they do not have, nor affect the
    system's availability (shutdown, reboot, panic, hang, or making the system
    unresponsive via unbounded resource exhaustion).
  * users not having the CAP_NET_ADMIN capability may not alter the network
    configuration, intercept nor spoof network communications from other
    users nor systems.
  * users not having CAP_SYS_PTRACE may not observe other users' processes
    activities.

When CONFIG_USER_NS is set, the kernel also permits unprivileged users to
create their own user namespace in which they have all capabilities, but with a
number of restrictions (they may not perform actions that have impacts on the
initial user namespace, such as changing time, loading modules or mounting
block devices). Please refer to user_namespaces(7) for more details, the
possibilities of user namespaces are not covered in this document.

The kernel also offers a lot of troubleshooting and debugging facilities, which
can constitute attack vectors when placed in wrong hands. While some of them
are designed to be accessible to regular local users with a low risk (e.g.
kernel logs via /proc/kmsg), some would expose enough information to represent
a risk in most places and the decision to expose them is under the
administrator's responsibility (perf events, traces), and others are not
designed to be accessed by non-privileged users (e.g. debugfs). Access to these
facilities by a user who has been explicitly granted permission by an
administrator does not constitute a security breach.

Bugs that permit to violate the principles above constitute security breaches.
However, bugs that permit one violation only once another one was already
achieved are only weaknesses. The kernel applies a number of self-protection
measures whose purpose is to avoid crossing a security boundary when certain
classes of bugs are found, but a failure of these extra protections do not
constitute a vulnerability alone.

What does not constitute a security bug
--------------------------------------

In the Linux kernel's threat model, the following classes of problems are
**NOT** considered as Linux Kernel security bugs. However, when it is believed
that the kernel could do better, they should be reported, so that they can be
reviewed and fixed where reasonably possible, but they will be handled as any
regular bug:

- configuration:
  
  * outdated kernels and particularly end-of-life branches are out of the scope
    of the kernel's threat model: administrators are responsible for keeping
    their system up to date. For a bug to qualify as a security bug, it must be
    demonstrated that it affects actively maintained versions.

  * build-level: changes to the kernel configuration that are explicitly
    documented as lowering the security level (e.g. CONFIG_NOMMU), or targeted
    at developers only.

  * OS-level: changes to command line parameters, sysctls, filesystem
    permissions, user capabilities, exposure of privileged interfaces, that
    explicitly increase exposure by either offering non-default access to
    unprivileged users, or reduce the kernel's ability to enforce some
    protections or mitigations. Example: write access to procfs or debugfs.

  * issues triggered only when using features intended for development or
    debugging (e.g., lockdep, KASAN, fault-injection): these features are known
    to introduce overhead and potential instability and are not intended for
    production use.

  * loading of explicitly insecure/broken/staging modules, and generally any
    using any subsystem marked as experimental or not intended for production
    use.

  * running out-of-tree modules or unofficial kernel forks; these should be
    reported to the relevant vendor.

- excess of initial privileges:

  * actions performed by a user already possessing the privileges required to
    perform that action or modify that state (e.g. CAP_SYS_ADMIN, CAP_NET_ADMIN,
    CAP_SYS_RAWIO, CAP_SYS_MODULE with no further boundary being crossed).

  * actions performed in user namespace without permitting anything in the
    initial namespace that was not already permitted to the same user there.

  * anything performed by the root user in the initial namespace (e.g. kernel
    oops when writing to a privileged device).

- out of production use:

  This covers theoretical/probabilistic attacks that rely on laboratory
  conditions with zero system noise, or those requiring an unrealistic number
  of attempts (e.g., billions of trials) that would be detected by standard
  system monitoring long before success, such as:

  * prediction of random numbers that only works in a totally silent
    environment (such as IP ID, TCP ports or sequence numbers that can only be
    guessed in a lab).

  * activity observation and information leaks based on probabilistic
    approaches that are prone to measurement noise and not realistically
    reproducible on a production system.

  * issues that can only be triggered by heavy attacks (e.g. brute force) whose
    impact on the system makes it unlikely or impossible to remain undetected
    before they succeed (e.g. consuming all memory before succeeding).
    
  * problems seen only under development simulators, emulators, or combinations
    that do not exist on real systems at the time of reporting (issues
    involving tens of millions of threads, tens of thousands of CPUs,
    unrealistic CPU frequencies, RAM sizes or disk capacities, network speeds.

  * issues whose reproduction requires hardware modification or emulation,
    including fake USB devices that pretend to be another one.

  * as well as issues that can be triggered at a cost that is orders of
    magnitude higher than the expected benefits (e.g. fully functional keyboard
    emulator only to retrieve 7 uninitialized bytes in a structure, or
    brute-force method involving millions of connection attempts to guess a
    port number).

- hardening failures:

  * ability to bypass some of the kernel's hardening measures with no
    demonstrable exploit path (e.g. ASLR bypass, events timing or probing with
    no demonstrable consequence). These are just weaknesses, not
    vulnerabilities.

  * missing argument checks and failure to report certain errors with no
    immediate consequence.

- random information leaks:

  This concerns information leaks of small data parts that happen to be there
  and that cannot be chosen by the attacker, or face access restrictions:

  * structure padding reported by syscalls or other interfaces.

  * identifiers, partial data, non-terminated strings reported in error
    messages.

  * Leaks of kernel memory addresses/pointers do not constitute an immediately
    exploitable vector and are not security bugs, though they must be reported
    and fixed.

- crafted file system images:

  * bugs triggered by mounting a corrupted or maliciously crafted file system
    image are generally not security bugs, as the kernel assumes the underlying
    storage media is under the administrator's control, unless the filesystem
    driver is specifically documented as being hardened against untrusted media.

  * issues that are resolved, mitigated, or detected by running a filesystem
    consistency check (fsck) on the image prior to mounting.
  
- physical access:

  Issues that require physical access to the machine, hardware modification, or
  the use of specialized hardware (e.g., logic analyzers, DMA-attack tools over
  PCI-E/Thunderbolt) are out of scope unless the system is explicitly
  configured with technologies meant to defend against such attacks
  (e.g. IOMMU).

- functional and performance regressions:

  Any issue that can be mitigated by setting proper permissions and limits
  doesn't qualify as a security bug.
---

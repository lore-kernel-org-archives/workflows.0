Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2072E6CAA;
	Wed, 19 Nov 2025 07:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763538240; cv=none; b=ObypwnXFNLwG9EBbJKnkUFpV46Ahxt4ptJQIgEap0eafYeOm1nWesgxdn7Ga7Ta11qaa4pfUu3puP5sPprnzTxTgzNCjnl5zJhW7XhyXldBw46aEqPqvoDFDkIj1CVfeH0mvznDVM/ZF6lCpVO+t5Jk8gP00q3ISOUl4qh71iSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763538240; c=relaxed/simple;
	bh=ciDG10X1fqzgeCrD9c6jTn43Mwk0L9Y3KBjj20IeoZo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G8n0aPc54T/j6p0NOI5FAR2fsYspxL/uJBABDtJtmezncaj7Gwxhm4CpuRMvMKmxxw6cdNU+diQ8c1fd1Q4upxiIQSvwixcaNRFtLj6IPfQdHDk43ZnHr47im7aEbZayiLDhWATqev/MnYSaKCp7oyi1VXNlQWET2cQXL+FjCnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTVcyad5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTVcyad5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0618C113D0;
	Wed, 19 Nov 2025 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763538239;
	bh=ciDG10X1fqzgeCrD9c6jTn43Mwk0L9Y3KBjj20IeoZo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mTVcyad5WnPehajNMzRoNxen+2rDuPMBPL/GTdgrdS5oxDScsT1zyQw7eh/hbXIsS
	 nfCqoGYKX9oahnxyGrKzSKeYM/2JZ39JUyAZ7A6DrXHX02v4/2l/JHbC3Jlq5ex86l
	 AkB7KO6soHz7QB08Jgch/eNBbtEPjqH5nYoekzAYSRE5xtYI7ouHQR1zvXvqJkagxP
	 chGm/bG7s+U/oDxZptvjvfqpr7a9D2Iwwk6UfU8g8wuDyuiLqM1C0TcCEprRYro3hq
	 VPn09OH7zuRcaoSmqdBoC45Wj5/k3c2aW2zMODtrpgjYMZCiLY/BiSzjmxb/9V9Wv5
	 YlK89zr7hbr4w==
Date: Wed, 19 Nov 2025 08:43:53 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, josh@joshtriplett.org,
 kees@kernel.org, konstantin@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 workflows@vger.kernel.org, joe@perches.com, rdunlap@infradead.org
Subject: Re: [PATCH v4] README: restructure with role-based documentation
 and guidelines
Message-ID: <20251119084353.658db390@foz.lan>
In-Reply-To: <20251119023832.1095490-1-sashal@kernel.org>
References: <20251119023832.1095490-1-sashal@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue, 18 Nov 2025 21:38:32 -0500
Sasha Levin <sashal@kernel.org> escreveu:

> Reorganize README to provide targeted documentation paths for different user
> roles including developers, researchers, security experts, maintainers, and AI
> coding assistants. Add quick start section and essential docs links.
> 
> Include proper attribution requirements for AI-assisted contributions using
> Assisted-by tags with agent details and tools used.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>

I liked the new version. Yet, IMO License requires some changes. After
that, feel free to add:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
> 
> Changes since v3:
> 
>  - No AI hype :)
>  - Link to a guide for building the kernel
> 
> 
>  README | 160 +++++++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 149 insertions(+), 11 deletions(-)
> 
> diff --git a/README b/README
> index fd903645e6de0..1fc993d7cf07e 100644
> --- a/README
> +++ b/README
> @@ -1,18 +1,156 @@
>  Linux kernel
>  ============
>  
> -There are several guides for kernel developers and users. These guides can
> -be rendered in a number of formats, like HTML and PDF. Please read
> -Documentation/admin-guide/README.rst first.
> +The Linux kernel is the core of any Linux operating system. It manages hardware,
> +system resources, and provides the fundamental services for all other software.
>  
> -In order to build the documentation, use ``make htmldocs`` or
> -``make pdfdocs``.  The formatted documentation can also be read online at:
> +Quick Start
> +-----------
>  
> -    https://www.kernel.org/doc/html/latest/
> +* Report a bug: See Documentation/admin-guide/reporting-issues.rst

Perhaps you might add a link to Documentation/process/security-bugs.rst
as well, although it is already there at reporting-issues.rst.

> +* Get the latest kernel: https://kernel.org
> +* Build the kernel: See Documentation/admin-guide/quickly-build-trimmed-linux.rst
> +* Join the community: https://lore.kernel.org/
>  
> -There are various text files in the Documentation/ subdirectory,
> -several of them using the reStructuredText markup notation.
> +Essential Documentation
> +-----------------------
>  
> -Please read the Documentation/process/changes.rst file, as it contains the
> -requirements for building and running the kernel, and information about
> -the problems which may result by upgrading your kernel.
> +All users should be familiar with:
> +
> +* Building requirements: Documentation/process/changes.rst
> +* Code of Conduct: Documentation/process/code-of-conduct.rst
> +* License: COPYING (GPLv2)

Hmm... "GPLv2" doesn't fit all, as it is GPL-2.0 WITH Linux-syscall-note,
plus, as stated on COPYING:

	"In addition, other licenses may also apply."

As we don't want to repeat the entire COPYING text here, better
to just point to the file, e.g.

	License: see COPYING

> +
> +Documentation can be built with make htmldocs or viewed online at:
> +https://www.kernel.org/doc/html/latest/
> +
> +
> +Who Are You?
> +============
> +
> +Find your role below:
> +
> +* New Kernel Developer - Getting started with kernel development
> +* Academic Researcher - Studying kernel internals and architecture
> +* Security Expert - Hardening and vulnerability analysis
> +* Backport/Maintenance Engineer - Maintaining stable kernels
> +* System Administrator - Configuring and troubleshooting
> +* Maintainer - Leading subsystems and reviewing patches
> +* Hardware Vendor - Writing drivers for new hardware
> +* Distribution Maintainer - Packaging kernels for distros
> +
> +
> +For Specific Users
> +==================
> +
> +New Kernel Developer
> +--------------------
> +
> +Welcome! Start your kernel development journey here:
> +
> +* Getting Started: Documentation/process/development-process.rst
> +* Your First Patch: Documentation/process/submitting-patches.rst
> +* Coding Style: Documentation/process/coding-style.rst
> +* Build System: Documentation/kbuild/index.rst
> +* Development Tools: Documentation/dev-tools/index.rst
> +* Kernel Hacking Guide: Documentation/kernel-hacking/hacking.rst
> +* Core APIs: Documentation/core-api/index.rst
> +
> +Academic Researcher
> +-------------------
> +
> +Explore the kernel's architecture and internals:
> +
> +* Researcher Guidelines: Documentation/process/researcher-guidelines.rst
> +* Memory Management: Documentation/mm/index.rst
> +* Scheduler: Documentation/scheduler/index.rst
> +* Networking Stack: Documentation/networking/index.rst
> +* Filesystems: Documentation/filesystems/index.rst
> +* RCU (Read-Copy Update): Documentation/RCU/index.rst
> +* Locking Primitives: Documentation/locking/index.rst
> +* Power Management: Documentation/power/index.rst
> +
> +Security Expert
> +---------------
> +
> +Security documentation and hardening guides:
> +
> +* Security Documentation: Documentation/security/index.rst
> +* LSM Development: Documentation/security/lsm-development.rst
> +* Self Protection: Documentation/security/self-protection.rst
> +* Reporting Vulnerabilities: Documentation/process/security-bugs.rst
> +* CVE Procedures: Documentation/process/cve.rst
> +* Embargoed Hardware Issues: Documentation/process/embargoed-hardware-issues.rst
> +* Security Features: Documentation/userspace-api/seccomp_filter.rst
> +
> +Backport/Maintenance Engineer
> +-----------------------------
> +
> +Maintain and stabilize kernel versions:
> +
> +* Stable Kernel Rules: Documentation/process/stable-kernel-rules.rst
> +* Backporting Guide: Documentation/process/backporting.rst
> +* Applying Patches: Documentation/process/applying-patches.rst
> +* Subsystem Profile: Documentation/maintainer/maintainer-entry-profile.rst
> +* Git for Maintainers: Documentation/maintainer/configure-git.rst
> +
> +System Administrator
> +--------------------
> +
> +Configure, tune, and troubleshoot Linux systems:
> +
> +* Admin Guide: Documentation/admin-guide/index.rst
> +* Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
> +* Sysctl Tuning: Documentation/admin-guide/sysctl/index.rst
> +* Tracing/Debugging: Documentation/trace/index.rst
> +* Performance Security: Documentation/admin-guide/perf-security.rst
> +* Hardware Monitoring: Documentation/hwmon/index.rst
> +
> +Maintainer
> +----------
> +
> +Lead kernel subsystems and manage contributions:
> +
> +* Maintainer Handbook: Documentation/maintainer/index.rst
> +* Pull Requests: Documentation/maintainer/pull-requests.rst
> +* Managing Patches: Documentation/maintainer/modifying-patches.rst
> +* Rebasing and Merging: Documentation/maintainer/rebasing-and-merging.rst
> +* Development Process: Documentation/process/maintainer-handbooks.rst
> +* Maintainer Entry Profile: Documentation/maintainer/maintainer-entry-profile.rst
> +* Git Configuration: Documentation/maintainer/configure-git.rst
> +
> +Hardware Vendor
> +---------------
> +
> +Write drivers and support new hardware:
> +
> +* Driver API Guide: Documentation/driver-api/index.rst
> +* Driver Model: Documentation/driver-api/driver-model/driver.rst
> +* Device Drivers: Documentation/driver-api/infrastructure.rst
> +* Bus Types: Documentation/driver-api/driver-model/bus.rst
> +* Device Tree Bindings: Documentation/devicetree/bindings/
> +* Power Management: Documentation/driver-api/pm/index.rst
> +* DMA API: Documentation/core-api/dma-api.rst
> +
> +Distribution Maintainer
> +-----------------------
> +
> +Package and distribute the kernel:
> +
> +* Stable Kernel Rules: Documentation/process/stable-kernel-rules.rst
> +* ABI Documentation: Documentation/ABI/README
> +* Kernel Configuration: Documentation/kbuild/kconfig.rst
> +* Module Signing: Documentation/admin-guide/module-signing.rst
> +* Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
> +* Tainted Kernels: Documentation/admin-guide/tainted-kernels.rst
> +
> +
> +
> +Communication and Support
> +=========================
> +
> +* Mailing Lists: https://lore.kernel.org/
> +* IRC: #kernelnewbies on irc.oftc.net
> +* Bugzilla: https://bugzilla.kernel.org/
> +* MAINTAINERS file: Lists subsystem maintainers and mailing lists
> +* Email Clients: Documentation/process/email-clients.rst



Thanks,
Mauro

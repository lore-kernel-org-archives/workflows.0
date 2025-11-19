Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95AD1F4606;
	Wed, 19 Nov 2025 02:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763519917; cv=none; b=HDlfIY/OUfKuF3YUKGWnHxEr9H4uV4P6rRzAkEmGILdIbaEi0dMc7U0H74TJwhnNHNWkOsCia1KVxAnQ3ssINnQ59dsy2NftY/HwGaIpnHy40xSe3WrBxymLfK8pVcYyYpbMO3ZQjfiLKNnyd1O8r6ySQNm5ytRY266LcoOdXAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763519917; c=relaxed/simple;
	bh=XCX3Q9zC51VoMvI1pfPjlaJk6qlMgj04AopLoFlHXOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JQj1tic3IhiUwtdmYEFz78rdACdyfcR0q79/VPd2mJBtoD0icTbVra4rxbNtYVweblOu3DE5Y4zr2sbNeb09/HdIcAXDEdgBa95xSTLRXTMtJmk4NLP0diLNKxsADI4AVJiqoTQ130VZudprA0/ajs5B3okvHRZgMHMWzoZk+qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWKpwD5g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWKpwD5g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D53C16AAE;
	Wed, 19 Nov 2025 02:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763519917;
	bh=XCX3Q9zC51VoMvI1pfPjlaJk6qlMgj04AopLoFlHXOo=;
	h=From:To:Cc:Subject:Date:From;
	b=dWKpwD5gIDtCEiF/FHsEc1D0lMW3p1SH2OJ1lZE7ucLnnT/PoZWknq7tW9v8olEJJ
	 JscymaefiQgiJg3UM2i69TdxE4bF6aEDY/0igCMvu/WY3eB6u3tgIxJ2gYNeLtjO01
	 bMjnkHCXvQDdlBlJch40m42JbDyYElAEjrQXzKtyxIdjbVsUVkybMtD4J3N6BR/wKf
	 QJOfFqO7H6qlMoyozikIrOuxUfmSfXaqPR7IzzHn11t+51P4Ihe5GvDvd0XZcHlouQ
	 Ct9ViFUKBWcmbCOG6b1rHwvaSLn8zP01KwaXaDpcJ2yFqluB8HMFedTZqwWXq4lEvj
	 Zn4bocvVPMNpA==
From: Sasha Levin <sashal@kernel.org>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org
Cc: josh@joshtriplett.org,
	kees@kernel.org,
	konstantin@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	workflows@vger.kernel.org,
	joe@perches.com,
	rdunlap@infradead.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v4] README: restructure with role-based documentation and guidelines
Date: Tue, 18 Nov 2025 21:38:32 -0500
Message-ID: <20251119023832.1095490-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorganize README to provide targeted documentation paths for different user
roles including developers, researchers, security experts, maintainers, and AI
coding assistants. Add quick start section and essential docs links.

Include proper attribution requirements for AI-assisted contributions using
Assisted-by tags with agent details and tools used.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Changes since v3:

 - No AI hype :)
 - Link to a guide for building the kernel


 README | 160 +++++++++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 149 insertions(+), 11 deletions(-)

diff --git a/README b/README
index fd903645e6de0..1fc993d7cf07e 100644
--- a/README
+++ b/README
@@ -1,18 +1,156 @@
 Linux kernel
 ============
 
-There are several guides for kernel developers and users. These guides can
-be rendered in a number of formats, like HTML and PDF. Please read
-Documentation/admin-guide/README.rst first.
+The Linux kernel is the core of any Linux operating system. It manages hardware,
+system resources, and provides the fundamental services for all other software.
 
-In order to build the documentation, use ``make htmldocs`` or
-``make pdfdocs``.  The formatted documentation can also be read online at:
+Quick Start
+-----------
 
-    https://www.kernel.org/doc/html/latest/
+* Report a bug: See Documentation/admin-guide/reporting-issues.rst
+* Get the latest kernel: https://kernel.org
+* Build the kernel: See Documentation/admin-guide/quickly-build-trimmed-linux.rst
+* Join the community: https://lore.kernel.org/
 
-There are various text files in the Documentation/ subdirectory,
-several of them using the reStructuredText markup notation.
+Essential Documentation
+-----------------------
 
-Please read the Documentation/process/changes.rst file, as it contains the
-requirements for building and running the kernel, and information about
-the problems which may result by upgrading your kernel.
+All users should be familiar with:
+
+* Building requirements: Documentation/process/changes.rst
+* Code of Conduct: Documentation/process/code-of-conduct.rst
+* License: COPYING (GPLv2)
+
+Documentation can be built with make htmldocs or viewed online at:
+https://www.kernel.org/doc/html/latest/
+
+
+Who Are You?
+============
+
+Find your role below:
+
+* New Kernel Developer - Getting started with kernel development
+* Academic Researcher - Studying kernel internals and architecture
+* Security Expert - Hardening and vulnerability analysis
+* Backport/Maintenance Engineer - Maintaining stable kernels
+* System Administrator - Configuring and troubleshooting
+* Maintainer - Leading subsystems and reviewing patches
+* Hardware Vendor - Writing drivers for new hardware
+* Distribution Maintainer - Packaging kernels for distros
+
+
+For Specific Users
+==================
+
+New Kernel Developer
+--------------------
+
+Welcome! Start your kernel development journey here:
+
+* Getting Started: Documentation/process/development-process.rst
+* Your First Patch: Documentation/process/submitting-patches.rst
+* Coding Style: Documentation/process/coding-style.rst
+* Build System: Documentation/kbuild/index.rst
+* Development Tools: Documentation/dev-tools/index.rst
+* Kernel Hacking Guide: Documentation/kernel-hacking/hacking.rst
+* Core APIs: Documentation/core-api/index.rst
+
+Academic Researcher
+-------------------
+
+Explore the kernel's architecture and internals:
+
+* Researcher Guidelines: Documentation/process/researcher-guidelines.rst
+* Memory Management: Documentation/mm/index.rst
+* Scheduler: Documentation/scheduler/index.rst
+* Networking Stack: Documentation/networking/index.rst
+* Filesystems: Documentation/filesystems/index.rst
+* RCU (Read-Copy Update): Documentation/RCU/index.rst
+* Locking Primitives: Documentation/locking/index.rst
+* Power Management: Documentation/power/index.rst
+
+Security Expert
+---------------
+
+Security documentation and hardening guides:
+
+* Security Documentation: Documentation/security/index.rst
+* LSM Development: Documentation/security/lsm-development.rst
+* Self Protection: Documentation/security/self-protection.rst
+* Reporting Vulnerabilities: Documentation/process/security-bugs.rst
+* CVE Procedures: Documentation/process/cve.rst
+* Embargoed Hardware Issues: Documentation/process/embargoed-hardware-issues.rst
+* Security Features: Documentation/userspace-api/seccomp_filter.rst
+
+Backport/Maintenance Engineer
+-----------------------------
+
+Maintain and stabilize kernel versions:
+
+* Stable Kernel Rules: Documentation/process/stable-kernel-rules.rst
+* Backporting Guide: Documentation/process/backporting.rst
+* Applying Patches: Documentation/process/applying-patches.rst
+* Subsystem Profile: Documentation/maintainer/maintainer-entry-profile.rst
+* Git for Maintainers: Documentation/maintainer/configure-git.rst
+
+System Administrator
+--------------------
+
+Configure, tune, and troubleshoot Linux systems:
+
+* Admin Guide: Documentation/admin-guide/index.rst
+* Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
+* Sysctl Tuning: Documentation/admin-guide/sysctl/index.rst
+* Tracing/Debugging: Documentation/trace/index.rst
+* Performance Security: Documentation/admin-guide/perf-security.rst
+* Hardware Monitoring: Documentation/hwmon/index.rst
+
+Maintainer
+----------
+
+Lead kernel subsystems and manage contributions:
+
+* Maintainer Handbook: Documentation/maintainer/index.rst
+* Pull Requests: Documentation/maintainer/pull-requests.rst
+* Managing Patches: Documentation/maintainer/modifying-patches.rst
+* Rebasing and Merging: Documentation/maintainer/rebasing-and-merging.rst
+* Development Process: Documentation/process/maintainer-handbooks.rst
+* Maintainer Entry Profile: Documentation/maintainer/maintainer-entry-profile.rst
+* Git Configuration: Documentation/maintainer/configure-git.rst
+
+Hardware Vendor
+---------------
+
+Write drivers and support new hardware:
+
+* Driver API Guide: Documentation/driver-api/index.rst
+* Driver Model: Documentation/driver-api/driver-model/driver.rst
+* Device Drivers: Documentation/driver-api/infrastructure.rst
+* Bus Types: Documentation/driver-api/driver-model/bus.rst
+* Device Tree Bindings: Documentation/devicetree/bindings/
+* Power Management: Documentation/driver-api/pm/index.rst
+* DMA API: Documentation/core-api/dma-api.rst
+
+Distribution Maintainer
+-----------------------
+
+Package and distribute the kernel:
+
+* Stable Kernel Rules: Documentation/process/stable-kernel-rules.rst
+* ABI Documentation: Documentation/ABI/README
+* Kernel Configuration: Documentation/kbuild/kconfig.rst
+* Module Signing: Documentation/admin-guide/module-signing.rst
+* Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
+* Tainted Kernels: Documentation/admin-guide/tainted-kernels.rst
+
+
+
+Communication and Support
+=========================
+
+* Mailing Lists: https://lore.kernel.org/
+* IRC: #kernelnewbies on irc.oftc.net
+* Bugzilla: https://bugzilla.kernel.org/
+* MAINTAINERS file: Lists subsystem maintainers and mailing lists
+* Email Clients: Documentation/process/email-clients.rst
-- 
2.51.0


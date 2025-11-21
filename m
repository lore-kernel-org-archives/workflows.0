Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E722630FC3D;
	Fri, 21 Nov 2025 18:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763748018; cv=none; b=V/9Ky4411PbMaWWsWJPlNiExX/+pRbe6Gfb5RY7i7dumVtbBn4kbdRkdGwVnqSTG/bkpEoD/ccNIG4/y8OZeHcTPHhR+ZTvp8QRkH6ppDNgMNr3T52g4SMoXzBjWnwK646YRqxMcF5J9BXppWgGMRrILUtL6t8PluUI1K0wy4PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763748018; c=relaxed/simple;
	bh=GdauC9OFpCx6tvfs4DZKSskH9oCjExl0y2tmgGnRvng=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FaA0/G8g0+0IxNunyYvV322Hat9tIRkwtpE6PmonUKnDnt8b2DNi0iYM4MnwMkzVuMHo1E2yR2MZgJ4O5W1+PJY8cV8eRf4hYb3rcZjKijnFmfWbFEDvUf7IJ9s9vAFytei001l4SrpJyUwffOwSyfY3iBQ60t+b88vHeygN/XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a+5wFXGO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a+5wFXGO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AE5C116C6;
	Fri, 21 Nov 2025 18:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763748016;
	bh=GdauC9OFpCx6tvfs4DZKSskH9oCjExl0y2tmgGnRvng=;
	h=From:To:Cc:Subject:Date:From;
	b=a+5wFXGOyK7v3rJVuHx6SE1DGtmlmMPfEuvLaEtyKl4WN4qu7rcPZ6iiMrYQCDs32
	 m/nkvw5wdXIAEhx+Hqvywq365ke5NT6qivxVhtAdNrh7D95jD7pSHPCCJ+Tmc6vuE+
	 Z805DLQ+SgPntcTX5xA3NsqriMh3v8bPalL02zQb8xdMtyT7Y2tvAMse+XYKw8OOUb
	 4YbtFOo0PiKCVCrcW/9eEY8/F0110pAzRBgXflhpWSUvKpy+MBApoFBGM4O24EbIE5
	 Imt86qN5uCmTlZSkPAH5h2Z2cDIjcudzBbHhcG2v64+8hAeJb0FW9jcHRtvRMJ/kWx
	 7NuJAZAzGYo3A==
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
	Sasha Levin <sashal@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v5] README: restructure with role-based documentation and guidelines
Date: Fri, 21 Nov 2025 13:00:09 -0500
Message-ID: <20251121180009.2634393-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorganize README to provide targeted documentation paths for different user
roles including developers, researchers, security experts, and maintainers.

Add quick start section and essential docs links.

Signed-off-by: Sasha Levin <sashal@kernel.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
---

Changes since v4:

 - Remove explicit reference to GPLv2
 - Fix up the commit message to drop AI blurb

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
+* License: See COPYING
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


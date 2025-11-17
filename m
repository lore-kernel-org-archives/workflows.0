Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629282D7DC7;
	Mon, 17 Nov 2025 21:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763415488; cv=none; b=mhvrBDLpPB66mt3+HrD/TqtU8Jn+NYiHfAXSvZe8ksffs2ilSchahDWgbr4P0E67W060iuuwezaFI8AQpQr88PFRbv9PS+a41KvZ2bwuFQU994RK1XQXOkKOg19zDVpNPF8kXjew7iDD07bSG7wewO8T3sYH0IiU9qATq+puTcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763415488; c=relaxed/simple;
	bh=FcWe/f4DHlsFSPh0dXKYaR2XG+f7LkWGW945ziAYDpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y45CUhE6MMVx76b1S+D06EFAvpfE9anLq/RRwc/cvFtdhRUHRkIsoC7bK4WiM50Ds0+TAarPpqaYnd66IpMOgYz9tr7NopRMSaUV8tgPKU90RWC7xNZUDXk9Oia4j2coMBJBeKzYAtn0qEtqtUvcBREwHerDZaETxRSEOQJT5SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZSzULxUL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZSzULxUL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04073C113D0;
	Mon, 17 Nov 2025 21:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763415486;
	bh=FcWe/f4DHlsFSPh0dXKYaR2XG+f7LkWGW945ziAYDpE=;
	h=From:To:Cc:Subject:Date:From;
	b=ZSzULxULJyHKD3NxkdEB5QCtNJH8jSDR+eE+oKzYYtmlR4A6J8TCjV6GSOQOhzBwE
	 eDXm1QrP9gLLhgba136T0kL6qX+4/ypek4SCAF7Dvt94dRVoaqFjPRVrFheV1zzzgx
	 z86Qb58aOM6yNxtP9CdZXS8RxKQhB/KfV9CrNgbi5Zs2n/+c0e/Cnx4yGn6N/uvjHU
	 Eb864532jV/xDJgu2BDfivdgZDtHMlXWiSARDg2WuaC7PssD+8xqS9eeTTFv+m6H3Q
	 ycYbEFEAXUppyhDr8W/I/d4A67uvtiEEv0xdDh/aH6swGlqk1l3+Ud/hTv0I1laXWx
	 gerS274AgP7ew==
From: Sasha Levin <sashal@kernel.org>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	josh@joshtriplett.org,
	kees@kernel.org,
	konstantin@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	workflows@vger.kernel.org,
	joe@perches.com,
	rdunlap@infradead.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v3] README: restructure with role-based documentation and guidelines
Date: Mon, 17 Nov 2025 16:38:01 -0500
Message-ID: <20251117213801.4077535-1-sashal@kernel.org>
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
Changes in v3:
- Replace "Agentic Coding" terminology with clearer "AI Coding Assistants"
- Add concrete examples of proper Assisted-by tag usage with multiple formats
- Add "Bad examples" section showing anti-patterns to avoid
- Add detailed tool categorization distinguishing specialized vs basic tools
- Add explicit format specification: $AGENT_NAME:$MODEL_VERSION [$TOOL1] ...
- Expand section description to clarify it applies to both AI tools and
  developers using AI tools

 README                | 212 +++++++++++++++++++++++++++++++++++++++---
 scripts/checkpatch.pl |   1 +
 2 files changed, 202 insertions(+), 11 deletions(-)

diff --git a/README b/README
index fd903645e6de0..3c8a39cb86710 100644
--- a/README
+++ b/README
@@ -1,18 +1,208 @@
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
+* Build the kernel: make defconfig && make -j$(nproc)
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
+* AI Coding Assistants - AI assistants working with kernel code
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
+AI Coding Assistants
+--------------------
+
+Guidelines for AI assistants and developers using AI tools when working
+with kernel code:
+
+* How to Do Kernel Development: Documentation/process/howto.rst
+* Coding Style: Documentation/process/coding-style.rst
+* Submitting Patches: Documentation/process/submitting-patches.rst
+* Submit Checklist: Documentation/process/submit-checklist.rst
+* Programming Language: Documentation/process/programming-language.rst
+
+Critical Requirements:
+
+* License: Use proper SPDX identifiers per
+  Documentation/process/license-rules.rst; kernel code is generally
+  GPL-2.0-only unless documented exceptions apply (see COPYING)
+* Signed-off-by: Agents MUST NOT add Signed-off-by tags
+  (Only humans can legally certify code submission rights)
+* Attribution: Agents MUST add Assisted-by tag:
+  Format: Assisted-by: $AGENT_NAME:$MODEL_VERSION [$TOOL1] [$TOOL2] ...
+
+Examples of Proper Attribution:
+
+Good examples:
+  Assisted-by: AI-Tool:model-version-1.0 coccinelle
+  Assisted-by: AI-Assistant:v2.5.0
+  Assisted-by: Code-Helper:model-2024-04-09 sparse smatch
+  Assisted-by: ML-Agent:version-2024-11
+
+Bad examples (DO NOT USE):
+  Assisted-by: AI                          # Too vague
+  Assisted-by: AI-Tool coccinelle git      # Don't list basic tools
+  Signed-off-by: AI Assistant <ai@...>     # NEVER - AI cannot sign off
+
+Tool Categories:
+
+Specialized tools (SHOULD list if used):
+  - coccinelle: Semantic patch tool for C code transformations
+  - sparse: Semantic checker for C programs
+  - smatch: Static analysis tool for C
+  - cppcheck: Static analysis for C/C++
+  - clang-tidy: Clang-based linter
+  - Custom analysis scripts you created
+
+Basic tools (DON'T list - assumed to be used):
+  - git: Version control
+  - checkpatch.pl: Kernel style checker
+  - gcc/clang: Compilers
+  - make: Build system
+  - Standard editors (vim, emacs, nano, etc.)
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
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 92669904eecc7..6e92e0f46ae61 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -641,6 +641,7 @@ our $signature_tags = qr{(?xi:
 	Reviewed-by:|
 	Reported-by:|
 	Suggested-by:|
+	Assisted-by:|
 	To:|
 	Cc:
 )};
-- 
2.51.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.9.28.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794438067;
	b=tHg0Trr+vB4n8gEJwFujnGL4Ag7psRAZWZ2/SaZlwaqsAPgtmyu0RRarN1jCv7TMJ5Ct
	 I+dZlUL1F6tqvB/61LvOaLGX368q3AKd2JFgc/2Qrml28NMwS3dhtXtTJAsLMk3XO4KkI
	 N4Mr8On7Lp7oHFO23aP189rIUUxRQt7NxadKNejq1/Nh8mW+166ZhfFnh8QLqAdO2gBZa
	 Y3XgyAJOZWRpiblL7DCDrbybB53Rsn5gxHnGyMmJA2LSD1/8W8wl7CjU0gIxJ7ssebymT
	 cH4Ipvjrn8WcCJUyxAUewjP4YmfJbhDu8BhHZ3fTyfaxrWH4kN2bTvd4WxffANsf9mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WQgY8Su4RmQsevJYQum8Qoq3Gb3AiXFR8qXOsVslQR8=;
	b=HipllokU5mtEYSZe7Xexdd6JKaWPRyeQI886sLsgoLa5bI6IUGceSME95CVSqw9/BGjx
	 sEa3yTLHqCnl067dfdtE5Z5jVNUB/uDNB4CUpjdM49TvKnWsvRrPfcIyvKDjXfpO5dISy
	 XEF1KV2azZVKGE54O06tm2Hq4CiEaXyryTuCR0kmdgiPMiYt2WDD/95xvHVeOjFOFkgfS
	 x7teUky8/3pdTzAhXdLax/gKDCtq4aPhj1kIKoi3Ih72W0uZAbFkAcjVUbRukJ95l6cxg
	 4+BnoycppRS38m0kUpMJP6RxJVVNY7ROYRAeZiNM/4Sa+px0/V7iO5cF1m/NGyjGyAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mit.edu;
	spf=pass smtp.mailfrom=mit.edu;
	dkim=pass header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=YUCLFLRy;
	arc=none smtp.remote-ip=18.9.28.11
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7208160A380D
	for <workflows@vger.kernel.org>; Wed, 11 Nov 2026 23:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7208160A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.a=rsa-sha256 header.s=outgoing header.b=YUCLFLRy
Received: from trampoline.thunk.org (pool-173-48-111-191.bstnma.fios.verizon.net [173.48.111.191])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 6ABMxiGm026985
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1794437992; bh=WQgY8Su4RmQsevJYQum8Qoq3Gb3AiXFR8qXOsVslQR8=;
	h=From:Subject:Date:Message-ID:MIME-Version;
	b=YUCLFLRy0fmyAqnFSu2IGk2VC56xWeNz09JrUvX6AipBfZ3351nlS4reGL6Szn+mH
	 39hruDgf1PYqNDUaX00RnSOa++nzsAGg4CtHTz8e7tmGSucPTfIjwNjgEoyWcIVsZD
	 lxwwZRVe4NwS1vFcDfWgibhRENTCRxVOuCD2JkXm8hbjpD4qmajggMTIkhZOd8h5OE
	 kY1QDGPD2lg5l0y1NWv3U+unIi56xe2+hdd0iuHIHY4HnHVA0UeJtZKNoZhYlk/0Tf
	 GIYpaJErGQ5i3FWqKwZMIMTLml7J1Z18j/ootseYoRlhb/nupzpyoH9lrIabxs9eJ1
	 0punlpWWISQ7Q==
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id C72392E013F; Wed, 11 Nov 2026 17:59:44 -0500 (EST)
From: "Theodore Ts'o" <tytso@mit.edu>
To: workflows@vger.kernel.org, ksummit@lists.linux.dev
Cc: Sasha Levin <sashal@kernel.org>, Bradley Morgan <brads@mainlining.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Leon Romanovsky <leon@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        "Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dan Carpenter <error27@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Julia Lawall <julia.lawall@inria.fr>, SJ Park <sj@kernel.org>,
        stable@vger.kernel.org
Subject: [PATCH v5 3/6] agents: add a skill to determine stable tags
Date: Wed, 11 Nov 2026 17:59:35 -0500
Message-ID: <20261111225940.1573565-4-tytso@mit.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111225940.1573565-1-tytso@mit.edu>
References: <20261111225940.1573565-1-tytso@mit.edu>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sasha Levin <sashal@kernel.org>

Whether a fix needs a stable tag, and which releases it should reach, is
decided by hand and is often missed or left too broad. Add a skill that
sends the agent to stable-kernel-rules.rst for the decision and the tag
format, lists the kinds of changes the stable trees take and leave out
in practice, and adds the checks agents tend to get wrong: finding the
first release that contains each introducing commit, checking that the
fix applies to the oldest affected release, giving every stable tag the
same version, and following the subsystem's stable policy.

If the decision cannot be made, the skill returns no tag. Point the
bug-fix procedure in coding-assistants.rst at the skill.

Signed-off-by: Sasha Levin <sashal@kernel.org>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://patch.msgid.link/20261020161642.3713052-4-sashal@kernel.org
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
---
 Documentation/process/coding-assistants.rst |  6 +-
 agents/skills/stable-tag/SKILL.md           | 72 +++++++++++++++++++++
 2 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 agents/skills/stable-tag/SKILL.md

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index ca1cc255606b..81ee530a8a7f 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -37,6 +37,8 @@ The following skills are available:
 
 * agents/skills/find-fixes/SKILL.md determines the Fixes tag of a bug fix, or
   checks an existing one.
+* agents/skills/stable-tag/SKILL.md decides whether a fix goes to stable and
+  returns its stable tag, or checks an existing one.
 
 Licensing and Legal Requirements
 ================================
@@ -83,8 +85,8 @@ these steps:
    another one. The fix must not add build warnings and must pass the
    checkpatch.pl checks (see submitting-patches.rst).
 6. Commit the working fix with a detailed message describing the problem, the
-   solution and a Fixes tag determined with the find-fixes skill.  Do not
-   add a Signed-off-by tag.
+   solution, a Fixes tag determined with the find-fixes skill, and a stable
+   tag if the stable-tag skill calls for one.  Do not add a Signed-off-by tag.
 7. Identify the maintainers and lists using scripts/get_maintainer.pl.
    Documentation/process/security-bugs.rst shows how to do that.
 8. Indicate what could not be done. If the fix could not be built or tested, or
diff --git a/agents/skills/stable-tag/SKILL.md b/agents/skills/stable-tag/SKILL.md
new file mode 100644
index 000000000000..d87bcc95089d
--- /dev/null
+++ b/agents/skills/stable-tag/SKILL.md
@@ -0,0 +1,72 @@
+---
+# SPDX-License-Identifier: GPL-2.0-only
+name: stable-tag
+description: >-
+  Decide whether a Linux kernel fix should be backported to stable kernels
+  and return verified Cc: stable tag lines. Use when preparing or reviewing
+  bug-fix patches, drafting their commit messages, or checking an existing
+  stable tag.
+---
+
+# Determine a stable tag
+
+Read Documentation/process/stable-kernel-rules.rst. It says which changes go
+to stable and how to write the tag, its prerequisites and its version. Follow
+the rules for skills in Documentation/process/coding-assistants.rst.
+
+Judge a change by what it does, not by how its description labels it: a
+"cleanup" that releases a resource on an error path fixes a leak. In practice,
+the stable trees take:
+
+- Fixes for crashes, oopses, BUG and WARN splats, hangs, lockups, RCU stalls,
+  deadlocks, data corruption and security issues.
+- Fixes for use-after-free, double free, NULL pointer dereferences,
+  out-of-bounds accesses, integer overflows, uninitialized data, reference
+  counting errors, and memory or resource leaks.
+- Fixes for races, including data races.
+- Fixes for incorrect behavior, such as wrong results, wrong hardware
+  programming, or endianness and type errors.
+- Fixes for problems reported by syzbot, other fuzzers, or the KASAN, KMSAN,
+  KCSAN and UBSAN sanitizers.
+- New device IDs and quirks for drivers that exist in the stable trees, device
+  tree fixes, and device tree additions for hardware that existing drivers
+  support.
+- Corrections to documentation that is wrong.
+- Performance fixes that prevent lockups, stalls or hangs.
+- Reverts of commits that are in a released kernel.
+- Fixes for bugs introduced by commits that were backported to stable.
+
+They do not take the following, unless a fix that is taken depends on it:
+
+- New features, new user-visible interfaces or behavior, new drivers, and new
+  module parameters or sysfs attributes.
+- Refactoring, code movement and other preparation patches.
+- Optimizations that do not prevent lockups, stalls or hangs.
+- Cleanups that do not change behavior, such as style, renames and comment
+  changes.
+
+Then work out which releases need the fix:
+
+- Determine the Fixes tags with the find-fixes skill first. A change with no
+  introducing commit, such as a new device ID, a quirk or a build fix, or a
+  bug older than the available history, affects every release that contains
+  the code it changes. Otherwise, if the Fixes tags are unresolved, so is the
+  stable decision.
+- For each Fixes tag, find the first release that contains the commit, not the
+  release it was based on. If no release contains it, check whether the
+  commit was itself backported to stable.
+- Check that everything the fix uses exists in the oldest affected release.
+  If something is missing, list the commit that added it as a prerequisite
+  if it is small and fit for stable, or start the tag at the first release
+  that has it.
+- Give every stable tag in a commit the same version: a tag without a version
+  asks for every stable tree and overrides the versions in the other tags.
+  The stable tooling reads the first version number in a tag comment as the
+  version, so describe what older trees need in the commit message.
+- Follow the stable tag policy in the maintainer profiles, the `P:` entries in
+  MAINTAINERS, for the changed files.
+- Ask the caller whether the fix addresses an unpublished vulnerability, as
+  described in Documentation/process/threat-model.rst.
+
+Return the tag lines with the reasons for them, or the reasons for no tag. If
+the decision cannot be made, return no tag and say what is missing.
-- 
2.53.0


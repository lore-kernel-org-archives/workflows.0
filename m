Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36CD37C11F;
	Thu,  2 Apr 2026 18:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154448; cv=none; b=tVeaKLvhARQPQtkqqS6aZDg0fYtgf7kUb4vdi1LllzsknbIdnfwHM0nwkQl30clQRzqmb2pmic3m4Jo2hVsRF3ugN74NKGqp+djAcjdxe9M8SD/bsXUYTnvXkFoP3QYkFp2aBMbQb5HF2FoQraIkQBR89NGFIlSvMl/Ag0BzgyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154448; c=relaxed/simple;
	bh=8OOk82V0N++hkD98x0kVKDdWXqr+lMIAOwiduXNmbhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=roBxo8BpW2T6elvOpEbJiPXlQZT01GFhvNQTMucUlJio40KBaFI026QAd53KDCWBw3FQG5VnZvZsD34da4LLWAf1l9OaQTkmUL7RVM6RaJler9pT0lKEt9zJG+TS9/Ftw4J3hddMcIzjRaGF4bNPfL56J+YAsHNE+5NqFZ0tJZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=aJeIHI/+; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="aJeIHI/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775154444; bh=wwF337NMARHzCX0oQ+v1FR4T1doyBS98kHGxU5vyykY=;
	h=From:Message-ID:From;
	b=aJeIHI/+Te1xrprCURiDEraC49QmC1EqoThQOmrHpzHC6Roonv6J4zzXTUDxwY7Js
	 3HlxLW6F8iSmmpHe+P81fovnVjBtH9vavfAvfhojro7QPhJy2K2AFYwVx3pXpmF7Xz
	 EzJE4gyXhDSlgEIxKEoC7RAPzeg7s4dZCWT+s0g8=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id E70BAC09AF;
	Thu, 02 Apr 2026 20:27:24 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: edumazet@google.com, Jonathan Corbet <corbet@lwn.net>,
        skhan@linuxfoundation.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>
Subject: [PATCH 3/3] Documentation: clarify the mandatory and desirable info for security reports
Date: Thu,  2 Apr 2026 20:26:55 +0200
Message-ID: <20260402182655.8636-4-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260402182655.8636-1-w@1wt.eu>
References: <20260402182655.8636-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A significant part of the effort of the security team consists in begging
reporters for patch proposals, or asking them to provide them in regular
format, and most of the time they're willing to provide this, they just
didn't know that it would help. So let's add a section detailing the
required and desirable contents in a security report to help reporters
write more actionable reports which do not require round trips.

Cc: Eric Dumazet <edumazet@google.com>
Cc: Greg KH <greg@kroah.com>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 66 ++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 7 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 6937fa9fba5a..b243ac24eb12 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -7,6 +7,65 @@ Linux kernel developers take security very seriously.  As such, we'd
 like to know when a security bug is found so that it can be fixed and
 disclosed as quickly as possible.
 
+Preparing your report
+---------------------
+
+Like with any bug report, a security bug report requires a lot of analysis work
+from the developers, so the more information you can share about the issue, the
+better.  Please review the procedure outlined in
+'Documentation/admin-guide/reporting-issues.rst' if you are unclear about what
+information is helpful.  The following information are absolutely necessary in
+**any** security bug report:
+
+  * **affected kernel version range**: with no version indication, your report
+    will not be processed.  A significant part of reports are for bugs that
+    have already been fixed, so it is extremely important that vulnerabilities
+    are verified on recent versions (development tree or latest stable
+    version), at least by verifying that the code has not changed since the
+    version where it was detected.
+
+  * **description of the problem**: a detailed description of the problem, with
+    traces showing its manifestation, and why you consider that the observed
+    behavior as a problem in the kernel, is necessary.
+
+  * **reproducer**: developers will need to be able to reproduce the problem to
+    consider a fix as effective.  This includes both a way to trigger the issue
+    and a way to confirm it happens.  A reproducer with low complexity
+    dependencies will be needed (source code, shell script, sequence of
+    instructions, file-system image etc).  Binary-only executables are not
+    accepted.  Working exploits are extremely helpful and will not be released
+    without consent from the reporter, unless they are already public.  By
+    definition if an issue cannot be reproduced, it is not exploitable, thus it
+    is not a security bug.
+
+  * **conditions**: if the bug depends on certain configuration options,
+    sysctls, permissions, timing, code modifications etc, these should be
+    indicated.
+
+In addition, the following information are highly desirable:
+
+  * **suspected location of the bug**: the file names and functions where the
+    bug is suspected to be present are very important, at least to help forward
+    the report to the appropriate maintainers.  When not possible (for example,
+    "system freezes each time I run this command"), the security team will help
+    identify the source of the bug.
+
+  * **a proposed fix**: bug reporters who have analyzed the cause of a bug in
+    the source code almost always have an accurate idea on how to fix it,
+    because they spent a long time studying it and its implications.  Proposing
+    a tested fix will save maintainers a lot of time, even if the fix ends up
+    not being the right one, because it helps understand the bug.  When
+    proposing a tested fix, please always format it in a way that can be
+    immediately merged (see :doc:`regular patch submission
+    <../process/submitting-patches>`).  This will save some back-and-forth
+    exchanges if it is accepted, and you will be credited for finding and
+    fixing this issue.  Note that in this case only a ``Signed-off-by:`` tag is
+    needed, without ``Reported-by:` when the reporter and author are the same.
+
+  * **mitigations**: very often during a bug analysis, some ways of mitigating
+    the issue appear. It is useful to share them, as they can be helpful to
+    keep end users protected during the time it takes them to apply the fix.
+
 Identifying contacts
 --------------------
 
@@ -89,13 +148,6 @@ run additional tests.  Reports where the reporter does not respond promptly
 or cannot effectively discuss their findings may be abandoned if the
 communication does not quickly improve.
 
-As it is with any bug, the more information provided the easier it
-will be to diagnose and fix.  Please review the procedure outlined in
-'Documentation/admin-guide/reporting-issues.rst' if you are unclear about what
-information is helpful.  Any exploit code is very helpful and will not
-be released without consent from the reporter unless it has already been
-made public.
-
 The report must be sent to maintainers, with the security team in ``Cc:``.
 The Linux kernel security team can be contacted by email at
 <security@kernel.org>.  This is a private list of security officers
-- 
2.52.0


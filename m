Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C864D374186;
	Fri,  3 Apr 2026 06:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775197255; cv=none; b=hE9+RVrGPfD6z6J07yxXgTrXRUVmJeQquTTE5k/DF7GuTbisY0ibikfRf5AtWbgo2COQ4NQuc82H8nXdo4RKsiZ2DffnS/vVezis1LqCf5cB2rAYbfydC0eQ83OPxF6uU+zz56vz0Mrn44suJa+8ErIv22AtU1Lbg5oobr6E6+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775197255; c=relaxed/simple;
	bh=n8LECQJ4x4kKLegzjCk6W2ZTgGIHzFc04My1vTX+7DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UMSsdNw64LFf3woEXLOzWkxRy9SgF7GAuulN1KJv3dKXKIF8T9ZTZwDgT54HHeduAve50ZkrI8mvh6UOVM4FNzhY2sKSPKv9cvCr252KRIeWnyHYRzfxaxf/hHxwQcHY5Z/iC1dbQp1WcnD//Ab9n2NosPIeP7Qi5cKqjG7yH3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=sw+dmHnL; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="sw+dmHnL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775197244; bh=6mMBFjBX7EcspuOEDXNCtlc+Rfv6QdGApiTNJWlPIec=;
	h=From:Message-ID:From;
	b=sw+dmHnLixyk6KSbg5AoMHrLV3AfL7HQAsqRXUqBY53dE0VHaeRTVo5xQH6Gwcaew
	 8Wyh+pHqGj6PBljj/xHvzF40yIkgOq45BGqaANtNPD6QTiY39atltqZlsWSAkK3X7L
	 gP0FnlPP2vUByoS8/7A+bYW3HDa9jo16mJAd+pwo=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id F0A14C0AB0;
	Fri, 03 Apr 2026 08:20:43 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: edumazet@google.com, rdunlap@infradead.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH v2 3/3] Documentation: clarify the mandatory and desirable info for security reports
Date: Fri,  3 Apr 2026 08:20:18 +0200
Message-ID: <20260403062018.31080-4-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260403062018.31080-1-w@1wt.eu>
References: <20260403062018.31080-1-w@1wt.eu>
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
index ac97fc78fecd..0b1f6d8e3cbe 100644
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
+Documentation/admin-guide/reporting-issues.rst if you are unclear about what
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
+    immediately merged (see Documentation/process/submitting-patches.rst).
+    This will save some back-and-forth exchanges if it is accepted, and you
+    will be credited for finding and fixing this issue.  Note that in this case
+    only a ``Signed-off-by:`` tag is needed, without ``Reported-by:` when the
+    reporter and author are the same.
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


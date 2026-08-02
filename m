Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C046E2F1FED;
	Sun,  2 Aug 2026 20:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702973; cv=none; b=O2sMbgL8DsZPazqHp8fpbI843V27KidApngzXneAOyiHt+ypT1dhaJ3iRAbmYtGaWsHh2C5SqPIDN8U2jmqlG83ehlyBUTXpkNJnJrRj5TdzvkLdsi0I5tmSn7m/Me8dgr7bAH9NhXo77JMn8ir2wqH/YCmkw7SmDbMyL6WkMMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702973; c=relaxed/simple;
	bh=RZmSeyhINOhhNMmUfcRtVvWUHP4Gdyb71lWg3sMFaxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iuenq5BjuJ5NKyPAXY0eg3v7gWgYry/y4wu1C3GaT1dbN+VIxqMfHAzOqvvppbRGWKUvjsr/Hmthz1T8vKSwe0g1p5U//jRVB2ets6/rRpdhZAzJwiJAoR7Vxqx7WzcPc23UZ9uEIt3TsV3lEEHsbFAtOuBQRFe/30sNGZVoKCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=n7bFtj1s; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="n7bFtj1s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1785702970; bh=F3T2dBngo+BI+KTE+Nrfru/ocuzRAXRpjgzzSULYQpU=;
	h=From:Message-ID:From;
	b=n7bFtj1s66aJTdQpIqChJPQNHR5Ybkt04XIvMlBFd0WFeqdLPAWtFqPkC0YeJPPq5
	 ZZ1JZ+KIJ2odCuekf92vELZRqIO+zHhwfNX27ZiffDa5N2rcEOw4iCnvKfjImMfgl0
	 QedAWWg89Wkz5taHGcjR4ZWsxwuoZ+kVBOUA7UUk=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 1A8BEC0A7D;
	Sun, 02 Aug 2026 22:36:10 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: greg@kroah.com, security@kernel.org, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH 1/5] docs: threat-model: clarify "security bug" vs "vulnerability"
Date: Sun,  2 Aug 2026 22:35:36 +0200
Message-ID: <20260802203540.3453-2-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260802203540.3453-1-w@1wt.eu>
References: <20260802203540.3453-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Throwing an LLM (Opus 5) at a file looking for random bugs after having
read the threat model made it ignore certain bugs it found because "the
threat model said they must be ignored". When asked why, the LLM
rightfully reported the ambiguous wording used at a few places:
"is not a security bug", which can also be read as "is not a bug",
despite the rest of the document. That is particularly true when the
LLM decides to look for info using grep.

This change replaces "security bug" with "vulnerability" at a few places
in order to remove this identified ambiguity, and uses "bugs" instead of
issues in two such sentences to insist that what is described remains a
bug.

Cc: Greg KH <greg@kroah.com>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/threat-model.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
index 9dd8011dde828..7990673072c4d 100644
--- a/Documentation/process/threat-model.rst
+++ b/Documentation/process/threat-model.rst
@@ -98,11 +98,11 @@ measures whose purpose is to avoid crossing a security boundary when certain
 classes of bugs are found, but a failure of these extra protections do not
 constitute a vulnerability alone.
 
-What does not constitute a security bug
----------------------------------------
+What classes of problems are not considered vulnerabilities
+-----------------------------------------------------------
 
 In the Linux kernel's threat model, the following classes of problems are
-**NOT** considered as Linux Kernel security bugs. However, when it is believed
+**NOT** considered Linux Kernel vulnerabilities. However, when it is believed
 that the kernel could do better, they should be reported, so that they can be
 reviewed and fixed where reasonably possible, but they will be handled as any
 regular bug:
@@ -111,8 +111,8 @@ regular bug:
 
   * outdated kernels and particularly end-of-life branches are out of the scope
     of the kernel's threat model: administrators are responsible for keeping
-    their system up to date. For a bug to qualify as a security bug, it must be
-    demonstrated that it affects actively maintained versions.
+    their system up to date. For a bug to qualify as a vulnerability, it must
+    be demonstrated that it affects actively maintained versions.
 
   * build-level: changes to the kernel configuration that are explicitly
     documented as lowering the security level (e.g. ``CONFIG_NOMMU``), or
@@ -178,7 +178,7 @@ regular bug:
     involving tens of millions of threads, tens of thousands of CPUs,
     unrealistic CPU frequencies, RAM sizes or disk capacities, network speeds).
 
-  * issues whose reproduction requires hardware modification or emulation,
+  * bugs whose reproduction requires hardware modification or emulation,
     including fake USB devices that pretend to be another one.
 
   * as well as issues that can be triggered at a cost that is orders of
@@ -208,17 +208,17 @@ regular bug:
     messages.
 
   * Leaks of kernel memory addresses/pointers do not constitute an immediately
-    exploitable vector and are not security bugs, though they must be reported
-    and fixed.
+    exploitable vector and are not vulnerabilities, though they must be
+    reported and fixed.
 
 * **Crafted file system images**:
 
   * bugs triggered by mounting a corrupted or maliciously crafted file system
-    image are generally not security bugs, as the kernel assumes the underlying
+    image are generally not vulnerabilities, as the kernel assumes the underlying
     storage media is under the administrator's control, unless the filesystem
     driver is specifically documented as being hardened against untrusted media.
 
-  * issues that are resolved, mitigated, or detected by running a filesystem
+  * bugs that are resolved, mitigated, or detected by running a filesystem
     consistency check (fsck) on the image prior to mounting.
 
 * **Physical access**:
@@ -232,4 +232,4 @@ regular bug:
 * **Functional and performance regressions**:
 
   Any issue that can be mitigated by setting proper permissions and limits
-  doesn't qualify as a security bug.
+  doesn't qualify as a vulnerability.
-- 
2.52.0


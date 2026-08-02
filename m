Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E780262FD0;
	Sun,  2 Aug 2026 20:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785702965; cv=none; b=lB1UAhQWjxlv7JXow3RiUe8KaP2N9NNAO/9kKZQYuQoQ5za+Z99/8ri6O0FOOkDo2Ks9uKxTCP24rtJwiKK/JM3uAT5nSPuJPzPs13wYtjQNmWjkiLF9TNXU1iYUOwHe71IVRMmrQdpcp8P3eE2TzHIvNcRVXUAc9rZOx0JaEeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785702965; c=relaxed/simple;
	bh=EHX/hYZuxJtFRViQGR1BVK9xjcEFlgU64cDINJfXNUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lJG0VFjHiRzGHqsr5bAQJQbIOSAjzSIyEiD7XNV3ScvCx5gn333zGVSrAFqZcEiCuTTdFMRfoHmTtpsj+4IsoxVu8Isau5Di8a2y+m6rH384ZlgLfqLyk7FDsiKZmxQacAwGzi6V5hWtVz1NG69KJZC41cMgRqyJuw6iuSWO7xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=Hg7Wlf1l; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="Hg7Wlf1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1785702954; bh=vgYXVd1EBLSMzmWdcjabI0y7ehgg63R55qFZhgRRAYg=;
	h=From:Message-ID:From;
	b=Hg7Wlf1lo5DBm0le//6UI5rwu12ftsUgRI9HSUBgWHTPu903pho49tI38TelogJI0
	 gzUi9IjDnvpL9o7o71LzlNU2RFIdI56gxjCJTZRojHKFebXCZcahx5DcTdqC8RcVNl
	 nHGgGmK1b6qBsvRJAqt4o4IPaXN5Uzqv1Bk3qLt0=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 3CF66C0A7D;
	Sun, 02 Aug 2026 22:35:54 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: greg@kroah.com, security@kernel.org, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH 2/5] docs: threat-model: move fake devices out of "non production use"
Date: Sun,  2 Aug 2026 22:35:37 +0200
Message-ID: <20260802203540.3453-3-w@1wt.eu>
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

When originally writing the "fake USB device" entry, it was difficult
to find a suitable section for it and it ended up in "non production
use" but that doesn't fit particularly well. Actually it's very similar
to crafted filesystems, it's a matter of spec violation. Both drivers
and FS are written against a spec, and what the threat model doesn't
cover is out-of-spec use. So let's move the entry there and rename the
crafted FS entry to "Non-conforming devices and media" instead.

Overall it looks more consistent.

The spec was tested agains Qwen3.6-27B-Architect-Polaris2-Fable-B-F451,
Opus-5 and Gemini by reading the threat-model file, then reading a tens
of FS and driver fixes, and they were now all properly classified as
regular bugs, except two that Gemini and Opus rightfully classified as
vulns (Qwen didn't spot the security potential but that's out of our
scope).

Cc: Greg KH <greg@kroah.com>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/threat-model.rst | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/process/threat-model.rst b/Documentation/process/threat-model.rst
index 7990673072c4d..a68be888ce8e5 100644
--- a/Documentation/process/threat-model.rst
+++ b/Documentation/process/threat-model.rst
@@ -178,9 +178,6 @@ regular bug:
     involving tens of millions of threads, tens of thousands of CPUs,
     unrealistic CPU frequencies, RAM sizes or disk capacities, network speeds).
 
-  * bugs whose reproduction requires hardware modification or emulation,
-    including fake USB devices that pretend to be another one.
-
   * as well as issues that can be triggered at a cost that is orders of
     magnitude higher than the expected benefits (e.g. fully functional keyboard
     emulator only to retrieve 7 uninitialized bytes in a structure, or
@@ -211,16 +208,24 @@ regular bug:
     exploitable vector and are not vulnerabilities, though they must be
     reported and fixed.
 
-* **Crafted file system images**:
+* **Non-conforming devices and media**:
 
-  * bugs triggered by mounting a corrupted or maliciously crafted file system
-    image are generally not vulnerabilities, as the kernel assumes the underlying
-    storage media is under the administrator's control, unless the filesystem
-    driver is specifically documented as being hardened against untrusted media.
+  Drivers are implemented against a specification. When a device or a storage
+  medium violates the specification its driver was written against, the
+  resulting misbehaviour is a regular bug to be fixed, not a vulnerability,
+  unless the driver is specifically documented as being hardened against
+  hostile inputs. The following are therefore not considered vulnerabilities:
 
-  * bugs that are resolved, mitigated, or detected by running a filesystem
+  * bugs triggered by mounting a corrupted or maliciously crafted file system
+    image: mounting a block device is a privileged operation (see above), and
+    the administrator is responsible for the media they mount. This includes
+    issues that are resolved, mitigated, or detected by running a filesystem
     consistency check (fsck) on the image prior to mounting.
 
+  * bugs whose reproduction requires hardware modification or emulation,
+    including fake USB devices that pretend to be another one, or devices
+    reporting values outside their documented ranges.
+
 * **Physical access**:
 
   Issues that require physical access to the machine, hardware modification, or
-- 
2.52.0


Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304DD3E1D0B
	for <workflows@vger.kernel.org>; Sat, 18 Jul 2026 16:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784393809; cv=none; b=B1D83Y+cbcjJ6eFEkgRMw0lj1pXVeJTZpQWsE5Uv5vVhahQhUhslzwDxUFUTyTqfo3EC5LRkq1tpfYqsaHdB2FOrh4mGCpnVgpfHukLMdNB8clfMfxfHTNnPYLz7h+xMUTiOW57IsgdtSaHwldVTIJKbXdjxY0Z7IIQZ2LPKME0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784393809; c=relaxed/simple;
	bh=iM88tWt5WKufCgF977oOf/D22IrsHiqklP+4R605YtE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=amXZPviw0Xqz83jmr0+9ar+ST4QwBmU7/XjSfRLyuk1/Buoky2qVg0txLSXJ1cz3dT/Ddc+oLmDmeK5yHql4WWaMHIEoaXm5k719yIlPHj1fOeGANN6jOF322Rv8PxVBX+vdnZFXnSpQU16XZKkjTpdZ0OuZHztKCRW7v6l4dWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=pZReZg89; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="pZReZg89"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784998601; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	Content-Transfer-Encoding:Feedback-Id; bh=IoGdJqX+eyv5BUw7WFgBfg
	bDkCfrrF1dsoSODV4EZYk=; b=pZReZg89VtBLh21/9jT1GnLhgHVh8MPhu2a/D/
	ts7vuxn+ZlR7A8A/2kSawzw87JU7K0z38r19gpUxIPjrmz7gtM/ENsBTArvpjaH6
	quk8dwTn1piLQjl2g6bPYzKgqQBCuksUjnIgGOYupjNIRnQa/3aByOuKZADOOttR
	Iz1gs=
Received: (qmail 2894561 invoked from network); 18 Jul 2026 16:56:40 -0000
Received: from 197.145.178.94  by turbo-smtp.com with SMTP; 18 Jul 2026 16:56:38 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e63be875782e00a-00a-4288be2f
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, cgroups@vger.kernel.org (open list:CONTROL GROUP (CGROUP)), linux-doc@vger.kernel.org (open list:DOCUMENTATION), linux-kernel@vger.kernel.org (open list), workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS), linux-sound@vger.kernel.org (open list:SOUND)
Cc: Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH v3] Documentation: add SPDX license identifiers to RST files
Date: Sat, 18 Jul 2026 17:56:16 +0100
Message-ID: <20260718165618.1923627-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Add SPDX-License-Identifier: GPL-2.0 to RST documentation files
that were missing it. This aligns with kernel documentation
conventions.

Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>
---
 Documentation/admin-guide/cgroup-v2.rst      | 1 +
 Documentation/core-api/housekeeping.rst      | 2 ++
 Documentation/core-api/memory-allocation.rst | 1 +
 Documentation/doc-guide/sphinx.rst           | 1 +
 Documentation/process/5.Posting.rst          | 1 +
 Documentation/process/howto.rst              | 1 +
 Documentation/sound/designs/index.rst        | 2 ++
 7 files changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 481658cfef40..f15a613fed6a 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1,4 +1,5 @@
 .. _cgroup-v2:
+.. SPDX-License-Identifier: GPL-2.0
 
 ================
 Control Group v2
diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
index 71ba5d86f249..f4dc5f9337b1 100644
--- a/Documentation/core-api/housekeeping.rst
+++ b/Documentation/core-api/housekeeping.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ======================================
 Housekeeping
 ======================================
diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index 0f19dd524323..370f5a0c4238 100644
--- a/Documentation/core-api/memory-allocation.rst
+++ b/Documentation/core-api/memory-allocation.rst
@@ -1,4 +1,5 @@
 .. _memory_allocation:
+.. SPDX-License-Identifier: GPL-2.0
 
 =======================
 Memory Allocation Guide
diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide/sphinx.rst
index 51c370260f3b..74a3425e81c9 100644
--- a/Documentation/doc-guide/sphinx.rst
+++ b/Documentation/doc-guide/sphinx.rst
@@ -1,4 +1,5 @@
 .. _sphinxdoc:
+.. SPDX-License-Identifier: GPL-2.0
 
 =====================================
 Using Sphinx for kernel documentation
diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
index 07d7dbed13ec..510abeea8977 100644
--- a/Documentation/process/5.Posting.rst
+++ b/Documentation/process/5.Posting.rst
@@ -1,4 +1,5 @@
 .. _development_posting:
+.. SPDX-License-Identifier: GPL-2.0
 
 Posting patches
 ===============
diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
index 9438e03d6f50..9001024e44cf 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -1,4 +1,5 @@
 .. _process_howto:
+.. SPDX-License-Identifier: GPL-2.0
 
 HOWTO do Linux kernel development
 =================================
diff --git a/Documentation/sound/designs/index.rst b/Documentation/sound/designs/index.rst
index 6b825c5617fc..4ba4038187b5 100644
--- a/Documentation/sound/designs/index.rst
+++ b/Documentation/sound/designs/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 Designs and Implementations
 ===========================
 

base-commit: 1229e2e57a5c2980ccd457b9b53ea0eed5a22ab3
prerequisite-patch-id: c8aee5eb39e3cd6f2b2f28c82163565665288d2a
prerequisite-patch-id: 60ad32e9f0e74902635d7886b97c4225ac8dc5ce
prerequisite-patch-id: 76849a9365b2ef77eae25f4ee42c11f124b1ea0d
prerequisite-patch-id: 7d40674803d67642dd3326a8f4061acbcfb72998
-- 
2.55.0



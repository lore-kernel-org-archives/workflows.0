Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D2B3CE4B2
	for <workflows@vger.kernel.org>; Sat, 18 Jul 2026 14:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784385631; cv=none; b=aE/yRfTMN0RvYrqmjkUKvwMWmq7wHok0C42nxULHSZgEpdr1b5bBroPjEmn+QQkqd3iji4MvtXKI/j61WSSfx9e3Q50ndvOhvk5NRtZ2k44m2xH6c2LCFPtrml5DzNNB1VHn3OB+zT0qom/c5PBCa4Pl0xZ2PqDM3infbPjZ944=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784385631; c=relaxed/simple;
	bh=TqP0TFJQUlLEnc53mcEJzxksDYYarkOPW6cMJpOwh2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FOTcq70H3tNR0NeHN+Caxk8RrX+8dr7G8J8x2nIb3C+uhJPRNIGdaAqHEjOQ+xXz+0jLN94TUCcVtp701E+0Z0ruIrg4KHUYcy0OAYbDtvWhXHTj5xkOyHFPU3ZhanF8OsWIVdB3b1zameBo1kAm/8WUG3KYnsK1UoxSxK0L600=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=uEec2Mxj; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="uEec2Mxj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784990426; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	Content-Transfer-Encoding:Feedback-Id; bh=y5RolVEjohR8iEYsN2yIrD
	zUxPhtuWkOz+4WmCgUedM=; b=uEec2Mxjo/MwVgA9v3iaVyF3WKnCOYLkZdKABn
	kzYfpBGiu/G/62YwvBJ0katoizr9rFHZYjtLOCZXK+GrpLPPyWo309ph7D3OCJZ6
	N0ecdO3ImYIJk8Hog9jqM4HA84DVA+B+qJIYEkk25mxcQTccz/n/51vyISw474kt
	ePqqE=
Received: (qmail 1927146 invoked from network); 18 Jul 2026 14:40:24 -0000
Received: from 105.76.9.106  by turbo-smtp.com with SMTP; 18 Jul 2026 14:40:23 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e639f575f42e006-006-4288be2f
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-doc@vger.kernel.org (open list:DOCUMENTATION), linux-kernel@vger.kernel.org (open list), workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS), linux-sound@vger.kernel.org (open list:SOUND)
Cc: Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH 5/5] Documentation: add SPDX license identifiers to RST files
Date: Sat, 18 Jul 2026 15:40:04 +0100
Message-ID: <20260718144005.1880568-1-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Add SPDX-License-Identifier: GPL-2.0 to documentation files that were missing it.
---
 Documentation/core-api/memory-allocation.rst | 1 +
 Documentation/doc-guide/sphinx.rst           | 1 +
 Documentation/process/5.Posting.rst          | 1 +
 Documentation/process/howto.rst              | 1 +
 Documentation/sound/designs/index.rst        | 2 ++
 5 files changed, 6 insertions(+)

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
 
-- 
2.55.0



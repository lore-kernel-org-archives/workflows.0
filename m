Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568F42F0C74;
	Thu, 11 Jun 2026 06:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160224; cv=none; b=MPBxblgUIFOs9icX8khdwEIVtX3TgDqI5xXtti6WGuUFhRUN5jts5YD/EntD5KCQfGushccaqSPAKFje9Rn/dbnGuDJRchVNdNI2i0DKBsWW2HkvkR5JSlLP29IqFXXVey4DfJPxz+4MRArN1hAGFdBVF3XDwyr8qe39p7XLI2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160224; c=relaxed/simple;
	bh=Cxeo3yD8bQ4mghSwFEOqV7gQtN9YyWv36fuIIJbO480=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=apaFhNbZ6imX0TC1bnorrF8KG56ayl2FI7KNQ1+kG/qDqFli3fP5hHzeJhkWuYg3QMdW/cdzVlFcxmqA+4J3DEg+XFW22fK6ISFCLsyOp056oQ/f+mkgJWVvYbV4mQBbDSTqi8bxcnN0QPzk2KC2XdFL8emByWPaq6OGwzaQz+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RkUlCj6m; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fzxd0ba2; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RkUlCj6m";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fzxd0ba2"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gbY576zfPz9tnc;
	Thu, 11 Jun 2026 08:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781160220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KNOwnOoY59EO9KXyS6k+CkrGuIfKkYnDyF0oqjN2CzM=;
	b=RkUlCj6mDCnAJzv0MZvezZZh0SA+0N2j2rXIiQiGjQcbQ6tGBNV4gBPOj3r8PaUTBC9ntY
	7iTdNR7thm8Iryzg5ejcVkW8CVXkO4Gsq9T3k/u76FmASYUnGaMAMalzxFXhz9+rxvEDsk
	5SZVAKCeOFeARDaXJzcTvtnGqh3OPhhi90UxDTWUAt75uy+i1JmdEnQZjObwR+3hqfiEa6
	SKb8lzPCua5gfeu+z2cczTkxH/ctpmzohK3+Hcixs9Iy/r3fWAPLDzGkw2YhyKlbT8xg4t
	sSevTxGb29VPUkaIRi+7EHgI33Xk2YhO+2RweMVtc8+OK3Scm6OHGfiX7roXzg==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781160218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KNOwnOoY59EO9KXyS6k+CkrGuIfKkYnDyF0oqjN2CzM=;
	b=fzxd0ba2URYj9nf9wX0g6kBDOtR3GxytxHYvxydLPtu+rb6gsZeSnnxKEUX/b9pTEbDBLd
	dPyb60uzIuxlhhmmGFW8sgSVnH8PMtklhf3QHh53xvQUIXidAuniQBqcz0n7EoF/kNkXoH
	ijKVLYse5rdURS6JuG1RuPgn5ud9DIdF4qmtVRmHdCZin7waCdCCcona1OHI2TnBzbU5Od
	TPMHjPbPD2H56Apvb8/LSTyAocvc8ywTljO0p1Q51O1zXx7SjCL8InOsjQWiNSbvjeHBkv
	emeuUrbeOcDaBGfZRxc5zQb8dG0FFIL3Vb2Eknbmwo3bLwVTK/XcY6HVFmk6TA==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] Documentation: process: fix brackets
Date: Thu, 11 Jun 2026 08:43:12 +0200
Message-ID: <20260611064311.117023-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 378feb314aa5abd288d
X-MBO-RS-META: ehysenq7k1f4mcbxfnym6dje5hcmcs1b

Fix missing ')' and needless ')'

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
This is the first patch of a 'series', but I won't send them together
because I'm still producing the patches and it will take me a couple weeks.
 Documentation/process/deprecated.rst     | 2 +-
 Documentation/process/maintainer-soc.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index ac75b7ecac47..03de71f654c7 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -388,7 +388,7 @@ allocations. For example, these open coded assignments::
 	ptr = kmalloc_array(count, sizeof(*ptr), gfp);
 	ptr = kcalloc(count, sizeof(*ptr), gfp);
 	ptr = kmalloc(struct_size(ptr, flex_member, count), gfp);
-	ptr = kmalloc(sizeof(struct foo, gfp);
+	ptr = kmalloc(sizeof(struct foo), gfp);
 
 become, respectively::
 
diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index a3a90a7d4c68..fa91dfc53783 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -60,7 +60,7 @@ All typical platform related patches should be sent via SoC submaintainers
 shared defconfigs. Note that scripts/get_maintainer.pl might not provide
 correct addresses for the shared defconfig, so ignore its output and manually
 create CC-list based on MAINTAINERS file or use something like
-``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
+``scripts/get_maintainer.pl -f drivers/soc/FOO/``.
 
 Submitting Patches to the Main SoC Maintainers
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.54.0


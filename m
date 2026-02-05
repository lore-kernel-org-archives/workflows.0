Received: from mail97.out.titan.email (mail97.out.titan.email [3.219.11.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2AF6F2F2
	for <workflows@vger.kernel.org>; Thu,  5 Feb 2026 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.219.11.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770293090; cv=none; b=fnyayCx00CnGAM1Pg2GEmgByfbk7yG+AUUOrVOLdHNZT6c+TLoJWRqFJePfFbB3vaW4GXBYaAkik4Ouu0XoQWLQ4fB7fprtRKNjt+HLacgDDTU7q2B/zeowtltQLsLF9dhzSPVLmLxt010uYoUdYgJsWB8CxNo1BHG/x2WxyKX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770293090; c=relaxed/simple;
	bh=SE4dILvK69tYRfMq/TfrBOzQX5+SXx1U+E6L7jbp3EU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h5yrnHvjacB1JXRI7PyUuSSvYuLbgVKdbxLlq1rfTXfMARf4X2fngQ+v+xYw7fB2DxaI9GBzTxQw43OfqfxRPI5ujYMBD3W7ijhmDiecOj7lgi2DSQENoaReMVV0yAj5LhxImOD0/39ocsxOrqU4N7bc0MVWQ34TIXlOo96Wl0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com; spf=pass smtp.mailfrom=amidevlab.com; dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b=uWv+Ke7y; arc=none smtp.client-ip=3.219.11.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b="uWv+Ke7y"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4f6Fzp37kTz9s0K;
	Thu,  5 Feb 2026 11:56:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=cogf2ujjYl07ffjRXTlNouWHXovSlrlR1wEj/H3k8uI=;
	c=relaxed/relaxed; d=amidevlab.com;
	h=from:subject:message-id:to:mime-version:cc:date:from:to:cc:subject:date:message-id:in-reply-to:reply-to:references;
	q=dns/txt; s=titan1; t=1770292566; v=1;
	b=uWv+Ke7yKjz8iKaujj5ALEFIK/1+FUDif4HWVCWBLEI7ye4LHYlDb8Q/9UddB/f0Iwqd3OMs
	tuDAslxpkzPBUQmJhsME2xgriKD5rcaLTBgpdFSxDsr/1LqIXYwplfgCDcYZA0IjzxR1QmXfsVq
	aw+xBYNxcZbZ8UntlRsvAXlg=
Received: from ub26dev (unknown [122.172.85.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp-out.flockmail.com (Postfix) with ESMTPSA id 4f6Fzl0tnQz9rvS;
	Thu,  5 Feb 2026 11:56:02 +0000 (UTC)
Feedback-ID: :amitabh@amidevlab.com:amidevlab.com:flockmailId
From: Amitabh Srivastava <amitabh@amidevlab.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amitabh Srivastava <amitabh@amidevlab.com>
Subject: [PATCH v3] docs: process: maintainer-pgp-guide: update kernel.org docs link
Date: Thu,  5 Feb 2026 17:25:41 +0530
Message-ID: <20260205115554.7795-1-amitabh@amidevlab.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1770292566232371624.13754.2219896963672092193@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=fsImZE4f c=1 sm=1 tr=0 ts=69848556
	a=txo+5pS2dMFdB056rU3bsA==:117 a=txo+5pS2dMFdB056rU3bsA==:17
	a=VwQbUJbxAAAA:8 a=CEWIc4RMnpUA:10 a=4yxl8aT0AAAA:8
	a=4KLjzbiQD8Z_VC4WIWgA:9 a=4a-YG245BeQA:10 a=oCAeEeOuyiZLRzIZmmpZ:22

Update http link to the documentation about how to add a kernel.org UID to
the maintainer's key. Add missing SPDX-License-Identifier to fix a
checkpatch warning.

Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
---
 Documentation/process/maintainer-pgp-guide.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
index b6919bf606c3..1e4d885dc784 100644
--- a/Documentation/process/maintainer-pgp-guide.rst
+++ b/Documentation/process/maintainer-pgp-guide.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. _pgpguide:
 
 ===========================
@@ -864,7 +866,7 @@ don't already have them)::
 If you have a kernel.org account, then you should `add the kernel.org
 UID to your key`_ to make WKD more useful to other kernel developers.
 
-.. _`add the kernel.org UID to your key`: https://korg.wiki.kernel.org/userdoc/mail#adding_a_kernelorg_uid_to_your_pgp_key
+.. _`add the kernel.org UID to your key`: https://korg.docs.kernel.org/mail.html#adding-a-kernel-org-uid-to-your-pgp-key
 
 Web of Trust (WOT) vs. Trust on First Use (TOFU)
 ------------------------------------------------
-- 
2.51.0


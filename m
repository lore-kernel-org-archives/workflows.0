Received: from mail108.out.titan.email (mail108.out.titan.email [44.210.203.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C128535CBD5
	for <workflows@vger.kernel.org>; Tue,  3 Feb 2026 05:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.210.203.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770095982; cv=none; b=DrYmS8S84xq7E5qYzAlsviDZQOBii7XKjK3DCgvrJVjBkSib1ayDQrpGAB587nleXfInzju0VPNZscRTCHVvfW9lfNbPBoP+kEMLMzKL9Zqypt42uI/vLG2azociY4wH7eZ9i14RAJ9IpYCXltsw62LO0zIlPtWkwxGBIhKNm9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770095982; c=relaxed/simple;
	bh=i/DZCI3R6gvlC/UJ+amuLRvPu1aGmflAbOyym12TGPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZS5MmyQx3AgXzTyEYgYniFuMZ6rQ6VItlg8NmvT8G77JoHC3Xt0BriIt2J963BgXR2WyPHGDRxTXgXAE/cW4ZTp7jxUc7OnTMuvl123AVVtBvaQi5+Pf/k31CGCyok8w/gK46EUnpDNTIvrqo4UHkPDXIJEPXsHLaVemFrzQzBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com; spf=pass smtp.mailfrom=amidevlab.com; dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b=u2mm7O+5; arc=none smtp.client-ip=44.210.203.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b="u2mm7O+5"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4f4rsF1x39z9rwm;
	Tue,  3 Feb 2026 05:00:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=JHm+jFZ73wtbrzgwtOTGLgkYsc+uvSXYPWVHvA2IPKQ=;
	c=relaxed/relaxed; d=amidevlab.com;
	h=date:message-id:from:to:subject:mime-version:cc:from:to:cc:subject:date:message-id:in-reply-to:reply-to:references;
	q=dns/txt; s=titan1; t=1770094833; v=1;
	b=u2mm7O+5UOABnGJ1Xvjc+AVl2A3P4zl5iDViSVDWHN55MaIo1uDGfMUk80mbp7sOR2BofrUq
	YnCg3mZ5WfLyXVYf8MWwKC0Fvutf6kc39DbOQNiN18EID495UGM3NZj+YCGsJ2wlRrFQZiH/L8A
	CQ1JDlvkoD6qDUMk3y3w94ZU=
Received: from ub26dev (unknown [122.172.85.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp-out.flockmail.com (Postfix) with ESMTPSA id 4f4rs972JMz9rwL;
	Tue,  3 Feb 2026 05:00:29 +0000 (UTC)
Feedback-ID: :amitabh@amidevlab.com:amidevlab.com:flockmailId
From: Amitabh Srivastava <amitabh@amidevlab.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amitabh Srivastava <amitabh@amidevlab.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH v2] docs: maintainer-pgp-guide.rst: updated kernel.org link
Date: Tue,  3 Feb 2026 10:29:48 +0530
Message-ID: <20260203050020.27792-1-amitabh@amidevlab.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1770094833073631484.13754.3426560428773506812@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=KJWgDEFo c=1 sm=1 tr=0 ts=698180f1
	a=txo+5pS2dMFdB056rU3bsA==:117 a=txo+5pS2dMFdB056rU3bsA==:17
	a=VwQbUJbxAAAA:8 a=CEWIc4RMnpUA:10 a=4yxl8aT0AAAA:8 a=ag1SF4gXAAAA:8
	a=yUgL2rgLLi4JuPxWwBoA:9 a=4a-YG245BeQA:10 a=oCAeEeOuyiZLRzIZmmpZ:22
	a=Yupwre4RP9_Eg_Bd0iYG:22

docs: process: maintainer-pgp-guide.rst: updated the http link for
'add the kernel.org UID to your key'. Added SPDX-License-Identifier
to fix checkpatch.pl warning. Tested kernel using qemu-system-aarch64
with busybox inside a multipass ubuntu VM on macos.

Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>
Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
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


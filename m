Received: from mail108.out.titan.email (mail108.out.titan.email [44.210.203.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3842E0926;
	Mon,  2 Feb 2026 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.210.203.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061099; cv=none; b=mfNKdo518b0dJg9ulCuqDrZcyqJQpcffXBgEVRm+CRd/wMWJG5+3+OUQuX5eRY3SnH6TQsaVoAJRz5BOaQrmGSANuK4aIL2JmKGXHoGwg9qQkWK0YcWsdoSDxmHkAZLAehgGIcXSsy+CZvc2dD8HVHiVmYDFxhdP7JT/yJJc5nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061099; c=relaxed/simple;
	bh=Dv8btka5I2NI46HYkt/rxP/24ZP9VYV8r6TXGBRX/V0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LUfD5zk4uIeiArQ3MzaV9a3woVlkygUalGUciCSi2MkWInw2SNm6UM/Ic3+gUd3/32ItJgLrLsseJX6eehq3681MMzjgJRy9bl9M1I7fIe+QDuxm2gtqbS/8D2jyzKaI4JdSl4yO/8rajWjrYWT3nPd/6hJqTMEFt5j15RwfF1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com; spf=pass smtp.mailfrom=amidevlab.com; dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b=U87qYSX2; arc=none smtp.client-ip=44.210.203.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amidevlab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amidevlab.com header.i=@amidevlab.com header.b="U87qYSX2"
Received: from localhost (localhost [127.0.0.1])
	by smtp-out.flockmail.com (Postfix) with ESMTP id 4f4cNH5fxMz9s10;
	Mon,  2 Feb 2026 19:38:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; bh=lXyXj2SWwx7lfYwC8SQkxeEFfRbUsY+ead7bOx9CJRA=;
	c=relaxed/relaxed; d=amidevlab.com;
	h=subject:cc:mime-version:from:to:date:message-id:from:to:cc:subject:date:message-id:in-reply-to:reply-to:references;
	q=dns/txt; s=titan1; t=1770061087; v=1;
	b=U87qYSX2KyAJ8Q3FUv8k5RYxspYnl8V8EAK9ZXZfKtDPHdiMMxjF0zH094zajvpE1nEN7q5/
	vF3zya2WpZMEmF32DoMECJ04xbyFlBYSeDy1L1A14T2ChLi4IGUJ72oBUzFaUAw6fSeYwL0UVKJ
	cOM967A4GVXqxG+o0aDdQ0KI=
Received: from ub26dev (unknown [122.172.85.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp-out.flockmail.com (Postfix) with ESMTPSA id 4f4cNF0Pmnz9rxX;
	Mon,  2 Feb 2026 19:38:04 +0000 (UTC)
Feedback-ID: :amitabh@amidevlab.com:amidevlab.com:flockmailId
From: Amitabh Srivastava <amitabh@amidevlab.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amitabh Srivastava <amitabh@amidevlab.com>
Subject: [PATCH] docs: maintainer-pgp-guide.rst: updated a kernel.org link
Date: Tue,  3 Feb 2026 01:07:27 +0530
Message-ID: <20260202193755.41863-1-amitabh@amidevlab.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-F-Verdict: SPFVALID
X-Titan-Src-Out: 1770061087643327572.13754.897954706142706125@prod-use1-smtp-out1003.
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.4 cv=PI31+eqC c=1 sm=1 tr=0 ts=6980fd1f
	a=txo+5pS2dMFdB056rU3bsA==:117 a=txo+5pS2dMFdB056rU3bsA==:17
	a=VwQbUJbxAAAA:8 a=CEWIc4RMnpUA:10 a=4yxl8aT0AAAA:8
	a=4KLjzbiQD8Z_VC4WIWgA:9 a=4a-YG245BeQA:10 a=oCAeEeOuyiZLRzIZmmpZ:22

Signed-off-by: Amitabh Srivastava <amitabh@amidevlab.com>

docs: process: maintainer-pgp-guide.rst: updated the http link for
'add the kernel.org UID to your key'. Added SPDX-License-Identifier
to fix checkpatch.pl warning.
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


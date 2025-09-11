Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443BA371E91
	for <workflows@vger.kernel.org>; Thu, 11 Sep 2025 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757607829; cv=none; b=KerDIubXNt6pbQw2yRzsw58FN+Z9zGr6nLAL1ixRpWw5kg0c4TB5MrinCcY29zGBbtGycR85Sjtqz3ZPxBCmsbTyZEs/cSPLm0ZbBoze67lXVKe8GJWqFK65vNpWrBjaTj0HWwbeHVqspOQOKI5WkBYrS7z/pHMLsA7tEbBEPP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757607829; c=relaxed/simple;
	bh=gdRxCV3dbaFjfI2cfHOKBREPk9DDd3LTFs4jZWiRD54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=onzOJpwUKSlDFUnTRyrAxwObUiCBwKzAZx5dtfh3l276OzGiimbiJs7Zjryg+iEh9fWE0nZ2ZQ5AoO0Y0zBY3vS0RWce5kMZ5q092s/8nSDlJCmrmIQen/aCuO9T2aJ0PWVlSwVRoIO76f+GAjocvwTjFewonB4q9kIRsawTHYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VY3POhRl; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VY3POhRl"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77264a94031so688903b3a.2
        for <workflows@vger.kernel.org>; Thu, 11 Sep 2025 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757607826; x=1758212626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ugQgxXVFkF9wG9b5WaSCNOwOilaoH403e0Uwi/B/lqY=;
        b=VY3POhRl4WhKQGA8AJ0dKvOnoo0nMKW4OaVEflC546K+yBqV+g93OKthqxw3uON+Cn
         v+yKQjQYKpYEr3EZTOgL5oI49CMr6pJOYRCyCfBJDMp8KFaOjqg4XjemA0LQEnwy2rhw
         TqwSFD9I3vNbSu9QXMS4nPMb8Zaq1yptL6BrcxFqKXiSyvUMWVyzu0Af8qlLaPRiXzIv
         B2eqghpFJopQUT45wpaIRbzOPIetKZJOZO00nYXTDS4Ipd8HIS5BJvUIv+UphppXOBEM
         iAyxNdnVqwilwf0tUan/OJm8q2N4qkouhVNt5/18Z6bcEhxQwiIU80rH1rL+/0UJ0bIS
         V5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757607826; x=1758212626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugQgxXVFkF9wG9b5WaSCNOwOilaoH403e0Uwi/B/lqY=;
        b=JTUrLSviHfgxaAhPg+nLQJfXI6kaBEcnB2zPDEfmM/Tpd3QZ4iokBmv3LjT+N8TYXK
         ZUVSDC74u7QImiR3CdcGmZhG5ujj9z+eY6ey46proIexBtAXlsTa2dBk3O9XrTiIDcrg
         GIXcbd4gb58lAM00nAWrne1u+qTaloc3VReAc15pmP4dGXpYUFu/3b4OsmBOFpxfahoi
         tMdW2bdh8uCpTM4+QNskyyHCgHeKxeJWkLj2DLfEh9zm+Vxn92tCIeG02ngAj2LYCRc7
         mZlE9sMgoVpPaEX1fn7Ln6LYHTLd7IrIbOokJpom3Hhm4du8bXH5MdASLLqI4KXe8Ez+
         5afw==
X-Gm-Message-State: AOJu0YxRcEh/aBwCpeSErrACAlrWO+iBmg9c5iT/cohWJBjoRp0+3HUg
	E0n80YTS1fY55DewIht3hn3qCw0iCnf1HpWAymDXxZDZuBgNNIhWyi6A
X-Gm-Gg: ASbGncvKuC3XXVTjHL+baw6gmmdXZHzFOrSJ4wNk9BmvwRIXo9vszXst/X7t2bMak2d
	2PS37BIlOJOToaqImDfTFcFLMgXgfipFUNullK3CkP2T9F3HvGw+6qsBCxbmSBfWkTL0UPzYmd6
	m9fHG09qu4RwbDlU2eFtvEI6lB+1ZqRn7YRiRRfk55qxn55vB9Rr5U9Sh9yRVcrPLI1WdLEBatk
	kKSqU9Q8CJundhsB8K5yFi/Sq+VRwysTX+Wh9h/IemNdr3R4Qv3BbzS1EtzUiJBP60AnB3iwlwb
	lI/VzMus7pERMqqxzuZgvWDBuJFIBJ6udIR8g605uVImlmzBqEm4zJ3/f3QKtjPkhzhaS7CHrvb
	3rSe7BEBxe75XWP28fRd0yvdMtt8+rgnBafP3Mjis/XMeZj0bSLd5+AxABt2CJ49LzGsQ+EFbPx
	P4aP1Lq5bBSRK9Q1CQnN0luXK5/BlLZ3kkhWmQCew=
X-Google-Smtp-Source: AGHT+IEEi/kiOLuEW5zDU33cKWDz/GEJ/YhUOAwUcErjr+0ySOxI5rpKmstBb19ZMw68qtyisktweg==
X-Received: by 2002:a05:6a20:3d0a:b0:24a:a45d:7a26 with SMTP id adf61e73a8af0-25345a4498dmr27933903637.48.1757607826347;
        Thu, 11 Sep 2025 09:23:46 -0700 (PDT)
Received: from yash-Bravo-15-B5DD.local ([14.99.167.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607c471dcsm2567567b3a.96.2025.09.11.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:23:45 -0700 (PDT)
From: Yash Suthar <yashsuthar983@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yash Suthar <yashsuthar983@gmail.com>
Subject: [PATCH] Documentation/process: submitting-patches: fix typo in "were do"
Date: Thu, 11 Sep 2025 21:53:36 +0530
Message-ID: <20250911162336.16261-1-yashsuthar983@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a typo in submitting-patches.rst:
"were do" -> "where do"

Signed-off-by: Yash Suthar <yashsuthar983@gmail.com>
---
 Documentation/process/submitting-patches.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index cede4e7b29af..fcc08eb93897 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -343,7 +343,7 @@ https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
 As is frequently quoted on the mailing list::
 
   A: http://en.wikipedia.org/wiki/Top_post
-  Q: Were do I find info about this thing called top-posting?
+  Q: Where do I find info about this thing called top-posting?
   A: Because it messes up the order in which people normally read text.
   Q: Why is top-posting such a bad thing?
   A: Top-posting.
-- 
2.43.0


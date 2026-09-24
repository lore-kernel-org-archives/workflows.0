Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B226374E7A
	for <workflows@vger.kernel.org>; Thu, 24 Sep 2026 03:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790220938; cv=none; b=UCv5iVtifw9kFR/R1uhBy8qb1vuL/YOGvlX1H5EYELI8kZonZrt27lY6T940kuaU+WDu1p+9nUmufCg1cTrIQ4WIlXidg46sfkFX1JATqiuDe9zYlIkAtaff4xdKF9eigm8b0DIS4X6scpwwMxqkGnVg6sQATajY22Bpxv3K14s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790220938; c=relaxed/simple;
	bh=jZHSDEh4pomPPj3OIXeAbJfJH7enS0na4CjRth76QfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHVmRLMgVpzPVFw3ZrxzS1UIU4jSMu6EzcPSrNzXwRsaiLf6aw3RDfgyNeeTN+MAqaD88nxPZ7sNMjHbxP9+KPUofY1UUYfpzt0dqYOY/KOTpiJltlMlIDIhYkYokha6OMCvaHrzshYV1ZbHDAbjsttKN6tSczlf3z4Fl8hvGUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtdOGXFH; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtdOGXFH"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396cccbba92so1202083a91.0
        for <workflows@vger.kernel.org>; Wed, 23 Sep 2026 20:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790220936; x=1790825736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3/VJqOwQaoke0L+Lcb1yhy6DiyT8sFQFdjYIeTLVRI=;
        b=PtdOGXFHNIp8f+O7G1boALtTarLMmOiSlWUfx+Vq0qPd8rFJ6qQfEWAOYOCQ6T/PtA
         MPxfu3pEz0d02NyiDYknlLw3e53xqn8sHryk4S7cLhG/Z9MNQz27bX4gCE5OCHLy/7LF
         CWKUFxeXJmxPcc//J8XN5pLuR+Fitls1NVcpbswmy5pOtvw5o4ZUgZe+InCZNg7v/h7C
         GL6uPL2We9ei8YmW4LvrsS/5dYsCdEma0uSxFDDLj8jTIWryVdwxl1vDSrrzBQtRzofl
         Y0cVusmv5tHwfmLAN0gvGyKNDEZAjkez0/JEssjhYUDHUfuj97Ufk370vLZr3gciyqWq
         y/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790220936; x=1790825736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M3/VJqOwQaoke0L+Lcb1yhy6DiyT8sFQFdjYIeTLVRI=;
        b=tZ291IOVkx7cFMFuFDlMm/6ovBBrwQ2XEgMPDaauQzoyNS9QV2Ux74mDv5xWkmvnih
         /Lwllhkp5LpjwTfSplSWocIq5d3huvyNAMUaN55iaFe8UTK0YmQpmpu5Tl4sASukCJab
         1k7vVhrvVxBCwAQ8jp/rulM3QNvDLJ2MMQm1g7/e0l2+X4jmvbuTHUiu29CQ0JZShBIH
         TOnsjZzeWlTHkyZp6NIi6YyCUX72H3ayzzG/f//ULyPOHxUGCsrSaxFXutX5M58WYKqW
         xBix0X/3gAPjkUwpH9874+2BVvpVm26NQPr88YmmqAJONVP1AXqixl4kqsKdmDVqrbWb
         c/Jg==
X-Forwarded-Encrypted: i=1; AKwUvBzP1nPUg6+AZZ7uBdXUG9L9bRuEKccjl+2vBGKcmUsU8LqStpgzVUObQyRhPsFriFaowHStfx8dldM=@vger.kernel.org
X-Gm-Message-State: AFuF++nZEtnM7TxO4IwCHk6avUloWrZ6Q/ktGfUSsPdJ0VMWMNValIe0
	M6KBqnLpRkSjD7dbRz5tdSgkNqp2CPf5ExWU9xVHiEFkctxcQYsa3VZy
X-Gm-Gg: AYBFou0KFrsFSStDg07fJkI3Xw5IkN9mYY3RVWERP0Hm2CA33KgWM8dDmriGhPF8QM0
	Hw+6nryQXmp9s+Vdmasp2BVCiadtU9nqbQlOsWYu10mHQzYK9/m0xSN+auDAf80ZFL79vEbis/O
	xNMHV+zi8k1BeVoHC2rXoyd2OAtHKZS4vTkqy7iedG7Po3OmQ4V5H7l+ExyyNBJO1JxZ3lqn3nz
	eJZKHNrvAFOrNLMkYOl3QG64BX8PlpQqKw3koDPfthlCOJ/vINae4mkoTF+DzxaZW5jvJjNrPjw
	C2GF9pwmtf48SKCQ1OgOuH1oyST7X/MCvukYy2JX6IrSbW3uUzFLEnh8UO6zmrdC5LiMS1zm0JP
	QDtKB5OA8DQKYEqdtJI2+avHTucfzxetsqU6c2OviTpPL80whUZCVs+SK88pCjYMKXjS965t7k7
	DhmDOxn9V8GcXrqTUOGmgUZZy0Z0q/Hp2PGtBtutF7SglpBROgwySSFuGygc47CxcVyCRstpsrC
	y4UHegU32c5csJxMh3v3ikLArhgr3/7QNNhQsEFJ1uPSvP3KT2xvmbYc6tjLl4+coyoQcAbMKRe
	n8Khi0U2pDA25wHCWZ/ojeIJqYN+DWWCdqJmW4zxXSVWaRYRo/UusbR8fh8=
X-Received: by 2002:a17:90b:1d46:b0:39e:6c6a:208d with SMTP id 98e67ed59e1d1-3a09896ab28mr995148a91.46.1790220936315;
        Wed, 23 Sep 2026 20:35:36 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663e1dsm2158159a91.7.2026.09.23.20.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:35:35 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Theodore Ts'o <tytso@mit.edu>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] docs: submitting-patches: mention the branch in T: entries
Date: Thu, 24 Sep 2026 11:35:29 +0800
Message-ID: <e592d82c3a9fed3300488fa65380ab055852c984.1790220653.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <64b0be79c535bb9545f9f81a5044146a8726c761.1790220653.git.matthias.goergens@gmail.com>
References: <64b0be79c535bb9545f9f81a5044146a8726c761.1790220653.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A git T: entry in MAINTAINERS may name a branch after the repository
URL, and where it does, that branch rather than the repository's HEAD
is the one to prepare patches against.  Say so where contributors are
sent to the T: entry.

Suggested-by: Theodore Ts'o <tytso@mit.edu>
Link: https://lore.kernel.org/all/arSMwd1bGO1vrif-@mit.edu/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 Documentation/process/submitting-patches.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7ae79452e1b4..2936388dcaee 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -37,8 +37,9 @@ which can be grabbed with::
 Note, however, that you may not want to develop against the mainline tree
 directly.  Most subsystem maintainers run their own trees and want to see
 patches prepared against those trees.  See the **T:** entry for the subsystem
-in the MAINTAINERS file to find that tree, or simply ask the maintainer if
-the tree is not listed there.
+in the MAINTAINERS file to find that tree, and the branch to work against if
+the entry names one, or simply ask the maintainer if the tree is not listed
+there.
 
 .. _describe_changes:
 
-- 
2.55.0


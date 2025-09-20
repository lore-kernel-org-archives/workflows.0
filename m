Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E181A76BB
	for <workflows@vger.kernel.org>; Sat, 20 Sep 2025 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758395868; cv=none; b=UCWOUG2E2g3u5lSsH1eScMRAOEchjBacmq0JpHPVMUfmAYVAohZzuPiRN0OyZnrHHXz3n0kJL5pHwVSR15nVcCjuv7QM6xGK77Sz9cX5ykH5vW0amrvKtKBgHVuQ5CetdpRZ8Et+f/jUjGLLNVMZ59kvDzNKeMUHBAR9pQBmyY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758395868; c=relaxed/simple;
	bh=VXhQ/46RyA4dTSCM/jKNIFCldKvMR/nbIDhjM+NTVTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q4M8hE0gWEDLNuBoMuMmJilYUkZfgnJWnXIv6PRRiLweJw2mGmB34Foz+7EQduIkuaNmm8QgvI8IQjJCT6KDD+Uz6k30wQJ8qDTf17XybhoxJiX0B3SBNCW271aUl4Fhj5U1D4ccD1Q70qiiNdJVOVTtBO2xfDlgfNXhJo3Kdhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIHssG4g; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIHssG4g"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32e715cbad3so3300254a91.3
        for <workflows@vger.kernel.org>; Sat, 20 Sep 2025 12:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758395866; x=1759000666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qv+t2rS9vLu7zOpVhzxfMKjww6cCPuDXCk54kDg9LLY=;
        b=XIHssG4gDqW5QuwXOkHJ+7rIs6QZRvtOfDKm01FyYdb2L9ikh7EGSXw9R0UzHit+fA
         7pJTxhRVF4yDJYWbm+HCjvGpoIq2hQNYOIR0qZNicXN1+xNwtdcwvQ6Ibdq+xhHV3Od9
         9s8zApzqzAimASNW43RIEL2BuTQSIxwxypupp3hzBr7HNqWzOZI5Kb+PLzlMHuFI94iz
         4WgHAonD7MuEwmd0ZeFwN3NP8paKyrgSFp9nb6sv8pdAuKDfEwLP+shyPaAYKY0dh8A9
         HMajREvdyIlzZllCq3jHALMobvse5k7wC48DtsmTVvacrYlyqP7KvgdW+MUm7wqUhb2+
         1DzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758395866; x=1759000666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qv+t2rS9vLu7zOpVhzxfMKjww6cCPuDXCk54kDg9LLY=;
        b=AXooqIJHbtDRnUIpsDaT+lxyn3TGHxsvHtU8AKx4UzI99qZeR3XnHgdeooP4QQBu34
         +tshSAPny348AQU+UrZZnv2yAJT/hzNJj7FO5l0wzAgV3yivUWzwK9fvtYl/qrvjFodS
         Ncv5SaIx26zg29anfWAnbbsBAel/qbCMDnPO9UYY9tGTb42+McmI7nZqrmznA3+t8kKw
         TiZzbmo4khvGbNThboGmSvChiqjzxOnP8lz+jVtzjCbjC9PoNalbuxBLqp+avrAMT7An
         lTZQSF1o++uT1JsmPnYATQa6p2A534u7SsAzhQ2Vfmj5UDjy+lfbSHh0mhf1UUYJQiuN
         hkRg==
X-Gm-Message-State: AOJu0Yz+da03MkXlfY+cOdpJzBw/z/b4DN5uX+nYLxN1GmXBc3XjBKwX
	1q2OIctWhz1UE9Mb69EZsZ+By4oY3aZUWN92T83wSFHIlv7uFYvzea38rurOSJ/8idQ=
X-Gm-Gg: ASbGncuRKvC/59dNQ0tHJUIwpmMvXiVViPuI05U6dynM5do63IuNJxayox95DCZF0+r
	uSMYzpdCLsGZinE6m0ghyMhQYzmKW5tp+d5ejHiTDojm5N3/7QAbESMTgYtqwksAmVRZRiIJVBe
	1RXkROcXE1Jv2Na5Hn5agH1juo3aXD97LvTPCLL5fC0l68+rwJ3983SNkXIRXHL+Ezymk3MLxvK
	XeADIbiLxqPrloIRaTxpQahgqtRrGs+QTe9mTM5rKvorKLe2E61R3IILsp9tXGOcvNrM9Z9RPPe
	JhPw+dy4RSrdrGxPNbKGDvq26tU5la6Tt5BRgvPAWfscJCw1tymKZVSyXbaSF9iE5nm+o85lGCX
	SnOgh2li+KVnMF6j3rfMZ1XpXKxLOxcoL+TRFE/7fSqBNwgdZ+lYiJzHAgsm1RKwCuGhqD0ZqR4
	UMfhjgFIpBzLrGaglsK/hhwtV+0gh+
X-Google-Smtp-Source: AGHT+IEJ7Iamw1ZU0fymOaS1+7kZXHHtOoQORKIvbN+CH9xL1qQlDIAkegTMeAx3Vok154cEG62wTQ==
X-Received: by 2002:a17:90b:4d85:b0:32e:a535:4872 with SMTP id 98e67ed59e1d1-33097fd43c5mr8692434a91.2.1758395865587;
        Sat, 20 Sep 2025 12:17:45 -0700 (PDT)
Received: from yash-Bravo-15-B5DD.local ([14.99.167.142])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33060617ccasm8637158a91.3.2025.09.20.12.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:17:45 -0700 (PDT)
From: Yash Suthar <yashsuthar983@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yash Suthar <yashsuthar983@gmail.com>
Subject: [PATCH v2] Documentation/process: submitting-patches: fix typo in "were do"
Date: Sun, 21 Sep 2025 00:38:56 +0530
Message-ID: <20250920190856.7394-1-yashsuthar983@gmail.com>
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
v2: Resending patch as v1 received no reply. No code changes.

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


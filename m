Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E38629B8EF
	for <workflows@vger.kernel.org>; Wed,  3 Dec 2025 07:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764747847; cv=none; b=hWVGy5ZBQqZMja6a8WEGymGLO105bqVQRsOTibbriUl0d14WjkcCd4ptCt+cT9DZTZegS0sKqCdUcPvSYBkXklFcCbUXb6OaaInILpl7R/eJeCESHR3Y0UrB6AumURzHNMmXP5v9XvJYlMigbKqnOy03PCD4QNdSmM1rmyO/RK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764747847; c=relaxed/simple;
	bh=HFfHaq84lowkvs9fqpKxO4da8+2xGKryV4IxKt186Og=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O+4tmKG8Q3wldM7karqU8oppo6CNraMAOzKnb+Md3QtUaK0hjmPBzRrUGgt50M+U4Vi6yx072q3vBjYRCKdw2cfyHw2tZgVRvgOaAaqgCO7Q71DUoQPzkFf8HJMwnxns92B/q6JYC49lFnsXFaUteDBiWc3B8Sqy7xtDRGW32xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=W+te8IDY; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="W+te8IDY"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b735487129fso923152166b.0
        for <workflows@vger.kernel.org>; Tue, 02 Dec 2025 23:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764747841; x=1765352641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qDg0mAdezWfG6MBoyNeK7eOxDklTJF7sf+3+ikV+2oo=;
        b=W+te8IDY3ox0abiHFwnINvbb9RrejIzozBsRJtI8Cnz/VlnPYRgpLJN0vbCqNAbMa3
         UL4bBQtTOmaFhj/CIJlr6RFM4GoL8guBwOay8O/A6yBjXm3so8sHXpGemrB1Very9Vda
         7L/uoPBjukZFXRRoS4gckFR0M8piQ0BprPSrfrKEL5mXeM29/t/pdquFEzqE7TpanLcS
         YJpedlTvRLm/ut56oaNm6fc2Bi37LJCuo0YSSS0jVrmf1tQUpNpj/VqzOOXEpMZbLVLk
         P6+HvwganKuyNg68+F0zE8K44gQcYrGsSteIRNSbD/Skc5raoctxLuh2ep4fjC0dChnU
         +Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764747841; x=1765352641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDg0mAdezWfG6MBoyNeK7eOxDklTJF7sf+3+ikV+2oo=;
        b=Oh4QIGRWRfiqgyWEAOtyCWESy6KAaI40u9gAPSzWkSsgbF0DgEiu7coNoUqUyO/5+Z
         cKqkpPjp31BHRREd+WoUYaV3q6ZTrt5g2w0h7vancrwVBv7clO4M73zJFloMeW8Z3XdH
         9dleraPf2ImS/QuSCvvxupkA+MXAQBEoZ0CUigqPRRPH/uffYbgaTMfcmJfkN69PZWuQ
         iaf6gY5MRhGKZbVbT/o8Txqq/sMireHBoHiwop3AqQyW/qhBfzXmjXO48KBcoLzRSW9d
         5jvuIq2WJpEt1LRUEfH0sg3BhW/FVTVyhXZRP0QKMsza4pnc343QgWQre/j/eaR14i8d
         I2/A==
X-Forwarded-Encrypted: i=1; AJvYcCUDanA2c/S6f+nJpMNCZO/GGjAZt5auLFJ2QQvnG4oVqmVD8ng1AFf75/RqecdiVv+x7niq1vZBJ5s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv2ZWWuC15PNFZUeYiX889HwgZ1Q1r42Z3JRofJJeOjVV4y3x7
	3BjWkIwnmbjwqSuEAgladQf0sIY69cW1Gb5I7CAaE7ug7tSXuk9KaH0KzTRxO1227Z8=
X-Gm-Gg: ASbGncsbMcIW9vfSuQ/Ljc2jF7621yRwctDcw2F6AgB/CjD0L9yH576hBaZwkDRbFo/
	ZQwaNXtrE2bFd0FFv0Jo6ewnvj6dw1Bkytis1TLE+5aeWhvoud9fwt8irnu6DCyrj2R30W9kDOS
	gbbXdespXZ+dg4oDpGG5XB7MbRAcir/Oqz6UFhk4lbmYOGNaPoZtxBkY2bVBp87IzblTjYOz72P
	BwGSadTrIJ1A+ZlLwYMK4BppEEZtNaTfKY0gtUTjDJmFET4MaYjzxY+rGxVRknibby1fC9Kp5K5
	732aMBH6Z77ZQWncMEQQvBTmYRzvt6OOmc2b49zffKZEtnnIRPA5YrsMOxLyRaqSJGNp9N9RrLV
	aTFpG6A1qD+D6MO9UX3uLxk5YVXeWsX03wQlbycor3SACIbEqZamkjJeRf3lor+ODE4Wbhxp6cw
	l7X8FcW5/8auY4Fx29
X-Google-Smtp-Source: AGHT+IHOJmtnqel4E2MlxX3LOREVainlBOzpQXPj3OZ+vmLxOF/emLRKv2+K2zFqdKqpDzSb4sO3ww==
X-Received: by 2002:a17:907:7291:b0:b73:8e7d:4f91 with SMTP id a640c23a62f3a-b79dc76d5f9mr140365366b.41.1764747841519;
        Tue, 02 Dec 2025 23:44:01 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f5a3a4ebsm1718882466b.62.2025.12.02.23.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 23:44:01 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: Improve wording on requirements for a free Nitrokey
Date: Wed,  3 Dec 2025 08:43:47 +0100
Message-ID: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=HFfHaq84lowkvs9fqpKxO4da8+2xGKryV4IxKt186Og=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpL+o1uhAlXnfW+y+Mcao/pTDkmCr99U5NwCsK0 81skxDhlcmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaS/qNQAKCRCPgPtYfRL+ ThopB/9pfBKnw6yWfIai07WO6fpvoe4uS9DRlLjACWuawhiipHl19s95EKXBE/2DI7dbXB+Fxh1 LzR3V+YRNuKRhigmK26VOzIHOM1UfkSBtFp0dw57UFm+xf+lUn83E64EDmP20TYXU3EMIFPp4kx bgfcbxWp1nuqeL1waAZlsoFG35WDTHLIe1gWaWj8P2yp8xEFu92V1s00qcgbuNX5OVNhKkyyJsk XmQKasKZUXQQyagpaV2ROqOzdvEJIusUtS0LApUgabUc3WL2ctOWdLjDNQXAiduN1XakVrmz94I OOuxwHJpvkdb1ODTmLH4zvq/qYYeMp6QtjlDtP/mQeHIrjGw
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

"listed in MAINTAINERS" is not enough to qualify for the free Nitrokey
Start. You have to be listed in an M: entry. Mention that to reduce
confusion for reviewers who wonder why their application fails.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 Documentation/process/maintainer-pgp-guide.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
index b6919bf606c3..2e4da3de25d4 100644
--- a/Documentation/process/maintainer-pgp-guide.rst
+++ b/Documentation/process/maintainer-pgp-guide.rst
@@ -405,8 +405,8 @@ geographical region, and open/proprietary hardware considerations.
 
 .. note::
 
-    If you are listed in MAINTAINERS or have an account at kernel.org,
-    you `qualify for a free Nitrokey Start`_ courtesy of The Linux
+    If you are listed in an `M:` entry in MAINTAINERS or have an account at
+    kernel.org, you `qualify for a free Nitrokey Start`_ courtesy of The Linux
     Foundation.
 
 .. _`Nitrokey Start`: https://www.nitrokey.com/products/nitrokeys

base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3


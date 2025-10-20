Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01FF1514F7
	for <workflows@vger.kernel.org>; Mon, 20 Oct 2025 14:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760972024; cv=none; b=E+BuPs4+kwscnlRfbCLiXLgyoX4N2sRhTVfFtzT2I1qx0bz7J+sNka7p2q1vpQ90rMZ0+ADybbqm8HSoe4cGByStLIgiZlfUSiYJpLL1j1ohomFLCDPE1UDZaf7goFFVcA322fDxe/87G6QyuGgk1bZseOIBVd+aqwZveY6AASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760972024; c=relaxed/simple;
	bh=Qgmm5n3QgGYHJXMdGtmtk4unsoI55ELPPsP//oF6jlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fj+KNd5wd04UrBYVozhjYKn2/0mpp94npi7sju5jYsgp9Ye21xISMTA+RiYiupsHHUIAv+EQCyrftx9btS0wbz/QbBkkrLaHUSOCir0OiZ8pQKY5AeOgJnoHGKARRU79W/9AUoLQWzccPKn00RKnHOCzy/SBcXBaBslbjYpn+u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyopwRDT; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyopwRDT"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so4010540b3a.1
        for <workflows@vger.kernel.org>; Mon, 20 Oct 2025 07:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760972022; x=1761576822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZ/VR7vR62blRBnvkVTsR0wWUxwVHVWxsZkAw6EQ2kA=;
        b=eyopwRDTzsYqa7D6TT4ydJRu6wVtm+4RTQ/6mh8/r3ny496mCrriAkyk8119gLYOJA
         70h2h44snrnT3BA/yajKrCT3Xytaezl/ZPs5fpif4jJAhJCJ73bvOHwgVlsmB+ByxVyV
         +6lVSlh/xyQPmGM3RDWtIfrIt12txH5hKBSk/+LS0G2EkPuXIlHd7ZM7fx5rQhoOmilV
         JwNq8vPPcQXBiGWhI5kUsO5B9oJNsdyN9xntCqHFoYlIkp3BoN1zVrFvYnQiaEtyN2aB
         XHGUy+/3Mjb4ro9j68+SdJK5ebxBROiJs4FDW2mPuXPRrAH9E9prMjSB3ymCKkJomEOy
         0gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760972022; x=1761576822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZ/VR7vR62blRBnvkVTsR0wWUxwVHVWxsZkAw6EQ2kA=;
        b=k3NcDKU4TVGk531q4uqYUP+bWJQDfDb1+vbfoFmSr5O14Ntru31mlLWd0EojXkmaXz
         epktvr7Dc68ctW6SYF72Auhcii1o5Nh+BMbzuty/Y0leau38zo8uMBAUM9AiQaZXLOFN
         og3VUU2krRdVvHQ+tnxYC6OawzgAG5TUKQ5T36FqYsU1fRFr8BjKiCTR/8v0m7h1j4+e
         Cz2keBXZKXYXQ8Vu6fZvANy6BRVcirkqbASdSKMKRuNQb6yL/s40Ld/nEyp0tUGMai3T
         cb+9FOxPj0ZDd/tKwzEcifAatZ9PUuhDoERxAhmk4SLw82v0KH6qu1efh47tAXhqZ6+I
         kRkw==
X-Forwarded-Encrypted: i=1; AJvYcCUobpeoJjMfhj142lz7bKuCRj39VMqhZTg5asLJ9HNyysgtl8NoNcYuCn81/iBU5yS6AxB58vWUCtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YytrgePR0x7sh8Qf4LS1LPdo9eEDGKGLnltf4cCBGXBqYMMcuQf
	RvByzNOJI8gieBNiCJkCwqB8FK/0cgWNCcbWepBPL3CtHeaQp9lprX9E
X-Gm-Gg: ASbGnctSYSkJRqj7lOo88S4V8/OX9IcpxD67zcZ3nd5SyISXxMhQuadvapn6Ss0MG0s
	E+U9O6m3o6FkbgdJQcxBY4CZbI0wVJluKoKEoTiFln8iOfMaSDefAP3rS+cbI/S8ieYXFEVPdkS
	Eb7u2vWtnay4j84W6QrQs/7kUFDROchFiUyzcqpv/5R5u9zwjJL7lTlyGmjuelyWvg7lVyCXN2P
	17GTNJHKvhndQ0IVq+WiT8WxdjAvghAbIoHglyV35u9LXNFmdw6WJhsx3QAruzrDGSu/JhJ2ZVA
	+gqkNIwZdRWOO+aVuvyGTe1LEtglI+l43PFG0JZtdN4u++K6p841LR4uGnNB84VUWfEX9XfuLGJ
	47W5oUI0SfJ5hP0nE+NnSUDsug40VHcuf3eAJ0Pm8r9dCHyqUhMQUz1u6zy5f+qPxLGWj0l2SQ8
	Wl1oikqErjyq2iz+GoSlvfPcxoX+hT
X-Google-Smtp-Source: AGHT+IGTdtRXRVBqo/etSZIrqHnDE2k5yUz+r6mePyKfylMditsns+sMecwWotZWB5+Cv8bZSvNjyQ==
X-Received: by 2002:a05:6a20:549d:b0:32d:a6c0:15bb with SMTP id adf61e73a8af0-334a7a5fed0mr16479924637.31.1760972022096;
        Mon, 20 Oct 2025 07:53:42 -0700 (PDT)
Received: from clint-Latitude-7390.. ([110.226.183.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f159csm8497919b3a.46.2025.10.20.07.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:53:41 -0700 (PDT)
From: Clint George <clintbgeorge@gmail.com>
To: rdunlap@infradead.org
Cc: clintbgeorge@gmail.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH] docs: ktap: Revert incorrect change
Date: Mon, 20 Oct 2025 20:23:34 +0530
Message-Id: <20251020145334.65356-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ba148c36-8778-425e-8c94-35ebd708fc80@infradead.org>
References: <ba148c36-8778-425e-8c94-35ebd708fc80@infradead.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you  Randy for pointing out. I am really sorry that i missed the
incorrect change while creating the Patch. I have reverted the
incorrect change in this version.

Fix couple of grammar and spelling issues such as:
diagnosic -> diagnostic
Cuurently accepted directives -> The currently accepted directives

This patch aims to correct these issues and enhance the existing
documentation.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 Documentation/dev-tools/ktap.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index a9810bed5..faaad92e6 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -13,7 +13,7 @@ which don't align with the original TAP specification. Thus, a "Kernel TAP"
 This specification describes the generally accepted format of KTAP as it is
 currently used in the kernel.
 
-KTAP test results describe a series of tests (which may be nested: i.e., test
+KTAP test results describe a series of tests (which may be nested: i.e., tests
 can have subtests), each of which can contain both diagnostic data -- e.g., log
 lines -- and a final result. The test structure and results are
 machine-readable, whereas the diagnostic data is unstructured and is there to
@@ -94,7 +94,7 @@ keyword preceding the diagnostic data. In the event that a parser encounters
 a directive it doesn't support, it should fall back to the "ok" / "not ok"
 result.
 
-Currently accepted directives are:
+The currently accepted directives are:
 
 - "SKIP", which indicates a test was skipped (note the result of the test case
   result line can be either "ok" or "not ok" if the SKIP directive is used)
@@ -237,7 +237,7 @@ Major differences between TAP and KTAP
 ==================================================   =========  ===============
 Feature                                              TAP        KTAP
 ==================================================   =========  ===============
-yaml and json in diagnosic message                   ok         not recommended
+yaml and json in diagnostic message                  ok         not recommended
 TODO directive                                       ok         not recognized
 allows an arbitrary number of tests to be nested     no         yes
 "Unknown lines" are in category of "Anything else"   yes        no
-- 
2.34.1


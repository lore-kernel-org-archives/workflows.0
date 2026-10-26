Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978214;
	b=eqORFBKb46eillVSiM/LiawQkeDISTKrLDgUt+HN4Px1kHw3O1jqSZAEZvmrRdgGkvn+
	 L30UL4MPZnZwS6Hid9mO1OU/ZnOEPv6y4hIsQKlrzVDE7QwsRQ2CvTzw9X3DNmThpnSbf
	 j3YwAy7g5Wsp1YuXklQP0R2JunaO8/F+k8wLxvWP/InslVqAkX68i64OI9Ix6MvBgu2fC
	 8gcCqXHwxKdYQ4mTCpFjzTU6/CRRubfU/mHslBOCdgT2rdaie1j1ePaMprpCoL6cVfl64
	 TrZvMCeCrJIoQaWCIyRRcXG0jRBb4opj2sPLakczaZ5vU4O4nB+fIgNQX+kfD/LUQ4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:From:Date:Subject:To:Cc:Message-ID:
	 Content-Type:Content-Transfer-Encoding;
	bh=3XwoGg+mB8JTGKSf2elhh7MQy4y9CDrVr50JHH0II1k=;
	b=JsZheEP6ip9UxgyrCAO/byeWR2EX8W+Fp4Jy9luWC8vJU8T7fWhkA4zsRob59hzErhHI
	 kt0ndy3PZV+45nAaW6U2tiXnO03aXWJDoEH1Dg+0iKX9sDcfkARcXzNulsZbeQmKK3MyU
	 eueYM9XWgSs772ECqGrfNHK0k7M1Sij4YGF2gKIhwVXmsBAB647pnbEv0VG7EcfDO3ibI
	 xSzN34cxu+M5vHvkR39Fx+n1g3joqsdde+uQR2hvxiewdX8AiWb+le5ZGiiAdFtTh3hBj
	 47gTa6FaA0QM3BlUN09B26/R1FvMwhyGD2/e+D/r7APz6JZgl8cHWhWNbGYExM1ZEwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bN4CDDSI;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AFC606A32E
	for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 01:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80AFC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bN4CDDSI
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5351d76e1baso31087911cf.1
        for <workflows@vger.kernel.org>; Sun, 25 Oct 2026 18:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792978213; x=1793583013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3XwoGg+mB8JTGKSf2elhh7MQy4y9CDrVr50JHH0II1k=;
        b=bN4CDDSItCtt/QdxJizZA1Za1opqZMedq/YPSVbx9jVRAv+IQ7BFhAlMW/7NWv7ESx
         FOoNXzrrhQ70rmZRcW0No3Ylb+06pJxeoqOtFVFIorI404RFF6MVzF3J07lZ+JXWLnu0
         1OogcxTj5x5ZvERUql8WIiWWtEvKJpNIRWrukVprl/HOa0/eQaodZXXR4TIWJznoPfGz
         WavttMySLc0Eu8wWcw7mvnRfL0vkXcISSk+dgoaOGTsyaoI5HbC6Hj4RuSz3JG9/T1kI
         gg+c7bDGE/WyczdoMvnqKbAXOTkO88ZjMyMyz77+GcBMs/G4//5VjKd/6u7OZDW5awkn
         5SVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792978213; x=1793583013;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:references:in-reply-to:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3XwoGg+mB8JTGKSf2elhh7MQy4y9CDrVr50JHH0II1k=;
        b=ir22pf6IQ/xmbuerLvL7lFQNCfKzTP1/TgZRtApiwjvPsj03I5RL9RDc++bWQ4cK8O
         OkI1zFy/iE5Ci9mx9FbK7+bRMbVBQOCagbS+1tOt0s/5Rlu/odZnzZHVsVN2yhyfdyDT
         UO1M9l1ekDiQiZC9LI43zqw/reF3Sa2xYz1uXpXImIMXeuL3SpbbrA7H4siVr85f4DPQ
         c+HR2TR/dIpdCCA2d14+RjaOEDmV2ryNXKPbl/ZFq4+YBe62vbOJHSasax0LILB/voOC
         RBkQqoc+XQOYIjaDS54HL/kZUwo+Z/VizJrSPYQPQT7EdH4lys4xEga/lwYhN3fENXDt
         prbg==
X-Forwarded-Encrypted: i=1; AKwUvBxaW2llIWjCaRJ2otWmYC2AuLmK0q62w3OnJt6MegkZvG0HBg4NEPgAlRiYmLRLGrZKRiJkWPWlEWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQ+KpYbu1eE4gg3pbtlGlXE5cNIWmDQOgz0TqyMf+F4ctj4+WR
	NiUOsOqwdV6Vn08c2URidM7kikhr23GjbOR2Jngu+ltkqb9R0fbVGAA=
X-Gm-Gg: AYBFou30zCEidKEi8LJiOPHTa1JGbmn880shyNNupb+GQSDFvuf072RL9IFQrmuUICh
	WGE3hYUoVEfmWeD+3rwJwOShUnrqDFqxYgDTAWkR7Z9KRzG4ldRHnjqJW1uIOJVibomWRqJ+8px
	VZw7zuWcRrX5Q0KuZWS7g+0OQ8B0UJORKCrxcxWJawx1AefBM6G+vXPL6Il6zBamO+K91UuzC4I
	qMjfNwCKDdlmC4Y4G6aEfflggGtQo7ZJQu1UQi/83SHkDJpDRwfmInAcsTm3Kha3YxvKXZ9sbbx
	lzcSm6yIaEVb7KCufdICjva6XWHhCZvlDEMoalYpJBjG2tY1r1QCahKeuJkL1IRtfMKrczYdXYW
	7p9ppk4/kEUpdGhrzd9c/vlMbIDiA2qR/M3pUbfmPhgT/wnQRpocSK1cgSM7mKV1g7TieJDPoJE
	VumY0reYlj8dvhzIlFFYBlX0Ck05K9joB2pSq5BQGbGm0nrW7d8saRnf02gA8Fh0wU6MdTtfbaj
	AdjYO5eVCaanZgFQBxvBDCVsEKQsdllwNc2wnR/b/dbxPd05X5EzjPBJgi0UjKxaTXLCKg/AyVz
	up0FyRbEKFZnxmgf9MKyYTPQOQltDCfwUBA+3nxEeGBDFCpSBoTmLcdFTFkgiwwicLvihB8h67s
	1sI26GU6V2sRTPKj0Sgu5
X-Received: by 2002:ac8:5d8d:0:b0:535:1d5b:a7fa with SMTP id d75a77b69052e-5383ba8566dmr80965731cf.14.1792978213302;
        Sun, 25 Oct 2026 18:30:13 -0700 (PDT)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970a2basm44270051cf.18.2026.10.25.18.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:30:10 -0700 (PDT)
In-Reply-To: 
 <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
References: <179250646543.2190262.8632957027583518623@gmail.com>
 <CAMAsx6cniehFSgKz0+FRbGV=A=TGvogwx87xcqhiZNQGfeFFYQ@mail.gmail.com>
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Mon, 26 Oct 2026 01:30:03 -0000
Subject: [PATCH v2] Documentation: kunit: document --summary and --failed
 options
To: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179297820302.2598507.5712076951623488183@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list

Commit 062a9dd9bad7 ("kunit: tool: Only print the summary") and commit
3c67a2c09b3c ("kunit: tool: print failed tests only") added the --summary
and --failed options to kunit.py, but the matching entries in the
run_wrapper documentation were never added.

Add descriptions for both options next to the other output options, so
the documentation lists the arguments the tool actually accepts.

An LLM-based coding assistant helped draft these entries; I checked them
against kunit.py and kunit_parser.py.

Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
Changes in v2:
- Moved the tool disclosure into the changelog text; the Assisted-by
  trailer is no longer described in Documentation/process.

 Documentation/dev-tools/kunit/run_wrapper.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110a..641ab50a 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -327,6 +327,14 @@ command line arguments:
 - ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--summary``: If set, prints only the summary line for parsed test
+  results, rather than the result of every individual test. Does nothing
+  if ``--raw_output`` is set.
+
+- ``--failed``: If set, prints only the tests that failed or crashed, along
+  with the summary line, once all tests have run. Does nothing if
+  ``--raw_output`` is set.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.34.1



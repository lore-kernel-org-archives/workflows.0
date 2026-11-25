Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581075;
	b=PGQUyhIKPprh2egd5ZWB8UrdPRBzgmpyjf+iK0upELq2Ep2V6yljKSnMM4GPEVpY5E5b
	 86/T0h0dm3WrcnTziUtLPgPPt5YXbSLKudNo4RnKGWJGUL2JYo7h9Mjkclbx9LgL/Ugg7
	 Ovh3gQUDWbYkX+f5Cig5F5iHZgrDvuG2IJXuc8HGp0HUCgkihA7idRR6OdagKV8YWnEzW
	 9ge8qoPC+NTAvuGwr4srNUXWR3ffihXJl9DagcoH7E1t+Jey3UNNzqp/sbdSRdY2TL2XU
	 oDyS0snaEi8jXwHsednE8VQJHrxRhfa3AQNxvVS+Z8UK4DdS7uEEWVMkFQGGuNT9MqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=LqCAbsFv75X8FpT2kuDVemXn9DMtQ2UrANDaKURHbUU=;
	b=wXQ/A2ehJWsU/qoHVYwWuZC8/52TmMykXleRPfwEfJFw5+UdlQ+4WSlAWwAfkj24/sm0
	 60sK5MzP6QUy3pjl8f60u8WB9MRWbpCFxMJSnO0qCWyz1kypqHt+yeRu34hyCOWUW/5xE
	 gw3CMM2y2jLLpAl3ePCmTmd8OcvDT6fA8Y4XqcLCQS31h8IAcs4qz1Tv7n1EtiJkCcud0
	 e/FnJGxGyRXiKGGZ1yuQkI/sBkBa09YCr3wU1AH2PsIItvHqVAdaqeHKI/nuc7fkdfirq
	 JB4jMpsMxkXbOtpIZ+nrpHZe+RkQY1xE8k3gwvxJJbjA489JIMAm9UusDemdWvGps6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9xaBilI;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF68606A321
	for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 04:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BF68606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t9xaBilI
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53644ab1f7bso47633651cf.3
        for <workflows@vger.kernel.org>; Tue, 24 Nov 2026 20:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581073; x=1796185873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqCAbsFv75X8FpT2kuDVemXn9DMtQ2UrANDaKURHbUU=;
        b=t9xaBilIOSfrKNfdyYoYv0fqw8MH2K4V/ls2xdv/XMF2Y7q+0FeBKT08Y8d356eHZx
         ZZrO0XeB7oddmjUFHDeCZuq09o6W4o3F5l679+WsVsjdpvVjrBPpYqTziW7ImtZ350k8
         p1iBOcySHX2sS+BpiR9BlFHzYvx1Xf5ON00IpOEVWKdWm1jVnlRFvOGGzkWOZ7Fji893
         S8y5w1WZGalKSlup2KqBhICVzJi2gliF55C2HldJQMjAtm7KkLZy2sC67sVDx8rhKCws
         c1q3Kwib5FBhJNmqRxDoxocCrWBe2NOGQ4Hdek/jYKrlEBbApxyLcDVCiAAO6dN3AfZl
         nEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581073; x=1796185873;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LqCAbsFv75X8FpT2kuDVemXn9DMtQ2UrANDaKURHbUU=;
        b=X/Pcf3badbteX4vE1gPR2u7dbFHjKX8VGnjV40ADQUWmvKcgArR3+oxcCU/rcoTv6i
         HFlC6CQagdqcOzr9u8mJEkoo8evwAYEuKmptV8LoVBhcIFqASvcG0djpr398HfO/zURW
         y+blTxjMoM5Q6/4h++3/7tpBxEV1Nsbi6/1q9gcS4zNhvJjSUzPJprOV0ISeosqWriHy
         HolmZQadRmtdF45EX6SgD+L2YSCkXycm1onS5c5FXixOYqKgxPuvCroyA3gxRett/2wQ
         zLit27UfPgoZ8Cd3WdqZVvTwt4X2Ftg+ybutNZxj1Y82ErwvU24k7pG47Y0aK66tCzKz
         GRTA==
X-Forwarded-Encrypted: i=1; AL+hErEP6vUueUnSjjjaT8XPRY/mX67nibIqbRip5OfGtQAJx/RYlvM+GbFVwsU+xjbe+fy/YqMVv44KpCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oOMWeH2M4/Nm4O/QA7td8xHwrDtYlQk+UBI0aKmAd9Dl4KsrJ
	Or3GyZXSn0f4X2KmnFi7oWYTdPoNvqoeAmPwPGzsaSJJgP72pIxH0Yrtl36ABMY=
X-Gm-Gg: AZFdTZfTY2ATyWsRiQNHKyJQP528ZEwv9ccSdtnKXuXEyTOkD49k2oQW0cAHigT3WrE
	FpJUOLLjFE1P6SDje4BRSJeEaSb5RCy3G9tCimEH4eDhxVCkDbZn82ZWwBzf8BhHq5leAVlNEv+
	VvpldHPAdCMupCl5j0aQD+6pEWVr5CFATG7/w4xRmpRwc226Yf+tlQJmIGRQ17wIpj8bvF27C/T
	970jfSWPRyCHd9AOzI6K9HMz62LtExXBf1HZQBbLRxlA9gVykN3jfFHhlQPMTKMlqVjz2JxtLav
	d72TuAkDEOqKjAtukOZRLHUMWltLgnxny9TvDwRvJZo6/sVbtklvHpqf6thbAX5+ivb6H75fMgY
	QSOo/H7CGF+uLsUsAhOehk3VD8btlQ1asTxqtplj5HcrYim/W7pgwBNVF4JvxgF0eb0MEoZFX3W
	V5ex2c9QVv6htTePzPC65mMISkAHpkjIqyRCOrnltn+32AFWBS/jpMrsWvpp/+J3mcc7izSmc2K
	QBmWZnDV8Iiz/+Av7wfPoS+MdsOu8KlmSY7PHPwdUd5ZxKZRb5A5ThrGjddnu7bGhx29EQMkFvw
	kpVtPPHi3euw5M59nby3aeAkQQtvheSPkRERWnOQTUTYpspI5f99EFWXEMJC1TdD4eso3FDcrk0
	jF/KrQTNUMFSVjIGDndVN9mwRXC+BNRomwlk7j41zNyQS5eCCBbeRQSp0w1AM/r1jOwXZRbUGOK
	FzLQj3YHoZgYib5r4=
X-Received: by 2002:ac8:6545:0:b0:55c:f5a5:3900 with SMTP id d75a77b69052e-55d76aa8574mr311966681cf.62.1795581072923;
        Tue, 24 Nov 2026 20:31:12 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8absm143087821cf.27.2026.11.24.20.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:31:12 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Wed, 25 Nov 2026 04:31:11 -0000
Subject: [PATCH RESEND v2] Documentation: kunit: document --summary and
 --failed
 options
To: david@davidgow.net, brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179558107134.36587.13120861622026385297@gmail.com>
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

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
Resending: no changes since v2 (26 Oct), only Daniel's Reviewed-by added.

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



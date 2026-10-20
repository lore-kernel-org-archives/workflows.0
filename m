Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506468;
	b=Itm+Zuk0yBxwaCLEh1X5n/T4WpIwr7wTrTPjNu/PJMjxV+C5wTSLuGK7GabKGDcZqJtX
	 zXzP0kDmM94jerpmAm50klwg0D7/jS7+M5qIM11HpMs3JUoIE4MsQtH1Xjhq1o2TfzAPT
	 6pM49IM+ogmvuKOJJxm1+kcDmQOhRvbFAd3BzbOIS3tSKTV2eN//rNeVXeoKLPP7heBn+
	 7MrY+nQZLKC2Kbz6r9eZcMOJ9xKSpKHbBiRHpWS4f96dJmYjrs/whxQDPHvlsFDc9af3o
	 k2m2bOPngaHqJAhtYcUMq95vWe6cE2RGEV7bKypBc4y0wPzYeySAecH9dgeWUsloDcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=YYdUJX6CxNd1qo/rBqP+LkzXmW73u3T67hGKBmDRpeQ=;
	b=y215aA1k+r7cpQGb1zl+bEuqurAOCOnfJZemkysyuDCzchmoPL5RP5XWsjl/Vx/wNbkj
	 cmJJNHysDH7dnOShcbHEQwXBJ0huXUHtxutTZhCwVhj7rR8UK3lbNbiFuMt0PEms4VS8D
	 LK4V80HMqoYLsiSmlVn6X1M2YIhtEMzJEruRYSKHIEMGxoRwb66aYRhR6LEklRnPkNFl8
	 gR9axUjXO8ZsAb5hR8Aj5CLniWPlJW/DP/DMBZEarFxFx4tkclm6XMgjzwovlwoct1Kvw
	 F0dr+Xxo7YK7zyskQBrnJ1+ZthPXfLoiYUMYf8nhKhJOk500SaJiYE/uM9qXEH27Gbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X9eOmd0M;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1AF606A31D
	for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 14:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1AF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X9eOmd0M
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91bbce8b00cso7483946d6.1
        for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506467; x=1793111267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYdUJX6CxNd1qo/rBqP+LkzXmW73u3T67hGKBmDRpeQ=;
        b=X9eOmd0MHVJiLpZa4cT4z4LcM6QV6Zh8LasqDEKQJryNFrsyTpXe8C2GA5JHRHRHUh
         f+ZY8STqPP2xvorDdgtZk0o66VY/FBMgPeWW7xqkvAdiUkMAoKSsb0pRX7tvB9CHyP13
         wnAdpSHEfxZywh9nfSmm5LX4HxOBN20HZHqqPGQlhRoWAymUi2qAXTag5wzaxZRG550I
         JrIgYHtIemPegeV/UT7fEuu5TwjnCcBKeLrx1XFirvxvM294rXTV3zP7Z3dteRiDJLzr
         GUj0jcgmXRd7LGzhej/7j4h9DLv64Gh0YdJp+yb4Sh8mS/43UoCNqxaFNqCTEXJ9u8xa
         Dcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506467; x=1793111267;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYdUJX6CxNd1qo/rBqP+LkzXmW73u3T67hGKBmDRpeQ=;
        b=ycuqp2zRVl8qOrS3SevZjD935DfbVqVGMENxAEG0WktGv9RfbtADIrsGuoDnhChBRJ
         +NAAbyyoPiIvjoMN25L8TkSwbgfi9Ua4qyitqAQ9W8/YtxED/NE01+1Bh8ydL2ow1Y2T
         /8X2c4ZQ1l3lnAEZ3wOjzIxGIgfwqFgm9fISdc5SS64cXOt6c6svEBxGvg9cJBT5/eHA
         sg47smzHJz6fKv4CioF9Z//VKY8O3iwI4sZwiunTQgpHIpLTmFvlglzsHrYB8fRHY+YD
         rA4dGkeM5C5N4A6gVGhpfS63P8HnZiyNWjRwPzhkabomFoHuWY2n4KO22rOVO104dMFd
         yraw==
X-Forwarded-Encrypted: i=1; AKwUvBxjZdVYbo+M+QlTEtwZjpMXK62ofECfRo/2nQlmfv4xGZKTQEMJ5wjRpIDVqXJiQ7f0d9q02U8kcLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJboP1qaPIyz7e9ufx4PnHV7rixODJE48uaE/BNsUJPCWjvhcGG
	b8kV5wyupM6eKtYlMLzS8+9xjPSG6IL76lw1XygHKaaASOkaN6vXQ+o=
X-Gm-Gg: AYBFou3EinvviqXksnj21sgj2VhgRIG7aKs5GFD8D4rgnvWJIyQuDKoxwb/5DUZ7q83
	a4CW9ACBF00ayiuXhLhQFu+QR7/OPJFclEtw7UtQ4SBSVHMlk6ZFYftFq+tBux4SL7up8S68qmJ
	L5BrXV2R2do9uSlouZ9mMVK/sr2w0j2AWHNyDF8gzvBHpjL6dMkvm+StjZ3PRaQTNPiXMAZCVll
	neqCr3JUH17HKhsMHFXXXCMEFoigkTm4QWr6wkSE4sm7mGhPwuP2P6imaxcmvuOLpwk2gsIQdhK
	OZ6YANuEnn40d79LBq1pQwDsQKgDweMpvAK/m+XKeyJOYOr33zAaXHiKd8w7ibYgxQEAhX7Xg+h
	ukjgOCMheFjaxOuiCFbiLLPrQjuTNnHt0SoH2oIC7+rZfCHS+jpFvYNkPk1hokvYNPu/kZxqdk8
	tAUtQvFLGdF5EshvHvhHZabMGxZlkpVJUMGEPq2m9ZWPY6xudkLT9qPdc/6SN9hN5vCZvW5ioDi
	3X40V7YqgOb5San9GWycIz6xTYijbtnlT00TMpOk0IA8l53gnDCmM+V6Iu3PYHWPI+RQ18D7HDw
	tS0/juifnjZzlc4XXts4/rlSunKGkKcNZ+CRJs0=
X-Received: by 2002:a05:620a:1a19:b0:93e:7156:f814 with SMTP id af79cd13be357-93f4c1c5518mr352969385a.11.1792506467179;
        Tue, 20 Oct 2026 07:27:47 -0700 (PDT)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b0d7c74sm234996985a.35.2026.10.20.07.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:27:46 -0700 (PDT)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Tue, 20 Oct 2026 12:10:33 +0000
Subject: [PATCH] Documentation: kunit: document --summary and --failed options
To: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net
Cc: raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <179250646543.2190262.8632957027583518623@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
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



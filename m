Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A67531355A
	for <workflows@vger.kernel.org>; Sat, 25 Oct 2025 16:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761410024; cv=none; b=mToom/D+fiEeS6jobvVOpTLdSz5s3E2GGheRuuyUx1qwNpsc4+Q18dMXstusss88WQBIrkYFdO58O4Xkgy9frpl3k8xvFDqjMYHo/c5aUF+JCY+wRQ8oWeGL6SOppmuvlrkEAiTLKmL45z6+sQ5rSNeKmrV7F0n+Z7g6Q7i1lJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761410024; c=relaxed/simple;
	bh=W0pTJAcfrpLd3MSeWjU9C4zToTzxqvWOKJPAJegCRgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3m3/o9/u7KWhXO2HQ0Cd/kHnhI+OiEKPQ40BRSNko+zZkhp0hKPO3dLEOqSy1OqDmsrpd1vsK2Z8T2NmNGZQk80uqaIE5XG/L115a1x3yLm/znNGokUiFQmdqz27G0brZwgaYLO0ngD9mBH6DE34Ax2cgjmDWo2aWtoDjdzQ34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3GxsZcQ; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3GxsZcQ"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-88f8f346c2cso331685585a.0
        for <workflows@vger.kernel.org>; Sat, 25 Oct 2025 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410021; x=1762014821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCukDE2Wz/llmJRA1Dhhk+dKRYCeKOkr6t5vR7uoeBo=;
        b=W3GxsZcQ0AjbfViWXfh+9q20Q/hqRqnWMrVwf3Lu3jxrZlLYZzR8fqV64fofyiCOsc
         AQycqC1WssYOjDuAsqnRJoC21rHmhmQI0ZmOVelCYow4SxouzLe2dGOcW2rGPuX0ytRy
         mP0nhuwEiE6cQuHjJrkETrZf3zbhEjyq+Ed3jQapIMRSiNNrHhXXzvgYmE/cs5qtEkcZ
         fafAAxxSj7k25jMJvEzRtknXyICbUpOo2GZphZh5Pw3/1bb9lfiJI/eW6y6RcHwgHiyP
         O7/JvbzuIlG4lvE168bPoIxVmpT8Cp441DPOVQmHnfT0bqaaWiYcPVebjmY/mzSojYlD
         YCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410021; x=1762014821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCukDE2Wz/llmJRA1Dhhk+dKRYCeKOkr6t5vR7uoeBo=;
        b=bMCTg9MUcP3q6MMtpQ0NjYM3xOVqH9jMtsQYiZl7Jo2NtcGCWR0FJ3HZ9nX0Od9h8e
         L13CMI/cqIrK981kJS4Te8xXF9gN9E6DjuhaeRdOB+afDHZ9dbKlg4ouCQ/szqc87/9J
         naPx5VwBgbv08ngBc1v1iOCytMOSRFJLK6xYQy5GGhw12MS3haXWf+RZlTIE4UOGG/le
         TGk/VhoH5HEiFT7zsrQSioABEAQMsYkOzvTn1d92aWpjsoq36ACcZ/KThTJ/zKLOl0cD
         JoRaHid2nmaMx7J0DDO+zkIh/nDxKDaqLyxh1DYtFxIOVxJEAPN1Ra7JleJ4C4pIRUMv
         dSCA==
X-Forwarded-Encrypted: i=1; AJvYcCXKcIynsD15o2ZmzSdPmNa8BZ/uXinDcVQmxYDXFqML/XL6yO8W1OnSohccJMCYGNwKbnYXSqxIV/A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz64BDPEeYvqHpGakjACqrnRkAJSOM7pymOF443xA09o18autHr
	EXBkHSA3etMk5CuvDdB4Yfe/9lHJugRwCPBkQQ3viGnMNQs84DXYzex3
X-Gm-Gg: ASbGncv3skywlNoMhIdGEUSj6YjG09+D0S0jysxgd/9+z7CluSQGZlSyj0PDqm+sLMP
	CNE3TzJCnIj/PaUJNAHKutZQoRC/MhXpUwXzvwLdtqVA2HUU1asNEgwrHkdki0Sb2uDVFwmYyFE
	pxJ4PXQLt15nNUSQGI/ADRifnZJuQh7+O7vg6UfaEjQ3/qcfZiNcVfYCd6LJGaK5sPLkET7Ft0m
	ZuT89RBOmi+Ea1+3LB3C7ArzMjggWJVjs09vu/sDnVQ0mE2ks/tEH9XjTHhj0k7UfciDPAnWAsT
	bANtTgYFRWktsoW0G+k9B2SKsqKcCPOBRFp7oDTyRfeyK9b78rry+UKEisZqAlG0alL4rIiiZ2q
	/FQdKqRNzix9Kf1W7ittsdbfparu83imVGw6SkyEy8yQ+q0pdDKnNUhRTeWJ7IL+zS/xyAWdczq
	2LDIK82vU=
X-Google-Smtp-Source: AGHT+IFZUXzUCKjX2GS7KVjFpxXVayhaSU18PSnROxCbmg4ehcl8/3L/N8ey4/nagW/qyG5Qi/ofXg==
X-Received: by 2002:a05:620a:2990:b0:829:b669:c791 with SMTP id af79cd13be357-890712b8ca4mr3694996585a.78.1761410021395;
        Sat, 25 Oct 2025 09:33:41 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254a41cdsm172336185a.29.2025.10.25.09.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:40 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: [PATCH 21/21] Docs: add Functions parameters order section
Date: Sat, 25 Oct 2025 12:33:03 -0400
Message-ID: <20251025163305.306787-14-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Standardize parameters ordering in some typical cases to minimize
confusion.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 Documentation/process/coding-style.rst | 48 ++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index d1a8e5465ed9..dde24148305c 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -523,6 +523,54 @@ below, compared to the **declaration** example above)::
 	...
  }
 
+6.2) Function parameters order
+------------------------------
+
+The order of parameters is important both for code generation and readability.
+Passing parameters in an unusual order is a common source of bugs. Listing
+them in standard widely adopted order helps to avoid confusion.
+
+Many ABIs put first function parameter and return value in R0. If your
+function returns one of its parameters, passing it at the very beginning
+would lead to a better code generation. For example::
+
+        void *memset64(uint64_t *s, uint64_t v, size_t count);
+        void *memcpy(void *dest, const void *src, size_t count);
+
+If your function doesn't propagate a parameter, but has a meaning of copying
+and/or processing data, the best practice is following the traditional order:
+destination, source, options, flags.
+
+for_each()-like iterators should take an enumerator the first. For example::
+
+        for_each_set_bit(bit, mask, nbits);
+                do_something(bit);
+
+        list_for_each_entry(pos, head, member);
+                do_something(pos);
+
+If function operates on a range or ranges of data, corresponding parameters
+may be described as ``start - end`` or ``start - size`` pairs. In both cases,
+the parameters should follow each other. For example::
+
+        int
+        check_range(unsigned long vstart, unsigned long vend,
+                    unsigned long kstart, unsigned long kend);
+
+        static inline void flush_icache_range(unsigned long start, unsigned long end);
+
+        static inline void flush_icache_user_page(struct vm_area_struct *vma,
+                                            struct page *page,
+                                            unsigned long addr, int len);
+
+Both ``start`` and ``end`` of the interval are inclusive.
+
+Describing intervals in order ``end - start`` is unfavorable. One notable
+example is the ``GENMASK(high, low)`` macro. While such a notation is popular
+in hardware context, particularly to describe registers structure, in context
+of software development it looks counter intuitive and confusing. Please switch
+to an equivalent ``BITS(low, high)`` version.
+
 7) Centralized exiting of functions
 -----------------------------------
 
-- 
2.43.0


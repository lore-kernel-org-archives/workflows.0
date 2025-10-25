Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3B631A051
	for <workflows@vger.kernel.org>; Sat, 25 Oct 2025 16:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761410490; cv=none; b=NsurjDUDGSGWzyBwSywbSfMIoJcyEKmhfG4+QV502BINTV4rFU6pAkzw2RGG60OXxcooYbbKdctZ9BB/qm+pnBZAjw+CZiu1pClVP3JjzOVV/eeMhLaJA500WhmDN/RBARTxtx+ZL8URItzX7XiuLPaCWRL+CrZ5EKlHk7uI/lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761410490; c=relaxed/simple;
	bh=W0pTJAcfrpLd3MSeWjU9C4zToTzxqvWOKJPAJegCRgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zfn70ba7DJia4FMqz6ysDRthSxgmUyHi4hTRFum0ty6kDPgzNHPunL07wUJe/A3YxD0tS5j219otf+TLNKrOMGuhAPVFzNb7hJawTj3Y3a0Vk33ZxMNrrrptA5nFQS5vhIRnpmipauGtIjPMY2n0BNj5YRpWLVTirRSwR8LqXI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmdkCzlR; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmdkCzlR"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-89ead335959so134074585a.2
        for <workflows@vger.kernel.org>; Sat, 25 Oct 2025 09:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410486; x=1762015286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCukDE2Wz/llmJRA1Dhhk+dKRYCeKOkr6t5vR7uoeBo=;
        b=HmdkCzlR2ZV181sY1F/mM051AIewCxk4RD++RSXV/4eyJ6IOO5xFkp5K47ZeLSxExR
         CVKkV49imAR9XLihFoy26xUnIm/67GwVVbS8GkCY4t2LuFdAI+n48O5Dn/jX3KrOaeJb
         VppNAKgxyJGqSMPRcUyIpouAMTXEuxbkOwTzqv3MySV8rXeDShyYkdl4fWUYxJWId6s3
         4wrATqS3p6T3HaITk/P8lWs5zRlOKFnEWfKP+aE7oKmbm/kewrPkES4JDuZNXTqU0ePM
         wx5uIhsmoo1R3Wuid/0fLO5+82UkdRowsq+JEWeQoDYOs8BFfS3a79DI7SZGW6FU1Qio
         +b2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410486; x=1762015286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCukDE2Wz/llmJRA1Dhhk+dKRYCeKOkr6t5vR7uoeBo=;
        b=DpyblDGVZvcPjsZoiadbFAtOLbn/dNZ6Yy8OzhvotTbode1CZdgsNLtV0WSbAiVMIZ
         pKo1YEDxwa+XSLbZQYoDWLs4IbzBBz5b0wlzU3qSHohYTr5yoE87pChdzJXf3aAooWdg
         vC6qIjXTacuRMKSM0Zr5gRH3S2pK0GL/dlBFXB4OGkbmVy7ANMDLCZUtCAZbZdfA4fu3
         nla9XG7cA13oaVV0Z2wyia9NpX+V/YXHTi3ji+8GquVi+S2X1OO4VgOAGvAbZO3ECt16
         TmeLyV8cB1jtnqkJDYNVVwctyNXEL5QMUKtD5DhGV/ozbYGY4ZYGiX1LT7fd2dachPnj
         S/4A==
X-Forwarded-Encrypted: i=1; AJvYcCWmg1vgX5RKIf7WH/lBoJ5Cr5UfDZNNyiaGd2Il0jSTpiw3mWhS7fCrtwZoIdbMTPdMLkUhqIlIuoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7qbbMiXIEfDilJHaecFzjMuJCv/zzNy6j6ep2lRF6A4N8o6l0
	JbfrSce145HZMaGwtn4K+kairzuq84vGvXi8D3QGOJofawSpfktgcmQp
X-Gm-Gg: ASbGncvGVNsaZqVyW4WqEhoJj9l0vLmBZKVoPtnOvAjJdjGZ/IxE1S0asujI3/UH+cw
	51vvmDuxaYsiek13F+yK6c/20s4CUMwItr59QCel2LB060/2fG9a/kVVStNNBbBBBjOLXw7aiVB
	Th+erjRIUeWUCR9tETX8Ecchi7/tMXak9V607qBdT/tjcCcMgFsgfZP+Wjj7mNGHNScnOdlnJgg
	TC38g8hXjcrGpaYYIppeQokL1oycFu6Xpxf2xcknEifjDhmv9sd1FHacWdQV+v1m/l6SbnkUpfh
	kG6w+99FtnmDGNfSTWjNdGPPjnb33at963Ru31EuNE2icE2ppcEDgWJNt6Xq7sXXfX3KVlTpOes
	kmhhBM0y2GLdyHkUC9T9xIWaC3g7dDpR7wxi7wS8ExVRsCiH8YCyIEIPJnbW0Du2t5cyWvrdY
X-Google-Smtp-Source: AGHT+IEqr7DdALG20ZOSBwW3gigwHtT069Vv0Qyq2izolgtR2Xh/1150BfEGa5vrjghcvepsgiDnaQ==
X-Received: by 2002:a05:620a:40c3:b0:85e:429b:b5c9 with SMTP id af79cd13be357-890712b9494mr3891854585a.83.1761410486528;
        Sat, 25 Oct 2025 09:41:26 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba37d72ecsm15371681cf.9.2025.10.25.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:41:25 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 21/21] Docs: add Functions parameters order section
Date: Sat, 25 Oct 2025 12:40:20 -0400
Message-ID: <20251025164023.308884-22-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025164023.308884-1-yury.norov@gmail.com>
References: <20251025164023.308884-1-yury.norov@gmail.com>
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


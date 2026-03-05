Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2F42C08BB
	for <workflows@vger.kernel.org>; Thu,  5 Mar 2026 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772737552; cv=pass; b=j26e5tQ/BvspTUbvcg+9FP8ycXCycg4e5oF5kWeE7msrdUP4nYzuctiTF7NtJGFqmsFvjErtPjutmA6S2saLKKUsn0uCIuVRAZtjIOwN8olVuPqnlmS8QtrKogr+LiPfaHMaOE+c1mzOtDWFsC3tlYANWW7zSi4mpGf5FazLJmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772737552; c=relaxed/simple;
	bh=OiEKC9dj80TLcUp3yk+ZVSKiJN0ebZG15+u03MmyUhM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lmzir3cJfP9YDv/VitCmwdqgW8gSdfqq4s/W3wA7LEbQMG9Uv6FP+MRqc3uGMrjk9F2c0DDyw47pAnls+JdpYjEiUvKLI8mWKuVONEUYKexisGe1QvpXF6jUpTt8EmJi3c6vyVDyrI9wirOTDUa+FVSIXejYQx5mKs1w/ufyoQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGDHBfDc; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGDHBfDc"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-797d6bde07fso5082097b3.2
        for <workflows@vger.kernel.org>; Thu, 05 Mar 2026 11:05:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772737549; cv=none;
        d=google.com; s=arc-20240605;
        b=WlWELv6A6oqEXq7rhgHKzVXENU0YGVbvs/7K6prVsqlb05mD4A3tHuKr+swsTl69/a
         0VNPhlLbQ864b8ZtPyAVeFbkpUbHYBi7Oi3FWxP70x9wcYWPG6KcXXNi9tCWY9BDtO4v
         zgN2p6wOtgdgB6DNW3JsZuaEd2l7nD8B19Av+9BZDAj95TsLHDyHf0NMN5R4cSd3AzRW
         stKzPa704Qqv5KYlr45LdRim3LStpSrt1pmkT7kJA1/z6H8SlBvuNG8jVF27QoOvNyob
         ZSCvPpKIXqDtToxm33Dez7cjkicGfAVlUoxcBOwLhxgbEOvDxAiTANv5iF1o1CM5MEMc
         lUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=;
        fh=9kinid1U9FvvZLYIRAn5EJ+MQGzIk1fhtsxnXpVrcQQ=;
        b=L/XJH1Eu6DjwaVdrqPC9acLiybkC6duejMl1utSzIrm2fgdGX/lt2TAilJlSAck8UM
         Z1iyFKE5gR5NY2mcn35pjILIeBjSZaTC+iYQKb00/cixABw9PcFj+BpcpkqIPeydRC7S
         N4MnLFePK2ODXCSwL5XjMW5gEsjr+N8dDca+6Dnle6UMPv8wrrNAQgYg6hbp6aBeiBi6
         9DbDfAAJ/PEUggC5i1eYkD7FU+S0fQM6zO7uAIG2TI6l7KtauG4Zutm21BpzYuNnlrCt
         cLs4pcAPvF0bDw4/ADkx0bJb8Ko5dNN43To+FHKRkQF8eNZUUzM7KTzZ+rswoEiVbF1R
         C+FA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772737549; x=1773342349; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=;
        b=PGDHBfDcvLabTp72Em/A1p3xWwIMXxb5OPdsMMut5RG+EV/wbrTkt4lpWKP763RNQR
         5YMRwWuignb6eIxMtaGOJraHLWeNhw2QhnkQ2N5s89Jyshrj8WKlwxosnz1SLfiW6HxK
         h+2nG3pnZpVPyc6fYCauXUvcj72fqd/ky5bhE1R5sLBuMURwTNwPE/7CZ57qOuS5vlP2
         q7S0ttvPPq6obsGqA0YmnYTci3ZKoshdkJ2aYQ57V7yiMjesiQDcILZjeWsP5VRCPIM+
         GCoLkJfASXEtn+F+eTetRw+cU6f5l0uSjqFy5ck/uP9T81Dv6YUy8z1t4rMBzRNvHfb2
         scMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772737549; x=1773342349;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUfdbW7OxfhKiR73pKbZr0uWEl4+qEzhZGOpiUb5qj8=;
        b=sd3rTZFbnuLxcojTT57j+S54lJwL9YCqOef4/RzvSqtvTv14OAEamy2v3B03KUkhLJ
         EnHgmJdzhHdAtnXaAo9q99FJ6DH5PKj00ZmfDEE+uKgO1Kn6N+PcvLUsGwer0G8JImfC
         seGI2KAWIUv9uduMpeqgQzyyBm+q1vEgTE8/TRChgLZA23YISC0FOPegCV6nUPImXcvL
         qo0LJetDJSkvF/uFYOUL2lrRCr6wXwbaD4qiF0CLETdvKOISuS9QI0x2JAWxCelNMCP5
         Cufl4Y7WfTK6inJP0fL/lkBlV29NU+JnZwX1e7QhXtYohJqmlQYSR8kT+PFFSf1y9YJM
         +1ww==
X-Forwarded-Encrypted: i=1; AJvYcCUTxoc3ZAkiXYclWrIu7q53t8SKvH4gcLJ08x//32WcMSoBHFoY0CjWuLtfesjqopso3IVvDTRJwSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK4EtfZhc83BFpeuhJFIB6v238+D/FOXVbvOc/6qA7n+1o2SZR
	a3XCh+Kmu+99gGiDy5fuAzPCRDi5jHQWaiUo4dLZM0QmixHIg3IJ/lS+/qmGOgUnfm3ej8QMnDD
	U0r25l50nS+Bzqfq+avbYTk1FlGH6D9M=
X-Gm-Gg: ATEYQzzYaee/hnRmkoauQYavP39BmoJL+/2jRlPnmNk/omJm+r1sgzSeOMpoF+cbzjv
	Y//0+mBKopC0fn2NGa5sVJ5LTZwRpLRfAmL+KBOxT8CVo6Lopl0n98GFNA3XLIJdUbV4p+MonLF
	AxQkygChTY3C5RlSdlof4E1+TtRLPwBSsyq6FVVNEWWCsuiWaQH0ED+bnikWzykAESLd/SG2s2i
	wqiaJKqOrOLu2P+UA4LhpstNzQg5nmBizMmD5SvF/9HHz1llkR/XbJG/sUcsoWADVsdl2NOlQjf
	hmGb2Q==
X-Received: by 2002:a05:690c:e3ca:b0:798:1de:f894 with SMTP id
 00721157ae682-798c6c843e6mr49794737b3.4.1772737548885; Thu, 05 Mar 2026
 11:05:48 -0800 (PST)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Mar 2026 13:05:48 -0600
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 5 Mar 2026 13:05:48 -0600
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 5 Mar 2026 13:05:48 -0600
X-Gm-Features: AaiRm51wLGHSZ9SaMaT4E-JYzg2vW23YHvcBblsyf-Lc9uQK9qhJFdTRUjtyx2g
Message-ID: <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com>
Subject: Re: [PATCH v10 01/13] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Maciej Wieczor-Retman <m.wieczorretman@pm.me> writes:

> --- a/mm/kasan/kasan.h
> +++ b/mm/kasan/kasan.h
> @@ -558,6 +558,13 @@ static inline bool kasan_arch_is_ready(void)	{ return true; }
>  #error kasan_arch_is_ready only works in KASAN generic outline mode!
>  #endif
>
> +#ifndef arch_kasan_non_canonical_hook
> +static inline bool arch_kasan_non_canonical_hook(unsigned long addr)
> +{
> +	return false;
> +}
> +#endif
> +
>  #if IS_ENABLED(CONFIG_KASAN_KUNIT_TEST)
>
>  void kasan_kunit_test_suite_start(void);
> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
> index 62c01b4527eb..53152d148deb 100644
> --- a/mm/kasan/report.c
> +++ b/mm/kasan/report.c
> @@ -642,10 +642,19 @@ void kasan_non_canonical_hook(unsigned long addr)
>  	const char *bug_type;
>
>  	/*
> -	 * All addresses that came as a result of the memory-to-shadow mapping
> -	 * (even for bogus pointers) must be >= KASAN_SHADOW_OFFSET.
> +	 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shift
> +	 * and never overflows with the chosen KASAN_SHADOW_OFFSET values. Thus,
> +	 * the possible shadow addresses (even for bogus pointers) belong to a
> +	 * single contiguous region that is the result of kasan_mem_to_shadow()
> +	 * applied to the whole address space.
>  	 */
> -	if (addr < KASAN_SHADOW_OFFSET)
> +	if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
> +		if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0ULL)) ||
> +		    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
> +			return;
> +	}
> +
> +	if (arch_kasan_non_canonical_hook(addr))
>  		return;
>

I've noticed that we currently classify bugs incorrectly in SW_TAGS
mode. I've sent the fix for it [1] :
 [1] https://lkml.kernel.org/r/20260305185659.20807-1-ryabinin.a.a@gmail.com

While at it, I was thinking whether we can make the logic above more
arch/mode agnotstic and without per-arch hooks, so I've ended up with
the following patch (it is on top of [1] fix).
I think it should work with any arch or mode and both with signed or
unsigned shifting.

diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index e804b1e1f886..1e4521b5ef14 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -640,12 +640,20 @@ void kasan_non_canonical_hook(unsigned long addr)
 {
 	unsigned long orig_addr, user_orig_addr;
 	const char *bug_type;
+	void *tagged_null = set_tag(NULL, KASAN_TAG_KERNEL);
+	void *tagged_addr = set_tag((void *)addr, KASAN_TAG_KERNEL);

 	/*
-	 * All addresses that came as a result of the memory-to-shadow mapping
-	 * (even for bogus pointers) must be >= KASAN_SHADOW_OFFSET.
+	 * Filter out addresses that cannot be shadow memory accesses generated
+	 * by the compiler.
+	 *
+	 * In SW_TAGS mode, when computing a shadow address, the compiler always
+	 * sets the kernel tag (some top bits) on the pointer *before* computing
+	 * the memory-to-shadow mapping. As a result, valid shadow addresses
+	 * are derived from tagged kernel pointers.
 	 */
-	if (addr < KASAN_SHADOW_OFFSET)
+	if (tagged_addr < kasan_mem_to_shadow(tagged_null) ||
+	    tagged_addr > kasan_mem_to_shadow((void *)(~0ULL)))
 		return;

 	orig_addr = (unsigned long)kasan_shadow_to_mem((void *)addr);
@@ -670,7 +678,7 @@ void kasan_non_canonical_hook(unsigned long addr)
 	} else if (user_orig_addr < TASK_SIZE) {
 		bug_type = "probably user-memory-access";
 		orig_addr = user_orig_addr;
-	} else if (addr_in_shadow((void *)addr))
+	} else if (addr_in_shadow(tagged_addr))
 		bug_type = "probably wild-memory-access";
 	else
 		bug_type = "maybe wild-memory-access";
-- 
2.52.0

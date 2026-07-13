Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DCD40BCAF
	for <workflows@vger.kernel.org>; Mon, 13 Jul 2026 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946211; cv=none; b=SGGt1i53C/sQaOJR0WhkY2yeNrXvpbPcwwWNn2Mxif8RscAbCiNnbXbwyL49AkW7aeG5XzVPVQFx8tnTlen4/P5EV7IOQ50bWc0DB++GxksAN81RZt1f2sFQ0kQ30xPc/H0mcu/WoQEWIT3GF8e4ZwZWwVlXMyW120MGjWmqq/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946211; c=relaxed/simple;
	bh=eP+6L9APW6Fk/DPuUcN47xss7LE2be5MSQjekTkQ5uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A02v9o0xdf3nU4ONOBp2rfOgyQXj4OYON1Nanm0MCGszf3p0k9lMZZLgvge2qB1HyJ66QpxG8CzqPGRXKu0SB1slO6KrkmhxOi0jz8qmvmxL+bEkK2K6xB+lGk9zqbmSR7O5rk+f9jxcb9DEQL+mMYm9iommYEdQiHENZjra1q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so3885243a12.2
        for <workflows@vger.kernel.org>; Mon, 13 Jul 2026 05:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783946207; x=1784551007;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t/6DNcSK6X/uGZ1IYS4q2R1Z6al9GC0dZL0uRll37ZA=;
        b=M/r6XPJHP7WtoHZIKiKClIcK9z+dVDmmh3JOmwQnW5g7e6uUYHi+PxTXhiCaJl/FL/
         gPpypwbLlodYn4R5125q4acvvhtCpN2cHDHx5IaWmRH4HPD6Y/skEdXHwTeU8XNd+m94
         AcdvNonFLOzHJ6uGEEioREBnwkd3JqEMjof9+Jx1209qvcS7rP18jt+yZXioJ1RIGWj6
         qp+kBn7kFqpnxbJlDfFiSWt9eET9H3GIh+IDDLR7I1ExDzj/R1vMIj3ONCd8+7tcgN+B
         fKFm4ClhF3x+8Az/KnCD8qKCeyGfAP6FdDJ5m8ieVIg7YXvdtAvSJydiCgRGTmtXrCSL
         O25A==
X-Forwarded-Encrypted: i=1; AHgh+RrrMbq97unXbYKiFbHj/NVCbVkGvine8qplptY4pGFH08mPUnatAE3klwFpc1f9Yx5w0sg44AL8tGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YybQJJRYlnfrKa1ZY59+8vxSRyTeiMP90dyygHb9DMRLh/9NTAi
	oWxI8cYETnF1Uibr+AvFW88kVOFYtw38eYnyeI6wQrGhc64nMnFu7vuRDLLFTz9Bj5s=
X-Gm-Gg: AfdE7clOmZSLXkGV1e3MpAGoZPrUp9XFFJ9c9wxnkAS7pSLbqLofJV/qIu9UvxlnT4P
	iikmIGGlnEql9Lps4jjPYsSIh4ybUqKpFe6f9ge97jgIZLHd5bstmf+C2+0GHh7Tytw6gzyf92V
	abE11ATPY+MDrMnykgmHnzhCifaHlTOG7YzPX0RmBpJSsxb9b22Qg8U46l/2mDHI6zDHn5n7rtt
	74kK7DpRxIuQwhXl5Hs8+0DOX7EjIEOFJ/bbzMiTJVDix2Eb9bmbY90/PN9/NB/MaB7cjrONh73
	mt9oVrMx/ugqeg/L1te/MzuXOqP7B0sgefsKc56x0iz7YdE5Ck56xTlN/1qaVYCYGedfJaoYaWU
	LYawy+/E9UCmrGk2ZAxUWiNSxRMG/g1BZZytuWIvh1HQ4AjOii50jBAcyMCz/nH4xDZCiJE+KJA
	XbEk2xn7WdHuyaLCXYtpHMydJFEo+paVgcUTH5UWgj6y2VHDYb5A==
X-Received: by 2002:a05:6402:a505:10b0:69c:769d:6edd with SMTP id 4fb4d7f45d1cf-69c769d7b31mr1975344a12.11.1783946206685;
        Mon, 13 Jul 2026 05:36:46 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19dbee72sm15018042a12.30.2026.07.13.05.36.43
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:36:44 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so3885054a12.2
        for <workflows@vger.kernel.org>; Mon, 13 Jul 2026 05:36:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrOD1Ia6iGfW+rBFgeQWGZ/zzFbuVzHAd4xZ3MViieDvCY+g0Puinb8wzPhK6fyTkaoOp1SG6sfp6g=@vger.kernel.org
X-Received: by 2002:a05:6402:a29c:20b0:69c:7ac7:c740 with SMTP id
 4fb4d7f45d1cf-69c7ac7c96dmr1680487a12.13.1783946203526; Mon, 13 Jul 2026
 05:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-catalin_pto-v1-0-5b93b1131089@debian.org> <20260713-catalin_pto-v1-1-5b93b1131089@debian.org>
In-Reply-To: <20260713-catalin_pto-v1-1-5b93b1131089@debian.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 14:36:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBQ-Vn4XzbrfV31adY7cEjLvmGuwu5_x7rn1NBkEC5mA@mail.gmail.com>
X-Gm-Features: AUfX_myop1qSR0uweNQ9TGaDUdl1iHj4R-fufo4jIbPM1JPRHa_hqCZvJROVzWA
Message-ID: <CAMuHMdWBQ-Vn4XzbrfV31adY7cEjLvmGuwu5_x7rn1NBkEC5mA@mail.gmail.com>
Subject: Re: [PATCH 1/4] mm: kmemleak: confirm suspected leaks with a second scan
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

Hi Breno,

On Mon, 13 Jul 2026 at 13:48, Breno Leitao <leitao@debian.org> wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
>
> The kmemleak marking phase is not atomic. While the object graph is
> traversed, the kernel can modify pointers, free objects or allocate new
> ones. If a reference to an object is moved from one location to another,
> kmemleak scanning may miss it. We have explicit annotations like
> kmemleak_transient_leak() but identifying and maintaining them is not
> trivial.
>
> Given that such transient leaks are short-lived, rather than just
> reporting such objects as leaks, do another scan to confirm the
> suspected objects. If no new leaks are found during the first scan, skip
> the confirmation one.
>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>

Thanks for your patch!

For how long does this postpone the reporting of a real leak?
I am asking, because I have a few known leaks in my local tree,
and it already takes a while before they are reported.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F42277804
	for <workflows@vger.kernel.org>; Mon, 28 Jul 2025 20:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734452; cv=none; b=CeMZb9hfL+2lFa93KjyMZ/GhCegK5S0WoG65/QYrOC8paYsDAiLWtgedCeRKflO7ACKqkA47CZFGSgWJ9OB0SMN7Gf1SJGg+clwI4lns4k96st/O9/FEsMWFHnCU6hGYiuVNaGzxCw789LjcwJwb19/RCzwtsNCkGOhdAhNQn/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734452; c=relaxed/simple;
	bh=WDDgULr439kgXv/N5YL4Rk9chzIOziT1SqS7cwPnB2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5jSfASEM4pMxldUxgqrthKKmn8MZaepy39TQ02LVvdDenLV6i7wq06tspTxxnUqGLNRuS505YIcIJwysP3fmLTFmczGmvvORGAkJAYq7ZeMWHaTGJNeFaS6GWTmCOdRp4+RW8FJWcZoMz6z5DFVkb687BBV2QiY7U3KrFe+DVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TUmrXMkz; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TUmrXMkz"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b3bcb168fd5so4313321a12.3
        for <workflows@vger.kernel.org>; Mon, 28 Jul 2025 13:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753734450; x=1754339250; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k6z/pDkQGQHJDGGW0WyP2y56SRGD0QXG8oTjmKwbrE4=;
        b=TUmrXMkz0v2VKITb/3lxZvGsmbaHlT5+wnBoyeSJXCaKOLhxUMkEeZdNbpuZxFj+if
         6YuI1hSItfLqG7MSkk43jMtmxGY2UZqSu558BHKO9oYMKp+0nRrtB0QX+zuURo6iwGbv
         xELCqmjgH5bHINF5/QGY0/C4a2HznYK37X7SyRUSK59HRhhTLymKm6Nx1+fMlp0jhPgZ
         056blBCOhaPpdHWLcyFnWt9lN70DgE0O6PfhfPWs0c+UB7xn/DYn0fLVIO6VcuCsG1IG
         ezOrehF6+A6sWSIdajnN4rbEZF5DYoHZRCVp2JLMts+q5WLalhFrUpNI3sK3MUonrYlO
         jNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734450; x=1754339250;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6z/pDkQGQHJDGGW0WyP2y56SRGD0QXG8oTjmKwbrE4=;
        b=VTmgKcBgs2pzCLoyim6B/lis5EylqcxCH8p42g2/2fGK9liJTE6MgydvbfIwopNPUU
         06cQaxaAH9p4kDhVP/vwlzG+I+UQFN5mAuYesZc7qgA/tfEiAfSw5umhuZfG0HwzhJ5o
         rLRfM0eVLc6GJfzPyFk/mVzvrOd3dyUcnjH/HmvsPXDwOhA5jC+qC195Xp42xhSLFbSe
         8AAQQ05562YQS2UW14aJKIcMHWXp1uw+XTsI3h23abI5nc0aAqrdw5+sDro0Q2k9pVoo
         RLIgWQv7HhkqWLWEqh/SQuelvvZjvTTvvQefHNvBi9J5HBma7NAGwXCtOrhD8IlaiaEu
         ez3w==
X-Forwarded-Encrypted: i=1; AJvYcCVdm7kaoZLQ8TJ7qUZzphE/L8CgMjQ9HKzf91I1qsxpdZpHP53hozT9dTF9tmiQT9Sf9Vqa1cAyJ9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwamORV28cy9PsOfgI7TRJFIXMtljsxsKf9rNBv9kH1cwIK/pCC
	A58FNxmeurRnvx6jp5PNHXfKmGAURdDBAhBJMENHZiBBCM01lT1AMjwRWy6gZkA/9VMbmu+xoOU
	yOgWI0fIXLs3qaNKBamALvgDMCh1gIHsG55GhlbnK
X-Gm-Gg: ASbGncsgMY468zQlZPjPt+cfXI53Xd9TLGtbAI3tQnTyvAWk+fUvEbYEnMYRbgEf/+u
	5HHvS350zLMg2fY6B0ehgoPZc1P59LII0OP6llg6ZtKUb9S1jO3xXGKWYrc2R/5Oe2tjYV1xDYW
	Yhy7JWS83S+vYC8iN28IVRjuiPnqeNS0LwtDnuSmsiKS20/so+P9yHptI4t25lvewB31zQocDiL
	bgjOyF/O+VzKmy/UXWvyjFGPFwcPTXvWYnhPAp2E4kj92CX+g==
X-Google-Smtp-Source: AGHT+IHTsZAhRmKRmO9BItm1tujCHlY2sj9Ka+sACUwnvT/m2J+eLpM9xwe+06nfHk8StigQGDZ/ZcCxT5SmUhrt6TQ=
X-Received: by 2002:a17:90b:17ca:b0:31e:4112:4031 with SMTP id
 98e67ed59e1d1-31e77a4a2a3mr16714413a91.30.1753734449857; Mon, 28 Jul 2025
 13:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728184318.1839137-1-soham.bagchi@utah.edu>
In-Reply-To: <20250728184318.1839137-1-soham.bagchi@utah.edu>
From: Marco Elver <elver@google.com>
Date: Mon, 28 Jul 2025 22:26:53 +0200
X-Gm-Features: Ac12FXyPiMnImA19a92DEHCy10HpY4KQmzQuVM_kBdjTuWMJ5YVQbefnl37AKdc
Message-ID: <CANpmjNOP5OFX4LDNkfYdJMTDUEmEDpw9ha41Og5zbKt+VKZuzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kcov: use write memory barrier after memcpy() in kcov_move_area()
To: Soham Bagchi <soham.bagchi@utah.edu>
Cc: dvyukov@google.com, andreyknvl@gmail.com, akpm@linux-foundation.org, 
	tglx@linutronix.de, glider@google.com, sohambagchi@outlook.com, arnd@arndb.de, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, corbet@lwn.net, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jul 2025 at 20:43, Soham Bagchi <soham.bagchi@utah.edu> wrote:
>
> KCOV Remote uses two separate memory buffers, one private to the kernel
> space (kcov_remote_areas) and the second one shared between user and
> kernel space (kcov->area). After every pair of kcov_remote_start() and
> kcov_remote_stop(), the coverage data collected in the
> kcov_remote_areas is copied to kcov->area so the user can read the
> collected coverage data. This memcpy() is located in kcov_move_area().
>
> The load/store pattern on the kernel-side [1] is:
>
> ```
> /* dst_area === kcov->area, dst_area[0] is where the count is stored */
> dst_len = READ_ONCE(*(unsigned long *)dst_area);
> ...
> memcpy(dst_entries, src_entries, ...);
> ...
> WRITE_ONCE(*(unsigned long *)dst_area, dst_len + entries_moved);
> ```
>
> And for the user [2]:
>
> ```
> /* cover is equivalent to kcov->area */
> n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
> ```
>
> Without a write-memory barrier, the atomic load for the user can
> potentially read fresh values of the count stored at cover[0],
> but continue to read stale coverage data from the buffer itself.
> Hence, we recommend adding a write-memory barrier between the
> memcpy() and the WRITE_ONCE() in kcov_move_area().
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/kernel/kcov.c?h=master#n978
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/dev-tools/kcov.rst#n364
>
> Signed-off-by: Soham Bagchi <soham.bagchi@utah.edu>

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  kernel/kcov.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 187ba1b80bd..f6ee6d7dc2c 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -978,6 +978,15 @@ static void kcov_move_area(enum kcov_mode mode, void *dst_area,
>         memcpy(dst_entries, src_entries, bytes_to_move);
>         entries_moved = bytes_to_move >> entry_size_log;
>
> +       /*
> +        * A write memory barrier is required here, to ensure
> +        * that the writes from the memcpy() are visible before
> +        * the count is updated. Without this, it is possible for
> +        * a user to observe a new count value but stale
> +        * coverage data.
> +        */
> +       smp_wmb();
> +
>         switch (mode) {
>         case KCOV_MODE_TRACE_PC:
>                 WRITE_ONCE(*(unsigned long *)dst_area, dst_len + entries_moved);
> --
> 2.34.1
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/kasan-dev/20250728184318.1839137-1-soham.bagchi%40utah.edu.

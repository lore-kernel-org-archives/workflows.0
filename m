Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591D02E36FD
	for <workflows@vger.kernel.org>; Mon,  4 Aug 2025 06:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754287228; cv=none; b=hN/DEzOaCvQrSTG1wjIqPskAyJ0qrpVGw0g7RETFOhtrg+q7Y4YsXKWn0cm/tc/1zYPuyu1iOMnrYikl1S0M3f92ETiG+UWA4z8lgREd+biFH3NsQUPD07ucKN1sgzqPrZXcBbzJGHozH+ZI/m/vvlz4fX+rp2YfjE32ABlrDqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754287228; c=relaxed/simple;
	bh=CMjSVsnlYIHATz4fXgWOQlWXjlcbst7J2k2mwNhi1Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MjAzYMkjQ8DpZcdBbb6vKOPPAKxHo0BWowVdvchys4/CoxFUmtUVCPJlxNxvH1ofML5uaeTUwBAEeONyBZhkPrSnGu9rp/vFfz5MWjCgPgGr374C9Lc6s2/USwUZ9yHnzgNYaIAaF+E6ZSa4MOYv4dhFzyB8zBVBGdY4lj1+rjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TnWiv36G; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TnWiv36G"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2403c13cac3so38019415ad.0
        for <workflows@vger.kernel.org>; Sun, 03 Aug 2025 23:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754287227; x=1754892027; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GW9ee20vQhs+179oAZihQfxJ7e5GO7cvFv5OZiXPnJ8=;
        b=TnWiv36GJTMN+9LQBBxwj5Xn6WHAy3zy4tIIwg0kjzdME24J3ZeIZAKReLxDuxNlDe
         E/p+rHScsM2OFr4c63KFFV5Qj17x/VKMMpichsnt8AVNW7jbBwhyp1jHLn+TJdQc509v
         AJ3tn+ZLtfDT/oTuBuyejYdGerDFADZYFOioNpK6pj2JDfaOGw4gE8YQJZ8pWBs9bdjT
         W1nJD6QElDxf++YghWNBM4/MlXvyMXuc1UvkCw1pBHDQMdYDcUhwg8RcCmrJ/9Ai/P83
         v4zN2+2BPKl+b4byb8fEdPt2uaTB9MpDUe5rmeIpuGu5PamWm89T+rgYVLnIMwS3xG8Y
         usdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754287227; x=1754892027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW9ee20vQhs+179oAZihQfxJ7e5GO7cvFv5OZiXPnJ8=;
        b=FTkUoSee6JpWK2lcJKITMpqWFsN5gD+FnaPvUHyl+UVz3OY4va3faKlnrO5xBbGlts
         uze6793x6LJ1nfjWd8sYFTE1pJf4jn6i5r2scM6VjEO59JJTbm9zjnSU0KxlBpF09aT3
         JM3dDGDWXndO5ek354Bg5nlDGyxsRHVAisD+LRZpaZXShYYOLZYCGlOGpoxLFB7/u85K
         wqUjeGbBaaocs3+ee8MLOluYA1i6QUN+BXBkeppNbo40VwhNLbBa2kl1ot8UO+DVJI3y
         ECYXdVA5qPQ09uTrRiFbXPOGEDH05Jw0PeT5fa8Il9uNBfCN97mgEYNHxEb+rcnIuCnT
         BKug==
X-Forwarded-Encrypted: i=1; AJvYcCVCxDg/CsDP6dazbDTNXALbCrzoluX8ICINC/QeLcoM1CSLexg2e90FnR6GROMXhgkIbIjAyPcTDZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3PiyEVKpqxF2F1F8GQFb/0RiAXSNA+x8RNDL5y7YZ0UvX0fMT
	V9DoD3IqVaCyWwqDLiISqyzkh7m9COtk6tUoLlqKR/S0PpP5oDwS3bWy06vkEeXUGMZK9NCAKPa
	uzgUtPsqmt0l6M1MDu/CesIcfj+fC1kUxxpYU5HX0
X-Gm-Gg: ASbGnctdbVPkZByZJjuWufuo6LdYd9iNRuhNTv86EyULlzt4MYkIkgj7NqRoZGskTVI
	JL447wb08+kkO6YpvkcoG9bNjzG2xEqzPFO4sm/wrsPxHwD6zQybF3c/TmhUGvbzxXjAUyxA1/A
	1EYtUkmrGuxTDw23bwsS8jsOAPLyErtodwaqnFnOAXObpkP6fzbg94eulJQTuQw7H37OzFJ9FHF
	J3B7quLXOJOdHXGH+KOyKo5Y1CyZdmqzCl8RtM=
X-Google-Smtp-Source: AGHT+IGjk2UIBetcSl3cOr+lPMFKsmxl+eJNheNEbJC3BP4ucecQ/KCFqsi7V58RFGF5MsVFqR2tEo7P/NgkM0Cjsno=
X-Received: by 2002:a17:902:8601:b0:23f:ed0f:8dd4 with SMTP id
 d9443c01a7336-24200d7d3a1mr165647385ad.23.1754287226255; Sun, 03 Aug 2025
 23:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANpmjNPWzJZrAFT3-013GJhksK0jkB6n0HmF+h0hdoQUwGuxfA@mail.gmail.com>
 <20250803180558.2967962-1-soham.bagchi@utah.edu>
In-Reply-To: <20250803180558.2967962-1-soham.bagchi@utah.edu>
From: Marco Elver <elver@google.com>
Date: Mon, 4 Aug 2025 08:00:00 +0200
X-Gm-Features: Ac12FXzqJppzOFmhwA4bjarsTDBlyoRY0yvvampHjfyILSAANQCwWK9R6F2pkOY
Message-ID: <CANpmjNNvsJ_u7ky+d1tiXtwc-T3z6VB4SiMqpo6aKWBBFO3ERA@mail.gmail.com>
Subject: Re: [PATCH v2] kcov: load acquire coverage count in user-space code
To: Soham Bagchi <soham.bagchi@utah.edu>
Cc: akpm@linux-foundation.org, andreyknvl@gmail.com, arnd@arndb.de, 
	corbet@lwn.net, dvyukov@google.com, glider@google.com, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sohambagchi@outlook.com, tglx@linutronix.de, 
	workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 3 Aug 2025 at 20:06, Soham Bagchi <soham.bagchi@utah.edu> wrote:
>
> Updating the KCOV documentation to use a load-acquire
> operation for the first element of the shared memory
> buffer between kernel-space and user-space.
>
> The load-acquire pairs with the write memory barrier
> used in kcov_move_area()
>
> Signed-off-by: Soham Bagchi <soham.bagchi@utah.edu>

Reviewed-by: Marco Elver <elver@google.com>

> ---
>
> Changes in v2:

Btw, it is customary to send out the whole patch series on a version
bump, even if only one of the patches changed.
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#explicit-in-reply-to-headers

> - note for load-acquire shifted to block comment
>   in code rather than in the preceding paragraphs
> ---
>  Documentation/dev-tools/kcov.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
> index 6611434e2dd..40a4b500073 100644
> --- a/Documentation/dev-tools/kcov.rst
> +++ b/Documentation/dev-tools/kcov.rst
> @@ -361,7 +361,12 @@ local tasks spawned by the process and the global task that handles USB bus #1:
>          */
>         sleep(2);
>
> -       n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
> +        /*
> +         * The load to the coverage count should be an acquire to pair with
> +         * pair with the corresponding write memory barrier (smp_wmb()) on
> +         * the kernel-side in kcov_move_area().
> +         */
> +       n = __atomic_load_n(&cover[0], __ATOMIC_ACQUIRE);
>         for (i = 0; i < n; i++)
>                 printf("0x%lx\n", cover[i + 1]);
>         if (ioctl(fd, KCOV_DISABLE, 0))
> --
> 2.34.1
>

Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871EE1FC0E2
	for <workflows@vger.kernel.org>; Mon, 28 Jul 2025 20:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734808; cv=none; b=Q+BZGP9pPSrN8knFu1jBgom6YR3vcYE57Q6gztoWmjsls+C+BYFccF8u37IrWLWg2cOyxmSlqiX2Z1YQsoEl6YPASXl5seUcw4kM8MfjLnEi+uQD1y4H+1H0fPXyPxKe6DAj/fv5t77B0sGs+kK+20IogDPspIcd5Cq01VutYlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734808; c=relaxed/simple;
	bh=teayqiuCzSaQjJnQj70/U/ADAw/StTCH/gj4tVb3cPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eevtoguezmKHJjoR+WPcyzuiBX18XpXZXXKDQ5cbW/0Txvffz6SsUcT5l0YkcqNuiPKs23IV5P0G52TgPSbU6ULMrwZKW82ii7M6igxEHqyZVZ7nFmwjuVAUwpGK6xHiGbLV0xMgK264yQDbPlGHyqHzQSgOtkyUQz1xgunko68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hotN5DPh; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hotN5DPh"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b31f0ef5f7aso2619990a12.3
        for <workflows@vger.kernel.org>; Mon, 28 Jul 2025 13:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753734805; x=1754339605; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OUBXSlb6O3h9wA9dBxb9GAArtBxswFFmvqz7tVHohcQ=;
        b=hotN5DPhzQRUvkd8L0Bl4kjfeyMihh9gIroLKPz5P47lpuBBfTq6uxqNZbJ1sn3rHY
         LLwfYYsYoVjGPxtR8Pjm0BeZJSy93KqcE8MEVbR0/oAlI6h/Z0nPDbmb6nljCRdcH0B8
         i8GhycY6LLIov770V75lxLxe+jUBWbhkW4iQE4aRY23UexB+Wf4ihxrP31cpbiNUeGEV
         9dbLhKd8eIegCCsEh8I3D39N2ez13TyOBu2w1tVoa2Dk8hsccerapAKRGYLj2KmbkQoD
         pv1CwUzgL89n4k7bVDbPhvLwL6OJbu1WV8G4le4WXrDXFefRBTe1l6pr4BufR02vdgmR
         I0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734805; x=1754339605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OUBXSlb6O3h9wA9dBxb9GAArtBxswFFmvqz7tVHohcQ=;
        b=viS0RsmTfN/gWIcqw0GZpsjJOjLH6qWuK0g+HG9HnqT60eoi8ov49gFyvOBr6Ap1sl
         mkSuIJDV/Yfsln2M1DEl1vQWZA2IcCbhkcg+WlZg8E3KTPOtIJcAfvhNo+aKmXIC2ENk
         HLWrpjES1AKx+BdU4jyAg3cJ4mOx19Tuvt4H+Txt3xJKOtpsTLZAbiO5Sguo3NORCpuY
         gIQGUoa52IwckMINRJ76rJj+pOYiMfeVsEa9C8vaRN+cX+FWDcj22KM12l0A0MdW/buz
         JSwIGrfssbXeV5jLbKbr9ClMB0VFHwtRSxFndUfg9EkGpN0ABsk17K49fydgXdGWsgxH
         MCDA==
X-Forwarded-Encrypted: i=1; AJvYcCXzJ05O+Y6yIoIvyfsoik4oo62DsEtLXwzvCq7D5N6Wqg1y5abKse82Njko9u9v2n/1s+BP1OKN5eQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIlGFWGkD7k0B9Fv8fz06Un3JZtu9V4PR0/JRnDUsYZblCKJat
	ht1OJFIrKVHgkkJO8QYb99+N/hZioB18gczjMxM5BTpV1CQMQwVlvzg5Uc8JQ48r4UCd8HCoF5T
	1pnqXBifWusBYQVPamzXRfs7DutrnCm4jWLMLb6qk
X-Gm-Gg: ASbGncusqdaJ+hsTp4T/i5l2pgSvBpkY0abP5RASjxDKEyUGZpAYuUz2Sde9AvykvX5
	ibVQqS9ra1Wc+EffBizkNdjTBTcqeeBDavCwJgyeDtDoG87Z+f4FH5UiRe9oTdAc7mZwtxPmNEf
	+Hs34Rf8ukQZwdY2O7dsgOjszzRmqMNpF6SOz8gHuApMnvL/nqrSm6KuRmhT1lf0LFYsodTRpPJ
	ZqUoudI4D5G52Um2aoH2vPDtZibne8ueJe/QNE=
X-Google-Smtp-Source: AGHT+IHK3kKWFUOpDo+1w4dpi3jl6CKAuy4IN5RkLlqGNNAA1K92Ca+e/wtI2hICx9qG3l198YLwP1IzabAVSNvIOkI=
X-Received: by 2002:a17:90b:4c:b0:31f:1db2:69b1 with SMTP id
 98e67ed59e1d1-31f1db27000mr3287346a91.18.1753734804686; Mon, 28 Jul 2025
 13:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728184318.1839137-1-soham.bagchi@utah.edu> <20250728184318.1839137-2-soham.bagchi@utah.edu>
In-Reply-To: <20250728184318.1839137-2-soham.bagchi@utah.edu>
From: Marco Elver <elver@google.com>
Date: Mon, 28 Jul 2025 22:32:48 +0200
X-Gm-Features: Ac12FXxrA0KuBzkm3AL3l8gRNoz9nEwCgGw777gfr_Ks9ZDLjrKOw5hgi17LW5w
Message-ID: <CANpmjNPWzJZrAFT3-013GJhksK0jkB6n0HmF+h0hdoQUwGuxfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kcov: load acquire coverage count in user-space code
To: Soham Bagchi <soham.bagchi@utah.edu>
Cc: dvyukov@google.com, andreyknvl@gmail.com, akpm@linux-foundation.org, 
	tglx@linutronix.de, glider@google.com, sohambagchi@outlook.com, arnd@arndb.de, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, corbet@lwn.net, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jul 2025 at 20:43, Soham Bagchi <soham.bagchi@utah.edu> wrote:
>
> Updating the KCOV documentation to use a load-acquire
> operation for the first element of the shared memory
> buffer between kernel-space and user-space.
>
> The load-acquire pairs with the write memory barrier
> used in kcov_move_area()
>
> Signed-off-by: Soham Bagchi <soham.bagchi@utah.edu>
> ---
>  Documentation/dev-tools/kcov.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
> index 6611434e2dd..46450fb46fe 100644
> --- a/Documentation/dev-tools/kcov.rst
> +++ b/Documentation/dev-tools/kcov.rst
> @@ -287,6 +287,11 @@ handle instance id.
>  The following program demonstrates using KCOV to collect coverage from both
>  local tasks spawned by the process and the global task that handles USB bus #1:
>
> +The user-space code for KCOV should also use an acquire to fetch the count
> +of coverage entries in the shared buffer. This acquire pairs with the
> +corresponding write memory barrier (smp_wmb()) on the kernel-side in
> +kcov_move_area().
> +

This new paragraph is misplaced.
You've added it after the "... handles USB bus #1:" part which clearly
should be right before the code (note the colon).

Why not add what you wrote here as a block-comment (similar in style
to comment above the sleep()) right above the __atomic_load_n below? I
think those details probably don't quite belong into the high level
text, but the detailed code example.

>  .. code-block:: c
>
>      /* Same includes and defines as above. */
> @@ -361,7 +366,7 @@ local tasks spawned by the process and the global task that handles USB bus #1:
>          */
>         sleep(2);
>
> -       n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
> +       n = __atomic_load_n(&cover[0], __ATOMIC_ACQUIRE);
>         for (i = 0; i < n; i++)
>                 printf("0x%lx\n", cover[i + 1]);
>         if (ioctl(fd, KCOV_DISABLE, 0))
> --
> 2.34.1
>

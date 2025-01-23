Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DDB1D6195
	for <workflows@vger.kernel.org>; Thu, 23 Jan 2025 23:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737675898; cv=none; b=MW5dWNAVK1tF3lFPfLO0mWdHY7a/ICBAJ1cl1Olno2pVW4CBtv4WcZC6P64M7NJQmHSWxiro1tSzs7yZlD2cunGfaEsLzzLdsTqdKRY8yp76gZw9mcUzmT9anEoUL7ltQ8azz5ZSWRHDscse2Jj+eJHDtAHiZsZ4mf889sNPiI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737675898; c=relaxed/simple;
	bh=9C6xKATDxund+9Crep7jpIiPPWURjJMC12rLi9eVp0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvGjrCrhQ8uiLk+gHWpu2Zt3xlWDNXzbLgPhMtUxacp/l8BXOD6n7CnK3PR80WqYXvnHGeDsmLdTTkjif4s4qaC3fRc0dg3LppwxiYqQ1CnHE4TsTnKkUSWydFE8fcuDt1dAk7RVRSjKxL0WO9BqYENBeB74eb241eBcDEW1Sy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GcvGD/Ij; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GcvGD/Ij"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2efded08c79so2333980a91.0
        for <workflows@vger.kernel.org>; Thu, 23 Jan 2025 15:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737675896; x=1738280696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A0ETzY+h7Rvd+LbZPMucT42xXHGbgsKSuCz/4EBdLD8=;
        b=GcvGD/IjKJfMa3WZ6S/4zWRpfObruL2rzXTh69smgT5HHQ5d58D9mH8yKkfGDMeYuF
         oIvTvEHmCw1I6VoH4FTS0OeuddgqpcyLGccHU3UkWSOrUll+zC7iVXxbtmx3GzLn8JZO
         ayHA+fDRIKiqARC6kkdccugJP7TH5UObvwTXPmQD9ynonVp/T9QcoZ1G4AOJ00pZM2bp
         zNWAXyg+pRO1REUY4M2SFqrzHjh4n9wVJHDAtoA2+QYcz/vv16MOiy0mG6G5AfufgS69
         UFp7o1HVabMDopnRBfQYPW/hEpacsYrcrvYb8hMcv3sPpGKYOJdyWvgbGldf6T/NPCqr
         YSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675896; x=1738280696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0ETzY+h7Rvd+LbZPMucT42xXHGbgsKSuCz/4EBdLD8=;
        b=BxyqfInT3a+W6QY1qtIzYGlCqPhkyHueD/h96jLkBA2vs69i7zi6hxqLxtCF2bXB8a
         DO4lZMJDrMooyR9V52/cyKH09Y3RluuT7Q7StbfN2KC9rvgr/ZhC9QOmHjRDbFlUUGlS
         d3szBgmP27SzzWSBi7dHA1pen271B4YXjORwPRlxsz0QMPCqqXHhaEXBUw7f1HZ94Jxf
         ri9y+zquxViqJjZ1tF8K3KYVrJ1Q+KZQ+oeiwGvNaKUH9d3gM7Sz3AfT3L5Riv3CbYKE
         GKjzZfoKPuT5tvBUOMCPYrrKHn5xGBW0FaM2kV82yGDZGX5DF2y0qDVIkAF4ZkDfKLDv
         YBaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI7nH5rJdMYR/x7uoG1iQen0Xq4Wpa04rxSAjOMkqV88/iu//jZs228/GE/CwuHmtLhzqkEC/2yLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd/g0YAFEpT5ejCW96ak0RKQ8qAcJgAhS2oygfm6vHxr5mq1ox
	XDqaDowucQcgQ5G2m3Z42VKxGADygtnNKxMELbjZ7v0aa7eG8sRmP+n4n9u+gB6fgyZMUtP1lXL
	qGQDERioV/ID4zFzg/v/q6ZsUp6Ubcfu2yoC4
X-Gm-Gg: ASbGncu5Q8ZCt5DPjaGSFq9/Pyjls/Ul719E4h+cbdV0iPu73hJOQVxp3X4vs5aogZR
	9fqWNNm6zS1vdyfOpSju0KPcaizgP+LllhM1ttftMyFwLmE+fPkhyWrWK/r6oxuAiCCBtVWtXm4
	2D6bDQ+jz88b0orAkdjA==
X-Google-Smtp-Source: AGHT+IEw7THzVLDJProKpyzC07FslM1paALTUJY1a59BE0YzTP3P7a4TIZppDWq4CHi1qaAQJi34577VFou6U5KbOTs=
X-Received: by 2002:a17:90b:534b:b0:2ee:d35c:39ab with SMTP id
 98e67ed59e1d1-2f782d4ed15mr35040211a91.22.1737675896115; Thu, 23 Jan 2025
 15:44:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123-kfence_doc_update-v1-1-9aa8e94b3d0b@gentwo.org>
In-Reply-To: <20250123-kfence_doc_update-v1-1-9aa8e94b3d0b@gentwo.org>
From: Marco Elver <elver@google.com>
Date: Fri, 24 Jan 2025 00:44:19 +0100
X-Gm-Features: AbW1kvbdh3sgF_a89-h8Hs6yMK2YACQJdSakSNMeMPjw3tBzcyjXOx-8lYtQOvQ
Message-ID: <CANpmjNM04i3bNYJXYP8aEKy_-o=MTiW-eBEb9NmzpHoaTxwQTg@mail.gmail.com>
Subject: Re: [PATCH] KFENCE: Clarify that sample allocations are not following
 NUMA or memory policies
To: cl@gentwo.org
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Yang Shi <shy828301@gmail.com>, Huang Shijie <shijie@os.amperecomputing.com>, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christoph Lameter <cl@linux.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Jan 2025 at 23:44, Christoph Lameter via B4 Relay
<devnull+cl.gentwo.org@kernel.org> wrote:
>
> From: Christoph Lameter <cl@linux.com>
>
> KFENCE manages its own pools and redirects regular memory allocations
> to those pools in a sporadic way. The usual memory allocator features
> like NUMA, memory policies and pfmemalloc are not supported.
> This means that one gets surprising object placement with KFENCE that
> may impact performance on some NUMA systems.
>
> Update the description and make KFENCE depend on VM debugging
> having been enabled.

While the documentation updates are fine with me, the Kconfig change
seems overly drastic. What's the motivation? CONFIG_KFENCE is not
enabled by default, and if there's a problem users are free to either
not select it in the first place, or if you cannot unset CONFIG_KFENCE
because you have a prebuilt kernel, set 'kfence.sample_interval=0' in
the kernel cmdline. More commentary below.

> Signed-off-by: Christoph Lameter <cl@linux.com>
> ---
>  Documentation/dev-tools/kfence.rst |  4 +++-
>  lib/Kconfig.kfence                 | 10 ++++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/dev-tools/kfence.rst b/Documentation/dev-tools/kfence.rst
> index 541899353865..27150780d6f5 100644
> --- a/Documentation/dev-tools/kfence.rst
> +++ b/Documentation/dev-tools/kfence.rst
> @@ -8,7 +8,9 @@ Kernel Electric-Fence (KFENCE) is a low-overhead sampling-based memory safety
>  error detector. KFENCE detects heap out-of-bounds access, use-after-free, and
>  invalid-free errors.
>
> -KFENCE is designed to be enabled in production kernels, and has near zero
> +KFENCE is designed to be low overhead but does not implememnt the typical

s/implememnt/implement/

> +memory allocation features for its samples like memory policies, NUMA and
> +management of emergency memory pools. It has near zero
>  performance overhead. Compared to KASAN, KFENCE trades performance for
>  precision. The main motivation behind KFENCE's design, is that with enough
>  total uptime KFENCE will detect bugs in code paths not typically exercised by
> diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
> index 6fbbebec683a..48d2a6a1be08 100644
> --- a/lib/Kconfig.kfence
> +++ b/lib/Kconfig.kfence
> @@ -5,14 +5,14 @@ config HAVE_ARCH_KFENCE
>
>  menuconfig KFENCE
>         bool "KFENCE: low-overhead sampling-based memory safety error detector"
> -       depends on HAVE_ARCH_KFENCE
> +       depends on HAVE_ARCH_KFENCE && DEBUG_VM

This is not going to work. There are plenty deployments of KFENCE in
kernels that do not enable DEBUG_VM, and this will silently disable
KFENCE once those kernels upgrade. And enabling DEBUG_VM is not what
anybody wants, because enabling DEBUG_VM adds features significantly
more expensive than KFENCE, even if disabled they pull in code and
increase .text size.

Nack with the dependency on DEBUG_VM. The documentation change is fine.

>         select STACKTRACE
>         select IRQ_WORK
>         help
>           KFENCE is a low-overhead sampling-based detector of heap out-of-bounds
>           access, use-after-free, and invalid-free errors. KFENCE is designed
> -         to have negligible cost to permit enabling it in production
> -         environments.
> +         to have negligible cost. KFENCE does not support NUMA features
> +         and other memory allocator features for it sample allocations.

s/sample/samples/

>           See <file:Documentation/dev-tools/kfence.rst> for more details.
>
> @@ -21,7 +21,9 @@ menuconfig KFENCE
>           detect, albeit at very different performance profiles. If you can
>           afford to use KASAN, continue using KASAN, for example in test
>           environments. If your kernel targets production use, and cannot
> -         enable KASAN due to its cost, consider using KFENCE.
> +         enable KASAN due to its cost and you are not using NUMA and have
> +         no use of the memory reserve logic of the memory allocators,
> +         consider using KFENCE.

That's just repetition from above, and I think the point here is just
that if you run tests but can't use KASAN, consider KFENCE. In those
cases, users typically would use much higher sampling rates that
_will_ have somewhat noticeable performance impact.

Thanks.

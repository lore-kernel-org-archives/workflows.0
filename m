Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FFD1DB133
	for <workflows@vger.kernel.org>; Fri, 24 Jan 2025 09:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737710098; cv=none; b=Em2h5yxgJAyif92rIMx0ntwhuUvMDnfYLF40BO01AoZJSTPJnSbShxK0VOx7Styovk6a2KjnuCqv4DWpJBZe/CkHXBctMGI30tQagWPpGhyPC9OMadyz5QWV7gahopWtAr97oWmPMK/orAvIYUnRCMnpHDN20kZYMMIHIRIelVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737710098; c=relaxed/simple;
	bh=SCapxKOH3M9W1UEBW2kGxofAJW9pigfg6jfOIWOmkQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOEnHXFwuEHmkJQLXgYbpV1xVTdP5z8XK0aAR15n4I05NgtrLl8j2i9AZ8bGN9J7kBf+Uw42wqDnxkiBRDGSbfm8jMBhCXUJB8b8E7872CWtDAyiU7uyraPLsuoBvYqoYWw7XX7Ri6jaq3g8Uerc631V+Gzju1teC7leL5sgYg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gLFU2C+Q; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gLFU2C+Q"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so3572709a91.0
        for <workflows@vger.kernel.org>; Fri, 24 Jan 2025 01:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737710096; x=1738314896; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BfJugkHmmfDQH4XzuB71/6BlU/7LvV7l26SCjxzi4Ds=;
        b=gLFU2C+Q2OuBuYFyvD1hmrabxs7dG/vTLAo5HBMvQrfFYBbrl8pBY0BV6R7mCABav9
         Ub8kO5tf/3kKIvlH997Ii5hUcEgHQeGoN0sXsJgjUb1GnZG0fOfwsIm31hCB/4WlnV+X
         xQN4BvEtI5yEW+Tt5U2ZwHNQ6VdvO+8PyymdxmWS+psoJUA5lMShywVSkgABGbkRt1jP
         NJXZx9jZ6ekiLnZTWB+IQkdJ9P5sZCiOAhH6dBAfMK4btRRAjxeZNKtoI/nQYZqNkT14
         2QA77ZZVnK/Qw3D1nILSEloeDMfcHYit3OP68hGrW9m0IgidxqvtABzXQAFSeB/uqZlp
         B6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737710096; x=1738314896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfJugkHmmfDQH4XzuB71/6BlU/7LvV7l26SCjxzi4Ds=;
        b=LatW3zQwLktWQcHLUdmLxtnYhx3V9mSHzvr0ChduhUQVXqxC47Q58VWuOgYTDS+QnK
         2f8wMZSVo1ajFhAZgqhPpjilpteqHUU5UiURJhfKzyes91ss4qOjM6pnMyX+MgEHaZSh
         9f+JKXIRxu35wECVGJpnWQ8U6uDQhN0kx3uuxMKjTtUGUMiTMa6tYV21I0hCzQSvGjv/
         VsWYgDziq4bjRG/ISjZDifwTP+CcqVWGQcGr2pLT3QaoHCejrb7S2fM8HEfkxEuRVV8f
         zOYL2XvrYuZBDMtd0HiexBZaCUG8OgfniZ7t4s+w64OW7MGL30SPGheOvrbgL4Vz/9gi
         efgA==
X-Forwarded-Encrypted: i=1; AJvYcCXoTJacBPhONaGE0ggp74XpevuMM++Kw2wMcz5WXCZ1oDTlLdvvukGw9B3e+gYbFjJaWvFU3Na6OKw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5B8Yr/NVwUpiG2fegbNV0bjOkN8GAEQH0GIwvvQglp8+dK+yk
	/3Xq68UHM3ak7LbizpImt8ciBg+gxcCA3Q9V4BPgWhhrzOR5eZ6hujbvbAs+2dsNcOZjRl7eQ2l
	fzWpu9eDBJ/CSqDJZ2sPZ/e2SQ8OlK/IXQxTT
X-Gm-Gg: ASbGncuXEqAPf7SXMF+GYl/SMeLm3X1VFr5rMcN5gm1/wVysMOXwKlNtF7D5h7YyOBi
	IUHUgz80y8+R6xjJl/hpO2GMtPFHS9WyXZpxCywTP0owiH/45Eo58h4cRaMCc1cGDxyhkb1vik4
	oi27+AqvmYwFsXEkTZPQ==
X-Google-Smtp-Source: AGHT+IHTyt6PMeD7vbebqfa1ab8YdiyQms2JFvQt+C7tiaW3rHpm2h9ZjZYTKDfVoPs8lIF5yaSf+8xJJv5Z5gWO9bA=
X-Received: by 2002:a17:90a:c883:b0:2ee:f46f:4d5f with SMTP id
 98e67ed59e1d1-2f782c669admr39138288a91.6.1737710095835; Fri, 24 Jan 2025
 01:14:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123-kfence_doc_update-v2-1-e80efaccc0d4@gentwo.org>
In-Reply-To: <20250123-kfence_doc_update-v2-1-e80efaccc0d4@gentwo.org>
From: Marco Elver <elver@google.com>
Date: Fri, 24 Jan 2025 10:14:19 +0100
X-Gm-Features: AWEUYZkWVGLKJhEO4MuQJscF4LBBjUtoFnkHM6vXTs2MTpAdzInzcHd7Q89BN1Q
Message-ID: <CANpmjNO9L6gv9rK-WntLgAPde5Se8WjQqNLHZNGQFXZXRG2S7w@mail.gmail.com>
Subject: Re: [PATCH v2] KFENCE: Clarify that sample allocations are not
 following NUMA or memory policies
To: cl@gentwo.org
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Huang Shijie <shijie@os.amperecomputing.com>, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christoph Lameter <cl@linux.com>, Yang Shi <shy828301@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 24 Jan 2025 at 03:06, Christoph Lameter via B4 Relay
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

The commit message still incorrectly says "depend on VM debugging".

> Signed-off-by: Christoph Lameter <cl@linux.com>
> ---
> Reviewed-by: Yang Shi <shy828301@gmail.com>

If it's after '---', it will be ignored.

> ---
> Changes in v2:
> - Remove dependency on CONFIG_DEBUG_VM.
> - Spelling fixes.
> - Link to v1: https://lore.kernel.org/r/20250123-kfence_doc_update-v1-1-9aa8e94b3d0b@gentwo.org
> ---
>  Documentation/dev-tools/kfence.rst | 4 +++-
>  lib/Kconfig.kfence                 | 8 +++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/dev-tools/kfence.rst b/Documentation/dev-tools/kfence.rst
> index 541899353865..03062d0941dc 100644
> --- a/Documentation/dev-tools/kfence.rst
> +++ b/Documentation/dev-tools/kfence.rst
> @@ -8,7 +8,9 @@ Kernel Electric-Fence (KFENCE) is a low-overhead sampling-based memory safety
>  error detector. KFENCE detects heap out-of-bounds access, use-after-free, and
>  invalid-free errors.
>
> -KFENCE is designed to be enabled in production kernels, and has near zero
> +KFENCE is designed to be low overhead but does not implement the typical
> +memory allocation features for its samples like memory policies, NUMA and
> +management of emergency memory pools. It has near zero
>  performance overhead. Compared to KASAN, KFENCE trades performance for
>  precision. The main motivation behind KFENCE's design, is that with enough
>  total uptime KFENCE will detect bugs in code paths not typically exercised by
> diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
> index 6fbbebec683a..1f9f79df2d0a 100644
> --- a/lib/Kconfig.kfence
> +++ b/lib/Kconfig.kfence
> @@ -11,8 +11,8 @@ menuconfig KFENCE
>         help
>           KFENCE is a low-overhead sampling-based detector of heap out-of-bounds
>           access, use-after-free, and invalid-free errors. KFENCE is designed
> -         to have negligible cost to permit enabling it in production
> -         environments.
> +         to have negligible cost. KFENCE does not support NUMA features
> +         and other memory allocator features for it sample allocations.

This still doesn't parse: "for its sample allocations" ?

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

This doesn't read well. As I said in the other mail, this is repeating
what you say above, but is mostly irrelevant in this context. The main
point of this paragraph is that KFENCE is no substitute for KASAN, but
can be a reasonable alternative if KASAN can't be used at all (in the
beginning, we had some folks thinking KFENCE is like KASAN, but faster
- but that's very wrong).

If you don't like the last sentence because of the "production"
reference, I'd suggest to just remove the whole sentence starting with
"If your kernel targets production use, ...".

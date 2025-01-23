Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5541B3948;
	Thu, 23 Jan 2025 23:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737675205; cv=none; b=D2hxcwzWy4Tf3GrtVDuXZYzlTRxhvsG4hgyjc2wp2yn4Tt+9UpZ1KRIIX6gf1vSOzNXMW4Wur5kpXVZXnyXHMM/PBsOGxi4uGbMGa823u5gGAmZS+Gld5fo2KO2ta6rCAPe+ruMtuST3icTV8h56ONtt9gVpds7lYF+BL694Y7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737675205; c=relaxed/simple;
	bh=TcUiBJ6TpMLt4hj6hQEyLcAXWycbFWGk+HLZLeuexdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m/SMHFiXbdzDmd1RUNUt6c4v0FwmN8Ky+kTPJOK9r5RHsYb0ABAk/HZlsLgcR1SFKVKiEp2wraeDx1n32B22J//fUN4zk28cLQ5u6yDnIjMbwDov/qbiCaD5nfJDfs1UDNW68vXc+4DiYBBQ/1fhEqhYhc8XrRN/3BKWhuxKxvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCV3uGoF; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCV3uGoF"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso3423139a12.0;
        Thu, 23 Jan 2025 15:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737675201; x=1738280001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVSW8bIsfsFFqMRBCFdAmfhhGQMoicsNVoCASFEdJPs=;
        b=kCV3uGoFloq3z3q28gxKN8tpQFhs7WjD4qgxOLLiC8KCCX07JLU0ckqq5p5O3wzJks
         HM+mtaWGfVKx3EkJNC1LUJqnNqmi8UV8VoUwXai3OlCacdM/mIhBRWiSCu9iPTxFO5el
         No1G/BqvqpchnJNedej2PlOdsxYzCq2ghdmZznvMlteHymyQMYuZ6A9FMGZthXFhBiMS
         MD5efm1WfqT+aq1zz8x9Zny8fr4ALoEtBQyZkamdcQgW06YFE60+CDJyUVcnxOdY3FWj
         nkcGQmQZKrIYCktuvWJXGdYwv55bhPt7XvKpBYmz4lNQqtUeXZo5coivYA7fvcQD8SRF
         BO6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675201; x=1738280001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVSW8bIsfsFFqMRBCFdAmfhhGQMoicsNVoCASFEdJPs=;
        b=U2ip+MJUky0nxe8tQdVoZ7EaqRAefeKJJRHDQXWt7lgswFhjLy2Z0qBCgwGwwkDCiY
         xsOFrzu51FNbBsFFWDZiLma8DRHVhNuPIu0T4YFMgbNlRJooRR3kdYowou0tO6XG/jWl
         fB7LEB4+SZ5w1RQwFDiGqPwkVVCKON6SJi1/zuauzfCKXoi2XUlOpaBUMmhLZj0eMdm4
         uZwfU27pne1PvZpkd6Ss5ckf3SnUiSrwbcc+tcMdb2eZ6eUJMS9mLhFehBGBDzuwzfdq
         OwS6DyqW/mWLnUAfuLnv+gnT+AVpFZCdrME8CerOSdHMNUnujMdw9eNXUesZH9h6mNqw
         Hcow==
X-Forwarded-Encrypted: i=1; AJvYcCVtAqfFn97bPM8cUjQLPQvvAjL7xC2nIz42Zs2snR74i5CCizsRWNJTiFcaKbWPk5h2FgUezRhn+fOVTZBW@vger.kernel.org, AJvYcCWWQp8+DdgGn+5Cuf/it99gJZmxEp/S4lVCUr7uTFNAEd6G1ksFToKjHjLhcofZg5IMvEHaL0Yw13x2@vger.kernel.org, AJvYcCX29CcOr0gfsr74XUMPFVQdU9ipMFDEb4Z20v4LUEEDCaGxMyMylNtMfbh4q6nCPWsY5mRshE/Wu/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0M+1KKeJAilSjM2qMQNet1UCywZhmThBY/r3l9YzWVCAPkjjL
	GYvkaKFd1EEu+3txhAnSIoPfvWMAE3SpvK4TJqy/vBlsnBGs7FumqX1RoQS7aYZsSbfVJmS23Gg
	q6O6bqRffCaQO76wZyn7p5byRFcWa0Q==
X-Gm-Gg: ASbGncsN2SYcDkuk6FbJjS7l5aEl9TXVWb8Nt2oSD8vTuIFdzOydLgACTW0f/Kzl4jV
	TtnaU3FF11p8z2I662INKamH/LGdPi6gcW3waL90UhvUbO4EyG9/O4Drd08LYgvOU
X-Google-Smtp-Source: AGHT+IGwhFVpWMpwMksW42TWygeOZTzT3pPrS1F8pR0CaKQ60veMoLlOkRNjfVZ/UZAoGDfQe9fvqSp1sN89+teSbtU=
X-Received: by 2002:a05:6402:4306:b0:5d0:e570:508d with SMTP id
 4fb4d7f45d1cf-5db7d2fe766mr29121404a12.17.1737675201205; Thu, 23 Jan 2025
 15:33:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123-kfence_doc_update-v1-1-9aa8e94b3d0b@gentwo.org>
In-Reply-To: <20250123-kfence_doc_update-v1-1-9aa8e94b3d0b@gentwo.org>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 23 Jan 2025 15:33:09 -0800
X-Gm-Features: AWEUYZkt0opVyUinbKW3yvK6FhHW59qmxiF3ZCbbeXr6_WOiSo_nj24cn27XASg
Message-ID: <CAHbLzkpTF-n85vHeFVEWQArpV=hP9Vo_tYm_LgUQEWLJp=ac8Q@mail.gmail.com>
Subject: Re: [PATCH] KFENCE: Clarify that sample allocations are not following
 NUMA or memory policies
To: cl@gentwo.org
Cc: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Huang Shijie <shijie@os.amperecomputing.com>, 
	kasan-dev@googlegroups.com, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Christoph Lameter <cl@linux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 2:44=E2=80=AFPM Christoph Lameter via B4 Relay
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
>
> Signed-off-by: Christoph Lameter <cl@linux.com>
> ---
>  Documentation/dev-tools/kfence.rst |  4 +++-
>  lib/Kconfig.kfence                 | 10 ++++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/dev-tools/kfence.rst b/Documentation/dev-tools=
/kfence.rst
> index 541899353865..27150780d6f5 100644
> --- a/Documentation/dev-tools/kfence.rst
> +++ b/Documentation/dev-tools/kfence.rst
> @@ -8,7 +8,9 @@ Kernel Electric-Fence (KFENCE) is a low-overhead sampling=
-based memory safety
>  error detector. KFENCE detects heap out-of-bounds access, use-after-free=
, and
>  invalid-free errors.
>
> -KFENCE is designed to be enabled in production kernels, and has near zer=
o
> +KFENCE is designed to be low overhead but does not implememnt the typica=
l

s/implememnt/implement

> +memory allocation features for its samples like memory policies, NUMA an=
d
> +management of emergency memory pools. It has near zero
>  performance overhead. Compared to KASAN, KFENCE trades performance for
>  precision. The main motivation behind KFENCE's design, is that with enou=
gh
>  total uptime KFENCE will detect bugs in code paths not typically exercis=
ed by
> diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
> index 6fbbebec683a..48d2a6a1be08 100644
> --- a/lib/Kconfig.kfence
> +++ b/lib/Kconfig.kfence
> @@ -5,14 +5,14 @@ config HAVE_ARCH_KFENCE
>
>  menuconfig KFENCE
>         bool "KFENCE: low-overhead sampling-based memory safety error det=
ector"
> -       depends on HAVE_ARCH_KFENCE
> +       depends on HAVE_ARCH_KFENCE && DEBUG_VM

Not sure whether it should depend on DEBUG_VM or not, but the update
about not honoring NUMA policy makes sense to me.

Reviewed-by: Yang Shi <yang@os.amperecomputing.com>

>         select STACKTRACE
>         select IRQ_WORK
>         help
>           KFENCE is a low-overhead sampling-based detector of heap out-of=
-bounds
>           access, use-after-free, and invalid-free errors. KFENCE is desi=
gned
> -         to have negligible cost to permit enabling it in production
> -         environments.
> +         to have negligible cost. KFENCE does not support NUMA features
> +         and other memory allocator features for it sample allocations.
>
>           See <file:Documentation/dev-tools/kfence.rst> for more details.
>
> @@ -21,7 +21,9 @@ menuconfig KFENCE
>           detect, albeit at very different performance profiles. If you c=
an
>           afford to use KASAN, continue using KASAN, for example in test
>           environments. If your kernel targets production use, and cannot
> -         enable KASAN due to its cost, consider using KFENCE.
> +         enable KASAN due to its cost and you are not using NUMA and hav=
e
> +         no use of the memory reserve logic of the memory allocators,
> +         consider using KFENCE.
>
>  if KFENCE
>
>
> ---
> base-commit: d0d106a2bd21499901299160744e5fe9f4c83ddb
> change-id: 20250123-kfence_doc_update-93b4576c25bb
>
> Best regards,
> --
> Christoph Lameter <cl@gentwo.org>
>
>

Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234F23DE45C
	for <workflows@vger.kernel.org>; Fri, 29 May 2026 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780072145; cv=pass; b=PojudGSvcBDn09OKCLxIZ0L0jLli9D6y7akQ2LlJ+MC9m36jYcR8Fe0jnf1O822z56OFRluvaL7YFnFrINiiIfjXEfqvzWjphaVbh5rWKyGtT6SpzeRSgK7Gp2NOleoSZXwPWHxsTMuc0cksDbnlvg9HYiUCUhVhpoaoXwh8eWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780072145; c=relaxed/simple;
	bh=PH/Z12wHsMq8SpuU56tCXSsJXXE208ciSwkYTY3S1Lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0utSvPRld4AjE15UBpfH1piyIacmCGauOR0IFgHxp/HT1YikB3T/d0tpWOQxk7u/Rl/87DJkeZGSIm0D069ydKfLdTCSd2BUh8liY2DFSR2TBdTouGQhWYbNchf+EHnOUpq1Kb/GmPHbiUkbRB2hag7GzeGPjVwbgBuqjAEAf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MsDjvx0G; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MsDjvx0G"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9639b1ef167so638184241.2
        for <workflows@vger.kernel.org>; Fri, 29 May 2026 09:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780072143; cv=none;
        d=google.com; s=arc-20240605;
        b=kVH7eZUumNgI3ML5R8mWn1CrUUAZ2artYEMF0m602jt+HbnWt3spUNimVdYn5OcNPy
         pShTsTobKk8+qVMYTg/VNKo1l/QYroIvJYD9Qqu4iCBirvH+ty0yK7tgr76e1tpIx1+V
         1MbYunp+N4n37HW+xlJlgfU+RnvKjzesKE9dklUfu0n8U8qyomOfgm8mC6l/WJ9X9Cem
         +yVCR9/LPQoZqadM850B09/PiMriR2UlhJf+3sBMD3p4FlmIUV7lc/gMTbJR3pEGaaR7
         eBi9zoYdVaBzlVvS+SyGCA9fq2l5wxbmLCE61CwZcn1ydQVpiX/DLzDk9Pj32dT5ZV7u
         YBAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q7KOWJPsMTJrakS60eVOqCDfj+qeD6Xam4DgPMjjGsI=;
        fh=s+78Y3b+1kGcIxPm+PU9lZz13vQgA7eGEvNdxkhHzPI=;
        b=jiXUVQGaoJBwPWDFLzstgJK802LUJQ5ba3Mgqg4qAl5aeaaW91y5bsGUCSYZbl9szX
         4DXn9axpJ5kNhvRiedWcVE3aono6hXwimpQ7orPIM48f1WjfzUqig2c69zX+weUsnNRj
         zU6sOyUlh+Uy/4rp+PRhR4OeFjop4LCXsZdoxf9pMqNSTWOJZZ3KwUbBFZ758X5cYBz0
         4WIfe9vHf19c8jJIwvaI+dCeF9EJTUBgmBOAbdisB2jOgB9ySg08uTI33AVWs96stv8a
         KwrtbcJXb5HAby+JSU13QAtiazzJSUHvqbQWhbcd62+ZIHdLwhdvBp/PhIkPu7S7ZJzZ
         nEmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780072143; x=1780676943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7KOWJPsMTJrakS60eVOqCDfj+qeD6Xam4DgPMjjGsI=;
        b=MsDjvx0Gbw8kkh++c34z8Q4CjJpxNXDMmHM7wCVT1tLzlOhuhknbhTIz9/nyhHMcXc
         yfEfnPkDscy/f85DvA3klXO/7K1ysW8C1tCdw7gKWxcuhAVS8FTVaQtipNCd+Fz1FiL+
         bfZqJ/QZCIHDLqnHnB3TlUjuISR6yk30Ws1YEP74mUr3fNd5mZ4cjcrsLpdvC/zy0cSK
         Y6QMDzkR/xqYAZOzV8eP65/ENqylIFJzuJvB0u90jYmzj8AGgI59LOewPJ/IDpWZ3IkY
         e1HKKCP6eJrb8IwHMTU7maHF93O03soO52E/gRSpHqjv3aRuDnYqDeS0Gzl+BZSmhP8n
         0Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780072143; x=1780676943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q7KOWJPsMTJrakS60eVOqCDfj+qeD6Xam4DgPMjjGsI=;
        b=GDbQ3TpgU3VrXpF7YcTHJtjEybu5GavsF6RLiAyGIqrkS50KqeASo/104+X5xHLnYj
         am4lg+X8UK1eYFflHhqcMBFYwEdfAMxS7Z+VOVaa9U6FdhB+pyITVeiv+law5ffQNcV6
         dfCn3anocKgsGRvyca0BBzzg6+AsTu8XNraOfbnYSPquMhWXB9AyR1eadRJOBfpaPmte
         MDyf+0K7+vHTEbVaCcXglHBl41gAetwawTzgo14Y+bXY7Yll+bKqXWndMMfmJrkIl0wx
         jmA+IpLww4h0aaJEo8ATXarCN5GwvGZ1baVeDzyGK40SkdRfL67hOrDXGlg8w0YXjyos
         FlBw==
X-Forwarded-Encrypted: i=1; AFNElJ+Hbjqgy26NpOpiDLwTd6njMbPrXP/kX1ubN++9TynW3pYA0APr1iDYnty1vi2mkILScMg55BPsxPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUNV3QG3KqGGVLOC0LP14R/BDiqamUK+1Jj1RCcbvn2UaOT+eh
	PU5l5Ohb8uKHjdONri5Eo7Hu0PIu9Iwvk18UM1rEn3Ow+SlcHn4/Cv6yZ/DhKWv9mJshSP8AuAS
	WkQy8C7sy84a2eZc/tTlSnWFMpv9qJTLZFp5g1gvK
X-Gm-Gg: Acq92OHhuiXF0/ZZ7K2ugqmp3/tYqMWWO9c09CD03c8QRFnzf4ec47yNYxbEIMGMwqZ
	m/Qq+fQWu9nNDDc7ssOXUITCENurachyk1ydB5y+s6JgjVD84aw7Lvq3WLQ7P/YctsGsMBsDo6O
	6e8m3l6o6O2rIHutOj0x7g544g1XML2VNgB5aH36aZVCG3pzGRzp2rWEnXa+keahg4dcab+i0om
	veki9+44iA3m+JltV4YpieH1xyeykTe1Y2UNXBavHVNfWdaxRlWzAii8ko8g8f4ifEhSTZBt0DK
	8Uf03jWJUS7iBIDxaw==
X-Received: by 2002:a05:6102:3ece:b0:631:8665:3511 with SMTP id
 ada2fe7eead31-6bf422b40eemr1931039137.30.1780072142599; Fri, 29 May 2026
 09:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
In-Reply-To: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 29 May 2026 09:28:51 -0700
X-Gm-Features: AVHnY4Jr6H03OfHaWFJtqrsbD1DMvlU60lxKSdJGu2BseUWECJcMyHSM0OqmjvQ
Message-ID: <CAFhGd8pOWHnZHH7R5KBspj+o1Bfrbk9sXeNj2X48VB+nYPBAnw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update ndesaulniers
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, Will Deacon <will@kernel.org>, 
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	gosst-kernel <gosst-kernel@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, 
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 28, 2026 at 2:38=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> I'm coming back.  I will return.  I will possess your body, and I'll
> make LKML burn.

:0

>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  .mailmap                                                               |=
 1 -
>  Documentation/process/embargoed-hardware-issues.rst                    |=
 2 +-
>  Documentation/translations/sp_SP/process/embargoed-hardware-issues.rst |=
 2 +-
>  MAINTAINERS                                                            |=
 2 +-
>  4 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/.mailmap b/.mailmap
> index a009f73d7ea5..f863781b0102 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -634,7 +634,6 @@ Nicholas Piggin <npiggin@gmail.com> <npiggin@kernel.d=
k>
>  Nicholas Piggin <npiggin@gmail.com> <npiggin@suse.de>
>  Nicholas Piggin <npiggin@gmail.com> <nickpiggin@yahoo.com.au>
>  Nicholas Piggin <npiggin@gmail.com> <piggin@cyberone.com.au>
> -Nick Desaulniers <nick.desaulniers+lkml@gmail.com> <ndesaulniers@google.=
com>
>  Nicolas Ferre <nicolas.ferre@microchip.com> <nicolas.ferre@atmel.com>
>  Nicolas Pitre <nico@fluxnic.net> <nicolas.pitre@linaro.org>
>  Nicolas Pitre <nico@fluxnic.net> <nico@linaro.org>
> diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Docume=
ntation/process/embargoed-hardware-issues.rst
> index 34e00848e0da..d07f16c3c7b8 100644
> --- a/Documentation/process/embargoed-hardware-issues.rst
> +++ b/Documentation/process/embargoed-hardware-issues.rst
> @@ -308,7 +308,7 @@ an involved disclosed party. The current ambassadors =
list:
>
>    Google       Kees Cook <keescook@chromium.org>
>
> -  LLVM         Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +  LLVM         Nick Desaulniers <ndesaulniers@google.com>
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  If you want your organization to be added to the ambassadors list, pleas=
e
> diff --git a/Documentation/translations/sp_SP/process/embargoed-hardware-=
issues.rst b/Documentation/translations/sp_SP/process/embargoed-hardware-is=
sues.rst
> index 9d444b9c46d3..7d4d694967c7 100644
> --- a/Documentation/translations/sp_SP/process/embargoed-hardware-issues.=
rst
> +++ b/Documentation/translations/sp_SP/process/embargoed-hardware-issues.=
rst
> @@ -287,7 +287,7 @@ revelada involucrada. La lista de embajadores actuale=
s:
>
>    Google       Kees Cook <keescook@chromium.org>
>
> -  LLVM         Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +  LLVM         Nick Desaulniers <ndesaulniers@google.com>
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  Si quiere que su organizaci=C3=B3n se a=C3=B1ada a la lista de embajador=
es, por
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 461a3eed6129..2f06cc2e463c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6259,7 +6259,7 @@ F:        .clang-format
>
>  CLANG/LLVM BUILD SUPPORT
>  M:     Nathan Chancellor <nathan@kernel.org>
> -R:     Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +R:     Nick Desaulniers <ndesaulniers@google.com>
>  R:     Bill Wendling <morbo@google.com>
>  R:     Justin Stitt <justinstitt@google.com>
>  L:     llvm@lists.linux.dev
>
> ---
> base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
> change-id: 20260528-im_back_baby-1ade32dc049e
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>

Justin

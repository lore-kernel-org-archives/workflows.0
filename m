Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD96C37BE85
	for <workflows@vger.kernel.org>; Fri, 29 May 2026 20:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085916; cv=pass; b=kaK4ksDaR1VLy6tR6I186qVNU1lVOg/RnPzC57ZVWJvGZp15y93VoOZnDjvTfuEix39dsjc6StDvDuoLwEfSl0RT24Po613ZMP7L6VaG2LXWxVKnaVosZ05tDouNN19MGZ4nKPuZD/OZAEbcvEPotFjzV3ez0XH8CIbFPq7sRrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085916; c=relaxed/simple;
	bh=4shjJrvziMCOaEg+cmflj8Sk8Is4R3jYebiTCFnLGKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4QyqbVhgr0f/Qa/0TkGn9lzQrpRdCbX/ocDj+BUJk+sThWNLofia9unDQMzfY7lMGeXxjGjAhkVdwL+EoyjelWdyg7/8UTN99Bq7C75s8iOiqgNTrfTECFFAjVE+8Plg4bdc08dwK/fLv8ZtINlKg5KWtNfZ8eUzQnMkw26tCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OFrHQiSv; arc=pass smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OFrHQiSv"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-57611a6a69eso4411785e0c.3
        for <workflows@vger.kernel.org>; Fri, 29 May 2026 13:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780085914; cv=none;
        d=google.com; s=arc-20240605;
        b=gZndjCECGVmvpLIYJEM2PRyAQkeJa2t6S33vFzOAsgcbYBd+aYSbpYb6bIx+e762EE
         mXXIpHKbkjvAUsa+NLGFRm18pMWCIMqzhrksrEgxvcjA0E3pOqH7qZEEu0YRTqlzgs6X
         ZRWnJSkXZPrehNiDKAgQyQUArQV8e5G8iAs4idfqAQev1Y0Y3l/aSMmtx1YeDncwhpnd
         DhCx2ER3yHW7E1AzIpZ/INGHtie+3jFVZYH7HJl5GaNqZk9F4juZezorFm158g86cKNO
         i61lG6wgLuFheKIVzc90H1kOcvcON2oP4hqLaBiV+lUlc7Ags4hK/D4mhx9rUfH7dBP0
         y0Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fktl7DTa3sGhJzyHKwHcWCtFcQfZn8hMM9bbV6Mu/is=;
        fh=F2Ydq5/uuSyGm9Cn1YqN7i2dVenCnGY+kIBfpcEyKQA=;
        b=YHgserW/QwIcPNLlf1HAShpEDQgK/4P16p7bTcB2gQ0LlPea1NYmY+D1ghmsM6Xvps
         IkIEsj+kaPrPKiMOLYLI9feilLccrYzq9AtKEfHSNOrJvWaMB9mmESK/ipRnWC8yx9zL
         HI4GR3aNP3wF4FpptMhzEM67X1JY/G6QE1f3awYx5DGypEQTBivtbVfk9Z6WqcPFFu5o
         PcKi87ZDtb58/wAY5mbelGkxp6ECh+jcp9Ml59VBZlQRmC656Hv0wmZld+neFOWmM5cA
         YEGVs8ILNHdGB6tspZXTnJAXYdCsJo0s7eNrt5jH84Ve5a+WqnYc/gk3pIjj48vTZipL
         vDEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780085914; x=1780690714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fktl7DTa3sGhJzyHKwHcWCtFcQfZn8hMM9bbV6Mu/is=;
        b=OFrHQiSvP4YCVyU7zY1Ic7kjQNF0cfp1vBe2m3qj06EVEpAf9XJfyCL97ZEzIdgU+g
         km62NTZJLSskUl5N8TO2CXfilws+ZzPsFwv0y+xNOVm+8az6DqZJeBCc7jATIM9YMMiR
         ASGooCjVU6jzaSewhEvEzfCWSRfnM4+xjdnkmeCe93np3tdxUAMb9UN1Uv99H496gXpP
         bbV7SiHGF2MsJrDBEMGA1gEV3EKTQbqTZGdUmZRWjv1u+iqVi4t187g4uxrG6lN4UXfm
         fZ7g+2lGg8Hwyu0DZFAxRyMOLZECWiwnwk4Ov1FwamsSg6Jj66ugq6UOtbOHEuv5GOzj
         6Mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780085914; x=1780690714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fktl7DTa3sGhJzyHKwHcWCtFcQfZn8hMM9bbV6Mu/is=;
        b=Y3pJmTyMJChmo7neXxxa0dx4Agc+AKCIXBmyDomMwsfSR71dq38Mm3V81d/8eF+IMB
         GTRCSCMsvQdhZPO1s8hABtTofys3F6uutCP/ul/bTx4vjqkLOvjfTyTzWzNRw4G1SqMG
         pVvZUudb6ht2EUIUTXRHK10DFbBLJEHCe7nx03gdjWKoQ15SlOxt20AY9xISFn05HRKK
         13EeJeF0KD5ZeOZPoBOaDmVaJBg101xjZochWkVjnjEziqFvTaJNFPzCuwdCEpZiZgNQ
         AeqvwXODgYECpVOtnnePqN76RhjK6Mq30t3DQG+5CDgKokfzhP6XZoBSObdMbGG2voin
         mLWg==
X-Forwarded-Encrypted: i=1; AFNElJ/qus9B23NbwFnq/AvaxBJaLloS/gqr34phT3BrfLDuvLMf4/dw+W6g7I8t7QRyL9oY6IMFwjjDeFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/+UCPUequF/jHuBjR4E50h5XIeD7qgWJpInvVT3wJ7/iqQhPX
	v181kIn6Ct9fD9WNifVzmZ4A09IcUgcmv21pjgYSOQ3Re9udp7dUiVXP0Th6ZSv9yjd8IqvHRJ4
	WqLDsaNqspgUP8TDqGw7V8QCUKk59s/Ng8OhDFZg=
X-Gm-Gg: Acq92OEo7RaYILtUYQArsxFVxt78IFb1gXkYfWZ0j4Lr0t1CzsJcTOU3QmZTd+Y3azx
	MPRX7I719eL1rbcT0ngzxQ/I+XPaxDxE59I9WRUAHkm1/Qf26w1vyskdWpqmZsMD6lG00drQ3Se
	flQ/nchCtkMCgGd0Fco2jP87sz3kePP0HXTa4swMTQg4x6JRN4XHwPr+sdWpiQOVy8o/i4tA9R3
	rreFUJI54snkCMGjF1npM2RiqneQRKPhsJeKSIW3n/D+mCyB0ZcY92IwTBIqRSa7bV3M5+ZElqM
	/RFikMi++SobcdAX0PGmV7mkz3YDcrtlxA16X6nHDajmnJPEJ2aJMi593tA=
X-Received: by 2002:a05:6122:4d8b:b0:59b:1012:3f26 with SMTP id
 71dfb90a1353d-59be9d567a3mr540327e0c.0.1780085913427; Fri, 29 May 2026
 13:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
In-Reply-To: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
From: Bill Wendling <morbo@google.com>
Date: Fri, 29 May 2026 13:18:16 -0700
X-Gm-Features: AVHnY4Jk3Oh6mj1Uh1YuwCnLVI-rIUfHv3S_D4s-m3C-uGvZSHpg8R8WgON19Qs
Message-ID: <CAGG=3QUcorKStoM+cYZ3tWGtCxrTxVz7b9HycKBMk=zmgm+V5Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update ndesaulniers
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	gosst-kernel <gosst-kernel@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, 
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 2:38=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> I'm coming back.  I will return.  I will possess your body, and I'll
> make LKML burn.
>

I have the fire, I have the force
I have the power to make my evil take its course

-bw

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

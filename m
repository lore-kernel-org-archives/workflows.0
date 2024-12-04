Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BB4202C3F
	for <workflows@vger.kernel.org>; Wed,  4 Dec 2024 23:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733353666; cv=none; b=rgeENvTPfdLgwuSjKKyXV4OUjqbCQQ5cCY9pVxFw9iRrs+P1vxTP8AlSzzWjnZ3x3Sf0UpEXcFi6xLV0s9mTShMfOBk31NsQ3PS85Oh+rCOzZWxbuANMSTYfpMvD/Xkmwy8NxrLughQABSurY3V+cdMIfQ7lm6qfhMPwkNeAw/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733353666; c=relaxed/simple;
	bh=dp6g/Bz2+KGQRtp1f56uI+qAkNeYW1oxVHGPNZWp3Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r/PQ6hKaI14SPyIXlYrcRqurqqEWpK7YX3Z5dFBURaY4qoRZX48a6wcTwAp2cKUzhfOPUu5uBdiXcQXZq/enTxosGGRf5YGcwCK0Pub8sQm6PaxJh4Wa87Ik4tT76CbgOAd6rPcqpd/rCcAwKmIKThVff4HVTN/ohxSqXhisQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BkA4YIg3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BkA4YIg3"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e152731d0so1249822e87.0
        for <workflows@vger.kernel.org>; Wed, 04 Dec 2024 15:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733353661; x=1733958461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGqvSPZ3QIpZsykiZguhFk0cjVECVeKJ3q4DQqsIrHY=;
        b=BkA4YIg3k16PdfIpiJdFMKg0jhpxajxcV8CdDwVIE35bknfmYcIlPUZstY6k0c5tmp
         BXvoP9pYen1WcHaUhvXZABcMP/su6GRLfblHbi6LA8nBlWpmmy1JsZNIFswFF/3eBFEz
         2GvpztQiU7TlfVY5NVPeVx4PwrIjPFxVBSSKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733353661; x=1733958461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGqvSPZ3QIpZsykiZguhFk0cjVECVeKJ3q4DQqsIrHY=;
        b=tpqC2+XHediUo9vue1BY16ayimXtCEZFuD8D4CcW5iNxxdTDK8nRaM8AGdE/fuAUUa
         VTSkgZL8xNz4pPrChnJOVCqOUD3NiPy2sl6D60h33OitXdfta9frkBikX6wzT+7vItL4
         V1nmkcAfbi+qV5/ZuWfa8KfxAhZx6Cn+Z4BIBYzMJYuC41ekKJLdXg4/rRXM4Vo6bP0Y
         5sGGCp4WhSfvyCBWnh458SusSM+bEYIzYsd+4vLr8XfaLUYj/NzFyKgCqI4V9bxhAnBj
         DCu9g9OFDYueGdaYkfdvGR34oY1W024Na9gGc7y4i+dP5WwxBgfu/uYAClsd8t7dHyUc
         MzkA==
X-Forwarded-Encrypted: i=1; AJvYcCVgUXmHbnI7KXpsqGt4n5Va72Z1bu77foh4X1iEZxxIGbeAsXL+1LSkfcK1iUgWC9OHXoUymZ8qJVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyosY5fxjcjeffQWkaLBTcbRuf+1h1YPj55IUZW1kVOJLvwYSNy
	u741kygteZAoiC2e7wluBMLaN5cYLNylrADCj+ubahIYGYoXbFlhxdbQUDXdNcg4ICKhVcixjo+
	rzoqL
X-Gm-Gg: ASbGncsHu/drwbZ4KLJ+lXHefmNnrfCuy9sASiOk5mAH259UthdrtWkzUO/irc5SNMf
	oRQ1YCss3xfz75KEzP9IWbbPf2H5yzRCiCvJ3ILvYnCpFjSZIvrV5E+APSrX/EXxEauVHhnp7xX
	+rR5fE9IXpwjpCsc0SkFPKP3kHZH6lXBQMObztbrNwLye6X1SedMtwumv4kgHt2Qo75rzzUsYWB
	doYn0c+4H/LC8OEbagoUTTaXHHM0REJulUQzT/V27nYUU/HJKG8PEBnP8QVClJMNdZQrnYdtRyi
	ILM5W2L5awI0gQ==
X-Google-Smtp-Source: AGHT+IH9MqemSmPg3cwcctU3ivddkDlvEfQIm0+6cMcXxqEVDLw+ycppIlayaxRQVbT2ZEQ227YNrg==
X-Received: by 2002:a05:6512:304b:b0:53d:f90b:6da2 with SMTP id 2adb3069b0e04-53e216f02e5mr307687e87.1.1733353660826;
        Wed, 04 Dec 2024 15:07:40 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22947427sm31719e87.32.2024.12.04.15.07.39
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 15:07:39 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e152731d0so1249795e87.0
        for <workflows@vger.kernel.org>; Wed, 04 Dec 2024 15:07:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0SWa75kZlmmaIBhko13y7czWd9FI13NQNY6F6UTzQ04uIkK5dcQqoSGblSH2JIeADt9FEGuGyo0s=@vger.kernel.org
X-Received: by 2002:a05:6512:2392:b0:53d:f73c:d630 with SMTP id
 2adb3069b0e04-53e21702ca6mr365280e87.14.1733353659083; Wed, 04 Dec 2024
 15:07:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204221720.66146-1-rdunlap@infradead.org>
In-Reply-To: <20241204221720.66146-1-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Dec 2024 15:07:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
Message-ID: <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
Subject: Re: [PATCH] Documentation: move dev-tools debugging files to process/debugging/
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Jonathan Corbet <corbet@lwn.net>, 
	workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <danielt@kernel.org>, linux-debuggers@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 4, 2024 at 2:17=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Move gdb and kgdb debugging documentation to the dedicated
> debugging directory (Documentation/process/debugging/).
> Adjust the index.rst files to follow the file movement.
> Update location of kgdb.rst in MAINTAINERS file.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: workflows@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-debuggers@vger.kernel.org
> Cc: kgdb-bugreport@lists.sourceforge.net
> ---
>  Documentation/dev-tools/index.rst                                       =
| 2 --
>  Documentation/{dev-tools =3D> process/debugging}/gdb-kernel-debugging.rs=
t | 0

After applying your patch and doing `git grep
gdb-kernel-debugging.rst`, I still see several references to the old
location. Those should be updated as part of this patch, right?



>  Documentation/process/debugging/index.rst                               =
| 2 ++
>  Documentation/{dev-tools =3D> process/debugging}/kgdb.rst               =
  | 0

Similarly `git grep kgdb.rst` still has several references to the old locat=
ion.

>  MAINTAINERS                                                             =
| 2 +-
>  5 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/=
index.rst
> index 3c0ac08b2709..c1e73e75f551 100644
> --- a/Documentation/dev-tools/index.rst
> +++ b/Documentation/dev-tools/index.rst
> @@ -27,8 +27,6 @@ Documentation/dev-tools/testing-overview.rst
>     kmemleak
>     kcsan
>     kfence
> -   gdb-kernel-debugging
> -   kgdb
>     kselftest
>     kunit/index
>     ktap
> diff --git a/Documentation/dev-tools/gdb-kernel-debugging.rst b/Documenta=
tion/process/debugging/gdb-kernel-debugging.rst
> similarity index 100%
> rename from Documentation/dev-tools/gdb-kernel-debugging.rst
> rename to Documentation/process/debugging/gdb-kernel-debugging.rst
> diff --git a/Documentation/process/debugging/index.rst b/Documentation/pr=
ocess/debugging/index.rst
> index f6e4a00dfee3..bc4a816e3d32 100644
> --- a/Documentation/process/debugging/index.rst
> +++ b/Documentation/process/debugging/index.rst
> @@ -12,6 +12,8 @@ general guides
>
>     driver_development_debugging_guide
>     userspace_debugging_guide
> +   gdb-kernel-debugging
> +   kgdb

Should the list above be kept alphabetical. The list you removed these
entries from was _almost_ alphabetical...

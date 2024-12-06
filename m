Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EF5149C51
	for <workflows@vger.kernel.org>; Fri,  6 Dec 2024 15:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733498829; cv=none; b=B0vLffsJqCINihHyJ/Sro8BZw6fRW17pmRjP2CdtpJsWWga2H08lQ6ueGfac3ep6ZY81f+iPzmsQxJs9UCQKFXziHi82ncPcMwFVh/EGpuDR9ycIWPD3vFqwEV6n4fEM1oy69pBV8RbZJe/mX+jUGAxwqB/D+e5aRmHR/sXXcKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733498829; c=relaxed/simple;
	bh=DZ4iBJ/iWM8KSa7H29avWC680AIZt2rf5AWA6M/3SAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Umaq3skmvVYTMAVC0ybcwsSArQoKGEUfPwYWR+1BHm6HNeiGRJIZw6ouiqU+nG2ZpBiprq7QzVf3JfOWOr6Wq/VJV9lBdWFJGnkDIcz/+vftXLCR+3TdZZzQAsPUly6Y8Wm5yrgZ8UMnrlGUDaNlJmzdERlU46E7R4fQAGGOIik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lWc1IZGV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lWc1IZGV"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53de771c5ebso2084196e87.2
        for <workflows@vger.kernel.org>; Fri, 06 Dec 2024 07:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733498823; x=1734103623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZUn4bZBalbJgAp7xW/bITYcNU46rh/GtC4lpWqRHs4=;
        b=lWc1IZGVzgOULjBdDUf0VtaAnKBv0FVAimNIfEeHXlM2QTWDx2jh6GPeqb0pXGqnfv
         xh6ReG38HIO5eZf3Yp6EncXUJEBwcu3jKSiuirc7LRnqmeJ9F9k2W5MejbCY9ETw1i1Z
         52yzARay2ZoyTNtsbHW/ZGDChD5OxraA+1o/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733498823; x=1734103623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZUn4bZBalbJgAp7xW/bITYcNU46rh/GtC4lpWqRHs4=;
        b=ste8SEkg6LLLpqvbnsUpDitNWykBdW1OBzd/mIN+u/8dp17RtsKt5WhN4r17ojbKKt
         pNRZKwVX4cQcx9H6qYjPw+FwesQsTZY4u6LZZGPfi5R3GEIEekXzv2SjEEOuTEinOoAM
         7zVWFyoMGfzqV0/+ZD+xK8rUDanzz929/PAbmepaEgmz5bYmLtDCqKBVx1EXqi1SQVkR
         JiTgo+RdRCmGQv6xjFmxD5caXBQEnWFPytkGPODaq2Zeg+8Eud2QOO4b6miU6w58wHBs
         /IRJZUd3ATpbKwxx73wOw9glMEzo4reVzJ/C5YxROIlcOF5SUyYc+zuldTvhBxLjRNXd
         1Osw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ7v0PxLUrk3eBkO7wCbXmr+jrlTx3Rt9kTALXL7pyMdkKPZ2OTfcl6QWtc/9yQGbJIa2p0celZ1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqbg+9mspMYmuZt91aJ72PbEEcqnV1UGiIkF/JUNdu/R+T1bpr
	GSFLIaNDXQPFP5Q1+UGchdN/fx6hsJEdRWTgjKq6AbjzB+we2xDcNV7CFUIzIhWMapbyJJMOfAn
	3QA==
X-Gm-Gg: ASbGnctrI01IT2dAp2rojz1ebG5cVfS1aiMyr4v5Wvlj2zHMopoeuM4B3v9CxyzIpG1
	gM4JoL/k/J1dajQuYKBRGSNKFU8YNh9Z7BT7LgrMWiUA9RSluQdtaof0vjfl46Oa6faGdVXjNxX
	8WCff+qCe4u8znvmILMbmRzc1DQOcWTcBGMUZlKHY5ROtNCGc5HHSZepc537BGHJ1JCxhSFOABA
	FC9JF6WpEQNam84POgpnkEHLeczZIRxI9L3eEAyy/NWCAvkWI8cS7dopmwkXg9OrWNZixvM45vd
	0UP2efvRW2L2IWY6fw==
X-Google-Smtp-Source: AGHT+IFoY5A9t93eN7C1ygoSL7xit5ohX9lhb+Q+vPKqroi4bNkdz0qJ3Qb2lUSJo8I+X3c82pvWXQ==
X-Received: by 2002:a05:6512:12c8:b0:53e:368c:ac4b with SMTP id 2adb3069b0e04-53e368cad34mr678108e87.1.1733498823085;
        Fri, 06 Dec 2024 07:27:03 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e2294734bsm528970e87.51.2024.12.06.07.27.02
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 07:27:02 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ffc81cee68so17478091fa.0
        for <workflows@vger.kernel.org>; Fri, 06 Dec 2024 07:27:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWav/+U2l5Yd5n9FeiO8pBtGsUnxFXIEiGqce8Cd2r9qTgJpxaAQy2EWbvdJjn24UtB1GRk2B2NpTA=@vger.kernel.org
X-Received: by 2002:a05:651c:2119:b0:300:18ed:4313 with SMTP id
 38308e7fff4ca-3002f8bd5ecmr10190331fa.9.1733498821759; Fri, 06 Dec 2024
 07:27:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206003100.38142-1-rdunlap@infradead.org>
In-Reply-To: <20241206003100.38142-1-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Dec 2024 07:26:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WzC=AA7MVX_qN1fsPL3Y8JA__0_cL5UWGoea0kJj5PVQ@mail.gmail.com>
Message-ID: <CAD=FV=WzC=AA7MVX_qN1fsPL3Y8JA__0_cL5UWGoea0kJj5PVQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: move dev-tools debugging files to process/debugging/
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Jonathan Corbet <corbet@lwn.net>, 
	workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <danielt@kernel.org>, linux-debuggers@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 5, 2024 at 4:31=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Move gdb and kgdb debugging documentation to the dedicated
> debugging directory (Documentation/process/debugging/).
> Adjust the index.rst files to follow the file movement.
> Adjust files that refer to these moved files to follow the file movement.
> Update location of kgdb.rst in MAINTAINERS file.
>
> Note: translations are not updated.
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
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Yanteng Si <siyanteng@loongson.cn>
> Cc: Hu Haowen <2023002089@link.tyut.edu.cn>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-serial@vger.kernel.org
> ---
> v2: Make process/debugging/index alpha by filename.
>     Update references to the moved files.
>
>  Documentation/admin-guide/README.rst                                  | =
4 ++--
>  Documentation/dev-tools/index.rst                                     | =
2 --
>  .../{dev-tools =3D> process/debugging}/gdb-kernel-debugging.rst         =
| 0
>  Documentation/process/debugging/index.rst                             | =
2 ++
>  Documentation/{dev-tools =3D> process/debugging}/kgdb.rst               =
| 0
>  MAINTAINERS                                                           | =
2 +-
>  include/linux/tty_driver.h                                            | =
2 +-
>  lib/Kconfig.debug                                                     | =
2 +-
>  lib/Kconfig.kgdb                                                      | =
2 +-
>  9 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

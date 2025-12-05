Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78935339B20
	for <workflows@vger.kernel.org>; Fri,  5 Dec 2025 15:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764948806; cv=none; b=cDVUvHu892hZe10t0dVRwlhsvwUI/kG5l1ZXbA8W1VkuM85FAFMWNmzy1MnA+prUg2mDrzHIftRvIkcxlWOujgJcDlK4m3jhynrtTJU+1ueP57w+gogjlSeeNdGN/G84RhgwC1j+XXKfs2PfMpWe9Ibv7X3x98WDdgZkVK0mUGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764948806; c=relaxed/simple;
	bh=uriUt+w4PSoBXDDAW6w1jxXm60/AaOp3dSZv21zdcHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F7vG7Uy+Nxi1mvJGNRB1kogV+f8a2NC1fhFa5OlF0t4S2aklmQQCDKm/WHjkfz76zHGZ09sCS35vyuYwS5OXnaMepObPIj6R8wZXkzdYdA2sYuny/GmCtpol+Er0FoHpFBnEfmv8Q1UOraZqSHzmdw6AAWmgtgShgz8ZS0Ip0zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mlDs9zD4; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mlDs9zD4"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47796a837c7so19031365e9.0
        for <workflows@vger.kernel.org>; Fri, 05 Dec 2025 07:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764948797; x=1765553597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HvjppReCrCrxS3kDDkBx4Pr9nzXm5T4z6OxhhwoEdqQ=;
        b=mlDs9zD4Ej4lCf1vklAK8qWQ+1zFonFIdz/cj7dX4x0s9IcAnzcqrvOWMvQhRYpxqy
         Hr0ar8TdudVksI4h9A/U5tQxqNnQNzepMa9vFgmTaUgD0i0bpG/XoePCMfhmE4nzqcl2
         4rNOSMP20YSBfx7E7hXq9nfjDQbBoQPUfvc8QVtiCCZx4R9IgXDRYPo4v5tbsQmAgL70
         0MnH6aUszf3vQcYzQeyYKmSg0zRtykeWWQ0RPcWUo1TybuJUDzro3vrwiaVcrnj0vDNa
         RdzpNR+7ZnmF4woD0iMeMR3Av2tP0wWEAU6kuN6KS1+65c1IRW8q6W14NFi7agowYW5y
         Iwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764948797; x=1765553597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvjppReCrCrxS3kDDkBx4Pr9nzXm5T4z6OxhhwoEdqQ=;
        b=TEbGs/QWdpca2ABlbIPK54EWEV60Eox5klKM3RbO+GRSh7e+GK2jhhL4fJZKTpWiZw
         rwpSF8jJZ74Ki1V3n5skN+aB+sovQ5JfNrvShNSRln9lJVd18v3xHIXCt+R1S4sRKmkc
         2zjlG+dtNyHPK3RU5NMM5BaW0LSwZ/Wdbr4BD4XCTvvvFW1qceOmP8j+cyExC4SDAC+t
         t4Q6UcwAJWEtASbctERsKUp4S3nKKff3RNclD8Z1jBiAS6BiDS4blIEJ5N4q2g7febZy
         SKOluGb1DDe77BKS2+5v+DTpSUuOcq+xKp8oo1g9MUcMHCYce8WE0ssseghoZYXP+ffc
         o3MA==
X-Forwarded-Encrypted: i=1; AJvYcCXN+nFb1+4640YMBeFFbZ/9L+u5a4oyTCIjgyGBNQ/UP9cYXnrNmgHNLHqTg8DR9dI8TY09MUeeWbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXqlgvN5Shrqbvk5VNcOMJTV7Gz5TCa7KAcKAnIsazlr/Vft+
	+HAC86Cchkl9/HSckBmAgabt1I2F4sGiKliR5M1+HQyOqM/55qS1osx6ZSrJdJFxIEQ=
X-Gm-Gg: ASbGncsCMe2zTxPS8ZwjYIugmU4oJwAt2rUKEeZgLWONOHi33/TrchFe8je7bUyymfu
	/1E4YDm5ZjzLwpJBT/9ULrsWEKjKjFdFzQqd0rIxy27uBwAKtDSKxxvV/JrS7TNuiNkWzkeKSe0
	+wIKYZJl4FPNuSY90OzpqLdl+HdsV0rRGs6giNWiei8DjnEhmNC/QO8LFEDaSDztBF6jBbZfcfr
	xcRyojVMXGhjJW/xDVNlbPixP3floWyjISDZEvNeUKIlj1TPSBv2V8DofjsEY+xRWjP2P6vYxK+
	9ypf6lq/+5x62SNncrNB4NPUCXb9Br/2fRV8MJw4xXoKZy97RMsUKNusHjTrVWotJbmPneP7rMM
	ofvGpSK+txrIQ4Lt/0PbIpnfklMSjlAs6yTRpRfvObuxOv5f3Kdc8TINsMR0xS/3szLOBdA/wxb
	eNMSQgjWU7pUH/sMkId/kU5U07tHwQCdtrSKRbt+1yf+Ol0DxytrfL2qneo92IjnUWEVYQ3Hlk4
	fSA2PP+Quo9
X-Google-Smtp-Source: AGHT+IFnGLCKOJrUV86aJjqBa8op0ySObk5Ne+xxXjyfaoT7PEDgfBBZfngK+ni+cuHs0WzGXjHCmA==
X-Received: by 2002:a05:600c:1ca4:b0:477:63dc:be00 with SMTP id 5b1f17b1804b1-4792af404d2mr113979475e9.25.1764948796743;
        Fri, 05 Dec 2025 07:33:16 -0800 (PST)
Received: from localhost (p200300f65f0066080f2a7d55dcab4de7.dip0.t-ipconnect.de. [2003:f6:5f00:6608:f2a:7d55:dcab:4de7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479311fbaf4sm82770205e9.15.2025.12.05.07.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 07:33:16 -0800 (PST)
Date: Fri, 5 Dec 2025 16:33:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Improve wording on requirements for a
 free Nitrokey
Message-ID: <j6mj6stlk4ojprdpfvoa35ghsfics5wou4nh3khymmb2aiqxbr@73jzs33sbyly>
References: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>
 <aTIP2Wqspl-jfm7M@archie.me>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vtqngrwcuzhli2ps"
Content-Disposition: inline
In-Reply-To: <aTIP2Wqspl-jfm7M@archie.me>


--vtqngrwcuzhli2ps
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Documentation: Improve wording on requirements for a
 free Nitrokey
MIME-Version: 1.0

Hello,

On Fri, Dec 05, 2025 at 05:48:57AM +0700, Bagas Sanjaya wrote:
> On Wed, Dec 03, 2025 at 08:43:47AM +0100, Uwe Kleine-K=F6nig wrote:
> > diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documenta=
tion/process/maintainer-pgp-guide.rst
> > index b6919bf606c3..2e4da3de25d4 100644
> > --- a/Documentation/process/maintainer-pgp-guide.rst
> > +++ b/Documentation/process/maintainer-pgp-guide.rst
> > @@ -405,8 +405,8 @@ geographical region, and open/proprietary hardware =
considerations.
> > =20
> >  .. note::
> > =20
> > -    If you are listed in MAINTAINERS or have an account at kernel.org,
> > -    you `qualify for a free Nitrokey Start`_ courtesy of The Linux
> > +    If you are listed in an `M:` entry in MAINTAINERS or have an accou=
nt at
> i.e. being listed as a maintainer?

Yes, that seems to be the criteria. This was at least the explanation
when a coworker with an R: entry wasn't able to apply (and the error
message gives no hint about the problem then).

> > +    kernel.org, you `qualify for a free Nitrokey Start`_ courtesy of T=
he Linux
> >      Foundation.

Best regards
Uwe

--vtqngrwcuzhli2ps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmky+zkACgkQj4D7WH0S
/k7fRAgAu9daZwZT9Ip2xOeM/w1hNbVH4jYmAXzyMdo4aHSLgOOSNOXdj9mB8dMP
A6me4gwkAAbWLtJlExAl6wPwaNtTv6WobMPnNbm9Hfiee+hTjlB5OJmfgg5OKZYE
X7BVivj2MB12/jHWciUJj/m5u5G9EJJL/lUWSrdlxiEzl9ikubbFz55AKtweXSNb
DlwRMqlrZ2Wt+iXYNOmSS5xadT7Er0+D7s4sYHSbYz13raabzv/7G/p5oFpJicPo
ZBYAqtpfT/Y+aOOkic56/vlfLFFD0H9/itQBDI1TDn450dxmXPwKh01+kkyVNhGd
hVgzZjfyza9NAk+M/Qk3QZie4guEGg==
=c3w1
-----END PGP SIGNATURE-----

--vtqngrwcuzhli2ps--

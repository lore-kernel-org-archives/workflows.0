Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2989B398FB9
	for <workflows@vger.kernel.org>; Thu,  4 Dec 2025 22:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764888544; cv=none; b=nVNbDEvuHZIbeNh+bLLxC9X2Ewq7bUJL8D2VmhjPY0cgg2cbJRsmfNEM01gGt9Rp7b9cO96QLeAmXeNh8LrAC6YqZoSYW7ioDJQNmnjPT03/hkLDgfNSKmASpEhxrLoD5f1g67Q1A0Vjd/9lf2QDANV1uvJNsYJZ3Vj1MdP3MWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764888544; c=relaxed/simple;
	bh=PYaDER4kUD8JYoIbl/1d/0CikCuZKnvCluZFc/ZmVFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngIAtX+NnFeHyNSIzGU0+GiqfNnvYvcE0xXpzMpziS2uGkpU8ZLp4JtPzGx4gslT5qc8SM2UgXzIs+tMXe54winT24aTH47ihZ0gOL+kSX81bAnPh74NpMzNXkgkD/5U4AVGg+By6fp1TmBzxzJt+K1WpEIQrajLbfAJgRa4K/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtgORKoH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtgORKoH"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297dc3e299bso14048335ad.1
        for <workflows@vger.kernel.org>; Thu, 04 Dec 2025 14:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764888542; x=1765493342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zVei56FOpuyQ7mQPdGirhT103uEmwv58V22f2NHOUOY=;
        b=OtgORKoHtTQbwtanTau/KOWEpUexPWDknBvR+RaXiqc+BJzuyicTOfyqXf4s4nAjrk
         KcPU+VFEmpwvllr3oLh4HGrdJ8meMFqaslHMbQR6yvU8lylvJeJV+a7y3ku1ZjmTJ/xc
         p5Sr4BDCQmY/v39MBzVuXuwp3+0rxzkSZLZvObMHkjju0iLealIM7A2SAsHgGqfV0btA
         ywH9JGqplJzQ/C0SQtagZyhrjB7wVoWTlFnrGXn/yC8Kz2U3UgI+SusZKfLKmwZU2FKw
         7W9ivDJoffVBVT4NcHZCugS57LBuvvST00J4Vs3wpgJoZIcOcMwbarN+t22gIZdYj5Jd
         9Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764888542; x=1765493342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVei56FOpuyQ7mQPdGirhT103uEmwv58V22f2NHOUOY=;
        b=Sfzoe9jEoqofaDcrePvrPl4DWIEpqkP6tE/tuTg8VVMssrIY4n0fTXG2kweWM2ajY9
         MNrqFhPN758DPwl9M5bTMUkWV67ys7yWpZUdrUkE/Gk/nDIcVK44zqPPCYszilK9Rvza
         Bq3BFV8cNnTtQVyt/8K9P5dQM7pWXkbbj7mtMZOZ74Jurgtb/RfvjFR2pB1Yu3EJZFcC
         F3ENdSQi8zz+aAUYWVXo7nJSZkjggXXUQr40beBi2+HCYv9snIvORJsFX0GnQLDlYYf7
         gG0WaLPb0ixAWkf1tGWZ3y0oJARA9/NS58gh6/k5h8tpB2Uw0SO2A8g6vr/NqYuIY6pK
         qj7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9/FOiKwR7f+pOcORlZJGs6W28qqejr+KgE99BI91eOkegZzbAEHS+S27rZeX9+DZuDb7gaPg9CaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx64T6TYyz5vE5cIPXXJkfGvvgKZqt9nTNnxmD0YZ2xnBgRQkPA
	eCEhXKtdAsz9Sfwrq1I9l55UWS6C18RefG6OuwpOUhavvtR+JgSyY1uBxO6Sn2En
X-Gm-Gg: ASbGnctlpbPoMQVGQwX6/u327KUt7VNpnh/RwMH5abd+g8yd2vweovnPY5nPkKBq/lf
	5eHutkTtk8YUChkRxOAXB38pznBn76BlcirehLsw5/+pfmNjkwqeSL5FISHxpUGn7HgyM6QokM8
	Nd9ijadHhYraOVrkV3Ysyk36zmcgYgGBe7yhG3p+TmkO6srlrzE3O3VMTN/5dGSuy1Bs5x28X5P
	fWnymmepmRT6j+hqT51x47ETL4eqalqMHClZzjLVWwhFS74DYvLK+9v7nMfc+hBN/DkfqukXotu
	jkIyfBdsWOcuCXL+TV4ZEoRXjD3XuOY4v5oVeDDO10z4AsQO22zx5BRxMS/AMNUSbtLCKKWIQ/3
	UiC5RygbEyxXx/vkFlrlZMo8zYtu76HCVjWecRyzCqXf3qDv7C6mLmOyeKis5S0USzlWWBiphuH
	X3IfhAHzcMXwbDHjNeYjGAcw==
X-Google-Smtp-Source: AGHT+IFQoGAYZi0lBm/W69LjQ9T1qpJesx8c66GkqhLdefAp9zduT5hbh3AVmgvTLithkjNM323iAg==
X-Received: by 2002:a17:902:f70b:b0:295:2c8e:8e56 with SMTP id d9443c01a7336-29da1ea4cd2mr48041655ad.44.1764888542372;
        Thu, 04 Dec 2025 14:49:02 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaaba21sm29156235ad.70.2025.12.04.14.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 14:49:01 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 3FFE042418BB; Fri, 05 Dec 2025 05:48:58 +0700 (WIB)
Date: Fri, 5 Dec 2025 05:48:57 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Improve wording on requirements for a
 free Nitrokey
Message-ID: <aTIP2Wqspl-jfm7M@archie.me>
References: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O04uzPdzolTUHops"
Content-Disposition: inline
In-Reply-To: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>


--O04uzPdzolTUHops
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 08:43:47AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentati=
on/process/maintainer-pgp-guide.rst
> index b6919bf606c3..2e4da3de25d4 100644
> --- a/Documentation/process/maintainer-pgp-guide.rst
> +++ b/Documentation/process/maintainer-pgp-guide.rst
> @@ -405,8 +405,8 @@ geographical region, and open/proprietary hardware co=
nsiderations.
> =20
>  .. note::
> =20
> -    If you are listed in MAINTAINERS or have an account at kernel.org,
> -    you `qualify for a free Nitrokey Start`_ courtesy of The Linux
> +    If you are listed in an `M:` entry in MAINTAINERS or have an account=
 at
i.e. being listed as a maintainer?
> +    kernel.org, you `qualify for a free Nitrokey Start`_ courtesy of The=
 Linux
>      Foundation.
> =20
>  .. _`Nitrokey Start`: https://www.nitrokey.com/products/nitrokeys
>=20

The text looks good.

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--O04uzPdzolTUHops
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTIP1QAKCRD2uYlJVVFO
o+4WAPkBt8UBsMGFioL71xBpdU15rHOf2x+sCGVvBdHOTukDNwEAxSOzH98bZuVx
fwVTgE+XywqPuZHSSV/FDdAPu7VjnAc=
=h/dI
-----END PGP SIGNATURE-----

--O04uzPdzolTUHops--

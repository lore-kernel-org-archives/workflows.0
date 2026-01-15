Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93425261393
	for <workflows@vger.kernel.org>; Thu, 15 Jan 2026 23:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768520728; cv=none; b=ftnLr2TcumcpGVOtePAbHjlGIVHIrkp05qEnlho/4oSKx+oZUgJhTolkjn0crmKX7wVmeph5QIRtz2/SSr79PDDgJvbTgQXi9T1drArXIAyJZWesx6EI3IW3Pwmd00LChJ0wVSsvvFJ83tqVXSYdwyHRnLjUhDAmg6HE+QB6Olk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768520728; c=relaxed/simple;
	bh=anu0cb12MUsXZDetyUJXmHWS6gx5i4J6kT+HeZDwZ7E=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DC8XQTQuKkmiB/GBtPI2r7lzj5Wz6LkpdiFwc8RagLHIzsIJwn9L7Smk0Aaqv1u6AHg9leEAvCQCZxNq/iuiX+nnSAtLWWIGMFyBh90tak0BKjTSpw8U99dGMSaGJZx+X2JZEAC7HjbEpORtWDsURplA24/QplwvMKsXp5adsQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNC6WO9/; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNC6WO9/"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a09d981507so10196415ad.1
        for <workflows@vger.kernel.org>; Thu, 15 Jan 2026 15:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768520726; x=1769125526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pxBy609TOOX7PEiqMrbm1/JiMEAuCKLzkMf3kkYPtDA=;
        b=PNC6WO9/n9mgliX46Y6vyS1hq8+8wb1ElL1BH9V9Hu6clMYs83H5X4/z+v6uovev3N
         wbF1ABmd/zuGaeTyENQp1nQcGs9BR/Pu3V7SUbU4kRzSczegI44XUBO17AyNZWmghrxn
         ATIUz9M9JkaDES5vJp5WQxPpKps7VA2lcCLuSSj/RuoMZZkFCAhPWaLeZkIS5gESfif5
         KDDXI3cMO6KkP5KUH2wwQnOQjIjoY4fOYBtlppnTRPsZShAxRij4HFzXHvkGMcIzQBU6
         xhRAAOOsPXXsejfFkQEwrSRnIAfKeWcXVvlhU47BMLSxdydTkFxQe/Khw6+fg1GCWJNh
         3IPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520726; x=1769125526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pxBy609TOOX7PEiqMrbm1/JiMEAuCKLzkMf3kkYPtDA=;
        b=JY55+pF3iZ5KkCFhruGVA1LPJQKqGFjGTj6wHVyQzqq/1Jrqhf1v4LMSO6t1iNCq/f
         ys1nI9Wg2kRT9UWh1b9iDocOq2iHsVA2xDxXaR4GmxbPgDIxbIWdKv+8KrlEtRENyLLj
         NDTI0/wN8ENETq3xCNfkJgt1CCOA0zlkbE/IbETw7i0K29S9yViQ82SHo92OynspxVnl
         orHEcHJUScfRSDhBg2JvLEQXfcRWHKDr5mSjlsWqDJaSNCmMxUN8RMUZTXMDG+t66a6L
         I2dZULLBhh3IhnVciW1KVNHC+TDxnmD88+LLKFdIklz7dc50WDwJuZJ6Ymq3Yk7EettB
         1+5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwtcTN43GgAcr07Vl6rpHfCDjV6Mahr7Cz9705tVbOJ7MW7i3YZXDFQHJdomDpgM4LiAW9WvGFhjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiLY/qTYRU85F+FAreE9c2M1Li2wQWNVwPXvEUIjjtIjJfYMs7
	6K4snfkve2wqlCc9DVsWvTmwsf2AsUPMyCS7Hl6If5D3oJkNRv4GWf9jHilny3rG
X-Gm-Gg: AY/fxX7uNiG6gH9VCOYQQwVDpGVpJFqW9U3Lz9/ebJwFulq/oAvxGZrN2ZJj1PsD+ru
	4Yu1OGpLySmsjEDgcdqGFlo2U8jw5fQG8sAgHwutJ3SIJs2JA4iyAB2PAJtkFbQpP6wc6ih4vvq
	aSzNeRVAC0Qn9U9x7fZn3dmnVBCqQIr7oTzVo6VQEs8uXCp1xMqcy8h1pYjYlhLsLDXru+HWHWi
	jh942u1kpIlS6x3lty46FVR30LKPyN3Ak7aiOBXBqflJIZfu2oJlxVA69DNJUob5wRxYZtT5tB2
	AOG2y+/880FsTgqRE8L1Gzfz5BN2UgVgTo1bwg/P+OLp4SfvfEbMDfrdJcGzJapPmyIUvboRUbr
	d0YluygYMjppbJ2CnWyW9d71tc1uR8srcDa7W3f084MNize8PCkKwG1cPcFlUChILHcjtId6sw7
	SWBTdycFuMvu1sTiTJ7g==
X-Received: by 2002:a17:902:e745:b0:2a3:ccf5:6691 with SMTP id d9443c01a7336-2a71782783emr12224645ad.30.1768520725819;
        Thu, 15 Jan 2026 15:45:25 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190eee4fsm3623595ad.42.2026.01.15.15.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:45:24 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 814914207D2D; Fri, 16 Jan 2026 06:45:21 +0700 (WIB)
Date: Fri, 16 Jan 2026 06:45:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Brett A C Sheffield <bacs@librecast.net>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kselftest@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] docs: kselftest: remove link to obsolete wiki
Message-ID: <aWl8EXT-Fp59WDMS@archie.me>
References: <20260115172817.7120-1-bacs@librecast.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a/+0KyrOdn65OOla"
Content-Disposition: inline
In-Reply-To: <20260115172817.7120-1-bacs@librecast.net>


--a/+0KyrOdn65OOla
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 05:24:44PM +0000, Brett A C Sheffield wrote:
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-to=
ols/kselftest.rst
> index 18c2da67fae4..e13aff7a80b5 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -15,11 +15,6 @@ able to run that test on an older kernel. Hence, it is=
 important to keep
>  code that can still test an older kernel and make sure it skips the test
>  gracefully on newer releases.
> =20
> -You can find additional information on Kselftest framework, how to
> -write new tests using the framework on Kselftest wiki:
> -
> -https://kselftest.wiki.kernel.org/
> -
>  On some systems, hot-plug tests could hang forever waiting for cpu and
>  memory to be ready to be offlined. A special hot-plug target is created
>  to run the full range of hot-plug tests. In default mode, hot-plug tests=
 run

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--a/+0KyrOdn65OOla
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaWl8DQAKCRD2uYlJVVFO
o7FCAP4u3YWvqpb7XuvP/CShB6gKhNtUSEORxT+JfChh/8g9KwD7BwQstmQJZk8i
g7dOs1hlHWOFkH38sNz4SQJkGR3F+AY=
=39Y4
-----END PGP SIGNATURE-----

--a/+0KyrOdn65OOla--

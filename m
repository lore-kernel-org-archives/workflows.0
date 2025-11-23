Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67558163
	for <workflows@vger.kernel.org>; Sun, 23 Nov 2025 00:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763856411; cv=none; b=L/qza3sVbSjmLkZijebRnf8POxWv8f43Fn1Hzgy9YFHaDinIyQ6w9k5PR5E9SLE5rZ/SnfuvCtG9ep/slXYhTdzpNSUJSMaygRckimE9s6Hl7eyZiv/2IHpuyniOgEWCDKr26RrhJThsl0K9/vo20cKYEFoDjpWfX+GVOcb+HzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763856411; c=relaxed/simple;
	bh=3ozLZyyGNMMwEGx8RGNf8PFGx0IS1aWwqreSqTCHk5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRjSHyj/84JoRUGLl2B+E/TfH36s2x3wdocESFr3XmA2Watbq+XWTk3Rn4D9//YymJVUmf/50hlUmiS4/4ZaqqfBu7h2ifnUO1iDvVj9s3UBY9ismEWr0m0dZDtLggPuH8OsV0DeFNUx/rx3vLeatocWnUmHKU7K+nI73AWvdUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFaXfH9h; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFaXfH9h"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b9387df58cso5114627b3a.3
        for <workflows@vger.kernel.org>; Sat, 22 Nov 2025 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763856410; x=1764461210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ozLZyyGNMMwEGx8RGNf8PFGx0IS1aWwqreSqTCHk5Y=;
        b=VFaXfH9h7zgE1nf4gMpY8bs9LGFS1wXNGM83eO39tcl1d6guPDbhDKNxGP+sbmJJwJ
         731M5Ks1UdS3lryzGPLAOYVYxmHY6QTbhLtD4vsOb8hbL2uCKa5DxqpHlq+LaBFSS4dW
         wZ0C7okMij2p8tADFcREChXbDnWN6DerL0H1zb1gY6meJa0wZyJ8J6mJUCRphkX9X3Fe
         nR9R1/kBBWFtL4Kh6dX78yC99BDaXDmaLf5I5aqsxKZv+XLexnOVv+VjDaUNTmY6LCf+
         eSXMo4hVm/HkCNK3AAT0njcifv8LXMbb5y+RcZ92C8zBqTqR0QIQambZrhJ20FE55M01
         VPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763856410; x=1764461210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ozLZyyGNMMwEGx8RGNf8PFGx0IS1aWwqreSqTCHk5Y=;
        b=KSjCNxwYuGoWaUh6f+Yq7FU3L6pDMdr5lqrEmwQ11HdfzA29s3M1ZWZ0PlzXAQt81l
         JvOZROhlchgE1rNtRk6px6w3BkZeKFATC946uUu9m8AGlu1foII8bo88kVDrFJ/GEXzJ
         X7hEyiiCjLoyp9oaZuGCQkYEqez8nYpwYdw5JBDp4gkR4oPwmUy6JryydRjxMI6M3PBN
         LoyD1IlibH9K5rf6HD1vA8C2FTB7QWHfpT6LYSYOPbwGrJiTDssEif10+SLa2VQOWPhD
         baydm2Q4RIlsA5U6IXjSZn+gsKw72aQRJTyJ2m6YLRfhL3OgrQj57cVX2PW1CpW2caOD
         jY5A==
X-Forwarded-Encrypted: i=1; AJvYcCWOtbaiwp2DZnuf9osjcZeJVYbhrDtccRKF+uWjStvAoIrXWoOWMskdnRWg/w0paqyjIuPb5hKYgPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDbxXdsUFb9L4q2tJ32S9YnmKGp2uw8SFqYkRbpabAbh2TDWe8
	b3/ta0mS/FajjUF1L72QadDWDbbz7V7Qx+XMu6ZldN5Y6GyvKC1cZnep
X-Gm-Gg: ASbGncu57oWxox5CIQV3E/2klbbStLWUyEoWuBsHkW/3gGgL/Wm+vCwi0dllXZxGIPP
	RHlBThUNVZuw74A+Wm7wkPQ8sF8soPAIjg0PNy2szBlx1i2xrMsnsII1WNXkhb5kBwQZV0X52/S
	UsyBRNln0nLiVCDWISO2uZWHFlv7Xk4TWhLYObfJywZQph3KZObbvCRlqFXJpgD4G9SWO14IE1x
	oqmCKKCFLYiB+KUXyLShs8v3yMWzMkrNWekfTJruVtizVh4/xKsBLPp5paGY0E8Rao3Ot3xMdM7
	ELUMPYXmvJKHbKrXux1YwalmpIOYmBrU2kHa7ftGrQMu4eAQ8BNHejmRCvN6vv/DzSIDPnypE+u
	oyPhgvPwZIgqDy6lF6YpJyTyj8Gn0mFU/9Dei6Of/kHvX8HS/BbCWSFT8A3XQY/PrGihwOO++bT
	4NeCSfmtUFedA=
X-Google-Smtp-Source: AGHT+IFZJU552j/AhWkBqyTpK8tRdxzWHD0gZIlyqJPOt/v/GyTQOH37UQYzC5zSscabwQ1EY+jNlQ==
X-Received: by 2002:a05:6a20:7d9d:b0:35d:b415:7124 with SMTP id adf61e73a8af0-3614ee47ebdmr8540067637.50.1763856409580;
        Sat, 22 Nov 2025 16:06:49 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0d65682sm10108834b3a.56.2025.11.22.16.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 16:06:48 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 14F74420B901; Sun, 23 Nov 2025 07:06:44 +0700 (WIB)
Date: Sun, 23 Nov 2025 07:06:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	linux-doc@vger.kernel.org
Cc: josh@joshtriplett.org, kees@kernel.org, konstantin@linuxfoundation.org,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	workflows@vger.kernel.org, joe@perches.com, rdunlap@infradead.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v5] README: restructure with role-based documentation and
 guidelines
Message-ID: <aSJQFDTMr-bNBvkd@archie.me>
References: <20251121180009.2634393-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xg9xUeRREvw9jP+n"
Content-Disposition: inline
In-Reply-To: <20251121180009.2634393-1-sashal@kernel.org>


--Xg9xUeRREvw9jP+n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 01:00:09PM -0500, Sasha Levin wrote:
> Reorganize README to provide targeted documentation paths for different u=
ser
> roles including developers, researchers, security experts, and maintainer=
s.
>=20
> Add quick start section and essential docs links.

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Xg9xUeRREvw9jP+n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaSJQDwAKCRD2uYlJVVFO
oxrSAP4+dYAwBLzlCudX4gueRB9gZXhpwYYlWseCGcz2d6+y/gEA6XxTf711ac52
JV+x1TIyKnq0i2YX2x8C7+pXoMCRFAE=
=b1Rm
-----END PGP SIGNATURE-----

--Xg9xUeRREvw9jP+n--

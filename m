Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3880D145B16;
	Tue, 26 Aug 2025 00:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756166421; cv=none; b=nOS0hNrZzP624ND6Qhon5yRq7sWmE0CRRigbSklZxS0TImXSijAV02bdfE9qEjw+gsdAvjETGwLCF9et8+b46g4dS+98kzHcPVi63QFmyb+jVlZo1/Gze1UJQveNJTRE+BXdJ5qxLL/aSe8jFkSAl9ECn1t5ggldYso6FxVs61o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756166421; c=relaxed/simple;
	bh=TDpFI82D3io9gMkfH/lD9/zXLjfE7kfmh5GusZvi/F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aup4vItPbnFaenoJoJOTjfyoMi3ygnmHdtgk/RFYvhQ4MpDdmqeZnBmI+lAHl9Gp/eVgQLPGmxov63N30hxlWFQnugBumFcfQN/wcoPIksZfPQU+GjIrM1BQbUAZUQVCLIe9/2uLzBY1r1GmliWyDn8kSJ2AwLSo3m+Iui0vIUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxuTiShO; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxuTiShO"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-24639fbdd87so26225055ad.1;
        Mon, 25 Aug 2025 17:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756166418; x=1756771218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bhz1fF4U+DhNYPyCFpw/CCH8ZrUQI3yiXeaOt7DVaoY=;
        b=JxuTiShOCWg2M6hFIbNqpeiniEEztn5Ogn7x95hQZT6gmXs3z4mjiPW4+vNpKYA6Wn
         AF0RAqq6TqG34PIh2FuNBROELTn0N7vwevkmQixkz8z5AMz9anTM3fgDhJ1yzhc2LviS
         hinfOPyYCrwDz6F7DYVoHJ838SklM7cCHschdSHu+WWguWbdglVIt7bK6kKS8dMRBjoI
         wTxmso0ColxMEvLgfwdiqH0XulTtGWd6Iw1TqFu67/BSirN3znvdcpZKCK/TGx8jephV
         bYxcxHYkb/tOFMdGSRVfVvlP2hK7ZVaL0edlM66OCGZNENVjyuoyA03zlDaFk9/pWkAC
         8UYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756166418; x=1756771218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bhz1fF4U+DhNYPyCFpw/CCH8ZrUQI3yiXeaOt7DVaoY=;
        b=P9t7HonLbQ76Q8P4uzBew2qsI1ESaisd+qQRWpU1QR7skYB9H5t9oEnPssncbORkXA
         crtKzLwWYOCMIO3qs2YsiFp7d4x8E2PgO5o1qOFON/BcMlwJnmOIEqmyWHC26tAKmxVE
         7HerhpPIhyxXUyfFpK9cmwr0qCyNBBFw80Hsm1ukG9DcOdZ1DQs4ekKeKw97/1uX1mb/
         yHTw8A+SUrC/cc6d8SdThVY2lMFaOlpgBKT4PIhBx5DgMtgwSGIVGrxEDAsMNgrIH/tL
         6SXtQ/QEeMBTMdLVxOxKq67VL9SzU+hN9iTQx59Za6p+989g9yNiDfDuqwqJw6vQjmw/
         U5yA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Va8WvufhwqORkpHWOMm8aVBGYVezeA+cLy99sNDTVvPdB4a0gXaZl5gPjsrEDONlmUdGdE/+ctY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg88kg9hpQgyjUz+zAKTufRbeYHM21qeL8ikB86+YigYupLb5n
	Z/6bOC2W7BCcJ630TJA/Js6Am1qM2ajlvpXNMTrdsU0RCSnuWkzReJRC
X-Gm-Gg: ASbGncvBT8bXjU2RUW4IdOnJLGAR1fNdCxwcfTgEm87emkc4dAWZhKE/n3b59pI9IJ6
	s8LINsMDkl2Y+06lja/U3RlmHNRAUMS5TYaFFOLKk8kmdsqIKsr8kdOQUtfsE2pcNLvWe2pJhlD
	s/fkVJJE95hLNirVDeXx/+En/yprhCpW0XT4fuUkyVS8P2cTn+zPBDjHPIGM3OeDQLwuLUwZbta
	cZs0TPO1SlCysgDa2pQsque/bcemC33Ao3ux2LDNIYp5zPw8E+pFR5gIUaRk9mfSfZdaeCpY3pS
	P9eAUb3Bg28ffD1/GivXl8wdOhIuvwX+5AOwS0fvpuf0q5z1q2oji1YedoJSAJEN5zWMCnP7cHy
	Z+z3gQwtr93GVSuJ0PscNLj2bCBKXG6Uu
X-Google-Smtp-Source: AGHT+IEMgSMRQ1ikjY4VVuI/uxUeQ227HgXNoOUIeOsE0YIjbeix1xu/8PdTXUgoE19eW0OYm0XX+w==
X-Received: by 2002:a17:903:2a8e:b0:246:7e31:ddbc with SMTP id d9443c01a7336-2483df49581mr13729215ad.13.1756166418312;
        Mon, 25 Aug 2025 17:00:18 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466887fef9sm78286985ad.114.2025.08.25.17.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 17:00:17 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id DB23C424E25B; Tue, 26 Aug 2025 07:00:14 +0700 (WIB)
Date: Tue, 26 Aug 2025 07:00:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	I Viswanath <viswanathiyyappan@gmail.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Documentation: process: Fix grammar errors in
 management-style.rst
Message-ID: <aKz5Dh8sS8_tB_Iz@archie.me>
References: <20250824185015.6312-1-viswanathiyyappan@gmail.com>
 <87y0r8c7ga.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JxywI3ScyCU0OdPl"
Content-Disposition: inline
In-Reply-To: <87y0r8c7ga.fsf@trenco.lwn.net>


--JxywI3ScyCU0OdPl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 24, 2025 at 11:10:29PM -0600, Jonathan Corbet wrote:
> > @@ -42,9 +42,9 @@ actually true.
> >  The name of the game is to **avoid** having to make a decision.  In
> >  particular, if somebody tells you "choose (a) or (b), we really need y=
ou
> >  to decide on this", you're in trouble as a manager.  The people you
> > -manage had better know the details better than you, so if they come to
> > +manage better know the details better than you; if they come to
>=20
> This one changes the meaning of the sentence

I think the sentence means that people under a manager know the details
(i.e. intricacies) better than their manager himself.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--JxywI3ScyCU0OdPl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaKz5CgAKCRD2uYlJVVFO
o9+SAP9w++xpjhfwavW2hIqz9hhO9CwZPxDgSmKG/kD8Na0i9QEAm6bikX22FoRn
CB9SZYae0kv4csonpddVwv19QQzwpgQ=
=pnJV
-----END PGP SIGNATURE-----

--JxywI3ScyCU0OdPl--

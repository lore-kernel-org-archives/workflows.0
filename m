Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF7E1CBEAA
	for <workflows@vger.kernel.org>; Wed, 12 Feb 2025 14:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739372004; cv=none; b=qCzDDPHLp8MC3k1wEvZG/UPD3ylv70yWFDs6BjsRJafparf+1CcCKwfXGVrLdbSfuhrba/9s7fRfVVzivygiTtQz1QYFFMj4ceQNtgKJ2YWraKEWyPTRFn+A3R66FvvYIpiSTKm5DpPuqzTh9z+XcMZz4ef6M0pJtHQFEk6pxZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739372004; c=relaxed/simple;
	bh=OHwlJbfQ3IpI4ONpmE2mEUiNIy/0gdB5Hgqwb3FKcGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLBfcYgU6XaA6B/W9XVcqGsuQW/WTEgp9wxDT3CxsKognx8Q+k1x8HcnSM6ZGksKwswu7mpz4dQOX8b+84K09NK/Mc8v4ZpemnoVBFMF2z8Xcq9mT6T6bWuhoRHprZa+3AnC1DXLQnmaV8ufNAUNBMKSdBPTxzy/rhpEFXYmOtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FYrc8HNj; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FYrc8HNj"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4395b367329so4756425e9.3
        for <workflows@vger.kernel.org>; Wed, 12 Feb 2025 06:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739372000; x=1739976800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZ/1pqAO3578ShBA/dQHb4TCfeCmgfLMpnhT1OJ5vVk=;
        b=FYrc8HNjUqcwsbb5hkRg+RQwVfKqIZNSrz9URaefGWhEfYNZLoG5SV1gDvORYGKt91
         jgpBZGQzcL1gsOsJf3dLNpe7+sZB6dha3EP/KXQ489xXKL5RJIjLBCNBrCCoBwgzsKI/
         7sV1t4rclFt/5hrqnYKiWanivlG+gi3oo0i9PXfAOSIlUDZaGAWePn0oy8zmtDKaFkos
         fCE48OgcxiEV8OWum1ytUbgn6D4jy9QHNcMqx8bVt7I6jdXPgwIs0xjrJxsfehWX0cM4
         BmLLB78H5tbSG+E5t29dySzchCDIFrVWTFjf+IU9nAJYj8T8Ccqlv0UkhAwYulDJvct7
         WAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739372000; x=1739976800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZ/1pqAO3578ShBA/dQHb4TCfeCmgfLMpnhT1OJ5vVk=;
        b=lQ8BABXOWckC2lUnCxHrAotdmwxoNxBb9GxG/BCN6nU4lWuXZR/Ofith+z9IcRZZIf
         FYqhSw6xUbDmeHjw2P6zdthSwRmXkc0ShW9NON0Px9Z7jcWxzO2jjfWP11zMp+9v/Xxr
         u1knCFU9YgNXeJXBx8CC//TfGQlrM29BmhmoQ9FOHhOMI61gsnbjBJKLh9YqWW/OyuSu
         Fp/MCJiHY5LhcxGSpMeIO7621u9jbAXXx9R4AKPO/FEVbclvLp4fAN8cbwlvnIQI4Pwa
         OL4Z3L8jRLiLFEpnEVWVpYUrOb7udeFDL0wA01EESx50siWjxE/eqnxckj5u2fwGMnyL
         MMYA==
X-Forwarded-Encrypted: i=1; AJvYcCXWBAJX+4AYdYiLmkuUCG6YwFnSRX2v0UpTi+FgCWBFvEjeP+wTnLHybZBDgcrDrEKb0cXyHgoyjRM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkddBNlZui5cjiOmutC38/Es3BfzUt6/MwwGt0dTLD8jF/ZSMM
	zMMMynu6GA4C9B7eaBeyRFMZla1xyUtDn7RJD/OUzQaoUEJ8knmKVrYLtH54pt4=
X-Gm-Gg: ASbGncv/Vp2GODiPJ6XLVbvmcwYvIwZscLAcw0c0nbXklYQn03WQTDRBHMvxUxMFlbS
	0r0RWtX4tCCaLe8J0nayLVupqKVs+e7rW+2/RLsx2qx/FcXnnWxb709OdBdUW/zUFahkt3tlrSH
	HJuru5BqH32178AG3xjvQq/ujmkc4T3ZB5cHEuNW6AfhK1jCKlRNAjfOm7ZlHYy8nvt/Yd0gv64
	mY++P2rlTNfFD6ggymbgPnmIN5Hp1AcLJq6uFcIKdEckEjSTCWyuWUr86sCz1flnqzEiuDYPRxS
	plSvIS4qTLhjNeP5ws9Dwp/5UxX7CvNHVqpHEvQT0lxuTpJ5JDZMRRfdtA==
X-Google-Smtp-Source: AGHT+IFRuF1BAss1zC14zFnEXST/oCbzyoLsOyew0ej8Mcm/aa3Hg17bwj3c3uzywGSCzEC7bZ2Xbw==
X-Received: by 2002:a05:600c:3b03:b0:434:a734:d268 with SMTP id 5b1f17b1804b1-43958188fb9mr36603335e9.14.1739371998234;
        Wed, 12 Feb 2025 06:53:18 -0800 (PST)
Received: from localhost (p200300f65f083b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f08:3b04::1b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7f3sm22428255e9.29.2025.02.12.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 06:53:17 -0800 (PST)
Date: Wed, 12 Feb 2025 15:53:16 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Joe Perches <joe@perches.com>, 
	Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
Message-ID: <r53ilw7b2q7th2lru6f7dc4bpbrowivgb2cjr7ur3edl5dwhmr@qxtbdor5x73y>
References: <20250203-b4-get_maintainer-v2-0-83ba008b491f@suse.cz>
 <20250203-b4-get_maintainer-v2-1-83ba008b491f@suse.cz>
 <66c2bf7a-9119-4850-b6b8-ac8f426966e1@suse.cz>
 <CAMuHMdWvTDO6wcLQs1DwrEjj3jDDav5uKU6E-5=TKFK9w1Nb-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jelpycjg5zxmabvz"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWvTDO6wcLQs1DwrEjj3jDDav5uKU6E-5=TKFK9w1Nb-w@mail.gmail.com>


--jelpycjg5zxmabvz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] get_maintainer: add --substatus for reporting
 subsystem status
MIME-Version: 1.0

On Wed, Feb 12, 2025 at 01:42:15PM +0100, Geert Uytterhoeven wrote:
> Hi Vlastimil,
>=20
> On Tue, 11 Feb 2025 at 17:01, Vlastimil Babka <vbabka@suse.cz> wrote:
> > On 2/3/25 12:13, Vlastimil Babka wrote:
> > > The subsystem status is currently reported with --role(stats) by
> > > adjusting the maintainer role for any status different from Maintaine=
d.
> > > This has two downsides:
> > >
> > > - if a subsystem has only reviewers or mailing lists and no maintaine=
rs,
> > >   the status is not reported (i.e. typically, Orphan subsystems have =
no
> > >   maintainers)
> > >
> > > - the Supported status means that someone is paid for maintaining, but
> > >   it is reported as "supporter" for all the maintainers, which can be
> > >   incorrect. People have been also confused about what "supporter"
> > >   means.
> > >
> > > This patch introduces a new --substatus option and functionality aimed
> > > to report the subsystem status separately, without adjusting the
> > > reported maintainer role. After the e-mails are output, the status of
> > > subsystems will follow, for example:
> > >
> > > ...
> > > linux-kernel@vger.kernel.org (open list:LIBRARY CODE)
> > > LIBRARY CODE status: Supported
> > >
> > > In order to allow replacing the role rewriting seamlessly, the new
> > > option works as follows:
> > >
> > > - it is automatically enabled when --email and --role are enabled
> > >   (the defaults include --email and --rolestats which implies --role)
> >
> > With the following fixup, the above changes to:
> >
> > - it is automatically enabled when --email and --role are enabled and t=
he
> >   output is a terminal (the defaults include --email and --rolestats wh=
ich
> >   implies --role)
> >
> > ----8<----
> > From f5523a85c742065fcb88a8aa26831f9dba9faf15 Mon Sep 17 00:00:00 2001
> > From: Vlastimil Babka <vbabka@suse.cz>
> > Date: Tue, 11 Feb 2025 16:16:11 +0100
> > Subject: [PATCH] get_maintainer: add --substatus for reporting subsystem
> >  status - fix
> >
> > The automatically enabled --substatus can break existing scripts that do
> > not disable --rolestats. Require that script output goes to a terminal
> > to enable it automatically.
> >
> > Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
>=20
> Thanks, that fixes the issue for me.
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Ditto for me (it allows me to undo the workaround I already implemented
:-)

Tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

To please the regzbot, you also might want to add:

Fixes: c1565b6f7b53 ("get_maintainer: add --substatus for reporting subsyst=
em status")
Closes: https://lore.kernel.org/all/7aodxv46lj6rthjo4i5zhhx2lybrhb4uknpej2d=
yz3e7im5w3w@w23bz6fx3jnn/

Thanks
Uwe

--jelpycjg5zxmabvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmestdkACgkQj4D7WH0S
/k7pzwgAlDcHJHbWfWwQa1naSwl4ZOLWdwobVq5NLXCBIz2sM3pm4+qxglDqiRvh
FTpOgyBM+B3cI6q8S5IApVyXs2HdhHfzys9lhv1B1NIWtWvYp1hDmpCbxzSJV3Bm
lCpmkL4o9jxx+5CSWK4RbAd0QZvKNAI4mBwtmVQL/IlvZ2uJPt1zMpbSH+ozmYKn
ibir4x546KbhnTgMeaHn1ZPXLlra8JgBlbEizjS5JIcU/DJQ2Ylpv+mHh6z7A8gQ
/2kyhLedTM8WkhHhwXXV46ZRVuXR+MqkOPbMzQ/5TTlGhp22FsOPggsrM+AVLTbF
CGjAJ93j8jm2LTXLjZI78qSaDc/CFA==
=SHxU
-----END PGP SIGNATURE-----

--jelpycjg5zxmabvz--

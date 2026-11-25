Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648231;
	b=1dq5YLsAjxGZvjwLG8ltRb+Ops5pI4w1LFrpdJ0Mxv3cPgE12/LvDFN9EiCIxCAWO7Gt
	 9akVcN9MpNIk7Lv77uY9qdiybkQ0/oaf0gP9HXvmywprSiZaWQeHnWca72QIc48o8QmE/
	 y6niqQVQPJsXeBMu2RA2oZlyU6J9ypO/aHjJihMABc7TwTzxkHl6BwoEdEv2Cd9W6/SKg
	 caYePtRHAUQdUSPfB+QbOPxbmxDCuDuECXrVR8ce0qaUkyHXsKVKbZ0tKmfj4BTyq/iYg
	 dFb+IR4JoIjspD/pknATTFwyHOa092Hkc4NUc7RoPmTFYvVWFRr17uTdijypQx5myYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zDfIlMf8Mgrk2zESztpa+SZeqsqrIyzEk/8t85wpnEE=;
	b=xtC8HoCkFm1HH/gppzeqsw1tzNMMr+zppkwb+fZ7M5lKAD7BuXuoMd2XKPsAbZpKCU/T
	 75w4Q/sjUNKAgHwrZFzwz65vAMnXfl7Lfrdfncldf+I9e7Boq5X+iP7/YobdIfsFOE4CP
	 e1YrV+V1+50QHVl4V6yV7YvvQHEBqzffLhs4wXdxUkzW6fTTEP07aV8YuJpHchrcyDDN/
	 eKMVch3IXFUZeEA/88qkGQTKBBVY6qjLOoo5xb6ysToR4yaWgIoyfysD8HSPzcJdyQigf
	 M1AMVn4nfvQQ5wP1V+qgoCfL80uoiCRXwgPSbFlGmIbsWdpjFNdiFk1eCBHN4WKzGYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiSPxi8R;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C1B606A330
	for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 23:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C1B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiSPxi8R
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso3061666a91.1
        for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 15:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648230; x=1796253030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zDfIlMf8Mgrk2zESztpa+SZeqsqrIyzEk/8t85wpnEE=;
        b=QiSPxi8Ruze1+eJW6+Da2Pb69jLHtjp5IOjJBHZJcfCiPL+nrAc/PVojTPm/UyFnFr
         2ToPnK8ovRrXR/aZZeKm9h6vS5pzLDPhzpjmuJqIQgCatKiLHY/V/nYzTPa1tUY8viLW
         HHQsqwosd/i0t9dlJU4W0+xtuayQqbQoW+3ExNQxi7m24WsrgIN4teF5xobePoU7/i98
         ptn05DfhDKV9mDYG2vp6RlRg7KE0UffcyutOQ0p3mu9OklqnnbBDA5e4zhg2rU8LLLYi
         B0c7T89jS1Bxy6HJDKtQ1FHLhdUT0g0G6U9EDRLy7nHRlnfHPRxUhNV6NfEGeetdzMvk
         idTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648230; x=1796253030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDfIlMf8Mgrk2zESztpa+SZeqsqrIyzEk/8t85wpnEE=;
        b=myAQatm9DZmxbAyFC8UR9O7pMT8WeX5yoHlU72FznMVDJSlNknLbjHzW7Ytz9IgNaL
         h9/5NZp938w/ccegx6qYTv+vGrnlsDhxLIWxicad92AuU4FKG6X39TqWFz5BcNvn/TiJ
         WOi4Igd/PLaYyscJADlVW8jmRSPJiGrHcJvKurvl2wGkdriO3IxliiT3kEyVYXdhlMWf
         +/gVR8w2LPw6GiiaUVANt5k2e4VisNEDfO5uURO5PykX4M900ZO7GMUXUY79FuP7D8ih
         Mn9cdMseWfDJiIFf/pN//VooT9AylJ6Z0LUWw5FGed6ZflZndrgfadXyFEFi1LveWoyi
         Zvjg==
X-Forwarded-Encrypted: i=1; AL+hErH3b3FjaDYinwrLcrVNKDjYU6gx5tzw7moCHvGXQYshwfffNS9Dz91ue4mhyfWJkjklWaF9kpQLjUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dVmXb3nTtesl6YI4ttEvolIPZasx5SLj6A/RtCUNCSSBCeRIz
	+3XmWhCifMWuFaOn55D6RxXjNsnNkFPJFEElkKLcYI2/9mH8Uz11LnPS
X-Gm-Gg: AZFdTZfcxf9ndv7IETHvsGJvoMbEsbKxFQLlrjXqf/fyn6+O4ZdN4yDo5wkEqzzpzHS
	KgyV+GVqIIY2QIxjANeB4gAVQy4K0eUuJt1rHuvj/wBVaGR9nCdHR1YsGGcY3Nsl6CPsLo72Xd9
	uky0QN/IWMb51XX8K8ZgBLhMi3pP4lwQFiw9CZMtpIlV7Aorj4OzCMYOJRLuljQIuSlu2+G+w6K
	UcXQzizgZAEpFMJVQHwBEex4UdyfMKwdSNAlPvFuu/6ZgewpkJvLb4agtR/RCdAfH739sUwm9EO
	9UgmXuVr+E8xakf70fPBHqRETMwyzRgNhqggNLQieLLraXUAFrf68r2bNbs0qIKfxyXAXr4Blmv
	G0F/3lc8KvRzl+pebR2j/6RxTbYNPQer4LMwaZXZ112+ILj+bEKOXZDlZVFeo2o+uRL3B17EMO6
	kKc9Q18yPyegotECGDQkgDhs6h5qk2Lb7uNSZXaHhFLC0E4r+up8UVZEIoJhjI9apWvYJ7ZKmLk
	cipEWWZxyQouCZbiP10caUI+ZAtriqGs6c+HZBEeVHFbmPDRPZ1N458j3oNva9M6aQ7fQPrV4s7
	tWlHf1x2w7Db29KU+EtamMySVM1+
X-Received: by 2002:a17:90b:2648:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3b41c95f127mr17871039a91.52.1795648229629;
        Wed, 25 Nov 2026 15:10:29 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde84cd5ed8sm6822830a12.10.2026.11.25.15.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:10:28 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 19F1A420A76D; Thu, 26 Nov 2026 06:10:25 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:10:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>, Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 13/14] docs: submitting-patches: defer to
 security-bugs.rst for security fixes
Message-ID: <awdq4PpsF0BiBpBf@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-14-w@1wt.eu>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fXRipf5woL+m9ZeZ"
Content-Disposition: inline
In-Reply-To: <20261114190014.17826-14-w@1wt.eu>

--fXRipf5woL+m9ZeZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 08:00:13PM +0100, Willy Tarreau wrote:
> -If you have a patch that fixes an exploitable security bug, send that pa=
tch
> -to security@kernel.org.  For severe bugs, a short embargo may be conside=
red
> -to allow distributors to get the patch out to users; in such cases,
> -obviously, the patch should not be sent to any public lists. See also
> -Documentation/process/security-bugs.rst.
> +If you have a patch that fixes a bug with possible security implications=
, you
> +need to read Documentation/process/security-bugs.rst first: it explains =
which
> +bugs need to be handled privately, and whom to send them to.  Most such =
fixes
> +are posted publicly like any other fix, but their reproducers and exploi=
ts must
> +never be posted publicly.
> =20

Looks good, thanks!

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--fXRipf5woL+m9ZeZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdq4AAKCRD2uYlJVVFO
o6e0AP9gJNOsIP9zrW1e2mg+m5ED7Bg/2J+m6qHgcL361ELOsAD+JrY2Pd5C+/6o
IZAvI+CqACZ8YZPx9icO9xBREbGGQAI=
=9Bsp
-----END PGP SIGNATURE-----

--fXRipf5woL+m9ZeZ--

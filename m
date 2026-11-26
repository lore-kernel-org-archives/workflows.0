Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704682;
	b=LHkZ3Cb47jhYGxuq/5CWBHvoY6aLkpNIn8Idyy1ZllhFCy+pbZCLsw1E9v52+qKgxAe8
	 ZiQR3D4qzbC8iM2yFwe+vP3fkpnpTYQQAbX3r/8Bu1xfRCr+Ox/4zSSsW9AUdHlXvTiLr
	 zgADEkwLdWnD7Dh2iDFvII8L5H/hqxnMwiQZipXm3vGnqZUfjDrXjRe2NbUe8fXtUmClx
	 eOn5Zh5NkgFEaxBt2RCmpX2eye0kGtpAi+Qg6mD3y0uljuCSjWKg0pDKsZdFsof0McvWP
	 6TRSYhKCfsg1ByRcqwyUDVs6Rt1+c6AvP97R4BJelD+vC5rpFD2TFFqdsifuHQ3eORA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704682;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=8cDwjtU7rN5AjHTXbgsdj8N4xpWB5/rnJA0ria9qGQ8=;
	b=dXmGyErLyDMsVgS5ePQ5aSh+1tta3+ABjzSQAkSp8Py8K+hk+9hKBHtfHRscwLPpTN+i
	 1di11W/W55nOdDysr7FwFd9W3yBqYGLOv15nWHJImV/4wSCJZuSmP82TH6bgjCkNQnN6x
	 6UYCIIurxo52Docq+rCfTv8cxFgnwwHPhjeXUalCW6bTGfrJlu3FVE0Ed/ww3rGGt0y8G
	 jbf/QVZpY3ovUg2QZLAQJzVqNHplt608UC8sVo334WEYPNJnmhkmSFH1ynXGBf01P/+r8
	 VDYEx675/zzpo9JV7dQT1Pu8Tgw3W//3YUabq//PTg2e6hUyzn2oQfdFU9+AXk3JH6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctU6b3mB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFF3606A31C;
	Thu, 26 Nov 2026 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctU6b3mB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9661F000D2;
	Thu, 26 Nov 2026 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704681;
	bh=8cDwjtU7rN5AjHTXbgsdj8N4xpWB5/rnJA0ria9qGQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ctU6b3mBxvMDTa4T+HpsxkismU0GkEqyOENp2dwQQOgI2Uj2hzhcJ/q/Ut1TkDXwm
	 1dxFQQUw3zKbHAUPRBppbvZcLIsAoyvW1WiYvl/uQojc2uF+usMWOCQfsz3wV2oOTs
	 3sGYGGq7Pg/9zbz/8FEJzBYT4VH0XwTi/PwhMsPX/7ACo/h6Y3faUx4GI1imFP8qsb
	 suklrC8J4WWm/JdYueu+z7WT06cw1EcL/VgW0LWK2TABy0vZSULYYHqCbrqY+bhbBI
	 SEOxtoyOjS5aR7yK4IK/rOlCAGZEsrWZBB/hCMamxJ9YBPEq3eJ3fayXo8+tp1oD0H
	 mboHWqsrmXZvg==
Date: Thu, 26 Nov 2026 14:51:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] docs: submitting-patches: Limit backtrace trimming to
 timestamps
Message-ID: <b8f8e83a-10f0-4aa9-b850-adc0fb23e7f2@sirena.org.uk>
References: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
 <d4848afd-a23a-4119-ac09-1fe5e4681e3a@sirena.org.uk>
 <20261126125959.GL774860@unreal>
 <00561b8f-c85c-4cb4-82dd-aee3d14e509b@sirena.org.uk>
 <20261126133042.GM774860@unreal>
 <8836d5ee-b800-49e3-a866-327041384b40@sirena.org.uk>
 <20261126144740.GR774860@unreal>
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
	protocol="application/pgp-signature"; boundary="7UY3ps6s1cZNOpfC"
Content-Disposition: inline
In-Reply-To: <20261126144740.GR774860@unreal>
X-Cookie: Sank heaven for leetle curls.


--7UY3ps6s1cZNOpfC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2026 at 04:47:40PM +0200, Leon Romanovsky wrote:

> I can try to work around this using the maintainer's profile, but can we at least
> agree to remove the example from the documentation? It does more harm than good.

Yes, that is quite outdated.

--7UY3ps6s1cZNOpfC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIR2MACgkQJNaLcl1U
h9CWWwf/VDKjEkXWDUkvCgEg0ysV2KNaer8r8H/3Jfcma315cx9xaLM/zRLMKsj7
tUBNI1mrttHxJZ24DC7XvZ9z7IsjRrh9nnD4LrLXY0F2PanbXnUjVtm+yP7+tEA6
5or1Ny7kZti4sgAxyLh52+wNAW6BDRc1nhLK0rcEEHs71XI6cMnIxNZ/txgm3oge
pETQhnYeV6gsoGg6lCOc91Gbb7hqSCtreU9ww4su3kpcLoLayEWCPpNJuNBKWgcs
/eRa53Sz4hqPpbGuCPl3WznagpJo61QdMyfY0JGVyYn9hR5d5iYOgTLAjniK4MS5
MvoNQQJJo2IoYDYtRJAqZgU6QzH4EA==
=yVnA
-----END PGP SIGNATURE-----

--7UY3ps6s1cZNOpfC--

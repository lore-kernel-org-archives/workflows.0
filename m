Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701140;
	b=lTRJLvwHM6CybjT4pWlM6L8ESBty7sb0xl0/A8bqLoCC/4UjVNLZbt3zzmmwG1eCyXFZ
	 uRRfBk1YVKw55MFnXYA8LNhK0R14aCx7rVHlT0wj66pTpNirc+/RjTWT1Oq6JWQ1P6xkS
	 iRXCThWSfbsx/D4NocmKLifc9FIzLVHhIFrXbIfliM4ZqAD79ZSpcFVjpFQS54LReWB+v
	 HL8YovvoClKZviHna9BeljXIQw9+3Xp/pECMYYoerLYv84y9AiF+B1ta0KRPDxxS4Fvas
	 UzvJktPECd8qzTlV1elrdX3yxdPZAdRpehnOoRwdBiTNKKY2eWj0fiKHwfzE8wJ6QoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701140;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=BkEswlZd/rW4NM/K4GIhLppyMoHKAr1sanl/GSXNwoA=;
	b=ZLMpf1m9cQGFmE+DnhGMQLNGu6LkU7PbpB9Jiz7R4KeNZrmNl9a0Hi4iQUbvY3fc/NZQ
	 +LAP8xP4Tya8ZJvMZm/cs6ckShtlzEnYl4WR7WVZ6mvFrPFK+enRVp3In0PcjYkhjywuX
	 mBz5TkOeGTOSU+QbVuoE3a21R1aAg61QGzo3yVgHZ1HYNo4ZChgPvObLh7VL09NOY84/D
	 rm+4lE20ojrRfIEnY7cmEa+y1/kToXikhUZXmun2cj0nPEvvii+B10zcv5YxHKdvMWA80
	 FOng3WBihPfcX3PPos1nNDmzHFGC96Q3yWnn7I5CSCduOv3JDybtwtB3/5lJcPxo1Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhLdlrsM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6401606A33E;
	Thu, 26 Nov 2026 13:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BhLdlrsM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D607A1F000CF;
	Thu, 26 Nov 2026 13:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795701139;
	bh=BkEswlZd/rW4NM/K4GIhLppyMoHKAr1sanl/GSXNwoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BhLdlrsMGvrIMfBmOgPUTEIG7q4CJYulxYw+l+xQ3aFmHt4Tkk/zs1FKRxrKTUxUq
	 eVCxhCtCXZtco4R82Hj7OEg/Q8Oy2C1jrTiagbG+vcwaAtEyB2nj0+qSOD81j0E3mY
	 a1h2MKL32OLDwPHV7XOZ2AsdmTG5touUsZCv2lxUIQtYob3Ih4UNHlvmMduiQZRxWO
	 JJJfDCXXxLqkYUw59j/XjgOG//klrXX2QAUiAcu1D6Z5rnYOZ6WlqpKiUrfXUs1DWV
	 y4aFUtR15VzUQZGHbgTfXBd97Iqu0duQ3G/uCOmyOAB4Kj5NfvN1GUz+UZ8LHaKvQR
	 G285RkmNg7MiA==
Date: Thu, 26 Nov 2026 13:52:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] docs: submitting-patches: Limit backtrace trimming to
 timestamps
Message-ID: <8836d5ee-b800-49e3-a866-327041384b40@sirena.org.uk>
References: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
 <d4848afd-a23a-4119-ac09-1fe5e4681e3a@sirena.org.uk>
 <20261126125959.GL774860@unreal>
 <00561b8f-c85c-4cb4-82dd-aee3d14e509b@sirena.org.uk>
 <20261126133042.GM774860@unreal>
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
	protocol="application/pgp-signature"; boundary="8uu7UyPLrzQWZn9l"
Content-Disposition: inline
In-Reply-To: <20261126133042.GM774860@unreal>
X-Cookie: Sank heaven for leetle curls.


--8uu7UyPLrzQWZn9l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2026 at 03:30:42PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 26, 2026 at 01:22:26PM +0000, Mark Brown wrote:

> > I think there's room for improvement but I think what you're proposing
> > right now goes far too far in the other direction.  It is a very
> > definitive statement that nothing should be removed, it would be better
> > to do things like call out specific bits that are generally relevant and
> > should not be removed (like taint information) and encourage people to
> > use faddr2line.

> I'm aware that I took an overly aggressive approach, but there was a
> reason for it - it lets us trim the text line by line. If we take the
> opposite approach and add request for more information, we'll inevitably
> miss important details.

That doesn't help with making the patch submission readily legible which
goes to Geert's point that you're pushing the work of making the thing
comprehensible onto everyone looking at the mail, and ideally whoever
applies the patch.  Perhaps the stronger version of this is something
that needs to go into per subsystem documentation if you find that's the
best balance there, I know I have vastly more issues with having to page
through enormous amounts of irrelevant information than with missing
details.

--8uu7UyPLrzQWZn9l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIOY4ACgkQJNaLcl1U
h9AhPgf+Jf51BbM7AqUHj108U2hLwYcs9GRgMgk0ZQhXRewV1Bn+AZt4/QA4gyfL
1bxNmtp3yKXwEkSFi6Jwk6hE+Sg7nHyZqrzBU2oJymVh8cSSG4onFcXduBZ/6HJS
c28FyoZmoDPROug6U8kynpRus2B/Ok8xSyEaP1taAnHXd+0GmfHkw0T9V3VX2yEW
CjrKBNjcHdP9p0lj+KTNmWTdwUFtVd5GikjLQbRYUnNGT97TVrv6xjH9qZxyk4Fo
LAzH2v+P5+C5SYawg1fgqbVYU5bVBpP+PEqyJ/tUuHKcBCGYZLGYu3ego/I4Jn0+
HGFwNGz+f1IZNZBrTqsqun28KMcElQ==
=5WYh
-----END PGP SIGNATURE-----

--8uu7UyPLrzQWZn9l--

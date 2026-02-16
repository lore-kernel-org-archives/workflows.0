Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008382236F0;
	Mon, 16 Feb 2026 09:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771233425; cv=none; b=Dv3AvgMBkBIR2JW/Ox6U4P0aYzdScep+huEAffnaoW83R8CD1Tfj8fntHKhoS2VhU3RqmFXHpFfJl5N6VfxRxAnk2L6SIod97veb/g0b9MNaRFAjXIU444bpIU1j1W+7KflA1Cj2H8Wtj8dtG59oufwxGaD8UWQvppV+5MEN3TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771233425; c=relaxed/simple;
	bh=/YwCjMh7kAI+ORKjdNLNobjuQMmqW5s/+kwWDU7zLq8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XYGcs2DCiNRQrbgpOPsKEU/lokIsmkHk5ps3OyVHknFOgcLxTf6boGQ2Nqm8iHxoFfFi9NwA50EEvT86t4Wb+GSE275s+bY5V67dyjZfYmjVu6DubvGWQDkLGc+LnxvCzGW6NH98S5NcoK3Y1u0gIuihV6Tm8BHwnzvVY0FmjzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RWgB9i+V; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RWgB9i+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1771233412;
	bh=tpPJH7E0pjWEfrb75+dvnbooi+VxiahQWEaQpb5VfYA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RWgB9i+V0oBY/UtlkgGE8l1GBUHPuFxTXi5HkT8R6J8oeYypmAmX4iHP/9lYH7IAJ
	 KG+6SExlPwpRpdZ9tQCca8N6t5r8uTvQ3TML//0RWJDKmtM69E1gUNcECAEFf038s9
	 iRa5X3JPGoy3myHf9XJTSlcLYAazwBm8SWO6HDIyrxVNdNOCKvkh8jaCXktEhf7jvP
	 +3sDzc2/Gj0lCAgWCHJNrJYaXU+T4wfeRz6CfKmOuL3zx6dup73YQPAY0v3eSzfRhG
	 o/0SE7kVrT6rwJorQDss96HEl5cg5W1BJ2VEr5upUURbKd24xFaLhn/mx88+IgVLyD
	 0e11lxt0GMTSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4fDxwz6VQcz4wMV;
	Mon, 16 Feb 2026 20:16:50 +1100 (AEDT)
Date: Mon, 16 Feb 2026 20:16:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] linux-next: update maintainer info.
Message-ID: <20260216091648.7a6a0e3a@canb.auug.org.au>
In-Reply-To: <20260216060739.2791462-1-rdunlap@infradead.org>
References: <20260216060739.2791462-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jH+1vC_5i067lTj8JBHHV4b";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jH+1vC_5i067lTj8JBHHV4b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Randy,

On Sun, 15 Feb 2026 22:07:39 -0800 Randy Dunlap <rdunlap@infradead.org> wro=
te:
>
> Update the MAINTAINERS file and Documentation/process/2.Process.rst
> with the current linux-next maintainer information.
>=20
> Translations of 2.Process.rst should also be updated.
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: workflows@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
>=20
>  Documentation/process/2.Process.rst |    2 +-
>  MAINTAINERS                         |    1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> --- linux-next-20260213.orig/Documentation/process/2.Process.rst
> +++ linux-next-20260213/Documentation/process/2.Process.rst
> @@ -291,7 +291,7 @@ Use of the MMOTM tree is likely to be a
>  there is a definite chance that it will not even compile.
> =20
>  The primary tree for next-cycle patch merging is linux-next, maintained =
by
> -Stephen Rothwell.  The linux-next tree is, by design, a snapshot of what
> +Mark Brown.  The linux-next tree is, by design, a snapshot of what
>  the mainline is expected to look like after the next merge window closes.
>  Linux-next trees are announced on the linux-kernel and linux-next mailing
>  lists when they are assembled; they can be downloaded from:
> --- linux-next-20260213.orig/MAINTAINERS
> +++ linux-next-20260213/MAINTAINERS
> @@ -14749,7 +14749,6 @@ F:	Documentation/memory-barriers.txt
>  F:	tools/memory-model/
> =20
>  LINUX-NEXT TREE
> -M:	Stephen Rothwell <sfr@canb.auug.org.au>
>  M:	Mark Brown <broonie@kernel.org>
>  L:	linux-next@vger.kernel.org
>  S:	Supported

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

Maybe update the CREDITS file?  ;-)
--=20
Cheers,
Stephen Rothwell

--Sig_/jH+1vC_5i067lTj8JBHHV4b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmmS4IAACgkQAVBC80lX
0GwqmQgAm/E/v3/i1obN7FrLZgmdv2zG7NQoSyzBKqK4ejZUxwMg5vompEbdcUn4
43VMiicxixaaj9T9Y3TjA6T+40MA21Zqx4kJkqsdFc9lmYC9+qNfBN4AamRmtE+W
QZYSGWoQiZ5eR5oGPRKf7jaaVTv7TjzUAu75potchUMAVg/znh1yoWy3kAEmBjng
lZf0q8APny1BXVEKT04Xro+kkhsiPJ4oWIvRVvDL7qiJmEod8+AuETx/aA6QUHXB
XAmYyWQ+vliYjpsPNZNQYj2l2xwB28xXzunn8hxd01DLpBqEsO8Sde9tLTrfFtJA
Y+81oHwXt7hBRY21/wjU1uW4LVKHAw==
=soLI
-----END PGP SIGNATURE-----

--Sig_/jH+1vC_5i067lTj8JBHHV4b--

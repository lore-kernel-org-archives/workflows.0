Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CE914F112;
	Mon, 16 Feb 2026 15:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771256250; cv=none; b=l2Z6P724Mjw+iO41o8qrikgvk2Yw9gjqXHmOnpXBzO3JbEsyTbT3t/ra5prmc2Yx6Ugw0LVpMohAFGNVKzVLtjwCCNMVIiPDwnqA/tWxT4VuLmbLmMxhCdP9QBlyTSDGWRdP/hET5/oMMpyVXrdKRKLQdLHjrTAyVkEFAfeUJUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771256250; c=relaxed/simple;
	bh=DO7n9ub1334CdLYQKXYxluQ/HCaAr+zP3EqnRHksSNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WoNsIRctnidvoXGcv6IwigeqJtV/QYW7uAAExwtlULdQPjJUjL12Fp/TZoVYDW0ISejARLN+YIYr7EwRnweKqt1Avf6iwICnU2K22dq5Gd0RnyfgOvTE+CrOAKJ4qa+SapwehDwadYssv+mAuLI7mbKArpdHQaEs4fsS+kCfHkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pa3zoM5U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pa3zoM5U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFA1C116C6;
	Mon, 16 Feb 2026 15:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771256250;
	bh=DO7n9ub1334CdLYQKXYxluQ/HCaAr+zP3EqnRHksSNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pa3zoM5UCaHRTmc+OeISBP2lKge/L6zsncYONYLtMrCRy4i6jcwYVEGGPq0huPhsj
	 T+Jykn9tukz7L3+2t21ewReiOA5ijsdgf6Zp1WtNKM/YNLkMNEAPIxV8piwXzDuO2o
	 UzzpkpSoLZ/6UoUhSpmjXKuB4Sh6grEL8RuPn2Iyh4SkAZg8CY66EdY908gzcxUBld
	 B///9me/RUb7g/g4qnF7x93JNBTXnS6JlkhLHcCXms0eF//+R4dSVkpnniiug9YmqP
	 3y7K28amUYM958fhV1xn67u48yAd+rKOcmak84vfpsREP9gmwDB7MAhRIYwdkIUINY
	 x8YgAJEGf/mWQ==
Date: Mon, 16 Feb 2026 15:37:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] linux-next: update maintainer info.
Message-ID: <3b4deb86-4684-42c9-a170-1dc335d230d6@sirena.org.uk>
References: <20260216060739.2791462-1-rdunlap@infradead.org>
 <20260216091648.7a6a0e3a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RJhE/fR3iI+SBkRV"
Content-Disposition: inline
In-Reply-To: <20260216091648.7a6a0e3a@canb.auug.org.au>
X-Cookie: Beware the one behind you.


--RJhE/fR3iI+SBkRV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 16, 2026 at 08:16:48PM +1100, Stephen Rothwell wrote:
> On Sun, 15 Feb 2026 22:07:39 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:

> >  LINUX-NEXT TREE
> > -M:	Stephen Rothwell <sfr@canb.auug.org.au>
> >  M:	Mark Brown <broonie@kernel.org>
> >  L:	linux-next@vger.kernel.org
> >  S:	Supported

> Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

You've escaped!  :P

Acked-by: Mark Brown <broonie@kernel.org>

> Maybe update the CREDITS file?  ;-)

Good idea..

--RJhE/fR3iI+SBkRV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmTObQACgkQJNaLcl1U
h9Ak6Af/flyrXLfm6nv84hJ3Ji329g/NjAzPhAy6Mp3AlKs/s+dLmVi1tZX4yVdh
lf8lbr2vZ/waC0KXKnoWONaZ6ZxJxFDC6Z82LzPpq3rVUqjy7pGoEfeNR4nDbJwD
lkYyWLDgqZiZ8x0924Vpec43eliyJwBfudVKt6TkkkQu5f/7pePY6zajQbE+nmcI
jR5NRsmhHnAeb58sAzc+JQkvW+Ap5QiRZDk1JruCnF1WU3uGC/u9RtOghxkVmBt+
xYY8uU+2ZB8z2i3ws9z9jg7GIncmBLsMNOwTaVHOF+kl9FZmPu/wDKHAaWtIFM93
o+CPkMrydyzGGV6j8A8es5zzvoAyPQ==
=Qeiw
-----END PGP SIGNATURE-----

--RJhE/fR3iI+SBkRV--

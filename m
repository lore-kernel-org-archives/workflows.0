Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699351;
	b=z5bzY1ygbj4SZVSd16zCeErkuDuxpccQfRen7UNDWFbEr8P8SBOkG36oY/h3ItS2B09q
	 j611E4o244x8S/MEEBzo7uuWzvgBVPlYkrTwY9xRotMzN3lOItDCqsjp6LBbuGdkVDrtr
	 DIe2JJ2I9FL0db9zWhbp2127Vj98RJZWHDj9EswLv2bBR+ecXD10SICE2mMzn1H4edLwt
	 EzhPWGwr0nM5kzI4bS3988Llz0wMAOjezDFznm3+DcCyr2KKx5TVzlGrhI3x6RMrAlu/5
	 KW7Y5RJey3sHA/yFjuoiwE9hVeTpZegaymUA/5upHIUtdoVnup8z6Sg7DEGjnQYkpqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699351;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=pRA+DHfGWeaMhA53a4IAlD3vSINYBsp2pzpaP+cXurs=;
	b=rM9qJLyUnuvZQyrgrXYZ/j7QcCpo/XN/oK3eapu+djOXTHIiMbfosZnyvRozRbJoQ7Hj
	 zmrme1IMEMhhYhLvzr2SS8ItAp9SlUzP/tEB/Yz4jAOAeJF7Gi01SJ2O9N3tW2EoVHU+8
	 LOJ/1O6YPEmLRyq0XGJVAnHHeA5CB/JliV1tNIUrjFDmGr1ISWs7abT6lqVdEKUaqrjtb
	 rm1M+Lm/6MW/a7flsewLrUPD9bDUMICPU8c3Kg+zUkmifbBF7LiLQLNmczA7k+Kx281YT
	 ngIMLqnyws6RSjJXIg504PQ9nZeNMLmG5zetiba0yVoaqnCW8Kxqm6KnG9oZEmW9TxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZZdF9qx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02EC606A321;
	Thu, 26 Nov 2026 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZZdF9qx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0841F000C0;
	Thu, 26 Nov 2026 13:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699350;
	bh=pRA+DHfGWeaMhA53a4IAlD3vSINYBsp2pzpaP+cXurs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OZZdF9qxAM4TvFeWxg4noUjtz774SD+KOJsWR++yGfntW2i0PUmVsWBjR/1MEWs0G
	 XIuGw3GhaPZ6VbYJZXeuKSXgcBhcfMkx9NArPifUURnIoVJxG1FhkecyK3kvHFIwOL
	 F7HBCwakOO+DZQYa9zAyx96Qd5bOFaHLA+VdGj+wef9asvOWKZzTXve3ss17q3Klts
	 xVC5AVp5LTbPOIWQFOmLCB7ZlXwuGt1iqCkesmc+xWCrjlGl/D1NSqKrvaBqGg3zi4
	 DyNS67MnimhkfH8vgY59FLNbEx5LbCl0OZYd1nj8JaAWz0ndCRGQ/HNr2ibpBroupc
	 jNOpGcTRySE7g==
Date: Thu, 26 Nov 2026 13:22:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Limit backtrace trimming to
 timestamps
Message-ID: <00561b8f-c85c-4cb4-82dd-aee3d14e509b@sirena.org.uk>
References: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
 <d4848afd-a23a-4119-ac09-1fe5e4681e3a@sirena.org.uk>
 <20261126125959.GL774860@unreal>
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
	protocol="application/pgp-signature"; boundary="9qSpjWDR+aq0kbev"
Content-Disposition: inline
In-Reply-To: <20261126125959.GL774860@unreal>
X-Cookie: Sank heaven for leetle curls.


--9qSpjWDR+aq0kbev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2026 at 02:59:59PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 26, 2026 at 12:23:36PM +0000, Mark Brown wrote:

> > There's more than that, for example when you get something from a
> > syscall on arm64 you've got five frames before you get to the point
> > of even invoke_syscall(), and thirty odd registers printed two per line
> > the values of which are mostly of minimal interest for posterity.  They
> > can be very useful, which is why they're printed, but can really benefit
> > from some editing a lot of the time.

> We can improve the trimming, starting with the point I proposed - the raw stack
> trace.

> In my experience, the current Documentation example and the trimming suggestion
> go too far.

I think there's room for improvement but I think what you're proposing
right now goes far too far in the other direction.  It is a very
definitive statement that nothing should be removed, it would be better
to do things like call out specific bits that are generally relevant and
should not be removed (like taint information) and encourage people to
use faddr2line.

--9qSpjWDR+aq0kbev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIMpEACgkQJNaLcl1U
h9C9Jgf9GdOHcDgLqd17ihAeWQfExtrP13oEDWx7G6hjHF+jLoJ0s+UX6y96XelO
b86Xca9aRDHu69R1WwZ2FPP34P1zqTjETiZQ3UI6dpcfYHV/dS43py7JpIKfCDkn
mNTt/DqANy/5bxpKieDBKYaRIQSgx1AtzQZCimH/Z2LvJugAxQw/JZu2HujTOGdB
cp5bXfx3QdDobhm67aX1QAe1KNAfX56iwOHQ+oj6EQkZDzxtczRINrk3RZWBcejO
nPo4AI04KyWmWZYONBAwdPzXjqFuOzAnsBjZEIkmdh78QrT+JdmHpx8MqxzeYIsI
E19FjiE0hz3d1EPz3q9jU95m4N5q4Q==
=d1Bt
-----END PGP SIGNATURE-----

--9qSpjWDR+aq0kbev--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC9318D4C1;
	Mon, 15 Jul 2024 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721050162; cv=none; b=OIHch7L8sWiBYZLny3ya6qUWEZWrgpv8mjyxE2YIAnbjb42yVGwX6Z+Vwlb2XVqrUg3xI6j1F9dttecmND+u56c+odjPhLkq/5FPmoRXZPr+4Svqg4EVC5uyDQDXiJhfNSj0y9wWCU7di8mb1m2/THe5zZVq+nOii5yxO5NPbsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721050162; c=relaxed/simple;
	bh=pjYNU0DctPODbc0T3Iu02OYjgWZ1RcXIT68ZWU+3+8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMrm3iOgOvkoeenhjU6iTCYiVwLhNmFSVaqBSMkHF+j2ZbJ+Lu/to8T3cEyxTMp0n9RCJuVlnq07tfSthH6X8uezef761paeW+SUXBDelXaLkxe22ZRBEmza//E1qbnTHl2VvPZCTNlRkKQsWLhesX+67btNoJF8mR4TNCAyVJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=js1sZibR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="js1sZibR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DBDC32782;
	Mon, 15 Jul 2024 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721050162;
	bh=pjYNU0DctPODbc0T3Iu02OYjgWZ1RcXIT68ZWU+3+8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=js1sZibRUu77S4k7xXgeNr37dkQJ8AIJjw0y5EfUlngh4rnnW3COK1xiTVUXTLIW5
	 pVPRujY4AE2xtePFcwgX/ghj329QMfQhGDe0fvUjWnU/+SVoGM+5pb7Do+MLut/6zk
	 O3yPE5AO5HQovR4usxHy4dt0HepqD3kqAZFTYDtDNeBRZf+EcrnYp2RAwsMTWsbd9l
	 NkGss4gAwX3qKJxLEfELETIx0I6vsG/q5Nk2FR9kzY5PObq4K86W/OKwzdQuFzaWnQ
	 hcnpIje5dY2YlRQdzBryt/Ijs1pN01n5V77D2b/OsKRfH4AyASS/voop+f0LGvSfcw
	 AP36HecxLzRqQ==
Date: Mon, 15 Jul 2024 14:29:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, corbet@lwn.net,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <2a59062d-905a-4b08-ac04-1811ecdf6510@sirena.org.uk>
References: <20240712144903.392284-1-kuba@kernel.org>
 <669179424b589_1a77429479@dwillia2-xfh.jf.intel.com.notmuch>
 <20240712170558.50c89238@kernel.org>
 <20240713101328.72734cb0@foz.lan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PzixMXqOo3ak+Tvr"
Content-Disposition: inline
In-Reply-To: <20240713101328.72734cb0@foz.lan>
X-Cookie: You'll be sorry...


--PzixMXqOo3ak+Tvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 13, 2024 at 10:13:28AM +0200, Mauro Carvalho Chehab wrote:
> Jakub Kicinski <kuba@kernel.org> escreveu:

> > I don't think so. If your boss comes to you and says "Dan, from now on
> > try not to reply to customers on the list, open a ticket first and only
> > reply once tickets is resolved". Is it more useful to you to be able to
> > extol the benefits of open source process; or to tell them "this is not
> > allowed, here's a link to a quasi-threat"?

> No matter what you write, between your text and their boss's directive,
> I bet the latter will be a lot more effective.

Like Laurent says I've had a bunch of feedback from people in companies
that their management understands the need to work with upstream
processes and that it's really useful to them to be able to point to
something upstream says.  It's helpful for them in creating good
processes internally and resisting pressure.

--PzixMXqOo3ak+Tvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaVJCwACgkQJNaLcl1U
h9CQXAf+NWCF5R5RQpcUvJ6/yZNNY7gTSEVry/CHXBcrHdMijjiC/88UOiOAhSs4
zEV8qPBzNknvb/BeJIFkuxPCSS06jZAn77eMf7eb6+mTkBD+D4DqsIn3fM8A8Sko
uML0E7qsnoMexRJh9DLBJBz1EumzdSFwXUAPIrrHj/2PsgNdMDu5VE97XeL533gY
XRkx7fcElRy6tNIFHkOuNlsv/r8bGUDK1yhyds6Ju8r5ZeYF1DfZ9GeRC3eVUpyY
bu2gZkuQwuHFFVctq+NWHzksl9vs8pZy5LBEtARNZAuSfXA7KMbHD6IM7ZXS56rN
EnBBYx3D+9tw7iwsd5/MUtBeUtEpsg==
=wjNb
-----END PGP SIGNATURE-----

--PzixMXqOo3ak+Tvr--

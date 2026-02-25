Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAF819EED3;
	Wed, 25 Feb 2026 21:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772055955; cv=none; b=QSHN+tJPF6FuYnz1K0R5PzvqzYEQwqGKM0fe7x5sru1PjJLT8bsl9OTe8nWr7fup/AIrII/i86fdZNqdS7TlcLIkatlCMP0f/XfB6aPWVprRku3zztNMykIgnCrBl6hOmXX+hMo1c2TKaENYN/kuJKDrtdm+QlbmMS8mE4Xmb/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772055955; c=relaxed/simple;
	bh=CruDCZjsjXrYCZyE3ojF++r9JYVqoPaMKqkQId1lEhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gree1Elp/s3C2oqB8KXnbG9pF5Jsty6hEyfNax34T9YFCdTVqq3/5ijDj0/RC0BmINz1q8Gp0IUqANO9ar+X08fDYP8k//2LihIok5gT4wuxjhhMOxumly5cm/kKTvHlG/kHi6HopORELtDuBCtyGcTvjmN7g5zW2qM4dzi1aL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuFbNoxW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuFbNoxW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C403C116D0;
	Wed, 25 Feb 2026 21:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772055954;
	bh=CruDCZjsjXrYCZyE3ojF++r9JYVqoPaMKqkQId1lEhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KuFbNoxWlmIzblRI46l2M3shUNrdezCvyED+VFq17e9fiMSFe7vOwA9pO3/ecXm6W
	 qHRxhZGfA2eNVRlifVs7X2HiopMu9salvAWaQHALwjM+pPyHf97/PwKuBHxIw5dbTL
	 ZVIurHsuZIoIKVTRnK1msxW8xBIY/l6LfNkcCmnRv+P5eQV/ZwgR/9LG7PtsKvso8N
	 C+bbVlaRlKcW/lSAx/rCpmFy0eunJRDni9U/5HeDsN2DUcw0CaLrJeNtf7jzq2iAGP
	 2qnzJfgn4gPq4fyYMbkcXLoqI389pT9Jf9RRcV7JRIMwxCwKVOhaIm+kNnUd4yJdqx
	 WV/tb2wPJradA==
Date: Wed, 25 Feb 2026 22:45:48 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, 
	Sasha Levin <sashal@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com, kuba@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <aZ9p2RMrJL1mQ10w@devuan>
References: <aZ4_sBIy8rOUL59Q@devuan>
 <2026022531-tightness-rare-6a14@gregkh>
 <aZ87Z24f9HZsofGl@devuan>
 <2026022539-commotion-huskiness-8736@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nth7q4avk33oteqe"
Content-Disposition: inline
In-Reply-To: <2026022539-commotion-huskiness-8736@gregkh>


--nth7q4avk33oteqe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, 
	Sasha Levin <sashal@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com, kuba@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <aZ9p2RMrJL1mQ10w@devuan>
References: <aZ4_sBIy8rOUL59Q@devuan>
 <2026022531-tightness-rare-6a14@gregkh>
 <aZ87Z24f9HZsofGl@devuan>
 <2026022539-commotion-huskiness-8736@gregkh>
MIME-Version: 1.0
In-Reply-To: <2026022539-commotion-huskiness-8736@gregkh>

Hi Greg,

On 2026-02-25T13:23:24-0800, Greg Kroah-Hartman wrote:
> > > Commit date also doesn't matter.  If I commit a fix to one of my
> > > branches today, but Linus pulls it in in 2 years from now, what would
> > > that date really show to anyone?
> >=20
> > I think this is a bit confused.
> >=20
> > If you commit a fix for a commit that is in Linus's tree, your Fixes tag
> > will refer to the mainline commit, and the Fixes tag will remain valid
> > if the fix is pulled by Linus in the future, because it will continue to
> > refer to the same commit with the same hash and date.
>=20
> But we do not need the date!  It provides no additional information that
> we can't just look up if we really need it.
>=20
> The HASH ("text") format does 2 things, it provides an id we can use to
> look up more, and the text is there to give humans a hint if they don't
> want or need to look it up.

The date gives more information to humans to decide if the commit is
important to look up.  Sometimes, a subject can be ambiguous to the
human, even if it's not ambiguous to a machine.  The date can help give
some context to a human.  For example, one could relate a commit to a
series that was merged around that date.

The date uses few characters, so it's not too expensive in terms of
space.  You may even take some space back by dropping a few characters
=66rom the hash.  Also, by having a fixed-width, it doesn't distract much,
as all subjects will still be aligned, so the eyes can jump it easily if
not interesting (just like the hash).

I appreciate seeing the date in my Fixes tags elsewhere, as it avoids
looking up some commits, which I would look up if I hadn't seen the
date.

Secondarily, it helps with the ID, in case it becomes ambiguous.  But
I started using it for the human part of it.

>  There is no need to include anything else,
> let's keep it simple please.

Okay; I won't insist.


Have a lovely night!
Alex

>=20
> thanks,
>=20
> greg k-h

--=20
<https://www.alejandro-colomar.es>

--nth7q4avk33oteqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmfbYYACgkQ64mZXMKQ
wqmFdQ//SBTPP019qmEHD3YV3t3mvASPh1zpQ/Yp+rQIWUQTLyeSW9ZvMkkeqllC
nZL+eVO/fMOgePJtNZ8obcmnxDm508DHx4t0x6tekx8cFq20Arv5+SY1tR/5BOil
IqIh6IH4GbnjBpz/hvQlifq1TonnxhX9e+rcm6VeGeQhzC+WMl0ojwgDQPezap7Y
A1XzYnvXkEEgcJkMh3hg+6LOV8lliFbI3sgiIKp4cGwbmyjQBOeQ6B+JGTPN4Y3U
vLEVaJHqo4Ndrxlh6B5bntBEuKHdDTwOnrHG+J4qaf5lEvBMJ/bsqnQO7xaveLrU
cqBC2EwPiW/9Fi2RrHdcFHwMKHgSJe3g607IC4NZ3ZxI3EMfLr7PaQNF2Py+lfti
MMa2c/Y/or5S1tNWg76O2NR7zo8UXTFPLy93jLZFJlHs7aR8iX8nN8gzAK3hyR6A
xPhGsPrurXhqDdsdEpFDte5HIkIL7hhZxnx7QDYETTwa8TJIF3cbZBCkajaq9od1
+jzS3Fd2HZ923z4HnyootB+0cAPSSAnoSjHLAM1gxOLvsxi3DHp59IaFiWCm3Qnh
Rq54Eym4f9F1wOwoIx8DLuxnF+QcF93RdCHwQTzpnMX7/XG5/rRf7X/OnzuXjOSm
B9l3ZJjZiEM7dNu1OauPLhTmh+zDVtx9IzAT0jtAZctNfL5hM/I=
=9pXk
-----END PGP SIGNATURE-----

--nth7q4avk33oteqe--

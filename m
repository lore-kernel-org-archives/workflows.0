Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095997;
	b=ZOfxzxc7L0cr7GGTUZzN40Bqinni8QpaLjGEOMBILaMLnJjZYtjVCgqUYbkgBBYXfXEi
	 ZWr44sBJ6I6mH05F1DUci9VKJhyX2vniCTngCLtYH67IPzIUFjsZQNNVHeFWIYhHI7/O+
	 6CMe6/DWqRJT+0Z/MbSMG4wyrg3rzAZafZFoz20dNhSCRxGHjWNzmwPklTQFcLyE8ujSy
	 M40Drsj2fRA+7J7QBLERoPUAdtl4rNSk03eIBsllvTMYf/tIsZ1NoOPTXOZ2nHjLtgCB1
	 N3caLrtfpq/TDnY76Sy2gzxcLiXR90fzqLoblXbi10wFupz7v2sngPfUUN9PJjW0nmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095997;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=K6c48fOGAG/eR5AK65D44dlpQvLqtxWSyQFSKksC/vo=;
	b=bdtxhfVaUj33R1JHDKP9NJMAMN9bKSnlQh+zs1/4NdziyvQRGwf4weYsi4Ake6QGK2PQ
	 SfdZrO4M/ylhhhU+X5NXQBh+bEM+UMyjgLXCgTpUL4n76IuZ5Q+AHMBvCr6rsclyZyNmY
	 mTs8AOwOn6fAQBUrEevEGtrEuWMYXr5E/b8V4SD7nhQ2ENqAxVgDX1VyB0dXBu58t30cd
	 ZGbw9aGIHsz32oA55TURpiPemPnJQAHYeC4vMJ4lT4LS8gtl0YxhTTEljdF37lAG+/R9Y
	 wn7n2mjfB54rjaAYODNxMvJ/xWOGxCT5drjF9jraeF6DLifnXCM9ZKRvCdvacpWVTwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1+TuU4u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D988606A339;
	Thu, 19 Nov 2026 13:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1+TuU4u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 642A91F000C5;
	Thu, 19 Nov 2026 13:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095997;
	bh=K6c48fOGAG/eR5AK65D44dlpQvLqtxWSyQFSKksC/vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f1+TuU4u5pQY0jlxM4FxicBn9e3x+JEPVAJoBXMJQPCA7r4sIu08tDq/G3USbMOMx
	 unmVpNXoTEzJCOslI1jCYxOSiTVipGJzd0mU1yu2bG1KsTrdO9fn4hOx3OV3Pc+TYC
	 EnPqgztpgXWXjDuTlYUH6GD7YCdVacVJlcrS3CZ8MMKD9hqXPn0Twmc2kuAXqlt9bG
	 AX+eyjaEZPtQoDAlp9cMKEXoLXNcReaFccZ6knlIC+Jcw/MRW0izkof37GZSGwJaY3
	 1+BWQeEXtoJwhpHGpyrvlxhDjJdh7h9svpGoUGPmi6ndaX37BKm3EqI3OKo2E/6eja
	 m9ammzn2xPOOw==
Date: Thu, 19 Nov 2026 13:46:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <2d232c34-b111-4228-a049-6f037370c17e@sirena.org.uk>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
 <20261119111902.GH162713@unreal>
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
	protocol="application/pgp-signature"; boundary="Gz+MSdAl/y4DDapf"
Content-Disposition: inline
In-Reply-To: <20261119111902.GH162713@unreal>
X-Cookie: I'm into SOFTWARE!


--Gz+MSdAl/y4DDapf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 01:19:02PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 19, 2026 at 11:13:57AM +0100, Krzysztof Kozlowski wrote:

> > That's often review feedback, btw, people just paste huge bunch of dmesg
> > without thinking what is useful there.

> It=E2=80=99s still better than AI-generated prose peppered with short, tw=
o- or
> three-line stack traces intended to trick me into merging a patch. I=E2=
=80=99d
> rather trim the description myself than rely on random submitters to
> provide exactly the right amount of information=E2=80=94no more, no less.

Honestly, it's generally just as bad - it's usually multiple screenfuls
of irrelevant noise which doesn't visually fit the format for a
changelog.  Half the time people put them in the middle of the changelog
which doesn't help anything.  With the generated changelogs at least you
know to skim read the whole thing and not trust a word that's in there.

--Gz+MSdAl/y4DDapf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr+/bcACgkQJNaLcl1U
h9AgAwf9FryBvv/AjLFiJUm2t+yRQAPDmd+W+LDj7Ux+kVL+2QlvZYudoAQXj2d5
odV8kewKa2I7e/ZNshnfLrDtOoYEHvO+OW0xIejKpyAWFaYcNbv+2QKh2tYLmAsu
DXzU5qQKOzIRbECO930rHRPtPe5yflUTkPWIQ095jgizzDn1ubfZgjD+cdK3sX3S
RjlyKIXJEYHRJBMNIfhkjXjBx4neDuvhFOcQkENAb6sD4H2a+7ui4ffNtIRmO6zY
2bNI6ZSRel/2Ojj28qvNXheklWCJ8KqTtTNTifu3tE0Bf+8MdG0mOpdmk1giP0f/
cKOZf9z9qVdiMkfi3DUJaM/N9oL+cg==
=UiHy
-----END PGP SIGNATURE-----

--Gz+MSdAl/y4DDapf--

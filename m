Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802761;
	b=pgiIvIX7ZjoeVrvzVJbjJjdlmHq4WfzwBrkaAk9s3LlAVV2KR20GOY9Ro7lcANlWAx+v
	 AEIk5Ph4dp2qFwot2AyTsY0+0uzQrBpTqFGYeDfrWgk18E9LRFmduBD2ym1VGory5nVuw
	 gfHkzW9Oj0BvE6olpZSzVfrgzwT+crbUk4K9jZchsPrlUI6i/HZ5n7PM9jY7Cvd3/a6Bt
	 OXDIA65e59aBwINmXJeHhZ0ymRZboRcJsA/u2/cWkYzYQ8YVZcchXHc9iSAByuVol73xP
	 D0fzRVbLgerLWvBzcOQhm1Kfnd64IzwZRlz2f1b5lMKiyH6VCnVVP/zhWZRuQmRuwsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802761;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=I/pvj1XLbPhGckGqGBwyjiWR8aupycUpqxdRd0S1ik0=;
	b=Qg5Ow/qbGM2MO4Sk36+Dl24Jnli31tC5etGkzZPBri9j9PiUfC4hWMMUYWyVZVwrLVgr
	 tHqMzwMNfda9VGK5kpjFSEq9sBiSq6usgsGinRRz0WKS+LL82bpUsZmUG/8sT7CJAfNm1
	 aqjgdQDfRNCR8lGu4WCfAeU1nGYPt5Uxet+Bx9ecWhOJF4Yg6dWFZzaGz2WATyla8tOZB
	 jCwblIxeX49RsnpWS3j7pwgy4CBTynqY2PX5Jx+G+VkN15SP8UWc2AfaKeOH+MZbHGc+f
	 0Kd9pewHdQ4PwqKgjRjNlOV+ql1yJ4/y6DMzTQJIjvISiEtvZ282tHss11spHkW2jYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L492pW33;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B1B606A31E;
	Fri, 27 Nov 2026 18:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L492pW33
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121C61F0089B;
	Fri, 27 Nov 2026 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802760;
	bh=I/pvj1XLbPhGckGqGBwyjiWR8aupycUpqxdRd0S1ik0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L492pW33MACNYY7E16ulB9EElMi/oEC6GQ5+mjpc5KfFYEuo+v6z1tgIMSK8xzj88
	 Zb4PXH/aKps61wqe0mCLJoAGOtokf7lzvGXDOaK8EpTV3yIaHk+GHrq13FzSYFrd8j
	 SCLIo96XnQB0XIFhgZTI/LmyR3g4ZvNpLv5eRnjXRGmxNCeVk8+Z9ujWLtbAZBzNyM
	 LVR6XVtGhrZflx0mlR37bELNpf5iaAY7wN918c5y1RxStyYNGKrzGBTyPje8DOD4Bo
	 xvWaWGUBrcPtg3ffePM3scLbH0BsQ7rlu+ZiA+A5lNWaA00qT77z+8cBwSDNWd6l1H
	 vUR0S54PUllLw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id C8AE33475F07; Fri, 27 Nov 2026 18:05:56 +0000 (GMT)
Date: Fri, 27 Nov 2026 18:05:56 +0000
From: Mark Brown <broonie@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Sasha Levin <sashal@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Marc Zyngier <maz@kernel.org>, Eric Dumazet <edumazet@google.com>,
	Hans de Goede <hansg@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Jonathan Cameron <jic23@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	Security Officers <security@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs
 and a cover letter
Message-ID: <0dbebc8d-50f1-4b79-b078-85bfe75298e8@sirena.org.uk>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-2-sashal@kernel.org>
 <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
 <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local>
 <awjopqoCJqwChwnF@laps>
 <awlCy3vDs0fKx1ku@gremlin>
 <awlNYsu1y8EhYgor@1wt.eu>
 <awlOYxw29ANZOA1X@gremlin>
 <1b630619-4388-454b-b295-6ebd0d912a32@sirena.org.uk>
 <awmRvPlPoyMMzHsB@gremlin>
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
	protocol="application/pgp-signature"; boundary="8vQx3/x5CnyfXYVy"
Content-Disposition: inline
In-Reply-To: <awmRvPlPoyMMzHsB@gremlin>
X-Cookie: A watched clock never boils.


--8vQx3/x5CnyfXYVy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 27, 2026 at 02:25:20PM +0000, Lorenzo Stoakes (ARM) wrote:
> On Fri, Nov 27, 2026 at 02:11:27PM +0000, Mark Brown wrote:

> > TBH I think the issue you're seeing here is the changes themselves and
> > the changelogs are a symptom, it's difficult.

> They're both a problem, but the commit messages and comments are consistently
> awful and a major cause of change because the commit msg is where I get the gist
> of the problem and if it's word salad, their ain't no gist there's just pain :)

Honestly in those cases (where it appears it's a generated text problem
rather than an English as a nth language problem) I'd tend to just get
back to the submitter and tell them it's too much work to parse.  From
that point of view they're some of the easiest serieses to triage.

> I really feel the fundamental rule here is 'only submit what you understand'
> (90+% of AI stuff I see breaks this rule, maybe more).

> So writing your own commit message feels like a very sensible thing to expect of
> somebody.

I think this is more of a people problem with the submitters than a
tooling problem, I'm now wondering about changing submitting-patches.rst
or something (not that the most problematic submitters are going to read
it but hey ho).  We've had iterations of this since time immemorial
(like the people shutting compiler warnings up rather than fixing them).

--8vQx3/x5CnyfXYVy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCawnGgQAKCRAv73Ows9A4
iY1rAP9SyBGGlFOT0MphfP6iTxXdAOn7wfjwR1odx18x7qTdQAEAjnEgh1kijbtW
bFZifGLq5IPRp4WEf9Q5y11lWdtI9gI=
=EOTJ
-----END PGP SIGNATURE-----

--8vQx3/x5CnyfXYVy--

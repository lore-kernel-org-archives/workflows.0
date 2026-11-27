Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788695;
	b=bNSPSE3udxLWvVsB2NOb3IeayVeJyg08XmNqkwQWu9XNYcC+Gc96IVYItF0BfDasiM4V
	 pYo4agzCcx1fK3qjM3UI9BPp4F6W+BZeGysQ30lR4waouB6OT3H5Hq1c8JuJf1lxb53kC
	 l4VC+NHH4EyZVvhuoqKgk5KmGf7SP74pT7/7WM/H8apc8XVebM+TUAiimcLOhYNHPbhny
	 EjqHHWi6fIeMKBjK1BJjqux1PRnlXMOY/NAohroXjwtsh/BsE8/L2mcKdvX8AxvGt2gcg
	 WLU87i3dVIrG47IGIeqF/K+P/16dmXrEKbNOqGlZpEktPv/Q9AiejtPsb4L17VosZJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788695;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=UR+KIBD3pM3NapalVBzxUYxlNa7pSEBQsFMfWmq35tk=;
	b=RRNRRdabHsxsx0rA3likaseMNtV7ZEZ9T+/qdFrcAOV7rdfT7B37DWRcI+8Ht1jl0BRC
	 YNIxvMJBMPJ3xYmH1ybh9RZLTBsECUJsOTNuK2xnIQtWlnqI7iHhl6YnD4W9t+SlJar6W
	 BKc725kaJKxoMYRJxLdm8ShvSJ0t736WXp2d7BNmlrlqMLMGepKTydwHA2Ix1RNa1Pf6G
	 KnCK18QTr3tHkq7oHiTfa1Y3Y+vIs2g6rIZXO/JHy3hFCuneVVyp+QQc1/fFs2i759Paz
	 fXxllTnfaBLcfFlGj6RR3Z+tqNQyNItdGyBcgv2yGSK9If22mpvdV8GOGfB42ZdgNDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eyrqheMs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E681606A31C;
	Fri, 27 Nov 2026 14:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eyrqheMs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E781F00893;
	Fri, 27 Nov 2026 14:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788694;
	bh=UR+KIBD3pM3NapalVBzxUYxlNa7pSEBQsFMfWmq35tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eyrqheMsuOz8e4LBBgCQlKpiBZJc7D0xm/j2SkB6CEJbWT780hvml+qt+er8pjqmr
	 UgT1AUaE/JFzoGnSe0reuwGTO7lW6eX8yZSMTxCIBPWoDGPK9ZX1/hV2fvYL+4+kc6
	 WiywSMWhWckbPnzhO/e33rHFlZJy3HKT4bVZ3GnrKvr+2YNgVNSW5z8i7C6oPgPrKA
	 sYpxsL7dukmweCmlNgGuLa1/TX4HH0UXsBZJvlNj6JOsyniWv2glPc29etMSEIXh4j
	 boVnVaAThMYIrptDAf1jQuxEer4HP1zo18hBAkrVUtaxotpJ4r2hi1T8EekpUdR2dH
	 9eAZgg7vC+1zg==
Date: Fri, 27 Nov 2026 14:11:27 +0000
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
Message-ID: <1b630619-4388-454b-b295-6ebd0d912a32@sirena.org.uk>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-2-sashal@kernel.org>
 <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
 <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local>
 <awjopqoCJqwChwnF@laps>
 <awlCy3vDs0fKx1ku@gremlin>
 <awlNYsu1y8EhYgor@1wt.eu>
 <awlOYxw29ANZOA1X@gremlin>
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
	protocol="application/pgp-signature"; boundary="QkIg6Wnb62tsl50t"
Content-Disposition: inline
In-Reply-To: <awlOYxw29ANZOA1X@gremlin>
X-Cookie: Sank heaven for leetle curls.


--QkIg6Wnb62tsl50t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 27, 2026 at 09:38:43AM +0000, Lorenzo Stoakes (ARM) wrote:

> > time but when properly explained over long sessions they can get amazingly
> > better. The other word was *most* of our humans authors. The Linux kernel

> Completely disagree based on fairly extensive review experience. Commit messages
> from humans are orders-of-magnitude better, it's not even close.

IME it depends a bit on the complexity of the change and the area, for
simpler stuff I'm seeing some obviously LLM generated changelogs that
are at least as good as some of the worse human written ones.  For
complicated or core stuff where you really need the changelog that never
happens but for things more in the "get audio working on my laptop"
realm it's plausible that you'd get something useful.  For those simpler
areas the tradeoff with the submitter fully understanding their change
is a bit different to that with core code.

> They can get better, yes, but in my experience consistently remain
> appalling. Perhaps excluding rather mechanical changes.

Yes, I think it depends a lot on the scope and nature of the change.

> Of course I am happy to be proven wrong in future, but for a policy going
> forwards, that policy should reflect reality.

> And I think you missed a key point I made - that this is _crucial_ stuff as it
> is the commit message(s) that give you an overview for review.

> This stuff alone contributes to maintainer burnout. Let's try and take action
> that pushes back on that.

TBH I think the issue you're seeing here is the changes themselves and
the changelogs are a symptom, it's difficult.

--QkIg6Wnb62tsl50t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsJj44ACgkQJNaLcl1U
h9A/bgf/fKxFVoV2/IwAKCfwO/svENH0HaiOIGj6bPmpXkrs59CNqFArsvwBwM4u
Ao7sRb2qN+RC1LNNPEcI0NeVALPy2DtLxzy30BepVp5qW31i09ymUCdAiFjdDDHp
H5UDBIpgcTXecFj+gLk3vF+KR4cPVSDfncH6NctrNbK88SXmNc8JdFO77FDESdf+
hDbWOaQfjuyTf6dlywcIV7gbmeTBv1ss+Af8j2UyXgdDLoycNOsQ+sOEydAUBywx
Lq7XO/bDXuGWpnu8Onj9NauWJAkvTjzaqKcZn4YuzG9E7kGJn18hveGMvJXK8vds
7JqQWmOBshyuzXjVa4D2/TsEo3tu2A==
=1e4i
-----END PGP SIGNATURE-----

--QkIg6Wnb62tsl50t--

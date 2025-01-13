Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C91FBBF8;
	Mon, 13 Jan 2025 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780901; cv=none; b=jpsHrH8ZfPTxm+4GztN4F1jIN3rrRMDleuW58wHMvx4OOecUmTYLHlIogv07Jq7U91VtnS8t1TMqmMGN3w1SD7oY0eqXB3beXeyaJkAPwieqjKMluJG0pQdQpMPJUkAjyG/Fo9HPAOu96F827WDWTC7ALUSdYp3KExTLV+IDI0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780901; c=relaxed/simple;
	bh=6y+oBv9S2BUslPSzeI80pmT5oduPbD/vM8DxlkPZNh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovUCNtQSd2lTvZZhITQIgFVTCxWfZPElYL9i6D3oY/zWjV+n4JdiXAYOohFCtO5gn7wWHvVK0xBQUgVqocJdswhbZPfK5jV6E07lFhYgmtgLGY3iBS4B4G4R2CDHev27f8CuTqodKj4YiTU5EYvSkAUnvJwuuDqTdcVo4nE7mxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=imTy6qLd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="imTy6qLd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03298C4CED6;
	Mon, 13 Jan 2025 15:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736780901;
	bh=6y+oBv9S2BUslPSzeI80pmT5oduPbD/vM8DxlkPZNh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imTy6qLdvla+UTBjz2oyAOnycMZfP9f/aCRp82bDz3ra84prbLoIiKdzNUOsj0jsR
	 W3aSp82Tjn2gpN9pJ6xE9dy+HUeES+2vwfYvq8BhtwWfDBv7refkSmRJtDkJDrwh+X
	 Ivn7HjWMwGJtwxMxEVesXztG1LmTZaVOJzwVV0Fso8/QVSxWlQBgpc3A2YoSrePElM
	 5WaboXO2nyAHkBbpJ2imtlsR0zZ3AxtyKCFZQxWepoBcMcUGpDoNrNV1+/0+vdWU1D
	 FBsVZ6ejhdulIJ//3OkhgoJjHrAw/ZUZwS3y3wgh2/OsEOCe9VOvssIP2zygF8ZvT3
	 eqKz3lJEd+y+g==
Date: Mon, 13 Jan 2025 15:08:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com,
	kuba@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Theodore Ts'o <tytso@mit.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <f2ea6923-60dd-445d-8534-03e80c21bf5b@sirena.org.uk>
References: <tencent_6CF6E720909156A227D23AE8CFE4F9BA5D05@qq.com>
 <tencent_F8CFC8ED723F6E8103B4AF3D98D63D7F1F08@qq.com>
 <20250110080331.04645768@gandalf.local.home>
 <52541f79-ba1c-49c9-a576-45c3472d1c79@intel.com>
 <20250111120935.769ab9a3@gandalf.local.home>
 <CAMuHMdU095ySTFJEs7bvX8kN2kBcnnUkec3hbUxUbJBGf8B=pA@mail.gmail.com>
 <20250113095101.4e0fff91@gandalf.local.home>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4F5stZyCrItxBpcC"
Content-Disposition: inline
In-Reply-To: <20250113095101.4e0fff91@gandalf.local.home>
X-Cookie: You will outgrow your usefulness.


--4F5stZyCrItxBpcC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 13, 2025 at 09:51:01AM -0500, Steven Rostedt wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > $ git help fixes
> > 'fixes' is aliased to 'show --format='Fixes: %h ("%s")' -s'

> Hmm, I've just been manually adding the Fixes tags ;-) That's because when
> I add a fixes tag, I also do a more in depth analysis to make sure the
> commit being tagged is really the cause of the problem. A lot of my fixes
> tags are due to very subtle bugs, and a lot of times its a combination of
> event that happened.

> That said, maybe one day I'll use a script or alias in the future.

I use an alias like that for manually adding fixes tags, to get
everything in the right format.

--4F5stZyCrItxBpcC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeFLF4ACgkQJNaLcl1U
h9CiWQf/Q14orlO9byNgI7u1kMFBpooTg9Sx/cg4WFe/j2dfxVi4rdExRIS1Hl8I
dSlYcns14j2UL1YzWIegwAR7WmJY9vdd6eo6KV1aOUmpy9eqb46EZv7C2A+jjLq8
MbEqXjKPs1y1UL1A36v1oMH7Fc10+qD+3DxSjCyw3jIKoA8oz+uqFVpsscs3+c2A
UFfIHtkGdZ1OoF8J+z3721785vo0RytIrwb5+qWf1n0bgbDve8qPRNvoKsTi3omM
PKiq7rE7d+P8jhygajsTck6n5iw/89OVccQ7W6pZC12CBVhy6nEHpATEY7+whULU
YF6368jum1NghQx0g5F97PCJAA0YGA==
=TDJF
-----END PGP SIGNATURE-----

--4F5stZyCrItxBpcC--

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974984A0F
	for <workflows@vger.kernel.org>; Mon,  2 Jun 2025 12:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748865711; cv=none; b=VQnFSFK3VqUW0l4d8b6MYnV6s9v8h8o67InyQvo5Bw7mWyHAXcdafcYjc7FrMHdZl2dvHkEoLPADQOhOQ+Qy7fxkjFbod6HrZ3zsNowTCWYiJEOqg7wkmJ76HxYMmht7sLoFotNpK/YlfKnSEya6Os3TCbSa9Xf2tztlUwn5VK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748865711; c=relaxed/simple;
	bh=8JIY4leqKMwT1ff3lwHDEapomGw99xGsnLUqHr0l7xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CL9ua/ZoqJ1bvyVFCBNjoPQeyxuw6FCikckB00AmcKfVmOQZfkQTC4CyutG4XgxLLAEH3oj0JyeqrjxOFFPQilFZBXbqFzyB6u8vlI9cv9BYSPEQ3wKlktKEeKzECYocD2a3uXduEOvFqJ9m5H+MXNoK/dGZCQvyYlrbUQeRc4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLVOhfCL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLVOhfCL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4DFC4CEEB;
	Mon,  2 Jun 2025 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748865711;
	bh=8JIY4leqKMwT1ff3lwHDEapomGw99xGsnLUqHr0l7xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HLVOhfCLEVXNmoUSO9ouCOhIiQWV/u4KyRjfVPydH7GYVLtfCXReZlyGmaZG51Ihv
	 55tBXqRgGJPVpWiS5NWGJVlxOW1OvLGxj9ZbJfO3P9cEcOrIHqGTS2OGOPBUatF7KC
	 CZKWYWdASYSu920TX7qWsGKqr6JiLdCP6Yh6ncxRAh7RtdT1lNSHaIEziT2JrpgDzS
	 e8IJeqREvwqZtrXjwFQblQWlXJo44Rrw73+V/gfH/bE/vWmReHteHYRG8LT3ZdVVcf
	 qCth6j+g7OZjqDfRg0Whu+PaQ/io/BkIsfe8FFg8dSAqo6wh6JP252N6Ubj8Jg9y2D
	 3vK6OVIOHxKHQ==
Date: Mon, 2 Jun 2025 13:01:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: workflows@vger.kernel.org
Subject: Re: Fcc with "git send-email"
Message-ID: <d75ec030-6e4a-4a15-aeb5-c1719cedfe25@sirena.org.uk>
References: <202505301222.55018E78@keescook>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zXlyW4kg4ugR4Lo3"
Content-Disposition: inline
In-Reply-To: <202505301222.55018E78@keescook>
X-Cookie: Knowledge is power.


--zXlyW4kg4ugR4Lo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 30, 2025 at 12:32:04PM -0700, Kees Cook wrote:

> I'm just curious if anyone has found a workable solution for getting
> "Sent" folder copies of emails sent with "git send-email" (or similar
> tools that throw everything into "sendmail -i"). I'd really like my
> patches to show up in my "Sent" IMAP folder, but I only get this if I
> use my MUA directly (in my case, mutt).

> I'm thinking it might be possible set git's --sendmail-cmd= to a script
> that wraps "mutt -H ..." or "mutt -x ..." but I'm not having much luck.

> Has anyone else done this?

Not exactly what you're asking for but I do this by letting git send me
a copy of the patches and then filtering those into my sent mail folder.

--zXlyW4kg4ugR4Lo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg9kqoACgkQJNaLcl1U
h9DlpQf/cdfwGrT0M4cqP3+eiQt/vC8SI+pGzNnRgiK2UOt2E+AvBHvNGI9TuKMP
25FqyeXmK792ONFpu20kkMvrtf91eNzMJLeKJboJN5djpFsh/iVD0/LD0wIEh/tH
RwmEyQekAVzxvS8/csDXgkc2DRUBdLEgH30M3gAFfuMdmTPLf8YhHzR9A22WCQbq
0O7PzQPqH4qZs2iVEh9n9hj9oUQxgJ/IDkrI75aM3O9nEXV8kzutKenhxZiLj+l3
hZI+4J1gVADyOagkKfcG9Nhy20b2dOC6zJfIr5CeKmPfMLLGdLPReTBwziLlBqaL
BUy5v+U9g0WISvhHUZCqGc/lnVoBVA==
=QQiA
-----END PGP SIGNATURE-----

--zXlyW4kg4ugR4Lo3--

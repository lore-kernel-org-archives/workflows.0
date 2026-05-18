Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AFE3CCFAA;
	Mon, 18 May 2026 08:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779093217; cv=none; b=MF/yp2AzO+HkNns0lutkARFx5cX9yuhqrtKw3WoUxr9aiaePFPBCQbG8AYwXubXji6dglzUKNf2O9zvgyo85piJc/glHcuPEB2M8tq+k/4upzH+XwqPmrDtpHRmY2k9lwdnQIcovyTr209V1DW/fNPVKDn+/H/aSPRyBjlrxrh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779093217; c=relaxed/simple;
	bh=aYxne9UHw2FEiX9EkV01HpPc+mA9feCKx48/hoBcxFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYiiNu1F9BYrm769gMuYoZ8IkHxSO/01WXxahfgF5Tyonky8WRHZoUhdtyai8uGNDJuOnW5WMpgExVrr+spnjbSgaSqLDSHvsjJ8CR/cM/faMZM1iGujY9INWZMQH7hVVCX4rrtqPduGPSXRIA4W1ol1WCI38ygq4uqJn63feyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNxGQQZ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNxGQQZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C846C2BCB7;
	Mon, 18 May 2026 08:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779093217;
	bh=aYxne9UHw2FEiX9EkV01HpPc+mA9feCKx48/hoBcxFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mNxGQQZ9TkHzd+LnFWE3ZFwU2xcmOXpT4gieaWYM5Su0BscXqS2IPSyq3IaJ9ygtz
	 ypPRou8S+VM8CXGcawi7cqeSmknLUS33+ZZ6amRCM5JVVyAdzgcTigJ/hQfyOu2VCd
	 aIVbni2DMV7tdOjIf3KzCFQ6iNzpK/xDw4uCZdbSwT2IfMgcQtCs3HprICAYPq72lU
	 zDww8H+PUbDoDomtbxlJ+PpRcNSVeGDYly+jFW1cQZv1CSYw48jg1LzQBUiBNdriHz
	 3oQZSlmCBUI7SaweJOJEBqJhyBPFDLeVNXlWAiQnOjb6IebTWi1BlJtNIry/58LC/f
	 bnMo1OnPHmljw==
Date: Mon, 18 May 2026 09:33:31 +0100
From: Mark Brown <broonie@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] docs: submitting-patches: Clarify that in English
 "reviewer" is a person
Message-ID: <4d119379-5927-4513-9364-a327660e5acb@sirena.org.uk>
References: <20260516123846.63413-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ce1e5e9b-83d0-4971-aee3-dc5a8f85ce22@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kJbPbZYADaB7ZgRJ"
Content-Disposition: inline
In-Reply-To: <ce1e5e9b-83d0-4971-aee3-dc5a8f85ce22@kernel.org>
X-Cookie: She sells cshs by the cshore.


--kJbPbZYADaB7ZgRJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 16, 2026 at 04:39:45PM +0200, Vlastimil Babka (SUSE) wrote:
> On 5/16/26 14:38, Krzysztof Kozlowski wrote:

> > Our docs already clearly mark that "Reviewed-by" must come from a
> > person:

...

> > However this is not enough and apparently English is not that precise,
> > so let's clarify that only a person can state the "Reviewer's statement
> > of oversight".

> I agree with the intent that the tag is for people (whether they use a tool
> or not to help them). We also don't put "Tested-by: kernel test robot" or
> syzkaller on every commit that they test and find no bugs. Review is also
> not just about absence of bugs, but agreeing with the larger design and
> whether the change makes sense to do in the first place.

Reviewed-by: Mark Brown <broonie@kernel.org>

--kJbPbZYADaB7ZgRJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoKztsACgkQJNaLcl1U
h9BxQAf9HjcNGuz8X85z8nRyFk+Z7sojoG4NaYKs3NSgNc0ZYDvcAeGarzbey7fL
0oRLf/4xAGPkNJEcobvK8UCJ1gpKYJtBI6NqK9xguP3L252f6bOwg7fxaA0R1egp
nGvDSpqpNnOe34f8TC8MDHg4S/bZKW7RrLlIBGWv2FC1IOptxsQDM8l8VD3gCkEe
Nm944D//UM/fc8Xn23c8Bg166RqSc+YftLSYCThvRFUkjMq38FWiAVueqRKCZFYM
t0nVVLgpT/ODSJteXKQ9SGzR2+fP+AX643GdtmINaXXvrEch9+lzhDU8xCVHmjiE
wgr/Vb4hPpwxohJJkmFANVzutH6w1g==
=diSE
-----END PGP SIGNATURE-----

--kJbPbZYADaB7ZgRJ--

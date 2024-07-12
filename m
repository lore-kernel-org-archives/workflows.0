Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDD2172BC2;
	Fri, 12 Jul 2024 15:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720797961; cv=none; b=YZxc3qJFdVjPJijhYWQ8Tg0Wtq6t0XmbBY5kjE8e7oUgt5J9p1/dedtwpuXR1fJfB1EJgRCnWpVJZAjP0QuglLnpLI5wv4iFdWWatgIJtXCa5DFBVDUOFH51GFL4S+7EXZcYiXSka+C7awJNP1FrsBy+ABE8+ck5Oc3tkZpjuKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720797961; c=relaxed/simple;
	bh=KYARmYzWdFF+lUPLXqpoHVYjXil7w463cbdxrC/8cb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l4VV720wBDO9QnVan2gaVKouelwQQBhY51LLlyFFBvEcH0BVGIBFlipSXXdq6lqgHSQ7+3Z543UWxHDqyCOFWRdkZoPEDc706uJchuNlktut89ubDMblUy0bMPjLjp1B53+mcFTts4DHF3K5YtCob/puRVOXAxlzOkqLLVRzHh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcn8ip1L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcn8ip1L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5872C32782;
	Fri, 12 Jul 2024 15:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720797960;
	bh=KYARmYzWdFF+lUPLXqpoHVYjXil7w463cbdxrC/8cb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fcn8ip1LYZ3aWgnW1+WeBCqBGRB6vczy6YCHpgBqiziVpb/CuJwd9aqW/ZSy0OmQX
	 JId6ZU30NBENgmZANyGRTPPMp5W0gr91QFt5TS5+/2Bk6IX0l2JbsNrLLdcU1rOeEL
	 W2GZPa1JcyVeYHNQ/O05Kh8y5Iz7uUv/de+MJMSbWN4yhR+WO+pSDKBXkS3knQ74Ew
	 jSul8YGJhfzhgSbBd2d6RrxmleVM9BbmX0Pbv//YEDJ+GGUhw5eFFN1JjFcrvRAS4k
	 BuFQpMLCAC+acs5kmbHyTzK+olU/sa9pKT0CUrkinH0lRx+HSnaxYLDisJX+suyQaW
	 LhbBRKcnjnUbw==
Date: Fri, 12 Jul 2024 16:25:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <7570937c-ead6-40bc-b17f-4ade34a2acf6@sirena.org.uk>
References: <20240712144903.392284-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DC9qwPNpfcMJaT2k"
Content-Disposition: inline
In-Reply-To: <20240712144903.392284-1-kuba@kernel.org>
X-Cookie: Individualists unite!


--DC9qwPNpfcMJaT2k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 12, 2024 at 07:49:03AM -0700, Jakub Kicinski wrote:

> +Open development
> +----------------
> +
> +Discussions about user reported issues, and development of new code
> +should be conducted in a manner typical for the larger subsystem.
> +It is common for development within a single company to be conducted
> +behind closed doors. However, maintainers must not redirect discussions
> +and development related to the upstream code from the upstream mailing lists
> +to closed forums or private conversations. Reasonable exceptions to this
> +guidance include discussions about security related issues.

Reviewed-by: Mark Brown <broonie@kernel.org>

I do think it's fine for people to have open places like github as an
option as well, so long as they're optional for contributors and things
pass through the lists in a normal fashion at some point.  Directing
people towards existing relevant discussions/reviews can work well.  The
main issues are taking things out of all visibility and blocking
contributors.

--DC9qwPNpfcMJaT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaRSwQACgkQJNaLcl1U
h9BjQQf/bRORmkxt7au1YJa+jROFfyMEP5aK5W3ub5/kzoLQjhFragaTD4u19oCp
W67h814hjD+3bAxGne42OOC7PmKUcy5/EbLGfWDnRLeNO4eof7EhtBzABH+zPZBz
MBfzb4FkFWSgcS+Bk3E6XdT+7vu+3W886FMiEnZ6FoO+ksfugviQItoKpXHcQlXr
Yc5cd3dFt6Vpo7P8Z8Cdif5ThgwEJsTJWamEiSNp3xyRlsCB6KGHmivTlscwiJPD
G5lmIsKIsg0h+abIz+QDXphMa8Hju+b8ZLGgXGTNoETwli/yS3NAuCipTDYKsC4r
QB6pBMhyVdbjlP46xJdExUIh4poo/w==
=tcp5
-----END PGP SIGNATURE-----

--DC9qwPNpfcMJaT2k--

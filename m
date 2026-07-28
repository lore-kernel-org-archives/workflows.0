Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41A3793CE;
	Tue, 28 Jul 2026 16:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785256336; cv=none; b=g0WMfn6OVTVI02cYbkPtf3u5rrp7GD92lG5bH/BdvIgSDOHcM6P87a8VQaHR3kjC8nIvZJjAwWfXOW/62gW64OPYwsScIN8R+nD66FNMKw1SUnMzdQ7yjcxTCGMPd5f5gJThrgDztSUJFpQvNhOnCNy0q3gWNodAK/Ui2JTE0Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785256336; c=relaxed/simple;
	bh=TOdnNwmjtl+GzqYWXxsUKT9OFUWDwi2yCZ20vMq2gwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLk/OgJEOTQ3mzfzbsWoDjrRvimzbVdy5y4SsFTn8HjCMQ3lJ4a/yP1YQsM31fa4T4tB6fCwNm80bxLTb9X7NbnUr/wdArLG4X3HzUOvxn05WGWVn9WGtGP9VJYOVScBjO4u7WglrWTfQNF44bSfHfBykOMk6IegbN+L5MrM58k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TecgJ7En; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TecgJ7En"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5DC1F000E9;
	Tue, 28 Jul 2026 16:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785256334;
	bh=TOdnNwmjtl+GzqYWXxsUKT9OFUWDwi2yCZ20vMq2gwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TecgJ7EnIO3kymOmt5AVERErerNqcAc/MKKWq9S+eq9mArfBIu89w2Y3ajbemUSKl
	 ybWBpVEKi1SmvPJq4VgqfdTzfwT+oe/RPfFympBBUzvhTevEJ06kvuU7V4B+U12+V9
	 CUDsoFbpXvOSXX3FIw+VrhAgVrp6JrpARprHBXwcwsdHXh/AqrsEm5CNrzOgxc1koh
	 X3hiBHBaC1GBtnZEX/061dIDnCzdEGQLF4c/KGeGYtM7rhfAJ1JUguWCfT+YqzliCr
	 CBfrLxMpO74AEzRnWxrbKBG4Uot9IvE+EF4WtDDAPjT+uJr8B18CvJ6xfqY7V6hlEV
	 Go7tF2H83HzSg==
Date: Tue, 28 Jul 2026 17:32:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andy Whitcroft <apw@canonical.com>
Subject: Re: [PATCH] checkpatch: Validate committer sign-off
Message-ID: <760fc27c-5270-4fa1-8f93-0d05dc94d09c@sirena.org.uk>
References: <20260724-checkpatch-committer-sob-v1-1-68550513106b@oss.qualcomm.com>
 <CAMRc=McFJaotv-Y=_hzHR5-1UL6d3Ggka0Nm3dSOkvn1UUijaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oyNKOjGA8zXjy7AM"
Content-Disposition: inline
In-Reply-To: <CAMRc=McFJaotv-Y=_hzHR5-1UL6d3Ggka0Nm3dSOkvn1UUijaw@mail.gmail.com>
X-Cookie: Your code should be more efficient!


--oyNKOjGA8zXjy7AM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 28, 2026 at 07:28:37AM -0700, Bartosz Golaszewski wrote:
> On Fri, 24 Jul 2026 20:56:00 +0200, Bjorn Andersson

> > checkpatch validates the Signed-off-by trailers against the patch's
> > author, but misses the opportunity to also validate the committer when
> > run with --git. Maintainers therefor need third-party scripts for the
> > final Signed-off-by check.

> I too would like to see this applied. The alternative is to get emails from
> linux-next maintainers after a bad commit is already published, which requires
> rebasing of maintainers' trees.

FWIW the substantial majority of signoff problems I see are due to
rebases in multi-maintainer trees, that's partly due to a few frequent
fliers.

--oyNKOjGA8zXjy7AM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpo2YkACgkQJNaLcl1U
h9DVawf6A21kGS86nd+hlR/8AujPl+Xv1IlMZPwi8zecROyZ5X0vks/ezTBoqiav
UxrnB/FaGYgK2KKdSRpNp7ENLJT1aVZT9O0nRukoamBzdluENa+fLGvbhLxxii5A
MdhpyKiPg9B2rg8JWa/lf/k4g+R5vpxjN73gHRImu16Ymhz/4pPzkbP01VpeLSvG
1ewQfWv6fs1WGd2OPXHAVY/1tVCM6D+buDGIg3C1AJW5lNkVpyuUjRKyggIrVvMr
MwoSZn4C70B7rk9vQ/ioYm25Kv0cBGuOsuIRVLqc5CqYiDXlRok5LNw53cg1xee7
8pt9TVg1cRKDF8PGBpxncu2d/0bgJg==
=USVB
-----END PGP SIGNATURE-----

--oyNKOjGA8zXjy7AM--

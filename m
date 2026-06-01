Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2C0301471;
	Mon,  1 Jun 2026 18:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339726; cv=none; b=kWxqFKrnpIgGsE5jZ6kQ8WoZut0j43IWTqRMP83on26QeI8pN30KEsDtw/vlB7V1ElXUGLnSI1kgreC3hZZa04din2aXj18Y9DdhZcZYYqzY+6vqBGnpQ5mHtDk1uiwQ7zXYNH1fmvvQPmU195ZNEelHgTRN6T51KUMhnLtU8zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339726; c=relaxed/simple;
	bh=niIeQObv+qvc0NjmGN9KFbe3nXuupsPZUMAolYO1Y2g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kPOfjM32ouWbNjRFAIMr7OKHhx1qS8Dbk4csmhymVQnhsr5tGkK5J8gYpI/ZpBYlpONFYB8S7arVqc4Xx5SjTg3Hcv7dLwV1Ntc7nTNGAibLbEsh+GOiW2G9e5pNfuHO3Zhb/f9nKHLYj4O0WWbAqSarDbHZG6AKKAQJuXhCg6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rHB8epbL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rHB8epbL"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1D81640E49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1780339725; bh=pfkB/ggiqiZS6E1RZ/5rEv57WEM9g8ZDJ1bhPydRRuo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rHB8epbLpLZ2PB89C3CY+CLVGb1H+fWputKZmaJzyRze2nrmULe+GalkbU9xIdFAk
	 bpwSXqIriBdU3NrYWt/hsiOs/umN7W+M1VVubGNnD1kXR76beaBe2k16npo4lL7KVS
	 adMW5u1JjfSWE7ZFJIpy9VNCUDMUs+xRkq1zV2tI/fHA3fgpUkjCCPKprmHPsPNFgf
	 z0VbIsWnaX+QJVmygCVgNZfgDJokAc3/Vcge0AvnkKydiuJuzv/kyllcr2Ow48RElr
	 djZ2qHVJC0b9VlKnEa/G1o9VPiEgMIwfN13M7SUy9nIEewb7FMErrtjMmKmNl7Gzu+
	 2e117hWVHkJ9A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1D81640E49;
	Mon,  1 Jun 2026 18:48:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Manuel Ebner
 <manuelebner@mailbox.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 SeongJae Park <sj@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: Fix syntax of kmalloc_objs example in
 coding style doc
In-Reply-To: <20260529081006.2019687-2-ukleinek@kernel.org>
References: <20260529081006.2019687-2-ukleinek@kernel.org>
Date: Mon, 01 Jun 2026 12:48:44 -0600
Message-ID: <87fr369jw3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org> writes:

> The first parameter should match the variable that the allocated memory
> is assigned to. Fix the example accordingly, the one for kmalloc_obj got
> it right already.
>
> Fixes: 7c6d969d5349 ("Documentation: adopt new coding style of type-aware=
 kmalloc-family")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> ---
>  Documentation/process/coding-style.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/process/coding-style.rst b/Documentation/proce=
ss/coding-style.rst
> index a3bf75dc7c88..a8336582f60b 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -959,13 +959,13 @@ The preferred form for allocating an array is the f=
ollowing:
>=20=20
>  .. code-block:: c
>=20=20
> -	p =3D kmalloc_objs(*ptr, n, ...);
> +	p =3D kmalloc_objs(*p, n, ...);
>=20=20
>  The preferred form for allocating a zeroed array is the following:
>=20=20
>  .. code-block:: c
>=20=20
> -	p =3D kzalloc_objs(*ptr, n, ...);
> +	p =3D kzalloc_objs(*p, n, ...);
>=20=20
>  Both forms check for overflow on the allocation size n * sizeof(...),
>  and return NULL if that occurred.

Applied, thanks.

jon

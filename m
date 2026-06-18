Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2BE280A5A;
	Thu, 18 Jun 2026 13:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789732; cv=none; b=ooyl01CjMJ/GuSbBaHKJ9gF4hYgUGHuSpKdcfdjhqkTJGRiLQKWGFrjsdWPMFLGf8+VwUkgBT44ASy1d5bOOVQQttF0WGeUU6E8NAZPxXXuDRe8NtUEuKQTND6O0NcyzGuyZkqPDeOnWw+oSjYd+NJh/mi/dRTSefh3/i9RKpNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789732; c=relaxed/simple;
	bh=9RXFf2anX6QtDPr4e4nEY2mr6aMgIgsi2g2c8QfoVYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e+350ra56ZQkLVkqd7Wz9Oa/bEmEB7CWRc3gm6omc5pn3bWpLYnPhKbSMwkFGZVBH8VahbPpJAV4/KCBCnUr4y1FpmJX96F8u03uSrV5pSDe1MjhyF7TlLrZfRPSjFBdIFaiH8HTZQtYndnCVg8+phcfINj7U1D6ITHSKbg7krY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLS8wM+7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLS8wM+7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1D81F000E9;
	Thu, 18 Jun 2026 13:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781789731;
	bh=Rk6LmjIbCHsYPNdyORQTlWLED3QFUIZxJF66Poqak0U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BLS8wM+7lNGipicaKQI08fr6BvpoZb8eQFBGEtcAz6VB81AbZ8KRuoXZm/Aq6wj6g
	 xYRyXinasz+XrelPwmme8HY0hJ0ltYqS7UnTdHA7izE6XGuxihVc1nWVx+fKC1kmql
	 GXJK3FKZnkS6zs2PST4qZc8YbPG8DmkHqC3xOi6R3Wz3pH9kxCBrsegUncuDz7o5ck
	 StCGUVzgPGABGUhAiUQlubgvBqSbcV7T1IBtE9Mb+0+1jKP2o33viI4bIXnP2NWDEX
	 qOD5DMWfmOGGGmSnmwPlRl8aptuhu4ojY5/eMHNHNAs7LYYDoADnvEBTngkwFmCdZ3
	 Qx/OQO3CyEb6Q==
Message-ID: <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
Date: Thu, 18 Jun 2026 22:35:15 +0900
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
To: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net
Cc: glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RrLQl9DO89jp5rWKR4YTMpyy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RrLQl9DO89jp5rWKR4YTMpyy
Content-Type: multipart/mixed; boundary="------------y0w8N2KinVP4PMHfeQRfXe6b";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net
Cc: glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org, catalin.marinas@arm.com
Message-ID: <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
References: <20260612044425.763060-1-dev.jain@arm.com>
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>

--------------y0w8N2KinVP4PMHfeQRfXe6b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Hi Dev,

On 6/12/26 1:44 PM, Dev Jain wrote:
> Introduce a boot option to tag only at allocation time of the objects. =
This
> reduces KASAN MTE overhead, the tradeoff being reduced ability of
> catching bugs.

I think most of overhead when enabling MTE comes from loading and
validing tags for every memory access (either in SYNC or ASYNC mode),
rather than from storing tags.

> Now, when a memory object will be freed, it will retain the random tag =
it
> had at allocation time. This compromises on catching UAF bugs, till the=

> time the object is not reallocated, at which point it will have a new
> random tag.
>=20
> Hence, not catching "use-after-free-before-reallocation" and not catchi=
ng
> "double-free" will be the compromise for reduced KASAN overhead.

I doubt users who care about security enough to enable HW_TAGS KASAN
are willing to compromise on security just to save a few instructions
to store tags in the free path.

To me, it looks like too much of a compromise on security for little
performance gain.

> This is an RFC because we are not clear about the performance benefit.
>
> Android folks, please help with testing!
>=20
> ---
> Applies on Linus master (9716c086c8e8).
>=20
> Dev Jain (2):
>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>   kasan: hw_tags: Add boot option to elide free time poisoning
>=20
>  Documentation/dev-tools/kasan.rst |  4 +++
>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++--=

>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>  3 files changed, 69 insertions(+), 3 deletions(-)
>=20

--=20
Cheers,
Harry / Hyeonggon

--------------y0w8N2KinVP4PMHfeQRfXe6b--

--------------RrLQl9DO89jp5rWKR4YTMpyy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCajP0EwAKCRCGXBN6rc5S
1jNWAQDzVUDBUPeyt5upXL1mOoO9vGDvDLtilfxpmlxg7GO2qAD/YQLyoBRsQlGb
zVC6FeFHHk+biv6lxpZCj6qBEzmyqwY=
=XQEH
-----END PGP SIGNATURE-----

--------------RrLQl9DO89jp5rWKR4YTMpyy--

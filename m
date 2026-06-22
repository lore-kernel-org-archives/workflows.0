Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4B53AD522;
	Mon, 22 Jun 2026 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782132997; cv=none; b=WSuP01vCGnrojUiQ5RA2C6WhkkWVMRplRJnS/QQrsOKthl/l3twkVmlbu2KTuMJQE3lrZ1MmjfFm3KfwSpohZmfMhLcz7lh2i/rJrV31pmaXvDs1PvLskEGoTgGpN685tFp3+vP6pyTn0D3D4QuXZ2UmWhBc9T90PwUVNX24Yl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782132997; c=relaxed/simple;
	bh=l2iDIuaF1VKCPijPKmXFMyUN8rIqLYAfStTAg8/YV8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHKrw3Nhn52bdfoNiJNHUDNMR7jbr5WQF6PpZihzob4vIQgiKjGUIvhes5zikUAt9rfAAtMBxu4TYMQBmd7XVMrRTagGXTaM/i4YDuWx7ltxGromykrC4LF8qdbAaHY3itDG9xt9g2h6RWqXRTJcpxXiDivLuXS5eNqtgyJGbKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhTXUQv3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhTXUQv3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C321F000E9;
	Mon, 22 Jun 2026 12:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782132995;
	bh=l2iDIuaF1VKCPijPKmXFMyUN8rIqLYAfStTAg8/YV8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dhTXUQv3s+G3948VNEUzwG8LXH8B99YNS4TcI8bDdEjy3NoNMQW8qC1bUUBSBq0Gl
	 9CS1dv+dU1cEQKaafkSSnUFEbNMHMoE6bXWDLVN7hboEaUaa0dWkHmM3ceKJRehheI
	 62XYgsevyO2fp8MahzfXuYboKooKO40EB5EXQNxnRy3bIhPev9AIkS9Bp6dEnSFUlM
	 AjZ2wghBrD6limeBOmkB7AGjF4ZSY0kPfNw6svzcq0JIoX8gZWxztnmnWbaGHMOIDY
	 oHJqQ4QcmtGnNGHxzYYAGiy5TkFXhUSIZiiK6+1TAFqEmqIuNPWL3IkLCH3FgkliFd
	 sxlx9gq6SF69w==
Message-ID: <4ab3bf02-70b9-4748-a12e-2bd564fec53d@kernel.org>
Date: Mon, 22 Jun 2026 21:56:24 +0900
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org> <ajU-b32dmwS7XOg4@arm.com>
Content-Language: en-US
From: Harry Yoo <harry@kernel.org>
In-Reply-To: <ajU-b32dmwS7XOg4@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------upsrUBOQYnFEnSXIs0AYK6aO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------upsrUBOQYnFEnSXIs0AYK6aO
Content-Type: multipart/mixed; boundary="------------Ps3zmfE9YngvIs8RaS9wbP7c";
 protected-headers="v1"
From: Harry Yoo <harry@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, ryabinin.a.a@gmail.com,
 akpm@linux-foundation.org, corbet@lwn.net, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org
Message-ID: <4ab3bf02-70b9-4748-a12e-2bd564fec53d@kernel.org>
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
 <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org> <ajU-b32dmwS7XOg4@arm.com>
In-Reply-To: <ajU-b32dmwS7XOg4@arm.com>

--------------Ps3zmfE9YngvIs8RaS9wbP7c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 6/19/26 10:04 PM, Catalin Marinas wrote:
> On Thu, Jun 18, 2026 at 11:05:43PM +0900, Harry Yoo wrote:
>> On 6/18/26 10:35 PM, Harry Yoo wrote:
>>> On 6/12/26 1:44 PM, Dev Jain wrote:
>>>> Introduce a boot option to tag only at allocation time of the object=
s. This
>>>> reduces KASAN MTE overhead, the tradeoff being reduced ability of
>>>> catching bugs.
>>>
>>> I think most of overhead when enabling MTE comes from loading and
>>> validing tags for every memory access (either in SYNC or ASYNC mode),=

>>> rather than from storing tags.
>>
>> Is there any reason not to use STGM instead of STG + DC GVA when
>> setting/clearing tags for large sizes when we know they are properly
>> aligned?
>=20
> STGM is intended for copying tags when paired with LDGM. Have you seen
> hardware where STGM is faster than STG or DC GVA?

No, I haven't. It was a question I had after learning that there are
multiple ways to store tags ;)

> For properly aligned
> buffers, I'd expect DC GVA to behave at least on par with STGM.

Thanks for answering!

--=20
Cheers,
Harry / Hyeonggon

--------------Ps3zmfE9YngvIs8RaS9wbP7c--

--------------upsrUBOQYnFEnSXIs0AYK6aO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQQ1ub6gR5ogjaKRmOGXBN6rc5S1gUCajkw+AAKCRCGXBN6rc5S
1qvyAPsF0DurImeEtMtFke9YXQWImsgXI+xfZ4SEz1mY+wbGswEA158qtw/Yf70R
7SKOnegedFGVqJzsq5p+vAkSpPMfJQw=
=RsAK
-----END PGP SIGNATURE-----

--------------upsrUBOQYnFEnSXIs0AYK6aO--

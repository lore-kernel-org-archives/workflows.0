Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BCF2D7DC8;
	Thu, 18 Jun 2026 14:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781791551; cv=none; b=eJyKYqKlGC4sLTFTpgLeBIogCAIfHDKG1ml5rhOpea7YDDaANEbw3ueyljXIofnYAKsq23tx/4+tStD/SL3XoZfgHA9Ty+TqTf3JYSXxfDw6kby3MyI1G2jiiwEPGQBklJObd0UdlYo0GzMUcZ5U9f5CfkYdCRdyCY9u59Z971c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781791551; c=relaxed/simple;
	bh=+BS0ptWQEY7JbtdX32/OaKorHSJgwOkHWZa59ChPrUU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QHFQncQsSD1YI9fVTB6/8VxXzxMHSxknEkGnpTzqXxh9qzSQpHVFE3h/PLxRpH3CR/M8Di6vQEPVsPxWobkE0A2NbS+YdZ0haOOTyBtAK/cIH2o5/ljsKgEiORVNmTSLW9cLM10A/oYIU1uZ+71WabaB4MnX27JzEN5Fb3LAitY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guRgYMnh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guRgYMnh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2409E1F000E9;
	Thu, 18 Jun 2026 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781791549;
	bh=tVAxdJW7jC5jS/EGdsY03Ok8EVfqupezCmX7jIRIDTo=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=guRgYMnh8lVzlhkg5QOvp9HmCWhWuAtur1nhXuuAxmi6OyIatGXW/4AAMLdpMjQZ1
	 BuGWAcPIdh4D25J9fv4Shd3xBjt3f8rffxUrUvc9J/ZnbB2f7lgqId/h2fm1RM/uL0
	 g8VGGkSgiqmlL1jFWg468nX031Kwq6ZlSCQ5LfUfSZ8/stVkSvSFM4Tqe1gYl5N6Mp
	 dg/VYKXQiT3K05iCarleYoF4Pmr61oApqv8o7lJKdF7Ryl6YiVZ6HerRjgVQgjfpQS
	 SypMSRxtr5kFuPKLlZgazCm+kz//yoP5XVt+o4fkAcCQgpWwLZCY6wsKabtoZnhzIQ
	 rasK12Ot6W1Bw==
Message-ID: <2a7d21fa-28c1-446c-97f5-2513f29157d3@kernel.org>
Date: Thu, 18 Jun 2026 23:05:43 +0900
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
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
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
Content-Language: en-US
In-Reply-To: <b1502a60-09a1-4699-886b-93d041de7023@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 6/18/26 10:35 PM, Harry Yoo wrote:
>=20
> Hi Dev,
>=20
> On 6/12/26 1:44 PM, Dev Jain wrote:
>> Introduce a boot option to tag only at allocation time of the objects.=
 This
>> reduces KASAN MTE overhead, the tradeoff being reduced ability of
>> catching bugs.
>=20
> I think most of overhead when enabling MTE comes from loading and
> validing tags for every memory access (either in SYNC or ASYNC mode),
> rather than from storing tags.

Is there any reason not to use STGM instead of STG + DC GVA when
setting/clearing tags for large sizes when we know they are properly
aligned?

>> Now, when a memory object will be freed, it will retain the random tag=
 it
>> had at allocation time. This compromises on catching UAF bugs, till th=
e
>> time the object is not reallocated, at which point it will have a new
>> random tag.
>>
>> Hence, not catching "use-after-free-before-reallocation" and not catch=
ing
>> "double-free" will be the compromise for reduced KASAN overhead.
>=20
> I doubt users who care about security enough to enable HW_TAGS KASAN
> are willing to compromise on security just to save a few instructions
> to store tags in the free path.
>=20
> To me, it looks like too much of a compromise on security for little
> performance gain.
>=20
>> This is an RFC because we are not clear about the performance benefit.=

>>
>> Android folks, please help with testing!
>>
>> ---
>> Applies on Linus master (9716c086c8e8).
>>
>> Dev Jain (2):
>>   kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
>>   kasan: hw_tags: Add boot option to elide free time poisoning
>>
>>  Documentation/dev-tools/kasan.rst |  4 +++
>>  mm/kasan/hw_tags.c                | 45 +++++++++++++++++++++++++++++-=
-
>>  mm/kasan/kasan.h                  | 23 +++++++++++++++-
>>  3 files changed, 69 insertions(+), 3 deletions(-)
>>
>=20

--=20
Cheers,
Harry / Hyeonggon


Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8390B281525;
	Fri, 19 Jun 2026 04:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844292; cv=none; b=eFtwZxt81645C8pOkFChggbEfZtKjdAP2r7MyUwFjKpXIIyQzP2vo1nuBBygJlp20+5SbbiIfAd6XcQ+mc++74PbXx2kew8tpUMpwpUXF0cAlhqFAZCSmJCTPpWg1owIPv3OwtZ9jo/a9ZmbJXKWo942i9L0fu87Zlsyi7M+LE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844292; c=relaxed/simple;
	bh=ps5ieMGO5BqQTpSXeGILcJmIGXlH2aB1crQD4y2zbKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aY0cJqbfdUvxaTBKtreDbNnkMfOlkPS/oRHJQA2EeVPbPcjjS9z9HQWEC0co1tcNLUEUPahA5lLq9BiKzagJm91QkUVRw2f39xsx+d2FKKZYlccvO7NHDqPKgrq3MMXhtVhl/hc915flg13BSj7n0yMGIvsn8ROMKwiCr1kNFus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=P9xMpzZA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="P9xMpzZA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A894293F;
	Thu, 18 Jun 2026 21:44:44 -0700 (PDT)
Received: from [10.164.148.42] (D3H2TH2F54.blr.arm.com [10.164.148.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F07F53F632;
	Thu, 18 Jun 2026 21:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781844289; bh=ps5ieMGO5BqQTpSXeGILcJmIGXlH2aB1crQD4y2zbKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P9xMpzZA3w4Ud4GhNZYAR7rMtLEydQwCTF5BmTXmZvPjLCv1UXfUP8+r8Iq8CbCLQ
	 nRrOkqVf1Wr8M0pq84KEAZLTFtdvS80erxNi0JgM/Kw6LvYGCLadma1qHOiO2oStX9
	 L5zWdZrvA5KAhMLYETPu4C+RFIalR3vIj8I+cxO0=
Message-ID: <7b4f284c-9659-4422-a452-e67dcbfb0140@arm.com>
Date: Fri, 19 Jun 2026 10:14:33 +0530
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] kasan: hw_tags: Add boot option to elide free
 time poisoning
To: Isaac Manjarres <isaacmanjarres@google.com>
Cc: ryabinin.a.a@gmail.com, akpm@linux-foundation.org, corbet@lwn.net,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org, catalin.marinas@arm.com
References: <20260612044425.763060-1-dev.jain@arm.com>
 <20260612044425.763060-3-dev.jain@arm.com> <aiyi5flNkNNm0pSR@google.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aiyi5flNkNNm0pSR@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 13/06/26 5:53 am, Isaac Manjarres wrote:
> On Fri, Jun 12, 2026 at 04:44:24AM +0000, Dev Jain wrote:
>> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
>> index fc9169a547662..4fa8abb312faa 100644
>> --- a/mm/kasan/kasan.h
>> +++ b/mm/kasan/kasan.h
>>  #ifdef CONFIG_KASAN_GENERIC
>> @@ -478,6 +489,16 @@ static inline u8 kasan_random_tag(void) { return 0; }
>>  
>>  static inline void kasan_poison(const void *addr, size_t size, u8 value, bool init)
>>  {
>> +	if (kasan_tag_only_on_alloc_enabled()) {
>> +		if ((value != KASAN_SLAB_REDZONE) && (value != KASAN_PAGE_REDZONE)) {
>> +			if (init)
>> +				memset((void *)kasan_reset_tag(addr), 0, size);
>> +			return;
>> +		}
>> +	}
>> +
>> +	value |= 0xF0;
>> +
> 
> I wonder if it would make more sense to have this as:
> 
> if (kasan_tag_only_on_alloc_enabled() && (value == KASAN_SLAB_FREE ||
>     value == KASAN_PAGE_FREE)) {
> 	if (init)
> 		memset((void *)kasan_reset_tag(addr), 0, size);
> 	return;
> }
> 
> That seems a bit clearer to me as to what it is that you're doing, and
> also makes it so that you don't have to do any bit manipulation
> on the value when you're filling in the redzones.

Ah so you mean, we can define KASAN_SLAB_FREE and KASAN_PAGE_FREE to be
different values, leaving KASAN_SLAB_REDZONE and KASAN_PAGE_REDZONE to
be 0xFE, the poison value. Yep I'll do that.
> 
> Thanks,
> Isaac


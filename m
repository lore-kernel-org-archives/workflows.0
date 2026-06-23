Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA47D1C5F13;
	Tue, 23 Jun 2026 05:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782190953; cv=none; b=Uk7+mkKAOlASInjY15b1YM0XO254q9KSvKpJrpZD8IRtbpFpeId0HPaLX+/E1UZ+ixmKdIO/zkoRlqh/Xy8iQaiyRt/jG5/IouK21BkoEOjgR+prCrHpj2Imu4++KidbS/pLXenQNHemAdvTtgdfjrQf/92iog4HO/UNdVsc2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782190953; c=relaxed/simple;
	bh=/tf3ua+vKT99+55m2tCLALI+RpDjIfmCrLzHSIvEtUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJcKMD8TJETh7vvI31VlTyyusvE6YTB8XixG8Asg7Lul9gMb0VbhGIj5L32/So8DeVK9AHUU/zkk26rWq8T8uHA6DMIKlPDxJEi71WBt87Kl5HtZ8/Kd/BGf2eKXjrGdDflAtfCCOmL/Aw3CHvoDOgdw0pTP3xq8NB6Z4Y7yUvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HuC8saHz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HuC8saHz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9897D1A25;
	Mon, 22 Jun 2026 22:02:20 -0700 (PDT)
Received: from [10.164.19.14] (unknown [10.164.19.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69713F632;
	Mon, 22 Jun 2026 22:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782190945; bh=/tf3ua+vKT99+55m2tCLALI+RpDjIfmCrLzHSIvEtUg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HuC8saHzhLFSENYFEE1x41S1sRkkb3fz7XT9b2XPuRDl4SGP1EPkUKZ1/29no1S1n
	 6ygfCJM6BN+ZVQ+fbSop01/2Y7ev3RT41BJ9Llz54s8acdxivyvEQy2ypkWeyFwnsN
	 DVF+azu/KTetekBkxbb1pagp+lFxQWb20y2KmTPs=
Message-ID: <78d97371-b477-4230-8690-ac870a7bab3b@arm.com>
Date: Tue, 23 Jun 2026 10:32:16 +0530
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] kasan: hw_tags: Add option to tag only at
 allocation time
To: Catalin Marinas <catalin.marinas@arm.com>, Harry Yoo <harry@kernel.org>
Cc: ryabinin.a.a@gmail.com, akpm@linux-foundation.org, corbet@lwn.net,
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
 vincenzo.frascino@arm.com, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ryan.roberts@arm.com,
 anshuman.khandual@arm.com, kaleshsingh@google.com, 21cnbao@gmail.com,
 david@kernel.org, will@kernel.org
References: <20260612044425.763060-1-dev.jain@arm.com>
 <b1502a60-09a1-4699-886b-93d041de7023@kernel.org> <ajVByfkLbetzA8bB@arm.com>
 <2208123f-8a51-483b-aa93-c35d8d053d25@kernel.org> <ajltLd6FQg1aMge_@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <ajltLd6FQg1aMge_@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22/06/26 10:43 pm, Catalin Marinas wrote:
> Hi Harry,
> 
> On Mon, Jun 22, 2026 at 09:42:10PM +0900, Harry Yoo wrote:
>> On 6/19/26 10:19 PM, Catalin Marinas wrote:
>>> On Thu, Jun 18, 2026 at 10:35:15PM +0900, Harry Yoo wrote:
>>>> On 6/12/26 1:44 PM, Dev Jain wrote:
>>>>> Now, when a memory object will be freed, it will retain the random tag it
>>>>> had at allocation time. This compromises on catching UAF bugs, till the
>>>>> time the object is not reallocated, at which point it will have a new
>>>>> random tag.
>>>>>
>>>>> Hence, not catching "use-after-free-before-reallocation" and not catching
>>>>> "double-free" will be the compromise for reduced KASAN overhead.
>>>>
>>>> I doubt users who care about security enough to enable HW_TAGS KASAN
>>>> are willing to compromise on security just to save a few instructions
>>>> to store tags in the free path.
>>>>
>>>> To me, it looks like too much of a compromise on security for little
>>>> performance gain.
>>>
>>> I don't think there's much compromise on security for use-after-free.
>>
>> I think it depends... OH, WAIT! I see what you mean.
>>
>> You mean use-after-free before reallocation does not lead to much
>> compromise on security because objects are initialized after allocation?
>>
>> You're probably right.
>>
>> Hmm, but stores to e.g.) free pointer, fields initialized by
>> constructor or accessed by SLAB_TYPESAFE_BY_RCU semantics after free
>> will be undiscovered if they happen before reallocation.
> 
> Even with SLAB_TYPESAFE_BY_RCU, the object isn't tagged on free either
> (or realloc, only if the actual slab page ends up freed). But we don't
> get type confusion for such slab.
> 
> However, without tagging on free, one could argue that it reduces
> security for cases where the page is re-allocated as untagged - e.g. all
> user pages mapped without PROT_MTE. Currently we have a deterministic
> tag check fault if the page is coloured as KASAN_TAG_INVALID. I think

So you are saying that a stale kernel pointer can continue to use the
reallocated page, because for non-PROT_MTE case the page does not get
a new tag. Makes sense.
> for this patch, it might be better to only do such skip on free in
> kasan_poison_slab() rather than kasan_poison(). Freed pages would then
> be tagged.

I think you mean to say, "skip tag on free when freeing pages into buddy"?
So that would mean, kasan_poison() will do the poisoning also in the
case of value == KASAN_PAGE_FREE.

> 
> An alternative would be tagging on free only with a new tag and skipping
> it on re-alloc. But we'd need to track when it's a completely new
> allocation or a reused object (I haven't looked I'm pretty sure it's
> doable).

That was our original approach, and IIRC we had concluded there was no
security compromise. However it is difficult to implement - it has cases
like, what happens when two differently tagged pages are coalesced by
buddy and someone gets that large page as an allocation.

> 


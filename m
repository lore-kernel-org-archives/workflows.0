Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016294;
	b=hvKtjfpRNLs3dqpcyD6a8oZKaMA/7TbXXc0LAZ71PQFT5i35n6gihEXMYbQG/S309FwJ
	 odexzWFYAurMAcYx3ofT+pPboJawFqH3F77EGSbYzUk/lRgX74zSOKBhhQjhYzXXbP3Ez
	 FZkjeatHzRe/A8ff1h0cL+B4u6QV3qYgFesP/ASITFvWwr/tzqMgH+zhKyDrAHFN3sAX8
	 4YQ4Hg5RPCnQmOfRcKJYG/XTW1Yf1JHFPwdqP/uSw6KDjmeCKMp08OzwhppBLW0r3lVCz
	 sLmmmpj/znqKMu15x4MQJ28ka46bgOuY7PNiyWUUxys4ZzmV8fdyfLkcWz7Z/xiAQKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016294;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RMWtXfOrBMUlXo3JAA8nnmiVWIJTNT38o6/ayrisqnY=;
	b=B8+ahXx2QDwaI38HISQM1zJ96xN6hYiq/9iLIm4+LPOau/brg1EZUjjKOL9B6BLxZRuH
	 SoAD+EZxBTi0VMHdkTXceOnxF3pjrW1sYwvv1xmyeXXojcnVlybiZV0wDBv5OjRmNR1ay
	 wu1fV3x59aM10+NdUpSYLYV8dWDsKq1WDHFIS0Y0pb/XKgGsXa4rTugoGlTKyDm4j1MOb
	 aUZ6MJPIGF0YQzy4AaE8IVQohcDmFNemN6SERQMuKYJ90G5YA2t44gJHWs2Q0VFAdZxVl
	 3fWlcAbbDIAOBfva1wwUp5obE2SxOvUZat4SDDz9aE3+IFJL9ul1pWRuphHMHh9SNFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=juZk+Boh;
	arc=none smtp.remote-ip=95.215.58.53
Received: from mta1.migadu.com (out-53.mta1.migadu.com [95.215.58.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548C060A2600
	for <workflows@vger.kernel.org>; Wed, 18 Nov 2026 15:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 548C060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=juZk+Boh
X-Envelope-To: workflows@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tf0h0de4cYP6cKKbFkMbewM2Fg/9uzvPBvnWQQYHpdg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795016291; v=1; x=1795621091;
 b=juZk+BohpBKtZxmXEqY9oZSjFzYWzOUsKub/zu36mdnJ5CdFfAhwRmSemFjcYqd23Hkgp850
 80MfpW9+CzlGXe55dimQGW3ZEurB0gtvPtXxY8s9Nt9I4OOURjh2dRhVwdwQH+nnG/CNgzSkn37
 YpUS+z5h932+VR58utuYRec0=
X-Envelope-To: workflows@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dbede086751ede28;
	Wed, 18 Nov 2026 15:38:11 +0000
X-Mizu-Trace-ID: dbede086751ede28
X-Migadu-Flow: FLOW_OUT
Message-ID: <2e9faec6-9152-40ec-8c63-f262dc26e059@linux.dev>
Date: Wed, 18 Nov 2026 23:37:57 +0800
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] mm/page_ext: allocate page extensions early for
 SPARSEMEM
To: Mike Rapoport <rppt@kernel.org>
Cc: Muchun Song <songmuchun@bytedance.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka
 <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Joerg Roedel <joerg.roedel@amd.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>,
 Ketan <ketan.kishore@oss.qualcomm.com>, Mostafa Saleh <smostafa@google.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Sashiko <sashiko-bot@kernel.org>,
 kasan-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Chris Down <chris@chrisdown.name>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-6-songmuchun@bytedance.com>
 <avzsFxVqO27Vf4Db@chrisdown.name>
 <3C50E682-848F-4788-9238-923D5E292DEE@linux.dev>
 <av1M9itGiTF1Akqi@chrisdown.name> <av2zkUpYGmGWPx8T@kernel.org>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <av2zkUpYGmGWPx8T@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/11/18 22:17, Mike Rapoport wrote:
> On Tue, Nov 17, 2026 at 11:00:06PM -0800, Chris Down wrote:
>> Hi Muchun,
>>
>> Muchun Song writes:
>>> Mike's suggestion considerably simplifies the code, and early page_ext is
>>> only needed by optional debugging and instrumentation users. I would prefer
>>> to keep this approach.
>> You're probably right.
> I think so :)
> The memap_alloc() that essentially allocates the memory map does
>
> 	memblock_alloc_try_nid_raw(size, align, min_addr,
> 				   MEMBLOCK_ALLOC_NOLEAKTRACE, nid);
>
> so we anyway may end up with reserved memory in ZONE_MOVABLE.
>
> Until recently we had memory map allocation before the zones were setup, so
> there wasn't much we could do about it, but ...
>
>> But can I cheekily suggest something in the middle perhaps? :-)
>>
>> Given the zones are already set up before page_ext_alloc() runs, perhaps
>> you can pass the start of the node's ZONE_MOVABLE as max_addr to
>> memblock_alloc_try_nid() when the node has one. The general idea is:
>>
>>      struct zone *movable = &NODE_DATA(nid)->node_zones[ZONE_MOVABLE];
>>      phys_addr_t max_addr = MEMBLOCK_ALLOC_ACCESSIBLE;
>>
>>      if (!zone_is_empty(movable))
>>              max_addr = PFN_PHYS(movable->zone_start_pfn);
>>      addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
>>                                    max_addr, nid);
>>      if (!addr && max_addr != MEMBLOCK_ALLOC_ACCESSIBLE)
>>              addr = memblock_alloc_try_nid(size, PAGE_SIZE,
>>                                            __pa(MAX_DMA_ADDRESS),
>>                                            MEMBLOCK_ALLOC_ACCESSIBLE, nid);
> ... with zone extents known we could take it even further :)
>
> page_ext is treated as the memory map in many ways, so we can allocate the
> early page_ext sections with memmap_alloc().
> And since the latter always runs after zones are set up it could include
> this change.
>
> But I think this should come as a separate series that also could move
> memmap_boot_pages_add to memmap_alloc().

Agreed. Using memmap_alloc() for early page_ext allocations and
teaching it to avoid ZONE_MOVABLE sounds cleaner. I'll keep this
series as is and handle that in a separate series.

Thanks!

>   
>> I briefly tried that and it seems to work quite nicely.
>>
>> But I don't object to it even without that, so feel free to add either way:
>>
>> Reviewed-by: Chris Down <chris@chrisdown.name>
>>
>> Thanks!
>>
>> Chris


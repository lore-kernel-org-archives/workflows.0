Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011486;
	b=TxOeo5lHvQ3FDUwLqu938eXgN6oUuE9+fzojxVJ5LNMvnVGwqwAOBSyTyNtpk+6nY8vo
	 NlAsNqTBRGsMjXGFEmiwIW+uk+kkVXlFuIIRnp1UqYUXGXcSJPegbxaM3c8fsxTT3en1X
	 Gyr5qYV47txFxTtyO/6ie+fO1PuO/eZfhRuETR89eRO43s1HcC20R+gWpmd+T+F6trDAa
	 PlsWghOSv/tET1ZQg3lMjLUW9jaWtO1uA/5IReIqP6OwLM/hfyN7R9iLaDdWKRrKWBzpc
	 6XLvBfVxFDzZ7F1BB0DKjzZAPFhG67xSKm6FI/t8jaRmHoBSD/4N/r0ARby1WCjqFLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011486;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=dw8kfo0jr+5HnxA4ZRVp7iOwPegZqFvAC4q9TGpP07U=;
	b=p8kX45cbIqVVP4Mo2hOZ6J2cJGl3qZT5YkdkzvZ3kDcasztaMwVRPV5s39K2N+7VUuJW
	 u/H414OUcxE3cWOyhrBFt3TUNQa+qXipNv8JQmxaoetfH89D2ngJ+e8wfEKImOwdha2UB
	 piCk1sQ5XJLZyhXJm+9c00+xyoJ716qDhRn9gWYISWFri+gLbVvFJUDnoX7RM+0kOlLZk
	 3ifOiPKrWMkxoVP4cXSG6N9plC6kk+PWM4j7S6Wkboz/ZE4MkdvvZ4gM3y+A1uS2WshL/
	 z/L4Qvpey/mTVLXyOWp74WbGw1MZHVojORhDl+ZIwQs1Tlm+mB9ryFxwQF1JyzIG8ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hcjoV049;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAAD606A333;
	Wed, 18 Nov 2026 14:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hcjoV049
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E360C1F000C4;
	Wed, 18 Nov 2026 14:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795011485;
	bh=dw8kfo0jr+5HnxA4ZRVp7iOwPegZqFvAC4q9TGpP07U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hcjoV049icqMAqOW/hYn+GtbP550DC9ZCxh1djiAIYxD5bhiR5bxmNaKM+xKbb9RD
	 LAJ9NaCx2SsaUPDUboVSqG/cBj/qhdcP2jLYhO8qlLGLXUaNbEU0t+Lzo56lZb1HCw
	 w8NIqcNkhyfvPKtmxh0ZZiWN+uwczWz7X2JD+N5xKV8PPc5KOo0hzKhmkiBi9iWmjt
	 1BwyP9EBC74Rguwwa1WnsKhgFDuovM5D41N78CtFfc7BiSBmENU/E1EyQDGmULe4eL
	 KCaNQzMe1IOyAVOkSYJuJTFBBH4rrvtXnvtjxAB6YGnO2ryUHBWVI+2w8+WJ2Y9So1
	 5kucFx7ApUHBQ==
Date: Wed, 18 Nov 2026 16:17:53 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chris Down <chris@chrisdown.name>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 5/7] mm/page_ext: allocate page extensions early for
 SPARSEMEM
Message-ID: <av2zkUpYGmGWPx8T@kernel.org>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-6-songmuchun@bytedance.com>
 <avzsFxVqO27Vf4Db@chrisdown.name>
 <3C50E682-848F-4788-9238-923D5E292DEE@linux.dev>
 <av1M9itGiTF1Akqi@chrisdown.name>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av1M9itGiTF1Akqi@chrisdown.name>

On Tue, Nov 17, 2026 at 11:00:06PM -0800, Chris Down wrote:
> Hi Muchun,
> 
> Muchun Song writes:
> > Mike's suggestion considerably simplifies the code, and early page_ext is
> > only needed by optional debugging and instrumentation users. I would prefer
> > to keep this approach.
> 
> You're probably right. 

I think so :)
The memap_alloc() that essentially allocates the memory map does 

	memblock_alloc_try_nid_raw(size, align, min_addr,
				   MEMBLOCK_ALLOC_NOLEAKTRACE, nid);

so we anyway may end up with reserved memory in ZONE_MOVABLE.

Until recently we had memory map allocation before the zones were setup, so
there wasn't much we could do about it, but ...

> But can I cheekily suggest something in the middle perhaps? :-)
> 
> Given the zones are already set up before page_ext_alloc() runs, perhaps
> you can pass the start of the node's ZONE_MOVABLE as max_addr to
> memblock_alloc_try_nid() when the node has one. The general idea is:
> 
>     struct zone *movable = &NODE_DATA(nid)->node_zones[ZONE_MOVABLE];
>     phys_addr_t max_addr = MEMBLOCK_ALLOC_ACCESSIBLE;
> 
>     if (!zone_is_empty(movable))
>             max_addr = PFN_PHYS(movable->zone_start_pfn);
>     addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
>                                   max_addr, nid);
>     if (!addr && max_addr != MEMBLOCK_ALLOC_ACCESSIBLE)
>             addr = memblock_alloc_try_nid(size, PAGE_SIZE,
>                                           __pa(MAX_DMA_ADDRESS),
>                                           MEMBLOCK_ALLOC_ACCESSIBLE, nid);

... with zone extents known we could take it even further :)

page_ext is treated as the memory map in many ways, so we can allocate the
early page_ext sections with memmap_alloc().
And since the latter always runs after zones are set up it could include
this change.

But I think this should come as a separate series that also could move
memmap_boot_pages_add to memmap_alloc().
 
> I briefly tried that and it seems to work quite nicely.
> 
> But I don't object to it even without that, so feel free to add either way:
> 
> Reviewed-by: Chris Down <chris@chrisdown.name>
> 
> Thanks!
> 
> Chris

-- 
Sincerely yours,
Mike.

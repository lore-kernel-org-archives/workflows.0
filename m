Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028643;
	b=aFVFhRolbwQREBobjZVP2VEXQE41+0Gln5SaN0eli3UwfJ3BHgykXkGOe/wnaXKo5Qdk
	 B4CWJYkavK+S8rQ5Wn+3dqoEVV9cDoWzBXM5VQfeZCOGdspB6LsfzYYqckFnyfp+b0b82
	 kB6hgLirYFrJX4WAUGvAYfglBmWPQThjs7bCAlyc7BRAAoRC8jZL6Sj/sKWuOQ6ws3JHs
	 EPg296L444k7OYMFJVW7v7dxoNxFJ32gLsgzWSijAYpKKOPe2wXsYenjqVVaIDI4w8+kB
	 XFFsbBJ4n0sYxwDkqqEZGJcXz/Ek5xLov5+AEquInQc/7lA7zQJwUh4kciyKAaB/brQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028643;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Q8TBn9ubKDLYTz56NEzeNdxWEl3UJisiQtWy9Az8Fes=;
	b=P6ftI7EAdUdUEkmnQfT1P5fNocQb8QSDjQhUGwMF4sjD1tGxRz2YMBwtAfy9SqSBCDcu
	 BioSPt9VGoRpkAufMdv/Q9WCjgyUX7gmu3MP8TIQa1lShBt14fNSpYcXFYViSya4NcIaE
	 ynMP5bg8jQCyzJC+4k4hQzAvvnyLRceJXQWy3edFvMwihWqZRFiHarg22YHMEy3imDjdE
	 djR/1UDM6YyAsiy3wEZeUskP72J173EWpf80plrlbmZPH67F4C4y2fWSRXT4AsmDcfZ/k
	 JVHfsC+cEP/pfcc0KQgdRDtfopHnHg6Uz1dcVm40zGo1fu2B1e3o44f1E52Zd1Ne3Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hf/HT3xD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E86606A320;
	Wed, 18 Nov 2026 19:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hf/HT3xD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153DC1F000C5;
	Wed, 18 Nov 2026 19:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795028642;
	bh=Q8TBn9ubKDLYTz56NEzeNdxWEl3UJisiQtWy9Az8Fes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hf/HT3xDB2Pi3lfXWtso17LwDxUnrHlSV61cn70iJMfDo0CMpHaClOs/z09FJNAzT
	 3JOTEDkxPohQigfU5UkFK6cGTmPJT5xXWQk0ujZI7KiJVC8YbNcVbSrkGGJPxwe+xr
	 Mh1+shtCkM83jgtfy2fVf3x6DZ+T12QstaIgvKdSfK7whOr4UrPrYNLpTUxwVlzytW
	 Qc67JPOt0UqfuFdhngtW4MmODE7597ZsjHCBxBcnh42oERDV6ucAJ2UMPLOnn3696Q
	 dw/VTwIgI6blwV2Ejya7jYgO3KkAIwvqbjHEWfppyz5ojLv+W547233hDCoS5yDUxK
	 p5dGd3uWal6jQ==
Date: Wed, 18 Nov 2026 21:03:50 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
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
	Muchun Song <songmuchun@bytedance.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 5/7] mm/page_ext: allocate page extensions early for
 SPARSEMEM
Message-ID: <av32ls56XJmaAO8C@kernel.org>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-6-songmuchun@bytedance.com>
 <av20jiGZH5uYV6LT@kernel.org>
 <7f651049-f0dd-4053-a666-ea1c5d49669e@linux.dev>
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
In-Reply-To: <7f651049-f0dd-4053-a666-ea1c5d49669e@linux.dev>

On Wed, Nov 18, 2026 at 11:13:29PM +0800, Muchun Song wrote:
> 
> 
> On 2026/11/18 22:22, Mike Rapoport wrote:
> > On Tue, Nov 17, 2026 at 08:06:25PM +0800, Muchun Song wrote:
> > > KMSAN needs page extensions when kmsan_init_shadow() installs per-page
> > > metadata, before memblock_free_all() releases memory to the buddy
> > > allocator.  FLATMEM makes page extensions available by this point,
> > > whereas SPARSEMEM initializes them later in boot.
> > > 
> > > Allocate boot-time SPARSEMEM page extensions from memblock to match
> > > FLATMEM's initialization timing.  This gives early clients the same
> > > page_ext availability guarantee across both memory models, while runtime
> > > memory hotplug continues to use vmalloc.
> > > 
> > > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> Thanks for reviewing.
> 
> > 
> > with a nit below
> > 
> > > ---
> > > v2:
> > > - Allocate all boot-time SPARSEMEM page extensions from memblock
> > >    (suggested by Mike Rapoport)
> > > - Keep memblock allocations above DMA and suppress per-section free
> > >    messages (suggested by Chris Down)
> > > ---
> > >   include/linux/page_ext.h |   9 +--
> > >   mm/mm_init.c             |   4 --
> > >   mm/page_ext.c            | 119 +++++++++++++++++++--------------------
> > >   3 files changed, 60 insertions(+), 72 deletions(-)
> > > 
> > > +static __ref void *alloc_page_ext(size_t size, int nid)
> > >   {
> > >   	void *addr;
> > > +	if (!slab_is_available()) {
> > > +		addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
> > > +					      MEMBLOCK_ALLOC_ACCESSIBLE, nid);
> > > +		if (addr)
> > > +			memmap_boot_pages_add(size / PAGE_SIZE);
> > I think it should be DIV_ROUND_UP().
> 
> size is currently page-aligned by init_section_page_ext(), so both forms are
> equivalent here. Is the suggestion to avoid relying on this caller-side
> invariant and make it more robust? If so, I'll use DIV_ROUND_UP() for both
> accounting calls.

Yeah, keeping it here does not cost much and whatever
init_section_page_ext() does we still count the pages right.

Especially if we move the whole thingy to memmap_alloc().
 
> Thanks,
> Muchun
> 
> > 
> > > +		return addr;
> > > +	}
> > > +
> > >   	addr = vzalloc_node(size, nid);
> > >   	if (addr)
> > > -		memmap_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
> > > +		memmap_pages_add(size / PAGE_SIZE);
> > And here too.
> > 
> > >   	return addr;
> > >   }
> > > @@ -304,7 +300,7 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
> > >   	if (section->page_ext)
> > >   		return 0;
> > > -	table_size = page_ext_size * PAGES_PER_SECTION;
> > > +	table_size = PAGE_ALIGN(page_ext_size * PAGES_PER_SECTION);
> > >   	base = alloc_page_ext(table_size, nid);
> > >   	/*
> 

-- 
Sincerely yours,
Mike.

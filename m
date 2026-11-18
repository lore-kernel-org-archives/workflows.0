Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011738;
	b=yI65bp19TiXFDfCoy8ARDJrFhUs4rhAJOEkQnQbQvgJorlxqeFGhwIeV1EAHAzO3VGS8
	 /qzi6DUIsdy3ADvxGkVguTDfwTW6vnY4n4UL4iSLKEN3WoF/gY8UNeapYhDM15r32oQLx
	 yiuTPcICWz3B4crx4PQto7pD4fBIWLm4g8wjI+wjfZ+anfoqOvQIKi0vcU7F+fT6lyFGh
	 y+u80s1HQ9um0RCGthLfWbTGLVw3xyhK2JqxjIpfxvVY4r7ZocF3G4q76SqNpaLLyciUO
	 78Aw6qiDMBSPvbmgNbqwqyPwurHLhDoRNJr2ZZZ3xWktbPoAd4JtEHXQTZUDDXZHF0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011738;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=wQ/P0S/BIwLbAm3SwXm7MlYVraP/+sqEwKu2qG1M6g4=;
	b=LK2Qlaj5DIUl/y78wkBY5ORQWFAozuVhsr32jWsrxaKKj2kHzDvqeYQQXm37tt+1gE1f
	 l1IBPP+weGTL+rqxDVUurFTeKS3TA6xFlteYqCAfvRm1n2oXvyE9o7rZzvaHtVSCLYsiE
	 BW8S76QRaCCZjbWYroaiVcCTVRvGCHBIaMAoKVB9x+0fujKuhfwz0hyfcr3pUNlBZJbk/
	 2IVT/wwNVzsH/tmYw0oo6hWSHCvLLysYP9zpTU8Hr4lx53gDF5RqtluAFbXm6eK6P/L++
	 hPJEGZ+inL+6HDSBdSns7XzM6xQUDqqA/tjufSKZlSurETNZLx3dbpFm8F0Jj1nKFKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PnizEqc3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DA7606A31C;
	Wed, 18 Nov 2026 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PnizEqc3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8FF1F000CC;
	Wed, 18 Nov 2026 14:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795011738;
	bh=wQ/P0S/BIwLbAm3SwXm7MlYVraP/+sqEwKu2qG1M6g4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PnizEqc3duk8cYNxG5qGYHzwEoF+La9oGAi8pJGK9qXZcAv3wu/S8lvPf3PlCLFNX
	 //mLiYaJ5aV1BWHge/nKYmGK+aCkhIbb5oU9XMvP4IFkSOORivHfYnAt9bGZyXpeKh
	 Y858N4ekCEGW6tAiolhdqT4gMpWa1yltL+Kz8VN1ujdXnukHxAmxtgs/7xzW7e4bvx
	 VXFOM1e7HjLm7XniR+DbNVU6dhqAaXV8djy+yP7OvAcNIo+8kp41tilnabUC2fNmlk
	 l6G37fDwn1RJTgTT2PL4qy061Tr0IgTS6fz0aV832Uv9+RPpoEi/L4bVZIWv3EcEDQ
	 Y6KdCOczQMvbg==
Date: Wed, 18 Nov 2026 16:22:06 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
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
	Zi Yan <ziy@nvidia.com>, Muchun Song <muchun.song@linux.dev>,
	Joerg Roedel <joerg.roedel@amd.com>,
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
Message-ID: <av20jiGZH5uYV6LT@kernel.org>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-6-songmuchun@bytedance.com>
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
In-Reply-To: <20261117120627.50601-6-songmuchun@bytedance.com>

On Tue, Nov 17, 2026 at 08:06:25PM +0800, Muchun Song wrote:
> KMSAN needs page extensions when kmsan_init_shadow() installs per-page
> metadata, before memblock_free_all() releases memory to the buddy
> allocator.  FLATMEM makes page extensions available by this point,
> whereas SPARSEMEM initializes them later in boot.
> 
> Allocate boot-time SPARSEMEM page extensions from memblock to match
> FLATMEM's initialization timing.  This gives early clients the same
> page_ext availability guarantee across both memory models, while runtime
> memory hotplug continues to use vmalloc.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

with a nit below

> ---
> v2:
> - Allocate all boot-time SPARSEMEM page extensions from memblock
>   (suggested by Mike Rapoport)
> - Keep memblock allocations above DMA and suppress per-section free
>   messages (suggested by Chris Down)
> ---
>  include/linux/page_ext.h |   9 +--
>  mm/mm_init.c             |   4 --
>  mm/page_ext.c            | 119 +++++++++++++++++++--------------------
>  3 files changed, 60 insertions(+), 72 deletions(-)
>
> +static __ref void *alloc_page_ext(size_t size, int nid)
>  {
>  	void *addr;
>  
> +	if (!slab_is_available()) {
> +		addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
> +					      MEMBLOCK_ALLOC_ACCESSIBLE, nid);
> +		if (addr)
> +			memmap_boot_pages_add(size / PAGE_SIZE);

I think it should be DIV_ROUND_UP().

> +		return addr;
> +	}
> +
>  	addr = vzalloc_node(size, nid);
>  	if (addr)
> -		memmap_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
> +		memmap_pages_add(size / PAGE_SIZE);

And here too.

>  
>  	return addr;
>  }
> @@ -304,7 +300,7 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
>  	if (section->page_ext)
>  		return 0;
>  
> -	table_size = page_ext_size * PAGES_PER_SECTION;
> +	table_size = PAGE_ALIGN(page_ext_size * PAGES_PER_SECTION);
>  	base = alloc_page_ext(table_size, nid);
>  
>  	/*

-- 
Sincerely yours,
Mike.

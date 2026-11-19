Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075230;
	b=NN2guQ/BfJU3qPN7HbLDK7mdGoHf96yvdPPTUf7xqM9VxjG+BNgkSUaYq3rucgFTmktX
	 Gk79+jBJWBDnvyok7b2aqyswvtXYJD7DqsmdX3bmeZAN+fye7mCy030IAxSvbvq1lhGCq
	 M3hr9PBj/GNKcoKR5HEwG0EQh1SNakhO3gP3/1H8ytDXBlKJW29oP1EQ01pWWk4iXZ7oA
	 qH297mTzo2s3taxcme87mG2aycmTt3ir1KGf6l83QKH0745fKRqc/74paPbj+P5XVLBom
	 dm5c7cNf7gR1pIdclIDl7NX6ANreBijGqueMKRGtkWxPio1Dj/T5WU1LLYJUA2+bzbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075230;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yhKTd9PFQglELBRtpTYu4W3W99Gioeh3CPcw8i00DlQ=;
	b=oQEZbAOwCOQbjKO4IZ2jasFXdvjvj7mt/IvVGPbmqC7dXrC+SsxW/yyMnobK0bPMX2xA
	 LHKfZrmR+uQ+3T6rrhVAXfYaR/MrNPDrpYbWLu9Po4qjx0zgI5z640kwBEFCoAjSdW36M
	 fp/V07yg0j36BtZEfito0U4EWedEnfCTHq21HYf17bVHqlsgX0iu/C3VDmqhqwuTmElGF
	 i5r4/S+DhGfyy+KcIuVeIKGumkZtOENif7R90lwyJA/Zw8xIbA8h3lIqyXypEIhByHoli
	 UIQZqCOb8P2bwfcLDgDYAbswmivT96FVrdasmpKwakRU277exp6hWY6JGdTomf9OwEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VzGWi9uR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC01606A324;
	Thu, 19 Nov 2026 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VzGWi9uR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF05E1F000C7;
	Thu, 19 Nov 2026 08:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795075230;
	bh=yhKTd9PFQglELBRtpTYu4W3W99Gioeh3CPcw8i00DlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VzGWi9uROMYGTkKOazYsmKlhMzNc5nhXpnMk8mDh68gKBL3B+x0fn8IT2VwmfH1Ef
	 rudOl0YdIbdAx9WxJt28qSgYc293YBRFbc8Reex7r49nSl3Ob3DnWeNsWSZz9zM/D4
	 J+N6xHljw23oX/WnkCWcYVCe5dhPBUi3zbmc1vHWKeBpAAkzh8HIDjfPgwsxdcGmzn
	 kd+9Pl6pkdZO9vLBWRqZH1YamDRZywlSVUnyqLLZt5beZMAkw1dBfs1s5W1DV9ew1S
	 1zkx7BsNMPKEbu555/1Agg6ojWE7+gWcjaFLSgz9qRIjqB/d4ixApDFDjVAYb0CPxO
	 Cd+MDnFgeZyyg==
Date: Thu, 19 Nov 2026 10:00:17 +0200
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
Subject: Re: [PATCH v3 2/7] mm/page_ext: fix client data alignment
Message-ID: <av6skRQgBf7f70vd@kernel.org>
References: <20261119065812.89959-1-songmuchun@bytedance.com>
 <20261119065812.89959-3-songmuchun@bytedance.com>
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
In-Reply-To: <20261119065812.89959-3-songmuchun@bytedance.com>

On Thu, Nov 19, 2026 at 02:58:07PM +0800, Muchun Song wrote:
> page_ext lays out client payloads consecutively without aligning their
> offsets or the final entry size. This happened to work while the active
> payload sizes kept the stride naturally aligned, but IOMMU debug page
> allocation added a four-byte payload after data requiring eight-byte
> alignment.
> 
> When page owner and IOMMU debug page allocation are both enabled on
> x86-64, struct page_ext, struct page_owner, and the IOMMU payload use
> 8, 64, and 4 bytes respectively. This produces a 76-byte entry stride,
> leaving struct page_ext and page_owner data in every other entry only
> four-byte aligned instead of eight-byte aligned.
> 
> Align each client offset and round the final entry size to the largest
> active alignment so every page_ext entry preserves the alignment
> required by all active clients.
> 
> Fixes: 466ae6978a5b ("iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC")
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Tested-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> v3:
> - Cap client alignment at u64 alignment to preserve 64-bit alignment on
>   32-bit architectures (reported by Sashiko)
> - Open-code the lowest power-of-two factor for readability (suggested by
>   Andrew Morton)
> - Use a local for the u64 alignment (suggested by Mike Rapoport)
> - Simplify the commit message to focus on the alignment guarantee
> - Collect Reviewed-by and Tested-by from Chris Down
> 
> v2:
> - New patch to fix the existing page_ext client alignment bug
> ---
>  mm/page_ext.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

-- 
Sincerely yours,
Mike.

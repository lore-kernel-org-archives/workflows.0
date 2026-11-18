Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009447;
	b=ih3qjSgzpw2sN9UG+ZNXQ/hymf9U1aRve21mjXtXuuvMPRiVkDQ7xFTe5HaDBLpHIMDx
	 l2ZjrQcLfvB24InxFZ8m/E5OzQ/7neZ7UPqyHLdrGa/dLFMis+8/99YB+oAN6VjxYPfZY
	 4le0o/LOk+1o+MRIMBWC0qdXu9V2C0fkDFazaQN7UbObLcWZNR6SfwQvtuVcQshWmU2s3
	 16X0mUNygWNHsebRUP1eE9kz7wFvFwK32+XwBBoWDemXBNS662DLv6bMqYzdpRfhcE/Ym
	 C5o307xdSq5TlGjw9nvR55FkdNu78GeQ2ycmc6cjNDZ8Uvc2l+HdaXn97fhpXXR74vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009447;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=i7muLzDvY71Op61wz/dzqvbrdFL+H8lMJhwiD/Ishso=;
	b=XNGtsOQQSozOm5XrtDzRG3Ni2a+vIzYExl7jhxSiNNFlZTPBnfLxdTfM34VQBktmeWYp
	 eJQ/UnOalH3n2IlPtuV3thuhbj4JqPbHpjSoPeMKoLDwQdABGGN8ePnS8gy+39r5QYmBu
	 nylsOIm50bxMB5FW4DRVSoV+gGU27zqwRTd9ma90VNv8xsGmfKWkML86KOLuhzSKb+vuI
	 LzBCj2sXP8zuDIaa7UGjE62WsArgtnifCnCAiT5tuIdYFi9He6d1ZpTXIGizXL3Aff6gb
	 cbyg0OxSC1iNY0cuM24Zs9RvV0OsbWmJbXXgUh5UnQz0RloDH6lAG8VAOlOXMJVX05g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIhFuaoR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746AF606A31C;
	Wed, 18 Nov 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIhFuaoR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A001F000C4;
	Wed, 18 Nov 2026 13:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795009447;
	bh=i7muLzDvY71Op61wz/dzqvbrdFL+H8lMJhwiD/Ishso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WIhFuaoR0sVGQ4CGc810tZgfErcle3/jziLI10fXcW2UoIYclG/UxL+Mh0UOq5x5Q
	 Yb7cq0GQYKV1LZv4Qz0S+Yv7Ms+8UyIrjyuy1eInXqTtpYi57PQOVn2F/0DlQit2Bx
	 UGrZ8VrN5+UmI3I7qqiV5gljE+AivMOLxZJzVVYNoPC1viCfumE42QkoHBuqpu+2+X
	 kLhdnBeaizi9RnLUZoDfmf5tW/poinJNe6rkyQzzngyrS8DllVODDpEpXg39DZE1Du
	 PRwv/P3FQtnT5OS3LkSrGgn2L1Y+RH1hPz5IReplZQYVUtzt3KLGTn8kwOlENgWYgi
	 oPysx/jPTL8aQ==
Date: Wed, 18 Nov 2026 15:43:57 +0200
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
Subject: Re: [PATCH v2 3/7] mm/page_ext: always use vmalloc for section page
 extensions
Message-ID: <av2rneuRc94nGid-@kernel.org>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-4-songmuchun@bytedance.com>
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
In-Reply-To: <20261117120627.50601-4-songmuchun@bytedance.com>

On Tue, Nov 17, 2026 at 08:06:23PM +0800, Muchun Song wrote:
> SPARSEMEM currently tries to allocate each section's page extensions
> from the buddy allocator before falling back to vmalloc.  Boot-time
> section allocation happens after vmalloc is available, and memory
> hotplug allocations do not require physically contiguous backing.
> 
> Use vzalloc_node() directly and remove the buddy-specific allocation,
> free, and kmemleak bookkeeping.  This leaves one runtime backing type
> and lets a later change add memblock as the distinct boot-time path
> to simplify the code.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> v2:
> - Add a preparatory cleanup that always uses vmalloc for SPARSEMEM
>   section page extensions (suggested by Mike Rapoport)
> ---
>  mm/page_ext.c | 21 +++------------------
>  1 file changed, 3 insertions(+), 18 deletions(-)

-- 
Sincerely yours,
Mike.

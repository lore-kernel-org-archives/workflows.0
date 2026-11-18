Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795011538;
	b=WLGGr+YUX4Qlc62rPoGWhJYzieTjHyF1XowkFnF/Uob5eQL8jCjL8J1weyPjizL+SXII
	 aPbq+9/Sa86l9FjLOjXzycVozbHrzr0DBo0bAYMwGtwIThW6Mpqvhn7H15i0JblCsc42x
	 vzKGFw1pCWOjaobptn+kszs1X7yAg7E6kIdsBlj45L7sQd2fqXd/DCsY0DYaFifYacAoL
	 XJKZTtdWktqzMm8AfL0fwR5pp7BzIaWP181K3R2vOJ/+cnk8WTAiEGKvFNxzhtqofnmn3
	 tij/CM5SQf+/Xmvu/gbvDZ3Nwf51NecOR7ydnsUhujDjGMVEtldWU7gllbTGatfrCYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795011538;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yspg3RYK6hfplwr2guwVtoc91Gns2znX/lR8zgZBFVs=;
	b=0KEfnfioFbGpLVAN14/sD0dAhvtwq2A9H4nH4wA00m/ehwk2BrzJP1bOFDExDAsQTUUw
	 jHaRchFhSkulKaOpgQkJVBanAH07kUYwdIzdBrWBqh1B6OQvS+BeinqjB/WPVZ7kW4+1c
	 VVLow2t+jCSdZrnqCFnMGkQ8zAHWI6fUyrexAwvSyzKhvKwt/qt6NPhXGK5n6vqL/l0ZA
	 AZ+RLMOIRn8t3EM9OII/WAlAanb4l42llhKHXasnsaNdItA5fv7TWrxO26I4fWXs4DtZN
	 2JSuuIeYrAPGf4lC1lmFQkt9ZCKaVY9F2KSFDIbaw0y1WmO5SWJdGSjsbNefoaVxVPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjsgJxsb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12AD60A2609;
	Wed, 18 Nov 2026 14:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TjsgJxsb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 896811F000C4;
	Wed, 18 Nov 2026 14:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795011537;
	bh=yspg3RYK6hfplwr2guwVtoc91Gns2znX/lR8zgZBFVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TjsgJxsb3omgZC7Y7BqVmG9Ex9ZO4k8c2B1tbSP/96Q0m5xKS+UvBbENGt+SaQib9
	 9kUbL0e5wLlwJegMYSiSzUPGcows/z3EtystFW8tMA2Izw5ThIzP4oA+E73pK54zhD
	 pTjJ+HJCkJg8pdSfKAp7mW9qElOyGSzrm+b7bTUN9wUnOrH1Au3oUxHBI9P838qb45
	 bI41cCj3uoYB0day2lARxxnN8bF0wjB7hlN2wnAaMTIl/RtvRJOlAPdAaNrImCwE8E
	 Q6CIIgWSCViQL/WRgnaNuQGPB7lDcH8fnD257mcfFw3w4bbDXMb7IlMJIvIb3gKmHF
	 Jk6E5jDwzWb4A==
Date: Wed, 18 Nov 2026 16:18:45 +0200
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
Subject: Re: [PATCH v2 4/7] mm/page_ext: use common allocation and
 initialization entry points
Message-ID: <av2zxfDZI-ECPByB@kernel.org>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-5-songmuchun@bytedance.com>
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
In-Reply-To: <20261117120627.50601-5-songmuchun@bytedance.com>

On Tue, Nov 17, 2026 at 08:06:24PM +0800, Muchun Song wrote:
> FLATMEM uses separate page_ext_init_flatmem() and
> page_ext_init_flatmem_late() entry points, while SPARSEMEM performs its
> work through page_ext_init().  This exposes the memory model in the
> generic boot sequence and obscures the allocation and client
> initialization phases.
> 
> Rename the early entry point to page_ext_alloc() and use
> page_ext_init() for client callbacks in both memory models.  SPARSEMEM
> keeps its existing late allocation behavior for now; its
> page_ext_alloc() remains an empty configuration stub.
> 
> This also moves FLATMEM client callbacks from immediately after
> kmem_cache_init() to after vmalloc_init().  The callbacks still run
> after the buddy and slab allocators are available, as required by
> page_owner.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> v2:
> - Split the common allocation and initialization entry points into a
>   preparatory patch
> - Document the later FLATMEM client callback timing (noted by Chris
>   Down)
> ---
>  include/linux/page_ext.h | 20 +++++---------------
>  mm/mm_init.c             |  7 +------
>  mm/page_ext.c            |  5 ++---
>  3 files changed, 8 insertions(+), 24 deletions(-)

-- 
Sincerely yours,
Mike.

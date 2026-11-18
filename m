Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971526;
	b=tVWvZCYeR6GIkebwc7cCo2HQZN3hfcMfvmGhmwhC7hL3+ExDxqxmckjhwrFw+Iy6rHcd
	 TFzCpD+Z6wJKCXdoqcj+a5FPPxC1OlhxEcJiZvlNm0/c6OemT0nhMEv/dCjEWPB7jZXDo
	 uE0RzaAkdvuXdYOpMTyFKdT749xSM7AaLNJuQJXOQpV/fGEHeKLVj5hDAaC5HpS/YBCXY
	 /1tZsyVUWJPg3Om/QTIs8DSgsOsNEFmvzvgFZw+hG7iPlBb0dkXq/gx/LoCUrKd3QYXkg
	 BIDH3R7LanZucT9uKQPoMcGrMB8/4qB+uF6IQOeRE/KwnM/QVuRUsrdKXo9xpYJM/XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971526;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=sjYYKwzYzONDWseS/CLLjrX/s6cX0+9HMOg7VEzcoPU=;
	b=0lyiVDliZi9gNOfYjSlVDyoLwQMouYqW6hes1+7G9dKr3VMCSw7Y4MLUcIwTRXIucwpQ
	 +pXkFOFhQvz7RDiI3MmRstCBWIfmD1SQGzLpiaEAJzA/QQ5aJSwzm+kXFohgLDpeodl+U
	 Vcc1OHQzol0GcHqXTH0Smt0VVVKwIV22PM8IlCLQ49KbVApLBwAArRGKYPVoXYaT8G7jx
	 Pygx3VpmreRB66jjmv4M1ABrt5T0Xw6Eet/mdJ5W738BXql1PPvPSTPxgE6ZxfqDm3UEN
	 Akjd1S/9irnMApFpgjY5SXHcdx0iECNH/JcBYDS4EHHWRmDoDyBq50S5P/7DOawYLIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pPOal3HM;
	arc=none smtp.remote-ip=95.215.58.155
Received: from mta1.migadu.com (out-155.mta1.migadu.com [95.215.58.155])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBAA606A31C
	for <workflows@vger.kernel.org>; Wed, 18 Nov 2026 03:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CBAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=pPOal3HM
X-Envelope-To: workflows@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MbsFGvHGFKuYz+VZCR6SSqqFxh07MvYfS3xKWwR/Cj8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794971524; v=1; x=1795576324;
 b=pPOal3HMUeQvg2+drPiVNCtsM2ZuSOtxTrB+m9qiILrWbhHI/YQ95VG71a75Nru6vcVXbijf
 h//SOr5Vc2b6lMHqghht3I7qOVx28FRimoyQEQ+T7+3ircBg9vfd0P0VbH6O41se9H0/UlpLvhD
 Zyf4lI7u4LyixosdJeSzGIYQ=
X-Envelope-To: workflows@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id b0d530c3b5bc4025;
	Wed, 18 Nov 2026 03:12:03 +0000
X-Mizu-Trace-ID: b0d530c3b5bc4025
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 5/7] mm/page_ext: allocate page extensions early for
 SPARSEMEM
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <avzsFxVqO27Vf4Db@chrisdown.name>
Date: Wed, 18 Nov 2026 11:11:46 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Zi Yan <ziy@nvidia.com>,
 Joerg Roedel <joerg.roedel@amd.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>,
 Ketan <ketan.kishore@oss.qualcomm.com>,
 Mostafa Saleh <smostafa@google.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Sashiko <sashiko-bot@kernel.org>,
 kasan-dev@googlegroups.com,
 workflows@vger.kernel.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: 7bit
Message-Id: <3C50E682-848F-4788-9238-923D5E292DEE@linux.dev>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-6-songmuchun@bytedance.com>
 <avzsFxVqO27Vf4Db@chrisdown.name>
To: Chris Down <chris@chrisdown.name>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 18, 2026, at 08:06, Chris Down <chris@chrisdown.name> wrote:
> 
> Hi Muchun,

Hi Chris,

Thanks for taking a look.

> 
> Muchun Song writes:
>> + 	if (!slab_is_available()) {
>> + 		addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
>> +					      MEMBLOCK_ALLOC_ACCESSIBLE, nid);
> 
> Hmm, unless I'm mistaken, memblock allocates top-down, and with
> movablecore= or kernelcore= the top of each node is ZONE_MOVABLE, so this
> puts the page_ext tables there. It looks like that then offlining those
> memory blocks would fail with EBUSY because of the reserved pages.

Yes, this is a valid concern. However, early vmemmap backing is also
allocated from memblock before page_ext and can have the same problem, so
handling page_ext alone cannot guarantee successful offlining.

Mike's suggestion considerably simplifies the code, and early page_ext is
only needed by optional debugging and instrumentation users. I would prefer
to keep this approach.

What do you think?

Thanks,
Muchun

> 
> I can see why Mike suggested always using memblock here, but only KMSAN
> needs the tables before the buddy allocator is up. So I think this needs
> to either go back to using memblock only for clients that need it, as v1
> did, or keep these allocations below ZONE_MOVABLE.
> 
> Thanks!
> 
> Chris


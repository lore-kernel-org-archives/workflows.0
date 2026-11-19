Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071629;
	b=fKnYN52k3cEH3WCPRGafH4ZJWAXDAqJGeksJXp5u4QulJQVfNXMcrfvpTiAWgZ+5+zfG
	 wH408AUopD4dBopgBJ47dq4+PtKB7Cy1U9OiN8Ciz5MdyDLWR+rSjrG/3ASsfRDxESVqa
	 i1oVVw3yHLiw21yodO1IBg3Ym622jgfYZqBHNgcDu3uGZx1XE+CrxTwmZXp+lz0oOTK8F
	 Mwa5f2fO1kC/eKQzis5jrnc4cIwk16PiybVKZYzxFXrp46GZhtQ2/t1aEL1++bzwPYuFU
	 F9NJZir1tUq0k5vnpx1CPQdJZW35nmR0jzDIYaL30OsHBWEPJtJMJYuUv6avDiLSzcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kPhQ9i3kP4x8JhqjD5K1C3dirUBtl6z9jPgg1a9BJHE=;
	b=lJulI59WJwfw8HHCvDgyil9sf1mtI8UxfM76LnwvmTyEL+XdWr71smUQ3xw4c8gPU9ho
	 hjP20YYI+Ygeq7Ztm/WF09Ki/QiZm+rB1Ozk1/0bbCbdrZXfO5HBJM+/XVVJ25B0+SlbW
	 c4x9H1+ZaR0jg1S+STGmJVWNtyGqqeiPc8MkpZerTAW2UJWsvDlJRWGBXivx+Itnauowl
	 k4h1dDAtsTuOLolsIqLMfHH3QojAyXRQeK1dx1ru0h963FPq6jSbQAGpY9Xwwvayv/JO9
	 nNuL98i/z6TxVMB7rbF3uJLSdA4wum4OyctNN7hfF/qPphj37yug8CKZMCQPFf0EWYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F1rIzOtX;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE78A606A33E
	for <workflows@vger.kernel.org>; Thu, 19 Nov 2026 07:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE78A606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F1rIzOtX
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ea7987517aso11748135ad.0
        for <workflows@vger.kernel.org>; Wed, 18 Nov 2026 23:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071621; x=1795676421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPhQ9i3kP4x8JhqjD5K1C3dirUBtl6z9jPgg1a9BJHE=;
        b=F1rIzOtXCvjl2Jq/oghLxtlwdQ9a2gCPhLAcYFzPlLXNAMLCwnuJUVxLdxdnUdlpWy
         jpEY7nwp3sAbRx8obBJdvUyFgOZTbeGqE9pHgAechX2HVenkuSqu3Ojaho1s7sWSppaZ
         lB/+iY3z7NwKMAQD3GK4M+xKVnis0PiZgzTYxGMlLZ6RUgkhRyJ87b0ti8Zd1A7O97/c
         4rCMfsgwBJbIsS0sIyNlnDpcGpgry/3JwQc8t850zU3gz5NM7hw+EQxp83uML2Z9UtAh
         Szb1dgI/pwt2wFfDrPfibm1KPeLFNFN2NZp8IDOJhbzU6zLCYFRfBxlhIjAMnTi+7b7r
         BURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071621; x=1795676421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kPhQ9i3kP4x8JhqjD5K1C3dirUBtl6z9jPgg1a9BJHE=;
        b=um7PwiZRiCT27UODHemv7v1j+suy5KhMq4rnhgGO+qI17Nuj8DN7SUmGBQCE972CIm
         tb8hRAR+IP9PhtxuuuiBwF797Q63c0Ap+5JLAFUyDS42CAKghRyu7cTXepqaOwv5cCLn
         7b3yNSOgR5Yw1YBTvymN1B84I+pl6+iQEdA8M3IdW9c6KFXXCIPGvcsN0iMpFXbbdf3a
         7xUeiHeTL0m+gK07eXIKY7uTXuGyKn4FRRbTBOabf7Ogv7q0Sh9QDRFYDrBfJI/QAQ4U
         vqmvBoxU3hQ+yZZfkAOfORUniGx4j5mYI4KvWd/ufJ9egZDT9d/7g2P760inBuWg58N5
         DB3Q==
X-Forwarded-Encrypted: i=1; AL+hErEswkRjKEu2flaTYLayiqsUB8lq3bo6feQEp8a+lqDPpg6AkMtMxo8ts2bDCajtExzQVSEzVQb0424=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7Nkc+Cab+/VlIOgL1TTD7HfbLlpbCC6vX89DaRO0KI3LSq1cW
	uHyl8CCE+iMSydogpOT06DPoHiUWp1zLJuWxbWTZunIRByO45hR56rGONQJp5elDBOU=
X-Gm-Gg: AZFdTZfsqyxkofS1v2DVkMwD0dGU6da9iMu8hQjAR3uMX0S8LURhiC5EYrcUhdLJPbR
	TxJVSEWyQisrCn7NzGScJbWlSBwaXc7VAQb4LkiPmLbXKyeHqCuGvaNWWR1pcRx9VE+pYduwoa/
	Ya7hauQ5oXSG8FpkKA2sgPz4NxGV2CKsZA2i2jkZHUY0ATuauMvSGnDTsEz8iM9waOHocB4QxJw
	OtxQT6pJuYxhXlgKvxKH8TWdfpR7+yrUuj0e5IbPbY8GlACxfLuQaTEAKsoGWTM0/OK/wXSPDbc
	mtrs7w1CVbHA6g5+x5J1DSXRahcYdfrFF7XwSQ5wSfijXEO8o1stw4mAGShxK/lro9+NQbKVs3p
	FCu4gkaPQIWahdP8hbx7H+jz5focxvAFXk6re4HohF93z9XmP4FHWBbN8cdU0ROa+kSWg8zUfQp
	c91JtNCD3tRvleMXOhyR49aLFx38MOhbZzlsdCQ4Q/8FBRFD9TbyRsGKDj+pCVx8tnYa8jACMkP
	x3pGW1eUyZsccpb7E5xgtFbFQEYsPQVPS/cqgGqS+80a1JMXKQJctyeLfM4VE6YF2oOk+gcEUwt
	GScRQc9OclZURQ465uXQZS6xnOGgGTOyw46gNywXaXmsanfCP7/MziyN0f4=
X-Received: by 2002:a17:90b:1802:b0:3b1:922a:7b22 with SMTP id 98e67ed59e1d1-3b3d07c66b8mr5528227a91.60.1795071620802;
        Wed, 18 Nov 2026 23:00:20 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.23.00.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:00:20 -0800 (PST)
From: Muchun Song <songmuchun@bytedance.com>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
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
	linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 3/7] mm/page_ext: always use vmalloc for section page extensions
Date: Thu, 19 Nov 2026 14:58:08 +0800
Message-ID: <20261119065812.89959-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119065812.89959-1-songmuchun@bytedance.com>
References: <20261119065812.89959-1-songmuchun@bytedance.com>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SPARSEMEM currently tries to allocate each section's page extensions
from the buddy allocator before falling back to vmalloc.  Boot-time
section allocation happens after vmalloc is available, and memory
hotplug allocations do not require physically contiguous backing.

Use vzalloc_node() directly and remove the buddy-specific allocation,
free, and kmemleak bookkeeping.  This leaves one runtime backing type
and lets a later change add memblock as the distinct boot-time path
to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
---
v3:
- Collect Reviewed-by from Mike Rapoport and Chris Down
- Collect Tested-by from Chris Down

v2:
- Add a preparatory cleanup that always uses vmalloc for SPARSEMEM
  section page extensions (suggested by Mike Rapoport)
---
 mm/page_ext.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index 39a4464fc979..6196bab6868c 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -290,15 +290,9 @@ static struct page_ext *lookup_page_ext(const struct page *page)
 
 static void *__meminit alloc_page_ext(size_t size, int nid)
 {
-	gfp_t flags = GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN;
-	void *addr = NULL;
-
-	addr = alloc_pages_exact_nid(nid, size, flags);
-	if (addr)
-		kmemleak_alloc(addr, size, 1, flags);
-	else
-		addr = vzalloc_node(size, nid);
+	void *addr;
 
+	addr = vzalloc_node(size, nid);
 	if (addr)
 		memmap_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
 
@@ -344,19 +338,10 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 static void free_page_ext(void *addr)
 {
 	size_t table_size;
-	struct page *page;
 
 	table_size = page_ext_size * PAGES_PER_SECTION;
 	memmap_pages_add(-1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
-
-	if (is_vmalloc_addr(addr)) {
-		vfree(addr);
-	} else {
-		page = virt_to_page(addr);
-		BUG_ON(PageReserved(page));
-		kmemleak_free(addr);
-		free_pages_exact(addr, table_size);
-	}
+	vfree(addr);
 }
 
 static void __free_page_ext(unsigned long pfn)
-- 
2.54.0


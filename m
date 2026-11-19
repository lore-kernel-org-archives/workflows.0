Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071666;
	b=sShEzVOdlDpRH66hRUQM+asvTXerJhsYgezeDJ9uEg68jai/wQv1DP7WfJuHpIG7MSNS
	 bMGPxs3E2A0r1gvnW2QdISoNsE4EuYCezh6B6pck4061TQxeWTRBgYXoD8L+316ekDKAg
	 QwjAYZ73dk3K6wivyoGnGbxPXL5yxiYN2uX5LBb2CF02b8C4prCAUT4M2WnLgnLegAzSC
	 otGXEsucZqcgaRuV3h7n8B0uCugDxDnRqfwDe+UPPWUKYjSrLkZ99TeRzqweeyucvXPC9
	 9/czuS99S8013B2vFU4HSLo0jaYNa0h9i4cCjykkMOnHvHKKy4kC0PZAWMmXy2HZO+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D+FnLhj7qRAFWKIuwGU/FM3UqUnlL/5I23zrp6FTFBI=;
	b=HzvqlT0qCc7Q8scNVWoG9g3L1DQU6G24x9kX2+PbMIcXToXYGvQAl5g2zX4QHw76DZic
	 xslIUVp3mUrIXdxQhqX5axi5JumB5YJBE/OWEzFL7WioXSF1tvLbYc9CXj8LxYzcwD7Wh
	 cI63SuuDiEnplTVj3PWF8XG9WRTaZ6eoWtqXT22GuxmhxgWCWthsNQ2fsQWmXGdUZTvf7
	 13F+yHYDQFCT81RL33T5FcXucydFdRmmbhOFkQBT20VqxdOrQzjM8vKPdQJ1owyrSse5B
	 CtmwFuQ7VbNU9kZXEye1r+Ja0wBCWC8u5+B2qtfMqg1sTwlN/QCMehOz3cqNfrl5sgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZzjcteVu;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DA6606A320
	for <workflows@vger.kernel.org>; Thu, 19 Nov 2026 07:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77DA6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ZzjcteVu
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso309136a12.1
        for <workflows@vger.kernel.org>; Wed, 18 Nov 2026 23:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071665; x=1795676465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+FnLhj7qRAFWKIuwGU/FM3UqUnlL/5I23zrp6FTFBI=;
        b=ZzjcteVuganhCxCSsBgbT+MHa1JOJMlipltfzd1WJl0pIcWsWEBNO7wR7JtnQWLu+K
         ixxroXWp8+iADxcIN3Kb3S6MNXiVUpLxTAxlk4jjUauLJVffeRBdA7PB0Gz3gYixbbcr
         i5pD9/Cx4+mwEoYDaAb4b4SJBV1yMoUWpqOwtG/rA3HX3UWvZXLBpBQGKrRLo/lxQvuW
         WaSk3NaEcWsQNKyRGAL9+Yra9PIZUkNlAPGOn+pkC6TEv4bqVAv8vWkEQKZgEHxHhDiP
         NKvyBZvSB8IYPIwnKcI9qQnpFFsHBeueWdsBYUBJr6pV40bzcEq6mqbhh3rXuFzndrg0
         j/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071665; x=1795676465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+FnLhj7qRAFWKIuwGU/FM3UqUnlL/5I23zrp6FTFBI=;
        b=1e5glQ+83+vlZWo3Ztfwl0RnmLLW6ViUOup9CWi1gv9tJRzI8EbsLIR7+hEJ87/+LJ
         PrMgda/sARolUypocz39w7JRLCbnEQeIo6+hyKfC1m20ovZE5IL6LelcLHCEycE3SzM7
         sTPa8wNZ7a2SnVaZtcxsX0xGENvwQtTJvzvHFnypR3nC30UOSsbkuVl6puHbO+RN9vLo
         EPtZcBNfPg2FQ3zenlSzx47lS7z+ONc4q+Ssh+XyiBlKG2LjvPuardYaVNLbLAEglP+x
         7H+vpO9tja8iTro4Etl58nDwGksR3FPmbDf2Nbc88ZKu6j9ZH2/Wd5777PL46nAMozQS
         cl4w==
X-Forwarded-Encrypted: i=1; AL+hErGtLRMiMRI+vnIlIC4mBMskokvGC3g4xvO90ztxv9fwqyvmG05vtC908C89B5QtqtgfUXJ/xZI6gCU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pY+tVo+vbO/5QN4zS1/QhNUdckOMbVFeSyHNqvDVI4AXIq3w8
	Z76weHU7uEvX5PBAlZQXPusqTPq3UbeEbdFr6fIjK7Buy4/lJW1BzWVykG7fRUAoGag=
X-Gm-Gg: AZFdTZefjASV5hVn32NU5vH6XflaqmlGoG6g2LGujRLiRXh94TYqH9CqfFqVftGDzxy
	lNsjtd/BoZOrVNZzc2J+yFTJW9g42T92BqelMofu3U39Eqs8bAv4UezxcLDZ04eG+SvPd1Z9QHy
	mQeWJ56u6CRdo6UiommzGymBIiFvpP3bB4Qa+I7X3eIrQAlltvCcJqyB326VJcXdi5ag/vjbKn2
	ktP38FQvMB7IS3gbTf1+b40jHnRXGSIokHRd+dxvTOay7Wpr60icio89JWf9ajIPx2cwAq+Uj0Z
	SAqQisy5zNXoY6ywVOQSL5xoPmFR8nsFimDWAZBhU18KwEjNbrvJnhRKRvrLGhHhw9ET7M1AXFU
	OChgWmgVg35YR9N+C3fT7xv+Olv4JirYeXnGK/c4iWWqCuoRy2x/VhqeZjgJO4dztjkUI400h+L
	0ISLdfNnlk4F/cX+JNVN69aYNhr6GuMsooqPT+gZYD/nH1LFyOLn6XM96ilSng6PK9YMprnmYaI
	0vRBoJqhRNlG/RETleDgc2PGDAt8CAc1njjK7va93txLS+nZvRZX491d1kSDqhXZrYSmb7Xj89s
	1hXSGnodEqawgDBxKHHY565NwXqePrHKfTDpbhWZBqEazQ0Aaro1EclKxWQ=
X-Received: by 2002:a17:90b:35d0:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3b409fed4c9mr143623a91.20.1795071664611;
        Wed, 18 Nov 2026 23:01:04 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.23.00.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 23:01:04 -0800 (PST)
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
Subject: [PATCH v3 5/7] mm/page_ext: allocate page extensions early for SPARSEMEM
Date: Thu, 19 Nov 2026 14:58:10 +0800
Message-ID: <20261119065812.89959-6-songmuchun@bytedance.com>
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

KMSAN needs page extensions when kmsan_init_shadow() installs per-page
metadata, before memblock_free_all() releases memory to the buddy
allocator.  FLATMEM makes page extensions available by this point,
whereas SPARSEMEM initializes them later in boot.

Allocate boot-time SPARSEMEM page extensions from memblock to match
FLATMEM's initialization timing.  This gives early clients the same
page_ext availability guarantee across both memory models, while runtime
memory hotplug continues to use vmalloc.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Chris Down <chris@chrisdown.name>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
v3:
- Use DIV_ROUND_UP() for page accounting instead of relying on the
  caller's size alignment (suggested by Mike Rapoport)
- Collect Reviewed-by from Chris Down and Mike Rapoport

v2:
- Allocate all boot-time SPARSEMEM page extensions from memblock
  (suggested by Mike Rapoport)
- Keep memblock allocations above DMA and suppress per-section free
  messages (suggested by Chris Down)
---
 include/linux/page_ext.h |   9 +--
 mm/mm_init.c             |   4 --
 mm/page_ext.c            | 117 +++++++++++++++++++--------------------
 3 files changed, 59 insertions(+), 71 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 911a84bbb3db..d00320106a58 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -61,12 +61,10 @@ static inline bool early_page_ext_enabled(void)
 	return early_page_ext;
 }
 
-#ifdef CONFIG_SPARSEMEM
-static inline void page_ext_alloc(void)
-{
-}
+void page_ext_alloc(void);
 void page_ext_init(void);
 
+#ifdef CONFIG_SPARSEMEM
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
 	/*
@@ -76,9 +74,6 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 	return next_pfn % PAGES_PER_SECTION;
 }
 #else
-void page_ext_alloc(void);
-void page_ext_init(void);
-
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
 	return true;
diff --git a/mm/mm_init.c b/mm/mm_init.c
index bcc4e7e8cd1f..ea763e299769 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2705,10 +2705,6 @@ void __init mm_core_init(void)
 	build_all_zonelists(NULL);
 	page_alloc_init_cpuhp();
 	alloc_tag_sec_init();
-	/*
-	 * page_ext requires contiguous pages,
-	 * bigger than MAX_PAGE_ORDER unless SPARSEMEM.
-	 */
 	page_ext_alloc();
 	mem_debugging_and_hardening_init();
 	kfence_alloc_pool_and_metadata();
diff --git a/mm/page_ext.c b/mm/page_ext.c
index aff00f4e1bdd..cfd20ed72884 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -12,6 +12,7 @@
 #include <linux/rcupdate.h>
 #include <linux/pgalloc_tag.h>
 #include <linux/iommu-debug-pagealloc.h>
+#include <linux/slab.h>
 
 /*
  * struct page extension
@@ -185,11 +186,6 @@ static inline struct page_ext *get_entry(void *base, unsigned long index)
 }
 
 #ifndef CONFIG_SPARSEMEM
-void __init page_ext_init(void)
-{
-	invoke_init_callbacks();
-}
-
 static struct page_ext *lookup_page_ext(const struct page *page)
 {
 	unsigned long pfn = page_to_pfn(page);
@@ -243,24 +239,16 @@ static int __init alloc_node_page_ext(int nid)
 	return 0;
 }
 
-void __init page_ext_alloc(void)
+static int __init __page_ext_alloc(void)
 {
-	int nid, fail;
-
-	if (!invoke_need_callbacks())
-		return;
+	int nid;
 
-	for_each_online_node(nid)  {
-		fail = alloc_node_page_ext(nid);
-		if (fail)
-			goto fail;
+	for_each_online_node(nid) {
+		if (alloc_node_page_ext(nid))
+			return -ENOMEM;
 	}
-	pr_info("allocated %ld bytes of page_ext\n", total_usage);
-	return;
 
-fail:
-	pr_crit("allocation of page_ext failed.\n");
-	panic("Out of memory");
+	return 0;
 }
 
 #else /* CONFIG_SPARSEMEM */
@@ -287,10 +275,18 @@ static struct page_ext *lookup_page_ext(const struct page *page)
 	return get_entry(page_ext, pfn);
 }
 
-static void *__meminit alloc_page_ext(size_t size, int nid)
+static __ref void *alloc_page_ext(size_t size, int nid)
 {
 	void *addr;
 
+	if (!slab_is_available()) {
+		addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
+					      MEMBLOCK_ALLOC_ACCESSIBLE, nid);
+		if (addr)
+			memmap_boot_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
+		return addr;
+	}
+
 	addr = vzalloc_node(size, nid);
 	if (addr)
 		memmap_pages_add(DIV_ROUND_UP(size, PAGE_SIZE));
@@ -309,7 +305,7 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 	if (section->page_ext)
 		return 0;
 
-	table_size = page_ext_size * PAGES_PER_SECTION;
+	table_size = PAGE_ALIGN(page_ext_size * PAGES_PER_SECTION);
 	base = alloc_page_ext(table_size, nid);
 
 	/*
@@ -336,11 +332,19 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
 
 static void free_page_ext(void *addr)
 {
-	size_t table_size;
+	size_t table_size = PAGE_ALIGN(page_ext_size * PAGES_PER_SECTION);
+	long nr_pages = table_size / PAGE_SIZE;
+
+	if (is_vmalloc_addr(addr)) {
+		memmap_pages_add(-nr_pages);
+		vfree(addr);
+		return;
+	}
 
-	table_size = page_ext_size * PAGES_PER_SECTION;
-	memmap_pages_add(-1L * (DIV_ROUND_UP(table_size, PAGE_SIZE)));
-	vfree(addr);
+	VM_WARN_ON_ONCE(!PageReserved(virt_to_page(addr)));
+	memmap_boot_pages_add(-nr_pages);
+	kmemleak_free_part_phys(__pa(addr), table_size);
+	free_reserved_area(addr, addr + table_size, -1, NULL);
 }
 
 static void __free_page_ext(unsigned long pfn)
@@ -454,52 +458,45 @@ static int __meminit page_ext_callback(struct notifier_block *self,
 	return notifier_from_errno(ret);
 }
 
-void __init page_ext_init(void)
+static int __init __page_ext_alloc(void)
 {
-	unsigned long pfn;
-	int nid;
-
-	if (!invoke_need_callbacks())
-		return;
-
-	for_each_node_state(nid, N_MEMORY) {
-		unsigned long start_pfn, end_pfn;
-
-		start_pfn = node_start_pfn(nid);
-		end_pfn = node_end_pfn(nid);
-		/*
-		 * start_pfn and end_pfn may not be aligned to SECTION and the
-		 * page->flags of out of node pages are not initialized.  So we
-		 * scan [start_pfn, the biggest section's pfn < end_pfn) here.
-		 */
-		for (pfn = start_pfn; pfn < end_pfn;
-			pfn = ALIGN(pfn + 1, PAGES_PER_SECTION)) {
+	unsigned long start, end, pfn;
+	int i, nid;
 
+	for_each_mem_pfn_range(i, MAX_NUMNODES, &start, &end, &nid) {
+		for (pfn = start; pfn < end; pfn = SECTION_ALIGN_UP(pfn + 1)) {
 			if (!pfn_valid(pfn))
 				continue;
-			/*
-			 * Nodes's pfns can be overlapping.
-			 * We know some arch can have a nodes layout such as
-			 * -------------pfn-------------->
-			 * N0 | N1 | N2 | N0 | N1 | N2|....
-			 */
-			if (pfn_to_nid(pfn) != nid)
-				continue;
 			if (init_section_page_ext(pfn, nid))
-				goto oom;
-			cond_resched();
+				return -ENOMEM;
 		}
 	}
-	hotplug_memory_notifier(page_ext_callback, DEFAULT_CALLBACK_PRI);
-	pr_info("allocated %ld bytes of page_ext\n", total_usage);
-	invoke_init_callbacks();
-	return;
 
-oom:
-	panic("Out of memory");
+	return 0;
+}
+
+#endif
+
+void __init page_ext_alloc(void)
+{
+	if (!invoke_need_callbacks())
+		return;
+	if (__page_ext_alloc())
+		panic("Out of memory");
+
+	pr_info("allocated %ld bytes of page_ext\n", total_usage);
 }
 
+void __init page_ext_init(void)
+{
+	if (!page_ext_size)
+		return;
+
+#ifdef CONFIG_SPARSEMEM
+	hotplug_memory_notifier(page_ext_callback, DEFAULT_CALLBACK_PRI);
 #endif
+	invoke_init_callbacks();
+}
 
 /**
  * page_ext_lookup() - Lookup a page extension for a PFN.
-- 
2.54.0


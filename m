Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917251;
	b=xhGIMsXoHL+aYjke2nxMtZvGe1TpdWf4Zfqvp/hoDew0Vf3wSajwI2hdaNexUKYx/AN8
	 jQl2syYXc0yP4wHxgMalqjcOpBAWYa9JXCV9YD8IDXzhUa4cWnpX+j4Oslp7Fqir/BiQb
	 bkVcPss3tN58vykPDI0kFyX50oPfySL2fcVStIBYkxAsS8LFrvpHKJNlod0W5u9ztJDHy
	 PtQveIl2O6sioAIpEFbjFlxnkRsjB/6pbLooNkrA7UY0li7XPRXi6KNYZUIz+5Boajlqu
	 giXEcTqMsY0dmZlicRMPyO1LDmxv+QT461BZN6LZtcviw4KNrFcCocTSGoloAhYIT1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HdCytpgBEMMjWWjAaswQ3teC54EqiXNp/aCnfx0q/Uk=;
	b=yo01FvmJl9MUdDxZtM7OjsVFuhp6Z3WziJUcvW/KlJCncnUlr/TAHjfypTMhzGj6bIDH
	 mQV5AWjx1+uJIwVyOG83PMy9PR3YaA5BV4YvLAJoTAWX8vSTBJKrBtA2kPKcsitNXSXUw
	 CnvB9v1SJ1Benavb6Hmt8z1luJiwxF80mkxoIW0mBxrn1PwlmLA7JCkZOvpR1juUp1pGi
	 ev34N2SsxlOd70ojh6wyc2CvMKnlXWYwB+EvDavWmr7Bv0xZloA2JJhiHq/J4SUexwNc2
	 qWYY+TbwUa/Hk0QXR/vZy/Hzg5JLSTlOpD1cWl8RgHWGNgoAI/8FPzEUT0AarQEgOyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hJi2PmuQ;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D7F606A329
	for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 12:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55D7F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hJi2PmuQ
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b3acec6677so6620736c88.1
        for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 04:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917250; x=1795522050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdCytpgBEMMjWWjAaswQ3teC54EqiXNp/aCnfx0q/Uk=;
        b=hJi2PmuQQWc1txnHWZ2ca/OQT5AlTNv20+9VAkjqNfHupRnD0OIxWuhoaVXIPeGtmr
         4oAK4mluhqafUZuPx7KrPYDvPh9mSpdo63g1QmgjEEdx6jQUWO9CscBFxGg+1KvGVxTQ
         qvbHtKNYyuF4xPc8tKWuEypXGjIS8+v/ypRsHgSGKjj+n+ai2hZJQ0KE8KbyRduR3IVJ
         ok1DhgHrs9QUUChJkJ95y8bKZQtYt/cGnAPx+1gmr+XB+WEPsesE4+HckaRVDfjgWIrV
         9FW70bdITPi1+N1MS7gGoAzXAHp8Gctc54/XkN8MDWdy30SZ566lMexIK3iQb9lpoStZ
         L8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917250; x=1795522050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdCytpgBEMMjWWjAaswQ3teC54EqiXNp/aCnfx0q/Uk=;
        b=rZER/JDjkmNgvaLpSwaXYsDjxmt7LBCv9C6oOmOyGFkjJ+RLtn6bdxW7F0syl7SgKF
         IPtcQ1WnpvUNOAGiqjg730u1+SMoItD5pw9FADK0V8HjfU0V18YJOR2wP0eMUAt2CVx+
         4BUMyjiDg1H3f8Xs5MNuddQyIN387IUHnVQA3WX/khA+h5ehRMT87oosUmjS5b7T5MsB
         +9HGvs5jnq1HpqX2nMC7nQAQ2RCZXfgzUAxmeuCoI31uMq/OTE5dY6BEOru7KE8agPOs
         ocT6j2hF74ANzP3JXzQHYyl2W2rjleMRlLazfGISQ586wQHTFEKKdBUKOhPxhV6DYgfb
         iHXQ==
X-Forwarded-Encrypted: i=1; AL+hErGf0ir91va/wk20PWduBHtLFCtJvuIS4dU/yQYjQxA1KH8fKGwGoUE2sC2wiXJLQbmBoF6lhKYzxvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BB6GNOPTRlWfyM9xEx2EUvqDJMP+r9KbfGQhyUj3OPkH81egx
	N9vSfO0x2F+QcQLYCga3TbU2zKPa7sTlYnNO7c0+ZcPiewZV0zQxBWgNgNNQZ4tHnW4=
X-Gm-Gg: AYBFou2hz5OQaFI2H5RmoqcDQRVM+tJK8thNvMAumUkaAbItbZbPGTQ90zE0R53yfrq
	Y3J8sA3quzlNO6oSj2SZv5uLdUXOGsZsIgv37XtFZ6EKvbwMV6VRw4p4L30GpyTEzpiUcB4Ke7Z
	c+hf9UwinYca6ioKRaA2SXc8yv0jbXAa6HXaY7q59kNBDRFy0tSsWq9dIzHa2Ov2n0ibF0OXo6z
	HXe78+AnUkgPWrgvWW6KmRzap1zFIlUmO4+RmNItL5EGo17KV9efU0Caabf1yi3CIdYv4ns/jYd
	vvtBwa/M72ylReIT9SJDzMhUwyMAfpY3pr6KH8K+KYuU8ZAE7Ar7XHA9f6vauAtNqixfDpCzExj
	e+QYGTkB5qPwRU8E3T/WM0F/NyDFCVKaogllAQBKMXtXnfRFfxIrJwg5RlYk1rdBFYf4T+edrE9
	sbNpCCwfnD3LE5yPCdkUhDj5nSbm6eR65Ev7DrLSu5AAt+m4LKosi5TXjWyw13JKqC7+9DXwg6/
	K6GbByOeqgBS/ygotFDpxp3FmodIw5nfv147Tv15SivToM7zVX0uhUJyXFo7kPdVgBCTw40h1aW
	4reGR/rlGcD4rvU5vtfRnqgWGD++nSWX0NzfYxPxXGmTcOOK3P92lqKy6OqtfRY8UA==
X-Received: by 2002:a05:701a:cc97:20b0:1b5:2dce:1b88 with SMTP id a92af1059eb24-1b52dce1e79mr5203228c88.45.1794917250013;
        Tue, 17 Nov 2026 04:07:30 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:29 -0800 (PST)
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
Subject: [PATCH v2 4/7] mm/page_ext: use common allocation and initialization entry points
Date: Tue, 17 Nov 2026 20:06:24 +0800
Message-ID: <20261117120627.50601-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261117120627.50601-1-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
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

FLATMEM uses separate page_ext_init_flatmem() and
page_ext_init_flatmem_late() entry points, while SPARSEMEM performs its
work through page_ext_init().  This exposes the memory model in the
generic boot sequence and obscures the allocation and client
initialization phases.

Rename the early entry point to page_ext_alloc() and use
page_ext_init() for client callbacks in both memory models.  SPARSEMEM
keeps its existing late allocation behavior for now; its
page_ext_alloc() remains an empty configuration stub.

This also moves FLATMEM client callbacks from immediately after
kmem_cache_init() to after vmalloc_init().  The callbacks still run
after the buddy and slab allocators are available, as required by
page_owner.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Split the common allocation and initialization entry points into a
  preparatory patch
- Document the later FLATMEM client callback timing (noted by Chris
  Down)
---
 include/linux/page_ext.h | 20 +++++---------------
 mm/mm_init.c             |  7 +------
 mm/page_ext.c            |  5 ++---
 3 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index 79c53ec45dfa..911a84bbb3db 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -62,13 +62,10 @@ static inline bool early_page_ext_enabled(void)
 }
 
 #ifdef CONFIG_SPARSEMEM
-static inline void page_ext_init_flatmem(void)
-{
-}
-extern void page_ext_init(void);
-static inline void page_ext_init_flatmem_late(void)
+static inline void page_ext_alloc(void)
 {
 }
+void page_ext_init(void);
 
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
@@ -79,11 +76,8 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 	return next_pfn % PAGES_PER_SECTION;
 }
 #else
-extern void page_ext_init_flatmem(void);
-extern void page_ext_init_flatmem_late(void);
-static inline void page_ext_init(void)
-{
-}
+void page_ext_alloc(void);
+void page_ext_init(void);
 
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
@@ -205,11 +199,7 @@ static inline void page_ext_init(void)
 {
 }
 
-static inline void page_ext_init_flatmem_late(void)
-{
-}
-
-static inline void page_ext_init_flatmem(void)
+static inline void page_ext_alloc(void)
 {
 }
 
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2367af05570b..7344e7cb8196 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2711,7 +2711,7 @@ void __init mm_core_init(void)
 	 * page_ext requires contiguous pages,
 	 * bigger than MAX_PAGE_ORDER unless SPARSEMEM.
 	 */
-	page_ext_init_flatmem();
+	page_ext_alloc();
 	mem_debugging_and_hardening_init();
 	kfence_alloc_pool_and_metadata();
 	report_meminit();
@@ -2727,11 +2727,6 @@ void __init mm_core_init(void)
 	memblock_free_all();
 	mem_init();
 	kmem_cache_init();
-	/*
-	 * page_owner must be initialized after buddy is ready, and also after
-	 * slab is ready so that stack_depot_init() works properly
-	 */
-	page_ext_init_flatmem_late();
 	kmemleak_init();
 	ptlock_cache_init();
 	pgtable_cache_init();
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 3b581242fd52..b41d4a957bc6 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -180,7 +180,7 @@ static inline struct page_ext *get_entry(void *base, unsigned long index)
 }
 
 #ifndef CONFIG_SPARSEMEM
-void __init page_ext_init_flatmem_late(void)
+void __init page_ext_init(void)
 {
 	invoke_init_callbacks();
 }
@@ -238,9 +238,8 @@ static int __init alloc_node_page_ext(int nid)
 	return 0;
 }
 
-void __init page_ext_init_flatmem(void)
+void __init page_ext_alloc(void)
 {
-
 	int nid, fail;
 
 	if (!invoke_need_callbacks())
-- 
2.54.0


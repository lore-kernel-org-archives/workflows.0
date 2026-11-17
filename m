Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917269;
	b=2nSMFS6PLiJKRks2sla4Gytg9fKx1hDWIypfkahKxoOc1skHTaY5CsZ2luQWhaDYoDRF
	 vNCSP0CNaCo95G/Y74euTPa00w87pa//2CPGgmaD+z7tfsL73MnuUYZEQecDIjsJkboEI
	 lBQfLeTELuMV72SJhhHBin1VEWhPefAfb2UgqNCsGW/vl1hmTBIFOKUx30AsaZ5gPOZA+
	 WYrgU8grlo2fWjHaoC20Usys2SMJa51zpW+QF+km8CkvmaXNAKPDvcbxgl4GfUA2l88pT
	 Q4mVgP8Sfp+WkQ3bTlodZbSmOM7NJQwMrwGYJZNGMvEja2rqCW4bM54L2R9CjR9UdGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WC9KwNg7vzWFhqtQelwms4WX3k2rA90664GjYEiCkuE=;
	b=LoKFc0msuVim2c55yNWEsuwD6ed9l2W/bov++Q9icTzDbmCEMNLLUCLlsTvLl+2FK7Aq
	 KuWAhJPBub7wuoXt+LMpahA7xw1+NTYMRyX9HG8YtExp3K9KiYAyQ+AS7z0Y+aHlT2vfa
	 7SvgnnvznjWbN6Y0b08c79GeXhPmFlCjKOMzee/eQaAdcbUo0sslKgPj6QBky8VuP8JLa
	 ppc/tVmKj0OdnY0bSJFXTQ5raNvkGD3TpEKxI5UlXa7KqHkAkLh30ye0vdcxpfj9FWe4l
	 o6jL1xvn4EXcnbrNyT0tBsUp+z8B57IzfEAi5R3yKsxK5EU6sKm6f10eLEL9pBlcNfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=kJS5L9PY;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DAA606A32A
	for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 12:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67DAA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=kJS5L9PY
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14394530ec6so5819823c88.1
        for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 04:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917268; x=1795522068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC9KwNg7vzWFhqtQelwms4WX3k2rA90664GjYEiCkuE=;
        b=kJS5L9PYCPtdGgTeptzVmcbKCaCwrQ0KBIDiwrdC4EZyO3QgwZoK33U2bXynSKyT9X
         +IFpP6FYSrXBSR2lWWw6G8lV6ECXfzRIvNNhJW8iwT5ep9Q0tQVikFaeFPHFvl8EsHKd
         /Txm3zEYKs3XN39Pm1GCZbobL6843B9k6ZUJSj3CYIS+1Gfn1ISeIMVlWLXQN1nM18bM
         FpMw9NGOm3hQ9B1853TLOVUDl0btja7xzDMKdurKXz12Qa0ItoPeKyGAkmobsAp78FXz
         8BtVWhamvb13yKBh8ptqhL3o1qOtwwVFvl9lDt14u5S7J0TxVyJykDWQV7Kv8CJJMgkw
         r4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917268; x=1795522068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WC9KwNg7vzWFhqtQelwms4WX3k2rA90664GjYEiCkuE=;
        b=tnfbjMP9UCDVOisBwVubrv6Bxcfytr/kD3JQlQfPTwKhWPGU0MW1bMYcBcMfav/4To
         b75DI1yxxG5kRp2qPEVqbp8GFrQIFm6nrtmKKQlz7rNRTdokBVbfKGjl/m54PfWlF2ea
         pgmb8811Pjt6OkdXkD+cseQkhseCh7S7YGIAsvbVBJmVC2O3QUHumrVLHMFd3Uanc0wF
         FvXGqkWKR2qDHFPfhKoyABfKzyzt0Bn+ZhXXO1bUi012F0caq5c+DbTAFdfA+FtmVhgZ
         v139gMPNPuXQVdLLietWREJc1tB2VFOQM1sCTqMiOtAY0LFGr0jzy7F/iF1JM2s2xbLM
         EeYg==
X-Forwarded-Encrypted: i=1; AL+hErH5S5TqVxXoilmntK3lnLT4twKE/yq4K37pQkp3q+jCa+5Q4aHa91QOTsepRV2PZbNRCti9eDVbdaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qgt9vzfFyc1/BhoKFTr0Be+jGwC7fWyrhRqB3wtFD3sJorTnN
	61nGLkCSsDgHfNuFXCGpsf9PAhxe2CgWtc5hXE0QPk46zrnWcS7IEbUj+jsBlTRfo/w=
X-Gm-Gg: AYBFou0phwL5wdEjNmKophfzp6z+Ml2ZUEXaW5QJuQAQZNiA6Gm98g9w4TLEuH5YmI/
	ThzxqfDZQqB4BU3DxgZtMxEb0g25iQsb1XPlRFbwdnaJZjX1Qj3cxKZtEQ/d8X4op359l/4NSqh
	zt9EgH5HJKs+c7YSfCf9TNap9lCydfDUc5947T3L5TtbR8qNfDXue9UbaEpFrHslIJnX0Zg8sDJ
	i/VMk7FUxnOH1KQdO713FtaPyrizJNXwDdKb1rCAtcjE8iSUnVwW5wop5jiQByxwTEY5FmtMD0v
	eHzThcjk9S4En3boUHA0I47P6YPA9GkROevLFeXjivU8ULbS3txRFWNoRaZTFfX+ha/LSATzcdm
	fFpMSUpS8Z+6e+1d2K9rfbG69dBoBFvIWDvrOdwedrj8Bi/BCITncF5f0AfBQHlSXOT7WU3s+sc
	wjAbxa5mznscw4oSTnaPP74XTxG2sb0a/32HQkCRAQoWBrCKxIgB0oxsE5AAzxalqA3vEbpQlvh
	BxhahX9mnwo6DH98Tu3rAz4OOmzQljEcWhvPf38m2KEoBL8g/xwa2tzvEClepVeD9w4aKitoWEp
	afqXsNZECNlSgEetjH+rE+xXWw4g8/Zt1jbMd1VIDxxYF+/faPVPiMc0FZm8mGl6Ug0=
X-Received: by 2002:a05:7022:f116:b0:1b3:af3a:e793 with SMTP id a92af1059eb24-1b502fe37c6mr12306756c88.0.1794917263484;
        Tue, 17 Nov 2026 04:07:43 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:43 -0800 (PST)
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
Subject: [PATCH v2 6/7] mm/page_ext: inline unchecked page extension lookup
Date: Tue, 17 Nov 2026 20:06:26 +0800
Message-ID: <20261117120627.50601-7-songmuchun@bytedance.com>
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

The KMSAN runtime needs an unchecked page extension lookup that can be
inlined into its uninstrumented compilation unit while page_ext.c remains
instrumented.

Provide an inline lookup for this use case while keeping the existing RCU
checks for other callers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Add a preparatory patch that inlines the unchecked lookup (suggested
  by Chris Down)
- Use a PFN interface to avoid architecture header-order dependencies
---
 include/linux/page_ext.h | 46 ++++++++++++++++++++++++++++++
 mm/page_ext.c            | 60 +++-------------------------------------
 2 files changed, 50 insertions(+), 56 deletions(-)

diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
index d00320106a58..166f8be11564 100644
--- a/include/linux/page_ext.h
+++ b/include/linux/page_ext.h
@@ -64,7 +64,14 @@ static inline bool early_page_ext_enabled(void)
 void page_ext_alloc(void);
 void page_ext_init(void);
 
+static __always_inline struct page_ext *page_ext_entry(void *base, unsigned long index)
+{
+	return base + page_ext_size * index;
+}
+
 #ifdef CONFIG_SPARSEMEM
+#define PAGE_EXT_INVALID	0x1
+
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
 	/*
@@ -73,11 +80,50 @@ static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 	 */
 	return next_pfn % PAGES_PER_SECTION;
 }
+
+static __always_inline bool page_ext_invalid(struct page_ext *page_ext)
+{
+	return !page_ext || (((unsigned long)page_ext & PAGE_EXT_INVALID) == PAGE_EXT_INVALID);
+}
+
+static __always_inline struct page_ext *__page_ext_lookup(unsigned long pfn)
+{
+	struct mem_section *section = __pfn_to_section(pfn);
+	struct page_ext *page_ext = READ_ONCE(section->page_ext);
+
+	/*
+	 * The sanity checks the page allocator does upon freeing a page can
+	 * reach here before the page_ext arrays are allocated when feeding a
+	 * range of pages to the allocator for the first time during bootup or
+	 * memory hotplug.
+	 */
+	if (page_ext_invalid(page_ext))
+		return NULL;
+	return page_ext_entry(page_ext, pfn);
+}
 #else
 static inline bool page_ext_iter_next_fast_possible(unsigned long next_pfn)
 {
 	return true;
 }
+
+static __always_inline struct page_ext *__page_ext_lookup(unsigned long pfn)
+{
+	int nid = pfn_to_nid(pfn);
+	struct page_ext *base = NODE_DATA(nid)->node_page_ext;
+	unsigned long index;
+
+	/*
+	 * The sanity checks the page allocator does upon freeing a page can
+	 * reach here before the page_ext arrays are allocated when feeding a
+	 * range of pages to the allocator for the first time during bootup or
+	 * memory hotplug.
+	 */
+	if (unlikely(!base))
+		return NULL;
+	index = pfn - round_down(node_start_pfn(nid), MAX_ORDER_NR_PAGES);
+	return page_ext_entry(base, index);
+}
 #endif
 
 extern struct page_ext *page_ext_get(const struct page *page);
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 2910727e99e2..0f31e2da2611 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -63,10 +63,6 @@
  * can utilize this callback to initialize the state of it correctly.
  */
 
-#ifdef CONFIG_SPARSEMEM
-#define PAGE_EXT_INVALID       (0x1)
-#endif
-
 #if defined(CONFIG_PAGE_IDLE_FLAG) && !defined(CONFIG_64BIT)
 static bool need_page_idle(void)
 {
@@ -175,33 +171,7 @@ static void __init invoke_init_callbacks(void)
 	}
 }
 
-static inline struct page_ext *get_entry(void *base, unsigned long index)
-{
-	return base + page_ext_size * index;
-}
-
 #ifndef CONFIG_SPARSEMEM
-static struct page_ext *lookup_page_ext(const struct page *page)
-{
-	unsigned long pfn = page_to_pfn(page);
-	unsigned long index;
-	struct page_ext *base;
-
-	WARN_ON_ONCE(!rcu_read_lock_held());
-	base = NODE_DATA(page_to_nid(page))->node_page_ext;
-	/*
-	 * The sanity checks the page allocator does upon freeing a
-	 * page can reach here before the page_ext arrays are
-	 * allocated when feeding a range of pages to the allocator
-	 * for the first time during bootup or memory hotplug.
-	 */
-	if (unlikely(!base))
-		return NULL;
-	index = pfn - round_down(node_start_pfn(page_to_nid(page)),
-					MAX_ORDER_NR_PAGES);
-	return get_entry(base, index);
-}
-
 static int __init alloc_node_page_ext(int nid)
 {
 	struct page_ext *base;
@@ -247,29 +217,6 @@ static int __init __page_ext_alloc(void)
 }
 
 #else /* CONFIG_SPARSEMEM */
-static bool page_ext_invalid(struct page_ext *page_ext)
-{
-	return !page_ext || (((unsigned long)page_ext & PAGE_EXT_INVALID) == PAGE_EXT_INVALID);
-}
-
-static struct page_ext *lookup_page_ext(const struct page *page)
-{
-	unsigned long pfn = page_to_pfn(page);
-	struct mem_section *section = __pfn_to_section(pfn);
-	struct page_ext *page_ext = READ_ONCE(section->page_ext);
-
-	WARN_ON_ONCE(!rcu_read_lock_held());
-	/*
-	 * The sanity checks the page allocator does upon freeing a
-	 * page can reach here before the page_ext arrays are
-	 * allocated when feeding a range of pages to the allocator
-	 * for the first time during bootup or memory hotplug.
-	 */
-	if (page_ext_invalid(page_ext))
-		return NULL;
-	return get_entry(page_ext, pfn);
-}
-
 static __ref void *alloc_page_ext(size_t size, int nid)
 {
 	void *addr;
@@ -360,7 +307,7 @@ static void __free_page_ext(unsigned long pfn)
 		base = (void *)base - PAGE_EXT_INVALID;
 	WRITE_ONCE(ms->page_ext, NULL);
 
-	base = get_entry(base, pfn);
+	base = page_ext_entry(base, pfn);
 	free_page_ext(base);
 }
 
@@ -503,7 +450,8 @@ void __init page_ext_init(void)
  */
 struct page_ext *page_ext_lookup(unsigned long pfn)
 {
-	return lookup_page_ext(pfn_to_page(pfn));
+	WARN_ON_ONCE(!rcu_read_lock_held());
+	return __page_ext_lookup(pfn);
 }
 
 /**
@@ -522,7 +470,7 @@ struct page_ext *page_ext_get(const struct page *page)
 	struct page_ext *page_ext;
 
 	rcu_read_lock();
-	page_ext = lookup_page_ext(page);
+	page_ext = page_ext_lookup(page_to_pfn(page));
 	if (!page_ext) {
 		rcu_read_unlock();
 		return NULL;
-- 
2.54.0


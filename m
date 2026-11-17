Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917271;
	b=v1ZqD52Y9+EKICaskCvjphZ4Ux3HnvX8ffJxOZwfTeXD4/JOYSDM7K1DUGiSz1ood0rO
	 gZtpYg4T2HIbgWs6Qz+xAWOcWtUlrPdOK9vkktjKtj6cPnystx3mjPEqF2DX8NWq0oEXO
	 1V+bhX/4+zxQOo5Gfj8AWAydYJqsGX9uOctc4cJQrpw211c2jgk8pkQCdpIFFVETbyM37
	 YprFsuHPr81KCamFW+wy6FWyLY4ppZgIze1hbpTCkaYmeOEe1u4Dy1Eu6YayGPm3VMMfb
	 2cQKdyA1jELSoPpaRll9BPKzOQO3j5YcJ0NBV/64s0BBWlSki06m0l0rEzk1lYIeQHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RwmBcFAvKpsoHZ/5BcpLZO38brajTDnaS36NnWhFMMI=;
	b=Lbk5zrGTb+1Ea7n1fv+evXNx+bM4rszYaQBl1HmngXcpRCYlY4SoQJui+uN0BOYffhIx
	 E0PCXgdpmT5V3AXZx0zSVFNoNVR1nLb0QdQrnthZtEBoAd/ZjRzJnYyQcP/+Q3Kyxl203
	 +6xFpN2gdtloiokRK6dAjc4LBCR8oFtg74ln+vGSL9qtGdusg4ZZyqYEzeDu6Z5yemIHh
	 E4F2tqnRL2Yt9BsRzUmd+3gQWE/UwgqJEkULPpixuMyCx+XcnOh4AskiYD3ywWI7OUg0U
	 nFmIPi3Xcq5IPatn+6nGXSB9Iegu4wtzSZlp86wneYMhlaX/inxuAqyqKtde+BKj20A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iwF0Kr1g;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADCC606A331
	for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 12:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADCC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=iwF0Kr1g
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b244fb7fffso5454408c88.1
        for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 04:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917270; x=1795522070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwmBcFAvKpsoHZ/5BcpLZO38brajTDnaS36NnWhFMMI=;
        b=iwF0Kr1gjZojuJAbCBxY8yD6AM0GP9Akj3W2Qsb1sS1OTqbzJK+KN+4CIx5laJ/Kul
         l4wzq26lAcZlB75DZFZk1aIEem4kBNevUdzBN5u0nhM4KKk/FtcV0OHxYkWNTcLIufqz
         eYfgntPsojzj2Y+tuOtsRDtg2DJQV3aRUZyu40V20AGWwUzau5Fff45Y+U7dg/9FH7H0
         7AcbdbtDvlRMtLN8QuDsi5+DSkZnbwqcFtZasnoQcC5MK83tKMLj8Gq1tciwtVQ5GS7D
         3oExCYKA1rKAT70Tf27PN56Ze+xo09oLMAPpLEgP+a9f18J+xhbBw1a9ccbY/GPPUL6W
         Wreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917270; x=1795522070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwmBcFAvKpsoHZ/5BcpLZO38brajTDnaS36NnWhFMMI=;
        b=Us+s8cjftkw0o2ZLvJmNxI9XC6DL2HL2dBx6fh9+HcZfZr1blyMgKNaWFZwxN6T/cm
         vlNKmTig40gsR5lu0uV1wIm5txW8ug1p1BieNYv8XL3jdF6lrNPqKpQ15Bedx4tVKpBT
         O7sJSjtull4CRySYvKkg4hvMDHPhUhDizZwyeemr8uIvzCX8ROf0Az4G+dE7Lb7JiXGY
         FIoiETG+NGUZkeiAESMz6r/gRbjx8w7VoWdBgzxZLUykjXMS7/ED17sK1Nz4jH7+97re
         RtKE5MjYDAzfWT24WASpOgldJAWaOB0yZpNU3qzylMs+OTqYOyKC3XvtethymP5I9hKV
         Xe+g==
X-Forwarded-Encrypted: i=1; AL+hErHpcnAUOSZ8hPB/uOllYsPBTG0/O2idI2G3aMYvRh81rabp8olvpuRIAqmvg/vh0hcQnMMm1Fq6Lvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m1CB88+ylJWPKutddSISiVxPSSsfsI9ZoNY5uAeyfPJUPfX9W
	StisMB9tV8Zl/9T9HrJ/4e6AmBsL95YUXjAd6ZH/mUim68ued2HmZuYcr4eifnWz/wM=
X-Gm-Gg: AYBFou0WT3JBppPKABTxm2KkkCZDBF20bsQgOvPffyIsTk+YmthmLXjVms0VMl9HnCd
	FAlZV2mQVsQ+5/Ur4GDAXSpAfFPCbr2Ki05bEDoJkLDXsW/bLFIwHvx7ibjh29a62FeZJ3vlaR9
	Q0gzHkwYs+sYnQmCV4qEc1oUTLh0RTkF0MoSPgEuoB6vKuNHSaQOy+jOe9tx/2SrvSrFSnLNtSu
	fTj07i8PydTCaIs9trtJCHuc2dEJC4gCslmF4Tt6GOJmXFcn7SLRO+YqslQFjQ97lewrKUAs1dS
	+qZgc30nJiRrTv8XNlTnvp04tpW+fXNSTuZ2kkNruaVqPyO0/Ww1lclRpJH4R9cufZ+76FFxHNN
	RtvoOVqk9YyL/Gb7BLBx0crDIKRModDaDJgsgpK1RaH+M5zIVwPkN7j7AwCCARGzpFoNTgW+8Pt
	bi86nqBxu2SweD2Ipq2pfcgxI2lUIWnMYKfM/I9gdzy+YM/ciWBHa/7mv/PvGSxRzo6y9ly1Rd/
	6QSPqtcLQT0ghb2h1v1AhbuDO26geRilobgUN/zOsObiPClQh2QPVSEHji3EJju0Fkbyl5RW2RR
	eTJDeQx8Ticc1Hx93EVjBvdSjIOFqNR4olV+MeWMXYqYuEXFhfwneynGAWEMPeqsSVDs/UAW/lU
	kOERGELOVah/x
X-Received: by 2002:a05:7022:408d:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b50310591dmr12810999c88.23.1794917270047;
        Tue, 17 Nov 2026 04:07:50 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:49 -0800 (PST)
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
Subject: [PATCH v2 7/7] kmsan: fix metadata loss during HugeTLB struct page reinitialization
Date: Tue, 17 Nov 2026 20:06:27 +0800
Message-ID: <20261117120627.50601-8-songmuchun@bytedance.com>
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

KMSAN stores each page's shadow and origin pointers in struct page.
Boot-time gigantic HugeTLB pages are reinitialized after
kmsan_init_shadow() installs these pointers, dropping the mappings and
leaving the allocated metadata pages unreachable.

Move the pointers to page_ext, whose boot-time storage is available
before kmsan_init_shadow() and survives struct page reinitialization.
Use the inline unchecked lookup under notrace preemption so metadata
lookup cannot recurse through instrumented hooks.

This shrinks struct page from 80 to 64 bytes on x86-64 KMSAN builds,
making its size a power of two and allowing HugeTLB Vmemmap Optimization
with KMSAN.

Fixes: fde1c4ecf916 ("mm: hugetlb: skip initialization of gigantic tail struct pages if freed by HVO")
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ac161ba4-30cc-4bd3-b93c-ab7af8a6f64f
---
v2:
- Update __mm_zero_struct_page() for the smaller struct page.
- Keep the unchecked lookup inline in KMSAN and leave page_ext.c
  instrumented (suggested by Chris Down)
- Document page_ext metadata storage and KMSAN HVO support (suggested
  by Chris Down)
- Use the common boot-time page_ext allocation instead of need_early
---
 Documentation/dev-tools/kmsan.rst |  8 +++---
 include/linux/kmsan.h             |  2 ++
 include/linux/mm.h                | 12 +++------
 include/linux/mm_types.h          | 12 ---------
 lib/Kconfig.kmsan                 |  1 +
 mm/kmsan/shadow.c                 | 45 ++++++++++++++++++++++++++-----
 mm/page_ext.c                     |  4 +++
 7 files changed, 52 insertions(+), 32 deletions(-)

diff --git a/Documentation/dev-tools/kmsan.rst b/Documentation/dev-tools/kmsan.rst
index 0dc668b183f6..5330d21d141d 100644
--- a/Documentation/dev-tools/kmsan.rst
+++ b/Documentation/dev-tools/kmsan.rst
@@ -376,13 +376,11 @@ Metadata allocation
 
 There are several places in the kernel for which the metadata is stored.
 
-1. Each ``struct page`` instance contains two pointers to its shadow and
-origin pages::
+1. Each page frame has a corresponding ``struct page_metadata`` entry containing
+two pointers to its shadow and origin pages::
 
-  struct page {
-    ...
+  struct page_metadata {
     struct page *shadow, *origin;
-    ...
   };
 
 At boot-time, the kernel allocates shadow and origin pages for every available
diff --git a/include/linux/kmsan.h b/include/linux/kmsan.h
index 7da9fd506b39..08fb79566235 100644
--- a/include/linux/kmsan.h
+++ b/include/linux/kmsan.h
@@ -15,12 +15,14 @@
 #include <linux/types.h>
 
 struct page;
+struct page_ext_operations;
 struct kmem_cache;
 struct task_struct;
 struct scatterlist;
 struct urb;
 
 #ifdef CONFIG_KMSAN
+extern struct page_ext_operations kmsan_ops;
 
 /**
  * kmsan_task_create() - Initialize KMSAN state for the task.
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 77b5d450fe45..9349209cd2c0 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -133,7 +133,7 @@ extern int mmap_rnd_compat_bits __read_mostly;
  * define their own version of this macro in <asm/pgtable.h>
  */
 #if BITS_PER_LONG == 64
-/* This function must be updated when the size of struct page grows above 96
+/* This function must be updated when the size of struct page grows above 80
  * or reduces below 56. The idea that compiler optimizes out switch()
  * statement, and only leaves move/store instructions. Also the compiler can
  * combine write statements if they are both assignments and can be reordered,
@@ -144,18 +144,12 @@ static inline void __mm_zero_struct_page(struct page *page)
 {
 	unsigned long *_pp = (void *)page;
 
-	 /* Check that struct page is either 56, 64, 72, 80, 88 or 96 bytes */
+	/* Check that struct page is either 56, 64, 72 or 80 bytes */
 	BUILD_BUG_ON(sizeof(struct page) & 7);
 	BUILD_BUG_ON(sizeof(struct page) < 56);
-	BUILD_BUG_ON(sizeof(struct page) > 96);
+	BUILD_BUG_ON(sizeof(struct page) > 80);
 
 	switch (sizeof(struct page)) {
-	case 96:
-		_pp[11] = 0;
-		fallthrough;
-	case 88:
-		_pp[10] = 0;
-		fallthrough;
 	case 80:
 		_pp[9] = 0;
 		fallthrough;
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 1ed35d258d2e..dc73f9f5a51b 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -208,18 +208,6 @@ struct page {
 #ifdef LAST_CPUPID_NOT_IN_PAGE_FLAGS
 	int _last_cpupid;
 #endif
-
-#ifdef CONFIG_KMSAN
-	/*
-	 * KMSAN metadata for this page:
-	 *  - shadow page: every bit indicates whether the corresponding
-	 *    bit of the original page is initialized (0) or not (1);
-	 *  - origin page: every 4 bytes contain an id of the stack trace
-	 *    where the uninitialized value was created.
-	 */
-	struct page *kmsan_shadow;
-	struct page *kmsan_origin;
-#endif
 } _struct_page_alignment;
 
 /*
diff --git a/lib/Kconfig.kmsan b/lib/Kconfig.kmsan
index cae1ddcc18e1..015e85c70793 100644
--- a/lib/Kconfig.kmsan
+++ b/lib/Kconfig.kmsan
@@ -10,6 +10,7 @@ config KMSAN
 	depends on HAVE_ARCH_KMSAN && HAVE_KMSAN_COMPILER
 	depends on DEBUG_KERNEL && !KASAN && !KCSAN
 	depends on !PREEMPT_RT
+	select PAGE_EXTENSION
 	select STACKDEPOT
 	select STACKDEPOT_ALWAYS_INIT
 	help
diff --git a/mm/kmsan/shadow.c b/mm/kmsan/shadow.c
index 300b48818af1..fa2a403d87c2 100644
--- a/mm/kmsan/shadow.c
+++ b/mm/kmsan/shadow.c
@@ -13,6 +13,7 @@
 #include <linux/cacheflush.h>
 #include <linux/memblock.h>
 #include <linux/mm_types.h>
+#include <linux/page_ext.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
 #include <linux/stddef.h>
@@ -24,23 +25,55 @@
 #define KMSAN_META_MASK_SHADOW		BIT(0)
 #define KMSAN_META_MASK_ORIGIN		BIT(1)
 
+/*
+ * KMSAN metadata for this page:
+ *  - shadow page: every bit indicates whether the corresponding
+ *    bit of the original page is initialized (0) or not (1);
+ *  - origin page: every 4 bytes contain an id of the stack trace
+ *    where the uninitialized value was created.
+ */
 struct page_metadata {
 	struct page *shadow;
 	struct page *origin;
 };
 
+static __init bool need_page_metadata(void)
+{
+	return true;
+}
+
+struct page_ext_operations kmsan_ops = {
+	.size	= sizeof(struct page_metadata),
+	.need	= need_page_metadata,
+};
+
 static inline struct page_metadata get_page_metadata(struct page *page)
 {
-	return (struct page_metadata) {
-		.shadow = page->kmsan_shadow,
-		.origin = page->kmsan_origin,
-	};
+	struct page_metadata meta = {};
+	struct page_ext *page_ext;
+
+	/*
+	 * Avoid instrumented preemption debug and tracing hooks while resolving
+	 * KMSAN metadata, as they would recurse back into metadata lookup.
+	 */
+	preempt_disable_notrace();
+	page_ext = __page_ext_lookup(page_to_pfn(page));
+	if (page_ext)
+		meta = *(struct page_metadata *)page_ext_data(page_ext, &kmsan_ops);
+	preempt_enable_no_resched_notrace();
+
+	return meta;
 }
 
 static inline void set_page_metadata(struct page *page, struct page_metadata meta)
 {
-	page->kmsan_shadow = meta.shadow;
-	page->kmsan_origin = meta.origin;
+	struct page_ext *page_ext;
+
+	preempt_disable_notrace();
+	page_ext = __page_ext_lookup(page_to_pfn(page));
+	if (page_ext)
+		*(struct page_metadata *)page_ext_data(page_ext, &kmsan_ops) = meta;
+	preempt_enable_no_resched_notrace();
 }
 
 static inline void *shadow_ptr_for(struct page_metadata meta)
diff --git a/mm/page_ext.c b/mm/page_ext.c
index 0f31e2da2611..274c3e778be6 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -12,6 +12,7 @@
 #include <linux/rcupdate.h>
 #include <linux/pgalloc_tag.h>
 #include <linux/iommu-debug-pagealloc.h>
+#include <linux/kmsan.h>
 #include <linux/slab.h>
 
 /*
@@ -87,6 +88,9 @@ static struct page_ext_operations *page_ext_ops[] __initdata = {
 #ifdef CONFIG_PAGE_TABLE_CHECK
 	&page_table_check_ops,
 #endif
+#ifdef CONFIG_KMSAN
+	&kmsan_ops,
+#endif
 #ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
 	&page_iommu_debug_ops,
 #endif
-- 
2.54.0


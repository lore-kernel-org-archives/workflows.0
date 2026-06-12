Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCE83905F9;
	Fri, 12 Jun 2026 04:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781239509; cv=none; b=eDU2b7+G5gnCmcGOz1RwNn89s2lnOkuP8xZMjjA8evjZqPtaAFDCPBFea6RgzhnLr8HGUKPG2ezmallvCiXgrY1BIKgZGUXZPgk+KIyqjktO0v03TLJEUpDXZ6icEuh866wVgviL1h0jiytvDDxcvQBHbIg2fezqLKpNBHLEGGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781239509; c=relaxed/simple;
	bh=adMGJ7PXZloqurqObpZQmC4xZiFQ3So5xjocDZ6UB6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F22r+A92IwsC4PN2/N9egGQVzLvsDhsPWIaoSDpnuEb1RfbqWeLfLdAvQBaGqkVkL3fBh9uOx7gRVOfLo0SBUPfghU4pgGSbyK7qvLuvaXBrsoWPRIQLwARo79mdTEo8OHxkCJUWmSVbTFwtyGOvlKBosPqoo1CeYJ/PGLiGU6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dyprqNRX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dyprqNRX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5263B2E91;
	Thu, 11 Jun 2026 21:45:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6A98E3FAF5;
	Thu, 11 Jun 2026 21:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781239506; bh=adMGJ7PXZloqurqObpZQmC4xZiFQ3So5xjocDZ6UB6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dyprqNRXfh9wVKf2O2t0oY3N9NZr2vJGqiN+CzR4ogevyLghQcFeqWH+CH6APm3GX
	 ZX6ZCMglBYa+Nsi28vNnVLgYd7ZSS3Yymcm7FvevGna/IiGmKmLZKE1D/XZ92HG1ZO
	 R4nwE7x14jL8zdcxhGbU84hVARQ1ZI5lZut0W+Qw=
From: Dev Jain <dev.jain@arm.com>
To: ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org,
	corbet@lwn.net
Cc: Dev Jain <dev.jain@arm.com>,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	kaleshsingh@google.com,
	21cnbao@gmail.com,
	david@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com
Subject: [RFC PATCH 2/2] kasan: hw_tags: Add boot option to elide free time poisoning
Date: Fri, 12 Jun 2026 04:44:24 +0000
Message-ID: <20260612044425.763060-3-dev.jain@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612044425.763060-1-dev.jain@arm.com>
References: <20260612044425.763060-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a boot option to tag only at allocation time of the objects. This
reduces KASAN MTE overhead, the tradeoff being reduced ability
of catching bugs.

Now, when a memory object will be freed, it will retain the random tag it
had at allocation time. This compromises on catching UAF bugs, till the
time the object is not reallocated.

Hence, not catching "use-after-free-before-reallocation" and not catching
"double-free" will be the compromise for reduced KASAN overhead.

Keep this as a boot time feature to prevent building two kernel images.

To implement the feature, we need to effectively render kasan_poison()
redundant for hw tags case, but keep it working in the case where it is
used not in an object-freeing code path, but the redzoning path (which
means, poisoning the tail end of a vmalloc or kmalloc allocation).

We achieve this by overloading the poison values for the hw tags case: we
define the four poison values as 0x0E, 0x1E, 0x2E, 0x3E. In kasan_poison(),
if we arrive with KASAN_SLAB_REDZONE or KASAN_PAGE_REDZONE, do a bitwise
OR on the value of the tag to make it equal to KASAN_TAG_INVALID.

If not, then, if init is true, zero out the memory and bail out.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 Documentation/dev-tools/kasan.rst |  4 +++
 mm/kasan/hw_tags.c                | 43 ++++++++++++++++++++++++++++++-
 mm/kasan/kasan.h                  | 23 ++++++++++++++++-
 3 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 4968b2aa60c80..b0c30584b5062 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -146,6 +146,10 @@ disabling KASAN altogether or controlling its features:
 - ``kasan.vmalloc=off`` or ``=on`` disables or enables tagging of vmalloc
   allocations (default: ``on``).
 
+- ``kasan.tag_only_on_alloc=off`` or ``=on`` disables or enables skipping
+  free-time tagging (poisoning) while keeping allocation-time tagging enabled
+  (default: ``off``).
+
 - ``kasan.page_alloc.sample=<sampling interval>`` makes KASAN tag only every
   Nth page_alloc allocation with the order equal or greater than
   ``kasan.page_alloc.sample.order``, where N is the value of the ``sample``
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index c1a2b48808ed7..a392e34d11e3a 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -41,9 +41,16 @@ enum kasan_arg_vmalloc {
 	KASAN_ARG_VMALLOC_ON,
 };
 
+enum kasan_arg_tag_only_on_alloc {
+	KASAN_ARG_TAG_ONLY_ON_ALLOC_DEFAULT,
+	KASAN_ARG_TAG_ONLY_ON_ALLOC_OFF,
+	KASAN_ARG_TAG_ONLY_ON_ALLOC_ON,
+};
+
 static enum kasan_arg kasan_arg __ro_after_init;
 static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
 static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
+static enum kasan_arg_tag_only_on_alloc kasan_arg_tag_only_on_alloc __initdata;
 
 /*
  * Whether the selected mode is synchronous, asynchronous, or asymmetric.
@@ -63,6 +70,10 @@ EXPORT_SYMBOL_GPL(kasan_flag_vmalloc);
 /* Whether to check write accesses only. */
 static bool kasan_flag_write_only = false;
 
+/* Whether to skip free-time tagging. */
+DEFINE_STATIC_KEY_FALSE(kasan_flag_tag_only_on_alloc);
+EXPORT_SYMBOL_GPL(kasan_flag_tag_only_on_alloc);
+
 #define PAGE_ALLOC_SAMPLE_DEFAULT	1
 #define PAGE_ALLOC_SAMPLE_ORDER_DEFAULT	3
 
@@ -154,6 +165,23 @@ static int __init early_kasan_flag_write_only(char *arg)
 }
 early_param("kasan.write_only", early_kasan_flag_write_only);
 
+/* kasan.tag_only_on_alloc=off/on */
+static int __init early_kasan_flag_tag_only_on_alloc(char *arg)
+{
+	if (!arg)
+		return -EINVAL;
+
+	if (!strcmp(arg, "off"))
+		kasan_arg_tag_only_on_alloc = KASAN_ARG_TAG_ONLY_ON_ALLOC_OFF;
+	else if (!strcmp(arg, "on"))
+		kasan_arg_tag_only_on_alloc = KASAN_ARG_TAG_ONLY_ON_ALLOC_ON;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+early_param("kasan.tag_only_on_alloc", early_kasan_flag_tag_only_on_alloc);
+
 static inline const char *kasan_mode_info(void)
 {
 	if (kasan_mode == KASAN_MODE_ASYNC)
@@ -270,14 +298,27 @@ void __init kasan_init_hw_tags(void)
 		break;
 	}
 
+	switch (kasan_arg_tag_only_on_alloc) {
+	case KASAN_ARG_TAG_ONLY_ON_ALLOC_DEFAULT:
+		/* Default is specified by kasan_flag_tag_only_on_alloc. */
+		break;
+	case KASAN_ARG_TAG_ONLY_ON_ALLOC_OFF:
+		static_branch_disable(&kasan_flag_tag_only_on_alloc);
+		break;
+	case KASAN_ARG_TAG_ONLY_ON_ALLOC_ON:
+		static_branch_enable(&kasan_flag_tag_only_on_alloc);
+		break;
+	}
+
 	kasan_init_tags();
 
 	/* KASAN is now initialized, enable it. */
 	kasan_enable();
 
-	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, vmalloc=%s, stacktrace=%s, write_only=%s)\n",
+	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, vmalloc=%s, tag_only_on_alloc=%s, stacktrace=%s, write_only=%s)\n",
 		kasan_mode_info(),
 		str_on_off(kasan_vmalloc_enabled()),
+		str_on_off(kasan_tag_only_on_alloc_enabled()),
 		str_on_off(kasan_stack_collection_enabled()),
 		str_on_off(kasan_flag_write_only));
 }
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index fc9169a547662..4fa8abb312faa 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -33,6 +33,7 @@ static inline bool kasan_stack_collection_enabled(void)
 #include "../slab.h"
 
 DECLARE_STATIC_KEY_TRUE(kasan_flag_vmalloc);
+DECLARE_STATIC_KEY_FALSE(kasan_flag_tag_only_on_alloc);
 
 enum kasan_mode {
 	KASAN_MODE_SYNC,
@@ -52,6 +53,11 @@ static inline bool kasan_vmalloc_enabled(void)
 	return static_branch_likely(&kasan_flag_vmalloc);
 }
 
+static inline bool kasan_tag_only_on_alloc_enabled(void)
+{
+	return static_branch_unlikely(&kasan_flag_tag_only_on_alloc);
+}
+
 static inline bool kasan_async_fault_possible(void)
 {
 	return kasan_mode == KASAN_MODE_ASYNC || kasan_mode == KASAN_MODE_ASYMM;
@@ -145,12 +151,17 @@ static inline bool kasan_requires_meta(void)
 #define KASAN_SLAB_REDZONE	0xFC  /* redzone for slab object */
 #define KASAN_SLAB_FREE		0xFB  /* freed slab object */
 #define KASAN_VMALLOC_INVALID	0xF8  /* inaccessible space in vmap area */
+#elif defined(CONFIG_KASAN_HW_TAGS)
+#define KASAN_PAGE_FREE		0x0E
+#define KASAN_PAGE_REDZONE	0x1E
+#define KASAN_SLAB_REDZONE	0x2E
+#define KASAN_SLAB_FREE		0x3E
 #else
 #define KASAN_PAGE_FREE		KASAN_TAG_INVALID
 #define KASAN_PAGE_REDZONE	KASAN_TAG_INVALID
 #define KASAN_SLAB_REDZONE	KASAN_TAG_INVALID
 #define KASAN_SLAB_FREE		KASAN_TAG_INVALID
-#define KASAN_VMALLOC_INVALID	KASAN_TAG_INVALID /* only used for SW_TAGS */
+#define KASAN_VMALLOC_INVALID	KASAN_TAG_INVALID
 #endif
 
 #ifdef CONFIG_KASAN_GENERIC
@@ -478,6 +489,16 @@ static inline u8 kasan_random_tag(void) { return 0; }
 
 static inline void kasan_poison(const void *addr, size_t size, u8 value, bool init)
 {
+	if (kasan_tag_only_on_alloc_enabled()) {
+		if ((value != KASAN_SLAB_REDZONE) && (value != KASAN_PAGE_REDZONE)) {
+			if (init)
+				memset((void *)kasan_reset_tag(addr), 0, size);
+			return;
+		}
+	}
+
+	value |= 0xF0;
+
 	if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
 		return;
 	if (WARN_ON(size & KASAN_GRANULE_MASK))
-- 
2.43.0


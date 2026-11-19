Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071600;
	b=Wyir/gFijdtnV09l3GYxVGtnVvZis1Hxv67UzVBg2zj/2qudEWnS7wvbBeRaCwKDVkJW
	 t036e2TteHM7uNug8XrZMHQP9+Hsc7S9G40ZTMpnZ95r2WLrbD78Bc1My/6yMBXQiBF+o
	 xL1nhRknc+53PluLY04p5VOuwgDrTlC8E+RLd22BaQSg0OOo99Rvbjgud8aYILX/XyLFy
	 NBxXP7UN7WAlwVbeCsfQPC8qEnKFl0qkUwMjWWBAnpbAL2MBKVchOD6O4AU+9jZ5Kd55d
	 jffH9K9dk+MLDD6CTNBlpV3By9vTO8ZMWExWM7jQ/dbsU4yB+5oZccTDAeZxLrUvlEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=niVF9RygUWyckhWxTzwkqqzSpVkRZGJqdyALrrQwo64=;
	b=eaJirNN9iK/YcsVs/JXqlQ3qduErXn7+nBkgzIDS2bxPLb5WlL1Rohjusbu05aKfvSux
	 WlyLtPzGSgm2e/Nwg8EBSvKZTK46g3AyIN1QVRYofp3SRtehX9fWOpM30tCcLE5u/d7v6
	 7aB/ppOMaaK7C5Y8aoBrHWeJGxsqOT2Cgx0EbIInwzsFdWkditXtOwbOdFmLRhZveLXTP
	 VnnopeVabE31olUBfVbND5hsHjJzCPkQCZdgTO8+AeSk12nVr/Kdy8AqcY2yU8ztucXSz
	 0gv3H1h4YUlS+/EGmiokktaDvFs6ERh3igrk1Bqlfj9sbJbZYo2mSWls/WuSC9UfAUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jaYX+PaY;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5325D606A32F
	for <workflows@vger.kernel.org>; Thu, 19 Nov 2026 07:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5325D606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=jaYX+PaY
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cde4b4e936fso308524a12.1
        for <workflows@vger.kernel.org>; Wed, 18 Nov 2026 23:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071600; x=1795676400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niVF9RygUWyckhWxTzwkqqzSpVkRZGJqdyALrrQwo64=;
        b=jaYX+PaY0Pd1nWO7YguC8xp2UHhePRxfQ8T4E6KJVrWyOWB1Mztp3a+GkHGI3YSrge
         Jb7E8OBTkaAArGQKY0XMgk/kgRwdua8Wb2W5XoE4gvpFXQ+ltGNrxOBTxfJrbaUZRcb0
         yKeWVBmraLb0bqpYf3vE629ijv/Ps929NSvRWAYsdHKjGGvXyX23I5LDrU+Cmxf4T0Xw
         qw71n8er31QigiZqRh4MxGUVEtSVqjCZhV0LO88E36IdKOHVtLiTfyML8ltZ6/4eevw4
         dSbf8kjR1hIIKj8274yqgO8eNAShMsWB/TEz3BfJNT1DiBTUXaWAax/OVBEjlD09rJ1d
         YUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071600; x=1795676400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=niVF9RygUWyckhWxTzwkqqzSpVkRZGJqdyALrrQwo64=;
        b=ITwtyaJhM9R7HYeDGc4G1pBVTlFTvajaXNqdvQca0jsqm79d0fue0jEniGwBeOYNv+
         SLUo/yc4spbllTNXtl+Yph2VJrJn0ZUnK+8aI209VULdclIAC9SvA7DvZ9r89W9XSlb6
         2+O26/4lNuG0TclKLmR66W8qM0faGxDvrWpFz+0kdcxUZrOBAu0UOXD83wtzTp3ZZ8LK
         XI2vF0mfYJhg1SetTe6WTSYdO+85/0xHb6Pn1Hr4Tp2B9FtiattgjeNIKXpI13aiCbY6
         5JAAiOC+G6K0L+La+1SWQDFE+36tPtGtL/ccP0mn72jGVbKiBV9LVUDIZFA4ehsxfIb9
         kUOg==
X-Forwarded-Encrypted: i=1; AL+hErF+7xqRm9U02Bd2VaQOe9IqkAkRjqMpXwnJrojMwogFOVo0dIYDF/8p7+LI92R00SML2LfxNP9ijb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eHWsYdmoIvBzanulP6ZuWOJPeWhW0QFw94KxIU9jq/Ks2I+Uh
	4cW46wiJjAAvbk775rkDUZ5OnQCeNiRs9PbcXJ+P4Ayo8op96y1ZZBosjqAysCiwWQY=
X-Gm-Gg: AZFdTZdtBC+bZL8UrOgTWxmUAgL4DZCZCFRAaBYbmT/MGoh3qDmJAynEKIlLIyJjr3I
	HFtJk7Xe7ev1EHIXRWhJSJ2UE3tiO6PBr277oR/8ufeMtiqFd23AlhqyNM6q40+YkzAAyk4ohjI
	aAZutNDzwCQc5ZcailO4BewM6B8SccL06j6Owjr3SbH57cR8zwMcVBbtulO/fqObyHqTLo0KfEV
	re9TIWg90rCwOTpwHuzpFAY3GgQzx6hEWwgyR4HZUoLPRS7nrJr/m1lJHOmnvDWlAb6ZPsHz2Ej
	wYv69ThOjy3OYX2txL5Gf//kIhwj3yu5ToiGERYC+XiBJSOyi+hs8tOsR8NjCH+IRBMjf4qyBuc
	dzJ1afvIYd4si2BSySsAXUQghzVl4NSQl3nnpebr4ENeSmDdwISJbe4Ew2MmhmLKBOGaJI/7u8K
	rSihrQY9m6ou0GgRLJEBfAuOL0ClzuPJDWDZrGVodzD5vgQQ77pNthUkuTRm7vlyjqeJbNdVju6
	J2x6W8f6zcv6/Nkh1pzAtUye9AUbyClxARz9v+bZaJC3vxTY5D2H9aw+aHgwXND29cIrPhrtN+p
	q1ecvmqCTSeU/iSOEdnuyfq1TsBov8gNwbLuwdZD0etiilvY0JxJI6HzQSA=
X-Received: by 2002:a17:90b:498e:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b40a32d9c3mr134496a91.39.1795071599193;
        Wed, 18 Nov 2026 22:59:59 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.22.59.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 22:59:58 -0800 (PST)
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
Subject: [PATCH v3 2/7] mm/page_ext: fix client data alignment
Date: Thu, 19 Nov 2026 14:58:07 +0800
Message-ID: <20261119065812.89959-3-songmuchun@bytedance.com>
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

page_ext lays out client payloads consecutively without aligning their
offsets or the final entry size. This happened to work while the active
payload sizes kept the stride naturally aligned, but IOMMU debug page
allocation added a four-byte payload after data requiring eight-byte
alignment.

When page owner and IOMMU debug page allocation are both enabled on
x86-64, struct page_ext, struct page_owner, and the IOMMU payload use
8, 64, and 4 bytes respectively. This produces a 76-byte entry stride,
leaving struct page_ext and page_owner data in every other entry only
four-byte aligned instead of eight-byte aligned.

Align each client offset and round the final entry size to the largest
active alignment so every page_ext entry preserves the alignment
required by all active clients.

Fixes: 466ae6978a5b ("iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC")
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>
---
v3:
- Cap client alignment at u64 alignment to preserve 64-bit alignment on
  32-bit architectures (reported by Sashiko)
- Open-code the lowest power-of-two factor for readability (suggested by
  Andrew Morton)
- Use a local for the u64 alignment (suggested by Mike Rapoport)
- Simplify the commit message to focus on the alignment guarantee
- Collect Reviewed-by and Tested-by from Chris Down

v2:
- New patch to fix the existing page_ext client alignment bug
---
 mm/page_ext.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index b679a8c1f7d7..39a4464fc979 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -116,8 +116,27 @@ static int __init setup_early_page_ext(char *str)
 }
 early_param("early_page_ext", setup_early_page_ext);
 
+static inline size_t page_ext_data_alignment(size_t size)
+{
+	const size_t align = __alignof__(u64);
+
+	if (!size)
+		return 1;
+
+	/* u64 has the strictest alignment required by page_ext clients. */
+	if (IS_ALIGNED(size, align))
+		return align;
+
+	/*
+	 * A type's size is a multiple of its natural alignment, so its
+	 * lowest set bit is at least that alignment.
+	 */
+	return size & -size;
+}
+
 static bool __init invoke_need_callbacks(void)
 {
+	size_t max_align = 1;
 	int i;
 	int entries = ARRAY_SIZE(page_ext_ops);
 	bool need = false;
@@ -126,6 +145,7 @@ static bool __init invoke_need_callbacks(void)
 		if (page_ext_ops[i]->need()) {
 			if (page_ext_ops[i]->need_shared_flags) {
 				page_ext_size = sizeof(struct page_ext);
+				max_align = __alignof__(struct page_ext);
 				break;
 			}
 		}
@@ -133,11 +153,17 @@ static bool __init invoke_need_callbacks(void)
 
 	for (i = 0; i < entries; i++) {
 		if (page_ext_ops[i]->need()) {
+			size_t align;
+
+			align = page_ext_data_alignment(page_ext_ops[i]->size);
+			page_ext_size = ALIGN(page_ext_size, align);
 			page_ext_ops[i]->offset = page_ext_size;
 			page_ext_size += page_ext_ops[i]->size;
+			max_align = max(max_align, align);
 			need = true;
 		}
 	}
+	page_ext_size = ALIGN(page_ext_size, max_align);
 
 	return need;
 }
-- 
2.54.0


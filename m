Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917244;
	b=WqNzrQ9hKRj9aTDlQ362wXtBo9WYdnjL8eOUoEfgY/fKreDst7/iUBVHfTAdCpewmUcA
	 ddeUfL7enM4u6cXJeFZcHVb2tslka3si8Gz90CnEPFPwilmE4ijFpJBYZ766mC07spn08
	 oaeG3N1K7DT/6/4Es8yj4OvkrF03AMmP2G/nN1bXiXYqF8+4xruds1dArImQOlmza0L+O
	 ygLanNLQKx/95d/ajPx8YsdoQCbuCzy7XPvWOkUk2oT49Uy16Xxf7/ePxOccgyxYcUvOw
	 Pu5Va7Wh/mAKrxTJPgO2yGds+k7dXjuPUnzJ1J89I/A4LVLF56voWgp+bAl+TTPogcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pngp1egAaX0YbQYqS/9oJoUz1wuFN3ikmsU5M9jflxo=;
	b=aZuSUKBX9OG/YBMIrtzlrf+hBRN91DQaZNLDj5BHsy3vUg4/XvzTUZt0049vohhfLqdI
	 qBh0K97RpFWzxNNII77ZAvbBh3umc5XkiUwzvyCcDrz0DvVZ0V8WzuaDDfAnB9pRC8b0O
	 HmPjEES1G4kSJHmKEyDJa4dRgndrD8tyhF7MRXvOV1quI1RKAnEFsN2hPTn7vKbRWp13a
	 UmOFWkfY2kkrP+NLW9SPaKDhZPxFO23GbkRevIO4gqt3e2KUGia/b+Mo1B8CXbkuhvPya
	 Q17UkC7CAxFjbfkmU2OWxhh00YOZYppJF4DaymTIGWRSM+R7MdT8UaWdx/IGDM3id8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KIooos2D;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56730606A33D
	for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 12:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56730606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=KIooos2D
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1aefd1bf74aso672649c88.1
        for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 04:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917243; x=1795522043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pngp1egAaX0YbQYqS/9oJoUz1wuFN3ikmsU5M9jflxo=;
        b=KIooos2DClZKouyiKhB4rzpkqn4rd+x7CloM3guhbBtlU1l0KZ2WMbtVma9sjSOz1Q
         5JU9eamBERr7f84Z1mmg7V6b3SxsTKRSz7leQkK+CQbLM4FUJhtc5LcXvOkzIehdAImo
         HdfCXBu/zUTJUUr0xbFUQHToM5w6WRCP3gZbQ1XjrI7P1jd8q1RzxgHQCMjV9USOCPdW
         cnzhMguqG3vqSkGAqmh/lYscCCrHq/pPD7VP01d78p/vRBNfiqfc8tUCXOIi9b1pPaDc
         qgeQ1ltBK/0WFa6P1OaAAUL1Pma4gfa1y09Kd8Pt6YcwYRWXYTKQ2Hr4jq5OZYCr/e3m
         dVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917243; x=1795522043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pngp1egAaX0YbQYqS/9oJoUz1wuFN3ikmsU5M9jflxo=;
        b=sGeAO9NqecSjdphjK5fZMxyv+zgEKzieFXrE0AOlie3imcYlXVDVOLT6u0aDKxTPai
         VlEjY/55HS3FZUmnjSg42vIinEuY+SsDlUkQb2JwAGlO6+QH1nJIIzHzqb9H4BlNn5oA
         qHwlp5Q0XWkstUoLoYlXbaIBiI+EcgMOMT+Kgea4sAQ4tvcJAzfbM0ZN4cXGZxmfBF2l
         BBActZEdYm23KDh7l10IRHjvk08QzFYkixJUXT8XHC6bEilBQrUkVfBm/zbROwduT73E
         CyGxKFZauecUSOv+5p1svlFMdjfzWFV640qOSw3Ff85jUtphupTGvr4NfhRZBLv7a9lX
         mSVw==
X-Forwarded-Encrypted: i=1; AL+hErF8b/FwTRw9oGwBl3aqP/Yh2Pdbzs/PtUll8GhlBc8WLRMJeIpg3pQGtlpaiW/4y9FWAKjAF9etJPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9b0Ft0nuaY4dWGmmjbeUrY8qrgJw9nEyT6z9hDFQwpRNQihBJz
	d+jLkhq8WRvV9TkObqyqoZThYAjtylFqB3BYFKqYcChU5hVyOh6m/AX1RvkZlxjCQvs=
X-Gm-Gg: AYBFou2/pYFDWpKUdkrCPTN1lWYsqAribYQGB7grs0XaJPXLQ7EtiIhB07kttv5aP8q
	TbP7eeEMyKwj8Ks/yK0kuURwOfiy8EdnizT8RTG1Vyu1Jz4z2eRI6/kQcFdZGegdSFNd+lyV3PK
	bZcF4wZB+LXWzGN4u4LbZxvx3CNI9MJozWeqBoyeoAzO1NDXb6MK53jlJ7LrOJSla7zIcMOHbmL
	kylS9FpsL+pPTGVoRKVkEcrvniHDr9fNfDsfYkhm9R9O4e8kYL5liyqerNKwYSHV5ZYgtxJrWB1
	Hf1pkLO/fitnXoqlfrWLE+Jpbqqoyuvv9CvMn21Ws2uLFn4UCqvgN6unfPV2eXw23WCQSF/Xjzb
	ycrETPsPi2eI9pLbRph3yuz3RZHCasf0K7sSS3N7QPvoT4I5YDUu+AKXyOGwFJy3Xjb86N1nB2u
	q8qRd+SAY/DFKuSgb9fh90n5atX2tUBevifNhiFla1pgpLtoyX0mSPtdHB4nk58ZXuW79cUeNGW
	Z1ZHunvc4zaq9hqUrpXqT4VIUYRCEDljYLQHz8PiaBhijuPfYX0DQ4DxUn4kcBTv7c5Iob357P8
	QDLq3ZGP+Zct1v0nu77uBM8GjffdxR03ZqaedunL12VQIHNCd8chP93amB/b46KMSZXE2CF2eN1
	iH2HGj1K+2rk=
X-Received: by 2002:a05:7022:7e85:b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-1b53a3e54fcmr2076054c88.19.1794917243422;
        Tue, 17 Nov 2026 04:07:23 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:22 -0800 (PST)
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
Subject: [PATCH v2 3/7] mm/page_ext: always use vmalloc for section page extensions
Date: Tue, 17 Nov 2026 20:06:23 +0800
Message-ID: <20261117120627.50601-4-songmuchun@bytedance.com>
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

SPARSEMEM currently tries to allocate each section's page extensions
from the buddy allocator before falling back to vmalloc.  Boot-time
section allocation happens after vmalloc is available, and memory
hotplug allocations do not require physically contiguous backing.

Use vzalloc_node() directly and remove the buddy-specific allocation,
free, and kmemleak bookkeeping.  This leaves one runtime backing type
and lets a later change add memblock as the distinct boot-time path
to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- Add a preparatory cleanup that always uses vmalloc for SPARSEMEM
  section page extensions (suggested by Mike Rapoport)
---
 mm/page_ext.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index dbc1bfa258f1..3b581242fd52 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -285,15 +285,9 @@ static struct page_ext *lookup_page_ext(const struct page *page)
 
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
 
@@ -339,19 +333,10 @@ static int __meminit init_section_page_ext(unsigned long pfn, int nid)
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


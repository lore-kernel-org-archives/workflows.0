Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917238;
	b=o+xTweZKEpM+IngcR3WYN5RmTsfA60Puc4KHsxEJ2dpLGyocfFwVYlCL7+mKxDGHF4qg
	 njSkUqv3c0/t9fQw1410HPGEUrtyvJaZKuAGk9eHXtL4nw/HrOUfkA92RMZeCO6LC0PvA
	 15TJBtxchsGqZhVkozkRBeiABOzJzQpTJfrUKy3BSOu4hxbBjveLjAD6oh95Xd/xF06ug
	 9Z4BMgtBdlfPAz6/2rbJIzHjENkbZlRxL9USFkh9M7tRpMj5cqEWQfGdlCoX0K1TpK90h
	 RJaf1kvi/2+/tY0mOqpWyDj+C5Rzom/iEv/wldhfkYmDRF0Dlvl1aAnyIM4jpXBlizw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C2oAxC901LsFPrZY7XEv49QJustbmbWIIv6Ichi+IBM=;
	b=u3dTxgXUlWMkARGmECL3iGj0RjpnMHaQdQxj+n4uW1oaNBYYgUXZiZgH+9dqnapAOmTb
	 kc4h/3uVbiMFlYBSrEmGcve16DRVzdPao8cap4bkuVQ+2iZBbRJLzoZHv6egRDrtU0BWP
	 zsQx5Vwxp+gtscbDWDZabzBRc7qlzmRZAdnqfnhyoRmZ5Z9ax+GaN7imHp+AinXbxel8y
	 pJQ+68cyHLyoTEqfa8MHmAbKhtAVQfC+GWuiTxZ62HKoHsQStOP5pHjjJEI8HpFz6hKxZ
	 NUXyz4XNt0abn9A5NO/ycxCM8e8fLLxIOCZ91idY+rLMrf8uLFKxKw9Ddj5diWuvJaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=C99TFTwL;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54CD606A33E
	for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 12:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D54CD606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=C99TFTwL
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-170135e43c7so7234026c88.0
        for <workflows@vger.kernel.org>; Tue, 17 Nov 2026 04:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794917237; x=1795522037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2oAxC901LsFPrZY7XEv49QJustbmbWIIv6Ichi+IBM=;
        b=C99TFTwLBJW1sd6zrlOB1YIkcU9S6RwNreCTRQ34WR1MEJjCfAMv87IGajeDDodEvq
         fwTcvFBXhWM+R9aDeq4lbG2SD/I6vDASe1V0OpkBdoHDnqNNNIXb4nfFFJfC9rtNt5Yo
         yoOmDvVsBw3p9fotG0CuxO15vcRUBLPf0djTXTVluXuMrUk5OYGYHggqqvK6a5PF728U
         baKbAQMjM8AEYXTbNQQksAR0ZIiOPW3ezawtXnTQd2KeT/43Qk1P5aQNwI44ylE6IZYO
         iMuROYjCAwCu2lphizlEcx8U4LogosDKQt8znAEcAf8evuDnygingk9szQ3o2MkLs/hb
         v8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917237; x=1795522037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2oAxC901LsFPrZY7XEv49QJustbmbWIIv6Ichi+IBM=;
        b=udUpQvFKJfrP5pOqzmEgCx7YODuHGJe8R5WPq7l2QogRkk9i+9D3G4zU711y2C/kkU
         BKywVxF8LjdIB5hpoOiM8AywfTLAyvqcaEWU1reexnbgFWnbuVDSZDw15quGFf6XFn5L
         oBeSklQgzRWVVJYdNfmmdH+HmVbahpkFTwJYIavWorNGQvpoTRUFtBkTZC5XXuMtnfpR
         RA68VqomEkptK5WLyFMjLPPbcW+C+9HE9AgFyB+HAQMwP+iV9iju2nZ4/2RcUC9Q7EXK
         kCLdnX13Cp+5W1H6FJ3jYXJ7NbTmSPq8dsUpSBe07Tgci+W9F8aa2gZMGaHSQ/dj+kTA
         QrYA==
X-Forwarded-Encrypted: i=1; AL+hErH6YHdZLDCfyvD2akI9q+N3yPicgWDAMxVk99E+kFwyxpjnXpvbArWbMJOb5TVMhCijDcLwraDnbhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vOVm2O1kWiceebaSnC3UrJ9atNO8nWQzT/TViFG1uROfheGvW
	pBW6lc0DUfqwINiBEHYPLFGur9lS16TCnVR/VmPcGhh2Rq014QAQs4f1HRe9BliLJzk=
X-Gm-Gg: AYBFou38ncsSP3F6+bZYMxTwqXHMk6oQL/AlxVsY3z2298uiybpOCQFMa6SVQexUV24
	gY+7XAiwHzPWivHCGunPEtbZPU14hmn7fsfJ+1qAN0DkCLqcKaFCGBK+l+iN8AOYNc7sgDI1mm8
	TxabouocVRn/zgJ1sypK/6zVhl4DxSanMRkgO0dRK7qFN9y+UfMKd+cMHESlfQsm7K1z099HIhT
	9MIO4N07FuMogxU4e/iG6C3458+OvGZpjsmppcbkJcj3uVdT1UnoX1frml6PYf9OXIepGldCGJm
	/Jb1OtDatlE4dNQX3lK3xsqZghyEANLbghQ/MACpywRanKUL4ia96NKlvr7QUxBhFVydDGBIH6S
	Ce3uHAq/umVJ9yCQht+NA9n+TfSuWNKBbPjqs8ApNghvXOukTKRJL9CURXXn8REiqoNGKLPkWsP
	ub0bYbVIM/Fr+KMI979otPsZxaN2580AXKXbMqoJURwWRgkt4+4KrhgS8c+EL6ixlSgYlHVpPZr
	rw+PhnH7eNlbXivctWpSmgHxJx4MdbgklAiTqw3KeaqexuFtZPZ8eFgGSMNWGwYJ83Zlq50hyZx
	XAhZCnt1UbaUtlWhNnyUdhvlPniWYTGRJa7Wx8Q7rhTFc0xg8SnIidWkTQS6AT2AH1Ybw1lXF4b
	orBXNP318nl0=
X-Received: by 2002:a05:7022:1583:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b503112a8cmr14843601c88.14.1794917236797;
        Tue, 17 Nov 2026 04:07:16 -0800 (PST)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm47347116c88.5.2026.11.17.04.07.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 04:07:16 -0800 (PST)
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
Subject: [PATCH v2 2/7] mm/page_ext: fix client data alignment
Date: Tue, 17 Nov 2026 20:06:22 +0800
Message-ID: <20261117120627.50601-3-songmuchun@bytedance.com>
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

Derive a suitable alignment for each payload from the lowest set bit of
its size, capped at unsigned long alignment. Align each client offset
and round the final entry size to the largest active alignment so every
entry preserves the alignment required by all active clients.

Fixes: 466ae6978a5b ("iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC")
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
v2:
- New patch to fix the existing page_ext client alignment bug
---
 mm/page_ext.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index b679a8c1f7d7..dbc1bfa258f1 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -116,8 +116,22 @@ static int __init setup_early_page_ext(char *str)
 }
 early_param("early_page_ext", setup_early_page_ext);
 
+static inline size_t page_ext_data_alignment(size_t size)
+{
+	if (!size)
+		return 1;
+
+	/*
+	 * A type's size is a multiple of its natural alignment. The lowest
+	 * set bit of the size is therefore at least that alignment. Cap it
+	 * at unsigned long alignment to avoid excessive per-page padding.
+	 */
+	return min_t(size_t, 1UL << __ffs(size), __alignof__(unsigned long));
+}
+
 static bool __init invoke_need_callbacks(void)
 {
+	size_t max_align = 1;
 	int i;
 	int entries = ARRAY_SIZE(page_ext_ops);
 	bool need = false;
@@ -126,6 +140,7 @@ static bool __init invoke_need_callbacks(void)
 		if (page_ext_ops[i]->need()) {
 			if (page_ext_ops[i]->need_shared_flags) {
 				page_ext_size = sizeof(struct page_ext);
+				max_align = __alignof__(struct page_ext);
 				break;
 			}
 		}
@@ -133,11 +148,17 @@ static bool __init invoke_need_callbacks(void)
 
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


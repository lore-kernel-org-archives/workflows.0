Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D996343D86;
	Fri, 12 Jun 2026 04:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781239502; cv=none; b=rVCjOB+cLA7drmnhCr28xP83yE+lvIksy69hhxfClygw0Cs+0LWLD+4yCKoBvA5gUzeRqVP9QueinbtB1NMmP07Det+icrOxFokWsbTW7VuYikkjdbhaj9D6l3y+sj8SGibn9SnDXSeuBWe3BMKl/YRCmHSz5D4n4dHhWjmAq3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781239502; c=relaxed/simple;
	bh=b00TklBGecqQHLra7PJTRi5mE5kXZpjh3sOy2Gf7YPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PLR7Qih1TCw8vo3/FKeC0jCRcqhBpr03B/PoQGbFJFZvc7252kvMyRC59Dui2QY3EcnJ1XCKwcSj39Let1SOK3KGZx2WPEk9kPUBKVbSt/FwA/uPZ46iesGEUAhiJmV2FXeGGDBUlti+gIne528IMnC4JQBs4R/cyRZwXH8548Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Q+ywobdJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Q+ywobdJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C26E2E91;
	Thu, 11 Jun 2026 21:44:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-01.blr.arm.com (cesw-amp-gbt-1s-m12830-01.blr.arm.com [10.164.195.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BAF13FAF5;
	Thu, 11 Jun 2026 21:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781239499; bh=b00TklBGecqQHLra7PJTRi5mE5kXZpjh3sOy2Gf7YPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q+ywobdJtIBtiIj1Lm87NJAvMg5U5ZyPO3GOiZE5j7oUMWa2LPjn5dzWP/UcvIfsR
	 eAIppw1XHah98pdVj9WRrylHYixsfy899jM7BhUXauI0syxEiAplt27uUuk/UZ4Tct
	 1rn0H7QLZBrriUcOjns9J7XKs7UrCuhBG1BRs4Wk=
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
Subject: [RFC PATCH 1/2] kasan: hw_tags: Use KASAN_PAGE_REDZONE for vmalloc redzoning
Date: Fri, 12 Jun 2026 04:44:23 +0000
Message-ID: <20260612044425.763060-2-dev.jain@arm.com>
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

In preparation for adding "tag only on alloc" boot time option, use
KASAN_PAGE_REDZONE instead of KASAN_TAG_INVALID for poisoning the tail end
of the vmalloc allocation.

Although both values are the same for hw tags, KASAN_SLAB_REDZONE is used
for poisoning the tail end of a kmalloc object allocation, so maintain
the pattern.

Signed-off-by: Dev Jain <dev.jain@arm.com>
---
 mm/kasan/hw_tags.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index cbef5e450954e..c1a2b48808ed7 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -375,7 +375,7 @@ void *__kasan_unpoison_vmalloc(const void *start, unsigned long size,
 	redzone_start = round_up((unsigned long)start + size,
 				 KASAN_GRANULE_SIZE);
 	redzone_size = round_up(redzone_start, PAGE_SIZE) - redzone_start;
-	kasan_poison((void *)redzone_start, redzone_size, KASAN_TAG_INVALID,
+	kasan_poison((void *)redzone_start, redzone_size, KASAN_PAGE_REDZONE,
 		     flags & KASAN_VMALLOC_INIT);
 
 	/*
-- 
2.43.0


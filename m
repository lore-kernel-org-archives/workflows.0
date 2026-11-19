Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071555;
	b=eRzDCWYJ9RQ4H5vG8DFvPKF8iK4F7hnI5VwHRc6JepYvbW0oiHa6ZzkIT5S8VFo6yZ6N
	 obYRAyiXkjy0I5xGmmHTs6mti0Y8B/R9IAzLRj2HPm4aktrwHv1Tb0qZ2XY47X15UFJJ/
	 7PwIQQ47GzOmWeyoMPJD1eG3tbZt8nZhiqywlFA9Him0x5FM2b9QptOYmM1BE3YF17v7V
	 6Ujz7eW/uS3yicZ+NyUf9f4IddCXPpM9npxZLbEjye5mzsM6h9wfHWmVDaslDw6bP3Ggc
	 UVSy77IbhEZQdoo5EADCjjIgTFfm2DpPx6zeRVndOCme23dWhuljwbRPDTijupTJLgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EpkpAe8MEN5BuQD0iXz34+1elSDBS0pp25xEYHL3/ks=;
	b=vmToHcHuBdRCtBMUlrNj07rhMLXLTzFauvl762RDo/WxgxB5HYlKWT9mkIltmhnIhxiU
	 y2lrfbBT6zQN6I3STjKqv1LtsKaeSsJ4JfMX5WMm7nigxF5tyipf2aQLvs7omRwKei52z
	 xpXzjPfhEOBjzAFvR45/IEfywBVvLqOnt/PBrKWqGF9X8gsbF9g6b87Mz2ZFNzmtzg/NZ
	 odP6p5zv+DSgPvIlLRqi5OkxTGwhelklW9E9I5gSfIIMS4DNgelw75fJ6M7SwWsHmhqdK
	 Yf3/vXLHOAn85YAtRoT2Cne5tV3/BjKAVJ2jkww2HLMA3NEVVTDSSWOsjHlvLf0Mkbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Rn8IstEl;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE506606A325
	for <workflows@vger.kernel.org>; Thu, 19 Nov 2026 06:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE506606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Rn8IstEl
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1104143a91.3
        for <workflows@vger.kernel.org>; Wed, 18 Nov 2026 22:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1795071554; x=1795676354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EpkpAe8MEN5BuQD0iXz34+1elSDBS0pp25xEYHL3/ks=;
        b=Rn8IstElCPGCJXfmKbA2/cCAR9Ln8L3tdEsLJTVvjD32rri1ZAD8W3XEEDtJxYDlKT
         Ic2tzXcdG1z7WmGAYft0HUoPrd62eRdzvjIkmFg9OuwgnLH3qbxu66d8QD1u7iZ5ITOU
         ngIR/cA0VHv8xfo18aNjjUi1ZiD3BhE//91Jmwh86iHEQeVWbC1P7K3YfQww6wogHhUi
         nJIy6HUgla1oFRXGDS2clN2+Qus3Fv1sBU1xadxteaXndpRDAh9d4i0OF3dtWD9aPvOL
         J3BYXzMQ11K7eFWTAst4mj5vCvrxmjsSPe+ZDvlzP40vVyvD18/tdGGSziddZsQ6jFa3
         NWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071554; x=1795676354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EpkpAe8MEN5BuQD0iXz34+1elSDBS0pp25xEYHL3/ks=;
        b=sTZ9oba0vQpeEr113woBh/FKtuvOiTJbOjBaTvm0QMsi3HOocE0N+N4OPGWr37mu2C
         Q9FgdWgR6jhqwB4fg+8oAj0TqJuH7LOu7xN7iGAcon/E6lcbra2lOoMn2xdhYFxaacfH
         gjRjOxP1qSxQGaDVFgsDE7Z0VbPMmPA+RJwuk3yxWjZeWAtuI186w2u2L7gX96yCe2N7
         OX9M81UY0GkGAQbfCLmw9GAI9a+NGDyrOxTX8HqUWY18LSEHLe2etMxOkRS7UlbIOODk
         aaT+bcLw8bV+NFeDKdMn8+BERV4pqNcedS+aQ+90MQVCHRxzfFYDfCatNGUgcRbje1nM
         1/Tw==
X-Forwarded-Encrypted: i=1; AL+hErF7mxBTm4lYSIE2EJS28aNv13iGX2S6XsKqPz2lPtAngWSXyXlZGptI0R6elUSzqRwJrk8ZAX9uCSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aVw4yGdESq/U86IAXuTGvyIWGbO0G9lBYaB38GaeAjB5j0vDD
	4a5sy5bOiyWsYvZJmHoeS7NnJSeGhGkwvTc1H+GSeIRC4y+o6ex8Tuqv6oB6KeZ+B00=
X-Gm-Gg: AZFdTZf/8tRmpwrkWoSPDP7MBvUuiVqPFV5idh1TT3yKVqc/2S8sGRfVx0PXw4tqQIw
	4anuDQNxiCU/ITnmbDnukEff4nvjHVSqWye5M6WvyOc/b3sPIkDzHGTYTHCMSdZeljVBbsQyJ+o
	/7cEjTgv3wtBjmCFQXe3Dk3eu0RzXmqO7NOp5cJ2qnR75qbI/hG/7yimy3TN0iu5zLyUQupB6u/
	fdPa+bgQvYweimmxrzTLnAwFVm5O9dKwcGs/Vr+Fsk4PkOlILEhPevKLJesghGoAx+9TioBCPAq
	4VpfUNRCPVxYgVtC1EpkvXg2ShCedRWZCZYNyJFSPpBTde4mYTpORJ2dGfSdd4Gp3ldwy12oHfC
	AQWOO6I5DopYMOaziQ/25U5R1TDgD4Hqq2XoAYVWizlTmtrHAUHdp6IEBy53y2FDOvH6gEuwHT1
	0EnCSnedAPMzC8QLAugzfWKwv+GXIZV5+L1czXonV/6qritsul4Qjea4yWeUDHUc657Kx84B/rD
	MaqbVxLxBSqinUnXXd5sVioamK4fIEXcFCekutkUoOgX+9U9B1mp8CnNyq6nshMsOsjKHwws5/7
	wnK/mcc9Qh9Bg3NeNIcxb9RfTKm693ecJVMeMKNmXbpT0ZoPeLHWrAtyP1Q=
X-Received: by 2002:a17:90a:d60f:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b3d063e959mr4839420a91.1.1795071553983;
        Wed, 18 Nov 2026 22:59:13 -0800 (PST)
Received: from G6L4RL2QG9 ([2408:8440:c38:5ca5:3175:932a:757b:716a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b402e75223sm597488a91.4.2026.11.18.22.58.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 22:59:13 -0800 (PST)
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
Subject: [PATCH v3 0/7] KMSAN: Move per-page metadata out of struct page
Date: Thu, 19 Nov 2026 14:58:05 +0800
Message-ID: <20261119065812.89959-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
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

This series fixes a KMSAN metadata-loss bug triggered when boot-time
gigantic HugeTLB pages reinitialize their page descriptors after
kmsan_init_shadow(). KMSAN currently stores each page's shadow and
origin pointers in struct page, so the later initialization drops the
metadata mappings and leaves their backing pages unreachable.

Preserving the pointers around the HugeTLB initialization would add
KMSAN-specific state handling to the memmap path. Moving
kmsan_init_shadow() later is not viable either, because it allocates
metadata from memblock while gigantic page descriptors are initialized
after memblock teardown.

Move the metadata pointers to page_ext instead. page_ext storage is
independent of struct page contents and is made available before
kmsan_init_shadow(), so later page-descriptor initialization cannot
erase the mappings.

The series first decouples KMSAN metadata access from its storage, then
makes page_ext safe and available during early boot, and finally moves
the metadata pointers. The move also shrinks struct page from 80 to 64
bytes on x86-64 KMSAN builds, allowing HugeTLB Vmemmap Optimization to
be used with KMSAN.

v3:
- Fix page_ext client alignment on 32-bit architectures by using u64
  alignment as the cap (reported by Sashiko).
- Open-code the lowest power-of-two factor and use a local for the u64
  alignment (suggested by Andrew Morton and Mike Rapoport).
- Use DIV_ROUND_UP() for page_ext accounting instead of relying on the
  caller's size alignment (suggested by Mike Rapoport).
- Simplify the page_ext alignment commit message.
- Collect Reviewed-by and Tested-by tags from Chris Down for patches
  1-4, 6, and 7, and Reviewed-by for patch 5.
- Collect Reviewed-by tags from Mike Rapoport for patches 3-5.
- Rebase onto mm/mm-new.

v2: https://lore.kernel.org/20261117120627.50601-1-songmuchun@bytedance.com/
- Fetch shadow and origin through one masked metadata resolver
  (suggested by Chris Down).
- Add a fix for pre-existing page_ext client misalignment.
- Use vmalloc for runtime SPARSEMEM page_ext backing
  (suggested by Mike Rapoport).
- Unify page_ext allocation and initialization entry points and document
  the later FLATMEM callback timing (noted by Chris Down).
- Allocate all boot-time SPARSEMEM page_ext from memblock
  (suggested by Mike Rapoport).
- Keep memblock allocations above DMA and suppress per-section free
  messages (suggested by Chris Down).
- Inline the unchecked page_ext lookup while keeping page_ext.c
  instrumented (suggested by Chris Down).
- Update the KMSAN metadata documentation and describe HVO enablement
  (suggested by Chris Down).
- Expand the series from three to seven patches.
- Drop all v1 Reviewed-by tags because the affected patches were
  substantially reworked and split.

v1: https://lore.kernel.org/20261114104150.58424-1-songmuchun@bytedance.com/

Muchun Song (7):
  kmsan: encapsulate per-page metadata access
  mm/page_ext: fix client data alignment
  mm/page_ext: always use vmalloc for section page extensions
  mm/page_ext: use common allocation and initialization entry points
  mm/page_ext: allocate page extensions early for SPARSEMEM
  mm/page_ext: inline unchecked page extension lookup
  kmsan: fix metadata loss during HugeTLB struct page reinitialization

 Documentation/dev-tools/kmsan.rst |   8 +-
 include/linux/kmsan.h             |   2 +
 include/linux/mm.h                |  12 +-
 include/linux/mm_types.h          |  12 --
 include/linux/page_ext.h          |  61 +++++++--
 lib/Kconfig.kmsan                 |   1 +
 mm/kmsan/shadow.c                 | 199 +++++++++++++++++++--------
 mm/mm_init.c                      |  11 +-
 mm/page_ext.c                     | 221 ++++++++++++------------------
 9 files changed, 290 insertions(+), 237 deletions(-)


base-commit: 3dfc09a9493ddaa5e7722a29165d8450b55b4d3f
-- 
2.54.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B869733F8B2;
	Tue,  3 Mar 2026 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772539466; cv=none; b=Xae4SSGz3gb/o8FlBIrdnhPZeZAdPHXIMThDYuQLX1JTB5TsOd8nuDowDq2kJn+u5J0KInML6d0n7eVCTNn4/IeZda3JcXxhEXynxcNSUILaF9tAa0Xq3SimknPGiymrbQvDpxK6ssO2EZ5IhmgUITg4H5IkGDQIAnd+PVHLFOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772539466; c=relaxed/simple;
	bh=8+oA0kprgXg/xJDlFnPPKOQaZh0R6iuRuvzjjWjSrBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYDV3PYcN+UVNo/GrzsIgaygycbhbfIjG/d9khZnFQXmVQXhL2TA6MlnPUCnNDQxC1Ta/6x+COO6wTfsvAoxhuBt79FPuLipdRCEZWYSNE1N6xnOyLCaplcKeV+q9V2ITH3tkQn0rek/Syf1zxctK4MZQs7zbjgU4Bib7gpDyw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPyUuNMv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPyUuNMv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC09C19422;
	Tue,  3 Mar 2026 12:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772539464;
	bh=8+oA0kprgXg/xJDlFnPPKOQaZh0R6iuRuvzjjWjSrBU=;
	h=From:To:Cc:Subject:Date:From;
	b=VPyUuNMvg9FiDT//kyh4kp/Cg8PvmLGwP2YVxuGDtQlZOw+Yh9Z8OHYUxXaIs4YyH
	 evVXX9gF/TEETTPqhbL3I1QrY1khkGxe2hKt/EvALTrRlI0B/GnuxCf8Omwal5FE5b
	 wB6uNIYUm4cH+MrqLB5R64kM/K18Sb2DiETpQswEedBx8WgDZQQMgIId2FlDqQdFb+
	 wCvniDD0iYzXdSMF4eo1e0XXrYppWQtZTuRzdkInr1RPG6ykgkK4X5yArM0l5LRyuf
	 37UQbLtzb3IGR1gJitNZz+z52B+ykFELaq/qSpEZ24gCJHKI6ttzEySgX88dxY0M7L
	 0B723TPauqQJw==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kasan-dev@googlegroups.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [PATCH v1] kasan: docs: SLUB is the only remaining slab implementation
Date: Tue,  3 Mar 2026 13:04:16 +0100
Message-ID: <20260303120416.62580-1-david@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have only the SLUB implementation left in the kernel (referred to
as "slab"). Therefore, there is nothing special regarding KASAN modes
when it comes to the slab allocator anymore.

Drop the stale comment regarding differing SLUB vs. SLAB support.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 Documentation/dev-tools/kasan.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index a034700da7c4..4968b2aa60c8 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -75,9 +75,6 @@ Software Tag-Based KASAN supports slab, page_alloc, vmalloc, and stack memory.
 Hardware Tag-Based KASAN supports slab, page_alloc, and non-executable vmalloc
 memory.
 
-For slab, both software KASAN modes support SLUB and SLAB allocators, while
-Hardware Tag-Based KASAN only supports SLUB.
-
 Usage
 -----
 
-- 
2.43.0


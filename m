Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824A12E8B67
	for <workflows@vger.kernel.org>; Thu,  9 Oct 2025 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007473; cv=none; b=AKJ0Y/hZ6zqJY1mvIPbBtgm1/AfHHrbFWQvVALWvOufQygaqKRKr59BFvWI/43JrsZXsESxor4lXtV+R4tGZIrUxt96nKWU7lm7hPwmi1UQ3MRgUalFsfAIbydCB4ijTPBrvdm98T4Jv7nisF3bOJ/ALO5Gmf2Ocxdju6wb+WvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007473; c=relaxed/simple;
	bh=zK4RWkz30MU/OH8jEOTvGZJj2/7wnecqVuCjoc5/aOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSSoz9Y7widBnpuvxGA0kqTFvXnaiue4794peSLPkiKDhPjnrL0Z0Vorgy6FbZy4AKSdxlrjC+pm1fHL+aKOwmE7Hbs8zuJRg8NAB0DEILMPrGZzFii89dzNOULj4ATSf5jIzqD+kprEn/apdRXm88XUO967jI5aCWbUXTNYRCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUQKyRWS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUQKyRWS"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3322e6360bbso802990a91.0
        for <workflows@vger.kernel.org>; Thu, 09 Oct 2025 03:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007471; x=1760612271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPor1AiTaHON3BhVq+NCy46wTls72eqNmMOTROEZDIU=;
        b=OUQKyRWS4NogfY8BKn70Mh5zqkNfWaMf1ej46t3EeqmhIzH77wL3IrQoFcmsSnNt8T
         oiJf7v6AZzNxPpoZ9mOwkWbowmLLclVGMWt+yqVfDwiTTeJ5M4GlRqfXof8NWTVMwoDm
         1s3uXUTMLqyoKoCtjiocVkkszgMND+F9C38eoorWaZZuRGfJ9gR1a9B3dth8Fsx+RFo3
         XOxOaROnb5dDAQZBhJzWSXPAyV9j5gThTCUjg8ajdpyL3bMf4a8daEOamlzNMBGBN7Ca
         HIT4pHppqIROfYf2ua2k+b6fhhBg1OwSrYmJTaP6rkgM/8Ivw1onylWTQnfrmRRNwbHe
         /ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007471; x=1760612271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dPor1AiTaHON3BhVq+NCy46wTls72eqNmMOTROEZDIU=;
        b=TNRi3TisuMA8OVDuIpEZu0F+ewuT5WO80nv0IwmVd3shg3fpQj7Nka6ZsqaSJcTMve
         /FqdQZm1Ps8xiGCcayRADYJ7hdzjnCI6qZyn2SB1K/qo7TUawrIAZD+PWIvhgb5j/VWv
         X9110c3swQIaZSXjqwOFHvk944yitflzg+JXBkINyxjp6JfRezHJTLuMr+Kinq4HUmlI
         A76BBvZRO0P5wZVcFSGWRWZ4lC3oehThRe2Jts70vI/Yo0DEdSoDpQbW8mBAZBuKHgd2
         A8sWtbbKLHTUWLOPaN0kZYW0Yn1SmMpnL6z3CDpK5jW1R/gY5lZvQ2ntKZwsY+205xTP
         ptbg==
X-Forwarded-Encrypted: i=1; AJvYcCVPjF5gdkLObxaGOoCHX0iZb5LGtzlH+YmZ87cpkeN8QXx07gDf5fMzUEncNqtjTGwwL3Mg7JbW3Cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxA24BbGO3WOnwQVzKOjN26MxCguA927VDpIuwk2k6RenEobM8
	OGUI9C3jquPjTQQagN7M38xKIS0wh3Zck8ILfTMpLu1/QO4mPfbEHTv8
X-Gm-Gg: ASbGncsplibrpIqcLmDxA80DnbYaU3lE8WX1zZEbmZjn5LK9/ANLcOEgmvjpwJGQtZR
	aZIigeiWcgp6cKeZBzgb+VsSaDMYOcIo3SX7otU4eZwEnrkS67cD+qC5asIp8TD/XwQaY0RlnQG
	pK/tRk24JHScBjw4ld6sdVB1tRJbOVcKaYiYGjvPsJKYzcG0dzXmjIH6kzqVCdCVuooKzLj7P8F
	vzZFQdwR+NKXw/+gWnc4IKgVA//D5lb7jqMi0LZPVpWJkjhAQKWeq7EvA1DKOKGPX1RYf3N5u2X
	6kgZuJX4HFJWxM6XdL5XspTrgNWFXaQatd7vv/5xEuZ6Kh3wRPvlj8Vr9c4+Qbjx9IlDg4jc3H5
	tXKphVo+S2w1lwTXSmm/GTajcxnucdG51C8OW3zvxGMIcR4zJaRwdtU5jd/xE
X-Google-Smtp-Source: AGHT+IGfoiP7FyJn6BgVbF1cW+pirt064OXDV5hiE6L+A4G5ft0+AYVVqaDAH6C+gBiZsXo7qM0L8w==
X-Received: by 2002:a17:90b:3ec1:b0:335:2823:3683 with SMTP id 98e67ed59e1d1-33b5111491amr9148774a91.9.1760007470702;
        Thu, 09 Oct 2025 03:57:50 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b513926fesm6702757a91.21.2025.10.09.03.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:57:50 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Rong Xu <xur@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Nam Cao <namcao@linutronix.de>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	"David S. Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: Jinchao Wang <wangjinchao600@gmail.com>
Subject: [PATCH v7 11/23] sched: add per-task context
Date: Thu,  9 Oct 2025 18:55:47 +0800
Message-ID: <20251009105650.168917-12-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009105650.168917-1-wangjinchao600@gmail.com>
References: <20251009105650.168917-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce struct ksw_ctx to enable lockless per-task state
tracking. This is required because KStackWatch operates in NMI context
(via kprobe handler) where traditional locking is unsafe.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 include/linux/kstackwatch_types.h | 14 ++++++++++++++
 include/linux/sched.h             |  5 +++++
 2 files changed, 19 insertions(+)
 create mode 100644 include/linux/kstackwatch_types.h

diff --git a/include/linux/kstackwatch_types.h b/include/linux/kstackwatch_types.h
new file mode 100644
index 000000000000..2b515c06a918
--- /dev/null
+++ b/include/linux/kstackwatch_types.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_KSTACK_WATCH_TYPES_H
+#define _LINUX_KSTACK_WATCH_TYPES_H
+#include <linux/types.h>
+
+struct ksw_watchpoint;
+struct ksw_ctx {
+	struct ksw_watchpoint *wp;
+	ulong sp;
+	u16 depth;
+	u16 generation;
+};
+
+#endif /* _LINUX_KSTACK_WATCH_TYPES_H */
diff --git a/include/linux/sched.h b/include/linux/sched.h
index cbb7340c5866..707b34f26264 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -22,6 +22,7 @@
 #include <linux/sem_types.h>
 #include <linux/shm.h>
 #include <linux/kmsan_types.h>
+#include <linux/kstackwatch_types.h>
 #include <linux/mutex_types.h>
 #include <linux/plist_types.h>
 #include <linux/hrtimer_types.h>
@@ -1487,6 +1488,10 @@ struct task_struct {
 	struct kmsan_ctx		kmsan_ctx;
 #endif
 
+#if IS_ENABLED(CONFIG_KSTACK_WATCH)
+	struct ksw_ctx		ksw_ctx;
+#endif
+
 #if IS_ENABLED(CONFIG_KUNIT)
 	struct kunit			*kunit_test;
 #endif
-- 
2.43.0


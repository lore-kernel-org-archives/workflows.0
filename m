Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9FA2E9EBB
	for <workflows@vger.kernel.org>; Thu,  9 Oct 2025 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007485; cv=none; b=YPCgvuNZ9dX5M+/kRSkyEYwU7eoTN21dwavQWv9aCT9901r2kILOAK6QU+Ff7UAXCbDHQkXeE1NZWNqDjh5FJfhZkj0GhOFLPF+IIDzVY00oNY7UqZORUHCrOzXZFFDqIoaQBu5OwQ0WFL/YfgM6mPPU2VFrrZHrAhtrx2CwjPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007485; c=relaxed/simple;
	bh=ye1IFedT6QyfAsl7NnFp/ScKqi80nwnk9udpC+1GQaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISnSWqdS0OpPUC9YjN6wAbhV7QLC5g4bwET4bmzS/ybfwFbhEAz+3s2XFmrckAauzI+fKNEmOxEJRR4tbI3WuPDihGJbW20M1OoqOtCZotyMO01CVPyJ1Z7NSP4HGUsx4MUCpwcDjshKZxfKEqGEMmgdu1wkF70a2wDLeaVTUic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdKRLbWe; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdKRLbWe"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-781251eec51so672208b3a.3
        for <workflows@vger.kernel.org>; Thu, 09 Oct 2025 03:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007483; x=1760612283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RtyZdLa/V9peD4vyIt7vF3g+yVd+tHG9wNYuCcZNH8=;
        b=LdKRLbWeg/b5DVlAqapHePmhvK9AG0yeiBom5D9bMCoIXu8P8c+Umy4sT7Kah1pDbI
         e1Rcp9JcDySTjznRdaxIei5/6B5nvO6zCKs+nDWrNiSPrNGqrdeTWCZv7Cu19ecN0mhe
         hZH3WFQTCOJJD1nTm7vvBdsNvVjxR2ln2aeSjGkELI7oeB379UefLEDPhsuQc0Hzx3Ta
         26DCv+2k5pRPudddjUObqT4W6QcbK+ux/K3Z6CBv3WK9eyIOKaqTTkLC8xmMkbWLQeNN
         kcIxQfdmxd3mDrgLy84H4OnGKkhX6Ct46oqGyW3u5jrdmjedHtSOaMjBjM9dmINe8BSe
         jNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007483; x=1760612283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RtyZdLa/V9peD4vyIt7vF3g+yVd+tHG9wNYuCcZNH8=;
        b=m93xEqZwKztal1koxyJgB60eHrZ2zsJLrL/2KAFl8SfclGcxXv20qStr5Y4KABTe+k
         R9L3505NA5huYsQoHcikC2UtggXiWlr2e54DPSytmzuroerliNStmiAiWpJfxU7FltQc
         AqR2H6fsbfBl+4ShFXd7AtK0CWHBecYvze84tTg3l6kg/i7u6+8oP3aTa/PYsdUuoVQ3
         bT8nmwdLQW65LpQ2Z8iAuMH+2c1oMfECU+YvbyrQPmA71LwePmiwLh0Vw7sNWJyvU6Vz
         rurdoeNOiwVODWjVuiBk1NlN5xgIrNKxhoYEgAOdMSrVEk9Gz+D47pHP5mcL8aGsb6Ze
         VjfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBfj+v6RSQNZGxzRs/hyGbyM3u8UTxCnPYPyt1x62fPZ0wFnQ1fs+V1tkLtdh15tek0DNNmScuZ/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw598J37Zjb/kWWvgNdiTvj5CgA3mcA+sowBEGY5Jbwf3iJu74S
	TCYNfe+DVgnqGsJ4Wfy8aw69nVR1PfO+lwl6vvOfDf9+psC63njVa+6Y
X-Gm-Gg: ASbGncsvMbjqbUxYF5yz5BQ6I90ejo27BjHGsOuCh1WsiwTtCe1bHC+ToqaO+Dq6afY
	g796RBIjLGzcFyCi2/Nzsgc7SUkamqAOpLZQzaxoMzWpSAsT3+fTmnC8NLZ30NFtshVB6KCJQaQ
	Bl7ZWtp1XddWRTSj8yuhdwi/Jk3luggw+78VnwSaCku0l6u5n0luDnrtSMDgr/gX7PQE/kZalAB
	B/DnwSOBq73hEsXDPRomToJAgoLSfyfrl8IdiGARcBn8CasID0XeGyilmZzdnXrdRAmLJSbDL6O
	iw5sh31guDk2hgepGsFT7vSXvA3maoYoafd0T5P+lgd//Rpae1Y6gqihvvdYRqj2uIMUi7hVUCS
	QYBuUXZkTHuQHudnKNKLPhFuZdhAJ0PPGZ471R8Tc4pPFlZQf/GqdSg9Xnia4Kgs4UARQMO0=
X-Google-Smtp-Source: AGHT+IGV1mxHWu3pQaxCo2GAVbKHGeNdLDqI1po/b05L3G5Ejn51+25jeUHtC8qpbOYN5GwS7DtIXA==
X-Received: by 2002:a05:6a20:12cd:b0:2f8:4558:ad9e with SMTP id adf61e73a8af0-32da839ee26mr9375118637.33.1760007482826;
        Thu, 09 Oct 2025 03:58:02 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f3b041sm20711876a12.24.2025.10.09.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:58:02 -0700 (PDT)
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
Subject: [PATCH v7 14/23] mm/ksw: resolve stack watch addr and len
Date: Thu,  9 Oct 2025 18:55:50 +0800
Message-ID: <20251009105650.168917-15-wangjinchao600@gmail.com>
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

Add helpers to find the stack canary or a local variable addr and len
for the probed function based on ksw_get_config(). For canary search,
limits search to a fixed number of steps to avoid scanning the entire
stack. Validates that the computed address and length are within the
kernel stack.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/stack.c | 77 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 3 deletions(-)

diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
index e596ef97222d..3c4cb6d5b58a 100644
--- a/mm/kstackwatch/stack.c
+++ b/mm/kstackwatch/stack.c
@@ -9,6 +9,7 @@
 
 #include "kstackwatch.h"
 
+#define MAX_CANARY_SEARCH_STEPS 128
 static struct kprobe entry_probe;
 static struct fprobe exit_probe;
 
@@ -59,13 +60,83 @@ static bool ksw_stack_check_ctx(bool entry)
 		return false;
 }
 
+static unsigned long ksw_find_stack_canary_addr(struct pt_regs *regs)
+{
+	unsigned long *stack_ptr, *stack_end, *stack_base;
+	unsigned long expected_canary;
+	unsigned int i;
+
+	stack_ptr = (unsigned long *)kernel_stack_pointer(regs);
+
+	stack_base = (unsigned long *)(current->stack);
+
+	// TODO: limit it to the current frame
+	stack_end = (unsigned long *)((char *)current->stack + THREAD_SIZE);
+
+	expected_canary = current->stack_canary;
+
+	if (stack_ptr < stack_base || stack_ptr >= stack_end) {
+		pr_err("Stack pointer 0x%lx out of bounds [0x%lx, 0x%lx)\n",
+		       (unsigned long)stack_ptr, (unsigned long)stack_base,
+		       (unsigned long)stack_end);
+		return 0;
+	}
+
+	for (i = 0; i < MAX_CANARY_SEARCH_STEPS; i++) {
+		if (&stack_ptr[i] >= stack_end)
+			break;
+
+		if (stack_ptr[i] == expected_canary) {
+			pr_debug("canary found i:%d 0x%lx\n", i,
+				 (unsigned long)&stack_ptr[i]);
+			return (unsigned long)&stack_ptr[i];
+		}
+	}
+
+	pr_debug("canary not found in first %d steps\n",
+		 MAX_CANARY_SEARCH_STEPS);
+	return 0;
+}
+
+static int ksw_stack_validate_addr(unsigned long addr, size_t size)
+{
+	unsigned long stack_start, stack_end;
+
+	if (!addr || !size)
+		return -EINVAL;
+
+	stack_start = (unsigned long)current->stack;
+	stack_end = stack_start + THREAD_SIZE;
+
+	if (addr < stack_start || (addr + size) > stack_end)
+		return -ERANGE;
+
+	return 0;
+}
+
 static int ksw_stack_prepare_watch(struct pt_regs *regs,
 				   const struct ksw_config *config,
 				   ulong *watch_addr, u16 *watch_len)
 {
-	/* implement logic will be added in following patches */
-	*watch_addr = 0;
-	*watch_len = 0;
+	ulong addr;
+	u16 len;
+
+	// default is to watch the canary
+	if (!ksw_get_config()->watch_len) {
+		addr = ksw_find_stack_canary_addr(regs);
+		len = sizeof(ulong);
+	} else {
+		addr = kernel_stack_pointer(regs) + ksw_get_config()->sp_offset;
+		len = ksw_get_config()->watch_len;
+	}
+
+	if (ksw_stack_validate_addr(addr, len)) {
+		pr_err("invalid stack addr:0x%lx len :%u\n", addr, len);
+		return -EINVAL;
+	}
+
+	*watch_addr = addr;
+	*watch_len = len;
 	return 0;
 }
 
-- 
2.43.0


Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B98285CB9
	for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 16:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792666; cv=none; b=FoFthh+99gezgWJH0ECzHGNW/0jqYiJ1ilXD5RMfRYyrWWDRItQyHi5kfal/Ef7NeEv1NajwWJP+GgNrfGouMW+g9k6soD6PZWgK+yyt+VwteG/OpxAHLIMn6jnKUGpNFRExN9f8xD2EkbAoQhXcIxRFjvYBgUi1Xh5yWZSNTaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792666; c=relaxed/simple;
	bh=ugzTOOBc4YO6IdubWCkDyybIdRjQGKqV6BTx+jx7Hdw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZtXQVICRkykSMAeqRvrsmAK0rIKWr+TTwtJQ9dwUBs07/zLI8R+fKynxXtUbYc59Zz+OvQ84ge5yAgpL9ruaqQLEi/qE93qYVg9iRXH76wJ8YVud/zZfz2QoXaCyF6xSs1aRLM/ymSwp5V9RGi957vGyTzUTUSxq65Wk82MA5pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJ82IX1t; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJ82IX1t"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so2489620b3a.2
        for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 08:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792664; x=1763397464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUIy2ZawuG8l7hvlTJp6NnNoOG+7tynb2rchqUDRw1k=;
        b=gJ82IX1tjcB06wfqQsfkyNftKgQlSgYhYuSO08Ub+ZaJ8BYx6k0vxZ1XYkn/OWSuKE
         QAvA2HFaPCC6T6DzdlndgKs5GmjfJ3f958JFg1Ak2v7ATYfBjFDj1N0ocBv2qTAxz23w
         uX+Rwc8icuVN6BFkgDgX2XWDEncAVX1FSYZka86B8YrxPdrFYHiZ80T5mJwU/uHkzHDK
         EuVszyNk/Us3LaJUNIze/NLneLhwmjmVVONjKoAWxmPq23LUIJ1k4LL/DW+s7P007U0s
         jjpydf8NXCVQR2ZlVphNlhCbcMctGtpVzQ0XlL+Lk8uz6++XZM5LVbOQfD7tJpNsORZn
         aXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792664; x=1763397464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUIy2ZawuG8l7hvlTJp6NnNoOG+7tynb2rchqUDRw1k=;
        b=skMH1dRby1uhows/2qZhg4VF0NwpH5kD+l3XHEHWL0jE+ofI+dHUCvJrt9rmHs9SOZ
         fajsCy/d4//iaMIkN+CWxmMyDtsuzACKFqDafa0j5rJH4FcAyk6ldLcPo9Axj+46utAh
         Xp+HjUMiHiNNU1kpWqkIW4TONx90UH/luSPVOr0lLgFatu+LYXeBu2p4LlkAXlqDb77n
         uOzbRnTkm+MSK4YL7GJiQKO6Ykun9jB2MIueyilEBIpIzw9jkXaXvkSJq6FAWU7/rYxJ
         o8DQU8RzoXv7Nl9x/d4AAz6UeLSfbi+5fHXDcHKSkEjsp/PE/SLE4MyUtEeP8Rz8sgAX
         jSIg==
X-Forwarded-Encrypted: i=1; AJvYcCUbuaBFPdAfZPy1P44QVdvgbvMTxV1yLfSWyRCoMfjMykL33rQ+XZBptDzt/z9mwBBEyJK/CluEaNM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznz7i3wSN9FXyKwoBxOTEG5CgfSiws5ftOOqtR6uMeygNpeuwe
	ZBbCrQQmQB8hgWzSrZkBHTc32K/IIqJdFF/nf0G+8bgSNy7pj5UO45aa
X-Gm-Gg: ASbGncv+lnfdGpCn9A+IN6glY8MKhcMBfbNsKNAjGMzw6fgx1R+BNFSiCmsCyo+KmMF
	dMecDcp2x1kC8/pRUuUw8eXj3V+NVNrvTtJ9hIWVcwbaLb504toZ/QJewcf7P4Dx8K2ew0KW4CT
	0s9olm0XmA18MDr73MDUjpRbsnfHo71VhE8TgICqgUqitYbRGDdl0c68cLUITfcaC+ftoLkhtML
	jgfV+Nal6+NwL9o/SW+Z8E1nXxwBoBntCT4a8RLUKiPcfmZ5DswJJRXF7zIt6AMJz3u+jqjZifs
	yBOZ02Zg3+ZwHthjHrtqlDh9nTq6xLiLbC2BAPX2FyTncX4HFcLkJXComB37sVj7EyZIqpx/f/g
	yzgofim98tkl5JLbNCDsgYieVHFT5iGXhXaqYWXYYKjIjTGKGHz563PWx6jhbSBccWCTSaO4nAD
	tc8Gi3PUOPsZo=
X-Google-Smtp-Source: AGHT+IHmtKjxaoNsV7D/kMioLqLEx1DalHNLT8KZpVzjD66EjiPrOQ3mNXTEP3A6f7b/Rdv9Vcu6sQ==
X-Received: by 2002:a05:6a00:b81:b0:7a9:e786:bdaf with SMTP id d2e1a72fcca58-7b225c9b43amr11411331b3a.14.1762792663661;
        Mon, 10 Nov 2025 08:37:43 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9635007sm12550190b3a.2.2025.11.10.08.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:37:43 -0800 (PST)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ben Segall <bsegall@google.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	David Kaplan <david.kaplan@amd.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	Justin Stitt <justinstitt@google.com>,
	kasan-dev@googlegroups.com,
	Kees Cook <kees@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	"Liang Kan" <kan.liang@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Rong Xu <xur@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	workflows@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v8 14/27] mm/ksw: resolve stack watch addr and len
Date: Tue, 11 Nov 2025 00:36:09 +0800
Message-ID: <20251110163634.3686676-15-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110163634.3686676-1-wangjinchao600@gmail.com>
References: <20251110163634.3686676-1-wangjinchao600@gmail.com>
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
 mm/kstackwatch/stack.c | 80 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 3 deletions(-)

diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
index 96014eb4cb12..60371b292915 100644
--- a/mm/kstackwatch/stack.c
+++ b/mm/kstackwatch/stack.c
@@ -8,6 +8,7 @@
 #include <linux/kstackwatch_types.h>
 #include <linux/printk.h>
 
+#define MAX_CANARY_SEARCH_STEPS 128
 static struct kprobe entry_probe;
 static struct fprobe exit_probe;
 
@@ -58,13 +59,86 @@ static bool ksw_stack_check_ctx(bool entry)
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
+	if (ksw_get_config()->auto_canary) {
+		addr = ksw_find_stack_canary_addr(regs);
+		if (!addr)
+			return -EINVAL;
+		len = sizeof(ulong);
+	} else {
+		addr = kernel_stack_pointer(regs) + ksw_get_config()->sp_offset;
+		len = ksw_get_config()->watch_len;
+		if (!len)
+			len = sizeof(ulong);
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


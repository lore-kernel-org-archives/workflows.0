Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEC624C068
	for <workflows@vger.kernel.org>; Tue, 30 Sep 2025 02:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200308; cv=none; b=XJmwOnQkWXl6E79/ZCe7PE4lHyjby0LtYxHRXnG3eZVNeAF8CGp84FLQwatsDhjn/RWnJPqnBatl/z3tyOofU7+S6+0TCQoCAkszhmDQ69GVQEt9vbtaoS2p8GiFz6TeJnysMUOq9o1ElUcAzgDlySJLLW2Zm31xPckS3rsDHng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200308; c=relaxed/simple;
	bh=0RaB9b3mDxARpzNAU+b9+OM/53UguV9OX02ut00avNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LokIvYuZaeyCGlBSzK97pTts2Ovy/7g1lIVleiSwMyi/QIbIRkLaWaw1NhljerXStRQ40Xu5VzuOfK+9mfS8hzHjW++BW4RSa/tg5grlNGVjXz35WlSkcO7XU2tKrTOTVQfRFCUaeGLEHD6S+gboZtaLQmsVlxfkFFdm0XRpR5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmTgSTCi; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmTgSTCi"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-78100be28easo3958581b3a.1
        for <workflows@vger.kernel.org>; Mon, 29 Sep 2025 19:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200305; x=1759805105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8p2Xfne7CGpLjN/MkaU3Ee28S3aCNgQ2oxnJpFebIbs=;
        b=MmTgSTCivQdUN6WGxhnHkpN5oRIKQd+LSfqs/sOS1wy2A8Aebb4kOPRHOFYP3Pye7z
         okcZ63/Z8oiXVqnARwwKT96xgQmpBZbY+wkkiB4SSSIYm1ClzYVE+/8XgMwVfFzunb+o
         XvcryWYV3OnknQgXuLeGqq/shiIkNcaQ0pXvEwa6uHBUtTc6CO7nO5P9ET3F1STh5Kjc
         Wv0H71Sbx8+0eaXFVfwdROUoeWJOWYekKay/Rifb38+oU2cqbXnZQc33Yqnqs21fy6rv
         6JMUsBzxNF1hZRisA1VjjCVCTayeXC8zgP0SvJCR7PSv0VSdcEkaQkq7wsxKea2CKhui
         HyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200305; x=1759805105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8p2Xfne7CGpLjN/MkaU3Ee28S3aCNgQ2oxnJpFebIbs=;
        b=lYEH8I/JHOoZIc2FLfAdcweZqalp87x5trJycwHdBlxcC3jmoP+GOHocF3NX+so+O/
         +diBCHEgLWubTzsq0JnYPzx5Y98DOf/NfI9bQksOeZXQuh/ynIivInDp9DINv+1Pfleb
         XOKZTC6omohMMWe/D+bZ8lCP8NzvBsuz4XTR36nyOC4McUX3copV1CtgWstavIeCOtO3
         PmGD4p4R8i7SWlY1K8KHEGArZzuPz37Tj+sN/Djf+jkssqIrin3bnlG18M3IB0jHaMf7
         gdGja9sMrc1eeKl4nJ/2U4kSfjWuMR5kj2tkdj7y6lLueLerzng5eVqctv482UNXxGxL
         aLxA==
X-Forwarded-Encrypted: i=1; AJvYcCVS1djgDyGCp5G0pm9/rlKHoyXrZySYlXvlbN7D5r0ue4X4izu2m5fzPHqHFlL5jD5i5nFvi5Oa0UQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1E0rmOaiXBF04geFXrABh2sa+MA6BwEgDd15sT1idarYGhuWW
	MY/Z0wzI4aZCYxlxBvJ6rBFPoePsVWImTiwQM1NjQTLy5T7mt1x3Tx87
X-Gm-Gg: ASbGncsCmVnRPT8Tc0MQBWmKgC8Q0l+Dx/JNUChH+Tfa0d4m6JPTcAkCnpAt1I7q6OY
	22hzRcfz42CQj/rhTcUOoT4ko7QPBAjHZtUougi/sFiF0eCJiN8IceHF6YYtGpDroboXPee3GYX
	c2iLTtUxp0eDukRrEDPOekd0tpIidQxgivoSHFN2YuEqoxM5iRipoduTpg0+3Y//4unPE+GFlmq
	L3QsFedfUXK79jAfmc64Ba/pmUOCghnhs4z/6cq3ryW+X3YbSCEokkhnFC9CV62RzCyMuTdl0Yz
	NJbpndo4lU+wtJbo5e7SroOk4rB54JEf3R6fzjqeOESWb06j9ZFSy6yT86MsakOJYYcYy1NMZL+
	giiERmW+Fxo8ZOpDIA3mIych9BCK8bBJBMZdTaATQOzxKgR7JDOb9Wv5tnZ3TT/UaSA==
X-Google-Smtp-Source: AGHT+IGPdLJDAcFgGXBMapnRTLkbwOuAH98GZaW3SdGH9OxArUIFVK7BxMIb+p319lKI1/5kl2O6lQ==
X-Received: by 2002:a05:6a00:1404:b0:782:d4b6:f5e5 with SMTP id d2e1a72fcca58-782d4b6f88amr8934209b3a.13.1759200305238;
        Mon, 29 Sep 2025 19:45:05 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7822f628080sm6431314b3a.89.2025.09.29.19.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:45:04 -0700 (PDT)
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
Subject: [PATCH v6 09/23] mm/ksw: ignore false positives from exit trampolines
Date: Tue, 30 Sep 2025 10:43:30 +0800
Message-ID: <20250930024402.1043776-10-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930024402.1043776-1-wangjinchao600@gmail.com>
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because trampolines run after the watched function returns but before the
exit_handler is called, and in the original stack frame, so the trampoline
code may overwrite the watched stack address.

These false positives should be ignored. is_ftrace_trampoline() does
not cover all trampolines, so add a local check to handle the remaining
cases.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/watch.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index 887cc13292dc..722ffd9fda7c 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -2,6 +2,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/cpuhotplug.h>
+#include <linux/ftrace.h>
 #include <linux/hw_breakpoint.h>
 #include <linux/irqflags.h>
 #include <linux/mutex.h>
@@ -18,10 +19,46 @@ bool panic_on_catch;
 module_param(panic_on_catch, bool, 0644);
 MODULE_PARM_DESC(panic_on_catch, "panic immediately on corruption catch");
 
+#define TRAMPOLINE_NAME "return_to_handler"
+#define TRAMPOLINE_DEPTH 16
+
+/* Resolved once, then reused */
+static unsigned long tramp_start, tramp_end;
+
+static void ksw_watch_resolve_trampoline(void)
+{
+	unsigned long sz, off;
+
+	if (likely(tramp_start && tramp_end))
+		return;
+
+	tramp_start = kallsyms_lookup_name(TRAMPOLINE_NAME);
+	if (tramp_start && kallsyms_lookup_size_offset(tramp_start, &sz, &off))
+		tramp_end = tramp_start + sz;
+}
+
+static bool ksw_watch_in_trampoline(unsigned long ip)
+{
+	if (tramp_start && tramp_end && ip >= tramp_start && ip < tramp_end)
+		return true;
+	return false;
+}
 static void ksw_watch_handler(struct perf_event *bp,
 			      struct perf_sample_data *data,
 			      struct pt_regs *regs)
 {
+	unsigned long entries[TRAMPOLINE_DEPTH];
+	int i, nr = 0;
+
+	nr = stack_trace_save_regs(regs, entries, TRAMPOLINE_DEPTH, 0);
+	for (i = 0; i < nr; i++) {
+		//ignore trampoline
+		if (is_ftrace_trampoline(entries[i]))
+			return;
+		if (ksw_watch_in_trampoline(entries[i]))
+			return;
+	}
+
 	pr_err("========== KStackWatch: Caught stack corruption =======\n");
 	pr_err("config %s\n", ksw_get_config()->user_input);
 	dump_stack();
@@ -168,6 +205,7 @@ int ksw_watch_init(void)
 {
 	int ret;
 
+	ksw_watch_resolve_trampoline();
 	ret = ksw_watch_alloc();
 	if (ret <= 0)
 		return -EBUSY;
-- 
2.43.0


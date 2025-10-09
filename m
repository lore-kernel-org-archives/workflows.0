Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1360A2E8B86
	for <workflows@vger.kernel.org>; Thu,  9 Oct 2025 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007481; cv=none; b=ur+20j+zRE3N4rRDRIGQnqXnOPi186Hhs2/IOHJOP6KvyJCBKx3dypeg+D6g5JGJ+0H0iQsY0UQhsepkIjH5FxviE1ZrxuxfMHFKcFsTPS+fdsW1ofPzl76mS2NsF9qgdKx7uMhQ+ss3U6OWh0EvdOxdfVyjQ+E+F4l5kVewggo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007481; c=relaxed/simple;
	bh=Sl2YI7Td/C9YkkJpnWkOlkyn4hvpDBvdNr6f7stAoSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GNxnJ8ilPAY+I/UCXyAD4CXVU4gqf7138QHZGhs3OEHnNzwXXUL/Vr8Wrr9QxNXaoo27aaSmcZaIR1Z5WKfOi9Pje2sR2yUHnT8svda0U02HuwccoGU38wMNoNZgDQmC98D96VDtCGMLjqKTNcWMHkXfVxNXPjdlM5QytAvXxnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juDZE3fu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juDZE3fu"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2897522a1dfso8060605ad.1
        for <workflows@vger.kernel.org>; Thu, 09 Oct 2025 03:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007479; x=1760612279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sX4DcHmKN6k6jLli4BcDyPNAsEAGb3ORwL+dRbW7euA=;
        b=juDZE3fuAX+I71mGgblMjrlNwLFHW0pPbgZVNZ+JFhzjUZ9tgoqJV5JkZm5siA/pna
         6r2utRoYV47eo/pRwxjWfcdI5fsB4PnUlckv4VAmbgJYgkT02zT3DjrIr573TZlXmuW1
         r1KaVxjdzsEVQgz0XiQzCDBEkOSjwBCkVB6P+J1RDDIzW4tsg3nugCQi6f/BHuMmtj/Q
         l8g6uVKpZAye7HGXb0gAqUVAlQ6Uy7rVUAIWCDxuc7Ap0bBjLYLqBDKOk8Jk4qq4KceL
         9NsAmURK0+f/CkQIMJUuoPGZqR4MSpMNQ82eQpkgt/cJbLEUt69i45WGsoJX4QLcrG9s
         nlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007479; x=1760612279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sX4DcHmKN6k6jLli4BcDyPNAsEAGb3ORwL+dRbW7euA=;
        b=gLPzNaR6UNQrxNfylFix5t5EWAJsQw0hcD2BoEfmkZ0GV7WxlU69HHEnmpft9+H6UO
         r8m4MWzlp/YDbis0s2Uh+Q0x75VElJbpfOlhtLdW5Iym003Slfxcg5yupMJfpa4ieKIL
         pG0TH4xaBQA1/nIg/wpZzYOsDQWMxQK0uLAezNAoJU2K3mt+FH5oTGTm505Sp98VCbre
         3kzJNaliwiNT7kF/D0QpwVaUuBUlqbSsQ8wZrFytIZrdfw1fkiy3ZnrxvNZwGlGpd7ol
         LXl5I9KqLAGe8xrIbizZF+jp+3XaN9pHKJ3BA6KjLbRHtyfKqTuQy7KmYm95Fyf8jDnd
         GzKg==
X-Forwarded-Encrypted: i=1; AJvYcCX0to6ZTuu+ZTcCZlWTYSe71yoH/4Kn55UxD8nvbBcTN3MlN6dcanRuN2MyolAScdTwhpH3J09MAoA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+jndUj2rMSDk8/2AEmRVwW+8Pk9SqhE/4pbtW7DHSbDVbPaFT
	PbZGH/WyRn8M0FU56W5M5sj7Mfz35qmlAaq63BS+1Afzd5Mjx9bbh9wW
X-Gm-Gg: ASbGncv72HzNvnXDB5JTZXf/BgpHNyewC+V+R816+SVY0ppUtAAdya0dX+VHQre59E4
	iwqW0Bma/L9jGI3OV4MruBrrp8RDCCuxkKS2yPPSjzt5Z3a2PFyleZFTYZpHJB7p8z72wBj/TZ5
	jOXadGj5XagSqMhODoClKZjaZj3mKQDR6SnRBLs9Uds3Lqspf9QASqnyxPMchGnig7pM5vrbRgz
	qSkaeeQoSGT2lTDiSBx6WXzCvg0+hq1E2Y+259de/RSVqKpQWnCaxOuqj+k6xPW7X5NnlnXw8cP
	5+lTFFM4iENiONt2kYtuJoAIK5E68KmC6Vas5cro1oWCtrSZny5czSdJNDxoyIalBnLZjuJoRfQ
	Ybly2jDRtdIaxAeq0FeNRaRTQ4lwKPR+1OqwkwCgjIFEwhB1gNR17YaEdu7jH
X-Google-Smtp-Source: AGHT+IG5Zi/tUWgv5fo5AJbJybfMI2YP3J2uv0Uwa+Uo4jUypcFGg1/JcKwmQEdKeq8TaIbn+u9v/A==
X-Received: by 2002:a17:903:2a87:b0:24a:d213:9e74 with SMTP id d9443c01a7336-290272dfbb7mr102338975ad.49.1760007479177;
        Thu, 09 Oct 2025 03:57:59 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36408sm24973055ad.91.2025.10.09.03.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:57:58 -0700 (PDT)
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
Subject: [PATCH v7 13/23] mm/ksw: add per-task ctx tracking
Date: Thu,  9 Oct 2025 18:55:49 +0800
Message-ID: <20251009105650.168917-14-wangjinchao600@gmail.com>
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

Each task tracks its depth, stack pointer, and generation. A watchpoint is
enabled only when the configured depth is reached, and disabled on function
exit.

The context is reset when probes are disabled, generation changes, or exit
depth becomes inconsistent.

Duplicate arming on the same frame is skipped.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/stack.c | 67 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
index 9f59f41d954c..e596ef97222d 100644
--- a/mm/kstackwatch/stack.c
+++ b/mm/kstackwatch/stack.c
@@ -12,6 +12,53 @@
 static struct kprobe entry_probe;
 static struct fprobe exit_probe;
 
+static bool probe_enable;
+static u16 probe_generation;
+
+static void ksw_reset_ctx(void)
+{
+	struct ksw_ctx *ctx = &current->ksw_ctx;
+
+	if (ctx->wp)
+		ksw_watch_off(ctx->wp);
+
+	ctx->wp = NULL;
+	ctx->sp = 0;
+	ctx->depth = 0;
+	ctx->generation = READ_ONCE(probe_generation);
+}
+
+static bool ksw_stack_check_ctx(bool entry)
+{
+	struct ksw_ctx *ctx = &current->ksw_ctx;
+	u16 cur_enable = READ_ONCE(probe_enable);
+	u16 cur_generation = READ_ONCE(probe_generation);
+	u16 cur_depth, target_depth = ksw_get_config()->depth;
+
+	if (!cur_enable) {
+		ksw_reset_ctx();
+		return false;
+	}
+
+	if (ctx->generation != cur_generation)
+		ksw_reset_ctx();
+
+	if (!entry && !ctx->depth) {
+		ksw_reset_ctx();
+		return false;
+	}
+
+	if (entry)
+		cur_depth = ctx->depth++;
+	else
+		cur_depth = --ctx->depth;
+
+	if (cur_depth == target_depth)
+		return true;
+	else
+		return false;
+}
+
 static int ksw_stack_prepare_watch(struct pt_regs *regs,
 				   const struct ksw_config *config,
 				   ulong *watch_addr, u16 *watch_len)
@@ -26,10 +73,22 @@ static void ksw_stack_entry_handler(struct kprobe *p, struct pt_regs *regs,
 				    unsigned long flags)
 {
 	struct ksw_ctx *ctx = &current->ksw_ctx;
+	ulong stack_pointer;
 	ulong watch_addr;
 	u16 watch_len;
 	int ret;
 
+	stack_pointer = kernel_stack_pointer(regs);
+
+	/*
+	 * triggered more than once, may be in a loop
+	 */
+	if (ctx->wp && ctx->sp == stack_pointer)
+		return;
+
+	if (!ksw_stack_check_ctx(true))
+		return;
+
 	ret = ksw_watch_get(&ctx->wp);
 	if (ret)
 		return;
@@ -50,6 +109,7 @@ static void ksw_stack_entry_handler(struct kprobe *p, struct pt_regs *regs,
 		return;
 	}
 
+	ctx->sp = stack_pointer;
 }
 
 static void ksw_stack_exit_handler(struct fprobe *fp, unsigned long ip,
@@ -58,6 +118,8 @@ static void ksw_stack_exit_handler(struct fprobe *fp, unsigned long ip,
 {
 	struct ksw_ctx *ctx = &current->ksw_ctx;
 
+	if (!ksw_stack_check_ctx(false))
+		return;
 
 	if (ctx->wp) {
 		ksw_watch_off(ctx->wp);
@@ -92,11 +154,16 @@ int ksw_stack_init(void)
 		return ret;
 	}
 
+	WRITE_ONCE(probe_generation, READ_ONCE(probe_generation) + 1);
+	WRITE_ONCE(probe_enable, true);
+
 	return 0;
 }
 
 void ksw_stack_exit(void)
 {
+	WRITE_ONCE(probe_enable, false);
+	WRITE_ONCE(probe_generation, READ_ONCE(probe_generation) + 1);
 	unregister_fprobe(&exit_probe);
 	unregister_kprobe(&entry_probe);
 }
-- 
2.43.0


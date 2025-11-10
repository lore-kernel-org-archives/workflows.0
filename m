Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AE831D382
	for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 16:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792684; cv=none; b=oyTverXUQ6tDrLcpEgzjWNG8POxN4CRo7VqHZsazQCrosIGuX/K0WBvO7OIi1idriVDAZ4H9lYD5rmeHZ5OTR/dlyM8xdzVcTuK0d3SQMhL4zwbFCEt6oEa3rPjXkPaHincWP0uXh3Z6/irmIwK5cyPA0DHgFRxjwNbVUrZiSPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792684; c=relaxed/simple;
	bh=0ll1UY3KeG8rCRKq1wHdxRSPsRNrYLdVRTpppx6seVA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKE74WQ/Aj6fMPpXzWKwqwMQAKb3BnDbnPuVYwbVEZ/q7HDIE8hwWqRAK/w8Ib/W7q/col5vn3rUaJo1xMOsH7QznaxqjnENkLGAqdP+BGmw0RNR7UCrCvsrqrlgxDaYcOTCLOUS4Fgz1ied2ZNhKJomRjfg0xIti668hJE6Gn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/IW2xSR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/IW2xSR"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297e264528aso20859085ad.2
        for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 08:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792682; x=1763397482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UVmErpKw40BYN09ToGb11RVmfMPSvvKFwxlIzoWfVWE=;
        b=A/IW2xSRULTfD2CUE6PiV3hO/VJS3mgcS4krXuQCnIyGCJ1hsaNXfw75NJeZvsGY0p
         gpj5JfYOCPp2KQZBAfgvxZoPBm8VSJBfW+uFcJBSohskV+NEKXIfY9oxP2/25hc4Hz2q
         ZZVgAZh7IdIWZdqm05FfXllJ9Ty1LFXIo6W7sAQvhi1C730hMh8XcZqBgP5wuUp8wDfE
         xuaWS/LSjLBZBX74X9tsbEJphqFqNEsgiR8m/tpdjTivhR9IrN7n3yCbKnXro8kb65hr
         aJMocx5EipF2Bp0jgC/rC2G2BbUQdE7Lf7WrvzEyKFpuRnMAVbQnXXoZ89jol3oIohAt
         W80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792682; x=1763397482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UVmErpKw40BYN09ToGb11RVmfMPSvvKFwxlIzoWfVWE=;
        b=rHNzEdJ3KA6TAoRDjpyOL76yMsj9HCwXVrAFJhlju4H091gct+yXGLn6/LWBtbelGJ
         KaTv2DmhvMXdj/zzg477V8Ve1/Uj1tlDUsrBXEqJunbWJtET4yxOnt+sWAORz8WwVbzr
         6cz4RYTRydDZUCcn0APouksJmyHW4ga1pMaoryr/jk62ZlSGpZvUqgbqF8uMBCrRuws+
         5AyfZFN0S6KMQlWZDqfkFcYN1oNafVShNY2hCEOr9mU2Ea6icoC2kIlddj07y3NfD6z8
         T5usxK8Yt5iIk4LuRGtU4NHZYEW48ui5SePqov9Vdw2GnbgcMNYRvEW7Y+6s2zJKQ0nQ
         qbyw==
X-Forwarded-Encrypted: i=1; AJvYcCXpTWv3yw/V+4ORUUdugrYxOgAByVuH4jijhEcEPr0EyBbL9JKWuJ5tI1CTvkSZ3yeR6c74Jc981EA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLijZhF3/aOVr39zTQK3AUnmvt8ycHC1Fm2uoNINHYbF0vUIC+
	YP4MzYq75Mhf6jQfUu6lxk5DKE1Mk5zcIcr6WLQzRVY3CUqH5eJu6a3u
X-Gm-Gg: ASbGncvUj/WT7kvR6QDesBJZnm09VDZsE0FgrN0MnZ5DMrYPW8fVLbSw4QHd3QSAMxI
	jhvDcu+G1IjvjC4qUTuzm8+N8QAIhLLiWalfhp9lSZmiXO551IJHz269/Svw3mNPXdqihpI4fI3
	u9fUst0FJZyl7i1HYw1HSdj/YFMnypGt/ZQz/dnl6aDBvYzSoKJIhOy1831i7cM/8/G0d9LCr2s
	BTUOVbYK3RBAiX/aXefFQStsweYEjrzGd/XRJrdwf8bIJtNCpy+No8n6jr9FqLF4mrAx2Msy7Ui
	aNJG2+VDN5+kyXr+Jifjy5QR8Y0BgtbWpeehy/aPJ4GwgreQCiKurbW4mL7CSmX50g0hUWCAEOT
	L5dcOtAfN3cipQHbVdtdkQLr7taDDytFRQniVJZyklmsikRP/J8vQA2bSmHNTDaYqGdoVn531oC
	03QfVb6SkS1F35hx+KmiAWbLhvEIP+pj3z
X-Google-Smtp-Source: AGHT+IF4UnHu4G9Q8eIDvf2W+ctzcOIuGaDk8UK6CDWVqUsSsFW88QwW7PGjK89tTce0NP7TNVfhnw==
X-Received: by 2002:a17:902:da4b:b0:297:dfae:1524 with SMTP id d9443c01a7336-297e56473f1mr131374835ad.16.1762792681587;
        Mon, 10 Nov 2025 08:38:01 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c8ef47sm153049485ad.74.2025.11.10.08.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:01 -0800 (PST)
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
Subject: [PATCH v8 18/27] arm64/hw_breakpoint: Add arch_reinstall_hw_breakpoint
Date: Tue, 11 Nov 2025 00:36:13 +0800
Message-ID: <20251110163634.3686676-19-wangjinchao600@gmail.com>
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

Add arch_reinstall_hw_breakpoint() to restore a hardware breakpoint
in an atomic context. Unlike the full uninstall and reallocation
path, this lightweight function re-establishes an existing breakpoint
efficiently and safely.

This aligns ARM64 with x86 support for atomic breakpoint reinstalls.
---
 arch/arm64/Kconfig                     | 1 +
 arch/arm64/include/asm/hw_breakpoint.h | 1 +
 arch/arm64/kernel/hw_breakpoint.c      | 5 +++++
 3 files changed, 7 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6663ffd23f25..fa35dfa2f5cc 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -232,6 +232,7 @@ config ARM64
 	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && \
 		HW_PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS
+	select HAVE_REINSTALL_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_LIVEPATCH
diff --git a/arch/arm64/include/asm/hw_breakpoint.h b/arch/arm64/include/asm/hw_breakpoint.h
index bd81cf17744a..6c98bbbc6aa6 100644
--- a/arch/arm64/include/asm/hw_breakpoint.h
+++ b/arch/arm64/include/asm/hw_breakpoint.h
@@ -119,6 +119,7 @@ extern int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
 					   unsigned long val, void *data);
 
 extern int arch_install_hw_breakpoint(struct perf_event *bp);
+extern int arch_reinstall_hw_breakpoint(struct perf_event *bp);
 extern void arch_uninstall_hw_breakpoint(struct perf_event *bp);
 extern void hw_breakpoint_pmu_read(struct perf_event *bp);
 extern int hw_breakpoint_slots(int type);
diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index ab76b36dce82..bd7d23d7893d 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -292,6 +292,11 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
 	return hw_breakpoint_control(bp, HW_BREAKPOINT_INSTALL);
 }
 
+int arch_reinstall_hw_breakpoint(struct perf_event *bp)
+{
+	return hw_breakpoint_control(bp, HW_BREAKPOINT_RESTORE);
+}
+
 void arch_uninstall_hw_breakpoint(struct perf_event *bp)
 {
 	hw_breakpoint_control(bp, HW_BREAKPOINT_UNINSTALL);
-- 
2.43.0


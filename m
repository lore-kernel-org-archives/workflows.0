Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891A031B110
	for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792671; cv=none; b=TFNnM/rMxCbVyl/+AhuwKNnawNCdZ66qOHxXJngOk/NT3N6E86iHgbjJjJ8UobH0sZtCLRkOrMYp6qXnQ1KeiNcpGsRkDgkycfaZihPBuof5LfUdYMqneXroXNKkYqwfl7kn4DpviUIXtZs1uAFnmExoJ1JB1q8+oZCk9OIArUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792671; c=relaxed/simple;
	bh=e4vkEHA+9PTiYMh5yLQWM+MeyKZuslfqcgr629D3+7E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RfKuYofmMcRoqBtbjBC4boID2hoD5yZJ54J7prrT4TWZru9/xpw1aEE/a0YaqiGcxtE/oV1EnrZRtlgTzATScl9OJMM3W8Ds6EhaKeMsFTYJqlilUaCSXn7BgrwwyaH1Zu4e26olb319EX0AqoDiBZD8Nm4gpc5qOJsa3e5s704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQBR1353; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQBR1353"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7afd7789ccdso3042155b3a.2
        for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 08:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792668; x=1763397468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbgbln0r/0DljbZ66YwwMMl7cTrgB9t9J30U0WpMJ+k=;
        b=OQBR135369VT4PBc2hT+xdd5VzRxTuB3C1HjCn9+F1vDopvc539ePQpm6Ee2GA+EqD
         lfx6/UfDSuphvjq+xMy7mV4jp4iNppQvvP7+ysUMaqPz5bjGbFvRqP6+zOPenEBsfyaQ
         oWpmrc/pgw2jbDKu5FqjNAYvNNG1Otf2niawwM25tVE8PeEZJ0Wdor6Yh8ialpn4SWYo
         3qpm8WtvKl6LiY70DZ6jIrbPPlgPa2eBOE+vWhG1lXysEREIC8SC2A69IcKRasMH7J0/
         i6Im5iL2Kh828eRW2hS74RRA3Xq4J+oC9wBBEFWVQwXvxzuc57ta5ISEyQwq0b/KSOWg
         LTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792668; x=1763397468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mbgbln0r/0DljbZ66YwwMMl7cTrgB9t9J30U0WpMJ+k=;
        b=JVCNnC3+tOxTvLxRWcKjbO0dxqt2PxQIjLMhlwGbriBJOsMpWBdTxQWk/SKA5RLqjK
         mJ0GOWNJlGIJcUnYkQYp4fs8f60aW83T8yzbyHEym9rNduC7AQKqtG5Pb8DVHWpYy9QE
         QAZ0FCMgyySOub2JmNA1Yb4ZO/yiZ3dqaFaZvYFOsIQFfdGkA37tThNnFKleHb9L+900
         +RFD0P5XwkJ6zkqHBRsyS9+ATqKKgbzpjcVP5Xyi91/0L9oup0D07OLrpRpd0QyHYLJd
         ONqXtH5TokGedx80KG+FNPWNw48l+cNr7VkyQUTQP5e+rp3/WWdCbqLzjy6T/FVyaF1h
         dnxg==
X-Forwarded-Encrypted: i=1; AJvYcCXkhBDvcqrkINfwGWJ6IdL0IH/3I77K/1h5lK5pNgu4Bd0NHcluVmBMlvUgQjAiFsQ7nnRgoQR7uG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYz10moL1goBuozCH7ANUWSRqbn3rY5Bjf1X8VHdZnevCbkdGh
	K4ICaTz+PIdeXkFLIWgQVp6aMHTa5SUqr8Rog6AyypmONHDzhIXwJ3Do
X-Gm-Gg: ASbGnctwvrEqxW8uSXD3l4OgVbF4Sw8AiiYSe30n9T63y0To4BsDqBBMgdQezt5iarr
	2Qiw4s9z5oyZnYW8DQXRDydBErTEgSO2S74Gje+6HVzyEKoVSrNT9kordP9SdQMq2GlOhN9EAgT
	LKgAeHHRzVYRSMHWiZsTwzVX3+OS5fytD/0ksxBNMkbWWwxMOAYIAvYPiuZeXmPOwen7TRpzdrx
	uDs877DasV0XF/xJKim4sUyYlIMCFZ8BzBXom0Xr8hwDRhyftTaVPdrwEtaVmT/CoX5L0ls7Eik
	mesUPl86SflKj7jQXVZFv3deMHLzBByyMgH6djjaaqw844wmn3UX9QN1FMODnEpsyRAQxos3/Lw
	/0TZRiCFLOL+vk1Yh6brAU1pTWcjLeIGo8QmIZBNPA0dcWI5gFWIzRpqxmMCSlabfv6sVEaxLvx
	KX4tMq9PgiV9w=
X-Google-Smtp-Source: AGHT+IF9D2s5oh2IOSIoqnbGH6eyisWVL5PhHGPCW6i2QHK95VMIMn4wu9hvntS0Aig4CKNxr1HiEw==
X-Received: by 2002:a17:902:ebc1:b0:294:cc8d:c0c2 with SMTP id d9443c01a7336-297e5663a67mr107303455ad.27.1762792667923;
        Mon, 10 Nov 2025 08:37:47 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c92cddsm154610615ad.83.2025.11.10.08.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:37:47 -0800 (PST)
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
Subject: [PATCH v8 15/27] mm/ksw: limit canary search to current stack frame
Date: Tue, 11 Nov 2025 00:36:10 +0800
Message-ID: <20251110163634.3686676-16-wangjinchao600@gmail.com>
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

Use the compiler-provided frame pointer when CONFIG_FRAME_POINTER is
enabled to restrict the stack canary search range to the current
function frame. This prevents scanning beyond valid stack bounds and
improves reliability across architectures.

Also add explicit handling for missing CONFIG_STACKPROTECTOR and make
the failure message more visible.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/stack.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
index 60371b292915..3455d1e70db9 100644
--- a/mm/kstackwatch/stack.c
+++ b/mm/kstackwatch/stack.c
@@ -64,15 +64,32 @@ static unsigned long ksw_find_stack_canary_addr(struct pt_regs *regs)
 	unsigned long *stack_ptr, *stack_end, *stack_base;
 	unsigned long expected_canary;
 	unsigned int i;
+#ifdef CONFIG_FRAME_POINTER
+	unsigned long *fp = NULL;
+#endif
 
 	stack_ptr = (unsigned long *)kernel_stack_pointer(regs);
-
 	stack_base = (unsigned long *)(current->stack);
 
-	// TODO: limit it to the current frame
 	stack_end = (unsigned long *)((char *)current->stack + THREAD_SIZE);
+#ifdef CONFIG_FRAME_POINTER
+	/*
+	 * Use the compiler-provided frame pointer.
+	 * Limit the search to the current frame
+	 * Works on any arch that keeps FP when CONFIG_FRAME_POINTER=y.
+	 */
+	fp = __builtin_frame_address(0);
 
+	if (fp > stack_ptr && fp < stack_end)
+		stack_end = fp;
+#endif
+
+#ifdef CONFIG_STACKPROTECTOR
 	expected_canary = current->stack_canary;
+#else
+	pr_err("no canary without CONFIG_STACKPROTECTOR\n");
+	return 0;
+#endif
 
 	if (stack_ptr < stack_base || stack_ptr >= stack_end) {
 		pr_err("Stack pointer 0x%lx out of bounds [0x%lx, 0x%lx)\n",
@@ -85,15 +102,11 @@ static unsigned long ksw_find_stack_canary_addr(struct pt_regs *regs)
 		if (&stack_ptr[i] >= stack_end)
 			break;
 
-		if (stack_ptr[i] == expected_canary) {
-			pr_debug("canary found i:%d 0x%lx\n", i,
-				 (unsigned long)&stack_ptr[i]);
+		if (stack_ptr[i] == expected_canary)
 			return (unsigned long)&stack_ptr[i];
-		}
 	}
 
-	pr_debug("canary not found in first %d steps\n",
-		 MAX_CANARY_SEARCH_STEPS);
+	pr_err("canary not found in first %d steps\n", MAX_CANARY_SEARCH_STEPS);
 	return 0;
 }
 
-- 
2.43.0


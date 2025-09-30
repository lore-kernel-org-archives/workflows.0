Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DE822AE7A
	for <workflows@vger.kernel.org>; Tue, 30 Sep 2025 02:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200270; cv=none; b=fzA6AEphh6pXAAlqPYw4lT0YwmiMcbDpCdW013O0RZ5C3am79tCvGOphxHYxOBuEoLrBDniZpx/F819pnuyT2q6CiaDAxarKMArnXbLZ/bRb5LnLpbidodRuR0brMPN/KYAlsT+q6YZOXG85yijn8nbBUAwBWb4vEIh4of4zGG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200270; c=relaxed/simple;
	bh=ZEq5LCeeZxdZtY+a+kvZMIoWs2Mzj+sOmq7f1LtT1gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXuzbvDEhb21yIlY6XLkuCpuc0HRtusqiGMH4/dHxSiLU4A2Qu2acGDlBT03n7oL+Vrs9YBnQhPaNjsS2cydXWjquvChV7UpE0VKkpMERVzX34S8Vu89Y6U7qoMtk1cCBJl4CTI8keYKohF/fNsPiCa4xfv04njjoi/w5mUoQ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ColS08rn; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ColS08rn"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b55197907d1so4067533a12.0
        for <workflows@vger.kernel.org>; Mon, 29 Sep 2025 19:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200267; x=1759805067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd/jIJYyk1G6SYf0mNQVLBMDX4oiGoErfqkyMXn4+LQ=;
        b=ColS08rnS9d+kfCXcz72b8/QAtx0G6L70/1XD8TqJDCVpNz3ZzZJF5Ax61C3nfkVwY
         SROwtzr/2Ed8dlnoOYx3peUTJc78kAf6esD0qpbbRuZAVO2h7Nq91EnlTkdNDJYFDmwa
         FR45CbjV+HDS7hbqvDT1lRhmosUvstpONd0QpzugDf5VN96BHCzj9qFHa9gcsE7/y3mL
         2kzXeGsqujq5SXOka3SMpr/bHlgZPoqG60ZrQNO1g3iTkE4MFGHbIbEOneq82aFA9eFz
         4wYvqWqAhJ44zxz9JuTsNWQz4AmSy0GlmqzX95QAmMkFvhKEVYLnkv5PZqicAOLwWp6G
         eLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200268; x=1759805068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bd/jIJYyk1G6SYf0mNQVLBMDX4oiGoErfqkyMXn4+LQ=;
        b=oPvXa3qNJ7J0LFQ7zYnr7SCeBCbfTSj0Rb49HT2PUl1NxtMIhcbbJ/nwbNHe5ds+nJ
         qC4hjfYjUhyomhyfg8FB+eIhsqZgk56tslpOPMp9bTEfiH4iK+x0X7Qi3aWTqBmSv1E1
         ME6hT9LfAqKHllpadZOMgaIysgF/MDYPckN5FYLr1pnbpKudJe4+OH1X1ZLqQETBHRgm
         1jHXfgPZE/LJtWi29isH7MA3ZHDnNGraGcd6UiTc9fvYPU+Rdyjt/ZHF7TmEGY/TJMTX
         fdjFVI5L+XZhadP5VOQd+1r1vVMBzgRDgf/pwjbi2aREWdyB/u+h1P50gjfN6ItFmUqD
         VcAg==
X-Forwarded-Encrypted: i=1; AJvYcCUVfaNtSfQJ9qFDKFzsfdubRqW1F2oyVO/BphzgLJ4gL/tZh2+xu+OAsIbDOrpEiqu6UnFGXQ0f5pg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfnvyBmwpDe3nvLNiluvQJaqFTBG3OXBRfGEiINZvJzuWhxHkS
	eqLRzQ2f4bQ3/4NLJZm8fHyaxZdeNEV14D3qaYTe7JRaOkg7PNnU2Xcw
X-Gm-Gg: ASbGncv33AShwnRLxdQ9RS16OsTl6uy/qIcjrHVunGRU7pOnLMtqnCuZxTxGIvWIq2U
	bvDGvy/SIb1um85ZK0hTkE8YgdqgvvxBu/e2QsKJOfUZkNVYLrrWstOwQHBph6Y/uoiyuRp8cxS
	L97qZYilQC6s6mjge82dhnRi6B0c8Z+YwvfxYKMKf6PTxDI1889QwmOQ4s4COY5ye2NBBosrrEw
	EfNCpG0y+DVyGwehChWcFX6UKNKPkBvKtNkzNvhOh+85Mis98PzaOMwEJ4/HvjDfHez9TOExRMM
	qodgEvakqBf0THza4Pcb1B0KYDK1jZUhgg7T7yyebpM6n2ZiV0w2sVO1USvSyuhCpTyfuGobFBR
	p6RUJ6wW2DEnJkr/xn571pcmTuQhlNdVXdvga4pKNzOEz65pZzTvRy34016kw7Ef/sdlhMXbegT
	Gu
X-Google-Smtp-Source: AGHT+IHMOcWUXY/HnXgeQLe6jbo4QIzPdgwdgujFPg5G7XU1dMaY5AtA37WyD38lOg5pTss5CR5fOg==
X-Received: by 2002:a17:903:a8b:b0:27d:339c:4b0 with SMTP id d9443c01a7336-27ed4aa57f1mr154617195ad.35.1759200267317;
        Mon, 29 Sep 2025 19:44:27 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d43b8sm144778285ad.9.2025.09.29.19.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:44:26 -0700 (PDT)
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
Subject: [PATCH v6 02/23] x86/hw_breakpoint: Add arch_reinstall_hw_breakpoint
Date: Tue, 30 Sep 2025 10:43:23 +0800
Message-ID: <20250930024402.1043776-3-wangjinchao600@gmail.com>
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

The new arch_reinstall_hw_breakpoint() function can be used in an
atomic context, unlike the more expensive free and re-allocation path.
This allows callers to efficiently re-establish an existing breakpoint.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/x86/include/asm/hw_breakpoint.h | 2 ++
 arch/x86/kernel/hw_breakpoint.c      | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/x86/include/asm/hw_breakpoint.h b/arch/x86/include/asm/hw_breakpoint.h
index aa6adac6c3a2..c22cc4e87fc5 100644
--- a/arch/x86/include/asm/hw_breakpoint.h
+++ b/arch/x86/include/asm/hw_breakpoint.h
@@ -21,6 +21,7 @@ struct arch_hw_breakpoint {
 
 enum bp_slot_action {
 	BP_SLOT_ACTION_INSTALL,
+	BP_SLOT_ACTION_REINSTALL,
 	BP_SLOT_ACTION_UNINSTALL,
 };
 
@@ -65,6 +66,7 @@ extern int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
 
 
 int arch_install_hw_breakpoint(struct perf_event *bp);
+int arch_reinstall_hw_breakpoint(struct perf_event *bp);
 void arch_uninstall_hw_breakpoint(struct perf_event *bp);
 void hw_breakpoint_pmu_read(struct perf_event *bp);
 void hw_breakpoint_pmu_unthrottle(struct perf_event *bp);
diff --git a/arch/x86/kernel/hw_breakpoint.c b/arch/x86/kernel/hw_breakpoint.c
index 3658ace4bd8d..29c9369264d4 100644
--- a/arch/x86/kernel/hw_breakpoint.c
+++ b/arch/x86/kernel/hw_breakpoint.c
@@ -99,6 +99,10 @@ static int manage_bp_slot(struct perf_event *bp, enum bp_slot_action action)
 		old_bp = NULL;
 		new_bp = bp;
 		break;
+	case BP_SLOT_ACTION_REINSTALL:
+		old_bp = bp;
+		new_bp = bp;
+		break;
 	case BP_SLOT_ACTION_UNINSTALL:
 		old_bp = bp;
 		new_bp = NULL;
@@ -187,6 +191,11 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
 	return arch_manage_bp(bp, BP_SLOT_ACTION_INSTALL);
 }
 
+int arch_reinstall_hw_breakpoint(struct perf_event *bp)
+{
+	return arch_manage_bp(bp, BP_SLOT_ACTION_REINSTALL);
+}
+
 void arch_uninstall_hw_breakpoint(struct perf_event *bp)
 {
 	arch_manage_bp(bp, BP_SLOT_ACTION_UNINSTALL);
-- 
2.43.0


Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110A2F49F9
	for <workflows@vger.kernel.org>; Fri, 12 Sep 2025 10:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672021; cv=none; b=Ch5ZsvvapMixzFMROEGEN3hPWM1DZYy5NQ6XgU3sLqR8JU6xxJHlFkxranWI7NXJ7OtjUvNQT7TTj9XVjPDaUhP1154LUhoHdjlzSXlMcYdEpcV55lRW+vVUWJ0v5Lr5L9W1ulAnABy2OwMyihLW1s9BazQCedOAlOS8S7gC9lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672021; c=relaxed/simple;
	bh=L9AjRhWN6K9GCJF/+6ZwgVizRNTCCmqDO7KY/KLz4NY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b6KsgR60AwuP4ivMvA776YOPLhx7KZZ7m0mTF0hc9FEGmlVRiwMbN22qhS7Wr97la70rboRn/isQ2S8hFm08wU4RvXRJ1tPML+ZQ4QkbPyRxFg1nm8PJ81qIDmsoOb1EdPMm/Mcl3Z/R7j2GzjNw9Y9Qi9q2hr5cYDZJfnGl6fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mFcT3Mu+; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFcT3Mu+"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b52403c47b7so1170943a12.0
        for <workflows@vger.kernel.org>; Fri, 12 Sep 2025 03:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757672019; x=1758276819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bn+/3FE5CmsLxOS0M5YahrLvDpar54OOYFHjkWGVE7o=;
        b=mFcT3Mu+4XaIgX/307J8T/feRXCtKSlmr8rq0uqDMPSSn0EAMlJuXBWFXCfHAsdedC
         K7rbCAdFHZ3qgXKwj2p9tN6m1WyJQdJfLLW2jk8po1Qd60supsMKC3EbZCJdh7kcFPNz
         mfRFESI/s+5fLJeU/QPjbnI2HddOBTQjRR4+6ARjuTZVsouZU1N73kj6dp2IJUJFnv3z
         NsrkmHRBsrp2gDc7JaFgGds1iXFyKyI8GgFtlsUpsIlBnrzMjjcX7ZPqfAq7yAQwCEih
         Ssp02dAy6oK/bzgNpnzABus6U4OfFaWsV7R4u9jHT9yKmszlSTZkS8tOed28cT0Mv1vH
         oMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672019; x=1758276819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bn+/3FE5CmsLxOS0M5YahrLvDpar54OOYFHjkWGVE7o=;
        b=TkR97qAArG6rUx6eh1eUsEQlI2kaaLetcV69+AJwvpKa2m2Qnhq/65Y1U11BJx92p+
         YuYUfvnk5m4MkARBgrMtf2TNrco7DTariijisuIbq+cy3slhwcg9feQZkrIbhtdaoxNI
         mumyJ2AgzZV0I8jROcAKWx6xIqYKWdXnp1hSqDnfU0OyxvKAEC9BzKYiiDX6XZeJ7LEQ
         rwZy+GDuFcylzxcpd9W2PKNP7lDICz07cVD7ys7S68QtZGB4JVUwc4CRDkcIeot/dW7S
         c7JpDSRRIkM7TtzGrx/2jnqf5F0UHpyVBSfP6P83ED1c2s4YOMBTWOTKFRqs66degw8E
         rFxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfB7RVua7PYNVW8Qp9qBS/4k2yZzXNDTrH9N9Yw0dhTUdpEFvA0wPW9yrPO071ccheky6pnSXFRPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQoa/jVeqDHOxvn7Q2Ez8GzoDAbXFVssanxXSllvHqYZBXvv3x
	m7739EDXLV9fuJKw+Y7IlQZExQYozV8Ekjw1Pp/klMthlchI7smjPHfv
X-Gm-Gg: ASbGncsFAR1H6ye8pZJuO8uZ60UekFPLNgW058wKkllY5wWfv3c7wJnmC4TmpO+aUH+
	nJn6MpaLrcaP0nsuYeBbdzvO3r8ioZglWoDe7qLZwo9hiqfF5seqS++Mdz+f2/mpjpLTSum/x4d
	+ExLOab280CuUHydK44/jas+/y0eyxwnNxsZpkQhG+2o0TvUFmgqy4ETTr10TxON3KHRS4hRtZm
	5UcVZafxlYn71XbS1sMYGdhFTsS4nXA2LjAeBwjX2BpxN9FjyNSIv4rlQIx35ud5uxZ/NjFowaz
	iP6W5wMc38yjZ/ixKdOnVyMe/a987p39PFkc1bcNZMaKjNhJKMGKA1E99vYs3ic1ZTzMvCeA56C
	WOviSPwk6nTC3E8Ge2ooO3vx+57vOeOJfFZw4Tp22R6gn6FZ0RhHLJbGt
X-Google-Smtp-Source: AGHT+IE9hLw78GXki+Z9/2VgA5oux+LKfhhFZu5WvV1JUasShceVOJ3liaB3nQw7f//NCPosPLRn+w==
X-Received: by 2002:a17:902:ef46:b0:246:571:4b51 with SMTP id d9443c01a7336-25d2da1100dmr32684915ad.29.1757672018598;
        Fri, 12 Sep 2025 03:13:38 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37293f0asm45182095ad.43.2025.09.12.03.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:13:37 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
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
Subject: [PATCH v4 20/21] docs: add KStackWatch document
Date: Fri, 12 Sep 2025 18:11:30 +0800
Message-ID: <20250912101145.465708-21-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912101145.465708-1-wangjinchao600@gmail.com>
References: <20250912101145.465708-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new documentation file for KStackWatch, explaining its purpose,
motivation, key features, configuration format, module parameters,
implementation notes, limitations, and testing instructions.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 Documentation/dev-tools/kstackwatch.rst | 94 +++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/dev-tools/kstackwatch.rst

diff --git a/Documentation/dev-tools/kstackwatch.rst b/Documentation/dev-tools/kstackwatch.rst
new file mode 100644
index 000000000000..f741de08ca56
--- /dev/null
+++ b/Documentation/dev-tools/kstackwatch.rst
@@ -0,0 +1,94 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================
+KStackWatch: Kernel Stack Watch
+====================================
+
+Overview
+========
+KStackWatch is a lightweight debugging tool designed to detect
+kernel stack corruption in real time. It helps developers capture the
+moment corruption occurs, rather than only observing a later crash.
+
+Motivation
+==========
+Stack corruption may originate in one function but manifest much later
+with no direct call trace linking the two. This makes such issues
+extremely difficult to diagnose. KStackWatch addresses this by combining
+hardware breakpoints with kprobe and fprobe instrumentation, monitoring
+stack canaries or local variables at the point of corruption.
+
+Key Features
+============
+- Lightweight overhead:
+   Minimal runtime cost, preserving bug reproducibility.
+- Real-time detection:
+  Detect stack corruption immediately.
+- Flexible configuration:
+  Control via a procfs interface.
+- Depth filtering:
+  Optional recursion depth tracking per task.
+
+Configuration
+=============
+The control file is created at::
+
+  /proc/kstackwatch
+
+To configure, write a string in the following format::
+
+  function+ip_offset[+depth] [local_var_offset:local_var_len]
+    - function         : name of the target function
+    - ip_offset        : instruction pointer offset within the function
+    - depth            : recursion depth to watch, starting from 0
+    - local_var_offset : offset from the stack pointer at function+ip_offset
+    - local_var_len    : length of the local variable(1,2,4,8)
+
+Fields
+------
+- ``function``:
+  Name of the target function to watch.
+- ``ip_offset``:
+  Instruction pointer offset within the function.
+- ``depth`` (optional):
+  Maximum recursion depth for the watch.
+- ``local_var_offset:local_var_len`` (optional):
+  A region of a local variable to monitor, relative to the stack pointer.
+  If not given, KStackWatch monitors the stack canary by default.
+
+Examples
+--------
+1. Watch the canary at the entry of ``canary_test_write``::
+
+     echo 'canary_test_write+0x12' > /proc/kstackwatch
+
+2. Watch a local variable of 8 bytes at offset 0 in
+   ``silent_corruption_victim``::
+
+     echo 'silent_corruption_victim+0x7f 0:8' > /proc/kstackwatch
+
+Module Parameters
+=================
+``panic_on_catch`` (bool)
+  - If true, trigger a kernel panic immediately on detecting stack
+    corruption.
+  - Default is false (log a message only).
+
+Implementation Notes
+====================
+- Hardware breakpoints are preallocated at watch start.
+- Function exit is monitored using ``fprobe``.
+- Per-task depth tracking is used to handle recursion across scheduling.
+- The procfs interface allows dynamic reconfiguration at runtime.
+- Active state is cleared before applying new settings.
+
+Limitations
+===========
+- Only one active watch can be configured at a time (singleton).
+- Local variable offset and size must be known in advance.
+
+Testing
+=======
+KStackWatch includes a companion test module (`kstackwatch_test`) and
+a helper script (`kstackwatch_test.sh`) to exercise different stack
+corruption scenarios:
-- 
2.43.0


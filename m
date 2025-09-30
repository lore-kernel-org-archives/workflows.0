Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D5D1E3DDB
	for <workflows@vger.kernel.org>; Tue, 30 Sep 2025 02:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200260; cv=none; b=hqaTGl1PLKFm62A+YYjMz+fg0GUpfFt4vTCgyrcbY9zo+E4XFvzTAOK5lXxnqrdA6ych4/73MY/cEbdPpun0aiyXKCzsA5FHXbZbJmeXEGBrrzoVZkeR1xcxxs0rY2I8svJV2qMRfQAiVzKaZhTjnThRn7t9aaJVficSxmivoFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200260; c=relaxed/simple;
	bh=GVI+QD0K8dUODTM2Cjj5Mu344coHEz7DbHEEEATdkTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GsepRT1AdHj9EolVXcS4avfKtQ2ZJvKJNEeenhEyekTc9eyShajY/XEsPjFbGBRKVHR8n80j+MXLtuqi5bSMzHezoRtmYuGrW8SBbxDwUI4q+3EwtYTAfX5R6tGWZjpNF2LitN3enLEzCwPRgGIDQhy9nXN07H8z3CIOv8V+yRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIWXBXNm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIWXBXNm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-78100be28easo3958256b3a.1
        for <workflows@vger.kernel.org>; Mon, 29 Sep 2025 19:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200257; x=1759805057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oBLHnI+e6tAOqeHvXlDdht1mTbtW+pSP4ewzl28Opg0=;
        b=VIWXBXNmPPwc2jimajuCQvT5j8ywwgap3lvBj87O98Hv9uqg/RfAZLcPrRnMx8aF/i
         AgXKhy9snoocbkPEXVDQGv4xL1qjA1ZqyNpNfT5bcfhVNVeXDAVN9dd1pN/QyZIqhQZN
         OctfovkEyrmrUL3GaoEOpeMv6ZqD54vnltm9cQHDEm1eTkZTvFabbIbAypH1ce7elzZv
         ibDlb7xfmU01JNRLiATGnnRQRQBEMAup2rH6BtdooF29XtVHYQH6R+18LA/AW1zkbuOf
         DbXs+ESX1XIhnKVFkR2TygL8+cJ/COkkmDG4yje5mSffjoa8UBBNYPv0wFWbmT0TXcUL
         dqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200257; x=1759805057;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oBLHnI+e6tAOqeHvXlDdht1mTbtW+pSP4ewzl28Opg0=;
        b=ENPIa9MKcJ5ScytvUEDPlRtlOSMF+ZDpGCs1tS0ynTcXP2N6gdr42TV/YVeZvs6BqC
         lD5LZjLrhuZLT+wolggkCkI3Yon8kjv5EhvllT8fmHRbg9pOj83UK/IXebWH57XZuugA
         TGOvECNGbwkM1dvVEBUdzzzT0i1yD5O+enzJ2oojYhpadYcf4Rc5HdK46CEqBMBV8hTg
         lweTmG6vt/+n0gXLPzl21IxAUJnrHy8BeyCeP8eAhUhGtMKyqe37vK6Gw2SgYyOt0xm3
         m+OuLZ6rNsIohdcyXGlIodM6+8tHmUD8M5xJUuzY4Fy0QccrjQ7zD/cGl14Z884bnSh3
         5B2w==
X-Forwarded-Encrypted: i=1; AJvYcCVqRD2Cb0Q8iDKNjDBo8xykC4IMwNs/nWVN8U+v69cMYdvCydFCQwJRe1FsRPvWjs2ALEk7Px95OI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtVW+oM3AGaWHlucl55ffLr7d20EHyHvBfKvYNcIxA5vxe3TJQ
	1B2gb64Sf98XviawHw+do4yQC7nz4H1SK9GnEftfVfkwhSkemQm8czzY
X-Gm-Gg: ASbGnctgQU0AoAWOVGMSZ5E/ZQKgUxymQg0NRisSotpJK9vVS48DdQtPQc+kWSuAr58
	KlJ2RQPJoLfhRPJd+ba5fR4nzgyEL54F+Bwmt7y8q8jpj9tX7MLf+jKTCxAa4jLXzLJS9mXFOYC
	LdHkkGbCI5I1ELrKXEqoCq8rDu120K8s92ihuAkBJONItDGDQE2KbnA89K64fWBZudBQezYZGUW
	ovnHamp6y9wcmZnzJJF5U9WuYxork2BAFp3TRSxoPf3vf17qUFecCcUdH5SkUnW+zOy8hSzfJqG
	edWbPVpVzGYOaohyef1WrdO9ujTK3JsikepT6nMXUoKP4TJXzLydrcOh/vM1kH07Yi8TnZrSVyl
	kwZUa9ZiT2XEIukR/7eScBXIDj/IvIm6uz+h/+Ux+L202Dknt3b5Irk4WDtpOQy+iYJHJr9uI7P
	TK
X-Google-Smtp-Source: AGHT+IHr+eKlqahlH64ABrOo26g2DZtu5RbBsAa8n+SzXkmpJPz4gPjilw094eEXW9CbsMYgjx7Ytw==
X-Received: by 2002:a17:902:c409:b0:275:f156:965c with SMTP id d9443c01a7336-27ed4ade26bmr209883395ad.52.1759200257156;
        Mon, 29 Sep 2025 19:44:17 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66d3acfsm146037925ad.20.2025.09.29.19.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:44:16 -0700 (PDT)
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
Subject: [PATCH v6 00/23] mm/ksw: Introduce real-time KStackWatch debugging tool
Date: Tue, 30 Sep 2025 10:43:21 +0800
Message-ID: <20250930024402.1043776-1-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series introduces KStackWatch, a lightweight debugging tool to detect
kernel stack corruption in real time. It installs a hardware breakpoint
(watchpoint) at a function's specified offset using `kprobe.post_handler` and
removes it in `fprobe.exit_handler`. This covers the full execution window and
reports corruption immediately with time, location, and a call stack.

The motivation comes from scenarios where corruption occurs silently in one
function but manifests later in another, without a direct call trace linking
the two. Such bugs are often extremely hard to debug with existing tools.
These scenarios are demonstrated in test 3–5 (silent corruption test, patch 20).

Key features include:

* Immediate and precise corruption detection
* Support multiple watchpoints for concurrently called functions
* Lockless design, usable in any context
* Depth filter for recursive calls
* Minimal impact on reproducibility
* Flexible procfs configuration with key=val syntax

To validate the approach, the patch includes a test module and a test script.

There is a workflow example described in detail in the documentation (patch 22).
Please read the document first if you want an overview.

---
  Patches 1–3 of this series are also used in the wprobe work proposed by
  Masami Hiramatsu, so there may be some overlap between our patches.
  Patch 3 comes directly from Masami Hiramatsu (thanks).
---
Changelog

V6:
  * Replace procfs with debugfs interface
  * Fix typos

V5:
  * Support key=value input format
  * Support multiple watchpoints
  * Support watching instruction inside loop
  * Support recursion depth tracking with generation
  * Ignore triggers from fprobe trampoline
  * Split watch_on into watch_get and watch_on to fail fast
  * Handle ksw_stack_prepare_watch error
  * Rewrite silent corruption test
  * Add multiple watchpoints test
  * Add an example in documentation

V4:
  https://lore.kernel.org/all/20250912101145.465708-1-wangjinchao600@gmail.com/
  * Solve the lockdep issues with:
    * per-task KStackWatch context to track depth
    * atomic flag to protect watched_addr
  * Use refactored version of arch_reinstall_hw_breakpoint

V3:
  https://lore.kernel.org/all/20250910052335.1151048-1-wangjinchao600@gmail.com/
  * Use modify_wide_hw_breakpoint_local() (from Masami)
  * Add atomic flag to restrict /proc/kstackwatch to a single opener
  * Protect stack probe with an atomic PID flag
  * Handle CPU hotplug for watchpoints
  * Add preempt_disable/enable in ksw_watch_on_local_cpu()
  * Introduce const struct ksw_config *ksw_get_config(void) and use it
  * Switch to global watch_attr, remove struct watch_info
  * Validate local_var_len in parser()
  * Handle case when canary is not found
  * Use dump_stack() instead of show_regs() to allow module build
  * Reduce logging and comments
  * Format logs with KBUILD_MODNAME
  * Remove unused headers
  * Add new document

V2:
  https://lore.kernel.org/all/20250904002126.1514566-1-wangjinchao600@gmail.com/
  * Make hardware breakpoint and stack operations architecture-independent.

V1:
  https://lore.kernel.org/all/20250828073311.1116593-1-wangjinchao600@gmail.com/
  * Replaced kretprobe with fprobe for function exit hooking, as suggested
    by Masami Hiramatsu
  * Introduced per-task depth logic to track recursion across scheduling
  * Removed the use of workqueue for a more efficient corruption check
  * Reordered patches for better logical flow
  * Simplified and improved commit messages throughout the series
  * Removed initial archcheck which should be improved later
  * Replaced the multiple-thread test with silent corruption test
  * Split self-tests into a separate patch to improve clarity.
  * Added a new entry for KStackWatch to the MAINTAINERS file.

RFC:
  https://lore.kernel.org/lkml/20250818122720.434981-1-wangjinchao600@gmail.com/

---

The series is structured as follows:

Jinchao Wang (22):
  x86/hw_breakpoint: Unify breakpoint install/uninstall
  x86/hw_breakpoint: Add arch_reinstall_hw_breakpoint
  mm/ksw: add build system support
  mm/ksw: add ksw_config struct and parser
  mm/ksw: add singleton debugfs interface
  mm/ksw: add HWBP pre-allocation
  mm/ksw: Add atomic watchpoint management api
  mm/ksw: ignore false positives from exit trampolines
  mm/ksw: support CPU hotplug
  sched: add per-task context
  mm/ksw: add entry kprobe and exit fprobe management
  mm/ksw: add per-task ctx tracking
  mm/ksw: resolve stack watch addr and len
  mm/ksw: manage probe and HWBP lifecycle via procfs
  mm/ksw: add self-debug helpers
  mm/ksw: add test module
  mm/ksw: add stack overflow test
  mm/ksw: add recursive depth test
  mm/ksw: add multi-thread corruption test cases
  tools/ksw: add test script
  docs: add KStackWatch document
  MAINTAINERS: add entry for KStackWatch

Masami Hiramatsu (Google) (1):
  HWBP: Add modify_wide_hw_breakpoint_local() API

 Documentation/dev-tools/index.rst       |   1 +
 Documentation/dev-tools/kstackwatch.rst | 314 ++++++++++++++++++++++
 MAINTAINERS                             |   8 +
 arch/Kconfig                            |  10 +
 arch/x86/Kconfig                        |   1 +
 arch/x86/include/asm/hw_breakpoint.h    |   8 +
 arch/x86/kernel/hw_breakpoint.c         | 148 +++++-----
 include/linux/hw_breakpoint.h           |   6 +
 include/linux/kstackwatch_types.h       |  14 +
 include/linux/sched.h                   |   5 +
 kernel/events/hw_breakpoint.c           |  37 +++
 mm/Kconfig.debug                        |  18 ++
 mm/Makefile                             |   1 +
 mm/kstackwatch/Makefile                 |   8 +
 mm/kstackwatch/kernel.c                 | 292 ++++++++++++++++++++
 mm/kstackwatch/kstackwatch.h            |  60 +++++
 mm/kstackwatch/stack.c                  | 240 +++++++++++++++++
 mm/kstackwatch/test.c                   | 343 ++++++++++++++++++++++++
 mm/kstackwatch/watch.c                  | 305 +++++++++++++++++++++
 tools/kstackwatch/kstackwatch_test.sh   |  52 ++++
 20 files changed, 1809 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/dev-tools/kstackwatch.rst
 create mode 100644 include/linux/kstackwatch_types.h
 create mode 100644 mm/kstackwatch/Makefile
 create mode 100644 mm/kstackwatch/kernel.c
 create mode 100644 mm/kstackwatch/kstackwatch.h
 create mode 100644 mm/kstackwatch/stack.c
 create mode 100644 mm/kstackwatch/test.c
 create mode 100644 mm/kstackwatch/watch.c
 create mode 100755 tools/kstackwatch/kstackwatch_test.sh

-- 
2.43.0


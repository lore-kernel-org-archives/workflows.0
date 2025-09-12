Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0842ECD1E
	for <workflows@vger.kernel.org>; Fri, 12 Sep 2025 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671990; cv=none; b=Xqp8qvNKkUrdt0nUqcOj/b6o3YJo8TvdyCjC6odOJ8NctczTN5Z/o0DeXul5Ct1I9wRSIoAx9nUw7Q6cxWg7RopBl1z+a8L8IBMRTFkj0lawxAyq78Azj1T7U47+cXgxWzptTWq7wD46eeyufcjIOOYfOjcLNq7CKsTWTMw8xXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671990; c=relaxed/simple;
	bh=ljHubFdo4RbY9sPZZpmIGXXQZrdiNxFcVGyARbY49GM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJ8Vg3ZTvg5LMVeY1gw1Qf2VjucZ/ccQSb05CW0ydVNXPtLz8CCirw/HSfL0GnXeDMNakYBkIui3uZ/J8hJd5cBJZQab5Prl5yczRIsRpR/lmFhIFQ4tM8mE5mvivj93j6ngPNdiImC+vgZI0r+O+sZ8AxzOJTcnSzzN5zO7mOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDPSCdZU; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDPSCdZU"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7722bcb989aso1243354b3a.1
        for <workflows@vger.kernel.org>; Fri, 12 Sep 2025 03:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757671987; x=1758276787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clh29CJb8P7VxnXXw4h/9gdA7sU+C9WtN5xBt8cm/X4=;
        b=IDPSCdZUUpOtAF1g097xo+JllyTdTsE6JXJrlMnaWPvAcFm+Byxx8HkfwMK2Ay7qhg
         yBS9gbB0W31nUnKN6faZ91ABd77++7zOZLhbMRZgm/rlORu4DnKMRkZh7El4jkaNwRlU
         tZdQpoQLvNTx9UGq7GCegQB0tUBgb8ggjiQIroUh2uVAxkqX7WVIqy961kqGuGasz/Vf
         I0I+Ps2IciMECyInMUAH1SXckZetPLXGkUtE0mSUlcPL7+lLZegw7xcYudczi23IUdMd
         98fgrBf9hBhJ7tTapx+kiRhcgejl4+jOdRZze0dk69A6uydoEI/9rj5W6Gjqsr31VR0K
         WKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671987; x=1758276787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clh29CJb8P7VxnXXw4h/9gdA7sU+C9WtN5xBt8cm/X4=;
        b=Szjj7F8yBxE/Nt4uKHeTShSehH9U374PXmFjVI9WEVuYgB1cS95iYB0xwVNrSd86Fj
         zkNusKOf066MsnHFx5D10x/5ysA9C8YpUFFy5TIwFQb+8dC5smC/L/oe5wOI1GDHRLrH
         zre57iw3MiRE5y+7D2G2eMfRPY4qqTOccFfVT73mS3Fgvoy9z1tx3hq/GSqp534P2JDH
         89cTnfTcwolFqd6N6U6G2PU4pEsPc5bF3b9eXJ/8shd4/FJV1SNhMuWWD9ZY3v9tj2ie
         nNN5E9GXVftq1SdvWaNCMcsEZFLPGop8kF+zxNhj3Uc11icXfD1B9HkFLlUBFBDGZORc
         ihdw==
X-Forwarded-Encrypted: i=1; AJvYcCUqa5GUdhuWSIsOSo7IMuOVj5zRzJH9cFQj2jfUcEbGcHi/FP1JhJgGlywxPi9bJKPbG1iEIzhI2kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyR+SUwDzXTohTKOgY5ItpAZkt8xI7DATOOaNhAoWilTGhgk02
	zjb9CdGh84X/2mmFH7zs0IPpbp71unqqoIjA7btD/N/ufTyp/UYbNCuN
X-Gm-Gg: ASbGncvzPT9mZD+hxOg3ZfYBzXQnetznnjDKTg0Yy62L13/6TKC6lbhGGkpgtZdXQWM
	IJ3s1UGcFHXmEgEuwD0R7VSAiSAnsQ7BhaDRSbjvbGDFz9wJfkMgfnlPMFk/eZ4bwk7alzTVXa0
	+Nc4pB51jsBAgK1VrVlZ/di2yGs2YgKk+lBdldF8UUyzbSOTupqNoqOxibhEp0wrO/YnCV6fx0v
	OaJ291Ax2FoyLykJ6kP+tnzk3vp55tU8pYqAqaf930IK5rnBqFX8Gcn0ZQjjcs1oiNG1oL45jWN
	2NZEqy58znRPT+cB+AGWgN6JxNod1aGwzanv+QtE4Rkto1A2ohVia+YtHt6pueNgmDhqTpCK/5T
	dosle53Go9AyWvJ/kwtWd/XFzVJVxY6HVzhI=
X-Google-Smtp-Source: AGHT+IHaEUea7hRsSpqZl85bTv6q0KsvHQdzV/MeRfkpCvkL2MgkVHPyR0dQHBXbAqMEfqsEXUoPVA==
X-Received: by 2002:a05:6a00:982:b0:76b:d869:43fd with SMTP id d2e1a72fcca58-7761216815amr3249434b3a.18.1757671987091;
        Fri, 12 Sep 2025 03:13:07 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760793b6b1sm4934804b3a.20.2025.09.12.03.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:13:06 -0700 (PDT)
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
Subject: [PATCH v4 14/21] mm/ksw: add self-debug helpers
Date: Fri, 12 Sep 2025 18:11:24 +0800
Message-ID: <20250912101145.465708-15-wangjinchao600@gmail.com>
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

Provide two debug helpers:

- ksw_watch_show(): print the current watch target address and length.
- ksw_watch_fire(): intentionally trigger the watchpoint immediately
  by writing to the watched address, useful for testing HWBP behavior.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kstackwatch.h |  2 ++
 mm/kstackwatch/watch.c       | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 5ea2db76cdfb..9a4900df8ff8 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -47,5 +47,7 @@ int ksw_watch_init(void);
 void ksw_watch_exit(void);
 int ksw_watch_on(ulong watch_addr, u16 watch_len);
 int ksw_watch_off(ulong watch_addr, u16 watch_len);
+void ksw_watch_show(void);
+void ksw_watch_fire(void);
 
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index 795e779792da..2e9294595bf3 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -161,3 +161,21 @@ void ksw_watch_exit(void)
 	unregister_wide_hw_breakpoint(watch_events);
 	watch_events = NULL;
 }
+
+/* self debug function */
+void ksw_watch_show(void)
+{
+	pr_info("watch target bp_addr: 0x%llx len:%llu\n", watch_attr.bp_addr,
+		watch_attr.bp_len);
+}
+EXPORT_SYMBOL_GPL(ksw_watch_show);
+
+/* self debug function */
+void ksw_watch_fire(void)
+{
+	char *ptr = (char *)watch_attr.bp_addr;
+
+	pr_warn("watch triggered immediately\n");
+	*ptr = 0x42; // This should trigger immediately for any bp_len
+}
+EXPORT_SYMBOL_GPL(ksw_watch_fire);
-- 
2.43.0


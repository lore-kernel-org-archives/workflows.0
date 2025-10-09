Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4969E2EA17D
	for <workflows@vger.kernel.org>; Thu,  9 Oct 2025 10:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007493; cv=none; b=rvDH3VUaXEx4vMx0oRTfaXIopfzpPlmqtj3eqJbWjKYWk/FqmeWtacMV4vIcdDiaFfMB5NBPVq0itrb/TsoA10IRjqM1x0i4Y0vr3xgwI95TXcEvbjQEYTNDpTbwTPYTVcvy/Q62k6Q/aPK/+TaUVq7jMeB+L3rAs2aKhtbcxUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007493; c=relaxed/simple;
	bh=zgbvGJBSx4YBKNkqO/qzz/La9XfnZ3vAatfFaQMoL7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b86clgGjZKvnyaQ6/uWEn/b3KZW/fnrnOLbAKbJ9TsC6wx0Y8nDYlHrJTzrKWbWvquvuTlfICspUQ9OeeLxsan3hBni/QbHX3G4Tm00STdrsilSaIPG5dkzzqEHY2PGo/ndWA+HFHcG3OYhd1D23E04IJgjBbcW+Q21h9GEwJys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7UOdQI9; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7UOdQI9"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-26a0a694ea8so6247275ad.3
        for <workflows@vger.kernel.org>; Thu, 09 Oct 2025 03:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007491; x=1760612291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmaGbmiuxIsK0xKTEWJ/f7gfwC2bw8p0SOLh4b9Z4FY=;
        b=E7UOdQI9HCnZcw4uCetsJxxVnlzNoFrHiMsDTfSUoAXhW6aJCYrojh5o2cwPO+4iJR
         et14Ixf632iUBv9LvIqZnu2d9iQOwf6q0NrwMPKrS7K/bx+lySw0wTQWP+F5DjG6WVPL
         mxO8wb3CF78iEpYq8TmQTtdqCOrvTrUz1PCu4nPMEu6QBYt0CO/oDp7uh9siSqXyqxdb
         MlEqW0uunkBftyJ+7zRH7O7abltplnEWfErQ4Usdx4d1OphEYablLyAPRuthU7E2dT9Y
         z/hf5TTOC4meR8c6BqmNZy4l3MXqn583hylrwkECpYZd+/c+PSEc9pakAVxlDlm2NOKI
         u0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007491; x=1760612291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmaGbmiuxIsK0xKTEWJ/f7gfwC2bw8p0SOLh4b9Z4FY=;
        b=b3fWJm5e3wTqk5CIia8meBJ/hwzTFSGy4lbEQ+hmZgPjhqmEszZS5JbsRqWRUmyyNx
         WCwHDpyzZEUmhcvPd1YpL6K1eV59b0ADjFAYmuiN3p3qT9I8ZmVMEj4Ogd23j2QOccYV
         T1VnwptJ4DxLdUNhzBUOIRsjAD5cXJFdunFfyzrtNEFACYIvINfmw1upAGHZpWg3QFx+
         jmyFiP818hjQE/ic7VQ5ZKBy3rOGAN4OWoyfDHbVt3xTfyuyxtEMkl9UxKfJvBpf+1rl
         uj4SYEhipLyXyQh4zB+vK/ZbLV5TVYM5WjvAHSRbiCWJhf1uI87wluzQrruk+/RKHm1o
         eyXw==
X-Forwarded-Encrypted: i=1; AJvYcCXmru8oyy5AmO6DIbyqADTXSh875FX+kCfsWmXBuaVIFrHXBYbTK8zVqc8o92zZDtt75VoACj7XZN8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3yUPng+BQlefZ2JYaNr75MhFggeAHIGOupzLFBtm70c9K7Hu6
	FSKKY8oxBK9dMfwZE8BjX1eHR4/a8zHL4TDkUhCPZSO9vpPYRDxHptS4
X-Gm-Gg: ASbGncs6Dj41o2YIPxMo4is44Nl4b5kuocDD67A6Aqj9D5tAXb1n1aSOkg9NvmX8dK7
	6gx1pi7GEp0m7sFl7a6IFM27D7H+KWvgC6yitxhIDmf1WJrjCaxUnUJpYZ4IYcHAEqyEc154DSO
	ACMZMbejhX1W5ChVNE7LK2aWyhoXiA5W1ZZoPEp0FiJoT737gENs9p8RusNDS5oz4v/A90vFqUY
	JCihgePbOfr6q7LXuwvtrrv60Y26gVWJmDlqHHFIESH+eGEwEGtBQ37BNfo/InANe1GMyXs5sIK
	ScpsmiPPCpOTAPwMNJQ+8Ycw4HiDHeCH6RtsBWCbcHeHPx5jchaeM/+NM7FnPiHdubFdf7L5oct
	w2gc4VvYNhQhY/BqC4PipPUb0z0Q1jD96U6o9jvlpsKzW5j5nqGa1LfB/Bw0Z
X-Google-Smtp-Source: AGHT+IE5mYvqRuQZ+u7IQ0srPI8O6QG8ywmWS1iS+UAE48zG0ZozJL4ZlmLiRWALZX5JRbD2vynFcw==
X-Received: by 2002:a17:903:2f45:b0:27e:f1d1:74e0 with SMTP id d9443c01a7336-290272b2bd5mr92577745ad.17.1760007491218;
        Thu, 09 Oct 2025 03:58:11 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f7ab4fsm20659266a12.44.2025.10.09.03.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:58:10 -0700 (PDT)
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
Subject: [PATCH v7 16/23] mm/ksw: add self-debug helpers
Date: Thu,  9 Oct 2025 18:55:52 +0800
Message-ID: <20251009105650.168917-17-wangjinchao600@gmail.com>
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

Provide two debug helpers:

- ksw_watch_show(): print the current watch target address and length.
- ksw_watch_fire(): intentionally trigger the watchpoint immediately
  by writing to the watched address, useful for testing HWBP behavior.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kstackwatch.h |  2 ++
 mm/kstackwatch/watch.c       | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/mm/kstackwatch/kstackwatch.h b/mm/kstackwatch/kstackwatch.h
index 4045890e5652..528001534047 100644
--- a/mm/kstackwatch/kstackwatch.h
+++ b/mm/kstackwatch/kstackwatch.h
@@ -52,5 +52,7 @@ void ksw_watch_exit(void);
 int ksw_watch_get(struct ksw_watchpoint **out_wp);
 int ksw_watch_on(struct ksw_watchpoint *wp, ulong watch_addr, u16 watch_len);
 int ksw_watch_off(struct ksw_watchpoint *wp);
+void ksw_watch_show(void);
+void ksw_watch_fire(void);
 
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index f32b1e46168c..9837d6873d92 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -269,3 +269,37 @@ void ksw_watch_exit(void)
 {
 	ksw_watch_free();
 }
+
+/* self debug function */
+void ksw_watch_show(void)
+{
+	struct ksw_watchpoint *wp = current->ksw_ctx.wp;
+
+	if (!wp) {
+		pr_info("nothing to show\n");
+		return;
+	}
+
+	pr_info("watch target bp_addr: 0x%llx len:%llu\n", wp->attr.bp_addr,
+		wp->attr.bp_len);
+}
+EXPORT_SYMBOL_GPL(ksw_watch_show);
+
+/* self debug function */
+void ksw_watch_fire(void)
+{
+	struct ksw_watchpoint *wp;
+	char *ptr;
+
+	wp = current->ksw_ctx.wp;
+
+	if (!wp) {
+		pr_info("nothing to fire\n");
+		return;
+	}
+
+	ptr = (char *)wp->attr.bp_addr;
+	pr_warn("watch triggered immediately\n");
+	*ptr = 0x42; // This should trigger immediately for any bp_len
+}
+EXPORT_SYMBOL_GPL(ksw_watch_fire);
-- 
2.43.0


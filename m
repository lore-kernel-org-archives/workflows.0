Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212AF2EA170
	for <workflows@vger.kernel.org>; Thu,  9 Oct 2025 10:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007489; cv=none; b=eMnQtIBg003U1EvH30TvwE2tEqqRfVqgL5esBqqBy1dTZthcT78voldnRdDF3rE4LERm+q5FBoH2hzBnzq9O9mcMW/3JbxxcEnankbmeHB1MpaAlGP13jOfmUieaUmt/xe20vK5lbps6us/1G1MEPOPwTK1rp+0z58tiukiLEpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007489; c=relaxed/simple;
	bh=jb47W2mefivkhEZpeuyQPhjnJkRHRCJ2NscvV1apXQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwJ9aJRgX49WG0S/0e164idW6KuxLnecU8Q5TPbfT9lymyxpLqQrfA0fkl8+Sqr6aN5PWmFsVe7Hvq/aoYzIEDlICczBfSW4ZuUsUlxTD6fAnfV+hV3E0itOjAoGs9qB6kazG8WXbkMobeQDCZtmHMLSN0tjsQ6X0gfNh+IX6UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcxnklMX; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcxnklMX"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b57bf560703so521791a12.2
        for <workflows@vger.kernel.org>; Thu, 09 Oct 2025 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007487; x=1760612287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFRia/GHfKKxxNt0IUc2kN+EVm0fmr2Lz8hq8oGCXGU=;
        b=BcxnklMXY0S1nikXs8Pkm91y+PNuSzZyHikRCaKEHuMr5ix4y8kphhrxunKpwrJYdl
         dAdi7tRNY5bsvaY7esYI2tRCz8S1W+jDni7obTYASTK8T1ZPWsLP1qXR6pNidAKw0eI2
         wV5lwdWHNqCYgpt3bS00s+xHePICE8i4Aa9TTuX67P7YGvP8gmgKPmYhBX5+I8Hzk01t
         iS41WM6ySQC4q8VQk8FyNNr980zejO5HpzHBc1RjNSColYAozKZSnjFQ7XGE+LLe4Ody
         rcqnn3nIwNKyGSiiWOvAAUy5OWg/5TtRSjh513Zx82fsDN41lq2oH2F0HNX13KxxHACf
         G0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007487; x=1760612287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFRia/GHfKKxxNt0IUc2kN+EVm0fmr2Lz8hq8oGCXGU=;
        b=H4lTuDZJuX1zogLtDxnr6GQf0qZ5reQTp/r3hvY1sgeRlL+mxTHH5Uld8yhXNNkrui
         G+W+EkPmBLOLmRoVj0Kw9x4OzoF7FaKqxwU6pgCi6dvIco9sOaLV5tbfuSXCRqhR7pmB
         D5QESQOzSLAP+24GeR72iaCGOXQERP4HwxAxhAZUdbWJYrl/Xqy+HaFGzngrNIZpGz4e
         fUozLgsm9EjVskiWu30m2Ry4QQzgKETH8cnux/of7/8xx42jG36D0vW40+V+xA+NoLEn
         mME4DmCKoADSfUb4QlppijNUTVYmvdF4Gkj2Xic40Q4QyZa/Dz2vSguvXFj7Pqmscf3j
         FXBw==
X-Forwarded-Encrypted: i=1; AJvYcCU1MWlKBCdsPihRIwXs5xEmwSJy5+nJehQ3Y3UbaQw95KRt0xK5IqGJOfA2iB4JkVWTxgN33aCUd54=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpFOJAFM259ZEKa6nMCwgW5MZ2SeHDRBVqbM1ddqfOZ9O6KaSC
	fRwgPHZ1H6Xzuun+DwvKmmnJQRCPWBibEDyHRsATtJorO7f6jsemYYED
X-Gm-Gg: ASbGncudfqWX0e1J2x1aepb9WhcGeortesm+U4BXLvc5Nw8uAADcagqg/qzyn6kqLHK
	z3xmJDNNin2PfQcJNWFmk4QlSxtY0xpTBTcN/ONj4CDbccWj95TJidyxzBcKubmxV0VKX4NB5xa
	+J5sWQLZryVIfS/Q1HrkvWC6J5Xlu0iiY5UtI0EpaxJrwWP5akCNylBXEAJRyP35JKKgQZ0K/ym
	9P8NuDC76jmKdW1TW2vy4UH7kO88I8yHHTY+9IhglzMFPZ1nzlE8ffZG7UOggBExpQZC2GCHixw
	gPZbjIMbtvuyhvXs2MO4lX2GOlgglPuiJogBvXtOikJ+0Ijh4xVWtNWViS52GfHDpKWHK5in9f4
	wL65RfrlSJxjyQ7BrpkDsxIziEBpO5gjyvk45VoLToC2yC0bRWTmr8fqaChytoqWTzxJw1Z0=
X-Google-Smtp-Source: AGHT+IEEjbaanbFet6ymw5rLaG4ER6hS8x4PnRfmIgvGUILNfBcq5r77DsCvwjAQjB7po7/MVjYJ6Q==
X-Received: by 2002:a17:902:e94e:b0:270:4aa8:2dcc with SMTP id d9443c01a7336-2902737c5e9mr92201005ad.19.1760007487406;
        Thu, 09 Oct 2025 03:58:07 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b51105813sm6628595a91.10.2025.10.09.03.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:58:06 -0700 (PDT)
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
Subject: [PATCH v7 15/23] mm/ksw: manage probe and HWBP lifecycle via procfs
Date: Thu,  9 Oct 2025 18:55:51 +0800
Message-ID: <20251009105650.168917-16-wangjinchao600@gmail.com>
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

Allow dynamic enabling/disabling of KStackWatch through user input of proc.
With this patch, the entire system becomes functional.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/kernel.c | 60 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
index 898ebb2966fe..57628bace365 100644
--- a/mm/kstackwatch/kernel.c
+++ b/mm/kstackwatch/kernel.c
@@ -14,6 +14,43 @@ static struct ksw_config *ksw_config;
 static struct dentry *dbgfs_config;
 static struct dentry *dbgfs_dir;
 
+static bool watching_active;
+
+static int ksw_start_watching(void)
+{
+	int ret;
+
+	/*
+	 * Watch init will preallocate the HWBP,
+	 * so it must happen before stack init
+	 */
+	ret = ksw_watch_init();
+	if (ret) {
+		pr_err("ksw_watch_init ret: %d\n", ret);
+		return ret;
+	}
+
+	ret = ksw_stack_init();
+	if (ret) {
+		pr_err("ksw_stack_init ret: %d\n", ret);
+		ksw_watch_exit();
+		return ret;
+	}
+	watching_active = true;
+
+	pr_info("start watching: %s\n", ksw_config->user_input);
+	return 0;
+}
+
+static void ksw_stop_watching(void)
+{
+	ksw_stack_exit();
+	ksw_watch_exit();
+	watching_active = false;
+
+	pr_info("stop watching: %s\n", ksw_config->user_input);
+}
+
 struct param_map {
 	const char *name;       /* long name */
 	const char *short_name; /* short name (2 letters) */
@@ -117,8 +154,18 @@ static int ksw_parse_config(char *buf, struct ksw_config *config)
 static ssize_t ksw_dbgfs_read(struct file *file, char __user *buf, size_t count,
 			      loff_t *ppos)
 {
-	return simple_read_from_buffer(buf, count, ppos, ksw_config->user_input,
-		ksw_config->user_input ? strlen(ksw_config->user_input) : 0);
+	const char *out;
+	size_t len;
+
+	if (watching_active && ksw_config->user_input) {
+		out = ksw_config->user_input;
+		len = strlen(out);
+	} else {
+		out = "not watching\n";
+		len = strlen(out);
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, out, len);
 }
 
 static ssize_t ksw_dbgfs_write(struct file *file, const char __user *buffer,
@@ -133,6 +180,9 @@ static ssize_t ksw_dbgfs_write(struct file *file, const char __user *buffer,
 	if (copy_from_user(input, buffer, count))
 		return -EFAULT;
 
+	if (watching_active)
+		ksw_stop_watching();
+
 	input[count] = '\0';
 	strim(input);
 
@@ -147,6 +197,12 @@ static ssize_t ksw_dbgfs_write(struct file *file, const char __user *buffer,
 		return ret;
 	}
 
+	ret = ksw_start_watching();
+	if (ret) {
+		pr_err("Failed to start watching with %d\n", ret);
+		return ret;
+	}
+
 	return count;
 }
 
-- 
2.43.0


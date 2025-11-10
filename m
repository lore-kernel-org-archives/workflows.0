Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1390305E1D
	for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792652; cv=none; b=Q1BaD7hSfKbJ3OFu02yr5OWP7OgK+EVtUHbyG29HPpQimQDqWU3+wkqcvfBiNAgZBM8VKD7NE7myyiDT9tKsi7paLZ8aBpuBMhAlIpn/slICwVdWB+Mfs6mcBueZyqE9Xgay+KJsSp4h5O+BY+Xa7smqKUHDuKMUFXqYl2XhkO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792652; c=relaxed/simple;
	bh=HNu7Dcd5vvNfh2oB/9//HT00PJ8dhROTfKt08npi0Xo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xb2tpc13KPztmOfK747RTtdStbXOEePslwmAraCSiyBBMa6X7JHm5JfIxJaYqyQPFmLevbQGRmMVmzmjMbCReSDGQ1k3nliDewezEWsOuDhBr/Z1fmQwFn9BQrlfao+Z4A6ZYmf+rU6B/NfdKrKApQktcoWKkcYtEOBNX+fEAPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkxQVfEk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkxQVfEk"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297f8c26dc7so15259155ad.2
        for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 08:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792646; x=1763397446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvOciuVeFDrZI28wwbDFkVg+RFkidCZi4q1TH1/mApw=;
        b=BkxQVfEkEBOYEpCeUBV842In3TXrZSeDm6WTzj4dnhlJnM/V9G58u2nYPa/Knffz1U
         6Sy/ftr0I4ErZmavti+TsQOhwPBv2DFSW37bpJoP53In1JSYftTGImWiVtiBsQ2ORN47
         MCtLtxT1bidHRtJveRiETAElwfMJt+wiOLmV8za6EJ4sxmeGzyPTx42LXlH/oVmWpdpu
         8Q8ZKqD2Cf5esbgYH3GHQRNwJviYlHsamyt0H/EcrG1ewtc0sTUyHpgeo53KexFSmBxC
         D2AnvxOe9DAEcB0yGOEe4o7YPl0fkn5C0HAJC9CRr+lr/zjPEjRd7v23NsEMoKX3nHrH
         wP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792646; x=1763397446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NvOciuVeFDrZI28wwbDFkVg+RFkidCZi4q1TH1/mApw=;
        b=uX+hTO1iaUeVC/rDRpkqC4eC4YJerwxpduZEOtn1yojR2FnFM5vqMq25/tA2mmifOk
         2jhkjgFMrqy/w68GTjI/TnSjM8brD0+bbC3KIDaJARejNGHVxxt96bP4X15Qgt1AEaOs
         tb92f9NZlKiGE0BkFcjmnjfWoaQ11NGdRs1JJru4j+i/al7dCQqhEvmDU2GAaG9FfALS
         JUOOnHkfWbxpmJYhQlJybBNxYgloFqKF7MTeYSr6NEo5tk7H3bCrTkbnJ7EPKGGGI9kp
         6AwCy53bqgFS8SPxFaakEa7HtiL3ip3wAiol5Gvw7zSHPLpknkoEs+fk0N3ifMEH+yaq
         LC4g==
X-Forwarded-Encrypted: i=1; AJvYcCXDYficbPSnmUUZcHK3ILK/kUOQPWNlw25n17S+SRh+e91HjYNyaqgNSISLkX5LUnMMffUzHYrKjbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6U8Fi4VGAyG87AmxXXFYe72X4tYC5hPIfcbP/T1UCObk7t/9
	okPzJtbOm/udnAJ7lYQGPD3aCN7OSGt7cV3d0hLYdqXF/35ET2HQStlU
X-Gm-Gg: ASbGncvcT3yNh9bFwjg38rqiMD7HmD4bnYVyHIToxw6pElNxvb2KUCgPGmM3dXdjJz9
	f9yAMR9qVNLzrOKSr94Vj3NfWYGhkUb6r/PSKnN9DLK9JuZXdzUgVYuLIzT1eViYIQGLYG+KG7F
	QORjc55v+SpVsMl2Inzbc3hL2psYu4YNVeoyCOHdvW+8wKJT2lrSO0Em0TgN4gXt7VwmNkLOjFs
	zIMbi+UUDYx1pwzKKhbGfczo3MhBW7FmzYg15iZsLPNjal5vi2y4iri8bZeR0KkUTKXY0YCLmTu
	uDw0L35N8Zcad8NgrJdVDoJsOJSOIfmg/L3+y1cEkeIe1I56Do+LSwBZ+CMf2ovjvLvWnHhIYfE
	mIZGt4nf8qHyax9WUn4QdeDz1qEoHUNuGLrQfyGbHbUHtpxuYfgZGd2nKfroCVISoN9gBSlQGK9
	mnX6DF0lbW0VA=
X-Google-Smtp-Source: AGHT+IHgMULgC+DBrIvta4Gt30Ay5gyo7asjfOY4+q2Dbpcc5OVehm1NQ3FiY7ELdv1UD5aLJGKDyg==
X-Received: by 2002:a17:902:da4b:b0:27e:f018:d2fb with SMTP id d9443c01a7336-297e540dbf8mr108586355ad.6.1762792645676;
        Mon, 10 Nov 2025 08:37:25 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5ce87sm150078775ad.29.2025.11.10.08.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:37:25 -0800 (PST)
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
Subject: [PATCH v8 10/27] mm/ksw: support CPU hotplug
Date: Tue, 11 Nov 2025 00:36:05 +0800
Message-ID: <20251110163634.3686676-11-wangjinchao600@gmail.com>
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

Register CPU online/offline callbacks via cpuhp_setup_state_nocalls()
so stack watches are installed/removed dynamically as CPUs come online
or go offline.

When a new CPU comes online, register a hardware breakpoint for the holder,
avoiding races with watch_on()/watch_off() that may run on another CPU. The
watch address will be updated the next time watch_on() is called.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/watch.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/mm/kstackwatch/watch.c b/mm/kstackwatch/watch.c
index f922b4164be5..99184f63d7e3 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -85,6 +85,48 @@ static void ksw_watch_on_local_cpu(void *info)
 	WARN(ret, "fail to reinstall HWBP on CPU%d ret %d", cpu, ret);
 }
 
+static int ksw_watch_cpu_online(unsigned int cpu)
+{
+	struct perf_event_attr attr;
+	struct ksw_watchpoint *wp;
+	call_single_data_t *csd;
+	struct perf_event *bp;
+
+	mutex_lock(&all_wp_mutex);
+	list_for_each_entry(wp, &all_wp_list, list) {
+		attr = wp->attr;
+		attr.bp_addr = (u64)&holder;
+		bp = perf_event_create_kernel_counter(&attr, cpu, NULL,
+						      ksw_watch_handler, wp);
+		if (IS_ERR(bp)) {
+			pr_warn("%s failed to create watch on CPU %d: %ld\n",
+				__func__, cpu, PTR_ERR(bp));
+			continue;
+		}
+
+		per_cpu(*wp->event, cpu) = bp;
+		csd = per_cpu_ptr(wp->csd, cpu);
+		INIT_CSD(csd, ksw_watch_on_local_cpu, wp);
+	}
+	mutex_unlock(&all_wp_mutex);
+	return 0;
+}
+
+static int ksw_watch_cpu_offline(unsigned int cpu)
+{
+	struct ksw_watchpoint *wp;
+	struct perf_event *bp;
+
+	mutex_lock(&all_wp_mutex);
+	list_for_each_entry(wp, &all_wp_list, list) {
+		bp = per_cpu(*wp->event, cpu);
+		if (bp)
+			unregister_hw_breakpoint(bp);
+	}
+	mutex_unlock(&all_wp_mutex);
+	return 0;
+}
+
 static void ksw_watch_update(struct ksw_watchpoint *wp, ulong addr, u16 len)
 {
 	call_single_data_t *csd;
@@ -206,6 +248,16 @@ int ksw_watch_init(void)
 	if (ret <= 0)
 		return -EBUSY;
 
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"kstackwatch:online",
+					ksw_watch_cpu_online,
+					ksw_watch_cpu_offline);
+	if (ret < 0) {
+		ksw_watch_free();
+		pr_err("Failed to register CPU hotplug notifier\n");
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.43.0


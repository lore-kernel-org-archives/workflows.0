Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ED12E0909
	for <workflows@vger.kernel.org>; Thu,  9 Oct 2025 10:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007471; cv=none; b=gog8fqxHf71cGeWn0pkpnOLPYZ3KrTjNNbvnUexuKWWI9LuEGikhaTl17hgRGqj0FsA/O1RRAIPCUfC/JNQja8q/0aKOiuU4LT315D6Nu1nlJacOdmBBJ556+kU+KvfRuhjatkG3acVoyTJ5lhfDv1DpSlEniB/K0BT3VJRCVsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007471; c=relaxed/simple;
	bh=EtuMaKP8CWfi9pjY9FcQGV9HEHi4WtiOKMPT566R1T4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r9qG8UFvS3Py7OfGavlEWBbWUH1W2vTTvNWMBcryRaIPJsi+FV/rMLjqrUg/QceCLscM5Dq23AQnYpXKx+JDmYwa2ZFx3zrKHCjQ6vA2y7Eoulfdceg2anNKtKtao0l43QQExY1V0cYcFqL+NbF0J+yIs8UmoXlp7Dr7mmwazas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRI7WsQw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRI7WsQw"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so774019b3a.2
        for <workflows@vger.kernel.org>; Thu, 09 Oct 2025 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007467; x=1760612267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VplC5p74+BCL3Xjzqw2UL/AL1hevTQUKrGPaYOT40mY=;
        b=XRI7WsQwvZLRMKH5k/2XVLyYjc1kYwTmbZQzTQs8ddME9gWi62JTPN0mJ4Wk7gzncb
         H36oPPlE+4GhxeIVK5rg5OyWOuAkOI0zpWmNs014z4plCAHGhaGjth1J/9DG2TAE+d6S
         6QOYykAuyE24tlsPs2LNsEwEUMpiBs/KZSaR/akb+NiU0MbV38ySbdtbttfHv54v+JX6
         /jBM440MshBnrVW+Rlk0KneqVWtUtWPbi8/fk6RwvI86WWBDD78jDfGzYZE8s4Eu2ZVK
         beZZi3L58M1MOPyDcrgQyViZfFIFoUSrKQWPOLkFARHotNXzR1lzfmB+MF7HQXsqA7ey
         AKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007467; x=1760612267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VplC5p74+BCL3Xjzqw2UL/AL1hevTQUKrGPaYOT40mY=;
        b=BCGf+OHCKZC+HrRl6YO1SjWPKt6WZjJS7Mncw6IEt8+AiJenrXu2fpLtNMLgkXVnbo
         vVK04mMPjWNtBd/N/uVpJcFZALeNslYkSPE89KLoKEeNjliidm+ojPzSxg0n9DMllkfR
         Jku2JfgNzMRfiRl/lnxKokdQwaxI4I8z8s0EtC/bS3siibYOr1Ns14W5osrmD3aBdJK3
         lYklKofGklXWZcZ+k8f8021izEmVZLavQYTAjOi1mkIUfTiBwwUemJNGTZzaySdBdSwH
         k/CGIB2pwRSmS4LMKCj+WKas2+UgOaywVdllUNSoatpvzX0npLqkwIcnxzyswJ6TgIWw
         CB5g==
X-Forwarded-Encrypted: i=1; AJvYcCWSlU6WpIAEf8P+6cCjUqs69cM9RyANiJ4rIh8tiPKeRD5Z+vLD4HeU32rzCvu3NgGBR+5kc3+f69A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3+AcZOBXVcte8jc5vDiYa+NGzB4pXBuwEmUPiN+CaT41DNDFP
	p1QhQ4Ea5IItz9fCY4t0mGq5j/k6wBruNh9iFHLotSKmjHn0OYfrwxih
X-Gm-Gg: ASbGncvgo+srhtU4gYHJH7/PbVHjfFZf25ShMj+Z7GIw5Z/Xq47C+5iPyS+Mo4FfZPx
	ymXdDA0NLhR4PR4C4ahhho95g+hfSPAQwUcGNmCmQG+1bI6dpZ1DqJNiCSMieBnlolydAkUulYJ
	ld72QsxWPJYS7n1ltZgzS0g0eUUF0LXIcspIPqX8dNAxmKlJKZ+jHYgTOIQi8OPp82hSAV6p7wo
	O8TV2C9zIV0OyqMXZ0Dup6ixwWEXLzHsmCCvfPOPoAvt4VX9yYLkoXhsu6wdgp1JNT7UsPnkO9f
	etIvC528nlCERwVnKj8J0o64QEej7+94fe6heRSo3T1ZBr3iVYbka0O38AvvQNdOrOJmbziodBE
	JXxqcvGjwJbybPM+F32OGEeOOVbSaUqJPwkNHOxk58UFZ0TmIuTOLJL+nbt7A
X-Google-Smtp-Source: AGHT+IHmVcOaWg336t/VgG0OW//aKmE7YjCOwXVIZ1hlLa92YU9803QfIvNvqjBNePbfTO+flKLHUg==
X-Received: by 2002:a17:903:2342:b0:28d:1815:6382 with SMTP id d9443c01a7336-290272e3ed2mr91929215ad.46.1760007466971;
        Thu, 09 Oct 2025 03:57:46 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b5137dfa9sm6632975a91.15.2025.10.09.03.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:57:46 -0700 (PDT)
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
Subject: [PATCH v7 10/23] mm/ksw: support CPU hotplug
Date: Thu,  9 Oct 2025 18:55:46 +0800
Message-ID: <20251009105650.168917-11-wangjinchao600@gmail.com>
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
index 722ffd9fda7c..f32b1e46168c 100644
--- a/mm/kstackwatch/watch.c
+++ b/mm/kstackwatch/watch.c
@@ -89,6 +89,48 @@ static void ksw_watch_on_local_cpu(void *info)
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
@@ -210,6 +252,16 @@ int ksw_watch_init(void)
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


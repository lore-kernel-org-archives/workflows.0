Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A42EA480
	for <workflows@vger.kernel.org>; Thu,  9 Oct 2025 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007501; cv=none; b=KAvplXpiAZENBtJh+z8Hm70O/xXvS+c+rU91TZ0qOsn/gW6/vBGFiiLHq7/Vb8CFnRQM+55hNjiV3CHEg7NMOxI3FuVmxGicWOv2OLKUbxcCUzKC62vhe8HY/nAmF/MGz2rLJIkYsIDnU4EZtXLDHJ9t6wsMAeo+42iHuEt46AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007501; c=relaxed/simple;
	bh=4AK69KqpFrfryQfFlxiqdszD58BNzBtZp9+AZ2x2szQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cf3p81tlpZ6qOhWibckA+e5C/QJ7xNTkyjEqRQBrdmogInUMx+hvJbIOJ+lkRmr3XkQJUVUdsrC7NkjFyXsw6ljfv8gqf3ybqwQBC+p5+Clpt/IMTaUy4XHtw303+o8E5edQGo4+veCx99aspdpA4NcXXiKYiq2wOoV1BxTv+GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdWYKoln; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdWYKoln"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so944976a91.0
        for <workflows@vger.kernel.org>; Thu, 09 Oct 2025 03:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007499; x=1760612299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyJZmUduTn6h/ct8/Xe3ui1NubLI+U0SzVd7OlZC6q4=;
        b=VdWYKolnA2VTOQLsUhqiI8EXk+CP1u6RrwI3eVOpekmX+3AvkvGi/86eZSDVMaiF6E
         LhPVwN/o4orn1jYNogeBjD3GqYverSjNm/6GwKCAjAFtKy+axBlw4R8VGza1M6V49HI/
         zZVYZVZ9BXGy6ddGsFVotUPWyO/97JSRcVVjUN2TwG2Ghp4+ltsA8AGvNhMeF+A1Qaqp
         DMg730YWzmowZr1V7SO1jdL297D9nb8t5DJlyF5XgJKA67aH90J3nXRJHR97iCTtpD+R
         d+3E5JOgdxaAkeMYF3uKHx+1P7o46tBoZWzJj6NvFaTIWLJVhby2v8nvgjWZnMrURikS
         puXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007499; x=1760612299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyJZmUduTn6h/ct8/Xe3ui1NubLI+U0SzVd7OlZC6q4=;
        b=BphN7+ff//MGJaAkcPGwgz1cuuHmT7F6OkfX4BoimOk46EZW6gu96I5gh5G/9N6ERI
         k5wuJ47BrODu7yajkwDDCkIgLgDwk2n8O2QRDKCNazo5SwRM/gSJ4tsMmshcwuhigxyF
         bR5WCLCkponyvgCFVyzbU8c9SgCJc+ReIGGnFpdMGWEwKLc9kdnYK1NMP1oEl97NczdU
         r3T/u9IWP8mYneIuFKezsUlEpKjBYhmb1iMo3kdr5PYrDgFtZ6t0NdzvsfItjHUduwgP
         d6NokzgXjW3jMEYS/GoVgrXv9cBwcYh4SiVmrlVhv48AxMfl5RS2eKB9FC2C0C9DxEPf
         CxjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSmhX+5dfaQjcJisuhPJRM1iGgs1CUbk1ZFdMVCcXDuzuJrOhPyo6FpnWKQtAH+/yPzGIoDy3cjP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJvhv5IB615v+Ngx6tEs269b5wsMxOQ3u4a9Kw2lCaf9UiL4g
	/1QJ9wSsRms3ILmRz25M9mHyUu9GuN7H+jPqVrSPYpDIfoImptsXuOed
X-Gm-Gg: ASbGnct/vIN3rZH73sCjZ+E/VIcM51KQnZNOzxtGJR6dXWEUhty3ErOpeYU16X1UKhM
	XhJvo7ZOU4SU0dQTVFXWBL+Yn0rIdCz3Er4JB7e1qwHd/XRzVGXhDjpMUkUdcNir+ZnpjZk24vl
	QGKzr1X2R/qjkGAhCSVJB9Ik8Ny6y/1+m+E+KYwM8GF2xpMPqTOE/ctCuWC6F3wbx4p2y+zq8rs
	9bGwhy4KxpCMWCGCW6l8heQ4xfcIy4SrMuUNEqtaJV6NjIaarfCYjSAwLodIo81l22C3OaXTEkG
	YSkt+wtUOfo6lNCD6N6UR1oVrR8DTjqy6lafwQhFC+J8sCle7eA328MWrIqzMsZs1kOze5yVlqd
	30oh93/z/8SMwpirxMZJF22PZmvAgKZlajHJUabVWHPYpSwRW/GWXWMHzW7acqheZQuSHCtc=
X-Google-Smtp-Source: AGHT+IF7XK4PU8M1yAqeyUxzKM38g7FsehoBLZ3eJ3Xub26Q0OuA6NSoqSKwX8dJhtbar+wuz4p6HQ==
X-Received: by 2002:a17:90b:17c3:b0:335:2b86:f319 with SMTP id 98e67ed59e1d1-33b513eb68fmr9866604a91.35.1760007498698;
        Thu, 09 Oct 2025 03:58:18 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b511135a3sm6725691a91.11.2025.10.09.03.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:58:18 -0700 (PDT)
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
Subject: [PATCH v7 18/23] mm/ksw: add stack overflow test
Date: Thu,  9 Oct 2025 18:55:54 +0800
Message-ID: <20251009105650.168917-19-wangjinchao600@gmail.com>
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

Extend the test module with a new test case (test1) that intentionally
overflows a local u64 buffer to corrupt the stack canary.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/test.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index 80fec9cf3243..012692c97a50 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -32,6 +32,20 @@ static void test_watch_fire(void)
 	pr_info("exit of %s\n", __func__);
 }
 
+static void test_canary_overflow(void)
+{
+	u64 buffer[BUFFER_SIZE];
+
+	pr_info("entry of %s\n", __func__);
+
+	/* intentionally overflow */
+	for (int i = BUFFER_SIZE; i < BUFFER_SIZE + 10; i++)
+		buffer[i] = 0xdeadbeefdeadbeef;
+	barrier_data(buffer);
+
+	pr_info("exit of %s\n", __func__);
+}
+
 static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 				size_t count, loff_t *pos)
 {
@@ -54,6 +68,9 @@ static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 		case 0:
 			test_watch_fire();
 			break;
+		case 1:
+			test_canary_overflow();
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -74,7 +91,8 @@ static ssize_t test_dbgfs_read(struct file *file, char __user *buffer,
 		"============ usage ===============\n"
 		"Usage:\n"
 		"echo test{i} > /sys/kernel/debug/kstackwatch/test\n"
-		" test0 - test watch fire\n";
+		" test0 - test watch fire\n"
+		" test1 - test canary overflow\n";
 
 	return simple_read_from_buffer(buffer, count, ppos, usage,
 				       strlen(usage));
-- 
2.43.0


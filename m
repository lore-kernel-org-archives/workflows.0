Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670733019DC
	for <workflows@vger.kernel.org>; Wed, 24 Sep 2025 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715230; cv=none; b=Wt6O6D50qS7dj+j3sguzKEZKGVYrOmkionA6pdzSmB7x8nIx0cUOVCnYxoExz2oVOvMc9xxX3AFssZJOWBG3LPXkXVDvt9RimA23X3bFx7kkNB0xi4NPjIHh9isg+rs6HLj3Shnk9votB4SewYpLgFWVEMPGAnrRhafrztoTTU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715230; c=relaxed/simple;
	bh=R6xp125ow1bKW1JfsIkJbRriGQJoDt/1TV3EwU0sun4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTsJcWM3DjRkmcJcWdFYyqYKDh7omuxQgmyBUZqdNbmjyRMFqJpaKOwv2AMgKUFFJknNFmRUWl6D5XD5duCT90CiEyiJDf0+BQgAsTpJZhJCT91ntI/4NGbG7qqu2HKd9WmLw7Zw9cAlie81zADqxfn6VHhS+KATzLLAM+tJBGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlGOT4ZH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlGOT4ZH"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so6828610b3a.0
        for <workflows@vger.kernel.org>; Wed, 24 Sep 2025 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758715229; x=1759320029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQq22tqtHC6AWIlA5VH2udrw6r/hyqmcjV7oYivMnv0=;
        b=GlGOT4ZHoVnE+Y83TwVZIQYUOLvjpr6dD6M9u0bNDFXp9xN1I4Evfc1G5wftMK3LuK
         d0J3QqNZZbFdymIQuNrpndPXP+dv1hhjKgtrQTXXtzGwHjYwzKDQUao1nykb+mZSgL9e
         aShh9BWRDOaAJXR7QxH3qEXCyFFtW7Xb9DtN36JAR8B8idu0z8m6P+PfOnQ29N5Sm6/z
         BhRLm/NQeytMUK88zIXvdRHXHRoYb4BXoCE3c0QtQWin8QUx5+GuaJ1Fax5fXK/NFTrr
         MhQ09Lwca56BDkPxnV9EGr7Xk+nD/Gy+KZpug4OEpxiDAF3b+6WxNdOm1W7brVh+1X6O
         qGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758715229; x=1759320029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQq22tqtHC6AWIlA5VH2udrw6r/hyqmcjV7oYivMnv0=;
        b=WnYLRo65ifvZIN5YDoiAZQ/GPQ9IBiFhWLaPnRN3CNfhSSZUM45Jsqti2XhPvGiwx5
         v8YidEtGqRALWXN9YHOe58dqvxve4XxSA8nVYeLt6L3EsNjLQ9Qq8ifbm13ofMCbFlWU
         ec/dL3CqzJ1Gk7fdNByDN4fEAsmXboj3PEL/2c+4Ku22hwiib59Rii8ubJU/p00fLggS
         x9agyOAI8+HTLLM9OKLKxxZpOF+zlLjXnfCzkFFK+M2bM+pApKNyVRV7kb5GcSBmRIRX
         /44B9J0QGhySALaK5o7AzBBt7XCRvB4SopFIF8FrjKYiGig6OMIbOPN4wVl+c50kAyRM
         9qCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs6eHiE8nfVcapem7hdw7wq2bvAqoc6TMpgO6PFClR0nMkc7LMV7Zg0vs1b2BPjSZQAT6M7DauwjU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzke+kWRnixgs1NGB+vlMCmyiJ2zr3SEPKpy1gzfQzZupC3nXdJ
	H1QrEUZ+8PVI20kPNvR/c6+5VEgWd5m9JSAZXXun3zXYfWaCeKYHnv1S
X-Gm-Gg: ASbGncuyNjg7lfyrn5rRKxrvjBRZ1z1iGoX8atfMI2f/m+EVF5pV33vuY9JVhWUzl81
	0+QEJUKWD7zE0rAUi04jz7X07+MpMfacu0UNYE5xEM0RqHYJBufi52XtNtzM7yOWhyh2HHOVvFl
	uu6ubUqOOT7RbYfjUmIs+Mtb4EWuPUCaMCOfgvp91XlDdVrkAlZu5R/0ato+chlj8MOSHceYIjs
	W3/rnUaZ6RMl7WA91+QgmOmOGdkz+aMMiVSmUNIlwWCasGe39wlQmJ0iQMYotW9wwQSgNnnGiUT
	r8ZrN0RNfwnkR+FVyQI3nUALIScBL9n6jjTc1XBO0Evn+wvQOUQn1KsqydRM2sq1lwAKNME0Wz5
	qSaCJgAYzD0zRzdsjtdnujEWJoztmD3xZug==
X-Google-Smtp-Source: AGHT+IER+rSrafrjBOU/UPseufgUtgk4gzgFmMfLFbtCFl+/VmATfZlwQN/yKimg3zCqXqji+7ttQw==
X-Received: by 2002:a05:6a21:338a:b0:2b1:c9dc:6dab with SMTP id adf61e73a8af0-2cfef7df0b2mr8342943637.48.1758715228483;
        Wed, 24 Sep 2025 05:00:28 -0700 (PDT)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2fdfbffesm9620110b3a.73.2025.09.24.05.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:00:27 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
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
Subject: [PATCH v5 18/23] mm/ksw: add stack overflow test
Date: Wed, 24 Sep 2025 19:59:24 +0800
Message-ID: <20250924115931.197077-3-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924115931.197077-1-wangjinchao600@gmail.com>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
 <20250924115931.197077-1-wangjinchao600@gmail.com>
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
index 1ed98931cc51..740e3c11b3ef 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -43,6 +43,20 @@ static void test_watch_fire(void)
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
 
 static ssize_t test_proc_write(struct file *file, const char __user *buffer,
 			       size_t count, loff_t *pos)
@@ -66,6 +80,9 @@ static ssize_t test_proc_write(struct file *file, const char __user *buffer,
 		case 0:
 			test_watch_fire();
 			break;
+		case 1:
+			test_canary_overflow();
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -85,7 +102,8 @@ static ssize_t test_proc_read(struct file *file, char __user *buffer,
 				    "============ usage ==============\n"
 				    "Usage:\n"
 				    "echo test{i} > /proc/kstackwatch_test\n"
-				    " test0 - test watch fire\n";
+				    " test0 - test watch fire\n"
+				    " test1 - test canary overflow\n";
 
 	return simple_read_from_buffer(buffer, count, pos, usage,
 				       strlen(usage));
-- 
2.43.0


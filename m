Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245E43002C6
	for <workflows@vger.kernel.org>; Wed, 24 Sep 2025 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715242; cv=none; b=ZIHTHWAjXvQFPVPxa7b77hlNlaA0pV/fcX/6YlrHCPEBW3J/zuDKnV50nIbLijSwssg7tpWg2PTWQwa8YTDKcRLwLWp+Ic3UXTSKv+UbbJC/NIKeNuACXji0830eo1BU9e3dQ9+zwaJLnDMORuVewX+eiMtr19CV8NCl/kZsTm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715242; c=relaxed/simple;
	bh=+T+aPb2vGauRNGojB13OG2g6M5SIRQLwY2pYS1UkpTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cj+vJuzUCMZHwh0a+b/SuBJk+vLIAdIJjO3aDcFYoJ8wVd6o7O1Ea4MTaTMGHrqt2aMnR2ZpZIl6e2axxWXnXZZjjVfcShwVG62qw9ZcaTT4GuyoNg2St7rWYpzdSXRSq3T//nQ11AHJ8UtmhdlC575yD1oV1g7QgTOlpQW/9I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTnBO0lj; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTnBO0lj"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b5516ee0b0bso3815170a12.1
        for <workflows@vger.kernel.org>; Wed, 24 Sep 2025 05:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758715240; x=1759320040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NT8+IPFZig8CTJZJveFgxRKV2ZOTWE6XU6N/gZkl8A=;
        b=WTnBO0ljGGmncLTIXNWfJexi37yaHjwP5hfvyvlkjntQC6J1whTuLQfLSk0tgcmJHY
         WL5pWI18Lu6Q1B5FnbIYNNfRvlp9urfoa+u5CvB4/6hX+k4/ZarSpI9as0p0O9w3Fp1I
         gm8dYQ2Inv3HOsPFMYXuwr3QAM1NCGpzXI9ibe9EbCrQmZULMA1RE65wX3AgSzVCkNBp
         9EuR0KYl04zFbz36XD17/GQ+LHWRsB6Gqjz9CcM8w0ApD3qJ0m8o4yBvPDE/NcTkTceo
         HaYpYHfq2ZpxoU3uQ/L7vTJgIbVceKpK0zlP8OF3JKG49/VYzsbmqsssAg+Z6CUA0rEx
         7BfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758715240; x=1759320040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NT8+IPFZig8CTJZJveFgxRKV2ZOTWE6XU6N/gZkl8A=;
        b=TQynJZxRx4dTUMVZBxKBohoDmjofJyulyEKuaHiD563//9C2QbtBoq4RwCOpPdIJ85
         NUJNcfoj76/v7ikoJSV3XqgVXhrnW0sL0WNludOOHltGo3wdbMyH8TQQu0sfz1LN3CU4
         Rm+t8s/5GjR3+aLLbIZtirUAasro5abERKU+bDKJ9XyUt6Xo41ltNptYFwbAx6XOgxnM
         ZgvTgWfDXX3lN+G9pbKTIfadpYtth/e3mjERsKFYEGsDFoMTmIn3v6Dbo8ZQtxZyeyLl
         a7c3yIw1hYq5XOPKE0tnojD5UWY2SKDyKSKfwpYK66h3QUliRZzsTu5JnXN+qURJ14yj
         HmrA==
X-Forwarded-Encrypted: i=1; AJvYcCVkWMjKruSgMnioduA/1GssPnfnW9/RKSMdneX2J/Fw2gqcxHjTq/e2wZC6mWhNKB4Vuye/EnCMM4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeCegqCmoyQSX1FoXOGCsITAdF/HtacgMLNcTMAnk3p7dIMzVa
	HnlGyG1PyALqEAqc96F0Meod4lmK/zCSZkEEMAM81xehVbjorD/XYrvt
X-Gm-Gg: ASbGnctX9IPoJO0JSAvSVlpzxWTfqrD6KzdzsUpNeJ8hz0Hy/TuL5J2lk6mEDEbaOq4
	oiaFoMEead0RWt9JKI5a/ZU9ryEZNTL9+RSWtFj+SRuFGzfDxCf0qx/23GBzV7E2N7MAWNPhY95
	3WFdk1/IXzrKRZ8HvyFpIV6rz5oDrA0CAE3HBu1EdLUMKah1FF7/c+7QDz+88uT3EwUmNZ59nLW
	gPC0LdddXLbrxXOQwwICi7kM9BC7AP38b8gkkyi4qc+pmr0foZaZRc/xw280Bm/mSqOqtB7EnPk
	Jozxy+rcmMn/DSxLMCZtPVWvhWuVFts9Vgj4ieG2xreETZOElfAxj9PJFQPPMvIK2W5vlKXwYVT
	ejED4Hhas4wleUlKfDB1ek6A=
X-Google-Smtp-Source: AGHT+IGJCq+xdBPSr2vtJBFYvbOJmXpJTBrhRvUSRvlU56ancTzpxVdVezOYXQvlboR8hlHSETgwdw==
X-Received: by 2002:a17:902:e5d0:b0:267:a231:34d0 with SMTP id d9443c01a7336-27cc5623567mr72404795ad.42.1758715239864;
        Wed, 24 Sep 2025 05:00:39 -0700 (PDT)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800531e8sm191473635ad.29.2025.09.24.05.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:00:39 -0700 (PDT)
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
Subject: [PATCH v5 20/23] mm/ksw: add multi-thread corruption test cases
Date: Wed, 24 Sep 2025 19:59:26 +0800
Message-ID: <20250924115931.197077-5-wangjinchao600@gmail.com>
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

These tests share a common structure and are grouped together.

- buggy():
  exposes the stack address to corrupting(); may omit waiting
- corrupting():
  reads the exposed pointer and modifies memory;
  if buggy() omits waiting, victim()'s buffer is corrupted
- victim():
  initializes a local buffer and later verifies it;
  reports an error if the buffer was unexpectedly modified

buggy() and victim() run in worker() thread, with similar stack frame sizes
to simplify testing. By adjusting fence_size in corrupting(), the test can
trigger either silent corruption or overflow across threads.

- Test 3: one worker, 20 loops, silent corruption
- Test 4: 20 workers, one loop each, silent corruption
- Test 5: one worker, one loop, overflow corruption

Test 4 also exercises multiple watchpoint instances.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/test.c | 178 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 176 insertions(+), 2 deletions(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index 08e3d37c4c04..859122bbbdeb 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -17,11 +17,12 @@
 
 static struct proc_dir_entry *test_proc;
 
-#define BUFFER_SIZE 16
+#define BUFFER_SIZE 32
 #define MAX_DEPTH 6
 
 struct work_node {
 	ulong *ptr;
+	u64 start_ns;
 	struct completion done;
 	struct list_head list;
 };
@@ -30,6 +31,9 @@ static DECLARE_COMPLETION(work_res);
 static DEFINE_MUTEX(work_mutex);
 static LIST_HEAD(work_list);
 
+static int global_fence_size;
+static int global_loop_count;
+
 static void test_watch_fire(void)
 {
 	u64 buffer[BUFFER_SIZE] = { 0 };
@@ -72,6 +76,164 @@ static void test_recursive_depth(int depth)
 	pr_info("exit of %s depth:%d\n", __func__, depth);
 }
 
+static struct work_node *test_mthread_buggy(int thread_id, int seq_id)
+{
+	ulong buf[BUFFER_SIZE];
+	struct work_node *node;
+	bool trigger;
+
+	node = kmalloc(sizeof(*node), GFP_KERNEL);
+	if (!node)
+		return NULL;
+
+	init_completion(&node->done);
+	node->ptr = buf;
+	node->start_ns = ktime_get_ns();
+	mutex_lock(&work_mutex);
+	list_add(&node->list, &work_list);
+	mutex_unlock(&work_mutex);
+	complete(&work_res);
+
+	trigger = (get_random_u32() % 100) < 10;
+	if (trigger)
+		return node; /* let the caller handle cleanup */
+
+	wait_for_completion(&node->done);
+	kfree(node);
+	return NULL;
+}
+
+#define CORRUPTING_MINIOR_WAIT_NS (100000)
+#define VICTIM_MINIOR_WAIT_NS (300000)
+
+static inline void silent_wait_us(u64 start_ns, u64 min_wait_us)
+{
+	u64 diff_ns, remain_us;
+
+	diff_ns = ktime_get_ns() - start_ns;
+	if (diff_ns < min_wait_us * 1000ULL) {
+		remain_us = min_wait_us - (diff_ns >> 10);
+		usleep_range(remain_us, remain_us + 200);
+	}
+}
+
+static void test_mthread_victim(int thread_id, int seq_id, u64 start_ns)
+{
+	ulong buf[BUFFER_SIZE];
+
+	for (int j = 0; j < BUFFER_SIZE; j++)
+		buf[j] = 0xdeadbeef + seq_id;
+	if (start_ns)
+		silent_wait_us(start_ns, VICTIM_MINIOR_WAIT_NS);
+
+	for (int j = 0; j < BUFFER_SIZE; j++) {
+		if (buf[j] != (0xdeadbeef + seq_id)) {
+			pr_warn("victim[%d][%d]: unhappy buf[%d]=0x%lx\n",
+				thread_id, seq_id, j, buf[j]);
+			return;
+		}
+	}
+
+	pr_info("victim[%d][%d]: happy\n", thread_id, seq_id);
+}
+
+static int test_mthread_corrupting(void *data)
+{
+	struct work_node *node;
+	int fence_size;
+
+	while (!kthread_should_stop()) {
+		if (!wait_for_completion_timeout(&work_res, HZ))
+			continue;
+		while (true) {
+			mutex_lock(&work_mutex);
+			node = list_first_entry_or_null(&work_list,
+							struct work_node, list);
+			if (node)
+				list_del(&node->list);
+			mutex_unlock(&work_mutex);
+
+			if (!node)
+				break; /* no more nodes, exit inner loop */
+			silent_wait_us(node->start_ns,
+				       CORRUPTING_MINIOR_WAIT_NS);
+
+			fence_size = READ_ONCE(global_fence_size);
+			for (int i = fence_size; i < BUFFER_SIZE - fence_size;
+			     i++)
+				node->ptr[i] = 0xabcdabcd;
+
+			complete(&node->done);
+		}
+	}
+
+	return 0;
+}
+
+static int test_mthread_worker(void *data)
+{
+	int thread_id = (long)data;
+	int loop_count;
+	struct work_node *node;
+
+	loop_count = READ_ONCE(global_loop_count);
+
+	for (int i = 0; i < loop_count; i++) {
+		node = test_mthread_buggy(thread_id, i);
+
+		if (node)
+			test_mthread_victim(thread_id, i, node->start_ns);
+		else
+			test_mthread_victim(thread_id, i, 0);
+		if (node) {
+			wait_for_completion(&node->done);
+			kfree(node);
+		}
+	}
+	return 0;
+}
+
+static void test_mthread_case(int num_workers, int loop_count, int fence_size)
+{
+	static struct task_struct *corrupting;
+	static struct task_struct **workers;
+
+	WRITE_ONCE(global_loop_count, loop_count);
+	WRITE_ONCE(global_fence_size, fence_size);
+
+	init_completion(&work_res);
+	workers = kmalloc_array(num_workers, sizeof(void *), GFP_KERNEL);
+	memset(workers, 0, sizeof(struct task_struct *) * num_workers);
+
+	corrupting = kthread_run(test_mthread_corrupting, NULL, "corrupting");
+	if (IS_ERR(corrupting)) {
+		pr_err("failed to create corrupting thread\n");
+		return;
+	}
+
+	for (ulong i = 0; i < num_workers; i++) {
+		workers[i] = kthread_run(test_mthread_worker, (void *)i,
+					 "worker_%ld", i);
+		if (IS_ERR(workers[i])) {
+			pr_err("failto create worker thread %ld", i);
+			workers[i] = NULL;
+		}
+	}
+
+	for (ulong i = 0; i < num_workers; i++) {
+		if (workers[i] && workers[i]->__state != TASK_DEAD) {
+			usleep_range(1000, 2000);
+			i--;
+		}
+	}
+	kfree(workers);
+
+	if (corrupting && !IS_ERR(corrupting)) {
+		kthread_stop(corrupting);
+		corrupting = NULL;
+	}
+}
+
 static ssize_t test_proc_write(struct file *file, const char __user *buffer,
 			       size_t count, loff_t *pos)
 {
@@ -100,6 +262,15 @@ static ssize_t test_proc_write(struct file *file, const char __user *buffer,
 		case 2:
 			test_recursive_depth(0);
 			break;
+		case 3:
+			test_mthread_case(1, 20, BUFFER_SIZE / 4);
+			break;
+		case 4:
+			test_mthread_case(20, 1, BUFFER_SIZE / 4);
+			break;
+		case 5:
+			test_mthread_case(1, 1, -3);
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -121,7 +292,10 @@ static ssize_t test_proc_read(struct file *file, char __user *buffer,
 				    "echo test{i} > /proc/kstackwatch_test\n"
 				    " test0 - test watch fire\n"
 				    " test1 - test canary overflow\n"
-				    " test2 - test recursive func\n";
+				    " test2 - test recursive func\n"
+				    " test3 - test silent corruption\n"
+				    " test4 - test multiple silent corruption\n"
+				    " test5 - test prologue corruption\n";
 
 	return simple_read_from_buffer(buffer, count, pos, usage,
 				       strlen(usage));
-- 
2.43.0


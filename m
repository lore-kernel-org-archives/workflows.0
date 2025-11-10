Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFCC327206
	for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792712; cv=none; b=jNUGsrMIjgMf6JFGwc6cXcMoJjO2iQFqXH8iLdeYMEDlKaIwVvtR7AWe9jvBZj3ZkAz7Qy0VTufCoEO93zwkKL9zlA+0xF+qb8QaRxWOGtatlPJwvXV8GEh6k75ZVTg25PF4oj8/rnzeyIYPmwW5k3Rs+lAbkSM2aIpKf4GqOpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792712; c=relaxed/simple;
	bh=NfGEbJbI2JFov2jJzKiHrfTCu+bputoxbrgn4T4KCZQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlO3f+4XxVhJavOzq7GiZavQYNhPXngAC5Z0XWIf3TB0A5OtqQOlTfCUzDxrDMf0ANYnLNvdV27K0FxYzeuWxoV+D5ony8rsncxGMPusFqSKNglnMuVCtvtRkTSM648TX12dDECrJWwmLVnqOdrceyBi7G5bzjph/0K02vvwZ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L+NsIW10; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L+NsIW10"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b6ceb3b68eeso2005464a12.2
        for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 08:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792709; x=1763397509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/i9Y6D84AcwkcQizXylWnD304yGUpX7AGwmA82BxIzc=;
        b=L+NsIW10VFItrQxtlYCR/vbCh0Y0OxL7z3gkwLWeaUmZZiV6RvmEP6YN35GUxlfrIS
         yYfRW5ijSNQh8ck8gIwlF0OSMW2W8A8Fl15Jke4tfDPWTN3aozRNUW/xy82m5Rtpn7v0
         msORlPpMNYhRU9QVx/HTdqGeeh7/KQKbKaMpy68JUS2VYw0AfbouawfEGjDdHvoNAXYN
         w59al5JF34eGNCpt485S7m5zOVytE/PTO1P5rL1SvDmAorw5ZpKwHkJbWyzu/501VV0Y
         +axIHfUBz4zDbPxk2409I9llMjJx8VGPWC4TBcJrixGdp2WmDKnoNTargfAanc553d9E
         LToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792709; x=1763397509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/i9Y6D84AcwkcQizXylWnD304yGUpX7AGwmA82BxIzc=;
        b=E9VoPCUnEvkuXWqWRkHi2glRNk9xn2/bJmx+SviE77a4KdOIwmMar/OfvgkG0jvy3Z
         vO1QIfkNsYAAlXlsFDP8R22XVUlR/Ex489twNzhnjZUYdfCZT8ucK2f2we8kYQFCsSST
         BGkG4w3TIvIEFklPUkWdo7qtSKTg3enXqo6TycqMkxrPU8VmDqf0bM3ksd6E8nEj7w6k
         EgMk9xXu0lttLbM+1e7Kgtv0vHCqLXEY4zzpyB94gI2wpGgmIDWYb9dvQydXmYUhHMvA
         9F4YbIM+PQkQSInqpdin5NUbbMJwUmH//9mPBpk9oENF9XhQ+fxrYYD/yGIAKUoYFM0S
         W6gg==
X-Forwarded-Encrypted: i=1; AJvYcCU0MhTLZIQ4a9H7g+4nOj1KAvbpsJrfNJmGE5SaSENJI01zzabo29Yzb9Yu+HOcWDKfh1gPNJBRiak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfy9yrLpy7EQ4ciaxNHKtE19OJjSrCEkpI3tVDzLboZamS8Wiv
	NjVTBA3byD0N71mtnm5PhLh9V9qnMYTzUZpetI7/h1JetUXsmfh8L5CK
X-Gm-Gg: ASbGncv5QbY8GwW3sto2QnFphVvdMGRNxWq6Ou3nGwgAlk+c3TvILFY+18R4mBd2rbM
	lGuz+sBXYc3QyPhLQegocQ5Zfbr01a270msR9IVBAo/6Z3uryfgck7uOZc8ioxPn7XWh/DYH0Ox
	C1hpOfsmsx0TAsK9FfrvePkpPN6zzmAnqlEDrGQzdAFRLOK4DpVD6IFMjjEEUSxcVw7Re5+NKMf
	OKvUBGqwECnydeAks8a7i6g2/XOcaxOp9kJj5l+YL+zLnoA15E7t0AmfV6q6udZJfU8KeHxU4L/
	LXqOZ4a7wBeCFQcrqzaaKC09ziqYzEBuJY5xL/xpFnm2ZKizTCmCfGOggSVyMgKfgSOgMifX2yv
	Ftfk/JvzyUMWwJYN0MhTaC9EUXEdkvQxbDN41WAEv4JsSKxGpQSYTkuB+pabG7RssDSSmKTrN0Z
	ItEavUD/7mQPKxRHgs4oMzBw==
X-Google-Smtp-Source: AGHT+IGGLWsP+rKIukfYRL1IHqALzr1SjL54Nbxq/1zFc3pjrCTHbWmU7///o0j0mRvG3+5kbWDS4Q==
X-Received: by 2002:a17:902:da4b:b0:295:512f:5060 with SMTP id d9443c01a7336-297e540dc24mr116769525ad.7.1762792709436;
        Mon, 10 Nov 2025 08:38:29 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ccec04sm151070875ad.102.2025.11.10.08.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:28 -0800 (PST)
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
Subject: [PATCH v8 24/27] mm/ksw: add multi-thread corruption test cases
Date: Tue, 11 Nov 2025 00:36:19 +0800
Message-ID: <20251110163634.3686676-25-wangjinchao600@gmail.com>
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

mm/ksw: add KSTACKWATCH_PROFILING to measure probe cost

Introduce CONFIG_KSTACKWATCH_PROFILING to enable optional runtime
profiling in KStackWatch. When enabled, it records entry and exit
probe latencies (in nanoseconds and CPU cycles) and reports averaged
statistics at module exit.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/test.c | 186 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index 1d196f72faba..4bd0e5026fd9 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -19,6 +19,20 @@ static struct dentry *test_file;
 #define BUFFER_SIZE 32
 #define MAX_DEPTH 6
 
+struct work_node {
+	ulong *ptr;
+	u64 start_ns;
+	struct completion done;
+	struct list_head list;
+};
+
+static DECLARE_COMPLETION(work_res);
+static DEFINE_MUTEX(work_mutex);
+static LIST_HEAD(work_list);
+
+static int global_fence_size;
+static int global_loop_count;
+
 static void test_watch_fire(void)
 {
 	u64 buffer[BUFFER_SIZE] = { 0 };
@@ -64,6 +78,164 @@ static void test_recursive_depth(int depth)
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
 static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 				size_t count, loff_t *pos)
 {
@@ -92,6 +264,15 @@ static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 		case 2:
 			test_recursive_depth(0);
 			break;
+		case 3:
+			test_mthread_case(1, 20, BUFFER_SIZE / 4);
+			break;
+		case 4:
+			test_mthread_case(200, 1, BUFFER_SIZE / 4);
+			break;
+		case 5:
+			test_mthread_case(1, 1, -3);
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -114,7 +295,10 @@ static ssize_t test_dbgfs_read(struct file *file, char __user *buffer,
 		"echo test{i} > /sys/kernel/debug/kstackwatch/test\n"
 		" test0 - test watch fire\n"
 		" test1 - test canary overflow\n"
-		" test2 - test recursive func\n";
+		" test2 - test recursive func\n"
+		" test3 - test silent corruption\n"
+		" test4 - test multiple silent corruption\n"
+		" test5 - test prologue corruption\n";
 
 	return simple_read_from_buffer(buffer, count, ppos, usage,
 				       strlen(usage));
-- 
2.43.0


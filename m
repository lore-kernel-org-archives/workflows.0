Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6B52EB5A3
	for <workflows@vger.kernel.org>; Thu,  9 Oct 2025 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007505; cv=none; b=nXP3qQQ6KnRCa+tJEikAqRG03RsNUY//BwWH+qtdXq+jgTKjgPcuCIhkRLUjrXcf2RNs0djqwm9PrMJxvghRDdYbu0DWHFVU5TwttYohj6dMImzb2xVpbxiO7FCNo/dhHVnVY7L0iqiohz/qUAZC4NF5A8sXzvmTnJwoES3FzWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007505; c=relaxed/simple;
	bh=WUmvecag/bRJ9LbEABvkcHBuLoUzQ3sY4/EKuJYpRQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E0fW+M/ql6Q3iW1ckhsAMFpWKIyL/OOidoghc93CSNQrV5U/eUz6bUK4d2nCLam2DR0OduiF1TOGL0Cu8CnQ39ZZdQy7PFQlJ/A8VOebh2OS7iH3VFJL6jpDpJzBqwpWxSJX0H01hYs7qWIh+FZ1RItMUBppguG6yxuRTdxJGuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdyPi9xM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdyPi9xM"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7930132f59aso1153304b3a.0
        for <workflows@vger.kernel.org>; Thu, 09 Oct 2025 03:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007502; x=1760612302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANupiyfNlS++I01zMHP5Qbsc6Wgfn8wZLgNnwRsiWjA=;
        b=LdyPi9xMf0sABMXQbkJkxOyOHY1pmx92/10n9G7R2kH8tbO5DWwG5Viwdzo+5YUEtp
         npdE+fGvIdaHiTgyEA7wsK16gCtyIZHxj/qHN/nFIb69mbwr8vPV7VC4K0cLmLBFPKFf
         slVJxE+cRafJLgXAU//jcRlxGvvmsEYlzto4Iup6JtkTb8WQ3s3TYSLpzDWXbVqnbyVm
         mfILpsPXKyHGtD3C1OSqkzV7Fypd82SNCILp6RrJY/VjbrS0tc6VNj6qyewTRRr52wCw
         Kh42cNJd37U9CpHK7+XnpwDKIy+ANb53c4EF2t9/B8BTakyTNOQNKWyRcY0zmf2xwD59
         3qPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007502; x=1760612302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANupiyfNlS++I01zMHP5Qbsc6Wgfn8wZLgNnwRsiWjA=;
        b=fqIcJ4gAYwvi9B9ESrPVrVtGMJTg/NrP5rArD9EMYtPIVUQVD4C7UlDz5yrPicetca
         a7jX3cH7t59Hn4f7TtwxTEZ7ZEa4VBho43GD2cUCgulZzmm3RzbB6ZrmRj9iMAptne2B
         VD+AjXRh+RbRaVVbCz4Pv0NJjBz+JnOOEedbuVgMezhd3Dao7gbsD9r6lnqoPyScHVVO
         8oNndyQp+e2BYvUeoTtYQuZ7jG6klc9hnYDhlktRT9xQDpPE1NqKbq1tLaqDKu4nTyUi
         HN7R72QCDeGzm3WVXT/Y2plOgBiIpGgytgvviW7nwpS9z82iLwwpNqHB7FVaWjGKMJl6
         pt9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZxkzJCwiqbIiANZQoMIFRD2RPysRrjTjTrvCXbWij4CEKqkNRS904ljSH8yqD0TzxseOYzHtTvEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZWQw2wVg926b6FTDZsyzW6QblN5MgwAXdwsXqa70elV7gomXE
	4ywT4OHFXPNx6vafkWqf4ULR55Tx8XlxH3oEDEVye3rJ/ObD1U0IL2K4
X-Gm-Gg: ASbGncstF3tIAFLWtR2qa4/UaoUqi5WHlpRdbI8rjcJe96GuSgMiuDYENXHUOQjTuSf
	h+vgNoh+tUJfm7Rmf28HnPgOKr6JuY41LGsl5auREmhSi/o5vhNROPH8gZqOk81mCzXmskD0p36
	YGeZ19Phh/GjOMU7ZmMuermoQmfOWsdu4drUu48uk7h7AX+AZCjtThMiObJaAvIR+IFgbsZXQWN
	DcCBd1QNjUx6L9Ydo8zF2b+M/sLaEi02EGfcVz8tcwSZ+W3rzU41HWvFazDhmx0dYoN+V3KdCr5
	Ynbn38p+pgqeDcDGgR4GbmxWm4MQpQ+fdvVdF9oo3WbwqxBxvhne0yvm0aw+9OeiINu2zihtO/u
	C54Sb/CpKvO9eZuV9l9hSs09fx2P7fvQzTQU68bWxKXNMFHJZ2vhaDr/6zL+bDwKrZllak5A=
X-Google-Smtp-Source: AGHT+IGL1hfkw824Dhg5abUxp0YVqhv+dnuC2o95edaELXUy1UgmRHSa3+FhXmUlSur2PmpUVijsqA==
X-Received: by 2002:a05:6a00:2d96:b0:77f:1d7a:b97f with SMTP id d2e1a72fcca58-7938782ac68mr8582957b3a.28.1760007502437;
        Thu, 09 Oct 2025 03:58:22 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794e33f0cb3sm2487606b3a.78.2025.10.09.03.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:58:21 -0700 (PDT)
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
Subject: [PATCH v7 19/23] mm/ksw: add recursive depth test
Date: Thu,  9 Oct 2025 18:55:55 +0800
Message-ID: <20251009105650.168917-20-wangjinchao600@gmail.com>
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

Introduce a test that performs stack writes in recursive calls to exercise
stack watch at a specific recursion depth.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/test.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/mm/kstackwatch/test.c b/mm/kstackwatch/test.c
index 012692c97a50..203fff4bec92 100644
--- a/mm/kstackwatch/test.c
+++ b/mm/kstackwatch/test.c
@@ -18,6 +18,7 @@
 static struct dentry *test_file;
 
 #define BUFFER_SIZE 32
+#define MAX_DEPTH 6
 
 static void test_watch_fire(void)
 {
@@ -46,6 +47,21 @@ static void test_canary_overflow(void)
 	pr_info("exit of %s\n", __func__);
 }
 
+static void test_recursive_depth(int depth)
+{
+	u64 buffer[BUFFER_SIZE];
+
+	pr_info("entry of %s depth:%d\n", __func__, depth);
+
+	if (depth < MAX_DEPTH)
+		test_recursive_depth(depth + 1);
+
+	buffer[0] = depth;
+	barrier_data(buffer);
+
+	pr_info("exit of %s depth:%d\n", __func__, depth);
+}
+
 static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 				size_t count, loff_t *pos)
 {
@@ -71,6 +87,9 @@ static ssize_t test_dbgfs_write(struct file *file, const char __user *buffer,
 		case 1:
 			test_canary_overflow();
 			break;
+		case 2:
+			test_recursive_depth(0);
+			break;
 		default:
 			pr_err("Unknown test number %d\n", test_num);
 			return -EINVAL;
@@ -92,7 +111,8 @@ static ssize_t test_dbgfs_read(struct file *file, char __user *buffer,
 		"Usage:\n"
 		"echo test{i} > /sys/kernel/debug/kstackwatch/test\n"
 		" test0 - test watch fire\n"
-		" test1 - test canary overflow\n";
+		" test1 - test canary overflow\n"
+		" test2 - test recursive func\n";
 
 	return simple_read_from_buffer(buffer, count, ppos, usage,
 				       strlen(usage));
-- 
2.43.0


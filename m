Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911B830E0F1
	for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 16:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792633; cv=none; b=tZFFtznznpiWKJDwGX3kLBmEUUhwmZmxbDPYjCSFLIjSutTiZTHzIU2T0x7slaNhWXbnreOGOkHrS/iowgpnldHS0EaHO3aFMytaXJTgOpvOfg4QKAO78jRVKDUGsS/eij2Y9Sn7v63MnHntFpR6FksvNGfVlWwOfokGhs7ISEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792633; c=relaxed/simple;
	bh=Ima2e4/C5WqdeZyYCnDIwbDgz9ZYOLESM4kickHutQ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwXyTvw6TDWLRs7XGubBxFs/bkx+XIHzHGggKTioN42lyCKFFHpyZg2n2Bl3Xqblo2URHGXNWlIOZSdij1CUNmb+G+xaUz3UtuGXJEqkm5fVjSVpC1EK83OuDGFyHoP2uMz+vfo0XaX07Mi9PvJaIF+tEe3J7C2z1+pDjMLKKeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSIZCYhG; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSIZCYhG"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-295247a814bso41649885ad.0
        for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 08:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762792629; x=1763397429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDpE0CvbPiS95CD/e7bDhFl1FHfdcNhWeVLe6GjR39g=;
        b=PSIZCYhGt4Dd7vdyEl0mOkvONblClWeuS4QZ5ZGZ0MedDHaXvNpz8ADNwK6qenO/nl
         Pb/UnAJOqDscQSNuGq5DvTveWqzQNJRjZR74EfcpeSq51CYCe8HZQf1eSXkClT3lN4v5
         jDA4Uf1eMXEwoFGNz7xw5vivscquUJFUyP3J6VHHZKqUBpHtJy+DPu7PXVAYSUuoVyJP
         aB4usMrzfDrouMV5Cvutjl1EAzaR4YDI8xNeDhDMscnv5m1YQVAjiAs0jvblEGrrVfpv
         i1/D/oTtCvkXRE+Waa0EpWEcbdCvHLnzoFCbgrWsj1I31g3LKULWa5rQBUPlBE/yXd+A
         DXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792629; x=1763397429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RDpE0CvbPiS95CD/e7bDhFl1FHfdcNhWeVLe6GjR39g=;
        b=HWLQHmuL1LoW1cPwFBV6Ge4RoxnOTlxNpH6hSSVlsOgKyeY4ZzmnxuaYH8OjZAosnQ
         8bAOCliIKd+rdcYTWU/Xj1LLY27svykaCSbAU0kty721Eou6CxUvUb38pUQWinem/exq
         gqrDk7DDTh4xnV/7gFdAqq+cMzyX37nmP0yjFt9+Tyt+uX+HvPq1iUXNl+8SLoqbuzZZ
         gBJtqfOLiMB26svcPgTgAaSGGL/WjGOKiBWG+8gDjRaZHWDGxMa5RaVFGJHkDsJAIIw+
         2zFqtLM28sppMGlm77qmaVW0jva6Q+xsQuBGQAJ0McIuVoz/c37FncIntBNHg6bGwSLj
         UcAw==
X-Forwarded-Encrypted: i=1; AJvYcCUiqICI11tC05H6N18gaDhLFGkFlY6XIJ81tX6+uUapA5FiYnCvVYz3bqJEt93VRIChnwbM5svQ2iM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWFSxgseQGQLfOgJOUtHnQNwOCbifuHpc5oFlGujEvrO2dA6xu
	VL5Hut9FkLPtYQRjryEfxzcTx4R04Qs8oP3lOLrKZIknY1nJmUbGQ7kW
X-Gm-Gg: ASbGncvYUIOn+1uDB08vYvDi91YECG7y0T9GWEhBpJDQuq5sZOfMBwamDoAAQZvpx9g
	KvFEnmOebCoL1XMHFz31mdACCC60L+uJrIui7PGDmFNbqjp4myNmqOcRG6IgF8m2QcVhLf0VQl3
	Auv+/bG8RQhwUnovMgeBntdMUC03EsovSr1f960AuwiohwGlewGdCX04l4lgbrQdsAm0cmjvJNx
	XpgdU57aup/XDWYbj1WmdlvjX9X/76BEayicb77RG8lvjSgq1/FNnPhbPhgP4qmN3kugPt6DDu8
	fwlTu+ihLVlSlRWags2YI1UGSkRqip1PwFmpJUOVkWPgYxHWxCh9IvyvsKuO7HZql6DrugOp8ii
	Agl2Bgqb1GHIQSgZqadgqZyH1IKfNW2i7yPlxpGA7dzNGCBKtsGxuNmSRo0jc2dyQ78wTmvQGFv
	rUhYo5jhrPllbGf9cl4+vrSA==
X-Google-Smtp-Source: AGHT+IHLWcFC7W3aH7MtEyBpRAAfyoGWF1TXnIybIjXPJD9gYvIPg0ozGaDjCXeoqvDbHEVRJoG18g==
X-Received: by 2002:a17:902:d481:b0:295:9b73:b15c with SMTP id d9443c01a7336-297e56f9c21mr125602655ad.42.1762792628683;
        Mon, 10 Nov 2025 08:37:08 -0800 (PST)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5ce87sm150073335ad.29.2025.11.10.08.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:37:08 -0800 (PST)
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
Subject: [PATCH v8 06/27] mm/ksw: add singleton debugfs interface
Date: Tue, 11 Nov 2025 00:36:01 +0800
Message-ID: <20251110163634.3686676-7-wangjinchao600@gmail.com>
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

Provide the debugfs config file to read or update the configuration.
Only a single process can open this file at a time, enforced using atomic
config_file_busy, to prevent concurrent access.

ksw_get_config() exposes the configuration pointer as const.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 include/linux/kstackwatch.h |   3 ++
 mm/kstackwatch/kernel.c     | 103 ++++++++++++++++++++++++++++++++++--
 2 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/include/linux/kstackwatch.h b/include/linux/kstackwatch.h
index dd00c4c8922e..ada5ac64190c 100644
--- a/include/linux/kstackwatch.h
+++ b/include/linux/kstackwatch.h
@@ -35,4 +35,7 @@ struct ksw_config {
 	char *user_input;
 };
 
+// singleton, only modified in kernel.c
+const struct ksw_config *ksw_get_config(void);
+
 #endif /* _KSTACKWATCH_H */
diff --git a/mm/kstackwatch/kernel.c b/mm/kstackwatch/kernel.c
index 50104e78cf3d..87fef139f494 100644
--- a/mm/kstackwatch/kernel.c
+++ b/mm/kstackwatch/kernel.c
@@ -1,13 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/debugfs.h>
 #include <linux/kstackwatch.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/string.h>
+#include <linux/uaccess.h>
 
+static atomic_t dbgfs_config_busy = ATOMIC_INIT(0);
 static struct ksw_config *ksw_config;
+static struct dentry *dbgfs_config;
+static struct dentry *dbgfs_dir;
 
 struct param_map {
 	const char *name;       /* long name */
@@ -76,7 +81,7 @@ static int ksw_parse_param(struct ksw_config *config, const char *key,
  * - sp_offset  |so (u16) : offset from stack pointer at func_offset
  * - watch_len  |wl (u16) : watch length (1,2,4,8)
  */
-static int __maybe_unused ksw_parse_config(char *buf, struct ksw_config *config)
+static int ksw_parse_config(char *buf, struct ksw_config *config)
 {
 	char *part, *key, *val;
 	int ret;
@@ -111,18 +116,110 @@ static int __maybe_unused ksw_parse_config(char *buf, struct ksw_config *config)
 	return 0;
 }
 
+static ssize_t ksw_dbgfs_read(struct file *file, char __user *buf, size_t count,
+			      loff_t *ppos)
+{
+	return simple_read_from_buffer(buf, count, ppos, ksw_config->user_input,
+		ksw_config->user_input ? strlen(ksw_config->user_input) : 0);
+}
+
+static ssize_t ksw_dbgfs_write(struct file *file, const char __user *buffer,
+			       size_t count, loff_t *ppos)
+{
+	char input[MAX_CONFIG_STR_LEN];
+	int ret;
+
+	if (count == 0 || count >= sizeof(input))
+		return -EINVAL;
+
+	if (copy_from_user(input, buffer, count))
+		return -EFAULT;
+
+	input[count] = '\0';
+	strim(input);
+
+	if (!strlen(input)) {
+		pr_info("config cleared\n");
+		return count;
+	}
+
+	ret = ksw_parse_config(input, ksw_config);
+	if (ret) {
+		pr_err("Failed to parse config %d\n", ret);
+		return ret;
+	}
+
+	return count;
+}
+
+static int ksw_dbgfs_open(struct inode *inode, struct file *file)
+{
+	if (atomic_cmpxchg(&dbgfs_config_busy, 0, 1))
+		return -EBUSY;
+	return 0;
+}
+
+static int ksw_dbgfs_release(struct inode *inode, struct file *file)
+{
+	atomic_set(&dbgfs_config_busy, 0);
+	return 0;
+}
+
+static const struct file_operations kstackwatch_fops = {
+	.owner = THIS_MODULE,
+	.open = ksw_dbgfs_open,
+	.read = ksw_dbgfs_read,
+	.write = ksw_dbgfs_write,
+	.release = ksw_dbgfs_release,
+	.llseek = default_llseek,
+};
+
+const struct ksw_config *ksw_get_config(void)
+{
+	return ksw_config;
+}
+
 static int __init kstackwatch_init(void)
 {
+	int ret = 0;
+
 	ksw_config = kzalloc(sizeof(*ksw_config), GFP_KERNEL);
-	if (!ksw_config)
-		return -ENOMEM;
+	if (!ksw_config) {
+		ret = -ENOMEM;
+		goto err_alloc;
+	}
+
+	dbgfs_dir = debugfs_create_dir("kstackwatch", NULL);
+	if (!dbgfs_dir) {
+		ret = -ENOMEM;
+		goto err_dir;
+	}
+
+	dbgfs_config = debugfs_create_file("config", 0600, dbgfs_dir, NULL,
+				       &kstackwatch_fops);
+	if (!dbgfs_config) {
+		ret = -ENOMEM;
+		goto err_file;
+	}
 
 	pr_info("module loaded\n");
 	return 0;
+
+err_file:
+	debugfs_remove_recursive(dbgfs_dir);
+	dbgfs_dir = NULL;
+err_dir:
+	kfree(ksw_config);
+	ksw_config = NULL;
+err_alloc:
+	return ret;
 }
 
 static void __exit kstackwatch_exit(void)
 {
+	debugfs_remove_recursive(dbgfs_dir);
+	kfree(ksw_config->func_name);
+	kfree(ksw_config->user_input);
 	kfree(ksw_config);
 
 	pr_info("module unloaded\n");
-- 
2.43.0


Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DF330B52A
	for <workflows@vger.kernel.org>; Wed, 25 Feb 2026 20:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772051818; cv=none; b=R7/zRhkwWg14eBd5hniClXwM9mwO9dce8FIcdOp6yckYwYJLFX2CrdAdfqe/QAsv5QPMm0bYsFRd09M7n+l8QJxT1cO2BHyvUetMCFjVDOCzxd7vi11o+NUQtf6DexAZ37pVpOzyYeEhpZIJm9Q255/bC9PKmGZ4og4sPg5xLZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772051818; c=relaxed/simple;
	bh=gNXLf2LKE1DuJc2Y0oQKcfavjlPkhFFcfvH8nC7wdJA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=vAgjrF44Oo8AYShP8wxH34hZ+wMki2rkH68QwtHhDXmAFHj3NNJUKCmlA9b+0PAOlS6aa5h39Ywy4jp6qIonJfGjHayVzD1lYoyTPid/cl0NlbKYFkjneJ16Ce9595BlrqOu46X4q+ekwjKSkcevLm+9dKDoJaj4KbIBnjvy7qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XYLT2Xj7; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XYLT2Xj7"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4836c819456so1192205e9.3
        for <workflows@vger.kernel.org>; Wed, 25 Feb 2026 12:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772051816; x=1772656616; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3O3Me7fgwyHmdf0v5rLq8O8sd5sCO/cE1nxT2vqkXJo=;
        b=XYLT2Xj7CuRpBsYF9OVkllFHruNDTKHf4wRiAeIfNda2JrfB03hYSJAl4LjwnoRnhE
         +K8L6rB1ZOxk3QM8yAjPyv0HExVXrxVvWuzSEBMfLLUbdJ/6z5PD+vQjA1OFF003qclX
         ypnXFqJpoD+qZaiPMGvcjA3jHJQLQPXfK7zQwhrXyAlI+dY1C1i2Mj5fgsuQQtZybYRa
         X26jGtWgVdH1l/5m4Z1eiJ/YXLaEGDAoH/Px+iM69n47TmMsf56SEahVpk8Kst0F7oik
         23U3b+iyM1LIMJcgWQSmaoWu+d/2lbJjmli9UrMayQKUwcp5yqfriPW2PUU+2Q1idiRv
         +LYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772051816; x=1772656616;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3O3Me7fgwyHmdf0v5rLq8O8sd5sCO/cE1nxT2vqkXJo=;
        b=p8QdkEFS9guGqdx8aRMkZQgxGt51G3t+//momCDJOb4NM6hwa+eBxbdN/Z2CJSLrJw
         ypJKY7UMRTGzkXbl2hOHZt7YwXTKjEaZ1qG/oTvIChysoLXA/xpEkO54OfiyIDpN/epU
         PYRM7UJUkWeraPPQmpW+iUYdWMPlVMwXwf7wrNubJg1BVd2VE44P1h3bkaJhDTPehcNk
         jdH0ajVbvl8Bz6e36bWjMkwawR2ugvhrRIgCd5GQZceiUr3Rs4FOyjidba9DYQ2b/8iD
         I0Lo39QzkO6BJ+o064AFiMO/ZTZSovnl7ltsHRjbttoL2CNkMpdrnPQBMDUTvn3qbMiX
         ShDw==
X-Forwarded-Encrypted: i=1; AJvYcCVuumK93dUAJ4gPzsv2WdZ1T8ZYmf4wI240+8kNgJ6OkEhOe/t58GN//ZoGvMpDPZ2+9/wWVokdUxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBPseT0hpH+z7mc978I6m2WKFB54JRZX5WfeYVAd+nD4+lOOQl
	hbdkrxm6TlxqBgC6NwZE8wqVs/8qX635/wFeeLXsoPzejWdhINQQcqjx78cJS5vX6gNN0JGFvkT
	Ydw==
X-Received: from wmbjp9.prod.google.com ([2002:a05:600c:5589:b0:47f:c96e:8381])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:6409:20b0:483:78c5:d743
 with SMTP id 5b1f17b1804b1-483a9637a19mr199333935e9.28.1772051815765; Wed, 25
 Feb 2026 12:36:55 -0800 (PST)
Date: Wed, 25 Feb 2026 21:36:05 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260225203639.3159463-1-elver@google.com>
Subject: [PATCH] kfence: add kfence.fault parameter
From: Marco Elver <elver@google.com>
To: elver@google.com, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-mm@kvack.org, 
	Ernesto Martinez Garcia <ernesto.martinezgarcia@tugraz.at>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add kfence.fault parameter to control the behavior when a KFENCE error
is detected (similar in spirit to kasan.fault=<mode>).

The supported modes for kfence.fault=<mode> are:

  - report: print the error report and continue (default).
  - oops: print the error report and oops.
  - panic: print the error report and panic.

In particular, the 'oops' mode offers a trade-off between no mitigation
on report and panicking outright (if panic_on_oops is not set).

Signed-off-by: Marco Elver <elver@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  6 +++
 Documentation/dev-tools/kfence.rst            |  7 +++
 mm/kfence/core.c                              | 23 ++++++---
 mm/kfence/kfence.h                            | 16 +++++-
 mm/kfence/report.c                            | 49 +++++++++++++++++--
 5 files changed, 89 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb850e5290c2..05acdea306b2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2958,6 +2958,12 @@ Kernel parameters
 			Format: <bool>
 			Default: CONFIG_KFENCE_DEFERRABLE
 
+	kfence.fault=	[MM,KFENCE] Controls the behavior when a KFENCE
+			error is detected.
+			report - print the error report and continue (default).
+			oops   - print the error report and oops.
+			panic  - print the error report and panic.
+
 	kfence.sample_interval=
 			[MM,KFENCE] KFENCE's sample interval in milliseconds.
 			Format: <unsigned integer>
diff --git a/Documentation/dev-tools/kfence.rst b/Documentation/dev-tools/kfence.rst
index 541899353865..b03d1201ddae 100644
--- a/Documentation/dev-tools/kfence.rst
+++ b/Documentation/dev-tools/kfence.rst
@@ -81,6 +81,13 @@ tables being allocated.
 Error reports
 ~~~~~~~~~~~~~
 
+The boot parameter ``kfence.fault`` can be used to control the behavior when a
+KFENCE error is detected:
+
+- ``kfence.fault=report``: Print the error report and continue (default).
+- ``kfence.fault=oops``: Print the error report and oops.
+- ``kfence.fault=panic``: Print the error report and panic.
+
 A typical out-of-bounds access looks like this::
 
     ==================================================================
diff --git a/mm/kfence/core.c b/mm/kfence/core.c
index b4ea3262c925..a5f7dffa9f6f 100644
--- a/mm/kfence/core.c
+++ b/mm/kfence/core.c
@@ -50,7 +50,7 @@
 
 /* === Data ================================================================= */
 
-static bool kfence_enabled __read_mostly;
+bool kfence_enabled __read_mostly;
 static bool disabled_by_warn __read_mostly;
 
 unsigned long kfence_sample_interval __read_mostly = CONFIG_KFENCE_SAMPLE_INTERVAL;
@@ -335,6 +335,7 @@ metadata_update_state(struct kfence_metadata *meta, enum kfence_object_state nex
 static check_canary_attributes bool check_canary_byte(u8 *addr)
 {
 	struct kfence_metadata *meta;
+	enum kfence_fault fault;
 	unsigned long flags;
 
 	if (likely(*addr == KFENCE_CANARY_PATTERN_U8(addr)))
@@ -344,8 +345,9 @@ static check_canary_attributes bool check_canary_byte(u8 *addr)
 
 	meta = addr_to_metadata((unsigned long)addr);
 	raw_spin_lock_irqsave(&meta->lock, flags);
-	kfence_report_error((unsigned long)addr, false, NULL, meta, KFENCE_ERROR_CORRUPTION);
+	fault = kfence_report_error((unsigned long)addr, false, NULL, meta, KFENCE_ERROR_CORRUPTION);
 	raw_spin_unlock_irqrestore(&meta->lock, flags);
+	kfence_handle_fault(fault);
 
 	return false;
 }
@@ -524,11 +526,14 @@ static void kfence_guarded_free(void *addr, struct kfence_metadata *meta, bool z
 	raw_spin_lock_irqsave(&meta->lock, flags);
 
 	if (!kfence_obj_allocated(meta) || meta->addr != (unsigned long)addr) {
+		enum kfence_fault fault;
+
 		/* Invalid or double-free, bail out. */
 		atomic_long_inc(&counters[KFENCE_COUNTER_BUGS]);
-		kfence_report_error((unsigned long)addr, false, NULL, meta,
-				    KFENCE_ERROR_INVALID_FREE);
+		fault = kfence_report_error((unsigned long)addr, false, NULL, meta,
+					    KFENCE_ERROR_INVALID_FREE);
 		raw_spin_unlock_irqrestore(&meta->lock, flags);
+		kfence_handle_fault(fault);
 		return;
 	}
 
@@ -830,7 +835,8 @@ static void kfence_check_all_canary(void)
 static int kfence_check_canary_callback(struct notifier_block *nb,
 					unsigned long reason, void *arg)
 {
-	kfence_check_all_canary();
+	if (READ_ONCE(kfence_enabled))
+		kfence_check_all_canary();
 	return NOTIFY_OK;
 }
 
@@ -1249,6 +1255,7 @@ bool kfence_handle_page_fault(unsigned long addr, bool is_write, struct pt_regs
 	struct kfence_metadata *to_report = NULL;
 	unsigned long unprotected_page = 0;
 	enum kfence_error_type error_type;
+	enum kfence_fault fault;
 	unsigned long flags;
 
 	if (!is_kfence_address((void *)addr))
@@ -1307,12 +1314,14 @@ bool kfence_handle_page_fault(unsigned long addr, bool is_write, struct pt_regs
 	if (to_report) {
 		raw_spin_lock_irqsave(&to_report->lock, flags);
 		to_report->unprotected_page = unprotected_page;
-		kfence_report_error(addr, is_write, regs, to_report, error_type);
+		fault = kfence_report_error(addr, is_write, regs, to_report, error_type);
 		raw_spin_unlock_irqrestore(&to_report->lock, flags);
 	} else {
 		/* This may be a UAF or OOB access, but we can't be sure. */
-		kfence_report_error(addr, is_write, regs, NULL, KFENCE_ERROR_INVALID);
+		fault = kfence_report_error(addr, is_write, regs, NULL, KFENCE_ERROR_INVALID);
 	}
 
+	kfence_handle_fault(fault);
+
 	return kfence_unprotect(addr); /* Unprotect and let access proceed. */
 }
diff --git a/mm/kfence/kfence.h b/mm/kfence/kfence.h
index f9caea007246..1f618f9b0d12 100644
--- a/mm/kfence/kfence.h
+++ b/mm/kfence/kfence.h
@@ -16,6 +16,8 @@
 
 #include "../slab.h" /* for struct kmem_cache */
 
+extern bool kfence_enabled;
+
 /*
  * Get the canary byte pattern for @addr. Use a pattern that varies based on the
  * lower 3 bits of the address, to detect memory corruptions with higher
@@ -140,8 +142,18 @@ enum kfence_error_type {
 	KFENCE_ERROR_INVALID_FREE,	/* Invalid free. */
 };
 
-void kfence_report_error(unsigned long address, bool is_write, struct pt_regs *regs,
-			 const struct kfence_metadata *meta, enum kfence_error_type type);
+enum kfence_fault {
+	KFENCE_FAULT_NONE,
+	KFENCE_FAULT_REPORT,
+	KFENCE_FAULT_OOPS,
+	KFENCE_FAULT_PANIC,
+};
+
+enum kfence_fault
+kfence_report_error(unsigned long address, bool is_write, struct pt_regs *regs,
+		    const struct kfence_metadata *meta, enum kfence_error_type type);
+
+void kfence_handle_fault(enum kfence_fault fault);
 
 void kfence_print_object(struct seq_file *seq, const struct kfence_metadata *meta) __must_hold(&meta->lock);
 
diff --git a/mm/kfence/report.c b/mm/kfence/report.c
index 787e87c26926..d548536864b1 100644
--- a/mm/kfence/report.c
+++ b/mm/kfence/report.c
@@ -7,9 +7,12 @@
 
 #include <linux/stdarg.h>
 
+#include <linux/bug.h>
+#include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/lockdep.h>
 #include <linux/math.h>
+#include <linux/panic.h>
 #include <linux/printk.h>
 #include <linux/sched/debug.h>
 #include <linux/seq_file.h>
@@ -29,6 +32,26 @@
 #define ARCH_FUNC_PREFIX ""
 #endif
 
+static enum kfence_fault kfence_fault __ro_after_init = KFENCE_FAULT_REPORT;
+
+static int __init early_kfence_fault(char *arg)
+{
+	if (!arg)
+		return -EINVAL;
+
+	if (!strcmp(arg, "report"))
+		kfence_fault = KFENCE_FAULT_REPORT;
+	else if (!strcmp(arg, "oops"))
+		kfence_fault = KFENCE_FAULT_OOPS;
+	else if (!strcmp(arg, "panic"))
+		kfence_fault = KFENCE_FAULT_PANIC;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+early_param("kfence.fault", early_kfence_fault);
+
 /* Helper function to either print to a seq_file or to console. */
 __printf(2, 3)
 static void seq_con_printf(struct seq_file *seq, const char *fmt, ...)
@@ -189,8 +212,9 @@ static const char *get_access_type(bool is_write)
 	return str_write_read(is_write);
 }
 
-void kfence_report_error(unsigned long address, bool is_write, struct pt_regs *regs,
-			 const struct kfence_metadata *meta, enum kfence_error_type type)
+enum kfence_fault
+kfence_report_error(unsigned long address, bool is_write, struct pt_regs *regs,
+		    const struct kfence_metadata *meta, enum kfence_error_type type)
 {
 	unsigned long stack_entries[KFENCE_STACK_DEPTH] = { 0 };
 	const ptrdiff_t object_index = meta ? meta - kfence_metadata : -1;
@@ -206,7 +230,7 @@ void kfence_report_error(unsigned long address, bool is_write, struct pt_regs *r
 
 	/* Require non-NULL meta, except if KFENCE_ERROR_INVALID. */
 	if (WARN_ON(type != KFENCE_ERROR_INVALID && !meta))
-		return;
+		return KFENCE_FAULT_NONE;
 
 	/*
 	 * Because we may generate reports in printk-unfriendly parts of the
@@ -282,6 +306,25 @@ void kfence_report_error(unsigned long address, bool is_write, struct pt_regs *r
 
 	/* We encountered a memory safety error, taint the kernel! */
 	add_taint(TAINT_BAD_PAGE, LOCKDEP_STILL_OK);
+
+	return kfence_fault;
+}
+
+void kfence_handle_fault(enum kfence_fault fault)
+{
+	switch (fault) {
+	case KFENCE_FAULT_NONE:
+	case KFENCE_FAULT_REPORT:
+		break;
+	case KFENCE_FAULT_OOPS:
+		BUG();
+		break;
+	case KFENCE_FAULT_PANIC:
+		/* Disable KFENCE to avoid recursion if check_on_panic is set. */
+		WRITE_ONCE(kfence_enabled, false);
+		panic("kfence.fault=panic set ...\n");
+		break;
+	}
 }
 
 #ifdef CONFIG_PRINTK
-- 
2.53.0.414.gf7e9f6c205-goog


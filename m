Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7533002DF
	for <workflows@vger.kernel.org>; Wed, 24 Sep 2025 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714708; cv=none; b=i7JVm0OQF9ukANEtjdw4x7Gh/DK/nqRjAcfYVaSOuzI9078EyqwbXamltbdwWQPNVdBdkXnLNCFfqkCaVANcWVURRN3laoYegrSEEMVpuTgQDvtKwDLOVYz/5ZuQE3vrvzRMXVHFCB+wK18bd10J+zrsGAkjqOrK7uwaGuvmdqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714708; c=relaxed/simple;
	bh=ZEq5LCeeZxdZtY+a+kvZMIoWs2Mzj+sOmq7f1LtT1gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MiFWHSBDVh7eFnqpgvEJpSFGHGQxbOgIvW+cRrufgRNg4rzCaDPC9E3+cdu7Nn9dZDb/FUzaJZw2rdlBak6Rgd7UwoYUYRO25FcxdjXMRq/Yuf16Vcli+LNmZye+oZWxq/s5bNuO+SkyNf3jVmilVtGjy+v9JKbWF0JI/5gihRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUmmhrSR; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUmmhrSR"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b523fb676efso5925825a12.3
        for <workflows@vger.kernel.org>; Wed, 24 Sep 2025 04:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758714702; x=1759319502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd/jIJYyk1G6SYf0mNQVLBMDX4oiGoErfqkyMXn4+LQ=;
        b=EUmmhrSRq53bJavSa3Tlj8zhdUBtY6aSahZbWXpX3Dhhmtu/PySBW64Gm6AKmIpesH
         +M9o/aTYfMreYRutgB1lgowh7+YxZwK1MPkO96+SXCQsOUXoaa+XqQyZY4VFPnUACSOu
         m2jWTlHcOst41vbek8l78BPGqYlh5+tjmx7Z3lDL9MRvzl277/wr4vXSniCdBynrM2T8
         V7Y2tkoFMktKlXkL31FTfb+HcG6QMdWS7OLVBuLYihrDKeUbQR1T8b/BQbNh5BBpLk1+
         92CwuO9f27sHSYaWUsNTo+OaSdPzfXb+/6pdFN+vqMeeU71j7FNimh7zyJ6awtjNENxc
         OtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714702; x=1759319502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bd/jIJYyk1G6SYf0mNQVLBMDX4oiGoErfqkyMXn4+LQ=;
        b=fLd1nzkS3sM8f3+w+PhaJ1dUfli0wbgSlBkZc0oogOw6D2zzKW2oTdfFsa8yaonGoU
         hP1B1UrVoa00ocxCmzYdXV2w6YF3nCjVb2mUDX/gp6FVCXvCLdEcny+tSPb5e0coaJE0
         4oeg/hFnaAjapBR3demj9tamvWh5NgW6RbYPQpqtCrTdLVGCmpzOjB5UsVg6eMC7/Bct
         K8w9Ectw9o3U3FW6Nn6mp27Gt5apfU09zR0T0h9Ov/7DkQfnaYczQRIVoYSMCzD9W3fY
         QpXR4jerwoJES2YSRFL/dXYJUwdtUx0ZwEcaWKBnvPq273U58ZQUxEYfM1tTZEMXpyO7
         7L3g==
X-Forwarded-Encrypted: i=1; AJvYcCXBhUwY2qIZewum/Ur7bE0PyzsnFlFlNYBtw/MS4DTkHP2iotUF4SDXuh57Z5UEQZDsLesb8z5VP2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjoj6A3763zLoYICRSHHf6BbP0sD/1gFr4V8z+tSZCuakctl9U
	nQFH87eXw/DEUomV9mTaJUMMEWVlhIRkTVt0x+AfU0LN909kYiH0tFQe
X-Gm-Gg: ASbGncvlOk+4W2hKV0X24w4+ZJ1MxalFmq57pMe7xvVEnRuDEPWDGiOOFCCo3nGTg2A
	VrE8kxvjWJ1VON1rmu4Cs8WqIo03Ldj9MnQLyqTO5wkDlYhFP/mxsLjxcjo9eq5RQEeK4pL8eU7
	yT/JuSTX9hUO8re52GWRbmLgwwvuIZleXGhJGgYtBsMR3IN+mZH8k8C5pxv7Hdr+Tg0NWjJOAPS
	Rl6HGEGIJIpUKlwSEIzTxeVIaHw2/yzMmZ+/Ue/5TFyEJL06Ji8ICpxH7k4BqmsKwPl7CFhL1AJ
	pAKUAOZNTXlT81EyX0Das65FjMHUgbh5s7s4/LEo5Gj3nJzEYwQI86Mzl++V4y9BQNfvLLVpofR
	6zNDNLr0+cWWSG/2ZX3gK+0LzwQ==
X-Google-Smtp-Source: AGHT+IFwE8SCr0I5b3n0uusVXZp7apxLs7ITr185XQMEgGTCAgaUjk1MsH1EiRo81SdJuGldEPeMeA==
X-Received: by 2002:a17:902:ca94:b0:276:b1ce:c094 with SMTP id d9443c01a7336-27cc543160bmr45804925ad.29.1758714701852;
        Wed, 24 Sep 2025 04:51:41 -0700 (PDT)
Received: from localhost ([23.142.224.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802df74asm189691615ad.94.2025.09.24.04.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 04:51:41 -0700 (PDT)
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
Subject: [PATCH v5 02/23] x86/hw_breakpoint: Add arch_reinstall_hw_breakpoint
Date: Wed, 24 Sep 2025 19:50:45 +0800
Message-ID: <20250924115124.194940-3-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924115124.194940-1-wangjinchao600@gmail.com>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new arch_reinstall_hw_breakpoint() function can be used in an
atomic context, unlike the more expensive free and re-allocation path.
This allows callers to efficiently re-establish an existing breakpoint.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/x86/include/asm/hw_breakpoint.h | 2 ++
 arch/x86/kernel/hw_breakpoint.c      | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/x86/include/asm/hw_breakpoint.h b/arch/x86/include/asm/hw_breakpoint.h
index aa6adac6c3a2..c22cc4e87fc5 100644
--- a/arch/x86/include/asm/hw_breakpoint.h
+++ b/arch/x86/include/asm/hw_breakpoint.h
@@ -21,6 +21,7 @@ struct arch_hw_breakpoint {
 
 enum bp_slot_action {
 	BP_SLOT_ACTION_INSTALL,
+	BP_SLOT_ACTION_REINSTALL,
 	BP_SLOT_ACTION_UNINSTALL,
 };
 
@@ -65,6 +66,7 @@ extern int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
 
 
 int arch_install_hw_breakpoint(struct perf_event *bp);
+int arch_reinstall_hw_breakpoint(struct perf_event *bp);
 void arch_uninstall_hw_breakpoint(struct perf_event *bp);
 void hw_breakpoint_pmu_read(struct perf_event *bp);
 void hw_breakpoint_pmu_unthrottle(struct perf_event *bp);
diff --git a/arch/x86/kernel/hw_breakpoint.c b/arch/x86/kernel/hw_breakpoint.c
index 3658ace4bd8d..29c9369264d4 100644
--- a/arch/x86/kernel/hw_breakpoint.c
+++ b/arch/x86/kernel/hw_breakpoint.c
@@ -99,6 +99,10 @@ static int manage_bp_slot(struct perf_event *bp, enum bp_slot_action action)
 		old_bp = NULL;
 		new_bp = bp;
 		break;
+	case BP_SLOT_ACTION_REINSTALL:
+		old_bp = bp;
+		new_bp = bp;
+		break;
 	case BP_SLOT_ACTION_UNINSTALL:
 		old_bp = bp;
 		new_bp = NULL;
@@ -187,6 +191,11 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
 	return arch_manage_bp(bp, BP_SLOT_ACTION_INSTALL);
 }
 
+int arch_reinstall_hw_breakpoint(struct perf_event *bp)
+{
+	return arch_manage_bp(bp, BP_SLOT_ACTION_REINSTALL);
+}
+
 void arch_uninstall_hw_breakpoint(struct perf_event *bp)
 {
 	arch_manage_bp(bp, BP_SLOT_ACTION_UNINSTALL);
-- 
2.43.0


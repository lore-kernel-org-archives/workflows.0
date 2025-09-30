Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FC7259CB3
	for <workflows@vger.kernel.org>; Tue, 30 Sep 2025 02:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759200336; cv=none; b=RTDXf/JctHzZGJGV+7cdIDm3AcSglBycWCjzze60wlJy6/JuejYHjjgHClGABpr1cGICgnHuPehCnzxk6p8TppZJnmBAXeEGURmjaX6E2E7czKNHJckuJuOuqtl65FuPrsdBKgBNmy1YYPDdDOqRXpo3xmEbM4onUNadZZuVba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759200336; c=relaxed/simple;
	bh=ye1IFedT6QyfAsl7NnFp/ScKqi80nwnk9udpC+1GQaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUD3Jo/iRO4fEA/LFrgxVawWShGW9/ER5ijpATHlHGEqbrAQ+S+RIyhWRJhpS28EXtIQ7pmfK3IfiRSW/YV3n75dDQ+CyRo2hJcuRdyAp7f9j5VYY9IKhHtvA46GN/u/4febES/qFh5mCeFERJwlOaOm56mXTqkeYUy+osFUoNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jha/9BeC; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jha/9BeC"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-78118e163e5so2786952b3a.0
        for <workflows@vger.kernel.org>; Mon, 29 Sep 2025 19:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759200333; x=1759805133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RtyZdLa/V9peD4vyIt7vF3g+yVd+tHG9wNYuCcZNH8=;
        b=Jha/9BeCuaRtE0JfPKt3h9P0e7AHRjWzzXJ2XqL365I45C8+45IfFKvWrjyZA8GECL
         JFOFuxqDhAla9JTIKjfLW561RXAL3wPtz1g3UrXL22umArjaXaOGOLGIX/nksv1fa786
         FTlmUTwlyFV/hV0kmwr7t4nvvo7WV2bbIuavbBa4uCNjVJ3Lq81HBtu/oUpYrlYZuFlg
         k8MvVu3ertyf2KcFfL3/slcQAcf7CTQzsv/dlxMPjgbKKuWslzvbPyibXyTo3z8cmraS
         Qdm4ZnSKQ6OmEb1xVmwu11spf+1JfEuOf8Oirbr06Aodsd/uc1Ft9e4muhpcLlXUkMPN
         b6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759200333; x=1759805133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RtyZdLa/V9peD4vyIt7vF3g+yVd+tHG9wNYuCcZNH8=;
        b=WVWsQl+kw0lex67Tut0q0B9fhJdqC1QhoTXjJaKICYOJIuIlKpv7ReGY9tYTm39uQE
         3mOsouBtfDfEz9lXSC+imNzqLSjrFdC2/SlU4zPVgzNc4QXib5CVN1pd6SSDhhpj9j92
         y58XyJoSOsmCUEq2ds0PfLef1rs+vvdjag4P5HVHvFnjxE+LMyJTcprp9lr2TcAfWgYB
         DHL3fPBw/7NzExFmes5pXKcp3YRPivKhmeTwNtCNXv+SfyG2QckeNuB9zo868FQkDglh
         VUbP4G2CnCcjKgV3akPwCALCzjdhpyAWSEW+Rg63pvLQqvsEu602evtAbEYHvw/l10gv
         QdMA==
X-Forwarded-Encrypted: i=1; AJvYcCULuP7eaTG4dYggfnYIkNys/U8TKp7u3jXw7d/PxOEscxyCZ13rS+bOQRGsZyQAHfx44lpJcNNcmwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ5kYnQS+4LHpXxFOyE7PP2f25pGls9Es6d8+aF/9V/YDO6APd
	Oqhs92/mQqgSnNrhLwznf4fLcIWBWtVWJfaqqf/zOIlbsMNHA0qNO9Ay
X-Gm-Gg: ASbGncul9yoLFqMsB7P9FfeoSCsyINgY41gc0UST+DmmW7ZVxkMtOQjb19RzADCKaJE
	fVEVIzcl0kLM+51NpyqzU4Tm2nbzTyyUqE+m9K6NLDQ+PqTlYaGnwzGU2JMSqYEfxTFye4VMfxV
	+QpQNpjvzXm76GAEc3VX/jjVnRK6ZIV0f1cgcMW9zVw8QwWKqdFxIQCBCAAd7elngFJPc4nqoYa
	INGWF1XxIXGenaTvzFfFh1i2gjWsPdyQOaumuIj3p6eofI7DQP6TbWH2Sa8i2xLLOlDkxOdZCVY
	mRDVpHzD+Zi7os7etnUaFAVuqF1yJtfgKPcy64Ae49xOcq43L3m08Ov7twzDf9BKtJVHTYESch8
	WsJGTyGBW+eVJqxruW6EkTkmoIZ9ltCAnd3Z1bdxVLoCvi2Mxt5Jv2fp4xRXS7NfNPrb1nbnrhk
	R4
X-Google-Smtp-Source: AGHT+IEsif2bxHXvYWWChBgM/szcD1tJlw9HGin9oZWPM2Y8lHrYniUGiEidosj0MGkcbXMNhwhy+Q==
X-Received: by 2002:a05:6a20:9c8c:b0:248:ef8:66df with SMTP id adf61e73a8af0-317732b6b3cmr3072325637.30.1759200333340;
        Mon, 29 Sep 2025 19:45:33 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53bb255sm12683002a12.5.2025.09.29.19.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 19:45:32 -0700 (PDT)
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
Subject: [PATCH v6 14/23] mm/ksw: resolve stack watch addr and len
Date: Tue, 30 Sep 2025 10:43:35 +0800
Message-ID: <20250930024402.1043776-15-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930024402.1043776-1-wangjinchao600@gmail.com>
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add helpers to find the stack canary or a local variable addr and len
for the probed function based on ksw_get_config(). For canary search,
limits search to a fixed number of steps to avoid scanning the entire
stack. Validates that the computed address and length are within the
kernel stack.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 mm/kstackwatch/stack.c | 77 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 74 insertions(+), 3 deletions(-)

diff --git a/mm/kstackwatch/stack.c b/mm/kstackwatch/stack.c
index e596ef97222d..3c4cb6d5b58a 100644
--- a/mm/kstackwatch/stack.c
+++ b/mm/kstackwatch/stack.c
@@ -9,6 +9,7 @@
 
 #include "kstackwatch.h"
 
+#define MAX_CANARY_SEARCH_STEPS 128
 static struct kprobe entry_probe;
 static struct fprobe exit_probe;
 
@@ -59,13 +60,83 @@ static bool ksw_stack_check_ctx(bool entry)
 		return false;
 }
 
+static unsigned long ksw_find_stack_canary_addr(struct pt_regs *regs)
+{
+	unsigned long *stack_ptr, *stack_end, *stack_base;
+	unsigned long expected_canary;
+	unsigned int i;
+
+	stack_ptr = (unsigned long *)kernel_stack_pointer(regs);
+
+	stack_base = (unsigned long *)(current->stack);
+
+	// TODO: limit it to the current frame
+	stack_end = (unsigned long *)((char *)current->stack + THREAD_SIZE);
+
+	expected_canary = current->stack_canary;
+
+	if (stack_ptr < stack_base || stack_ptr >= stack_end) {
+		pr_err("Stack pointer 0x%lx out of bounds [0x%lx, 0x%lx)\n",
+		       (unsigned long)stack_ptr, (unsigned long)stack_base,
+		       (unsigned long)stack_end);
+		return 0;
+	}
+
+	for (i = 0; i < MAX_CANARY_SEARCH_STEPS; i++) {
+		if (&stack_ptr[i] >= stack_end)
+			break;
+
+		if (stack_ptr[i] == expected_canary) {
+			pr_debug("canary found i:%d 0x%lx\n", i,
+				 (unsigned long)&stack_ptr[i]);
+			return (unsigned long)&stack_ptr[i];
+		}
+	}
+
+	pr_debug("canary not found in first %d steps\n",
+		 MAX_CANARY_SEARCH_STEPS);
+	return 0;
+}
+
+static int ksw_stack_validate_addr(unsigned long addr, size_t size)
+{
+	unsigned long stack_start, stack_end;
+
+	if (!addr || !size)
+		return -EINVAL;
+
+	stack_start = (unsigned long)current->stack;
+	stack_end = stack_start + THREAD_SIZE;
+
+	if (addr < stack_start || (addr + size) > stack_end)
+		return -ERANGE;
+
+	return 0;
+}
+
 static int ksw_stack_prepare_watch(struct pt_regs *regs,
 				   const struct ksw_config *config,
 				   ulong *watch_addr, u16 *watch_len)
 {
-	/* implement logic will be added in following patches */
-	*watch_addr = 0;
-	*watch_len = 0;
+	ulong addr;
+	u16 len;
+
+	// default is to watch the canary
+	if (!ksw_get_config()->watch_len) {
+		addr = ksw_find_stack_canary_addr(regs);
+		len = sizeof(ulong);
+	} else {
+		addr = kernel_stack_pointer(regs) + ksw_get_config()->sp_offset;
+		len = ksw_get_config()->watch_len;
+	}
+
+	if (ksw_stack_validate_addr(addr, len)) {
+		pr_err("invalid stack addr:0x%lx len :%u\n", addr, len);
+		return -EINVAL;
+	}
+
+	*watch_addr = addr;
+	*watch_len = len;
 	return 0;
 }
 
-- 
2.43.0


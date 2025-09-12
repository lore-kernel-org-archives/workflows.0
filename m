Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2C52F39AF
	for <workflows@vger.kernel.org>; Fri, 12 Sep 2025 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672015; cv=none; b=qCcD5MAxewk/UOzg9sMNK+cP5rD4ic5SRfA1gOlDC61jqgcCUnBl/swnySKol2rnJTxyknPmO+tOPDgjo23rz6kpnJ1VFCxXdzPDKF0QDDenBcPprRu43eBwF4XdVEiHqV/jDLKmFp5TOOQXqh5Od7+/1mEWNv4wfUAjn/L3z/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672015; c=relaxed/simple;
	bh=CEdClddGjVYx6HjPNGBFPBiAS3jsMfpyA1eRZqyA0js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRM0yrGFmOwczVsZtbe0Ma25Nsw1tdgygzIao/nhfuw9Ass2rrY9dWbOnGtDm3IO/KSl9FYVW7BYh8aCf0WTSIM3XcVwaS6iueJc34rbjWEd2JBmpo6EVLkFF0qXd3mL0+Wg0cqIB/3gXeWK9Xdr31xwmVJK8+gB2ZfNGdSZSYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Phu1ClwF; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Phu1ClwF"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77460a64848so1325186b3a.1
        for <workflows@vger.kernel.org>; Fri, 12 Sep 2025 03:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757672013; x=1758276813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqWZ4PXPvcwGUSVpTO1OvKWC6TpQO7QLp3apqR6W4A4=;
        b=Phu1ClwF/WaPaErJMaPhPDE6D9pREb2vKlFKCLG5/QTZ5EdiId+kOCcrawUXVD8G5V
         Pqqmk5rFdMAPtDfGRKFTiKiak4JjE+aqt4sg0bTSJqBnr8RV3L5xuG83kAtC94UpfP+n
         85uQ/GHXtIx0dXdxFQvzbKVNKIoBgBXmr3jAQrlCBtpz25JZf1gA0UAPXwbi0kan6cNQ
         YBwVyySuufVCMJYdzT04jsSuShSH2IqpDjs24IJrY0Jxs5EZkMKphHYKfJhhLzdJNEVL
         TQFy49G2jYxADX+XY2xkM5tK5UO6JYKAL0AEiEVzPr8dJNk6v7iQjw85MFvB6oG5vJ/e
         cElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672013; x=1758276813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqWZ4PXPvcwGUSVpTO1OvKWC6TpQO7QLp3apqR6W4A4=;
        b=Cw6IVrM3CWQj/fLTastp5NcSzcKiqL7FSaAi6Igq7ZcLEXvN7N9oprB0BHZYeTWkQa
         sxiq8T6IZXGV6mPYbG/13wva6bSuKimDDbi6iLlQIdk0zID87P4wtXRDlNRmTYb/Uhy3
         CJ146CAyjrobPAxJIE+ey2NxxIl7YrQrKueI5VvJsfZf9/v64CCyHRFk61527Pen5Slq
         NJx8Fe1qRPaTiyY6ynqYsQlZy/UuUjWsUYSvRjP6EdX6BePmTsXRdBOMlheKs6MexY0N
         4ol1rW2n4FCZTGPjS4Lm0FesoAPqh1j1NWUnD6j3terXc+WaDqe+TH1nfdMPyOKdS84M
         0ktQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ01V507O0rjDZLaySVoF3Evdh/FZVnaV1OnPLTSPDU7aBsRTVkHdiZ/Zah1Yn25ov0ULfuHWvs9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyfMXErdGLkqXRkSoha/TqPxFOU/klhj0rp+KzhEQukx6KZZf3
	Bq+JLGm/zFQ+ZFw8HCjcONjZe6CtXH2QOSL2Wb28MFO0/6qGO9kO4thM
X-Gm-Gg: ASbGncvlEf2/KJ/913ckJUisz7Z6z/TDBx3pRW5gZjK3xTuqZcJZ3s27YlmzWuCTC36
	fffVFr3zcRs/+5qPn/Vqo7wsYzdU20ucWGMUDWBLFDSDLVUQjJLdTuxkxbP03OzjeQdgXTiJflo
	KImzx+SJU+P87GxmBZWjhFM57TyKTUh7VuWN3lsSzXvPoulIsKYFRPM2mAt8EMU39GZBYZ7hScg
	Ib3h0ChxTN6kv1wcWgX+Sag0WUR0ePQk/fFpoOLqQJDjFdgk/NY0BMUFILqB9pUIRjPPAeTXkGC
	YdQqzhnHKVYJtFr5lf76kmKwHDpyMey6/ISeSy80nUP8KaShgTbGEiirQjOCx+K4HG+hPZiRxxz
	59d0hjyVYypztnn3I2MGbJ1Z2dixLbFrsfEM=
X-Google-Smtp-Source: AGHT+IGdi0rU6u6yk/5j3je0obUk9yox4MEj0mpe+W9QIz9sLwr6j5n+alC3GBSeGbtzXzFiSEwqsw==
X-Received: by 2002:a17:903:37c4:b0:248:811e:f86c with SMTP id d9443c01a7336-25d26663209mr26113005ad.34.1757672012838;
        Fri, 12 Sep 2025 03:13:32 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3ad33e1esm44309995ad.105.2025.09.12.03.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:13:32 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
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
Subject: [PATCH v4 19/21] tools/ksw: add test script
Date: Fri, 12 Sep 2025 18:11:29 +0800
Message-ID: <20250912101145.465708-20-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912101145.465708-1-wangjinchao600@gmail.com>
References: <20250912101145.465708-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a shell script to trigger test cases.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 tools/kstackwatch/kstackwatch_test.sh | 40 +++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100755 tools/kstackwatch/kstackwatch_test.sh

diff --git a/tools/kstackwatch/kstackwatch_test.sh b/tools/kstackwatch/kstackwatch_test.sh
new file mode 100755
index 000000000000..61e171439ab6
--- /dev/null
+++ b/tools/kstackwatch/kstackwatch_test.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+echo "IMPORTANT: Before running, make sure you have updated the offset values!"
+
+usage() {
+	echo "Usage: $0 [0-3]"
+	echo "  0  - Canary Write Test"
+	echo "  1  - Canary Overflow Test"
+	echo "  2  - Silent Corruption Test"
+	echo "  3  - Recursive Corruption Test"
+}
+
+run_test() {
+	local test_num=$1
+	case "$test_num" in
+	0) echo "canary_test_write+0x19" >/proc/kstackwatch
+	   echo "test0" >/proc/kstackwatch_test ;;
+	1) echo "canary_test_overflow+0x1a" >/proc/kstackwatch
+	   echo "test1" >/proc/kstackwatch_test ;;
+	2) echo "silent_corruption_victim+0x32 0:8" >/proc/kstackwatch
+	   echo "test2" >/proc/kstackwatch_test ;;
+	3) echo "recursive_corruption_test+0x21+3 0:8" >/proc/kstackwatch
+	   echo "test3" >/proc/kstackwatch_test ;;
+	*) usage
+	   exit 1 ;;
+	esac
+	# Reset watch after test
+	echo >/proc/kstackwatch
+}
+
+# Check root and module
+[ "$EUID" -ne 0 ] && echo "Run as root" && exit 1
+for f in /proc/kstackwatch /proc/kstackwatch_test; do
+	[ ! -f "$f" ] && echo "$f not found" && exit 1
+done
+
+# Run
+[ -z "$1" ] && { usage; exit 0; }
+run_test "$1"
-- 
2.43.0


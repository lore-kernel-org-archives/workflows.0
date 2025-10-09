Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D0C2E03F2
	for <workflows@vger.kernel.org>; Thu,  9 Oct 2025 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007521; cv=none; b=nPifqi/csDvKaPvMw46g/Dsfyz6nJfmlv0VJ0f3ZtEkrd2NpwXBM/ZA5TJLJN0VxpdxVR9oOlCLbCJDmsJN86i2OUxjtUyy0KK/EkDB7V1S9sf0K4+bGA4D9FP5/rlDFo3gVT0QJr5ri4cdqQ8aLNSv9FF8JrxWXyA7uoI6YA80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007521; c=relaxed/simple;
	bh=JE2O3gXCPzxmYnUAKlXgnSjWi6sqfl5NW64CDq3b/SU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XYsyydpQ7xnvSs2+CnJZU07K2/Smky0Rs5AJZu3lWaROqrP0atjHWkU1+frF1YL8wYHgns0+CMVMbYM4iBj/kJnallOQ66bEnGdqEsNR6pSxZPQGB2M8+Kf5GBk9BAl1VRkouIsLcb71gC8oLZ8qP8hPJVxIQQRwNyuu/zHDzKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neiksZ1z; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neiksZ1z"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-78125ed4052so1006115b3a.0
        for <workflows@vger.kernel.org>; Thu, 09 Oct 2025 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007520; x=1760612320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ApAR8xSadwKhwismNq+uPz91ksCPHZtzxjh6qDdbHI=;
        b=neiksZ1zocphckHCNdcqvCB0SEeovXjopGI6pfpT024hB9TvNjLbNBW2fKJWGPduwr
         GiSupT6G/yLKjBEtqqAeENNbRPdgnNYMqthN122C5+pJxCOkOQWV61nbV4w1No4FRyYT
         9g7DxBp3MRACp4vLb8XCW/2HHHgm5bx23ER9ozH7ZIeGtwfRIqwfncfD6BJPQ5NyKi1E
         Dzh9XGRvbkafQcDpkHjTfZE9vZOulFBQ/n2M24QNnDblwnATtnrubC6H9rY+1HNqoS+l
         PoUlGHQwpEkwR/1UpJLxl8LX14t+gP/LvsFdcPZctWanuRItuk1buoqPc1yuKN9qKZtL
         6DAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007520; x=1760612320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ApAR8xSadwKhwismNq+uPz91ksCPHZtzxjh6qDdbHI=;
        b=iZvjEyxAjieKVtp0H9o9q0JYEV5f876JOv4QB/Bv9xyzKWC07D8xjkiL2t7XeurupH
         bRonUIPsRX1iAr73c+jUkU15GmDvFLG6wQThvHpoYckQqca/A8sKgJCEmlwoS+vnRnnl
         0j1tFoFFgzdZkzP7x+kmtL90vklPVOzBtGO0Lb+UpI1+M29gc+48SScRTBre/bTsrnem
         bg4VMdARNfH2FkWLZ5xXL8kZcF3s1qIzxRS6RGgb5PjYcD4w6jwm2+jXHs9jqXJcmXvo
         no+OA9upBYeWSOmSQpGzYXVNYm9FYXD0OyOd4eX0IKeq4UYw+9CTI1Vl58OFSgAlVE5n
         PVyw==
X-Forwarded-Encrypted: i=1; AJvYcCUO2hKwvkIsF+h59Fw692x7hZRUEtaQeakeaH8EQp0QU/Qetd2qU0xI8nk7fptoqN7S35sDn9aH+2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDvVKoUlF88/CWYmxsghBktdo2CEKgEI7tZl0of94awwTTe55Y
	2dsgvOqW4iHho9odglAw82sn6q7KblsXlyVPSU6nvVLnKi0D5vWY1hms
X-Gm-Gg: ASbGncsbGsjBrRAPAc3gt1KdlnPBq9rOyVRAtbQSCPhddFm46heefu6RX4Gwp4xqGMW
	E2Ub8U3DwujLluIudZfYe4Fvr4rH4Uo1Pp1MYd2kIhYPskkoNsPremtrVdEVsZT5EG20S+/ef7g
	s5KCfUOAn93V5J7bX2ofZEZfNWgbOSAevD1obwA4F9Hfbl8jhrfCXeuiGisjlrvq/IBxC0/m4d9
	/h+vh1QJvU1mwB56MVoKVqHGFzc86tJzlOYTCbwrFbvOsYIXvICmQ4Gu+++VusGXg5zyBncZ2W2
	nPn79upMKSU0lpoX2htD2sz8VGqS1vEdIDCijtni6KhmUB+RPrkrWbskrofV+s3jW7AGvqS2GoP
	NWAFv8rqUMRza3505G48kuMRwd7HJreMv8kl/t3GgDz8OcltXsZl2qrJTo0fao0w+d1wSvdo=
X-Google-Smtp-Source: AGHT+IFNGlIpEHO7TMNSv14SEeeL37qmV4fa31y9HfqA5Z8RmIIJBkgU1nSNu4enoYA+m8tb63ySAw==
X-Received: by 2002:a05:6a21:6d99:b0:262:1ae0:1994 with SMTP id adf61e73a8af0-32da845e6c6mr9710336637.42.1760007519707;
        Thu, 09 Oct 2025 03:58:39 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099d4d324sm21591393a12.27.2025.10.09.03.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:58:39 -0700 (PDT)
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
Subject: [PATCH v7 23/23] MAINTAINERS: add entry for KStackWatch
Date: Thu,  9 Oct 2025 18:55:59 +0800
Message-ID: <20251009105650.168917-24-wangjinchao600@gmail.com>
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

Add a maintainer entry for Kernel Stack Watch.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a27901781c2..d5e3b984e709 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13596,6 +13596,14 @@ F:	Documentation/filesystems/smb/ksmbd.rst
 F:	fs/smb/common/
 F:	fs/smb/server/
 
+KERNEL STACK WATCH
+M:	Jinchao Wang <wangjinchao600@gmail.com>
+S:	Maintained
+F:	Documentation/dev-tools/kstackwatch.rst
+F:	include/linux/kstackwatch_types.h
+F:	mm/kstackwatch/
+F:	tools/kstackwatch/
+
 KERNEL UNIT TESTING FRAMEWORK (KUnit)
 M:	Brendan Higgins <brendan.higgins@linux.dev>
 M:	David Gow <davidgow@google.com>
-- 
2.43.0


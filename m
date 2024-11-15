Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FAA16C684
	for <workflows@vger.kernel.org>; Fri, 15 Nov 2024 05:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731647479; cv=none; b=O7WUm3Q8dPy4W339CgA28m/GaaFO9OhQcEHkd8/UE/QpKT27HSj4H9pYW9zzv84Czzinb2yYtD/ek6LGYcXKWMlWA5gIvHCtRWHgKs5O8dKcLtjRdJ+X9tArjglCKykV0d4DGVetXTxCi0OTEmb2lHwlLZbx8A/5JurPt/YtxgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731647479; c=relaxed/simple;
	bh=t0NFyPDJ5iY3sgDsKD5D8OzIdcHNaj0YG+OyWJPZUuQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DPnmtx1wsl3RKQIklSHAIhAgrlliBLp2bJxIKDY0PND+HRhXxHzkaQx9KrEp22D4JlIwZOQTYFu1N7eJ9ZUI1UUwZzY5F3TWRFC43UqcTti6cTLguqqmOpBpYHEUl1CWgPsJ7ZKuMfzf9SgaC0mtgC1pIhEO+mtW3DOCqY/V38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uLh4zNRs; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yabinc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uLh4zNRs"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ee3fc1090cso20961867b3.0
        for <workflows@vger.kernel.org>; Thu, 14 Nov 2024 21:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731647477; x=1732252277; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1wwGpDZ5iudS5LM+KuL+hNLzM54ZC3CXNotEma4ON0U=;
        b=uLh4zNRsXRCu/pbEHWn6YBuXRABeLHl+6oCscmklt9JQoFateBmx/zHpQlFQjqWrsN
         jr/b3Xp6RmldzbNtowaK4NRuUQ2rSDwwLESIDwj2GKaJeMOHFKRWI9IJvVT67QWTAcSS
         WXbpxLRgpxWm5Og8EHFoMHZXNRQbqz6XsT7gPL/LwjXVTdJcizjRtbt2vke8gibJU8UT
         rxR68PbSu7vJM6AORka+5W+Me6Zv0u/+FqlHEMuOHsZYSFoVOI+UDutwr210+c1GoCAO
         PLghGn+WFijWNsNFR5Tsh2llUQzVktx+a4wgWr8ApTNjFp7rN4m6h6uHfmQ16MBTgzYI
         RLlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731647477; x=1732252277;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wwGpDZ5iudS5LM+KuL+hNLzM54ZC3CXNotEma4ON0U=;
        b=jx2ml/CEGq9nZZixcJ4jnzRn3hpaOhZeus3u7fW/k8K0E2XifU5tUP5pmeHvjW7xUO
         ZBXprPjcejMkVaf3wXPIWoDlWuSd4nTxmReMNgsRNfJdVurt8P19+MITLaloF4ZAYPo+
         KLYPRC91NPc0g5R9PTLzk3DB0ZibtZ23wS/JaFZUhH/TgPultndz7oTia93ms0Eh1vtm
         Z7/FvDqZEavU0Y+QNi7HwpTMbPgmSWYXPv3ocFPzdG70lLHuxWjIBwlZOUCigoQ2caqp
         abmVHp8iUSkDQxBivRnfNPmPeD0HQQhyhLwGKv75CK2u2nar6txMUvgfaRagOxI7lyTC
         r1FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRVyhSMV07tZ6YVH/tbWmWMH4329JkhK4aLRp3guKwABsyVyWE6cgZffzav+Wv0mJWujECttt9/2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ3QNLbBGENN3OVz3cDbsAv9SI/kl0vSCcu+bhBbIcoclpyM4f
	vg67oe0MLTKzE/qv/FStG4JAPE9cRqEUZPsnUzFkUpGRCU/TF6wRfH/e42CTs5Y4r4iR3o8XVQB
	a
X-Google-Smtp-Source: AGHT+IGz3q4DCIJt57K3asfgvwzEbv+NGkaDrw/vPNLXCsgnnxFJTN6ZZqOGNQ9YDpPKAjLF646BkA9aZ54=
X-Received: from yabinc-desktop.mtv.corp.google.com ([2a00:79e0:2e3f:8:5172:b594:baa2:7cb2])
 (user=yabinc job=sendgmr) by 2002:a05:690c:4348:b0:6e3:c4cb:689b with SMTP id
 00721157ae682-6ee3d6eac31mr497447b3.4.1731647476326; Thu, 14 Nov 2024
 21:11:16 -0800 (PST)
Date: Thu, 14 Nov 2024 21:11:06 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241115051107.3374417-1-yabinc@google.com>
Subject: [PATCH] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
From: Yabin Cui <yabinc@google.com>
To: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"

Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
selected.

On ARM64, ETM traces can be recorded and converted to AutoFDO profiles.
Experiments on Android show 4% improvement in cold app startup time
and 13% improvement in binder benchmarks.

Signed-off-by: Yabin Cui <yabinc@google.com>
---
 Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
 arch/arm64/Kconfig                  |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-tools/autofdo.rst
index 1f0a451e9ccd..f0952e3e8490 100644
--- a/Documentation/dev-tools/autofdo.rst
+++ b/Documentation/dev-tools/autofdo.rst
@@ -55,7 +55,7 @@ process consists of the following steps:
    workload to gather execution frequency data. This data is
    collected using hardware sampling, via perf. AutoFDO is most
    effective on platforms supporting advanced PMU features like
-   LBR on Intel machines.
+   LBR on Intel machines, ETM traces on ARM machines.
 
 #. AutoFDO profile generation: Perf output file is converted to
    the AutoFDO profile via offline tools.
@@ -141,6 +141,22 @@ Here is an example workflow for AutoFDO kernel:
 
       $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -a -N -b -c <count> -o <perf_file> -- <loadtest>
 
+   - For ARM platforms:
+
+     Follow the instructions in the `Linaro OpenCSD document
+     https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/auto-fdo/autofdo.md`_
+     to record ETM traces for AutoFDO::
+
+      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <loadtest>
+      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=i500009il
+
+     For ARM platforms running Android, follow the instructions in the
+     `Android simpleperf document
+     <https://android.googlesource.com/platform/system/extras/+/main/simpleperf/doc/collect_etm_data_for_autofdo.md>`_
+     to record ETM traces for AutoFDO::
+
+      $ simpleperf record -e cs-etm:k -a -o <perf_file> -- <loadtest>
+
 4) (Optional) Download the raw perf file to the host machine.
 
 5) To generate an AutoFDO profile, two offline tools are available:
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd9df6dcc593..c3814df5e391 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -103,6 +103,7 @@ config ARM64
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_RT
+	select ARCH_SUPPORTS_AUTOFDO_CLANG
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
-- 
2.47.0.338.g60cca15819-goog


Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081453D648A
	for <workflows@vger.kernel.org>; Fri, 12 Jun 2026 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249720; cv=pass; b=KyHYpTh95/tUPgQTVp3y1Qli02zzy0Ib33bzWLk8mwwfxV1LRS/87VNwov442oGJrczViDBWN2FVMCRZ6GcZvoMcd6GWScPPUo7N6AEYtlrFXTm1UL9n1dE2rleOk1qztbw4W3MMg3rJajfxk1NaYyiCQdvnbiaj6itIlaWisg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249720; c=relaxed/simple;
	bh=p6q8LWPMVa2osOVn3baZs5YxnHGVEKp86xJ2gk1+YxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qITSVht0Ltgciu9wkeklfqVgbx7IX18zhs/3xiFO0fFb0Cby0UUXCaNc9O5CqJBCfTPjIN0BlqOe8nLOrtB8jdWx2/O7023mvDsfwqzRTi/R7YveiCvECEOdxKvsmEq1/wKe5rIHYG5VDahdzjsD+2+VYmSK8mHlpuTycyeWrF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J4dXThBe; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J4dXThBe"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7e3b2a435ecso7546947b3.1
        for <workflows@vger.kernel.org>; Fri, 12 Jun 2026 00:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249717; cv=none;
        d=google.com; s=arc-20240605;
        b=TeK0zxHSFYWKQ+vNnZeHN2FyRYh5l0Zij3WZBmOmgxcH82MeMhdicMpO2nDIZuT2ur
         Y4+MPIoVEykWPKS7/sEfT2AdUkdlTEBkRnIKT1nfEkI6bVuCcUMfySToI++D/LzCCIc9
         ooCqvOkhicN+3UG+vldKbsGrmfEZhu74okkkpC8FnwtP6vfl3pAKwHLLnidcqaS0IZd6
         dnTEefBuGdRdVaKxuFUUXhInqGM8S6SgoqVTo7w7twi7S9jAK8tZHXdeu/hYRdS9IC+1
         Kig+ClTX0wb91r2kzz39webaeJx6FtqAgm3RbMvyaF6qU8J3pNwkKVAH9mEKLmjW27ir
         hJ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1vLF6yuNSQgtVfJ+k2uIVqLmlvQ2f0shING6YSG4gg=;
        fh=17BpfVvfz6DpKydQ8jkc0fE/PtyWOL9KmsBsF1etp/k=;
        b=Hw2dnjbm83M+5WKTGhmyFhgucGmhHuAC0gpekRoyftkDloRsMKW5ZnJZIRkBaNBfxO
         /tq8T+JaxtpTytWhMTL1c/7wV2LNaNFsv1lNegWwbnYWmMcCISb8piDpR2L9KslmLfg6
         gbJbblOvqZ+LcVdg2vPRlFLIi3kNPYIxoj/vspPQOOqcdVsaHrzQx+phoxAg6O8rAWGp
         /9NHKZskrXYkFlD0NR5EHBtW8GSDsovbslGq80I8PxLnH1EYvdhtAfRJP9wX+qBDBGxq
         EqiGyIvd37Eo0ULin6KwRn+P3iKk4QLea2MlVSph6Yg9lI8GBiDPi7/ulTqHFWwIKRZN
         Taew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249717; x=1781854517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1vLF6yuNSQgtVfJ+k2uIVqLmlvQ2f0shING6YSG4gg=;
        b=J4dXThBefC/uv2x81IA7NSuEoWoexazimn8V8DKAXljYkmsI7laNV1zY/Dy0fUxMwi
         EpMDSRwzhCk7HuyVirTGkvjYmqkTO6VhWfVz8ybPjAPhIwsY0PW9VlcBxZzBg17hiUzT
         LJrOnRk++eHkpd+cqkT90bqerl9yX8cc5AYhu69Rcb0sKW7ALA2zafe8fyarShtqsnHE
         jeiQQ/AKg5tPx8+Km/itxnPkgyx6eiKY+AM40UYt/At1csgeOJ78QPt+sXWsWuhFP8sv
         dIUGuFqLLWUFGQ/HavxSmB7IPH0Up19eje2bFm4nUgecG2bO/dhrdAMobt6x5HYpecuZ
         uF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249717; x=1781854517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g1vLF6yuNSQgtVfJ+k2uIVqLmlvQ2f0shING6YSG4gg=;
        b=H1SDa2e9FHj+VpDYcbjNIMBUidoNfGt08ubUmgUlH79KisHaKiaBj1b7I812dTCs4k
         yHwI2m5IL03dhYzAIkTzNvaHvOIFIJTs/fZZIAx/7f9egCAd3N2rVi4UTkVDTvR0rYv4
         yT84EEoLjPrVquqYFNqGV+1WLOR31n96z0S3EAxUcjuHKp2rThI2H0EbyNJEBMVrkNk7
         XQBmslY0Uq4y936taaABGNX3DmFAbz+UcYqOsee3GkQX4Ijc05vy6ZQSseu16NdiOIBT
         nfUHbH+l383Q7YKnqnveQp0WN/K6EFN4vh9pFsEKKKWqwSKdMb6QdYCWr613FnSFE+A5
         OjPA==
X-Forwarded-Encrypted: i=1; AFNElJ+j+lvluNmAQLRqJyuIybnEhNB+lkm5I7a7y/WbkbFomRUndQTmt5W4EToNzcHfToKAbXOd3PAJq3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUsvzKzAX5c9kad4GIHbG0QPF+pmCQQlAkKjKxNJYbBTqXG5jf
	nDJ3dcVRRqnqPRyYe/ce3EqnE/qpFW1ulYYB0qGMH1nuqunz3i6hWJlvNpvydnv22ZdiCjsa3EA
	mwU5fko/kq1oXJrCQyo3h7KrjpD2Hv6ek/YjotD+V
X-Gm-Gg: Acq92OHo/8n4g677DwE0WsZ5uV9uZqpmnMXPDbhfNvv3CVQOEkUamD15yipz/9H4odr
	m2dRhYOK+JFbdt6ioMlwEtYsBRAMVBjJ1QfeGocEQwZV34e1j8WctQ7b+mf2C8wWJZ8JJ92i2Sf
	mWKIrIF3E8eqoPfd75F6ggHFrMbLuXclnyIrGLVoWxcA/INvbW/1Gf+dqmsWzo6oG85uj/Q8vZI
	Ima4dpXmS+GxH3ruzus6fwp2ydLP/Uz7ns2kzA/feLkERw86jQA/Qa4Hs8F0aWIvmtAfSvjN8jA
	UoYSvFrY5lSs0kRmmsRj23vd9P2HVvJw9zNuag==
X-Received: by 2002:a05:690c:4b0f:b0:7d1:c256:b5a8 with SMTP id
 00721157ae682-7f7b9020616mr15009847b3.40.1781249716383; Fri, 12 Jun 2026
 00:35:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-1-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:34:31 +0200
X-Gm-Features: AVVi8Cfm4phss8ao3422B1w1tp_vYDP5PJUsvm_ZDGjV7MhrtYD94WvUDwrEe3M
Message-ID: <CAG_fn=WYdnX_09RNs3sTQWn+KZZaw+X9a=s1Uk1bqd3gW04h6Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/14] kcov: add per-task dataflow tracking for
 function arguments/return values
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Add a new tracking mechanism that captures function arguments/return
> values at instrumented function boundaries via submitted as an LLVM
> RFC SanitizerCoverage callbacks:
>
>   __sanitizer_cov_trace_args
>   __sanitizer_cov_trace_ret
>
> This requires a custom LLVM/Clang build with the trace-args/ret passes:
>
> LLVM RFC:
>
>   https://discourse.llvm.org/t/rfc-sanitizercoverage-add-fsanitize-covera=
ge-trace-args-trace-ret/91026
>
> LLVM PR:
>
>   https://github.com/llvm/llvm-project/pull/201410
>
> Clone and build toolchain:
>
>   git clone --recursive --depth 1 --shallow-submodules \
>     --jobs `nproc` https://github.com/yskzalloc/kcov-dataflow.git
>   cd kcov-dataflow
>
>   cd llvm-project
>   cmake -S llvm -B build -G Ninja \
>     -DCMAKE_BUILD_TYPE=3DRelease \
>     -DCMAKE_C_COMPILER=3Dclang \
>     -DCMAKE_CXX_COMPILER=3Dclang++ \
>     -DLLVM_ENABLE_LLD=3DON \
>     -DLLVM_ENABLE_PROJECTS=3D"clang;lld" \
>     -DLLVM_TARGETS_TO_BUILD=3D"X86;AArch64"
>   ninja -C build
>   cd ..
>
> Build and boot kernel (using virtme-ng):
>
>   export PATH=3D$PWD/llvm-project/build/bin:$PATH
>   cd linux
>   vng --build \
>     --configitem CONFIG_KCOV=3Dy \
>     --configitem CONFIG_KCOV_DATAFLOW_ARGS=3Dy \
>     --configitem CONFIG_KCOV_DATAFLOW_RET=3Dy \
>     --configitem CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL=3Dy \
>     --configitem CONFIG_DEBUG_INFO=3Dy \
>     --configitem CONFIG_RUST=3Dy # for rust module kselftest
>     LLVM=3D1 CC=3Dclang
>
> Core implementation in kernel/kcov_dataflow.c (separating from kcov.c
> as Alexander's request):
>   - Per-task lock-free ring buffer via debugfs kcov_dataflow device
>   - READ_ONCE/WRITE_ONCE atomic pattern (tested on arm64)
>   - copy_from_kernel_nofault() for safe struct field reads
>   - in_task() guard rejects interrupt context
>   - Bit-31 recursion guard prevents INSTRUMENT_ALL re-entry
>
> Build system (scripts/Makefile.kcov, scripts/Makefile.lib):
>   - CFLAGS_KCOV_DATAFLOW: -fsanitize-coverage=3Dtrace-args,trace-ret
>   - RUSTFLAGS_KCOV_DATAFLOW: -Cllvm-args=3D-sanitizer-coverage-trace-args=
/ret
>   - Per-file opt-in: KCOV_DATAFLOW_file.o :=3D y
>   - Respects KCOV_INSTRUMENT :=3D n for noinstr exclusion
>   - CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for whole-kernel
>
> Kconfig (lib/Kconfig.debug):
>   - CONFIG_KCOV_DATAFLOW_ARGS / CONFIG_KCOV_DATAFLOW_RET
>   - Depends on CONFIG_KCOV and CONFIG_DEBUG_INFO
>   - CONFIG_KCOV_DATAFLOW_NO_INLINE (default n)
>   - CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL
>
> Also fix rust/kernel/str.rs unused import (flags::* -> flags::GFP_KERNEL)
> which newer rustc (1.98-nightly) rejects as a hard error.
>
> Rust support requires rustc built against the custom LLVM with
> trace-args/ret passes compiled in:
>
>   https://github.com/yskzalloc/rust
>
> Link: https://github.com/yskzalloc/kcov-dataflow/
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Nicolas Schier <nsc@kernel.org>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  include/linux/sched.h  |  10 ++
>  kernel/Makefile        |   3 +
>  kernel/kcov.c          |   2 +
>  kernel/kcov_dataflow.c | 324 +++++++++++++++++++++++++++++++++++++++++++=
++++++

I think the total size of kcov_dataflow.c doesn't justify splitting it
in multiple patches.

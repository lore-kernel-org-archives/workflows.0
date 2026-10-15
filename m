Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AA05304D2
	for <workflows@vger.kernel.org>; Thu, 15 Oct 2026 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076050; cv=pass; b=motFPgZC6xy0VluBkhmZEHm0WSOSCTPXg6YhKsybZig3A8nhC/891SNFnvV73oVXE9T7ncqWOnJSGtkdn+zAOGHhe5qVbC0h62glN+GeDy1q63XeLWL7go9iprj6EOMRZu2fNbNiGLneTeikRb8VI+RYafZ4/k7kXICOXcnd/Qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076050; c=relaxed/simple;
	bh=AnKorVyMFsue4YLkX+u6nG8xKZlce7b3N8YLsAXV5Xs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c68SgMgPNnlm2EXDmHD/kJDRgi69TtpyEiQ9rkYcTIwNnbF5BQTNzrREBSX4gOmO+xahRf4t13UfnYVKesTtdxL6bL4WtfYRJNdMpDNiOOJXvuuWs+qDUqujI0sGMDuFXadpIppLj/oMiOx0aYC5NjtltWe3zFMVg0oU1FgMvD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UxWAsH/C; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UxWAsH/C"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ac9d666d4eso21316227b3.3
        for <workflows@vger.kernel.org>; Thu, 15 Oct 2026 07:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792076048; cv=none;
        d=google.com; s=arc-20260327;
        b=eB0+TT38hILMwoVd5y0nYMQbxvAUGOXg9sF5Ab2/jyiDm2E4BwSFnEEBu67hVfid5F
         Tljb5q7vLZhAZAoAmpnD3ceZ7F24W22M+khcLjXBif6fxKDtlYaV2LBhmsPWVS7AnWkK
         9LRQphrsP/83AK9uQ8gha6a2D3TFbFENaPF2ijg5GgEVR0nUBSIERVlXiq7IIg9hgg8w
         dzJu7N0QzU2i8JBM96+4sVtBCCuTdnnNDmO4JE/l1MPVSifHEVMa5Ouj4vHQ9XgoAru1
         RQIBtkhgnOiyhdEBcNc6EN/DHJorfoi+k9Q/y0HqvL1zU6xJycoDREuiVmJYBHFs6PlH
         09gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dYgoYAnEHvzfJJCgXJF81sGKm1IaJw1pU61WKhV8va4=;
        fh=nEM+TW9ldBUgTyHiI8jlzNow/cDHQ54mIHbo0eo2z8k=;
        b=L2pbRJnnMF+RKfoCLN368KeZrWrrghHajrld0L+edfsePsVJ2sB4QZhjM30jdb6Mb1
         SqF20//3jwbc/L5vU1dFXzKJH2szlWDYlRTHgY/1sX2MrfKd6EoItRuHN8WXWZUflYw9
         EEPJdliZ8r+qFO45aDXK9fn84Pb6gYvV+QNRIgL+DeR8prX4j8VGyVljDOzl9XrXEfoz
         CoaJZY/XAV2biBHdcqiaiFZXc3fnow1MYFl306l9i5VUdBe4dl6GEiCwplopWF/c1/hn
         JklUHsRdaA6fY3vXjteClROEKF3xB5UlfN95wc4bsrIZ9U/fJek100G4eDbYGySCH/SS
         G6fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792076048; x=1792680848; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYgoYAnEHvzfJJCgXJF81sGKm1IaJw1pU61WKhV8va4=;
        b=UxWAsH/Cl7/pyenIZyo5P3fZgk1zP6Tgjx/mH4nNHyPuv99+U32mBwhmKQYGIuy+rp
         Mx90p+EvV2iZLOQHFf6O4FzMt3oILoc1Y/FiXHViCO9mFpZkVG/rjvoV85x5xbIhfjYm
         1b1JJVJm0aFvmi8SA50Kh8CGnpVC3OzlSIKREiv5kYwpEMFgILUJrHGWXGoRw3AXMRZm
         tYtwD861qNFtSI0ttepy8ANkUKBHddWoj6qAqyDVxIeBn5UmjXLUKl7rsXoKdbqzU+S5
         ylflJHtR1kEDSLCbQ5txgFO3TY/5BIMusihTQ6KBMpDbKO1sbe+gYkoWuEfnM8EnacAy
         kR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076048; x=1792680848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dYgoYAnEHvzfJJCgXJF81sGKm1IaJw1pU61WKhV8va4=;
        b=YawfHEIqJLb0JKEn+P4WUxBrxmDXOeBExCTYV6/XGl6eJbf2c++Y3utQxyiQWoA5mn
         fK7gvllnrlsJjA/HG6uclVGCMQ3rDLHwuV0kCFQu7Rh6QrnqqBlo2C9FiyFxRhDY3vC6
         Y6dwjHQQb/kVKLTT8aL/TGF41JMoU/9nkbi84cAoWNE6m18WH0ylnQdk4ouyP797Hcal
         RU8ebOZCyn+QWMMs+TNfmln+TmEG5ZLliDWrI37gxJMJi+FMxi/FCEZKByO9aD7CBttB
         pZnFcdDQK8Yycsf7kCgmT99DJIa57+2BPW75H7xC9v1ZM9kQdsHAFdZ3lJ6je7aiykjB
         rL5A==
X-Forwarded-Encrypted: i=1; AKwUvBxrsXNuBZGJ1BJGD9Xv/1wDacdkSW5Z+BAiJqQfGvD54oVIpVbOXnBZPVRsZCTS4X3KxE6W4ubUeEs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFtDtXrghM7KBeSPfwrxIjXvHFezFZskhBUBUVovwGkc4Il5ks
	e+hPSv35VMwcXp63n1JAHjoaNWpjCGMvURPzJ469aiRNZQEDywBh/aNJ2O6BlRrBHcW7lYQIhcb
	fc97vH7Fq3Z03uISWLdic68wRtbefxA0C+TcamdKS
X-Gm-Gg: AYBFou3UzTJtlMJ3CpaUdwBuJRhFMjOtrWLVStewB6qjWSa0wAzZwZ3ZiTNXRuiTQzB
	mpJfoZvQCnh58A2e17nCGMBQtWtpdAMqnSj7RtiEvNt3L1f4a/bG6YzUbamVDOcz+TngVgOvZil
	/CunmQnjgVfo1pvw6LZFGANxtNyvohQhUEW2sSsM76tyvYfh1Zf41QHm+lSySOJW+AVf81vsRlu
	0uFz8xVGWVI141Fvmq0saxHwGQWP+faX2Di3iNkSnou9bij1eMBH/Yo7LdPVX4g5EhNAFbYx9dB
	xlyYAh8l3M01ZxYP9/yI1vlIG+wAhyMloI2imnqR8VF0r3Go/pNbTJW4D0xab8wutg5Df28Q+HX
	i8Sirt5EM3Q==
X-Received: by 2002:a05:690c:6601:b0:854:819:64c9 with SMTP id
 00721157ae682-8b07edb5ea4mr60117707b3.30.1792076046940; Thu, 15 Oct 2026
 07:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014095238.2132580-1-sh_def@163.com>
In-Reply-To: <20261014095238.2132580-1-sh_def@163.com>
From: Marco Elver <elver@google.com>
Date: Thu, 15 Oct 2026 16:53:29 +0200
X-Gm-Features: AclHuK9m7JT0Qck1kk4b70bqEqtddMmAhlHS6jUlvnCmwhJmF1L67Sq-JSWhkSA
Message-ID: <CANpmjNNhZq6z8hZN-125OPNbho+YBwWJeOsa6QRedkqOdJP0kQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] kcsan: add targeted watchpoint sampling
To: Hui Su <sh_def@163.com>
Cc: dvyukov@google.com, kasan-dev@googlegroups.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 11:52, Hui Su <sh_def@163.com> wrote:
>
> Hi,
>
> While investigating a low-frequency scheduler access around `calc_load_idx` in
> `kernel/sched/loadavg.c`, I found that KCSAN's per-CPU `kcsan.skip_watch`
> interval can make focused reproduction difficult. Unrelated instrumented
> accesses on the same CPUs may consume the interval before execution reaches a
> known suspicious address. This is a limitation in focused-debugging control;
> the proposal leaves the default sampling policy unchanged.
>
> Setting `kcsan.skip_watch=0` removes the interval globally and can make
> watchpoint setup much more frequent for all eligible accesses. The existing
> debugfs whitelist and blacklist filter which reports are emitted after
> watchpoint selection; they do not select which addresses may set up a
> watchpoint. There is currently no runtime control to focus setup attempts on
> one known address while leaving unrelated accesses out of that selection.
>
> This RFC adds an optional single-address target to the KCSAN debugfs
> interface. When enabled, a non-atomic access is eligible to set up a watchpoint
> only when its byte range contains the target address. Matching accesses bypass
> the normal `kcsan.skip_watch` interval; nonmatching accesses neither set up a
> watchpoint nor consume that interval. The target can be specified as an address
> or a kallsyms symbol, including `module:symbol`; `target=off` restores normal
> sampling. A static key guards the disabled path.
>
> Patch 1 adds single-address target matching and the static-key-guarded runtime
> state. Patch 2 exposes address and symbol targets through debugfs, patch 3
> tests the matching semantics, and patch 4 documents the interface and its
> performance implications. The standalone integration module used for runtime
> checks is local and is not included in the series.
>
> Testing:
> - x86_64 GCC and Clang `bzImage modules` builds completed, and the candidate's
>   built-in KCSAN selftest passed 4/4. Runtime validation recorded setup
>   activity for exact-address and `module:symbol` targets, none for a
>   nonmatching target, and normal sampling after `target=off`.
> - In a separate motivating loadavg run, targeting `calc_load_idx` produced a
>   KCSAN report involving `calc_global_load()` and `calc_load_nohz_start()`. A
>   separate upstream run with the default `skip_watch=4000` did not report
>   those locations during its test window.
> - Across 10 rounds of 1,000,000 accesses, medians were `24.549 ns/access`
>   upstream, `24.654 ns/access` with targeting disabled, and `26.981 ns/access`
>   with an enabled nonmatching target. The disabled-path results were
>   indistinguishable at this measurement granularity. A separate 10-round,
>   10,000-access hot-match run measured `81.1 us/access`: every matching
>   access enters `kcsan_setup_watchpoint()`, so this includes setup slow-path
>   work and represents focused debugging rather than normal use.

You should compare fast path disasm before/after, just to make codegen
isn't adversely affected.

> Questions for discussion:
> 1. Is address-targeted watchpoint sampling a useful primitive for focused
>    KCSAN debugging?

On surface, it seems helpful.

But there's another angle: The need for reproduction arises because we
want to debug an issue, and the fix it with a code change; after the
code change and a recompile, are there new data races that were
introduced as a side-effect? Perhaps the original data race you were
hunting is gone, but new ones may have been introduced. So my approach
has never been to try and focus on a single data race, but look for
data races that may have appeared adjacent to code I touched
(filtering based on function name). The method of reproduction are
stress tests that more or less reliably trigger the original data
race, but should also trigger data races (if they exist) adjacent to
the code being scrutinized.

But perhaps what you're after is asking "are all accesses to this
variable data race free" only?

> 2. Should matching accesses bypass the normal `kcsan.skip_watch` interval, as
>    proposed here, or should targeted mode retain its own sampling interval?

It might become quite slow for frequently accessed data, but perhaps
that's intentional if we want maximum races detected for focused
testing.

> 3. Is the existing KCSAN debugfs file an appropriate interface for configuring
>    a single target?

This looks clean enough.

Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33362253F0
	for <workflows@vger.kernel.org>; Tue, 14 Jan 2025 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852567; cv=none; b=ZA9mvOdCwRxBNNoKD5BKAoOdtHmzAKq3p9N7eoDcfRCDNUOd/iI0XtFCb9d/kpGavJsJqqeNgU+FJ2HChtpgWBKUqJdZQRsh1f93UVZ0PkmEUFCpkrjeQBfMAUxKyPjAgGA0cD3MNnU4MdbZBosPVJgSQABBt4bBeBF4A1LXFVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852567; c=relaxed/simple;
	bh=YyrHRr9KL+dw87bI1dBhLWyuCGiu4LuJi8gnhLwG43s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEG+KhnO+Jf2Gm4cOFjksHSXx86eltdQYeVLsiBCcsAISDmm8W/jYZZd4BBui2E6Ies7s8R5JMKFAn5+UVLhNdINMma7lbqR4U8CSYjFMuk95l+xqJNuaJSYCbNmcoyscgSW6hihDaBr94Y0ZM5goMk5ZMF+uiGz8tuj5icAnBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L2gvvhaE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L2gvvhaE"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54252789365so6216146e87.0
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2025 03:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736852564; x=1737457364; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tkDcNJulp0KAE0ecW8Wxpxi/6ej7l7BU9iILAcZFrUc=;
        b=L2gvvhaEOpinXD5LzCP6xAnnq3o26ckvUEASPsbamVJi0HjVq3p+LMT7xsCtjhxnB5
         mgCVwcck6LtKDxry+L5ocBY9e2EQlVJ4yL6yhSaBIQOA0O9/79iTuEBTmM06sxtltEJs
         NqTJIXKVmLtDoBTzZeC3fjGOIxfx6JpmH0yIYrmkDgjetbWhnUb4XljUqOM74wzoKnaR
         v8FSS/aO11uybi7nBgrgNhZTXCs2mK7ZvGbU2fZIofO2NEfUhF2wN2LljOOhqAIOT14y
         7PpkRN7YwVLF+0B/VyinXMJ1fZUuCMS2T9C19e+/YXcvEU6SrjyoOg3bkKLEIEhzlTVJ
         krGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852564; x=1737457364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkDcNJulp0KAE0ecW8Wxpxi/6ej7l7BU9iILAcZFrUc=;
        b=tkAV6pU9Z8X9G2P2LKjWcilmdmhbIWKEFu/5ljj3SW4rwhkDkTGUpst+oiukkyGlzJ
         dvikyylfEv4xikGPlRgN2cAlFmND6amGBnYV+lPFNPwyFtabLFjkMV1HID4rLm1uiGK6
         F0KEi0Y42Wef4XfjSFkHy3POO/yJ0TD+LPLoMe1ElJHhOeXRiuiB/qT7r6NyegqBL5Gw
         GhozKPY49+bqA6JVHZ6PcZEA7S2R2Ne/DSUQ273a5cqaqVJI9OOJ3yZTUxYwNsCOdelA
         H3Ej9H5HW9Va7lZjfGd5XFfdsQGTLOq/k53t/ssdy3/ixrBItTHSXxSZVaJWTC9SEof4
         fuXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyUH0D/FpwblAFdv7yoTZHlDqE20zEoAru0Bog53C+VxGN4DaXfkFaEyoon/K0Eezdj8LXLaQCtm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhWkToNuNdamRXbO8QLOxAPktZyWHfznAs0Ieo9+9chmR/hKTg
	rHOYItBhbj2BusaTP5JTqhPzA0jtHELJ6rKx4jpzPqOKIWPzXouWFXbZ+9ZW1oMWYwVEoLiKpqS
	Lb59/SxVMe32vvEfWbYp6KP4txC1ZVrZ4jcET
X-Gm-Gg: ASbGncul9mRtqGF6JNsUNuC/K9J+Qm8C8brB24p9I8QfNIEQ56bKF5hlWiQaHUlTtEp
	Rd2r+ORVn/JetKmPGzQRPCsElSUnmLfzpJWghhWhviHgS3L1FVH3go98kKqktzK9OZrp+
X-Google-Smtp-Source: AGHT+IFf7P01M57Y+Gqy83yzIJ8jPqDjZgPJXvExL+TT5lSQl/qu1v6b8b1aedUzQTWqMr/JTwypkmUtqg6Oh/W0giE=
X-Received: by 2002:a05:6512:238e:b0:542:97b9:89e8 with SMTP id
 2adb3069b0e04-54297b98aa9mr3302952e87.23.1736852563653; Tue, 14 Jan 2025
 03:02:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114-kcov-v1-0-004294b931a2@quicinc.com> <CANpmjNPUFnxvY-dnEAv09-qB5d0LY_vmyxhb3ZPJV-T9V9Q6fg@mail.gmail.com>
In-Reply-To: <CANpmjNPUFnxvY-dnEAv09-qB5d0LY_vmyxhb3ZPJV-T9V9Q6fg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 14 Jan 2025 12:02:31 +0100
X-Gm-Features: AbW1kvbVjib7z1JcHA7nqt52tIMjbajYXxACvsKxzNI1Rng2SxsEsnkK92Vh8CA
Message-ID: <CACT4Y+badwgw=ku--uJRWA94SA6bGXdtT+J9eO_VQxqWDxGheg@mail.gmail.com>
Subject: Re: [PATCH 0/7] kcov: Introduce New Unique PC|EDGE|CMP Modes
To: Marco Elver <elver@google.com>
Cc: "Jiao, Joey" <quic_jiangenj@quicinc.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jan 2025 at 11:43, Marco Elver <elver@google.com> wrote:
> On Tue, 14 Jan 2025 at 06:35, Jiao, Joey <quic_jiangenj@quicinc.com> wrote:
> >
> > Hi,
> >
> > This patch series introduces new kcov unique modes:
> > `KCOV_TRACE_UNIQ_[PC|EDGE|CMP]`, which are used to collect unique PC, EDGE,
> > CMP information.
> >
> > Background
> > ----------
> >
> > In the current kcov implementation, when `__sanitizer_cov_trace_pc` is hit,
> > the instruction pointer (IP) is stored sequentially in an area. Userspace
> > programs then read this area to record covered PCs and calculate covered
> > edges.  However, recent syzkaller runs show that many syscalls likely have
> > `pos > t->kcov_size`, leading to kcov overflow. To address this issue, we
> > introduce new kcov unique modes.
>
> Overflow by how much? How much space is missing?
>
> > Solution Overview
> > -----------------
> >
> > 1. [P 1] Introduce `KCOV_TRACE_UNIQ_PC` Mode:
> >    - Export `KCOV_TRACE_UNIQ_PC` to userspace.
> >    - Add `kcov_map` struct to manage memory during the KCOV lifecycle.
> >      - `kcov_entry` struct as a hashtable entry containing unique PCs.
> >      - Use hashtable buckets to link `kcov_entry`.
> >      - Preallocate memory using genpool during KCOV initialization.
> >      - Move `area` inside `kcov_map` for easier management.
> >    - Use `jhash` for hash key calculation to support `KCOV_TRACE_UNIQ_CMP`
> >      mode.
> >
> > 2. [P 2-3] Introduce `KCOV_TRACE_UNIQ_EDGE` Mode:
> >    - Save `prev_pc` to calculate edges with the current IP.
> >    - Add unique edges to the hashmap.
> >    - Use a lower 12-bit mask to make hash independent of module offsets.
> >    - Distinguish areas for `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
> >      modes using `offset` during mmap.
> >    - Support enabling `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
> >      together.
> >
> > 3. [P 4] Introduce `KCOV_TRACE_UNIQ_CMP` Mode:
> >    - Shares the area with `KCOV_TRACE_UNIQ_PC`, making these modes
> >      exclusive.
> >
> > 4. [P 5] Add Example Code Documentation:
> >    - Provide examples for testing different modes:
> >      - `KCOV_TRACE_PC`: `./kcov` or `./kcov 0`
> >      - `KCOV_TRACE_CMP`: `./kcov 1`
> >      - `KCOV_TRACE_UNIQ_PC`: `./kcov 2`
> >      - `KCOV_TRACE_UNIQ_EDGE`: `./kcov 4`
> >      - `KCOV_TRACE_UNIQ_PC|KCOV_TRACE_UNIQ_EDGE`: `./kcov 6`
> >      - `KCOV_TRACE_UNIQ_CMP`: `./kcov 8`
> >
> > 5. [P 6-7] Disable KCOV Instrumentation:
> >    - Disable instrumentation like genpool to prevent recursive calls.
> >
> > Caveats
> > -------
> >
> > The userspace program has been tested on Qemu x86_64 and two real Android
> > phones with different ARM64 chips. More syzkaller-compatible tests have
> > been conducted. However, due to limited knowledge of other platforms,
> > assistance from those with access to other systems is needed.
> >
> > Results and Analysis
> > --------------------
> >
> > 1. KMEMLEAK Test on Qemu x86_64:
> >    - No memory leaks found during the `kcov` program run.
> >
> > 2. KCSAN Test on Qemu x86_64:
> >    - No KCSAN issues found during the `kcov` program run.
> >
> > 3. Existing Syzkaller on Qemu x86_64 and Real ARM64 Device:
> >    - Syzkaller can fuzz, show coverage, and find bugs. Adjusting `procs`
> >      and `vm mem` settings can avoid OOM issues caused by genpool in the
> >      patches, so `procs:4 + vm:2GB` or `procs:4 + vm:2GB` are used for
> >      Qemu x86_64.
> >    - `procs:8` is kept on Real ARM64 Device with 12GB/16GB mem.
> >
> > 4. Modified Syzkaller to Support New KCOV Unique Modes:
> >    - Syzkaller runs fine on both Qemu x86_64 and ARM64 real devices.
> >      Limited `Cover overflows` and `Comps overflows` observed.
> >
> > 5. Modified Syzkaller + Upstream Kernel Without Patch Series:
> >    - Not tested. The modified syzkaller will fall back to `KCOV_TRACE_PC`
> >      or `KCOV_TRACE_CMP` if `ioctl` fails for Unique mode.
> >
> > Possible Further Enhancements
> > -----------------------------
> >
> > 1. Test more cases and setups, including those in syzbot.
> > 2. Ensure `hash_for_each_possible_rcu` is protected for reentrance
> >    and atomicity.
> > 3. Find a simpler and more efficient way to store unique coverage.
> >
> > Conclusion
> > ----------
> >
> > These patches add new kcov unique modes to mitigate the kcov overflow
> > issue, compatible with both existing and new syzkaller versions.
>
> Thanks for the analysis, it's clearer now.
>
> However, the new design you introduce here adds lots of complexity.
> Answering the question of how much overflow is happening, might give
> better clues if this is the best design or not. Because if the
> overflow amount is relatively small, a better design (IMHO) might be
> simply implementing a compression scheme, e.g. a simple delta
> encoding.

Joey, do you have corresponding patches for syzkaller? I wonder how
the integration looks like, in particular when/how these maps are
cleared.

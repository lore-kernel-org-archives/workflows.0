Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFC33D7D8E
	for <workflows@vger.kernel.org>; Thu, 14 May 2026 08:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747913; cv=pass; b=TJxY3ptW0IbP1XyWKeCh39CRHCPC9H9RpyYIKMtrqG/6yZfWC/ZkptrqVxmS275UCf3h2haHV7uskXwNVa76ZhlOXLxxv1Z2eEAhatlCVz2m6OHqV083CG2/O34OrOJOjio08ATdCtI9CpG5lEWSs7P9YYcmdX23FmOkgcoB7RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747913; c=relaxed/simple;
	bh=VaqQbKPA6NgQ9qF1mAN5wsGIqRIhx0yr6mBHChkK+Ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MDd5wRotDGXft3ZAHc5oHoAhpXN4TfLznFNXIgJZeGnHTryqXSjGfHsUs+psB9e9naQdEey70DE1p+Dpzw2QIomGBMHq+l+8jypjgcvVp9si/drmxAnnMBtX1tsXXAjuWNh+uZDpSMDh1NLDGsFVbglFUo4bFtzYYaAtzjxEvS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WPCsqdgD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MGcjgvCc; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WPCsqdgD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MGcjgvCc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778747910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zPs8O+iCCRbIODbyW/JgtHoFsRlQldesKOqjqQqs550=;
	b=WPCsqdgD6ue8e5wA9i3KyteriOBooL1tlsRiPdjquxBmeg9T3qWfTMzxoSyA2NJqBZTzyk
	2Hqt/WDiQe9jxqcmKzxtY2vo7Kj1hV3gLzDUvdDyXMbc4xXPZIpnuniGLCN4WwwWuiLqAN
	oMt+ZUJQ9bwcubXXTniQxGOwUxc9Vj4=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-Fbl7Xt7mPbue3xsVlyZGYA-1; Thu, 14 May 2026 04:38:29 -0400
X-MC-Unique: Fbl7Xt7mPbue3xsVlyZGYA-1
X-Mimecast-MFC-AGG-ID: Fbl7Xt7mPbue3xsVlyZGYA_1778747908
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-651c0aae418so16357433d50.2
        for <workflows@vger.kernel.org>; Thu, 14 May 2026 01:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778747908; cv=none;
        d=google.com; s=arc-20240605;
        b=kPdaGWO43lbaCm2++GVX1VTUVE45ns3qnx7h27qeEbPS7bRjkTSSSjPtQI3Sv7hqLW
         g/GjAhisoVfK6OUInOtcRR5KUtu/PTTtwWuDYUSUVoNpAjIsGMId67DhLSdJry2wZYTT
         Yblnyb3JZIeb6VU3gBluRZZqxc2JB6gKWZPYnozdLkwwUlEIW89w+ZwE8LYbaeReb9zs
         Po2UjAblH22IbuU2Ozs3utxyUYq0prkdRZk9J80xqnIJaF1JJwQ9eRZKAwgvbhTd3rT1
         KIvNfkMOraPhVGumajGaYMlLuz48CwyGiwbLisFKZUM2VsOUTAZwYttoMMQmwoZKpAJ2
         59cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zPs8O+iCCRbIODbyW/JgtHoFsRlQldesKOqjqQqs550=;
        fh=un8hUVBD1781FmENUk9NlBiz/zyAtQDoc11lOD81ZfQ=;
        b=JeeIJYnIch2cd07+ZxBVV1jDeRJAbHYQpO5eYP7//f1q/7V70qLy0FfsyOjpfN17Jn
         f3geiaY+lX2LVRlrUEyvE+z7UTAPVg0I0eisAlfnkLUO0N3nNUHTV6wKgQQznY7y/HiQ
         1G9AqI38MF6ntp/RU9mCBwSpgsaqZRrb51i0R8kzh49ZsVn0ICT1sstR5kcLg1kIrfJK
         vCavHnymtYg8gpFaNvLuODprcT+cwZcLlFtV9WYTTVS7flHYziGT6J3hEIODsUmqlsUp
         Axf41vd6d4/+z2kw6Mnr5WrFYOX/hJX1J7KqzEZwelj5MWu0Wt2s4AUAB09wBF/6/F35
         HlFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778747908; x=1779352708; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPs8O+iCCRbIODbyW/JgtHoFsRlQldesKOqjqQqs550=;
        b=MGcjgvCcfgmKz6G4RSHsUSlNxRwQApF6uJvQeNFAHL5POA7Lk1VL/4Sine6yXlwcMO
         HG0fluuHQlBrZwpyT5jI2UZLoYbcjgzcdLvKt6HBC+CD2MhDPPyPU6WDEq4SjDtYpI00
         wEwFyHEt6XS03gOjM07gU6qcjMAGne4/VcOx3EPEfaUOxD4acAAvGN/0Wjeuig1wGIKl
         5M4xZ0UvISixZsMnQRq+zhiUrhunpOxybHHuxsmPv2b+fo3WnoRU9Nhd955OfIsxf/8t
         zbHe2RS3YZjdzCd4SgRKkIsSzSUBSu8Q8ZfKNMA1s3bi4UvbU8YJTTCLT9K0lj7QXHZ/
         685g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778747908; x=1779352708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zPs8O+iCCRbIODbyW/JgtHoFsRlQldesKOqjqQqs550=;
        b=m7QmvnwXrPzOo85wMTyS0/oi2WGnhjtD+sqbHwIzxqj6vctziHbmHTYpKvekEtsugT
         h9ANDSXWbBxUA+ba6ddExmMpph8BbNN9qQXuJjZNGJCAoWj14IIGG50yGQgdrjlrmU40
         ywn3Tz2MJvB2u1v02xVI8dtz0ERd+RHrDzT3rS9uAPTzOhq8fAev/K9raGFN1Gliz+Ak
         /z4ABzzNz1qWOhLSqEDkM2B2i5pMOC04g/n5wzgbD2XfLR1P2olOVmEXnSu35S2M9YOm
         l2xzbmGw7EB8FBgRFHmXYoFYlI9fYeLUAjWPBhu5yyyvAKt6azJPOIJvljW2FkuUqzTI
         g7aw==
X-Forwarded-Encrypted: i=1; AFNElJ+3Dl12LgeVk4/AFInqB5fA4Q7bKi9T9o35lRtarMcCBbgKJhtcDYN/AIldR5l9S9aCBUiny7fKFjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWt2E1yb/x0VFfoKQYHOcnpABiVP0eSPG6tD6hgXXNba9ewG5Y
	niGVFCPLm6ZSG0D88SYB9XjzlUSXLQincIl6hcL7g+pMZBdrURqOhBRjmt7IeNoai2f5VZDKWtw
	C75gxfKHzuCqAbu8TCrOo5Qmh8usqbyEDZjSkiJcTNCpIuThiDFcYFWNYIodhau2ES9FUVqdo98
	0oBDvhVUZBCDl69kGoVC/iX7UoPY62s0U1RboV
X-Gm-Gg: Acq92OGVrAvHU/+9ombhLTWYJJb6/D1ZX/IUDiRfTPSRWe9E6WktCX3qWEpZsuNmwSy
	+yJnGieGDYLLoJLvhrkSE26x/mVxhcdb7x4HGY7u8X0yS7NepI78Jz/JXAugfj26qN0ggI0U967
	5MPyDqPM+UH6if9P+ZIgeipsNRkqxatohzXf/+nOBgmRWilPZux43TlOuBVARk5h/NdFQEWonmV
	+KeGw==
X-Received: by 2002:a05:690c:10d:b0:7bd:6129:f254 with SMTP id 00721157ae682-7c6a9652f26mr69897727b3.10.1778747908367;
        Thu, 14 May 2026 01:38:28 -0700 (PDT)
X-Received: by 2002:a05:690c:10d:b0:7bd:6129:f254 with SMTP id
 00721157ae682-7c6a9652f26mr69897217b3.10.1778747907746; Thu, 14 May 2026
 01:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-kunit_add_support-v10-0-e379d206c8cd@redhat.com>
In-Reply-To: <20260513-kunit_add_support-v10-0-e379d206c8cd@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 14 May 2026 10:38:16 +0200
X-Gm-Features: AVHnY4Jt7JYtWDB6aMFv9n9eUF02rqii2PxLpwE7AKvBAtNaNKGRGbMgiSGsfd0
Message-ID: <CADSE00+vg+-fVwZ8DmL65taSwpkWN17CSjTfPoPypdE5+K_-=w@mail.gmail.com>
Subject: Re: [PATCH v10 0/4] kunit: Add support for suppressing warning backtraces
To: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 9:31=E2=80=AFAM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
>
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons:
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
>
> One option to address the problem would be to add messages such as
> "expected warning backtraces start/end here" to the kernel log.
> However, that would again require filter scripts, might result in
> missing real problematic warning backtraces triggered while the test
> is running, and the irrelevant backtrace(s) would still clog the
> kernel log.
>
> Solve the problem by providing a means to suppress warning backtraces
> originating from the current kthread while executing test code.
> Since each KUnit test runs in its own kthread, this effectively scopes
> suppression to the test that enabled it, without requiring any
> architecture-specific code.
>
> Overview:
> Patch#1 Introduces the suppression infrastructure integrated into
>         KUnit's hook mechanism.
> Patch#2 Adds selftests to validate the functionality.
> Patch#3 Demonstrates real-world usage in the DRM subsystem.
> Patch#4 Documents the new API and usage guidelines.
>
> Design Notes:
> Suppression is integrated into the existing KUnit hooks infrastructure,
> reusing the kunit_running static branch for zero overhead
> when no tests are running. The implementation lives entirely in the
> kunit module; only a static-inline wrapper and a function pointer
> slot are added to built-in code.
>
> Suppression is checked at three points in the warning path:
> - In `warn_slowpath_fmt()` (kernel/panic.c), for architectures without
>   __WARN_FLAGS. The check runs before any output, fully suppressing
>   both message and backtrace.
> - In `__warn_printk()` (kernel/panic.c), for architectures that define
>   __WARN_FLAGS but not their own __WARN_printf (arm64, loongarch,
>   parisc, powerpc, riscv, sh). The check suppresses the warning message
>   text that is printed before the trap enters __report_bug().
> - In `__report_bug()` (lib/bug.c), for architectures that define
>   __WARN_FLAGS. The check runs before `__warn()` is called, suppressing
>   the backtrace and stack dump.
>
> To avoid double-counting on architectures where both `__warn_printk()`
> and `__report_bug()` run for the same warning, the hook takes a bool
> parameter: true to increment the suppression counter, false to suppress
> without counting.
>
> The suppression state is dynamically allocated via kunit_kzalloc() and
> tied to the KUnit test lifecycle via `kunit_add_action()`, ensuring
> automatic cleanup at test exit. Writer-side access to the global
> suppression list is serialized with a spinlock; readers use RCU.
>
> Two API forms are provided:
> - kunit_warning_suppress(test) { ... }: scoped blocks with automatic
>   cleanup. The suppression handle is not accessible outside the block,
>   so warning counts (if needed) must be checked inside. Multiple
>   suppression blocks are allowed.
> - kunit_start/end_suppress_warning(test): direct functions that return
>   an explicit handle. Use when the handle needs to be retained, or passed
>   across helpers. Multiple suppression blocks are allowed.
>
> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-=
4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.
>
> Changes since RFC:
> - Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
> - Minor cleanups and bug fixes
> - Added support for all affected architectures
> - Added support for counting suppressed warnings
> - Added unit tests using those counters
> - Added patch to suppress warning backtraces in dev_addr_lists tests
>
> Changes since v1:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
>   [I retained those tags since there have been no functional changes]
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
>   default.
>
> Changes since v2:
> - Rebased to v6.9-rc2
> - Added comments to drm warning suppression explaining why it is needed.
> - Added patch to move conditional code in arch/sh/include/asm/bug.h
>   to avoid kerneldoc warning
> - Added architecture maintainers to Cc: for architecture specific patches
> - No functional changes
>
> Changes since v3:
> - Rebased to v6.14-rc6
> - Dropped net: "kunit: Suppress lock warning noise at end of dev_addr_lis=
ts tests"
>   since 3db3b62955cd6d73afde05a17d7e8e106695c3b9
> - Added __kunit_ and KUNIT_ prefixes.
> - Tested on interessed architectures.
>
> Changes since v4:
> - Rebased to v6.15-rc7
> - Dropped all code in __report_bug()
> - Moved all checks in WARN*() macros.
> - Dropped all architecture specific code.
> - Made __kunit_is_suppressed_warning nice to noinstr functions.
>
> Changes since v5:
> - Rebased to v7.0-rc3
> - Added RCU protection for the suppressed warnings list.
> - Added static key and branching optimization.
> - Removed custom `strcmp` implementation and reworked
>   __kunit_is_suppressed_warning() entrypoint function.
>
> Changes since v6:
> - Moved suppression checks from WARN*() macros to warn_slowpath_fmt()
>   and __report_bug().
> - Replaced stack-allocated suppression struct with kunit_kzalloc() heap
>   allocation tied to the KUnit test lifecycle.
> - Changed suppression strategy from function-name matching to task-scoped=
:
>   all warnings on the current task are suppressed between START and END,
>   rather than only warnings originating from a specific named function.
> - Simplified macro API: removed KUNIT_DECLARE_SUPPRESSED_WARNING(),
>   the START macro now takes (test) and handles allocation internally.
> - Removed static key and branching optiomization, as by the time it
>   was executed, callers are already in warn slowpaths.
> - Link to v6: https://lore.kernel.org/r/20260317-kunit_add_support-v6-0-d=
d22aeb3fe5d@redhat.com
>
> Changes since v7:
> - Integrated suppression into existing KUnit hooks infrastructure
> - Removed CONFIG_KUNIT_SUPPRESS_BACKTRACE
> - Added suppression check in __warn_printk()
> - Added spinlock for writer-side RCU protection
> - Replaced explicit rcu_read_lock/unlock with guard(rcu)()
> - Added scoped API (kunit_warning_suppress) using __cleanup attribute
> - Updated DRM patch to use scoped API
> - Expanded self-tests: incremental counting, cross-kthread isolation
> - Rewrote documentation covering all three API forms with examples
> - Link to v7: https://lore.kernel.org/r/20260420-kunit_add_support-v7-0-e=
8bc6e0f70de@redhat.com
>
> Changes since v8:
> - Rebased to v7.1-rc2
> - Remove KUNIT_START/END_SUPPRESSED_WARNING() macros
> - Add KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT checks to drm tests
> - Link to v8: https://lore.kernel.org/r/20260504-kunit_add_support-v8-0-3=
e5957cdd235@redhat.com
>
> Changes since v9:
> - Fix silent false-pass when kunit_start_suppress_warning() returns NULL
> - Fix RCU lockdep splat for kunit_is_suppressed_warning() calls
> - Move disable_trace_on_warning() in __report_bug()
> - Make suppress counter atomic
> - Mark helper warn functions in selftest as noinline
> - Add kunit_skip() for CONFIG_BUG=3Dn in selftests
> - Fix potentially uninitialized data.was_active in kthread seltest
> - Add kthread_stop() in kthread selftest early exit
> - Initialize scaling_factor to INT_MIN in DRM scaling tests
> - Add include for bool in test-bug.h to fix CONFIG_KUNIT=3Dn case

These were mostly sashiko + kernel test robot comments.

The current version is available at
https://sashiko.dev/#/patchset/20260513-kunit_add_support-v10-0-e379d206c8c=
d%40redhat.com,
which again has a few comments that I'd consider potential real
issues.

I think `synchronize_rcu()` can be removed in patch 1, to avoid one of
the mentioned issues. The struct kunit_suppressed_warning task would
be safer if we increased its refcount. I'll take a reference on
task_struct via get_task_struct() when starting suppression and
release it on cleanup.

We can address the kthread use-after-free problem with the warn
suppression selftest by actively looping while waiting for
kthread_stop().

Finally, I am thinking of adding something like this to the drm test
(similar to what we do with the suppression selftest):
```
if (!IS_ENABLED(CONFIG_BUG))
        kunit_skip(test, "requires CONFIG_BUG");
```
While sashiko is right about this, it is a bit annoying having to add
this to tests that want to use the suppression API, especially since
we are setting the drm test as a "real-life example". But I'd say that
it is better to warn that the configuration is required rather than
fail an assertion without knowing the reason.

Overall, these comments were slightly nitpicky already. So I hope I
can clear them all with a new version. Sorry for the added noise, but
it's better to fix these before merging!

> - Link to v9: https://lore.kernel.org/r/20260508-kunit_add_support-v9-0-9=
9df7aa880f6@redhat.com
>
> --
> 2.34.1
>
> ---
> To: Brendan Higgins <brendan.higgins@linux.dev>
> To: David Gow <david@davidgow.net>
> To: Rae Moar <raemoar63@gmail.com>
> To: Andrew Morton <akpm@linux-foundation.org>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Jonathan Corbet <corbet@lwn.net>
> To: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-kselftest@vger.kernel.org
> Cc: kunit-dev@googlegroups.com
> Cc: linux-riscv@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: workflows@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
>
> ---
> Alessandro Carminati (1):
>       bug/kunit: Core support for suppressing warning backtraces
>
> Guenter Roeck (3):
>       kunit: Add backtrace suppression self-tests
>       drm: Suppress intentional warning backtraces in scaling unit tests
>       kunit: Add documentation for warning backtrace suppression API
>
>  Documentation/dev-tools/kunit/usage.rst |  46 +++++++-
>  drivers/gpu/drm/tests/drm_rect_test.c   |  32 +++++-
>  include/kunit/test-bug.h                |  26 +++++
>  include/kunit/test.h                    |  98 ++++++++++++++++
>  kernel/panic.c                          |  11 ++
>  lib/bug.c                               |  14 ++-
>  lib/kunit/Makefile                      |   4 +-
>  lib/kunit/backtrace-suppression-test.c  | 196 ++++++++++++++++++++++++++=
++++++
>  lib/kunit/bug.c                         | 119 +++++++++++++++++++
>  lib/kunit/hooks-impl.h                  |   2 +
>  10 files changed, 538 insertions(+), 10 deletions(-)
> ---
> base-commit: 74fe02ce122a6103f207d29fafc8b3a53de6abaf
> change-id: 20260312-kunit_add_support-2f35806b19dd
>
> Best regards,
> --
> Albert Esteve <aesteve@redhat.com>
>


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0A148164F
	for <workflows@vger.kernel.org>; Fri, 15 May 2026 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854466; cv=pass; b=PZPna8gng+h0IZKq6mFEl1K0YRwz+pluEe1e4iJVIgKKbr+/jsjaCZQP4a5CcA2HcBkrOnOc9smFDAXCm1ESnZinCc7HUferSzXTcITnNYMGMluvSSMlr4TPjMW2B++7tmKEQh8KxrmHAdDgsxoiq2Tdpzw/vh/o5Ueq/qyaF7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854466; c=relaxed/simple;
	bh=FaxTYlTBleuGE3zOrA0kjtoeT54kzZ578UmRae1Nmsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eLaQm794/UnaKwPJV3y3yerw+rFXu3ERVxHOXkt+TOcLYS2++cg2KmtE8WbH2pM+3rUpoz7Qwbj7aZps/zBihmsFIkhx32eVA8K+LdnsS9Sf6ULAT4+AaOjlpGYZzR9JumQROkQtUlDBrlXzIgbqLUrBakzlTVH0iFf91kFApFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lqu1H4mM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WZoy1OYB; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lqu1H4mM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WZoy1OYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778854462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VObRtO05jubkBNdePEiKs8bkHI05Ids5T/0ogzpYITY=;
	b=Lqu1H4mM1XUb+iN1CrV66E+RvjgBAglgImq2S6x4ws8vfgwpNqu+BtfNGWADIu2PKVP14U
	MXRSAfbsSsnc2f5k9zaGGcsIKIjn0Puazh3xCoGOc1GQMg/TbT4BfWgZoBVJKdlSE2wyua
	Pj4TkW36cR3VpDUv1zKcu1wdQrU9IMw=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-uapL4tgDOI2qbBOjHYokQg-1; Fri, 15 May 2026 10:14:20 -0400
X-MC-Unique: uapL4tgDOI2qbBOjHYokQg-1
X-Mimecast-MFC-AGG-ID: uapL4tgDOI2qbBOjHYokQg_1778854460
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-651bd07888eso22395567d50.2
        for <workflows@vger.kernel.org>; Fri, 15 May 2026 07:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778854460; cv=none;
        d=google.com; s=arc-20240605;
        b=hiA3U+GrQh05cqB9vmIsMmvrIL1sf3Oo7lRqCKztaLBebnvjEajUUGc9wvuF9HIRzj
         Di3dqxvmEsM5apS7AqX9FAeL+MQe2ayimVb3KWrHISUYdVk5Y21XBb86Kw1tqcsjwtAo
         2QMeYkIifTUo/NlwzEGzNe4youf+a8wLVYcrPH00wxUKCelR3Ci/mPJwTvRhbAN57AuD
         xsBY1te2OkLcNfFInqJ7F4+avLPM1jXQ6IRav8bcUnvPgmLaeYxck2sGyHFqFB7VoT6y
         m/nmw9LLhrxH1mKKFCMmTZSB9K+YI6coKLJOj8/tjKxGbj8XQHRSQyXxDnLPX7DJrz6v
         a2aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VObRtO05jubkBNdePEiKs8bkHI05Ids5T/0ogzpYITY=;
        fh=6UiprjpN6xUs49dA7paUpE6sWMHSUNf66G7zqBxJv9Y=;
        b=Ofmquy2Fm7Bsv4Py+Ta3m0E3qjhsY+IbX1pocqrv8q7SaQTSmM4aciH9Wtcu9c2D2U
         dXR2zP+XsMlHBf93SCFiOfG1rfdiOH/775XZW9DiRXpZA12jbeDuenZeNyvTRwYKz97g
         7dabu4tW17C0UWaZMtiUypZW+gCEy0hCdJE4pCnuj55pJeHf0kdU4xrsMr4XMTfgn7AL
         8Zew64xAQHBKaB2LYr+sqmLST89/bVlQoZ7ET6bEo0LG499Sp4gnwre797tQpIXAgbZB
         MYkVb3cAfVSBQzKey01mLTv3O5KoFmnqwjF3dFcGSVX0J/T1o9/Q0wnkxeYo1KHAqH7M
         zpZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778854460; x=1779459260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VObRtO05jubkBNdePEiKs8bkHI05Ids5T/0ogzpYITY=;
        b=WZoy1OYBYdppYYUte1dhqnqK7YGtlRhaSDcG59YyS5Xr2LfVf1a5Au33jKpgEEslGV
         NFOjNOTFz2cTY0aYBH1KArvI5/0NKuIsBplDjePnNncbw54a9yJb0lD8W0Bp0pZ+juqm
         UTraJko5hw1WZPj+nA3Ye5e8eQxDJKJKlAZ1+qBtXWJ6Og6n/F26wcOo2B2hidE2KdLL
         TJvKil4x9GBgZ/aS+83+PMoDjVVWHaoqYp1SV5kVI24kNf5VyTPtgcyWdOoPXG0QTf6C
         GFs2oUK3Yd5eeYntmuFWPo8mEQHHaQjsUmtgTohQP2CD+s8ajOItKQNnBqzKW2+FVDeV
         0Z0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778854460; x=1779459260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VObRtO05jubkBNdePEiKs8bkHI05Ids5T/0ogzpYITY=;
        b=BJoA2//jyJnlQfhU9HoxTu1mvajCNDaCq7RMZ9/RACvdKu8ph8NkefXbrZWW/Iwfu0
         mSZTG78IbqcluDRHPUFCVmvKfJYwNBG339IEprW37m23OMSyO0hl5sH562IGfbNzq5VZ
         WoXSAoenk+UYQ8XzTSRgWNgfu5F0DQdVoRA0bUxwJacos4fMexv4YZLVpRc+PWsI6iHN
         rWE7xRSe9J+LFOA2Om1X8bdHUAH1XCL+Uk0znl+AbB/spETaNw1UEtX5tkSuvSeHjtdE
         iBGNJXvKXbrh5GFddyIWBAqbd3DzBYzl0LBnPnMkp2NVKg2MmKyo5IgFBD1HLVJlqUSB
         4+Gw==
X-Forwarded-Encrypted: i=1; AFNElJ99P50CSOl+kuyRPgJ1vjtzzjg9SuZtAHrTUPx+QnZLbsCh7uqMk/A1xqpKZQrOYmekTHOgn+Rszes=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNDFEJ7KJ/SOISL5ZxKtoO5QxGnCx6XoHa9XEAGonqXHe8rB/1
	tbx5nIPUzI5DpbLZkGz07fBwEpzhWp65cfcboHpYayEEYmEs/iqGcnZrJcRzSjyAxlcnPszYyzE
	K0/vde17g09qxxjwsqsEt4Qs1uEfnbil7Sf2XorP80LDtnZ9AMome71NlFKjVeDck3ZkEfgZCqQ
	FK7xyzn+4n55781ZHUMKz4qBKnLX2ZSHIl/eCv
X-Gm-Gg: Acq92OE5t1El64V+1U9APtqgWEEOUR4MFnj7RRtTOz0VVIMh18CmAWI5l5PaDOIrDO0
	eId3hI5xPZjqhhsZbkph/HO7TkU7oyBJxoRFeMhge9pLZkOi4s+4GcxnyJfy9Wq+aR15HtwNMjE
	fLXqJjGNYdxNx3oDHFDR34N2KhIqtKQzisEqPnDcGvNlWJXJVH7jGP0IZXwC0LxVgA+6rIYbU1S
	Mvqnw==
X-Received: by 2002:a05:690c:4a08:b0:7ba:ef98:9712 with SMTP id 00721157ae682-7c959a9a3e0mr45636097b3.11.1778854459904;
        Fri, 15 May 2026 07:14:19 -0700 (PDT)
X-Received: by 2002:a05:690c:4a08:b0:7ba:ef98:9712 with SMTP id
 00721157ae682-7c959a9a3e0mr45635597b3.11.1778854459379; Fri, 15 May 2026
 07:14:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com> <20260515-kunit_add_support-v13-2-18ee42f96e7b@redhat.com>
In-Reply-To: <20260515-kunit_add_support-v13-2-18ee42f96e7b@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 15 May 2026 16:14:07 +0200
X-Gm-Features: AVHnY4KpgDDXeYFVXYd1aCpKGaTXXGfKzXerArdIzcyo8M52liefZmNjWABG4yY
Message-ID: <CADSE00LZD0+TMxkCgH5YEwjdPggx8X5ZrHEFx_ku0wBSjS_Oyw@mail.gmail.com>
Subject: Re: [PATCH v13 2/4] kunit: Add backtrace suppression self-tests
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
	peterz@infradead.org, Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Alessandro Carminati <acarmina@redhat.com>, Dan Carpenter <error27@gmail.com>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 2:30=E2=80=AFPM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> From: Guenter Roeck <linux@roeck-us.net>
>
> Add unit tests to verify that warning backtrace suppression works.
>
> Tests cover both API forms:
> - Scoped: kunit_warning_suppress() with in-block count verification
>   and post-block inactivity check.
> - Direct functions: kunit_start/end_suppress_warning() with
>   sequential independent suppression blocks and per-block counts.
>
> Furthermore, tests verify incremental warning counting, that
> kunit_has_active_suppress_warning() transitions correctly around
> suppression boundaries, and that suppression active in the test
> kthread does not leak to a separate kthread.
>
> If backtrace suppression does _not_ work, the unit tests will likely
> trigger unsuppressed backtraces, which should actually help to get
> the affected architectures / platforms fixed.
>

Another set of sashiko comments for this patch
https://sashiko.dev/#/patchset/20260515-kunit_add_support-v13-0-18ee42f96e7=
b%40redhat.com?part=3D2
here:

1. CPU spike from while (!kthread_should_stop()) schedule()
Ha! I expected this one because I saw it in a previous review from the
bot. schedule() from TASK_RUNNING yields the CPU; it does not
spin-wait. The thread is rescheduled only when the scheduler gives it
time, not in a tight loop. But the important thing is that the window
where this loop actually runs is negligible: the parent calls
kthread_stop() immediately after wait_for_completion() returns. Using
set_current_state(TASK_INTERRUPTIBLE) would be slightly more
CPU-friendly, but for a test that probably runs and exits in
microseconds, it makes no practical difference. And it unnecessarily
adds complexity.

2. Orphaned kthread on early abort
This cannot happen in this test. The only KUNIT_ASSERT_* that could
abort early is KUNIT_ASSERT_FALSE(test, IS_ERR(task)). If that
assertion fails, it means kthread_run() itself returned an error,
therefore, the kthread was never started and there is nothing to
orphan. If kthread_run() succeeds, the assertion passes, and execution
continues sequentially to kthread_stop(). No code path allows a live
kthread to exist while bypassing kthread_stop().

> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> Reviewed-by: David Gow <david@davidgow.net>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  lib/kunit/Makefile                     |   1 +
>  lib/kunit/backtrace-suppression-test.c | 192 +++++++++++++++++++++++++++=
++++++
>  2 files changed, 193 insertions(+)
>
> diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> index 4592f9d0aa8dd..2e8a6b71a2ab0 100644
> --- a/lib/kunit/Makefile
> +++ b/lib/kunit/Makefile
> @@ -22,6 +22,7 @@ obj-$(if $(CONFIG_KUNIT),y) +=3D                hooks.o
>
>  obj-$(CONFIG_KUNIT_TEST) +=3D            kunit-test.o
>  obj-$(CONFIG_KUNIT_TEST) +=3D            platform-test.o
> +obj-$(CONFIG_KUNIT_TEST) +=3D            backtrace-suppression-test.o
>
>  # string-stream-test compiles built-in only.
>  ifeq ($(CONFIG_KUNIT_TEST),y)
> diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtrace=
-suppression-test.c
> new file mode 100644
> index 0000000000000..59a038b2739f5
> --- /dev/null
> +++ b/lib/kunit/backtrace-suppression-test.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit test for suppressing warning tracebacks.
> + *
> + * Copyright (C) 2024, Guenter Roeck
> + * Author: Guenter Roeck <linux@roeck-us.net>
> + */
> +
> +#include <kunit/test.h>
> +#include <linux/bug.h>
> +#include <linux/completion.h>
> +#include <linux/kthread.h>
> +
> +static void backtrace_suppression_test_warn_direct(struct kunit *test)
> +{
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +
> +       kunit_warning_suppress(test) {
> +               WARN(1, "This backtrace should be suppressed");
> +               /*
> +                * Count must be checked inside the scope; the handle
> +                * is not accessible after the block exits.
> +                */
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
> +       }
> +       KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
> +}
> +
> +static noinline void trigger_backtrace_warn(void)
> +{
> +       WARN(1, "This backtrace should be suppressed");
> +}
> +
> +static void backtrace_suppression_test_warn_indirect(struct kunit *test)
> +{
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +
> +       kunit_warning_suppress(test) {
> +               trigger_backtrace_warn();
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
> +       }
> +}
> +
> +static void backtrace_suppression_test_warn_multi(struct kunit *test)
> +{
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +
> +       kunit_warning_suppress(test) {
> +               WARN(1, "This backtrace should be suppressed");
> +               trigger_backtrace_warn();
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 2);
> +       }
> +}
> +
> +static void backtrace_suppression_test_warn_on_direct(struct kunit *test=
)
> +{
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +
> +       kunit_warning_suppress(test) {
> +               WARN_ON(1);
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
> +       }
> +}
> +
> +static noinline void trigger_backtrace_warn_on(void)
> +{
> +       WARN_ON(1);
> +}
> +
> +static void backtrace_suppression_test_warn_on_indirect(struct kunit *te=
st)
> +{
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +
> +       kunit_warning_suppress(test) {
> +               trigger_backtrace_warn_on();
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
> +       }
> +}
> +
> +static void backtrace_suppression_test_count(struct kunit *test)
> +{
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +
> +       kunit_warning_suppress(test) {
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 0);
> +
> +               WARN(1, "suppressed");
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
> +
> +               WARN(1, "suppressed again");
> +               KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 2);
> +       }
> +}
> +
> +static void backtrace_suppression_test_active_state(struct kunit *test)
> +{
> +       KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
> +
> +       kunit_warning_suppress(test) {
> +               KUNIT_EXPECT_TRUE(test, kunit_has_active_suppress_warning=
());
> +       }
> +
> +       KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
> +
> +       kunit_warning_suppress(test) {
> +               KUNIT_EXPECT_TRUE(test, kunit_has_active_suppress_warning=
());
> +       }
> +
> +       KUNIT_EXPECT_FALSE(test, kunit_has_active_suppress_warning());
> +}
> +
> +static void backtrace_suppression_test_multi_scope(struct kunit *test)
> +{
> +       struct kunit_suppressed_warning *sw1, *sw2;
> +
> +       if (!IS_ENABLED(CONFIG_BUG))
> +               kunit_skip(test, "requires CONFIG_BUG");
> +
> +       sw1 =3D kunit_start_suppress_warning(test);
> +       trigger_backtrace_warn_on();
> +       WARN(1, "suppressed by sw1");
> +       kunit_end_suppress_warning(test, sw1);
> +
> +       sw2 =3D kunit_start_suppress_warning(test);
> +       WARN(1, "suppressed by sw2");
> +       kunit_end_suppress_warning(test, sw2);
> +
> +       KUNIT_EXPECT_EQ(test, kunit_suppressed_warning_count(sw1), 2);
> +       KUNIT_EXPECT_EQ(test, kunit_suppressed_warning_count(sw2), 1);
> +}
> +
> +struct cross_kthread_data {
> +       bool was_active;
> +       struct completion done;
> +};
> +
> +static int cross_kthread_fn(void *data)
> +{
> +       struct cross_kthread_data *d =3D data;
> +
> +       d->was_active =3D kunit_has_active_suppress_warning();
> +       complete(&d->done);
> +       while (!kthread_should_stop())
> +               schedule();
> +       return 0;
> +}
> +
> +static void backtrace_suppression_test_cross_kthread(struct kunit *test)
> +{
> +       struct cross_kthread_data data;
> +       struct task_struct *task;
> +
> +       data.was_active =3D false;
> +       init_completion(&data.done);
> +
> +       kunit_warning_suppress(test) {
> +               task =3D kthread_run(cross_kthread_fn, &data, "kunit-cros=
s-test");
> +               KUNIT_ASSERT_FALSE(test, IS_ERR(task));
> +               wait_for_completion(&data.done);
> +               kthread_stop(task);
> +       }
> +
> +       KUNIT_EXPECT_FALSE(test, data.was_active);
> +}
> +
> +static struct kunit_case backtrace_suppression_test_cases[] =3D {
> +       KUNIT_CASE(backtrace_suppression_test_warn_direct),
> +       KUNIT_CASE(backtrace_suppression_test_warn_indirect),
> +       KUNIT_CASE(backtrace_suppression_test_warn_multi),
> +       KUNIT_CASE(backtrace_suppression_test_warn_on_direct),
> +       KUNIT_CASE(backtrace_suppression_test_warn_on_indirect),
> +       KUNIT_CASE(backtrace_suppression_test_count),
> +       KUNIT_CASE(backtrace_suppression_test_active_state),
> +       KUNIT_CASE(backtrace_suppression_test_multi_scope),
> +       KUNIT_CASE(backtrace_suppression_test_cross_kthread),
> +       {}
> +};
> +
> +static struct kunit_suite backtrace_suppression_test_suite =3D {
> +       .name =3D "backtrace-suppression-test",
> +       .test_cases =3D backtrace_suppression_test_cases,
> +};
> +kunit_test_suites(&backtrace_suppression_test_suite);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("KUnit test to verify warning backtrace suppression")=
;
>
> --
> 2.53.0
>


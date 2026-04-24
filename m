Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321243290C2
	for <workflows@vger.kernel.org>; Fri, 24 Apr 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019162; cv=pass; b=dJlV2/6+q3mdBmwsjmQP1FnQE0ZcvjwP0LWTmOwFCV303drqpenweebfVHotDzGb8WvnPeqSHiAEkOf27YTsdMqmBT8NVqF6zKhyUgL7ZSH/0Ec/y7ZUqUliGXSdZtYeAbCCJoHNf9P4V8j8MIKX/GG0a/YD250bvCeSHu2bQJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019162; c=relaxed/simple;
	bh=ziZKgHefNOY3Gp3E8pQl4CZg9AJ+Uc27sgzHHIO//Kw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X76XMKoj7t2DKwnBcUrUhkpbRlWmV/CCAb8WNG+obtnykM08oMqq4hEMixIvOeouo5wsAdVWbMhkg4die/gX4pbd6kx0aXPIR0ZvKdijoG9gr925f1jQd5Cmj0CrT4glkBSVySKKFJ6s6TbZCifKqj1jxF+og9J8eICrNrwKMCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NBjiUxpJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=deBWnpGx; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NBjiUxpJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="deBWnpGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777019158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iddsQLueoQEOIJwe4Gfj6if9K+aRVWtEbx6BS4m334s=;
	b=NBjiUxpJHQPExOF6o9oXn6dw/W4n+sqGG0FRArICIu9Rc9tmA5BBWuU9muZcSKTeERoFek
	i+FcO5dFq+wu0aL77b4OgcJ1+V6h3Ne3dERO2jitSnD8fAVjtkhVogA0wVuLU+nmuD/qlA
	Wxw3+te8sSag4kcXw1awXBbuXwvt9y8=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-2OegOO0FO-i307ju456VAg-1; Fri, 24 Apr 2026 04:25:47 -0400
X-MC-Unique: 2OegOO0FO-i307ju456VAg-1
X-Mimecast-MFC-AGG-ID: 2OegOO0FO-i307ju456VAg_1777019147
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-79064868702so171539037b3.3
        for <workflows@vger.kernel.org>; Fri, 24 Apr 2026 01:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777019147; cv=none;
        d=google.com; s=arc-20240605;
        b=kerzGhQLTqsVQ2lpy6EEkHySGmdPZeL6Pm+/J/DnkjmtkfrPALfQy6tTMWBi1TUQvp
         u+VemPlq1B0mxnzC8BOx1NoAvKtGXk3qqg3tmWMLCs15mLqCl5WA2B0zBfZPVlzM6ww/
         7xodB0mu/oAvBobysELSvl1upKysYK4pTli4pnIpIagH6yx52ScyGn6oIF/2fj1YrUpo
         kqB100Ct6ccLTpTm+woELgpfQ6Azfu61I9ZMc1r1SDfUknm3Qe1+4K+YnBQl9H1t7uq9
         l0nNqxzwLGc8P3iW481Ft7pQ3NVaB0HcWaXWG9XexgLGw85+8kczU27faGXDtQNIupTX
         ikFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iddsQLueoQEOIJwe4Gfj6if9K+aRVWtEbx6BS4m334s=;
        fh=IXZtxl49cgIKBMpAjv79/K07WR//RDAV9sID9rQG4Qk=;
        b=VcSeO1X8URHOrmTpYUqkYLlNUAEEeUx8Ecw16jAsLmBqKUKMzK1vACDHbyojWMfFcD
         jI+mSK+4T5FxAnBOGrdhgU7KHel/AijxJFE/jaExkNrNJ6sJ+nNWownHU9DKoYRPpnsE
         FhebbuiY3qs1kbSzCLn/c3Eu3n823H3mgRNGLYV5eZ0GlmW8jofUwqn/wPHu/Un1qunp
         U29l8gZaTy0XFIGLLWa5hM4zSaWyK3cmxMBVOwwT23UFQMYJ8gh4LEG9oT0ZukkX5iQE
         F38sPzjGT0uOzZyhSk1zbeYmftoOYSgB13GmPDbI1u2F0UjWAO3txbHRP6eejNV3kaEi
         1xhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777019147; x=1777623947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iddsQLueoQEOIJwe4Gfj6if9K+aRVWtEbx6BS4m334s=;
        b=deBWnpGx0TzWfxlS8DSa91QH8S002DvmPYTP0iJYDiNByDbx7SN1KA7NCE8TtUiJuQ
         jWa/njAZ6Cua/1VNAH+/mo5bzRF2aKtjwR00HqMvys81byY7UpI2i7KPN0RivXyMVjuG
         sOpvDj8tpT/Ji2qd/mIWBq2OnPhf1T/OBciNk7rTVO0r3dWluVColRAmYl3JtWS9SZkg
         V5va8JYh6qhsB6ohCv99Amo+iQxrbEZdBM9U2zngncnDNEHlTqwOpd6CBOzqun9wiULT
         jMqc+gf+wtIRRjKRluwRPZYvjZT0zvnt67t30aM8p6C0SCukoein+tby1bnr/s41JB2K
         qxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777019147; x=1777623947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iddsQLueoQEOIJwe4Gfj6if9K+aRVWtEbx6BS4m334s=;
        b=EWHTujNNcEeSpyGZTXdiSeRpbXFFMLaDQmRLNitlSPsad9MdsFTTWLF4/VXZJa00sU
         9OCXL1mT5x2bmBCCrDr0JzT7axAGV9Jh5gkrN3ymDkQw3vPFbXCo17TL+oPKzKZXImXT
         GV4PDS3jvExqT6856SEqRIkuNe6VBlOMm4pH9OamYvPDsEBBaT4+7DGlmiM+6GH+uEs8
         91pmuZMo1iTFxZbcEuQ6QRptg5pd5T1vNcsDXAswoFwCFK1IZinYjcgnTwEo5VbTqGTr
         3IGgY7n17IlyDQria0M3YY6jHkW2UDRf/vJOTAWQ5bFiH9T7rF7CJpnE7LqRVna/YwEq
         9etg==
X-Forwarded-Encrypted: i=1; AFNElJ9r9756cBKfKKnajWoymFtWq4+x9clOjuoiksfW7u9Zo//wOVGqMoWK3obph9HvvwLuC86fJPxxWUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdpVaE01hWLIdPM37zxyJiIDC+PbQwsmRxFtjDEjMBjbRwN944
	kJ7YCDt3hlh2YTBmTbvOg6/vGATuWvH8orh73E0Df0p+BUXA5xXor4pm7Rzv+JfUxy6eAiUsu2w
	n7KjJxfErrRDFCNaV02PH8raHjSvXgjxTZwVcJFLnAT08vy0Iy4jMWgzXZiwh1ZRmpuS89aRoO3
	0t+WgaIpdnwxxBqfjVA0vQ5adgCg6cLEkEGQZt
X-Gm-Gg: AeBDiesy7+UYBBrN33uPYhEQHEQg4p5B5GEb/eD3hBGdt6tN2Z7erPMVpU4eZxuBJ/B
	qpB7vaTxE8e1A5tPnSd78FHEfosbJU8b8rO4wrW6YRCWFebnPdB7CuLxMX6efzTfxc58S+mJjlM
	c6QsIwvn9kAAE1txXD1dj3lfxU56HZvH23ilXPP+Vho+z8YPJXhvdM3Blb+RjzuAX20MB+8tzPq
	57hvSVWLkVNGYrL
X-Received: by 2002:a05:690c:9:b0:7bb:712:a74f with SMTP id 00721157ae682-7bb0712abfdmr142445417b3.17.1777019147041;
        Fri, 24 Apr 2026 01:25:47 -0700 (PDT)
X-Received: by 2002:a05:690c:9:b0:7bb:712:a74f with SMTP id
 00721157ae682-7bb0712abfdmr142445227b3.17.1777019146632; Fri, 24 Apr 2026
 01:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-3-e8bc6e0f70de@redhat.com> <6209f24e-750d-4a7d-ad63-1695f5fd1caa@davidgow.net>
In-Reply-To: <6209f24e-750d-4a7d-ad63-1695f5fd1caa@davidgow.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 24 Apr 2026 10:25:35 +0200
X-Gm-Features: AQROBzC8_2POWCOFYR1L1LoP_YwcAOa38lshWUv2qs6X6k9mWiut3V_iTEcCLAA
Message-ID: <CADSE00+Ch2QtfsjOcKRNXY9Au8sv5E7Jdd8Rhb2dA6ODu+EDOw@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] kunit: Add backtrace suppression self-tests
To: David Gow <david@davidgow.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Rae Moar <raemoar63@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, peterz@infradead.org, 
	Guenter Roeck <linux@roeck-us.net>, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Alessandro Carminati <acarmina@redhat.com>, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 2:22=E2=80=AFPM David Gow <david@davidgow.net> wrot=
e:
>
> Le 20/04/2026 =C3=A0 8:28 PM, Albert Esteve a =C3=A9crit :
> > From: Guenter Roeck <linux@roeck-us.net>
> >
> > Add unit tests to verify that warning backtrace suppression works,
> > covering WARN() and WARN_ON() with direct calls, indirect calls
> > through helper functions, and multiple warnings in a single window.
> >
> > If backtrace suppression does _not_ work, the unit tests will likely
> > trigger unsuppressed backtraces, which should actually help to get
> > the affected architectures / platforms fixed.
> >
> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
>
> Thanks very much for including tests!
>
> Maybe it'd be nice to test that the suppression is disabled after
> KUNIT_END_SUPPRESSED_WARNING(). Of course, then triggering an actual
> stacktrace would be a pain, but maybe we could check that
> __kunit_is_suppressed_warning() returns false? If you wanted to be
> really fancy, you could test that it returns false on another kthread
> even while the suppression is active, too, but I won't hold you to it.
> Equally, you could try setting up a fake test context and ensuring the
> cleanup is called correctly, but I think that's mostly covered by the
> existing KUnit resource tests.

 Good suggestions. I'll add a test for __kunit_is_suppressed_warning()
returning false after END. The cross-kthread test is a nice idea too.
I'll see if I can fit it in without overcomplicating things.

>
> Otherwise, looking good. A couple of other minor suggestions below,
> which may require some reworking of the __kunit_suppress scope, but all
> optional suggestions.
>
> Reviewed-by: David Gow <david@davidgow.net>

Thanks for the review!

>
> >   lib/kunit/Makefile                     |  3 ++
> >   lib/kunit/backtrace-suppression-test.c | 90 +++++++++++++++++++++++++=
+++++++++
> >   2 files changed, 93 insertions(+)
> >
> > diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> > index fe177ff3ebdef..b2f2b8ada7b71 100644
> > --- a/lib/kunit/Makefile
> > +++ b/lib/kunit/Makefile
> > @@ -23,6 +23,9 @@ obj-$(if $(CONFIG_KUNIT),y) +=3D              hooks.o=
 \
> >
> >   obj-$(CONFIG_KUNIT_TEST) +=3D         kunit-test.o
> >   obj-$(CONFIG_KUNIT_TEST) +=3D         platform-test.o
> > +ifeq ($(CONFIG_KUNIT_SUPPRESS_BACKTRACE),y)
> > +obj-$(CONFIG_KUNIT_TEST) +=3D          backtrace-suppression-test.o
> > +endif
> >
> >   # string-stream-test compiles built-in only.
> >   ifeq ($(CONFIG_KUNIT_TEST),y)
> > diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtra=
ce-suppression-test.c
> > new file mode 100644
> > index 0000000000000..2ba5dcb5fef35
> > --- /dev/null
> > +++ b/lib/kunit/backtrace-suppression-test.c
> > @@ -0,0 +1,90 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KUnit test for suppressing warning tracebacks.
> > + *
> > + * Copyright (C) 2024, Guenter Roeck
> > + * Author: Guenter Roeck <linux@roeck-us.net>
> > + */
> > +
> > +#include <kunit/test.h>
> > +#include <linux/bug.h>
> > +
> > +static void backtrace_suppression_test_warn_direct(struct kunit *test)
> > +{
> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> > +     WARN(1, "This backtrace should be suppressed");
> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> > +
> > +     KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(), 1);
> > +}
> > +
> > +static void trigger_backtrace_warn(void)
> > +{
> > +     WARN(1, "This backtrace should be suppressed");
> > +}
> > +
> > +static void backtrace_suppression_test_warn_indirect(struct kunit *tes=
t)
> > +{
> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> > +     trigger_backtrace_warn();
> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> > +
> > +     KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(), 1);
> > +}
> > +
> > +static void backtrace_suppression_test_warn_multi(struct kunit *test)
> > +{
> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> > +     WARN(1, "This backtrace should be suppressed");
> > +     trigger_backtrace_warn();
> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> > +
> > +     KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(), 2);
>
> Would it make sense to test KUNIT_SUPPRESSED_WARNING_COUNT() more
> thoroughly here by checking that it's 0 before any warnings, and
> checking that it's 1 in-between the two warnings?
>
> Of course, the first case doesn't work due to __kunit_suppress not being
> defined, but if the implementation changes to support this, let's add it
> to the test, too.

I thought this was a test gap when you commented the limitation in
patch #1, so I agree to add more granular COUNT checks once the API
supports it (which it should after the rework to expose the pointer).
Thanks!

>
> > +}
> > +
> > +static void backtrace_suppression_test_warn_on_direct(struct kunit *te=
st)
> > +{
> > +     if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE) && !IS_ENABLED(CONFIG_KA=
LLSYMS))
> > +             kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE or CON=
FIG_KALLSYMS");
> > +
> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> > +     WARN_ON(1);
> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> > +
> > +     KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(), 1);
> > +}
> > +
> > +static void trigger_backtrace_warn_on(void)
> > +{
> > +     WARN_ON(1);
> > +}
> > +
> > +static void backtrace_suppression_test_warn_on_indirect(struct kunit *=
test)
> > +{
> > +     if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE))
> > +             kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE");
> > +
> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> > +     trigger_backtrace_warn_on();
> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> > +
> > +     KUNIT_EXPECT_EQ(test, KUNIT_SUPPRESSED_WARNING_COUNT(), 1);
> > +}
> > +
> > +static struct kunit_case backtrace_suppression_test_cases[] =3D {
> > +     KUNIT_CASE(backtrace_suppression_test_warn_direct),
> > +     KUNIT_CASE(backtrace_suppression_test_warn_indirect),
> > +     KUNIT_CASE(backtrace_suppression_test_warn_multi),
> > +     KUNIT_CASE(backtrace_suppression_test_warn_on_direct),
> > +     KUNIT_CASE(backtrace_suppression_test_warn_on_indirect),
> > +     {}
> > +};
> > +
> > +static struct kunit_suite backtrace_suppression_test_suite =3D {
> > +     .name =3D "backtrace-suppression-test",
> > +     .test_cases =3D backtrace_suppression_test_cases,
> > +};
> > +kunit_test_suites(&backtrace_suppression_test_suite);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_DESCRIPTION("KUnit test to verify warning backtrace suppression=
");
> >
>


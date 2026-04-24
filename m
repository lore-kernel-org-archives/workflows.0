Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A1379EE2
	for <workflows@vger.kernel.org>; Fri, 24 Apr 2026 08:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018017; cv=pass; b=cSWFP3dFKpcD0w1q25xaz/3nC/gMlx/0XHX9V7w6W7YJ9wNLCjMXS1LPyq/TGbFHh5cR/RIVnpXGZdrzdiezVFZ2UirdqMKm7S/qDOgtrG45IF1FhfIJTNpxOJirs+RzBqhd3NYhIalYJTEQBIrMYKV/gdj1vM37zc5E90jwPsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018017; c=relaxed/simple;
	bh=vg3C5LtcrOED08fl0lhvN2LhSYB76V/tsl6KDOsbKUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ohwe9NA7mswSK2B9OQpauNxJXcKMl7GaNv9MVL3+O7PXTyXN6ukTWqBv6rn9lI+wpnlFYmwdeWK7yXSoKI80bCvmI3IzG1M/ZXR0QhlobFa2MPDm5bOPZiRhWywS4KoKrN1TMWjLYSevbWU6xWJ8eoZ8JJMDQyGlWl3Zpav+API=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B5cnnVoW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xc8M6fRX; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B5cnnVoW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xc8M6fRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777018011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eULTLH5+rebPEmYGz/v2v6bFHyPiu5NARAHlkmwacCU=;
	b=B5cnnVoWd6+h9C+29UXh+4Mv6QDHhbmHIM5gNoRBp1gE8uPRa9L5LmuybTEuEoYTGXIzQ/
	GC+P63cBf2uY/HjfNmvgIWSQ0loSlCSALfRi+rualU3Xoqu71BAWWfWFBO95uWA4gIYwMT
	3j1PnZNmc4R8rZkWXDA8p1KXsy5mz+4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-sNBCu8HTM9GxMxxuxLhtFQ-1; Fri, 24 Apr 2026 04:06:50 -0400
X-MC-Unique: sNBCu8HTM9GxMxxuxLhtFQ-1
X-Mimecast-MFC-AGG-ID: sNBCu8HTM9GxMxxuxLhtFQ_1777018009
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-79895ffb315so175455947b3.2
        for <workflows@vger.kernel.org>; Fri, 24 Apr 2026 01:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777018009; cv=none;
        d=google.com; s=arc-20240605;
        b=PxUX3SHI73x0ZPT7/SM+wqR1J3mES+5/1XX+JKIXFSwwZwbF/Bf3gQ/8t+kN2a02LT
         RZxM3Yv3A7Nh/EuAsRVdFv4/HnKCCBYHXif/FGB5jucs8NIh7lNoCiHUjHgNL0kyP1HY
         iBb+WI09WEV6yiHMWPhWNMRuoEV1/lD88jbgpsSNILAd1KnzVNGaYH3mfqEegAMZwoat
         pQFGue+W7/c4dfR4zps7QbXO1tVraOXF7CNHnlqfUqWYFJwpPGjnr743fipZVlloHGI/
         zYQMSfRNjOF9Y8kTY+uZczI1lJ+lBsBPziQ+hHIuX8Vhb+TiQmQY0kKhHaIN+cBd1crp
         PIlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eULTLH5+rebPEmYGz/v2v6bFHyPiu5NARAHlkmwacCU=;
        fh=K3j1vG08z0cQ+EendDkRoRPt69+n6pon47UVdGs4LWM=;
        b=eTV2pkfeg5T912oND2Tg3V6tEaXz0J3ZvMEeBPP2jn5bSWgUdHkANFCJe1VPaCnggF
         3bVRxd/QWT0pQYyLcOspjl4lystX5yBBN4lm5rXLChMJM9uDhWcQATD6sVqBYBfuqTRs
         4vrc/v2cEMlY3ewYW2SA7RQ0mJVHNMTvd0URTd263C2xBAOBtEgnGFzm0rr9Io/fpDjm
         Ibc5/rOAhsPEpb3djuO59vPhcqxrV+KraMuNivM5RLuIi76qCjWHrMwe4oKsPAhJHvkd
         obVhqOi/QAuzyFZSvH2rd2s/hhcvLP2OaZRTuKPlLvYpFPavh4Nal/DleAHY18mu3ThG
         IvFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777018009; x=1777622809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eULTLH5+rebPEmYGz/v2v6bFHyPiu5NARAHlkmwacCU=;
        b=Xc8M6fRXVJ8wBR3/QhFhjWv4US4iuFWX3//+x+Pyslw9yysYB0b2F0ZlVMtDFKxLgr
         oBS/QIj4MB6LGRC/e1l4jghnocjMnL0/YGsWqIyDKGOsHSj3rF10Qek8aJijbRQEuafS
         tNIKmQAiEds2k2YH3iipK2hCwa2GiHkAJBzB3KZ6A549/5IZMZl0+nLfKwOGJCxOQbz4
         iQEoP0NlmZxI7Tn5Jos8I3JGji4U0BKJlslMEck28sZ/TCRH5EfHUx9O8vVSyJxsn/bT
         eytTAvWabG1iR1Vaa7K99fFN4zukIo7+d1JIl2IuqI+Yckt54P7v9mfyPZFqwdcIncXF
         tkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018009; x=1777622809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eULTLH5+rebPEmYGz/v2v6bFHyPiu5NARAHlkmwacCU=;
        b=XGwWiIXDjiy6ufwAbYG75EkR7qNpD/3KouZSV29CbWBBoryuTOHZguwXkhCUE4aBr9
         75SEv1Ng74Jzpj7cPKf3trT266zyUkRi055EmbbIqQpzdvvWHS8n7BAkqxxORisurl2p
         e5qKj8YSIjPIo+v4tynkzpMXF5qm+7btMPYQaRTB6oRhkcBCwatE8aPy4G3+OrChjsch
         inzHp5iAKv3CzdrsH8px+U9t/zp+A0iEzO8vy7jph1RCTkEwZUsyBa1dMpXM3trT/LOE
         d8Mylh0QFz4U9lJIAh9EbBEMKcZxvALyrogPHGB3Q+YUqUxi39FIr2inv/PT3whIupSu
         yhrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hII9KRA3fhZ2P0dDiF/rxcW66sk3VwORThkunwz9xBZLGFjziC4ICFBhG2gUUWmQd7tap/a+LVio=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuuGhD4TG/huWXlCbqolnxZ8JswVwJcCSpYiGD4ULg2dHb1LDr
	0T2oYWd80+GMXw20ZvAc+brgN3BRBCZqZlh9fkQKeZBR8zuZP0mIeR5qfzDN3N1TMrJJgZ9vNM4
	mx7lsTZ1NzO6e0GBlZxs1sJKrhVOP4ctWrJfmDfWwdgo1oMS20oNo/L0jTFyczdbfDiCVJ3snK8
	lQAog625pscZIzPVy3+6YQHbAvz40YdEpwGEIu
X-Gm-Gg: AeBDieufHBg2L/d4Ba206Xyv1wtfqFcFL/WqPWuWO/b42uuXkGFBhqSf3/DZW3c4tN1
	6Ysc9i+mAmdFZ6zJD2n9mrBuwN2bghVaAaNqBzAEx1Lpiv5YAzzZmshQjIjy0zrEpmpg2QlDHBu
	FL0OMphTDoGhUXhNNpxuGx3K4bnb1kw0wgK+8N+DYqyhUB0SfE5gfhAdiUlgjvGWryFBeeyuJhh
	SY823kvQpe55dcU
X-Received: by 2002:a05:690c:23c4:b0:79f:cadb:d0ba with SMTP id 00721157ae682-7b9eced655amr332313497b3.20.1777018009372;
        Fri, 24 Apr 2026 01:06:49 -0700 (PDT)
X-Received: by 2002:a05:690c:23c4:b0:79f:cadb:d0ba with SMTP id
 00721157ae682-7b9eced655amr332313037b3.20.1777018008878; Fri, 24 Apr 2026
 01:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-1-e8bc6e0f70de@redhat.com> <c71899ce-95a5-419b-8e83-9146ff9c7b7f@davidgow.net>
In-Reply-To: <c71899ce-95a5-419b-8e83-9146ff9c7b7f@davidgow.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 24 Apr 2026 10:06:37 +0200
X-Gm-Features: AQROBzDQ4huzbi_ViNkBPGbNAJ1QgRlSgWeQ-wM8T-GPsWEk4gY0YNjAMXGMJQ4
Message-ID: <CADSE00Jkb4KEKPRdF8-wZ5Lj=cqowWYP0mCj7NDiC8uLCgnZSQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] bug/kunit: Core support for suppressing warning backtraces
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
	Alessandro Carminati <acarmina@redhat.com>, Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 2:21=E2=80=AFPM David Gow <david@davidgow.net> wrot=
e:
>
> Thanks very much for keeping this series alive! I'm very much in favour
> of it, and I think the overall design is good. Lots of more detailed
> nitpicks below, though.
>

Hi David,

Thank you for taking the time to review the series!

> Le 20/04/2026 =C3=A0 8:28 PM, Albert Esteve a =C3=A9crit :
> > From: Alessandro Carminati <acarmina@redhat.com>
> >
> > Some unit tests intentionally trigger warning backtraces by passing bad
> > parameters to kernel API functions. Such unit tests typically check the
> > return value from such calls, not the existence of the warning backtrac=
e.
> >
> > Such intentionally generated warning backtraces are neither desirable
> > nor useful for a number of reasons:
> > - They can result in overlooked real problems.
> > - A warning that suddenly starts to show up in unit tests needs to be
> >    investigated and has to be marked to be ignored, for example by
> >    adjusting filter scripts. Such filters are ad hoc because there is
> >    no real standard format for warnings. On top of that, such filter
> >    scripts would require constant maintenance.
> >
> > Solve the problem by providing a means to identify and suppress specifi=
c
> > warning backtraces while executing test code. Support suppressing multi=
ple
> > backtraces while at the same time limiting changes to generic code to t=
he
> > absolute minimum.
>
> It sounds from the description here that suppressing "specific
> backtraces" means that we're matching on the _contents_ of the stack
> trace. This sort-of does that implicitly by checking they're in the same
> kthread, but I think the fact that it's matching based on kthread should
> be explicit in the commit message, like it is in the documentation.
>

You are right. Previous version was based on function name matches. I
mostly fixed all commit messages, but this section remained. I will
rewrite it.

> >
> > Implementation details:
> > Suppression is checked at two points in the warning path:
> > - In warn_slowpath_fmt(), the check runs before any output, fully
> >    suppressing both message and backtrace.
> > - In __report_bug(), the check runs before __warn() is called,
> >    suppressing the backtrace and stack dump. Note that on this path,
> >    the WARN() format message may still appear in the kernel log since
> >    __warn_printk() runs before the trap that enters __report_bug().
>
> Would it make sense to output a 'backtrace suppressed due to running
> test' message in this latter case, so we don't just end up with the
> WARN() format message by itself? (My gut feeling is 'no, it isn't worth
> it', but it's food for thought.)
>

I had the same thought and landed on the same conclusion. It would
also become moot if we add the suppression check to __warn_printk() as
discussed with Peter, since the message would be fully suppressed on
that path too.

> >
> > A helper function, `__kunit_is_suppressed_warning()`, walks an
> > RCU-protected list of active suppressions, matching by current task.
> > The suppression state is tied to the KUnit test lifecycle via
> > kunit_add_action(), ensuring automatic cleanup at test exit.
> >
> > The list of suppressed warnings is protected with RCU to allow
> > concurrent read access without locks.
> >
> > The implementation is deliberately simple and avoids architecture-speci=
fic
> > optimizations to preserve portability.
> >
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Reviewed-by: Kees Cook <kees@kernel.org>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >   include/kunit/bug.h  | 56 +++++++++++++++++++++++++++++++++++
> >   include/kunit/test.h |  1 +
> >   kernel/panic.c       |  8 ++++-
> >   lib/bug.c            |  8 +++++
> >   lib/kunit/Kconfig    |  9 ++++++
> >   lib/kunit/Makefile   |  6 ++--
> >   lib/kunit/bug.c      | 84 +++++++++++++++++++++++++++++++++++++++++++=
+++++++++
> >   7 files changed, 169 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/kunit/bug.h b/include/kunit/bug.h
> > new file mode 100644
> > index 0000000000000..e52c9d21d9fe6
> > --- /dev/null
> > +++ b/include/kunit/bug.h
>
> It's a bit confusing to name this bug.h when we have the (admittedly
> terribly-named) test-bug.h header already. I'm pretty tempted to rename
> the latter to something like 'hooks.h', as that's really what it's for,
> and having a separate bug.h would be an incentive to do so, though, sit
> it's not a big problem.
>
> I do think that it'd be reasonable to include the backtrace suppression
> tuff in the same file, though, if you'd rather. The
> __kunit_is_suppressed_warning() stuff in particular fits the category of
> "code called to change behaviour based on whether or not a test is
> running", which is generally what the hooks are for. (And, if you'd
> rather, there's a bunch of existing hooks and hook infrastructure you
> could use.)

I wasn't aware of the hooks infrastructure! I was so focused on the
solution carried over from initial versions that I did not seek
alternatives.

Honestly, that's a much better fit -- I'll integrate it into
test-bug.h for next version.

>
> > @@ -0,0 +1,56 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * KUnit helpers for backtrace suppression
> > + *
> > + * Copyright (C) 2025 Alessandro Carminati <acarmina@redhat.com>
> > + * Copyright (C) 2024 Guenter Roeck <linux@roeck-us.net>
> > + */
> > +
> > +#ifndef _KUNIT_BUG_H
> > +#define _KUNIT_BUG_H
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +#include <linux/kconfig.h>
> > +
> > +struct kunit;
> > +
> > +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> > +
> > +#include <linux/types.h>
> > +
> > +struct task_struct;
> > +
> > +struct __suppressed_warning {
> > +     struct list_head node;
> > +     struct task_struct *task;
> > +     int counter;
> > +};
> > +
> > +struct __suppressed_warning *
> > +__kunit_start_suppress_warning(struct kunit *test);
> > +void __kunit_end_suppress_warning(struct kunit *test,
> > +                               struct __suppressed_warning *warning);
> > +int __kunit_suppressed_warning_count(struct __suppressed_warning *warn=
ing);
> > +bool __kunit_is_suppressed_warning(void);
> > +
> > +#define KUNIT_START_SUPPRESSED_WARNING(test) \
> > +     struct __suppressed_warning *__kunit_suppress =3D \
> > +             __kunit_start_suppress_warning(test)
> > +
> > +#define KUNIT_END_SUPPRESSED_WARNING(test) \
> > +     __kunit_end_suppress_warning(test, __kunit_suppress)
> > +
> > +#define KUNIT_SUPPRESSED_WARNING_COUNT() \
> > +     __kunit_suppressed_warning_count(__kunit_suppress)
>
> Using a local variable (__kunit_suppress) here means that all of the
> above macros must live in the same function. This is probably okay for
> most use-cases, but more complicated tests may have to structure things
> carefully. It also prevents there from being multiple START/END pairs in
> the same function, and the KUNIT_SUPPRESSED_WARNING_COUNT() macro from
> appearing before _START().
>
> It also makes it less obvious that this cleans up nicely if the test
> exits uncleanly, as the variable will have gone out-of-scope. (But given
> we're just storing a pointer to heap-allocated memory, and
> kunit_add_action() is used, it should be okay.)
>
> One other option would be to allocate the suppression as a named
> resource, which could then be retrieved from anywhere within the test
> with kunit_find_named_resource(). (Though handling nested suppressions
> gets a little more complicated here.)
>
> Or you could make the struct __suppressed_warning pointer returned
> explicitly user-visible, and let the user pass it around (though that
> seems more work).
>

Good points. The function matching approach used the function name to
allow concurrent suppressions to coexist. This is a limitation of the
current approach that I traded off for simplicity (without properly
considering the more complicated scenarios). I'll add a name parameter
to the macros (or expose the pointer directly) so multiple pairs and
cross-function usage work naturally. I think I lean more towards
making the return value user-visible? But I will decide based on how
the API evolves, especially if I change to the scoped approach
suggested in a different thread.

>
> > +
> > +#else /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> > +
> > +#define KUNIT_START_SUPPRESSED_WARNING(test)
> > +#define KUNIT_END_SUPPRESSED_WARNING(test)
> > +#define KUNIT_SUPPRESSED_WARNING_COUNT() 0
> > +static inline bool __kunit_is_suppressed_warning(void) { return false;=
 }
> > +
> > +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> > +#endif /* __ASSEMBLY__ */
> > +#endif /* _KUNIT_BUG_H */
> > diff --git a/include/kunit/test.h b/include/kunit/test.h
> > index 9cd1594ab697d..4ec07b3fa0204 100644
> > --- a/include/kunit/test.h
> > +++ b/include/kunit/test.h
> > @@ -10,6 +10,7 @@
> >   #define _KUNIT_TEST_H
> >
> >   #include <kunit/assert.h>
> > +#include <kunit/bug.h>
> >   #include <kunit/try-catch.h>
> >
> >   #include <linux/args.h>
> > diff --git a/kernel/panic.c b/kernel/panic.c
> > index c78600212b6c1..d7a7a679f56c4 100644
> > --- a/kernel/panic.c
> > +++ b/kernel/panic.c
> > @@ -39,6 +39,7 @@
> >   #include <linux/sys_info.h>
> >   #include <trace/events/error_report.h>
> >   #include <asm/sections.h>
> > +#include <kunit/bug.h>
> >
> >   #define PANIC_TIMER_STEP 100
> >   #define PANIC_BLINK_SPD 18
> > @@ -1080,9 +1081,14 @@ void __warn(const char *file, int line, void *ca=
ller, unsigned taint,
> >   void warn_slowpath_fmt(const char *file, int line, unsigned taint,
> >                      const char *fmt, ...)
> >   {
> > -     bool rcu =3D warn_rcu_enter();
> > +     bool rcu;
> >       struct warn_args args;
> >
> > +     if (__kunit_is_suppressed_warning())
> > +             return;
> > +
> > +     rcu =3D warn_rcu_enter();
> > +
> >       pr_warn(CUT_HERE);
> >
> >       if (!fmt) {
> > diff --git a/lib/bug.c b/lib/bug.c
> > index 623c467a8b76c..606205c8c302f 100644
> > --- a/lib/bug.c
> > +++ b/lib/bug.c
> > @@ -48,6 +48,7 @@
> >   #include <linux/rculist.h>
> >   #include <linux/ftrace.h>
> >   #include <linux/context_tracking.h>
> > +#include <kunit/bug.h>
> >
> >   extern struct bug_entry __start___bug_table[], __stop___bug_table[];
> >
> > @@ -223,6 +224,13 @@ static enum bug_trap_type __report_bug(struct bug_=
entry *bug, unsigned long buga
> >       no_cut   =3D bug->flags & BUGFLAG_NO_CUT_HERE;
> >       has_args =3D bug->flags & BUGFLAG_ARGS;
> >
> > +     /*
> > +      * Before the once logic so suppressed warnings do not consume
> > +      * the single-fire budget of WARN_ON_ONCE().
> > +      */
> > +     if (warning && __kunit_is_suppressed_warning())
> > +             return BUG_TRAP_TYPE_WARN;
> > +
>
> While any competant optimiser should get rid of this entirely, it might
> be clearer to anyone reading it that this disappears if we just put it
> behind an #ifdef?

Makes sense. Will do.

>
> >       if (warning && once) {
> >               if (done)
> >                       return BUG_TRAP_TYPE_WARN;
> > diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
> > index 498cc51e493dc..57527418fcf09 100644
> > --- a/lib/kunit/Kconfig
> > +++ b/lib/kunit/Kconfig
> > @@ -15,6 +15,15 @@ menuconfig KUNIT
> >
> >   if KUNIT
> >
> > +config KUNIT_SUPPRESS_BACKTRACE
> > +     bool "KUnit - Enable backtrace suppression"
> > +     default y
> > +     help
> > +       Enable backtrace suppression for KUnit. If enabled, backtraces
> > +       generated intentionally by KUnit tests are suppressed. Disable
> > +       to reduce kernel image size if image size is more important tha=
n
> > +       suppression of backtraces generated by KUnit tests.
> > +
> >   config KUNIT_DEBUGFS
> >       bool "KUnit - Enable /sys/kernel/debug/kunit debugfs representati=
on" if !KUNIT_ALL_TESTS
> >       default KUNIT_ALL_TESTS
> > diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> > index 656f1fa35abcc..fe177ff3ebdef 100644
> > --- a/lib/kunit/Makefile
> > +++ b/lib/kunit/Makefile
> > @@ -16,8 +16,10 @@ ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
> >   kunit-objs +=3D                               debugfs.o
> >   endif
> >
> > -# KUnit 'hooks' are built-in even when KUnit is built as a module.
> > -obj-$(if $(CONFIG_KUNIT),y) +=3D               hooks.o
> > +# KUnit 'hooks' and bug handling are built-in even when KUnit is built
> > +# as a module.
> > +obj-$(if $(CONFIG_KUNIT),y) +=3D               hooks.o \
> > +                                     bug.o
>
> Is there any reason we couldn't implement this on top of the hooks
> mechanism? Then we could include the bug suppression code in the
> kunit.ko module (albeit, with fewer possibilities for the compiler to
> optimise things, as they'd have to go through an indirect pointer).
>

No reason. I'll integrate this feature into the hooks infrastructure.
Thanks for the suggestion!

>
> >
> >   obj-$(CONFIG_KUNIT_TEST) +=3D         kunit-test.o
> >   obj-$(CONFIG_KUNIT_TEST) +=3D         platform-test.o
> > diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
> > new file mode 100644
> > index 0000000000000..356c8a5928828
> > --- /dev/null
> > +++ b/lib/kunit/bug.c
> > @@ -0,0 +1,84 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KUnit helpers for backtrace suppression
> > + *
> > + * Copyright (C) 2025 Alessandro Carminati <acarmina@redhat.com>
> > + * Copyright (C) 2024 Guenter Roeck <linux@roeck-us.net>
> > + */
> > +
> > +#include <kunit/bug.h>
> > +#include <kunit/resource.h>
> > +#include <linux/export.h>
> > +#include <linux/rculist.h>
> > +#include <linux/sched.h>
> > +
> > +#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> > +
> > +static LIST_HEAD(suppressed_warnings);
> > +
> > +static void __kunit_suppress_warning_remove(struct __suppressed_warnin=
g *warning)
> > +{
> > +     list_del_rcu(&warning->node);
> > +     synchronize_rcu(); /* Wait for readers to finish */
> > +}
> > +
> > +KUNIT_DEFINE_ACTION_WRAPPER(__kunit_suppress_warning_cleanup,
> > +                         __kunit_suppress_warning_remove,
> > +                         struct __suppressed_warning *);
> > +
> > +struct __suppressed_warning *
> > +__kunit_start_suppress_warning(struct kunit *test)
> > +{
> > +     struct __suppressed_warning *warning;
> > +     int ret;
> > +
> > +     warning =3D kunit_kzalloc(test, sizeof(*warning), GFP_KERNEL);
> > +     if (!warning)
> > +             return NULL;
> > +
> > +     warning->task =3D current;
> > +     list_add_rcu(&warning->node, &suppressed_warnings);
> > +
> > +     ret =3D kunit_add_action_or_reset(test,
> > +                                     __kunit_suppress_warning_cleanup,
> > +                                     warning);
> > +     if (ret)
> > +             return NULL;
> > +
> > +     return warning;
> > +}
> > +EXPORT_SYMBOL_GPL(__kunit_start_suppress_warning);
> > +
> > +void __kunit_end_suppress_warning(struct kunit *test,
> > +                               struct __suppressed_warning *warning)
> > +{
> > +     if (!warning)
> > +             return;
> > +     kunit_release_action(test, __kunit_suppress_warning_cleanup, warn=
ing);
> > +}
> > +EXPORT_SYMBOL_GPL(__kunit_end_suppress_warning);
> > +
> > +int __kunit_suppressed_warning_count(struct __suppressed_warning *warn=
ing)
> > +{
> > +     return warning ? warning->counter : 0;
> > +}
> > +EXPORT_SYMBOL_GPL(__kunit_suppressed_warning_count);
> > +
> > +bool __kunit_is_suppressed_warning(void)
> > +{
> > +     struct __suppressed_warning *warning;
> > +
> > +     rcu_read_lock();
> > +     list_for_each_entry_rcu(warning, &suppressed_warnings, node) {
> > +             if (warning->task =3D=3D current) {
> > +                     warning->counter++;
> > +                     rcu_read_unlock();
> > +                     return true;
> > +             }
> > +     }
> > +     rcu_read_unlock();
> > +
> > +     return false;
> > +}
>
> Note to self: this is _not_ exported, as bug.c is being built-in
> regardless of whether or not KUnit is a module. If we used the hook
> system, it could live in kunit.ko, and would be manually exported by
> kunit_install_hooks()
>
> > +
> > +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> >
>
>
> Thanks again,
> -- David
>


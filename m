Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0D7358D14
	for <workflows@vger.kernel.org>; Fri, 24 Apr 2026 07:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015041; cv=pass; b=hLvHhQZxJB55+12fpO5UhaeFa51SnIUdhawpuCn4yrULZBD4d5AgAVnUTUvLBpchXE97WammvLKn8HFwGbgP6rYKz4RvB5V1OXPbHIlgdK3K9VunfmChdHWNGsaNsqT128On2aYm5ITRryFaMotJpijZoOgb+q3SVZd30HVSzmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015041; c=relaxed/simple;
	bh=yClHRF8OjhIxck88Jx+vYcQmNKKejUFC6AKG1u3nJUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgoKKP98y6O1k+42to+3XzhSST29t299MUenz02AGHiVdVOCxrsA+CPgKnDftAR/4wS+g/HBmc/jJkYzlGtiGLo7rIrzHAgjYzKghKV7FlsSISckE0fbtBcnuxbox7lh0ZypPWb4XvCzXUfy0f8je1cYp95+ErQfdwXAIDoQSkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WBilzT/1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eZtVwxZ2; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WBilzT/1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eZtVwxZ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777015039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ocRQwsGxmUd24plQscvID6P4Yrryzt44ghQQY2RzSsk=;
	b=WBilzT/1/BLIvMDu9bNMuHsHK2zo5+CmDwL02svO12ZZ3uJzPqcrFiBhJLkZO/lm9oKnAQ
	eAUCnfdLO8sBOg8PcGXKQ0iv3RvQ2cuMFcksm8hD8d+w/gZm9+1ar9n8G4ujM2ps9QqIb2
	OQa8+7wSPO7HupwcElDJZ+1M+U19ChI=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-VIr8-dNROzKkXGkjKaa-GA-1; Fri, 24 Apr 2026 03:17:18 -0400
X-MC-Unique: VIr8-dNROzKkXGkjKaa-GA-1
X-Mimecast-MFC-AGG-ID: VIr8-dNROzKkXGkjKaa-GA_1777015037
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7a5f9d43c48so72420137b3.2
        for <workflows@vger.kernel.org>; Fri, 24 Apr 2026 00:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777015037; cv=none;
        d=google.com; s=arc-20240605;
        b=E1pZcoqwEuq6oYgAXzYuO6h/s2kJaFaQHpD1g4XHBNCm089xnp0NEZ/6AsVFDSJlYv
         7zE9fNBDtj/TCyNR0m4R1w0Wd4nYkJHEZEbdB85v8SpV1687kuMbZ/tyiO8CipPhkHVR
         jwngnKmbzOFgrmnToyXUJwi2jJh9/Z1yM8GsmStLJw6PUE68Ttpx9Px3UTOyU6MMZQyt
         1LiEZ9KO+s6JSmz9kFrZcs8W+Pzsg4NNccBCBqicnf2ZKlfDbZt6azSJEoIFVJ6P/G3p
         KfKAf/GcGlu2y343SwGpEmdwgsDkXMugQwB+lsuwIjPc7ex/H1NIXRP9Z5zUikMng4Lp
         bYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ocRQwsGxmUd24plQscvID6P4Yrryzt44ghQQY2RzSsk=;
        fh=uCskJx7ci6DP35dmE9xPhJoWeAfIbd6VMYh1HgHkVgI=;
        b=YzigiDm2vDcUw2wi8fmVXy6I4kwr2MvyQw1GsQaBvXiN6OjpP/x65qtRizFpN5TQRx
         e6cXACux0X5e6luEvRlI1UH0k2hhG/1iDVe90Ydh7VSUPU9cw7UmJ4Y8u8G7mzqJluEl
         Hb/0gYD1jCbM/Go0DMmG0lTlMIvOczuNG5xlKDGKOKiXzR4Cfxs9ahny/NTseQKSksUC
         I8Gjm1e8hwqzjbEhAO0prYE6iV60xhVaRTlNcfnZCVKr46kE+oR/NWNCTv/wxb4Wpl+3
         VMZVH7XPsKjLRN15nhrXl4nGZpc2vRLL0RIgOObE/maCcjXDt2Ovyr/vM+rxz9jUa449
         5ALQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777015037; x=1777619837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocRQwsGxmUd24plQscvID6P4Yrryzt44ghQQY2RzSsk=;
        b=eZtVwxZ2GnCeG6jJOEEa10Tqi0J/sZ8ZqW/f55a/WRzwwjQZOz9i1X3wIuwxEAjAjh
         4rWXMmS+mdeMBzFwLNKekBqc0gzqcnkwEhA3PqKoA+YTkCKlB+NNE70p472HNlxNFX9V
         BDHMB/7sjTkIpXKHKzgu9xWImHP1n4N4q36TQTJRcBsLfFtwJHOh+8tAQToMRA7pZIO8
         mwCzdX2aA4PH/uMu4AR/3gLfoNcQ7ZgNejrPNHoFhLBBAY8egxZoW+lNvoF4Oh2UpgZo
         7ktmIvB4cSc9QcO9RqOQQDFsDqZ0I1GD5ttofE6OQL/kfnhAmyA2f+W0Nxog3pPgTxEz
         cjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015037; x=1777619837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ocRQwsGxmUd24plQscvID6P4Yrryzt44ghQQY2RzSsk=;
        b=NVd4YEhyyCHeXubMxNdMfAc0yd9N0YInB6rN5GfLXGPujhE/W8xalbjZPcDTx5k49c
         b00YGRvboER6htqVW/0QlBbefepA3SyX+N1QygS5AbZJrYIUr8R5xiROWxWv0c8zv2g6
         OMUlhSfxRLFPmIkpfyflBIZ1mUainSI430xb1fApASBmZ3UQm9npoJu779jBYv1PdntD
         vSgLjb0op4O2thekFo1CkcSFP60GuYmJGBb/b2kcFUEfkOyCtbxyCgqGl47bUlAGVJ+R
         LR5/BlrE/hsNB0bE0gLijQM0mmdvtXyF+hAqNmUZb7qCuJeDsB1lqedopqKwJT3qYB32
         cXCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+23cG5eciWOoL5OAxev08WlvQclx3JoEUkj6utlN2nsbuzxhkaS7jmfPxjbakHXAP9lKkaJjXyMug=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2aK7COL7DeZLIGfS1kOaIvzYcsWGuY8VHqdRGNgGBxXONvrY9
	zYFoARm+P90/+wto+TkUAm64gKu7Tmbf/5AZhm8R2XWJyFlEmVveL1Wuve7HCI9xC6pLfBlx3TK
	wQzjfZ7zD/97Kj7/0jXcCOAJLtZf8lIXbSfypg0LhZLxYXF7D+WzqCeTSCHvOzNZRPZdiGk/BU7
	3EwLXf/Zekjig+eTD93H4kdeOPOTlWlpST1hZO
X-Gm-Gg: AeBDieuOeIMfy8ZMXyXYQ6uwvqJz0QvXLftVU+Z/qtHrqt0bkcKbIZTBJ8WK3AwLTmk
	xOd73bTHY/uQbsye1xqOVH03XQILqB7UB0+fo2AgVSv7EzxbVxZJrxLt2PmzZtaNiVf7HCHdrxQ
	ub12Tyj7AYKkj46b0vHS8usDJSbemfSlMFyU4a7cfQ1mRRznW/itiyKbfP24WCVMG9jHjAw1NWL
	1M3XAsqCWg9rshw
X-Received: by 2002:a05:690c:2701:b0:79b:cf31:9767 with SMTP id 00721157ae682-7b9ece638bbmr313691407b3.3.1777015037629;
        Fri, 24 Apr 2026 00:17:17 -0700 (PDT)
X-Received: by 2002:a05:690c:2701:b0:79b:cf31:9767 with SMTP id
 00721157ae682-7b9ece638bbmr313691117b3.3.1777015037197; Fri, 24 Apr 2026
 00:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-4-e8bc6e0f70de@redhat.com> <20260420144702.GM3102624@noisy.programming.kicks-ass.net>
 <CADSE00JJq6fsYbkFN5hBD=-ZWsFG9p4_C55fp3MupMJQj0QCUQ@mail.gmail.com> <8a9c125c08206296d698c79c3d3dd6aea36a7e3b@intel.com>
In-Reply-To: <8a9c125c08206296d698c79c3d3dd6aea36a7e3b@intel.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 24 Apr 2026 09:17:05 +0200
X-Gm-Features: AQROBzD6yZWbejVMF7ldH8G24-m4djSD1N4zfjIlQ_Qh0r0EH3w2r9AAFZGj5x0
Message-ID: <CADSE00+b-8moX5FkLjLs+wzyaW5dtJDMxvTT6Gu-QmDoDxJdVA@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Jani Nikula <jani.nikula@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Alessandro Carminati <acarmina@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 1:51=E2=80=AFPM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Tue, 21 Apr 2026, Albert Esteve <aesteve@redhat.com> wrote:
> > On Mon, Apr 20, 2026 at 4:47=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> >>
> >> On Mon, Apr 20, 2026 at 02:28:06PM +0200, Albert Esteve wrote:
> >> > From: Guenter Roeck <linux@roeck-us.net>
> >> >
> >> > The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tes=
ts
> >> > intentionally trigger warning backtraces by providing bad parameters=
 to
> >> > the tested functions. What is tested is the return value, not the ex=
istence
> >> > of a warning backtrace. Suppress the backtraces to avoid clogging th=
e
> >> > kernel log and distraction from real problems.
> >> >
> >> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> > Acked-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> >> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> > Cc: David Airlie <airlied@gmail.com>
> >> > Cc: Daniel Vetter <daniel@ffwll.ch>
> >> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> >> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> >> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> >> > ---
> >> >  drivers/gpu/drm/tests/drm_rect_test.c | 14 ++++++++++++++
> >> >  1 file changed, 14 insertions(+)
> >> >
> >> > diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm=
/tests/drm_rect_test.c
> >> > index 17e1f34b76101..1dd7d819165e7 100644
> >> > --- a/drivers/gpu/drm/tests/drm_rect_test.c
> >> > +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> >> > @@ -409,8 +409,15 @@ static void drm_test_rect_calc_hscale(struct ku=
nit *test)
> >> >       const struct drm_rect_scale_case *params =3D test->param_value=
;
> >> >       int scaling_factor;
> >> >
> >> > +     /*
> >> > +      * drm_rect_calc_hscale() generates a warning backtrace whenev=
er bad
> >> > +      * parameters are passed to it. This affects all unit tests wi=
th an
> >> > +      * error code in expected_scaling_factor.
> >> > +      */
> >> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> >> >       scaling_factor =3D drm_rect_calc_hscale(&params->src, &params-=
>dst,
> >> >                                             params->min_range, param=
s->max_range);
> >> > +     KUNIT_END_SUPPRESSED_WARNING(test);
> >>
> >> Would not something like:
> >>
> >>         scoped_kunit_suppress() {
> >>                 scaling_factor =3D drm_rect_calc_hscale(&params->src, =
&params->dst,
> >>                                                       params->min_rang=
e, params->max_range);
> >>         }
> >>
> >> be better?
> >
> > Since KUnit already has a few macros in its API it didn't occur to me.
> > Good idea, I like it. And I guess the scope approach matches well with
> > your __cleanup comment in the first patch. If no one opposes, I will
> > work toward that pattern for the next version.
>
> There's a catch with kunit and __cleanup and thus (scoped) guards. Kunit
> runs in ktreads, asserts lead to kthread_exit() and the __cleanup won't
> be called.

Hi Jani,

Good point. In this specific case, the actual cleanup is handled by
kunit_add_action_or_reset(), so __cleanup not firing on assert is
harmless.

>
> Warning suppression being part of kunit infrastructure, asserts can and
> should end the suppression too. But setting the example (scoped) guards
> are safe in kunit tests in general feels like a trap waiting to happen.
>

... but I agree it sets a misleading precedent. I'll stick with the
explicit start/end API, then? Or maybe we can clearly document why the
scoped approach is safe in this case and use it.

>
> BR,
> Jani.
>
>
> >
> >>
> >> Also, how can you stand all this screaming in the code?
> >>
> >
> > Again, KUnit already contains many macros, so this use didn't register
> > as such. Now I will not be able to unsee it.
> >
> >
>
> --
> Jani Nikula, Intel
>


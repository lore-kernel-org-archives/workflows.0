Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8638399345
	for <workflows@vger.kernel.org>; Tue, 21 Apr 2026 08:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761414; cv=pass; b=piO8Ez8KkmV4o1493LEDGaCgMsGd+/6mvM6/9ThZ1aYk6zoiIJdSoUzLlBi825qbBTd+d0GgRISYQRXt0AUkj0ZsjmC4+g9U9XODB1730eSwC+epG93LazCBzcVMs+kSfFJAkvbpaUPkTThnad1367XkvhOA/cr9i6Fgs+FfXyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761414; c=relaxed/simple;
	bh=xs2N39HHM6PqtgrRMGSJFnO7luxy+UhyOqy82YwC1R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGF6fYklLnrVrju6HarmokssnQzoA8UIhUjXh7R1we6uUFSLi9oEsOuPwSIaSVnmB3d9q+IcGqzr1aPsCjAapCovkT+TSz2MZu9D+xzoyW2BjL7wTx9rKOx/tn+Cfbd39ozCaHFnazW5pXa3WAzAd9jzI9nbt6gdAdPA5yoyqHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=an4JMKCf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DLWPZtud; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="an4JMKCf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DLWPZtud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776761411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZLkS/Ta9vRJDH5KioddXAEgwRVTq9xjtMihkgqxZ3KQ=;
	b=an4JMKCfL9X6mLxbOWv2fmZhXnnUKbMQYTcMXwSSpCJoJCksiHvjThxIb714+/hkojUKm2
	stshGysuN0NvsxHaeOe+Q7RzYEogYeGS24EaReeuIItS3M7mZ1OXPUMiNYXDox6mPQOLIc
	2fLMMzUgGfWDBNPkyjcW7mUdfOtX0vM=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-IODblAMlNz2uUX5DL_1anw-1; Tue, 21 Apr 2026 04:50:10 -0400
X-MC-Unique: IODblAMlNz2uUX5DL_1anw-1
X-Mimecast-MFC-AGG-ID: IODblAMlNz2uUX5DL_1anw_1776761410
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7a45cf7ff24so64685167b3.0
        for <workflows@vger.kernel.org>; Tue, 21 Apr 2026 01:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776761410; cv=none;
        d=google.com; s=arc-20240605;
        b=PSJphQY1TRdlfA2GwsULjPg4iISfrW03cgPox8ApmRYVM+zdlmj9OscJZb5KZ695nj
         X3S5bASgclSkrw93xJJwfECxElQ50ixc6QpORPqXvvkmBGzBDo8XJfalie8fSZd/K5qv
         A9gqdn7NMBv02RhcXP360faBBhmlQ1Roco084AlDGwLwD/r2G3rDY6vy1UdRc+uY+moV
         KyIIC6DsYh7kd7oe7+VNqNmIoRLtMBYzwiD5WXCZ+y1MG7ot12qC538oJwVIyytEwKkB
         VBQAnSKgrmCHloB1o/4mdZSGesrIHP0bRnYqUTCXG6+Kq+m7HKCVHP8zAzEMTHJfYaKo
         wP+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLkS/Ta9vRJDH5KioddXAEgwRVTq9xjtMihkgqxZ3KQ=;
        fh=h0vT/GI7FPxA0FsVDC/BizQBhPfklNPtNZtTq/dXJqI=;
        b=Sn8XhZqeoQ0pEMaGB2Q/RCnReCdZDqVnwPRVi3bJdvWiM5t218tWJa5x6Y9X01VHqr
         kq6ma2ZXrKmbPVxWwzgL0FXqEQJoWMc80/1rTUoz/rv2ph6WmApUP5UQexkZwrNvF02B
         fi9vVYry+A8cHCqXk7sga5t68MCTba4AdJL6BlGKJw/noP+W0DJ/gqX2Ni9oJ9Shj4zK
         7lDoCzWdaQQpSd9gHTXs/h/wSdWB5JgCL/VuyQJuAd2V+bs1qXD8CbnBrBEiC//3v8la
         i8/uboB8BA3apkMDgYk0sL97TyXDpapnSb5REVwie904Zm2JFbaW4xdQFwh6JNNf++U6
         SNhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776761410; x=1777366210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLkS/Ta9vRJDH5KioddXAEgwRVTq9xjtMihkgqxZ3KQ=;
        b=DLWPZtud7iL2OqOU4xQvCVQetOMkZ8xXfcTv/ioIwv5L0uhrmTBuaba1JNLfc61PTI
         6MEFRpkla/7ceyeAVIT9Oh5ymrzC/fQUgKdDzaa/7xSQdotalga+rOKUQy40peUmr+/u
         b6r9853w0/jMZo2bnmFwBSuAIjUIzVVax3O2NCsDZtoquO7Hq2bZnAIqJVrWpv+NFZgu
         b5Y6HVVXrYoSRmdxlGP5KRwLwIYcjSE8EEmJB10E1EW3DvzFVmepZhRd/DkS6bN+qyY4
         P+oJ/mBTU7n2UPC6R4+uG3C1NHEHyqgcajCqbd70VrrexRPSgyUozFiH0ZVQ+mF9v/TC
         HtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776761410; x=1777366210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZLkS/Ta9vRJDH5KioddXAEgwRVTq9xjtMihkgqxZ3KQ=;
        b=Fw/XgN+kYg3GCJLYfyYCjB8qADMFak8oPQ5P7PsuenH2V50y80iK23IHm48K+Rrvwr
         gF3KmEIfTK45PZPs6BGWOxP53q+FpkqbABPyfgkvCzJcmnZINlB4MveJAQhjb8FWnC6F
         Z8Uc6Xx7vJdMGQXKqbC8UYmBLUCT3Bb91tPpus14sgi7m9CgezYOFKejSBJIjpgZMJ0O
         y19zu2Y6tAP+Jjc49x7NTenjggtZ61PJG9OX/DqP0GJefX/q2592yrKbjQ8TPFj1/N3z
         B6AWHPWvJp9GipvVFSvrbBjAHg8l+17aBSW1JxXectJzL5vd0EkUiKk9INmW2hrxPupf
         eR9g==
X-Forwarded-Encrypted: i=1; AFNElJ9tey4chrHrn44mH5+87YQr1yPN2ilaVYeyZrLHEwLf6JegaEj2jFMEcJlcoxvvXplxWbkTM97k3m4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOeb6c50qv2oUDltU9HXnGmX2mefW8VCMlCJBqDT8X2MuEu5kK
	tJPAxVgUKrECxsoF8Mjf7FHVr/UAP63d672V5IIJfg6tl9HZ0aIBP6DdiUB/2TGFp6an4jcP/t7
	h4t4knMwh+PhEiSO5DInK88tWlooBMhzs0EhevNOWTZeRyaI/EQPJ7mDVBp+Io7iB4xexsYKwNb
	HIf8Kkbnx1oZHWT2BGdvNMGvEbBjM6ZJHJnol3
X-Gm-Gg: AeBDiesL0UIeSoMKI7J/9GrnqJgxfsK58luVf7i3ATWrnMKzA3RbcY3fpYTAotXURtS
	dweQoIeplghc5+1GNCCNceYmXsmZXK8vg3zLb1Ksd9NBXWbbEr933DcUxiHQcNLIXJgS4aBWlr+
	452l+FI9pBROTHaoUpq4lHUvHC6qyUqWQfr0ezFK7y6I/rzuor73/2d7teKbP4RgCxQed99ldAq
	hjp+ci6yJyHW6zw
X-Received: by 2002:a05:690c:dd5:b0:7b2:9347:7bdf with SMTP id 00721157ae682-7b9ed000a01mr173415327b3.37.1776761410066;
        Tue, 21 Apr 2026 01:50:10 -0700 (PDT)
X-Received: by 2002:a05:690c:dd5:b0:7b2:9347:7bdf with SMTP id
 00721157ae682-7b9ed000a01mr173415087b3.37.1776761409658; Tue, 21 Apr 2026
 01:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-4-e8bc6e0f70de@redhat.com> <20260420144702.GM3102624@noisy.programming.kicks-ass.net>
In-Reply-To: <20260420144702.GM3102624@noisy.programming.kicks-ass.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 21 Apr 2026 10:49:58 +0200
X-Gm-Features: AQROBzCldOYbfR8ys3ZZ4dkJqQQZYQ8VWy-mBIRFS67smM8o_e_X6azO-SUJq08
Message-ID: <CADSE00JJq6fsYbkFN5hBD=-ZWsFG9p4_C55fp3MupMJQj0QCUQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Peter Zijlstra <peterz@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Guenter Roeck <linux@roeck-us.net>, Linux Kernel Functional Testing <lkft@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Alessandro Carminati <acarmina@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 4:47=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Apr 20, 2026 at 02:28:06PM +0200, Albert Esteve wrote:
> > From: Guenter Roeck <linux@roeck-us.net>
> >
> > The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
> > intentionally trigger warning backtraces by providing bad parameters to
> > the tested functions. What is tested is the return value, not the exist=
ence
> > of a warning backtrace. Suppress the backtraces to avoid clogging the
> > kernel log and distraction from real problems.
> >
> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Acked-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/gpu/drm/tests/drm_rect_test.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/te=
sts/drm_rect_test.c
> > index 17e1f34b76101..1dd7d819165e7 100644
> > --- a/drivers/gpu/drm/tests/drm_rect_test.c
> > +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> > @@ -409,8 +409,15 @@ static void drm_test_rect_calc_hscale(struct kunit=
 *test)
> >       const struct drm_rect_scale_case *params =3D test->param_value;
> >       int scaling_factor;
> >
> > +     /*
> > +      * drm_rect_calc_hscale() generates a warning backtrace whenever =
bad
> > +      * parameters are passed to it. This affects all unit tests with =
an
> > +      * error code in expected_scaling_factor.
> > +      */
> > +     KUNIT_START_SUPPRESSED_WARNING(test);
> >       scaling_factor =3D drm_rect_calc_hscale(&params->src, &params->ds=
t,
> >                                             params->min_range, params->=
max_range);
> > +     KUNIT_END_SUPPRESSED_WARNING(test);
>
> Would not something like:
>
>         scoped_kunit_suppress() {
>                 scaling_factor =3D drm_rect_calc_hscale(&params->src, &pa=
rams->dst,
>                                                       params->min_range, =
params->max_range);
>         }
>
> be better?

Since KUnit already has a few macros in its API it didn't occur to me.
Good idea, I like it. And I guess the scope approach matches well with
your __cleanup comment in the first patch. If no one opposes, I will
work toward that pattern for the next version.

>
> Also, how can you stand all this screaming in the code?
>

Again, KUnit already contains many macros, so this use didn't register
as such. Now I will not be able to unsee it.


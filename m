Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9545D2D3A60
	for <workflows@vger.kernel.org>; Wed,  6 May 2026 08:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056675; cv=pass; b=l/BzWbH5wGeBag6itZOPui7e+379G9m72TDMQq9iHx1sf8id1ZEYBTdv3yEdvnEG3CwsLBA/2KC2kJpwl4tzFO+B63kRfKNjIJlwHddcPJ/sGitSqFt1Ue9usYhkllQkzmuH1dRUtzJSDOIzMxvRqxFIesUpPXcj0GYQcIeTsPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056675; c=relaxed/simple;
	bh=BQ/L1Adqk6o4OdG6nxv5nzheitk/VkCmyj3eyJlGF/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gyf/DSY23mhJa6ia3mCFlxESBVCE6lk0ZaZeUx+p4xF5H3gFhFhzL2+tprURMZlE1EuN3V5ahBylK/oZ6jSHelOySE+/JLLEfmDnmkrxA/UX/N3TS1tqB9qTJqVpcdDHnHg0aBYy+hta+4Ds7qOucw4i9JE4RDcWHvIBRf2q0c0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OUCtbXAI; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oSVICSiY; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OUCtbXAI";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oSVICSiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778056672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMA+C0TJi4LM3UTvwkCroeu4Tv8AgJe8bHK3v1p/l2E=;
	b=OUCtbXAIom0lydhN+lO9z+XtYHlZR6wu9cdq5HmSfK7CnJmXsciTN8Z3v02qLumj4DI2id
	OFfliZaXwRqboOidSL8DG8FSq3zIeVC+zGqsDIcr5AbjoaZn8D+b1L/0E0TUJhM4l78YbY
	/rSWyMCExd/9MblSpzuuY17E1n7ino4=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-oPN53owNMO-WjcbmXFaCFQ-1; Wed, 06 May 2026 04:37:51 -0400
X-MC-Unique: oPN53owNMO-WjcbmXFaCFQ-1
X-Mimecast-MFC-AGG-ID: oPN53owNMO-WjcbmXFaCFQ_1778056671
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bd5c582c4bso148373037b3.2
        for <workflows@vger.kernel.org>; Wed, 06 May 2026 01:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778056671; cv=none;
        d=google.com; s=arc-20240605;
        b=DKfcrKsEkLfO5CCPwcV8Xcb5sTJlTq88t3bheStDW+2ELnRkIKt9MEugaU2Af14shk
         OTNNlOZGckbhvaV5jSK/DDxHyDMlX3hYOc5HdOvZ/9QcXhmlk/6DIVWdwwcjUCwDrq0N
         qj8kns/MDjYOsZijtQCM07kSsKtG/YGUywzQY+lVvrzI5KhY0OiB2Q6xBq534WuQ+npK
         60CZBpH/YA/eUicA1y92jGl2j3u0Do7tE9iVxFaHwB1TrlWw7fGkd6xEet65ZiaQzV7M
         6gTuqeBhegIQoPfJ6FFoZd+5tEj6jTsNSYvLScY2ltoSN7XwFUkC7/BsbNwlanuFscE+
         y0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMA+C0TJi4LM3UTvwkCroeu4Tv8AgJe8bHK3v1p/l2E=;
        fh=yOzk58lG2s9AVn0IIshGFAj357Rfl/m0HJ0IMDaRPSw=;
        b=KdXESjsCJ9gAi0XT2yRxjVuh/Vr+xS3CVVNOkuc5m49Zpk4KTeQx32DqrhhhA9+BAy
         eZXZhwwgLCDpObFznpSal8Gg4/haoGYHnbnm/Wiz+VxYE9s6A9jR99U+CR27Vwn5regQ
         Fu/gBZz0Rman/Pd1IAYRvowQqdZeNBDDEoL5NwSbMRw4IPBLXl/LR3fG0Br67PduiekR
         hCNkz92UX1HGxR3wTPzhPuQ9dVV+8kWqpPKo6bm3G+XwMUHmwCx5PDw44TKOd7AkN76u
         fvZllDnH4geERa9CxlLeovMuj4thOEQ7++hEpyjkeRrkM2DRXu9jDgEOOlA0lp1PatyG
         LfUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778056671; x=1778661471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMA+C0TJi4LM3UTvwkCroeu4Tv8AgJe8bHK3v1p/l2E=;
        b=oSVICSiYMNRU9Dn4//28KAqIiiE7V0SwoLAQK9AQKl54aT4UZ6T1Qro/GgYebEa+zJ
         Yb4fkiKN/JbjPvGKoL9i/Vdk+IVm4XEgeXXmOsX3sPj+6i5I7AipZ7BlFArbnvfZJ6mj
         YUyvXz4NFDdsY5UINlRh+/83sgTEkihD6kPlYW8Tn+DrBTO77zNCMuuwBe+0mQG1fBiT
         w3a/t7k6h/D3NiVUdyqlSGjazoYGYhOp2IcDOEyop497IsPla2+tzlsjuN3JIdh4W1Kc
         yiIquJkDk7k9ZjU8uOLjCbOWsFd3VbUugKKGIDvttRchkr5r/fXnOog300/yMXsGbbHE
         HCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778056671; x=1778661471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IMA+C0TJi4LM3UTvwkCroeu4Tv8AgJe8bHK3v1p/l2E=;
        b=Mv1u+OVSiL602NfPhccnWk8tSssTe9Ffc7B3CNve/kztuMdxXjR1lF8eIj08TDnEOb
         Hc+R7mD4VkjFFqaoT70lVtmc/famv+jpPoEviDTCY/e3kTCA3EFULkwKMxhixVVLOrOj
         WLIpBde1XJktHl1okfyqXg2NYSkcT+qRXFqXtaSkSBzEjUHqlD0dG6y3JVfRvJCAlTYl
         Nb28zWy1AONfbtPPuAn+jiyc2DdPlWeJijv6URkiFpRLzYnO7D1QetehusS0NDq82Bql
         bC2djD1Vf7//b1gq9w/LWmb8YckDOWhehi4QTiA/7CjFZlOfs+oNJRxJ3jxr75jkMJ36
         ldPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gmVt9BDA6Kj5FWMc9JHJaqkCkEOdJk2MEGVbEl59hScteIug0qBsq1VwwMFxinduLorWo7amPfCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJsWAvNi4VHLcupiVDkYy1E0VQ+ssX1SNrlvJY5Y6lJz1DGehm
	MFvX2E+/ftEE1+W4SMbd2NQlwlUWlnlz2p/gdJe3VWe7jnwIxpzd1Cd56oPNG4K+IyK29h3b0ax
	yIbMfGbuIvqptP4NpDUO9Mkog+RoXqC4wlxSq5qZktmgZkw4c4HlPaz7i2tx75wtc3b1kJmRcWF
	W1bPZhduH++aiYZPvmOXeQ3OcLHgaBiwbxf7pP
X-Gm-Gg: AeBDieuDylBTkVjKN4TH1zt85eBldA6oSCt3LAgkBarFXeXCZGT6lBrLUPHTE9J/ti9
	lFg3tWptr2QdgE/rYMjNl3YRz84oHo801neow9RrePAkQcnGZ0xKaUh9UjmWtYHpgvF56/GuyUw
	J6UKpTGEu0TvHDaanmVAlVFfD7XvuZXdAO58WAN/NpF3E+JM7fT5bq/ge8K+E/U5fiGJDLfeFRc
	ViV8XI7fp5xhORS
X-Received: by 2002:a05:690c:60c3:b0:7bd:696d:5137 with SMTP id 00721157ae682-7bdf5eb872emr28070227b3.41.1778056670886;
        Wed, 06 May 2026 01:37:50 -0700 (PDT)
X-Received: by 2002:a05:690c:60c3:b0:7bd:696d:5137 with SMTP id
 00721157ae682-7bdf5eb872emr28069617b3.41.1778056670063; Wed, 06 May 2026
 01:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-kunit_add_support-v8-0-3e5957cdd235@redhat.com>
 <20260504-kunit_add_support-v8-3-3e5957cdd235@redhat.com> <20260504-tentacled-free-lobster-38d8d9@houat>
In-Reply-To: <20260504-tentacled-free-lobster-38d8d9@houat>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 6 May 2026 10:37:39 +0200
X-Gm-Features: AVHnY4LGPM5httthyZYEMeSVpsAZZGIetxyr0Irj5BEH6JEFnHV4PP6tgxL43VM
Message-ID: <CADSE00+TPGWPjD7DGHy5f+=QzwUqYHc=X-G1sEER8=NS5VvV-Q@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] drm: Suppress intentional warning backtraces in
 scaling unit tests
To: Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Guenter Roeck <linux@roeck-us.net>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Alessandro Carminati <acarmina@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 12:04=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Mon, May 04, 2026 at 09:41:27AM +0200, Albert Esteve wrote:
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
> > Acked-by: David Gow <david@davidgow.net>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  drivers/gpu/drm/tests/drm_rect_test.c | 23 +++++++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/te=
sts/drm_rect_test.c
> > index 17e1f34b76101..818e16e80c8f9 100644
> > --- a/drivers/gpu/drm/tests/drm_rect_test.c
> > +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> > @@ -409,8 +409,16 @@ static void drm_test_rect_calc_hscale(struct kunit=
 *test)
> >       const struct drm_rect_scale_case *params =3D test->param_value;
> >       int scaling_factor;
> >
> > -     scaling_factor =3D drm_rect_calc_hscale(&params->src, &params->ds=
t,
> > -                                           params->min_range, params->=
max_range);
> > +     /*
> > +      * drm_rect_calc_hscale() generates a warning backtrace whenever =
bad
> > +      * parameters are passed to it. This affects all unit tests with =
an
> > +      * error code in expected_scaling_factor.
> > +      */
> > +     kunit_warning_suppress(test) {
> > +             scaling_factor =3D drm_rect_calc_hscale(&params->src, &pa=
rams->dst,
> > +                                                   params->min_range,
> > +                                                   params->max_range);
> > +     }
> >
> >       KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_fa=
ctor);
> >  }
> > @@ -420,8 +428,15 @@ static void drm_test_rect_calc_vscale(struct kunit=
 *test)
> >       const struct drm_rect_scale_case *params =3D test->param_value;
> >       int scaling_factor;
> >
> > -     scaling_factor =3D drm_rect_calc_vscale(&params->src, &params->ds=
t,
> > -                                           params->min_range, params->=
max_range);
> > +     /*
> > +      * drm_rect_calc_vscale() generates a warning backtrace whenever =
bad
> > +      * parameters are passed to it. This affects all unit tests with =
an
> > +      * error code in expected_scaling_factor.
> > +      */
> > +     kunit_warning_suppress(test) {
> > +             scaling_factor =3D drm_rect_calc_vscale(&params->src, &pa=
rams->dst,
> > +                                                   params->min_range, =
params->max_range);
> > +     }
> >
> >       KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_fa=
ctor);
> >  }
>
> For both I think we should add KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT call=
s, no?

Hi Maxime,

It may indeed add verification value by ensuring the call actually
generates the expected warning.

The original patch did not include count checks on the version I
inherited it from (i.e.,
https://lore.kernel.org/all/20250526132755.166150-5-acarmina@redhat.com/),
so I kept the same approach while adapting to the API changes. That
said, the check is simple to add, so I could include it in the next
version.

BR,
Albert

>
> Maxime


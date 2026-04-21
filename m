Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F5F3876D5
	for <workflows@vger.kernel.org>; Tue, 21 Apr 2026 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760893; cv=pass; b=EwdKtdSuaHnlyJ+8Ex2FVNv3p73RGmCWNZmkihNoG8I9HY0oohIv1LjQy/MIctdZ8MW7zYZCgx62cJAQIXRnN7eCbt2pCOAMVDLS+JGe7hD9dhLxKPHHrVTEwEEGbszwUSsVuD+hjCPBYyIdZ3Qwvz1YCO7kLtWJ9cWT9Y3MVU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760893; c=relaxed/simple;
	bh=5gWD0q/49ZLsDRQhbUstsKZVTNK2YxdD0Bag7lPiTKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQNmUD8QEYnAC0Ir+Sb6b3c7LZfyJ24axAuoKCSihd6qYSQQQnjMQaFDxS4l9Ip51sldDjpy7RdQ9hKTZjJc7YjnGr/2C53vwZL9iFpHXdsKUfIRwBJWb4pZLo2+L/L/PHY5nZudP+XJ4dKB9Y2fPFCc+nRzjDLIL6kmTY79BbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AbL8eMy+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iAIv2fog; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AbL8eMy+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iAIv2fog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776760891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mC05YTc5SmuhQF/mCBd5RraHNHqhmq97LDEIrPY8QyQ=;
	b=AbL8eMy+FJQQ8Vx0AitvijyiKUsKAJqy4Yc2G69FD3lAU1f4hmXO2LHkK7uiV1BqzoVn+f
	sJ2dR9Yix/+oTLi01P3EiSkQVI5bppQIsEbD0X73yfJ2Rk5HcwiU80LUsDdDgBEXCL02NO
	kFTn1IrXuAdzl5p785kBLOQJmtvTzPA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-zFe_lEw0OCSO3Krfgn5feQ-1; Tue, 21 Apr 2026 04:41:30 -0400
X-MC-Unique: zFe_lEw0OCSO3Krfgn5feQ-1
X-Mimecast-MFC-AGG-ID: zFe_lEw0OCSO3Krfgn5feQ_1776760890
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7900fc7033bso101197787b3.1
        for <workflows@vger.kernel.org>; Tue, 21 Apr 2026 01:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776760890; cv=none;
        d=google.com; s=arc-20240605;
        b=XtdIBSBQN44em91vFDvH1TiKvm7qTJcG7+DhY7bXoZXf0vZOnwa05Ef7GtKg91Jmup
         wqT4n4YdT1uaGNMVs58TVH7Vu9Bx+MupfE/mA7h93Ghu6/IA7dM2oiP8JWoMdwf/GHWZ
         1qCmx1Y7vY2DetmuIggpDj3xomHkK7zoxKrFNxS5LIEELe+HJ2fmBSkmsFeg3CYHuAuE
         ybxZsevpEjc2el24U/egFTvJfOoKoPKweuuyo/Sg1haBeY2F5CL9K1nn2C32YqRcw8Td
         yzwHyd6w6noIwvrncFKnt1qrNNaXJH+9y3QoIOOHzeP5Bz6v5WbaV8+aPxUF1DM4dH/O
         vqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mC05YTc5SmuhQF/mCBd5RraHNHqhmq97LDEIrPY8QyQ=;
        fh=vqb/RI1B3isIHVrlluVZoa8EnqXjsxDi/FarjBECboI=;
        b=UJNhbK99COvIRJnxRzozVLfsZPxlQ1pL17ehH7IfOO3KV0GVW3X0NMKx0MfGcUxnqP
         6FB9tQhnO6Z4W4CVMOxYMvVy4k9OvEZh4Wcit7OwsVxFLzyPEOzqlSnv2LuRRulP7q3W
         wyeI0435OCwj/yX4ES8fPJax7a4LV6Nr6yZqJABW3nojsqFQpMdsrKTxPdSRPMEheRFe
         o5zV4c35u4BCGsMpXmSo/AFDl7rjaKAPI71RG3IMym0qYTJj0YlKkw5YELW/VBmGJGfP
         QDR9fd2IBqCGmOnBdvIbme3mqwmrN5GXPfAgf+qRGPTTP3t9CYLS9ZCqQHM2u7Eaz/zG
         5g8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776760890; x=1777365690; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mC05YTc5SmuhQF/mCBd5RraHNHqhmq97LDEIrPY8QyQ=;
        b=iAIv2fognnDFBz+mNdugdGnUbXefvJBduQfbB/StpfDAFbrJ+4c29TQ3BW/klObKrl
         rcNZsCtPNxCh70Oo+KR8DqZw+mFIsISGvHGjBwayoB2aVhqUGfXC3MKEoBM/7D/LNCPf
         xZXK6hxAmRRixV0RnxWnggCrkwF77r10hXYYOy/NPVxTYFLIeXjaJKchF4Wwy3ZfavcH
         MZWRVgzDWxJjyFXlsh5S7D7HebXhloBHXGhFOFtWzdctc2RRBYJYpjJ8+0YDArqBzTMH
         bMpgZHxH21MyNRfniphyeV9OfwxNODNPLmv7poigeGb4xGS6uR5j1cplGx8Z54RoofaL
         tmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760890; x=1777365690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mC05YTc5SmuhQF/mCBd5RraHNHqhmq97LDEIrPY8QyQ=;
        b=EcaYqR1dl3Mzu22tMFyFcgmkZ5E3UKKtjgZygA6qX12u2Sw10pYrl98tqJRa3SL7QS
         6edTkNkGxeDE2qsrVC08w+I35hEBDP9LhNz1PjmfL7jcidzWcj4kgTun+V2a0WMvixsx
         wFx/XDI1/NTUg6f7x7E6sBykZu5Rfb+6hvDLYeE7RKacynCWjawr18BFyhhv7BGp5mRd
         8t4mJjnm7dZCBSF89Dr5JsvRZ0BQAA/yZ+GrAbngnNLF3qAYHY9HCOx+IjhWM/qkaCSV
         1qch3whpKQNlN2XXA0QNPmpQb5ah2uxXSigZk9IP+FTNyQ/xUCK2ZphfpwQyV6YOV5uY
         yuPg==
X-Forwarded-Encrypted: i=1; AFNElJ8cjTLnqpo2qXx2iUGg8TuJuOkxvi7NroTXNczIvfZbApAi/kT1P8C02/lUFle65Tux41E0xlt7fxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYmiBn/bIzYLICi16oC8kvJPYg4NocJZJU/hTS+D1Vh7wTyoyP
	LrbfEnWyq+fmOTKSETxG9H+BMF7c2G1rhVKX0fgNg8KjGIi1jrSOoLrkSbLS6EwfcCkLn+Vvg43
	jfpzlVVuiJ+hJvtYPM6UEJ6y/FlqROZiNuRDUof/6QAo6GbJaDsIV3Jy2YVPCegnJ7IUsAZCRga
	LnyxwaS0DHcnlhPO0wLs2ov/D6CvWki67hRcNp
X-Gm-Gg: AeBDieu8ccyppJo8vEu4zSUP7XrkhWBU/gxxbjDlX6JRGddqK9P5P3bzPhSNViI9Pca
	tatWdffQvwOgAtldesI6Hkn28CLRveMis86wCeWMLaq9n+Ht/1KiQjUm6IMfJ8XgWEeTF6Gq0TO
	IfeLp0M2iLe0Q6N/ojvrHxM7WFa/2fqof3w40/L3OVSd0nPcVN7lAsc2nRKWb/7SFeLbIydIB8X
	w==
X-Received: by 2002:a05:690c:6e85:b0:7ba:f0ed:c5cd with SMTP id 00721157ae682-7baf0edf46bmr49084197b3.33.1776760889719;
        Tue, 21 Apr 2026 01:41:29 -0700 (PDT)
X-Received: by 2002:a05:690c:6e85:b0:7ba:f0ed:c5cd with SMTP id
 00721157ae682-7baf0edf46bmr49084027b3.33.1776760889332; Tue, 21 Apr 2026
 01:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-2-e8bc6e0f70de@redhat.com> <20260420144453.GK3102624@noisy.programming.kicks-ass.net>
In-Reply-To: <20260420144453.GK3102624@noisy.programming.kicks-ass.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 21 Apr 2026 10:41:18 +0200
X-Gm-Features: AQROBzCV0B5mGT_w3fyNoIOcvbOSxwzeCNrVj_GyXS8H3Qz0Owy2xkfDx8OhQQ8
Message-ID: <CADSE00LrkRcuWw_uhbRbjvDhoHX4Ogouu038-9kQEQ_3BxPG5g@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] bug/kunit: Reduce runtime impact of warning
 backtrace suppression
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
	Alessandro Carminati <acarmina@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 4:45=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Apr 20, 2026 at 02:28:04PM +0200, Albert Esteve wrote:
> > From: Alessandro Carminati <acarmina@redhat.com>
> >
> > KUnit support is not consistently present across distributions, some
> > include it in their stock kernels, while others do not.
> > While both KUNIT and KUNIT_SUPPRESS_BACKTRACE can be considered debug
> > features, the fact that some distros ship with KUnit enabled means it's
> > important to minimize the runtime impact of this patch.
> >
> > To that end, this patch adds an atomic counter that tracks the number
> > of active suppressions. __kunit_is_suppressed_warning() checks this
> > counter first and returns immediately when no suppressions are active,
> > avoiding RCU-protected list traversal in the common case.
> >
> > Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  lib/kunit/bug.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
> > index 356c8a5928828..a7a88f0670d44 100644
> > --- a/lib/kunit/bug.c
> > +++ b/lib/kunit/bug.c
> > @@ -8,6 +8,7 @@
> >
> >  #include <kunit/bug.h>
> >  #include <kunit/resource.h>
> > +#include <linux/atomic.h>
> >  #include <linux/export.h>
> >  #include <linux/rculist.h>
> >  #include <linux/sched.h>
> > @@ -15,11 +16,13 @@
> >  #ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
> >
> >  static LIST_HEAD(suppressed_warnings);
> > +static atomic_t suppressed_warnings_cnt =3D ATOMIC_INIT(0);
> >
> >  static void __kunit_suppress_warning_remove(struct __suppressed_warnin=
g *warning)
> >  {
> >       list_del_rcu(&warning->node);
> >       synchronize_rcu(); /* Wait for readers to finish */
> > +     atomic_dec(&suppressed_warnings_cnt);
> >  }
> >
> >  KUNIT_DEFINE_ACTION_WRAPPER(__kunit_suppress_warning_cleanup,
> > @@ -37,6 +40,7 @@ __kunit_start_suppress_warning(struct kunit *test)
> >               return NULL;
> >
> >       warning->task =3D current;
> > +     atomic_inc(&suppressed_warnings_cnt);
> >       list_add_rcu(&warning->node, &suppressed_warnings);
> >
> >       ret =3D kunit_add_action_or_reset(test,
> > @@ -68,6 +72,9 @@ bool __kunit_is_suppressed_warning(void)
> >  {
> >       struct __suppressed_warning *warning;
> >
> > +     if (!atomic_read(&suppressed_warnings_cnt))
> > +             return false;
> > +
> >       rcu_read_lock();
> >       list_for_each_entry_rcu(warning, &suppressed_warnings, node) {
> >               if (warning->task =3D=3D current) {
> >
>
> So the thing you're skipping is:
>
>   rcu_read_lock();
>   list_for_each_entry_rcu() {
>   }
>   rcu_read_unlock();
>
> Which is really cheap. Did you actually have performance numbers for
> this?

No, I do not have performance numbers. I kept the counter and the
separate patch for consistency with the previous version of the
series. But you have a good point, the skipped part is really cheap.

>
> A possibly better option is to add a static_branch() that could elide
> any and all memory access.
>

Previous version had static_branch and I removed it because I
understood from the discussion that the gains would not be significant
as performance gains are irrelevant in warn slowpath. But I think it
would make sense for a disabled feature. I will rework this for the
next version, remove the counter and use static_branch as suggested.


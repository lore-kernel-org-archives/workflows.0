Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C20C377563
	for <workflows@vger.kernel.org>; Tue, 21 Apr 2026 08:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760181; cv=pass; b=Tc21Lzi/s22SFDcHh49Jw1jN06nHs5cc0cAlhD/vfWgB0vnRlWvY/n9rdO3Ow3jmpYGPq1yvpmhUBBcbj4QoQ+z27+DleTcy2IYPQlWq6poetHJPWmLqwNcFGCkfcXdxP3h5C4mjudmKb0TC5Ug2s7IgLNxGMSC45tUGee6c3SQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760181; c=relaxed/simple;
	bh=VmCa0w61OkMEnKKTodFxVw5pyBCXmkzpXCWn+msH7do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+g6I2gFfvA+tBywD0cgCQNdfMbsH8e99fp3smXVSxjduiVvP6+bECJt//c8yv5DToIepJJwkmFZOBcv4I+m8d2+GIrRhRUgnwAV643kBo/wGl57wXuxNgEk4FyLIQDwo/PMnN069COlGkGuo2GCPvpKhrOsxSbFgLnK08nX32w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MM6C98PR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZmPllE2y; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MM6C98PR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZmPllE2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776760179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXqQRpSCqQOtcTUUEwDGStAcdXKp+wcloKA3SbgGZRA=;
	b=MM6C98PRXQXRyyEMOLx48abUBpN7LMmswzRMJVCmk/Km5bsdYdRoMlWYcAcIT1kaN4QNSY
	hojHpyeRbTCiYNdLj3aqUVmZp6Y9X8/Lkz1mEdG5jUdmaxO0KGfsqc0cDNgdCb/7n7Mvad
	1EmgDVqg3Zocjq6uoroD2PExU4Pr8C4=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-PkgE9h9_Pzezgzey0mO6-Q-1; Tue, 21 Apr 2026 04:29:37 -0400
X-MC-Unique: PkgE9h9_Pzezgzey0mO6-Q-1
X-Mimecast-MFC-AGG-ID: PkgE9h9_Pzezgzey0mO6-Q_1776760177
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-799001d77fcso79847487b3.1
        for <workflows@vger.kernel.org>; Tue, 21 Apr 2026 01:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776760177; cv=none;
        d=google.com; s=arc-20240605;
        b=A7/nxI63cqMY0pCzP1EO4UjBqewgncaj2e9GJPZ/vWTtwjlKfOoEFgIQR9GZnUJ0P+
         aiqTspqZN7r3o77AjYXVwbbohyP5Xr1JUBemb55rcsNPBFwBj9OXhCfE4LIJWmy1a1+c
         osWJ/WTr8tJDMBNbTEjRqa+xLhIMn4LWGE6HjoH0bl6DHB6DYwfsVnHk7Sk0PjpdUoj0
         YjMxmBz0h8g2MHwBdQNrVsm9sBPXjDSCzyrdX+OHv8+teFXzxc1Zbq1YRbvBxdiiv24q
         OioXmRkXqnY4yGSxmhaMrkCsdIaox0Iez7umUhXCpyI9+r9DeIkQJKjqL1pg959DkSnO
         4hXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZXqQRpSCqQOtcTUUEwDGStAcdXKp+wcloKA3SbgGZRA=;
        fh=cBwZzfi3VHlcCkXM7b97bVsY9EdcbecPS832qQW1+Kg=;
        b=MrzapG9/nhtW3OxZou/DG1urqUoSTeKx/67GOgN/qG8fiWlqqCeocRTjq0kxqPoEIV
         6ZZ72e0eoLnqWtNh9F1Rw3+BOxRbQVHOxy2ClRxlwk9A0JvZEEK5MGnhh3bYk+vBoyQp
         JEx54AmWuLVlwq7k5DRvXOywN7nDV8V+3WPdDytBx+TSyBZvLPfDorAVlzTfcpdJIrvE
         K6tZCSaYu/gSmImY/qfBtqYDgu4qxh4+WDEwd8hjz/rn9TB4wKHzCJKx+ObG6F+twj4y
         xgAoWKh+MBQ1j6wn43nqHWAa3sjhByGySlfsUMqTcZVGykNIm1zHd39G0lSZ8F0CUGEl
         h1mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776760177; x=1777364977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXqQRpSCqQOtcTUUEwDGStAcdXKp+wcloKA3SbgGZRA=;
        b=ZmPllE2yqOnE4NFZUcU5mCDLTCf9hJPPseg26gDq4NdTSCqBYnqxuoYrTotCpQc2fD
         Kkidt50vpDEGCDwWwr3wDU5q1aavZPXhlBul/EmqkQmJhnvbLBQsMiLrCyDtr4VR7IRn
         24LoiPP2tm5lfkD2r9jruQelTLhvcIKH6pxhtqIgi3vQbjIc7JYlroCPUyIEK69NU4Oj
         Oq3RxiKLTEFOH9pbNudLSYel1UdWoOORRPBdG1RYESQdoVAa7d6Q8+jpbqxyBQx2nEL4
         iHtu8+DQGaff3KQBNbrXnP+3m/Hf4YFIE+N7XTCkR3Kt96H2swj1z/9EMhHTKmYbNBu3
         ZkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760177; x=1777364977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZXqQRpSCqQOtcTUUEwDGStAcdXKp+wcloKA3SbgGZRA=;
        b=jnqPDXpdr3rATKG3uKpAdhhbFWWBdJyetAgCf55IkL2bhRGxDCJfg3B0SWY9TFfZal
         6/QjjyybYMhULIiUtLjtW6LCfi/S7zZ8faOPq/fsyZxWmutMwmbcp1DjpuaqlVg44w7O
         +Tq8xDaLAgXjGaVMZ6CFqYTTf+L4/c4Hg8iZvOldS83WOd7i8VhauKAa1VamaGWdPgb9
         V0S/UswPyUwao/K9J9pSFR6VEXEUakJ4eBy+PmxKXJnPDXGKzrBGcRyumvaH+FVqHFys
         gawlU4CkgAk+/iDOrBypZwKkmeKUivooFSkMbVakGh8N4ljvX95klC+SeIGPh8sxwgAV
         DOGw==
X-Forwarded-Encrypted: i=1; AFNElJ8bq9WaoNdl00NmK7RQfnXdnmJlPop3OWKGLGFieOkzHyEr06LvjQEYikrdQl8XUe/pAT/wJPuVuh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoVH/RYXKiW9zp3zhLNR89pwUTn5YqZcvhXisutnwoV8ErsWsJ
	5rNrzZmSVhyv68egOAeUOZHCm98LEujh68xpLd5IkYdarEDvhaQo2dUyj0uNHi8X4TYhjHDSdBs
	jMqG+c8LeJxOBNLaebb6+6zFcfwM83UiGtR55M97hj4yFfj0S1Ry0OBHsEwWVT9iRM8OqXJ/0OH
	RPWFqMwdLkgIGMi750r2tPIxY6e16v6NL4FW+p
X-Gm-Gg: AeBDies7RepfNEbVWPFuQneh8S+CJnW3hwNZh1+Qf2uC1kF45/b4XPyiQviAJvIXLZc
	/YNv3BF7hkp/nyg+PzWRV6eZhSeSvH6SVlbjD3vI9YbstyI6+MENy+0DbogSTq7rGAxn48oQp18
	c32adyyeUfAKBDRgranu5QYAdyDSKb75D6tSFaNhSEwUUokC72al8sOFiY/gCjRVyQcShNKa42K
	7QqBFieV39VRIWn
X-Received: by 2002:a05:690c:1a:b0:7b1:d1af:4b95 with SMTP id 00721157ae682-7b9ed03ea4amr180130617b3.45.1776760177035;
        Tue, 21 Apr 2026 01:29:37 -0700 (PDT)
X-Received: by 2002:a05:690c:1a:b0:7b1:d1af:4b95 with SMTP id
 00721157ae682-7b9ed03ea4amr180130217b3.45.1776760176561; Tue, 21 Apr 2026
 01:29:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-kunit_add_support-v7-0-e8bc6e0f70de@redhat.com>
 <20260420-kunit_add_support-v7-1-e8bc6e0f70de@redhat.com> <20260420144512.GL3102624@noisy.programming.kicks-ass.net>
In-Reply-To: <20260420144512.GL3102624@noisy.programming.kicks-ass.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 21 Apr 2026 10:29:25 +0200
X-Gm-Features: AQROBzAEAbEFlPw_UOBBc9Hp9GuZ76mdLqLO_-KNOSIDgp6-Bgs3Cp1G00-BX1o
Message-ID: <CADSE00KyJhzf_p1Z9qZ-PRi5_9pEhSxHnP5wy+kdxexB2a2scw@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] bug/kunit: Core support for suppressing warning backtraces
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
	Alessandro Carminati <acarmina@redhat.com>, Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 4:45=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Apr 20, 2026 at 02:28:03PM +0200, Albert Esteve wrote:
> > +bool __kunit_is_suppressed_warning(void)
> > +{
> > +     struct __suppressed_warning *warning;
> > +
> > +     rcu_read_lock();
>
>         guard(rcu)();

Nice. I saw plenty of examples using explicit calls, but I had missed
the guard. Thanks for pointing it out.

>
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
> > +
> > +#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
> >
> > --
> > 2.52.0
> >
>


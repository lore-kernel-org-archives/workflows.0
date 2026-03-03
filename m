Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F90442981B
	for <workflows@vger.kernel.org>; Tue,  3 Mar 2026 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536832; cv=pass; b=mU+ntMOIM0EJ3AElnMVubA5k87qhxd1vBh3u/Kjd/L4wVvZuS+kJk/izB0XtYwUc4j1yCksVLxlPFKT/jWL3As/SytpBs+yBX7KUrV3T6KgIKThpxO8jgmnNs7HVGe635azUNO25Y8xUAqYHj6SLlPe47kuk7GAXKdXQGU1G4Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536832; c=relaxed/simple;
	bh=wOdVetkLvbx0KrzuYwC1YhLWHB2QyWCjfnt49tnKb+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYcOh9Z2KixR0hhwnm6H2DFCEP9datsrzSO1yGVc2QiGIkCcm0ae//eXI23dh9GeA7jyy0va+CgxpTxx+iHVyTi2D1489Dzmcfk9qawHYGCOci8oHfEu0CREhq91jTvMwXluhfaxlIb1gIB0iYJilH8InT01KgBs+V1QEfhgZlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3EYRPWj2; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3EYRPWj2"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-89a018cbbf8so20298846d6.0
        for <workflows@vger.kernel.org>; Tue, 03 Mar 2026 03:20:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772536828; cv=none;
        d=google.com; s=arc-20240605;
        b=PO90Ooc1qTddl8D9F7GYDyvR3WRbY1qza4+Cu3KTeyWcMc8EVLfv3wBr4Iv9C77fYD
         EAYD0OLjSsy+LpaOO++4N8qwais+waclHLxmx8pzKxuc4jQSkxeZZDc50v/7mvJHDxXK
         jpDiCokGRGBhb8+EY72c21XWrGLAVmT/quQC8OKTYd2LCkZd128MpxZAoYX5zyRPXp5t
         cOKMv42GPBCp6rlU0n9IIYZVLSCAOGSZznQeaYNpX0EU3W860Q8Oavjkw2+iJWMtDBP5
         jcFp8KKCG1kq3moDuwIRgJSgzw2Q56wGYjRzfuVqIPOmmpz6NSGqtMfakMUcRQ9Iy4bu
         OaUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fs5xy54dOwpapJM1ABjgdm4o/gqygsmCGVNWqgWoRQE=;
        fh=b/O9MsMLcmxZ8i8yvX30z1U+mLkt3pLOLOXo0XJhqtg=;
        b=ZiEfMaDoWFxXW3ouLafSTiu1lXHIvf3bqbFBoito4r5AwJmFrCwEEd1e+REuAH41f5
         LEMPXnq+nT5nCdmQWJuvgd5jdztqcq3HnevUrhYWeiusWk6IlK8mrXSAl+BgQtzCXGa2
         wHlOQ9Otuv7CUh326uMxZH6Ku0trIAkY+4f2llYmw6a85ojybTKGZrHQZMyKsh4Y7RMu
         Np1pzl0RI6ERUD1DUhw2dQ00LCCfx19xYi04P+3qdXbVBVlSEQjKCFFv2vDeAQ8eguz0
         prH0K/m/rJR9MywQuCYW2L5PQhl6st5BZCuUMA/3swoWH9tdGt0IohseH3IdSeTZ1f7B
         gJmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772536828; x=1773141628; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fs5xy54dOwpapJM1ABjgdm4o/gqygsmCGVNWqgWoRQE=;
        b=3EYRPWj2mG97ZpMbZBoro6rxMolw+XEZvArwlAAVyrvYK3zXCXMg2VEIQ/W5cKvFfK
         UrW4WMGJTCFrVgaDAsBI7x4fQZIXdaQPGEzYDkhdrGEFq4ZJq0j42CnHNodCE3DZinmv
         6MxOeOcmf78wistGqJNG0/wrf8FhmaRiY0tLGqHa4XhwIqW6HEgvuJz2/qK3FqK16W+B
         Np4xnPHltVGIMkXhcyhXW6C4f5UL5cQDvIIpy+142BbB6pKAUwjc+VYvKcnQwqBW2fgT
         1HQACkZliRJ4olmTdCTKDlLC46S9pwgjWBUIMnJ1BiccYWGvpNLr5z2CpymRvSWpKlQ7
         EtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772536828; x=1773141628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs5xy54dOwpapJM1ABjgdm4o/gqygsmCGVNWqgWoRQE=;
        b=qaXQrfCBp5dyuce/bKtXg8TzOgGg3dT+wkTyQQnkma9+VPiJg1BReM1F0l+7QI+RBN
         ZkIoS5WJmSmgwCWwDbT06qBA4JL506QVe4sTnNYJ1SqPiznlUaVNT2UMZ3aAVqDVOO/u
         kmDuBFYLeWUYglcc+bALKLRm8kgl85pteKvQeFVIFaa0EGy4U7mricX4chuxLzep5EAH
         Amt76wdbPHxuCe11GjFyXr6lBAPR0YqECh+fvWiibd6EPvTracrVAFFOEGrmG+EEJAKe
         AMsGNmrVS6kGHdZobpbWrIeJ5+oymNf2xAdWOt2B6PFVShTK03TTXSIUyTDtm8J5lkLU
         MvTA==
X-Forwarded-Encrypted: i=1; AJvYcCWvol8ouibAiCsOAPlH/rLIMpLWuudKyQXD+B7watcvyZlAJnhnEw/CTJJ06V4kb9w8J+9OIHl2ZZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWCosZMql7NmYno7v/dWA0Kfd6s78SWXELH/gAHQn8odJdQEef
	5mpqDTc2frb4gqc9aeBcQxz760abaFC9hYekqcF64q/Jn0ARY6mFPYlInxq+Bir70eeSol7PYME
	neM6ibh1NBDXRLVQUx+h00zyYUJQCSCl+FMkWRDAL
X-Gm-Gg: ATEYQzxAlpfitUJ0vY7ZjLPGlqgypRlB56Vy+xdtBr1kO1FziB8cKIpgUSs8/CZF36e
	zgj4Gad9D74K+QrZyem8ysaMiZpliCmiJolXz35lZSFoytJuLFuuXY1miOL01LUV4kxIxaCTJnC
	sJIUHSfWPGQkqKq8kkZS5SlcR+/LWMt2xMR/OI2iZouea+kvXe0eRylDDWLI/75v06YB2ctTHXy
	/lquk58Msq5d8oIXafqzoSjzrUmJJgPaDg50Mtmci7Sm7SgVJ/jvnNViCPInfOq3NoYima+iQ1Y
	y85xVxKlLQpnxajWHrIi2egYJvSxPmadRkjnssZ59TxeFonA
X-Received: by 2002:a05:6214:dac:b0:895:4d3f:b6c with SMTP id
 6a1803df08f44-89a0a89d396mr19056596d6.17.1772536827672; Tue, 03 Mar 2026
 03:20:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225203639.3159463-1-elver@google.com>
In-Reply-To: <20260225203639.3159463-1-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 3 Mar 2026 12:19:51 +0100
X-Gm-Features: AaiRm51ecwm2GzpvBNPquu22Ta0sfwGcKpcC_V0mxDSrZBLMaa5eBCNTn_slx0E
Message-ID: <CAG_fn=WAwHUpoay2kY6rkEZQGYxoDGVJYf5B59Y80ht7++Lmqw@mail.gmail.com>
Subject: Re: [PATCH] kfence: add kfence.fault parameter
To: Marco Elver <elver@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-mm@kvack.org, 
	Ernesto Martinez Garcia <ernesto.martinezgarcia@tugraz.at>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> @@ -830,7 +835,8 @@ static void kfence_check_all_canary(void)
>  static int kfence_check_canary_callback(struct notifier_block *nb,
>                                         unsigned long reason, void *arg)
>  {
> -       kfence_check_all_canary();
> +       if (READ_ONCE(kfence_enabled))
> +               kfence_check_all_canary();

By the way, should we also check for kfence_enabled when reporting errors?


> @@ -1307,12 +1314,14 @@ bool kfence_handle_page_fault(unsigned long addr, bool is_write, struct pt_regs
>         if (to_report) {
>                 raw_spin_lock_irqsave(&to_report->lock, flags);
>                 to_report->unprotected_page = unprotected_page;
> -               kfence_report_error(addr, is_write, regs, to_report, error_type);
> +               fault = kfence_report_error(addr, is_write, regs, to_report, error_type);
>                 raw_spin_unlock_irqrestore(&to_report->lock, flags);
>         } else {
>                 /* This may be a UAF or OOB access, but we can't be sure. */
> -               kfence_report_error(addr, is_write, regs, NULL, KFENCE_ERROR_INVALID);
> +               fault = kfence_report_error(addr, is_write, regs, NULL, KFENCE_ERROR_INVALID);
>         }
>
> +       kfence_handle_fault(fault);
> +
>         return kfence_unprotect(addr); /* Unprotect and let access proceed. */

If kfence_handle_fault() oopses, kfence_unprotect() will never be
called, is that the desired behavior?


>         /* Require non-NULL meta, except if KFENCE_ERROR_INVALID. */
>         if (WARN_ON(type != KFENCE_ERROR_INVALID && !meta))
> -               return;
> +               return KFENCE_FAULT_NONE;

We explicitly don't panic here; guess it should be fine...

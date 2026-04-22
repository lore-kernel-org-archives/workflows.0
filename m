Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704DC2D0C94
	for <workflows@vger.kernel.org>; Wed, 22 Apr 2026 12:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860127; cv=none; b=OGb4Nzo4IqX+dcfvMRHKd7GMZ/F9sSXpo9bm3ehtw95wdIo5tp0TQfYSRtcKkAXcQyjCEL8cCY8MfF1WKD2V+cjjYEJzV23UEEb6fVStOOhJ+kfRunlskMh58i9T9QqpQU0CHR3jXX9HbM+ygEpVsDANHZ22bXIoQ28idttp9vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860127; c=relaxed/simple;
	bh=gf3wVlzjq7SYKdOQz8SyX1AYCuck3FAIluy3DOqkhqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFI+xgYY3X2OqafApGe2aTN7U4Tp0M3b0HzTWiUiLhF/TBTMYgL9ThmzOfAtK3OQr8l6dKGGiA05oTmmcELiG5rD9l8JwItfNpkgiiZ+oQVvotpSvh4b9FCrh/1Ku+SwuE9qNL9yM+yqD2MCGV5SrSExuXiaFWJPcs7HxQ1YU5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56f660d9a51so3588108e0c.2
        for <workflows@vger.kernel.org>; Wed, 22 Apr 2026 05:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860125; x=1777464925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63x6wyxF1/dhHmzv0KfSTBD7Sy2mmqaSOPLd1fIjCCI=;
        b=WDZEFH3WOLiee+9BNgTerWhot7VS7U3OsUn0meRQv4kNec9bUBMCqUq7bUDgI1T0YP
         +wYLR9+C8cDE+pvWZ+QX+il4L9q2fmOMLb40gtNkLevldhg5CtOTudJIB6uzzspDVOuG
         aEuFt2OQ3Knn9CAFcNqxJihS3WP7C00yGoN66cTJXTQHZnx/3LtSpEvb7+oMlPPeivV3
         0d9mHFmTZ0GzZKt6LWbjc2o0o2Jbj8mA+xS6iLWKgC2K03BghspI6zMHDhpYwE1GkBta
         TegplLSRYw+Vgg17bpNdPKfzOT4FAhW5/6smc7KfkgAyZPS7Wz/nLwoF6MGeFVlHmN7k
         qX2g==
X-Forwarded-Encrypted: i=1; AFNElJ8794D/lXaYY+Zq7Dwh8zOvssXfiFrcyPMVDsa2SLZ5+PJEJ7PIgdGqZAGPh9OS2wsKLs3ptaOIYOI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMmv80lDZssRQmOLieLnjerZjn099ob1EE5+lJsPOICJ6fD094
	AVHpwYkufkwnven3EQuP7OpDU/6PCpCDvKBu8oL0gCL450daoWMnPxDsii0dXYMaAgs=
X-Gm-Gg: AeBDies8BOiFsE5Qo0/wCIBpY3zg/XlqybEnKZm3/hX6g5ZzUD+l03Nme/YF+VgUGS6
	Q4efPGV36rigmHBt7SmKWJG5LPT6aoIFkp82SNQOu+NksKQBnvezZhF/AaWFeHqR2VQbQ3vC0eM
	GyXJf3D5XJTNxORxOeDCJxCLvhrMp6fF8B5P6kQ2x571h1ExNmm7kY11U/vdtGtHeMylUl4kYiu
	WbdVb6JcoiVWZfFD5SLMWJRoxEzpzpdPmDQ00ubbxQZszwLhDWzfCz17196SmVnQ7NsP9BesGba
	WKIPNztzJqXzAPrib4RNi5S7uX4Ragyuc/dEj+XGZZLZnLyBK3uJ2+sFEprZrgtoYkp3WntLGNB
	po8BctpVmCFYQWN+m6IQ0pAI50Pc+CB18HLy3m0ZtOxNB3BGUpu5GseLYnSbGSdmMy0GIBNE32I
	pjTFWuAPJTtyKjcI5NUFYuL5BVf5DNsHka4dOj2VxCZT4Dk3/16U/hCrvMMQbgqnnSnEAOrQJjm
	kM=
X-Received: by 2002:a05:6122:8898:b0:567:44ba:bd8a with SMTP id 71dfb90a1353d-56fa59daac2mr8056148e0c.9.1776860125287;
        Wed, 22 Apr 2026 05:15:25 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890bca3fdsm7555564241.10.2026.04.22.05.15.25
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:15:25 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56e91f17a99so3495688e0c.3
        for <workflows@vger.kernel.org>; Wed, 22 Apr 2026 05:15:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ83K4yCjHDOSP0DIASJuAEUvLA+A8sEPlW8sEN5dYjKJz/ZKpHNadyaeCY9AycV66ZFwbFa5pK4rew=@vger.kernel.org
X-Received: by 2002:a05:6122:311a:b0:567:433b:e903 with SMTP id
 71dfb90a1353d-56fa589b89emr11243685e0c.6.1776860119533; Wed, 22 Apr 2026
 05:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421175516.224960-2-manuelebner@mailbox.org>
 <20260421180902.225560-2-manuelebner@mailbox.org> <CAMuHMdV70GhNsxPiuhY92seZRMkr6jk9eFCke7shc08GYerLpg@mail.gmail.com>
 <a5522bdaf37c7f1d2fdf03e1755061a4d803efb2.camel@mailbox.org>
In-Reply-To: <a5522bdaf37c7f1d2fdf03e1755061a4d803efb2.camel@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 14:15:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGWLBtsUfw+oQsbAicujWXM5SiPKic07cv6ifb0H_8CQ@mail.gmail.com>
X-Gm-Features: AQROBzATU1beQWh18ULDJqfZI0lRHd-wjfpfSEAbl2L0bxRcMxlfBKYtU6aTvEY
Message-ID: <CAMuHMdVGWLBtsUfw+oQsbAicujWXM5SiPKic07cv6ifb0H_8CQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Documentation: deprecated.rst: kmalloc-family:
 mark argument as optional
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manuel,

On Wed, 22 Apr 2026 at 14:10, Manuel Ebner <manuelebner@mailbox.org> wrote:
> On Wed, 2026-04-22 at 09:14 +0200, Geert Uytterhoeven wrote:
> > On Tue, 21 Apr 2026 at 20:09, Manuel Ebner <manuelebner@mailbox.org> wrote:
> > > put the optional argument (gfp) in square brackets
> > >
> > > eg. ptr = kmalloc_obj(*ptr, gfp);
> > >  -> ptr = kmalloc_obj(*ptr, [gfp]);
> >
> > Shouldn't that be "[, gfp]", e.g.
> >
> >     kmalloc_obj(*ptr [, gfp]);
>
> I think technically it should be
>
>     kmalloc_obj(*ptr[, gfp]);
>
> but that's difficult to grasp, so i went for my notation. Yours
> is a good tradeoff. I'll think about it and choose the right one.

A third option is

    kmalloc_obj(*ptr [, gfp] );

or even:

    kmalloc_obj(*ptr [ , gfp ] );

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5557C0018C
	for <workflows@archiver.kernel.org>; Mon,  7 Dec 2020 16:02:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA9E02388D
	for <workflows@archiver.kernel.org>; Mon,  7 Dec 2020 16:02:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgLGQCu (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Dec 2020 11:02:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgLGQCu (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 7 Dec 2020 11:02:50 -0500
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA80DC061749
        for <workflows@vger.kernel.org>; Mon,  7 Dec 2020 08:02:09 -0800 (PST)
Received: by mail-qk1-x744.google.com with SMTP id z11so3741710qkj.7
        for <workflows@vger.kernel.org>; Mon, 07 Dec 2020 08:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S7Rpa44vVpK13982B8H0b8cHEVKk1I5bzX3iheCTUPc=;
        b=nbWNhnYJ3BORs1YbHp3dh688MRUQRm4wp0oDnRU0z6E4SglDPNKd/V6uf/R+4dM10c
         KVVXcS4SCye4GOhzchO2y5PDZlzvj+u6kuOmHaYLLYv48NUF0U0NplzsiUbnd+OvaWpM
         0sz8p8jHASySnbY5BH3135UlaBa/O+gaxoU4Sf2kUcVOWXZ9bKgHK+I3LF2DrtdWm+ut
         /t+NDkIxnKa4KzjC+29psRRQ4M/LtW45yV6XwL+qu71RXZVa5pAJRhRzSaz6lT6G+iMh
         jB5whsnsiCwTGqrsQO9Ha0BqR59VTHcLG6cHc/5QAeENpPHfwoKFnkWfUpmoi/wp4Fod
         T01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S7Rpa44vVpK13982B8H0b8cHEVKk1I5bzX3iheCTUPc=;
        b=r4UtZR4zySVofjYOVn4o5hKrz5PqifOQHkzuQj5F5/XlfESY8rZUj9TfYJWNed9bXs
         p1RDoPj6cgghJyTGr6r25Y0dgKK6PlENRXq8B1/sMWi2/4XfKYxot8tSWOdHL1H0IqLl
         C9ALDBdh4U5lkwndF6vLCImDAeQQD1EZHc+Hb8KEAIzpr2RJjeKDMIWWbGPamMaY1Fr0
         T6so7P5j0vHppsnCGXbZghMZ1QtyMvtXK1m55cIHriOccDl/DyNda3xFbEFA2InBd2FU
         GDhxB/AtKuEowHtJPiLQhZVSgu1W7V/WrN0Hv2PxMfACspPJAb3OGpRQDTmYmCrXmAWi
         hqug==
X-Gm-Message-State: AOAM532+cllgeoZOSEhed7zCYpP6co1IrQS98vxBhKgexvU6NRdJZYSW
        B9HoOMXfYd3JSMQb28BwqDGSsyTggRH3PzbcuzG/MA==
X-Google-Smtp-Source: ABdhPJxDIpQj1Ku/XylxtvaARHa1gt6tPurrlNUxhRdpeFP2dwv5QTDzjXFXESyhUAcLM1/oG6O06162hZ+0mTKJIbI=
X-Received: by 2002:a05:620a:15ce:: with SMTP id o14mr25341103qkm.231.1607356928374;
 Mon, 07 Dec 2020 08:02:08 -0800 (PST)
MIME-Version: 1.0
References: <X84nbdgv0a/ak2ef@mwanda> <20201207131446.GA852@paasikivi.fi.intel.com>
 <CAHp75Vftvtn4DhOU73w7hgOYpw9pJbJCJ0dSW6wUrQHA5HMn-A@mail.gmail.com>
In-Reply-To: <CAHp75Vftvtn4DhOU73w7hgOYpw9pJbJCJ0dSW6wUrQHA5HMn-A@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 7 Dec 2020 17:01:56 +0100
Message-ID: <CACT4Y+a3MnDamodmVi6C79+fUEse+71DSG8xPQH7S3Eg4i=S_A@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: ov02a10: fix an uninitialized return
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Arnd Bergmann <arnd.bergmann@linaro.org>,
        kbuild test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel-janitors@vger.kernel.org, workflows@vger.kernel.org,
        kernelci@groups.io
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Dec 7, 2020 at 4:55 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> +Cc: some people who involved in different kernel source checkers
>
> On Mon, Dec 7, 2020 at 3:19 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> > On Mon, Dec 07, 2020 at 04:00:29PM +0300, Dan Carpenter wrote:
> > > The "ret" variable isn't set on the no-op path where we are setting to
> > > on/off and it's in the on or off state already.
> > >
> > > Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Thanks for the patch.
> >
> > This issue has been fixed by another patch here:
> >
> > <URL:https://patchwork.linuxtv.org/project/linux-media/patch/20201204082037.1658297-1-arnd@kernel.org/>
>
> This has been reported by 3 or 4 different people. I'm wondering if
> it's possible to introduce a common database to somehow reduce the
> amount of patches against the same findings.

+workflows and kernelci re multiple reports/patches for the same kernel bug

I think KernelCI DB effort has a goal of fighting this duplication of
efforts. But as far as I understand the exact mechanism for
deduplication is an open question.

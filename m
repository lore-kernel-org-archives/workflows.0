Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B082EECE58D
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 22:57:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8428A2084C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 22:57:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImowyeOc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbfJKW5f (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 18:57:35 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41556 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726255AbfJKW5f (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 18:57:35 -0400
Received: by mail-lj1-f196.google.com with SMTP id f5so11311832ljg.8
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 15:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d1GDtzRcHKblo2XJyAeTMu8ew15C4qR1HatrIAeChbo=;
        b=ImowyeOcQxYWI/r9hKXNGPGyjue+pwn/Q3tB55O55ZRes6U4x6Baj1KduORMRfMZjc
         NOw8m4EeAjSZLE8I5qg1WZYm2PtWZ2UkObEWMQME7bWSmXwRdfMNoDHPtWZ5pjAl+kRQ
         TOIXVWZk4g56Ni3xDFkQoyJOj9Eq+htEpCXTb7ZkrgpYVsWASuS7nLZVSDv8RScVx2rE
         ZkQQ0VAseRNJbWv6XUUh6gNVzGc8wKu5hTKIKEpPRcHGmo3Iem2kdcX4Kx/nUYCvdyLI
         ikOvWDU61scnXMzZtiTx87qxz/nV+dBnSRkGjVHi0mgDxaM6RxNODKn/nkoaV0SKro3W
         Ga8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d1GDtzRcHKblo2XJyAeTMu8ew15C4qR1HatrIAeChbo=;
        b=kbT7fFvAdQHxVSobglTIgoBNm/GrCq+oEb6PcxcSeK+Bg1zWThpRdMS6h8tzkZmKuK
         cWf1Zh6nU60nCsgjcjnZfMW+xrmUzPjDAySOXRE7NSWVO6Si0U86r2CAjAhXoLN28ckD
         AzhK9GQNI5ImfDD6Mfza3ABAzWM4rAbKC2W6rPAf1VPrVlb+3UlKilwG8f9rO/Ay7/0p
         gdavwY1Z79yiukBOJJ04Xm3HFBBYYV3UBL/3ovD1F+1eNcXqNt2SX7l2TI/RS10tKA2m
         99ffIX16BZKAV6ABUei3JYz9L8QoZNYc82hTi7Us8GAJfTeQC1mGr3yfmOH1qkJW23z1
         mE+A==
X-Gm-Message-State: APjAAAWCu48VTbdKFBlbwJob3IOO7JI6eV1FDSjLRW436QY8nwldrNI7
        iNKqAuEqeeKYE5zFV21ggOzr0M1D5K2J5NqnCUA=
X-Google-Smtp-Source: APXvYqy0+YNBYB/1CNd/kmVVdMYO3T496En98l0vUGk1Wdrn2+G8kCW6j7QFnWgKoKyZWSzQbXgvv+WTurMY3HLuC0Y=
X-Received: by 2002:a2e:b819:: with SMTP id u25mr2629279ljo.223.1570834652772;
 Fri, 11 Oct 2019 15:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
In-Reply-To: <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
From:   Dave Airlie <airlied@gmail.com>
Date:   Sat, 12 Oct 2019 08:57:21 +1000
Message-ID: <CAPM=9tw9gLAnL5FyT_u_beGc4Bt8vexOyWwDf06L69czkvowng@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

> I don't disagree and Shuah's comments are very valuable here. However, I
> would argue that these folks don't necessarily represent the target
> audience for this tool. They may be newbies, but they join these
> initiatives with the goal of spending significant time with the kernel
> and its code, so they don't mind the effort of learning the proper way
> of submitting patches.
>

It's two different group,

a) people who aren't currently employed to work on Linux and want to
be will jump through a lot more hoops with a mentor, they also are
unlikely to been working at a company with horrible emails.
b) people who are employed to work on Linux or at least Linux
ecosystem tasks and want to send one or two patches upstream they
found while developing their products, but can't use personal email
and corp email sucks, and who use github for most of their lives
elsewhere.

I'm guessing we've got a lot of (b) we don't really see represented in
mentorship programmes.

Dave.

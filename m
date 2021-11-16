Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0C9C433EF
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 08:01:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1604C61C14
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 08:01:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbhKPIEv (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 16 Nov 2021 03:04:51 -0500
Received: from mail-vk1-f181.google.com ([209.85.221.181]:37665 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbhKPIEp (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 16 Nov 2021 03:04:45 -0500
Received: by mail-vk1-f181.google.com with SMTP id e64so10689218vke.4
        for <workflows@vger.kernel.org>; Tue, 16 Nov 2021 00:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nF8XoIhGGXe5ManWzrMSdUmfKr6Maw94PqDon6dZCzQ=;
        b=MzYpzXG7gjmC5QDfmOEoEmgXh8pN1UBYoK3biD7oP6gpURGmRqhU6ppoGtWmwit9j6
         9OqQOaE+PZc9SVljaVGLdVObxlqNt1mpEypRl2Mo8HUCO1jJWZJRbdUg7g6nqE+LK9TX
         vNGr8AiEZUqfu4/yxKyvr6/5/D/0S9LjXDatg8W1lZPMBzo9I50Ag4pTri8ZKxVFnUMI
         fUdKsXiQyl1Ktt0fLzmEp/2rMuipJ9Cayyjn94OPvPYF8hz0BKbCuG9FStrm0Q5rtooW
         66P3lMiTzQkVL5Jkz7U9TakbVuaOBQOCcvOZ0C6j9QTXcYGAyI8dxqWW6EwZbLpJygBA
         S4/g==
X-Gm-Message-State: AOAM5333DzXBNVvYyH9IT5zKmKzxIae10wkYQlUsY5kJFemAlnSKHtAZ
        ij8BBS8hgfwNlO0xaYyS5MTg8FRTDMmJqw==
X-Google-Smtp-Source: ABdhPJwtwnheWym+To9q2tGC9pQ3e+05cqPGNipS6zcVtLZI4qtrcZzCLeyAVLuAgKLzaejzwgOJbA==
X-Received: by 2002:a05:6122:1796:: with SMTP id o22mr70727005vkf.23.1637049707782;
        Tue, 16 Nov 2021 00:01:47 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id k1sm11742269uaq.0.2021.11.16.00.01.47
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 00:01:47 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id b125so10681373vkb.9
        for <workflows@vger.kernel.org>; Tue, 16 Nov 2021 00:01:47 -0800 (PST)
X-Received: by 2002:a05:6122:7d4:: with SMTP id l20mr69304077vkr.26.1637049707209;
 Tue, 16 Nov 2021 00:01:47 -0800 (PST)
MIME-Version: 1.0
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
 <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com> <20211115214641.lxo5zhttrqq6mx2z@nitro.local>
In-Reply-To: <20211115214641.lxo5zhttrqq6mx2z@nitro.local>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Nov 2021 09:01:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUjfGJcZt1J7+XUHdCBhK2Wvm=KkKEOrG3ieFsPqTcgng@mail.gmail.com>
Message-ID: <CAMuHMdUjfGJcZt1J7+XUHdCBhK2Wvm=KkKEOrG3ieFsPqTcgng@mail.gmail.com>
Subject: Re: Gmail (was: Re: lore+lei: part 2, now with IMAP)
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

On Mon, Nov 15, 2021 at 10:46 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Mon, Nov 15, 2021 at 07:34:00PM +0100, Geert Uytterhoeven wrote:
> > On a related subject, I am using Gmail for email (e.g. patch review),
> > but not for actual patch submission (git send-email through my ISP's
> > SMTP server). I do have app passwords set up for git send-email on
> > my laptop (if I ever need to send patches while on the road, barely
> > used so far) and for backing up email using getmail.
> >
> > Recently I received an email from Google that my account may be "at
> > greater risk of targeted attack", and that they recommend enrolling
> > into Google's strongest account security offering, the Advanced
> > Protection Program.  Apparently this makes use of a hardware token,
> > the Titan Security Key.
>
> Well, I'm sure they wouldn't mind if you paid them money for a "Titan Security
> key", but it's really just a rebranded Chinese-made U2F token and, as such,
> not any different from any other U2F security key. You can get one from
> Nitrokey (nitrokey.com) or SoloKeys (solokeys.com). I *do* recommend using a
> hardware token for your Google account, seeing as it's increasingly tied to so
> much of our online identity.

Thanks for the explanation.
Given it uses U2F, that means I cannot use the Nitrokey Start for that?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE287C433F5
	for <workflows@archiver.kernel.org>; Mon, 15 Nov 2021 18:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B66D86355B
	for <workflows@archiver.kernel.org>; Mon, 15 Nov 2021 18:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237302AbhKOSjp (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 15 Nov 2021 13:39:45 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:38645 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242478AbhKOShK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 15 Nov 2021 13:37:10 -0500
Received: by mail-ua1-f44.google.com with SMTP id w23so13965929uao.5
        for <workflows@vger.kernel.org>; Mon, 15 Nov 2021 10:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=knH3ddoYX8N6nDa60kQNqQNb6pH4rRj27nRZwT6xep4=;
        b=u8Nw7LNeyeUv1hA0Bt1kPPdn5W2N4L1ZJQTiGCT51H74Ff8gV3GLNUIQOV9Zy5UdFw
         CQdeSP6PLorDPOYU+QG87sOK3V+G7JEY9bIAKH7ZgaijioBZp6DZwE0XlnhsTGOXf/So
         YB45gitEdpiIdCCp2yy+Qd6aV79lob2+iEqSr7o5hWM3dLLNgeubidWQ1a1AFjDD50av
         68TgvMTSlyLcWGKnpo+U7oFWvso8v3g/8ffC+SPvTzadmBZcCN3UrWwvj9ozk6jD9y4z
         XpiyR/1QvvisUuj0LtPMk6tV6Ac5wwDvu3ffuG7R6BU9duSSP6zBZPSSvaYTg3aD6zSa
         YWxg==
X-Gm-Message-State: AOAM533Ugh3gws4avk5Y907KU7czC9Yr4zUmJVR4WkP0Uo+m407nJs/n
        jVJWu951rxN4+0/jMPlIb7KMV1ItDkLzIQ==
X-Google-Smtp-Source: ABdhPJxzZbsF1iwc16K8LGYCcLgCCJ4i02J9N994mFPOsMxw9xG8vY4jEcchcZJX1ZMwkF8VmdmfYg==
X-Received: by 2002:a05:6102:c86:: with SMTP id f6mr46977623vst.38.1637001252139;
        Mon, 15 Nov 2021 10:34:12 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id j15sm9369566vsp.8.2021.11.15.10.34.11
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 10:34:11 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id p37so35230814uae.8
        for <workflows@vger.kernel.org>; Mon, 15 Nov 2021 10:34:11 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr45406748vst.37.1637001251566;
 Mon, 15 Nov 2021 10:34:11 -0800 (PST)
MIME-Version: 1.0
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
In-Reply-To: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 15 Nov 2021 19:34:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com>
Message-ID: <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com>
Subject: Gmail (was: Re: lore+lei: part 2, now with IMAP)
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

On Fri, Nov 12, 2021 at 8:13 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> Continuing on my previous email about setting up lei with lore.kernel.org,
> here's the next installment. As with the previous part, this will be posted on
> people.kernel.org as well as here.
>
> # lore+lei: part 2, now with IMAP

> ### The same with Gmail
>
> If you are a Gmail user and aren't already using IMAP, then you will need to
> jump through a few additional hoops before you are able to get going. Google
> is attempting to enhance the security of your account by restricting how much
> can be done with just your Google username and password, so services like IMAP
> are not available without setting up a special "app password" that can only be
> used for mail access.
>
> Enabling app passwords requires that you first enable 2-factor authentication,
> and then generate a random app password to use with IMAP. Please follow the
> process described in the following Google document:
> https://support.google.com/mail/answer/185833

On a related subject, I am using Gmail for email (e.g. patch review),
but not for actual patch submission (git send-email through my ISP's
SMTP server). I do have app passwords set up for git send-email on
my laptop (if I ever need to send patches while on the road, barely
used so far) and for backing up email using getmail.

Recently I received an email from Google that my account may be "at
greater risk of targeted attack", and that they recommend enrolling
into Google's strongest account security offering, the Advanced
Protection Program.  Apparently this makes use of a hardware token,
the Titan Security Key.  I have no idea what kind of criteria are
used to reach out to people (might be people involved with important
FLOSS projects, who knows? ;-), but the other family members haven't
received this.

Perhaps other people are in the same boat?
Do you have any advice here? Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

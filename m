Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E91C433F5
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 12:19:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC42361A88
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 12:19:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235815AbhKPMWK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 16 Nov 2021 07:22:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235913AbhKPMV6 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 16 Nov 2021 07:21:58 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA3DC061570
        for <workflows@vger.kernel.org>; Tue, 16 Nov 2021 04:19:00 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id w23so18981779uao.5
        for <workflows@vger.kernel.org>; Tue, 16 Nov 2021 04:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iHci2NTkkHht5yvCYTwFWArBk8GP54A6KHxSTny5uAE=;
        b=Rvi+Hi4o7m+jh1oeWTTetxY5KYU0pfoR+v7iZufasqA1WXdzlUrJMll+0M6RvLsfF7
         yLFkBHl9OypYIeXQFa69Q8Ktr76P7pYwewsphEEpwsC62+Mi5wDet6ZMiXbMW3vomrN4
         aSNjmNnMncwp22l+tVq3hdv26EIjLIIq8pEyQT8c0q3tLl+jxI5w7Fi/2EbbHvUknhRh
         LDgMCZce2ZHBPBgBxJT0dEaZqW22UulhvSGIhv/LkZV3wS3E3yGYjuJ1Hs3gQT7qVvRH
         eO29OJh3OZh1127y4xla3B5rBu91UWxw5p4jZa4iqwDAS5uupiVpuJwDNozmq4peX5OH
         6F6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iHci2NTkkHht5yvCYTwFWArBk8GP54A6KHxSTny5uAE=;
        b=bf64crM3N1MIzl44Of0RMIpgkK5sFvC81SjcmwxE9GIa8nIFdgdhrmPd9Paw1cRC8B
         XEv7PS4nIi4MqdVhWZNM+I/Eu0+gWnOmA439FxGzt4bbPVVT0oKY6sLkHSTNjuj6ECUC
         MIAPgS/bxyqJFcOQv2/Df85USgv8+7V6iutNB4sF9tfr+sJ/8iLuzZt9E8ewlNQ+VRYo
         aKyjHRF6BE8oCSV+eMlzHsI6dUsrWM0XWjiggkBGIzBdbQpLdMV0AWB1q/GuZ61ttGYd
         SBn7NUlDUyZlLGLTSfxYz7KpUcVlKd1c/hl3Wz4f9mrc9XhBv5BN3C2LaP5yfpmvzKkr
         GfEg==
X-Gm-Message-State: AOAM5324I7Z/WZIIt7RP4clW4frKwY2zUIFpEXKsMCeqpZkatr/z9wK9
        arAIDxXczUfLOLz5RX8Jz9f166yZMkW3yHt4X/cbZw==
X-Google-Smtp-Source: ABdhPJxSE/9qJW6cbb09hiyNxkQahE1vJjEO/fpM8CB8o2QBnn4JihOgnaXRUNi34+LFXEsquV9bevjvG5dJa7BviQg=
X-Received: by 2002:a05:6102:5f2:: with SMTP id w18mr57128036vsf.6.1637065139442;
 Tue, 16 Nov 2021 04:18:59 -0800 (PST)
MIME-Version: 1.0
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
 <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com> <20211115214641.lxo5zhttrqq6mx2z@nitro.local>
In-Reply-To: <20211115214641.lxo5zhttrqq6mx2z@nitro.local>
From:   Han-Wen Nienhuys <hanwen@google.com>
Date:   Tue, 16 Nov 2021 13:18:48 +0100
Message-ID: <CAFQ2z_M_PbuL8BzwDeLxgU8=i5ei6Y4UDoLFoP_hcum+SESRBg@mail.gmail.com>
Subject: Re: Gmail (was: Re: lore+lei: part 2, now with IMAP)
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Nov 15, 2021 at 11:59 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
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
> Well, I'm sure they wouldn't mind if you paid them money for a "Titan Sec=
urity
> key", but it's really just a rebranded Chinese-made U2F token and, as suc=
h,
> not any different from any other U2F security key. You can get one from

Most electronics are made in China, but the Titan is set apart because
it was designed by Google, and was certified for FIPS 140-2,

https://csrc.nist.gov/CSRC/media/projects/cryptographic-module-validation-p=
rogram/documents/security-policies/140sp3361.pdf

If assurances about secure hardware implementations aren't important
to you, you can use any U2F device. If you have USB ports to spare, I
can recommend the Yubikey Nano, which you can just leave in a USB port
permanently. I also have a HyperFIDO Titanium Pro (from HyperSECU) on
my keychain which is very sturdy.

--=20
Han-Wen Nienhuys - Google Munich
I work 80%. Don't expect answers from me on Fridays.
--
Google Germany GmbH, Erika-Mann-Strasse 33, 80636 Munich
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado

Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E7CC433EF
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 08:26:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A8EA61B4C
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 08:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhKPI30 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 16 Nov 2021 03:29:26 -0500
Received: from mail-ua1-f43.google.com ([209.85.222.43]:42951 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231924AbhKPI30 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 16 Nov 2021 03:29:26 -0500
Received: by mail-ua1-f43.google.com with SMTP id t13so40672616uad.9
        for <workflows@vger.kernel.org>; Tue, 16 Nov 2021 00:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gBffbXZb/FPbJmIV32EycjWW9IN3Gh/arfsK8cbwB2E=;
        b=BFMlFJXvWt1POovMcd0bOmTpIYMyHXW6066gC2fDNRbCmpjKw4TTJgX1VhShfwQGyH
         PKeJrcJ2kq/cYbCyvBefLe35zlNUHTiZrJ8PyPJbIIxNfsKvGkNSrwdgxuaKRuI0uqd+
         JseGrYeENg5g1HMA57NeOMYt9KW2Tprwv2qdhVc/kbidoFbFFDCXbhOzLVCfsfLFZBif
         ZOvFzJPUkDu3alSiADLdjP+2+yQVBkkKsgzykKPxNPkKLVVsMqVnfnVwRPbkz437cCgm
         3eT1WZ2ppWYOxhMagUjtTaxq9kVokQuwsVKvqb7ZGi/siW3lH9AJk/NPRSvg2WTQRoRZ
         iq0Q==
X-Gm-Message-State: AOAM531TOH74d7QZH8DU6+jpYiKSf9CsCO3zOzGSqpp5x1QViQVNiibm
        eJOgVghCKWhrqb7x+kmuSvpWtBFXYCD/1w==
X-Google-Smtp-Source: ABdhPJx3JPYOHmOK5jPY6Ezd2W0CNJE5/boKXllkzBRvXz5stGxadX0zTNO9I4pC/F3ugOxRvd/m2w==
X-Received: by 2002:a67:ef4d:: with SMTP id k13mr13057234vsr.4.1637051189357;
        Tue, 16 Nov 2021 00:26:29 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id o7sm4290616vkl.41.2021.11.16.00.26.28
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 00:26:29 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id f7so10731026vkf.10
        for <workflows@vger.kernel.org>; Tue, 16 Nov 2021 00:26:28 -0800 (PST)
X-Received: by 2002:a05:6122:20ab:: with SMTP id i43mr70262710vkd.19.1637051188722;
 Tue, 16 Nov 2021 00:26:28 -0800 (PST)
MIME-Version: 1.0
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
 <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com>
 <20211115214641.lxo5zhttrqq6mx2z@nitro.local> <CAMuHMdUjfGJcZt1J7+XUHdCBhK2Wvm=KkKEOrG3ieFsPqTcgng@mail.gmail.com>
 <CFR1QJQ34CD5.15GF612X2CADO@taiga>
In-Reply-To: <CFR1QJQ34CD5.15GF612X2CADO@taiga>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Nov 2021 09:26:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV0OHg5AkcQ0Kwh-8SpOHxNYmSu2StrqJ3r7ubDNuNxgA@mail.gmail.com>
Message-ID: <CAMuHMdV0OHg5AkcQ0Kwh-8SpOHxNYmSu2StrqJ3r7ubDNuNxgA@mail.gmail.com>
Subject: Re: Gmail (was: Re: lore+lei: part 2, now with IMAP)
To:     Drew DeVault <sir@cmpwn.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Drew,

On Tue, Nov 16, 2021 at 9:04 AM Drew DeVault <sir@cmpwn.com> wrote:
> Apologies for being That Guy, but: but have you considered simply
> leaving gmail?

Thanks for your suggestion ;-)

> I recommend Migadu: https://www.migadu.com

Which is subject to the traffic limitations as mentioned by Konstantin?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

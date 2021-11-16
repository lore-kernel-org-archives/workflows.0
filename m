Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920F7C433FE
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 13:35:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7651461B49
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 13:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234993AbhKPNir (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 16 Nov 2021 08:38:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232201AbhKPNip (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 16 Nov 2021 08:38:45 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 986B1C061570
        for <workflows@vger.kernel.org>; Tue, 16 Nov 2021 05:35:48 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id h23so20387150ila.4
        for <workflows@vger.kernel.org>; Tue, 16 Nov 2021 05:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yLBHP93Tsj/dcc2S52vRZMTLe78Ax3d0+b+quSPaN3o=;
        b=BsL624knR1uDbXniZ6GdPrlqGsDmLf6BrQ62fsKx9nuEH2suVrPs9ly9MTK4RkRQNA
         SyezRbzqRriVOGnFC/L+Hu2KPxq+v1iYneFcimDVFc6HT0XKBrEOkb63rzHwaVR05egA
         jVMiPZ7cOzAHRMH/FGorl0jLIKkSFvX/WYPXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yLBHP93Tsj/dcc2S52vRZMTLe78Ax3d0+b+quSPaN3o=;
        b=1bjYo0j93X6DaALlX3WjwOUJ4BwbWhERYcDDm4sIzcUuh03Nsb7jYtisKPm+KfzAXT
         1lp2PuF1smCFlo75J+k9ZTsZ/Q4szQMR1XdS6utSzE0Z+iLi/PiQIqyILPWvhuBD9j9W
         wxVlD6ANIGsMFF02ZFIN+kmWGRpukLgudUr8nw5NdT7hoTfV16thqKFbGuryhHo1YKqZ
         hYwDL3HLBc9OimEjtRwluRcs4OKSfgOkXh96DnLWJ7qjcsU3x41TruYPzRafIl3t+/k6
         WDMsccpuVGok7C80EYsouCv+2nLzqRs1IESNOTqdDoqrXWSSdh3UyeIl2siXaaQuvYO0
         lubQ==
X-Gm-Message-State: AOAM532TC9coB1O4pMtcZLy8DUOfLP0JszRPCmd0RU4LTbrC1Gtm897x
        SQjDX/6xvbUcbngi3B4+ubyzOF0FNiHS1Q==
X-Google-Smtp-Source: ABdhPJw5/1F7iqGJ/TcB9hfOKs+ycpXpMGsiqdpvIqHl7COPzse4AENLu9o9WMFtu5G9bZP+wbyOKA==
X-Received: by 2002:a05:6e02:194e:: with SMTP id x14mr4622298ilu.245.1637069747525;
        Tue, 16 Nov 2021 05:35:47 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id a18sm9422190ioe.13.2021.11.16.05.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 05:35:47 -0800 (PST)
Date:   Tue, 16 Nov 2021 08:35:45 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     workflows@vger.kernel.org
Subject: Re: Gmail (was: Re: lore+lei: part 2, now with IMAP)
Message-ID: <20211116133545.frkailn7cto6z6lo@meerkat.local>
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
 <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com>
 <20211115214641.lxo5zhttrqq6mx2z@nitro.local>
 <CAMuHMdUjfGJcZt1J7+XUHdCBhK2Wvm=KkKEOrG3ieFsPqTcgng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUjfGJcZt1J7+XUHdCBhK2Wvm=KkKEOrG3ieFsPqTcgng@mail.gmail.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Nov 16, 2021 at 09:01:35AM +0100, Geert Uytterhoeven wrote:
> > Well, I'm sure they wouldn't mind if you paid them money for a "Titan Security
> > key", but it's really just a rebranded Chinese-made U2F token and, as such,
> > not any different from any other U2F security key. You can get one from
> > Nitrokey (nitrokey.com) or SoloKeys (solokeys.com). I *do* recommend using a
> > hardware token for your Google account, seeing as it's increasingly tied to so
> > much of our online identity.
> 
> Thanks for the explanation.
> Given it uses U2F, that means I cannot use the Nitrokey Start for that?

No, the Start doesn't support u2f. Their Nitrokey 3 should support all
operation modes that kernel devs would want (PGP, Fido2), but they have been
hit by the same chips shortage as everyone else, so the launch has been
delayed multiple times. I should get mine soon, hopefully, so I'll be able to
review it.

If you just want a U2F token for your Google account, then you can get any
common Fido2 device, including the Titan key. If you only use it for Google
and a handful of other sites supporting u2f, then you only need it extremely
occasionally and it can just hang on your keychain and look pretty the rest of
the time.

-K

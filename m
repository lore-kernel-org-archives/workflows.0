Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0B5C433F5
	for <workflows@archiver.kernel.org>; Mon, 15 Nov 2021 22:58:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8F3C6321B
	for <workflows@archiver.kernel.org>; Mon, 15 Nov 2021 22:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349647AbhKOXBD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 15 Nov 2021 18:01:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350884AbhKOWdv (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 15 Nov 2021 17:33:51 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1FD7C06120F
        for <workflows@vger.kernel.org>; Mon, 15 Nov 2021 13:46:43 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id x9so18166351ilu.6
        for <workflows@vger.kernel.org>; Mon, 15 Nov 2021 13:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lqAQ/iHOUdfQ2XqJgfrdI+h+pQ+JcNqo1lByMH5a4v0=;
        b=VsNem1S1hUm0kSCp5esZakTFOweRWfJEmZGKZ4GYGRyRFd3ZDXEROudNoFzl/c3h63
         Rf2zjhtE2XYkTv8f3Dp7R8Em0fXyZxu7Pom+E17oBTJriey528IclKYPpj4Y93FXPUvI
         Q0Q+ij9P0RQllBIfoBfcKiydgBuu42OvHm9mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lqAQ/iHOUdfQ2XqJgfrdI+h+pQ+JcNqo1lByMH5a4v0=;
        b=NstbfLY9H12pDwDzHTn2rnIXgHvlQxndb6CJakgP9B4LybVw67qHHO1P0s+XQzlb1r
         oU9HbqX0a+TCuTyLjz8k89la0muT0KfylBVTB0NKqVTL9tkTv6H0+ba13r0/mzGL3o9M
         gTzKlvMuNyntFFD1+P/2D3dp99TnRIFOWVCdGBDg2yegO5fsNUtvylbs0FEACqsONd6D
         Lvwcy8da47rVcami5Tt7WII1dSGJm1Xzc+fnDguySrV3usRYJ48sJ4VmVmV+5wMQeBia
         wgjOhDLzoyNzPxLP8BQ8AOtDhh6FCz7he56VUiKFE1hUrgjZXb1vQtmSnGCzlcHtrVhM
         TobQ==
X-Gm-Message-State: AOAM530rdRjUzB+c2S25f34aCr53PScJWXvdJSaHcCTiuUNTBHArCJQx
        QCwq0gk4aqTgcw5axEvgunlLLeVKcgavaQ==
X-Google-Smtp-Source: ABdhPJw9b9Qn09ser+7yEbjBVq1eyttxocSvFhbRCBrEo6wW3JDnPLFCnPZRgPdqyXH6MiC0WSzq3A==
X-Received: by 2002:a05:6e02:1c8f:: with SMTP id w15mr1260986ill.147.1637012803181;
        Mon, 15 Nov 2021 13:46:43 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id o10sm9555166ilc.56.2021.11.15.13.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 13:46:42 -0800 (PST)
Date:   Mon, 15 Nov 2021 16:46:41 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     workflows@vger.kernel.org
Subject: Re: Gmail (was: Re: lore+lei: part 2, now with IMAP)
Message-ID: <20211115214641.lxo5zhttrqq6mx2z@nitro.local>
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
 <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Nov 15, 2021 at 07:34:00PM +0100, Geert Uytterhoeven wrote:
> On a related subject, I am using Gmail for email (e.g. patch review),
> but not for actual patch submission (git send-email through my ISP's
> SMTP server). I do have app passwords set up for git send-email on
> my laptop (if I ever need to send patches while on the road, barely
> used so far) and for backing up email using getmail.
> 
> Recently I received an email from Google that my account may be "at
> greater risk of targeted attack", and that they recommend enrolling
> into Google's strongest account security offering, the Advanced
> Protection Program.  Apparently this makes use of a hardware token,
> the Titan Security Key. 

Well, I'm sure they wouldn't mind if you paid them money for a "Titan Security
key", but it's really just a rebranded Chinese-made U2F token and, as such,
not any different from any other U2F security key. You can get one from
Nitrokey (nitrokey.com) or SoloKeys (solokeys.com). I *do* recommend using a
hardware token for your Google account, seeing as it's increasingly tied to so
much of our online identity.

> I have no idea what kind of criteria are
> used to reach out to people (might be people involved with important
> FLOSS projects, who knows? ;-), but the other family members haven't
> received this.

It's anyone's guess, but it's probably based on analyzing various account
dumps a-la haveibeenpwned.com or Mozilla's Firefox Monitor. It doesn't
necessarily mean that you have anything in particular to worry about.

Best regards,
-K

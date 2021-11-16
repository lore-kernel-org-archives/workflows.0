Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6687C433F5
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 13:49:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 838A761B3A
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 13:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236798AbhKPNwS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 16 Nov 2021 08:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236836AbhKPNwR (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 16 Nov 2021 08:52:17 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A42C061746
        for <workflows@vger.kernel.org>; Tue, 16 Nov 2021 05:49:20 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id y16so26106599ioc.8
        for <workflows@vger.kernel.org>; Tue, 16 Nov 2021 05:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F8cyy9hPyDzmvEhVtQG0qOU8sVPg2zhO5tgJCKfmVTc=;
        b=Dw425L3W8hThDILoTjHm1Ql5C2LGVEszLGIql6bBFX6FQNOJ+JJFm1qK5R72F6b7dZ
         mz8aWDJnRH7eqOJi+MvuRWnGzOifwdcV8RqRvY2M0yLEP3SrrBi31Zoa1OD+4MTHRrl2
         xVF/FNu3zi1lYA+r2jTQGvTOnwhoDTbGD+GT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F8cyy9hPyDzmvEhVtQG0qOU8sVPg2zhO5tgJCKfmVTc=;
        b=o4k/MIZ5536tg0jjupMRZFFQgUNK4iDKeu0uL1WeWJulaORrN0xIv/gwGWdwD1facW
         VtbGNoa9or5xR+euwraEXlwyS66HqMCSMNW0EOZv+mE/2uBITq66i9bSOhZJCCvQPppE
         78C7LuSpDNsAtSO4TXLPfArlZQLj5SVZuXOaRHbDhN9vpnaNNeslaUG//bO0CkgStnk9
         rIUJuMK2tctdNR0yVa6T9o6as4Z4gAELD4DyQChF16srENiZ+ca1kQu5xqP3LJ+H7EBU
         UlMg3gTgCM4J00N0orx9eJZRhrSxuROoZ7E36ATYcu0xr5FD6MHVlIdGnckheh1J4B/n
         u3Pw==
X-Gm-Message-State: AOAM533vW8CVZeHhlLu8tT+q2oPYNNu1fHGjECY2PwnThj5rXAUYENBi
        twL+PQ1ONBM4KB9STVFj9sF4oA==
X-Google-Smtp-Source: ABdhPJyhWKLT4OGPXxfcIHnOT0puqOURJD4RYhaCZCema1GZTBx2+WYMF4C4biQyShce42AdgM5FTA==
X-Received: by 2002:a05:6602:2dd5:: with SMTP id l21mr4984332iow.170.1637070559901;
        Tue, 16 Nov 2021 05:49:19 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id k8sm10548977ils.79.2021.11.16.05.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 05:49:18 -0800 (PST)
Date:   Tue, 16 Nov 2021 08:49:17 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        workflows@vger.kernel.org
Subject: Re: Gmail (was: Re: lore+lei: part 2, now with IMAP)
Message-ID: <20211116134917.cqpca6auuzt7f5sw@meerkat.local>
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
 <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com>
 <20211115214641.lxo5zhttrqq6mx2z@nitro.local>
 <CAMuHMdUjfGJcZt1J7+XUHdCBhK2Wvm=KkKEOrG3ieFsPqTcgng@mail.gmail.com>
 <CFR1QJQ34CD5.15GF612X2CADO@taiga>
 <CAMuHMdV0OHg5AkcQ0Kwh-8SpOHxNYmSu2StrqJ3r7ubDNuNxgA@mail.gmail.com>
 <CFR29P1BWFOA.2Q2A2RE31JGEW@taiga>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CFR29P1BWFOA.2Q2A2RE31JGEW@taiga>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Nov 16, 2021 at 09:29:03AM +0100, Drew DeVault wrote:
> > > I recommend Migadu: https://www.migadu.com
> >
> > Which is subject to the traffic limitations as mentioned by Konstantin?
> 
> I might have missed Konstantin's message, but yes, Migadu has traffic
> limits. I use the standard plan, which supports 500 outgoing and 3000
> incoming emails per day. This might not be enough for you, though, and
> the "maxi" plan is pretty pricey.
> 
> https://www.migadu.com/pricing/

We do have the maxi plan for linux.dev, and we *have* hit limits. The Migadu
folks have been extremely accommodating for us, so it's not been a huge deal
thus far, but I'm not sure if the relaxed restrictions they've put in place
are just for the linux.dev domain or now apply globally. For example, sending
large patch series (20+) used to trip up Migadu's outgoing rate limit for too
much mail sent at once. We've not hit that error for a while, so I assume
they've relaxed that restriction either just for linux.dev, or perhaps
globally.

It's important to keep in mind that the overall outgoing/incoming limits are
per account, not per mailbox. Not a huge deal for personal use, but quickly
adds up for setups like we have, which is why we ask folks not to subscribe to
busy lists (see #4 in the list of our requirements here:
https://www.kernel.org/doc/projects/korg/linuxdev.html#rules-and-restrictions)

Overall, Migadu is a good recommendation for individual developer accounts,
but may be too restricting for maintainers that do end up sending huge
amounts of mail. Gmail or Fastmail could be better options for those folks.

-K

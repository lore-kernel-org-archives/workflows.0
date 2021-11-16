Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EA0C433F5
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 08:29:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8870D61A53
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 08:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbhKPIcF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 16 Nov 2021 03:32:05 -0500
Received: from out0.migadu.com ([94.23.1.103]:12410 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231925AbhKPIcD (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 16 Nov 2021 03:32:03 -0500
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmpwn.com; s=key1;
        t=1637051343;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DsJcSlUvHNGUhPLFuymMkssOBhMuEHXK3hosJ0aWCrk=;
        b=NALbENixyoWXqjH0cW4ErrXaqGNUr3bhyvApFa7UieXWF+n4goCXEGDkbq1C3nUKzmL0Zc
        qPH1UrVLSwB81OWwUH2em1ChzW+wvcbWm8MgQfVPK1mP8UnWkN9soxLGZ1xyd5Ux6Ti+AW
        EfkEd9MUz/jB562Hk44B7YNh35PAUHarevurf60rUlaMp5vb8MnaLHFhBWrJNJ0Y9HK7u0
        4YgUCxq3mYyCqnz6Zt+YxJpOLlBV7Lg03vpS+r7lX6PWDemZMSqvn6zO7gaiQKzR+eAqBt
        8XYpYFfJMfSaORPa/CusbVev6rUuBhbnQSytRoQy0OPkocN5GK07tOPim71J8w==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 16 Nov 2021 09:29:03 +0100
Message-Id: <CFR29P1BWFOA.2Q2A2RE31JGEW@taiga>
Subject: Re: Gmail (was: Re: lore+lei: part 2, now with IMAP)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc:     "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>,
        <workflows@vger.kernel.org>
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
 <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com>
 <20211115214641.lxo5zhttrqq6mx2z@nitro.local>
 <CAMuHMdUjfGJcZt1J7+XUHdCBhK2Wvm=KkKEOrG3ieFsPqTcgng@mail.gmail.com>
 <CFR1QJQ34CD5.15GF612X2CADO@taiga>
 <CAMuHMdV0OHg5AkcQ0Kwh-8SpOHxNYmSu2StrqJ3r7ubDNuNxgA@mail.gmail.com>
In-Reply-To: <CAMuHMdV0OHg5AkcQ0Kwh-8SpOHxNYmSu2StrqJ3r7ubDNuNxgA@mail.gmail.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue Nov 16, 2021 at 9:26 AM CET, Geert Uytterhoeven wrote:
> > I recommend Migadu: https://www.migadu.com
>
> Which is subject to the traffic limitations as mentioned by Konstantin?

I might have missed Konstantin's message, but yes, Migadu has traffic
limits. I use the standard plan, which supports 500 outgoing and 3000
incoming emails per day. This might not be enough for you, though, and
the "maxi" plan is pretty pricey.

https://www.migadu.com/pricing/

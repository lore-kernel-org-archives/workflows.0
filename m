Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E6AC433EF
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 13:52:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F28361B4D
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 13:52:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbhKPNzE (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 16 Nov 2021 08:55:04 -0500
Received: from out0.migadu.com ([94.23.1.103]:36538 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231753AbhKPNzB (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 16 Nov 2021 08:55:01 -0500
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmpwn.com; s=key1;
        t=1637070722;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q4RmHw7GP/4spYdJgPJBzZyvmCRjNlAt5p44H3RiVdM=;
        b=XHprUG0Ltmy7fah2ZDr2rVcMPeVJduq/zizKkkHdlgPVv41GuSajFnOHE9xlgTYm+jjkHi
        I+EbjCbarYX/saevsZyslf1JDjpR/ub7HnDzZklk4rqgrJp/79YychjhOYMQRCB9v4YlZE
        JZUfaGKkEldg+W5UBu3UeLoYYDorWIXja3RrgE96f29g58lizn1JiL3kR5kPw9MS9PsMMr
        OWTO6+DX+YDcjfr5Rjsfy0TqmrYDLwlxcS5bC/59mdAez8bY+MGQY/bgn3XzlTePT/xHOc
        f1KGT9mCvMde1Oaz7xvnVdtjmhU+lEqRhOga0zrtFBZnzKexaK2RDBsQ9GzzpQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 16 Nov 2021 14:51:59 +0100
Message-Id: <CFR94YBY5YOV.3HUOHZ34CUV2Q@taiga>
Cc:     "Geert Uytterhoeven" <geert@linux-m68k.org>,
        <workflows@vger.kernel.org>
Subject: Re: Gmail (was: Re: lore+lei: part 2, now with IMAP)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
 <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com>
 <20211115214641.lxo5zhttrqq6mx2z@nitro.local>
 <CAMuHMdUjfGJcZt1J7+XUHdCBhK2Wvm=KkKEOrG3ieFsPqTcgng@mail.gmail.com>
 <CFR1QJQ34CD5.15GF612X2CADO@taiga>
 <CAMuHMdV0OHg5AkcQ0Kwh-8SpOHxNYmSu2StrqJ3r7ubDNuNxgA@mail.gmail.com>
 <CFR29P1BWFOA.2Q2A2RE31JGEW@taiga>
 <20211116134917.cqpca6auuzt7f5sw@meerkat.local>
In-Reply-To: <20211116134917.cqpca6auuzt7f5sw@meerkat.local>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue Nov 16, 2021 at 2:49 PM CET, Konstantin Ryabitsev wrote:
> We do have the maxi plan for linux.dev, and we *have* hit limits. The
> Migadu folks have been extremely accommodating for us, so it's not
> been a huge deal thus far, but I'm not sure if the relaxed
> restrictions they've put in place are just for the linux.dev domain or
> now apply globally. For example, sending large patch series (20+) used
> to trip up Migadu's outgoing rate limit for too much mail sent at
> once. We've not hit that error for a while, so I assume they've
> relaxed that restriction either just for linux.dev, or perhaps
> globally.
>
> It's important to keep in mind that the overall outgoing/incoming
> limits are per account, not per mailbox. Not a huge deal for personal
> use, but quickly adds up for setups like we have, which is why we ask
> folks not to subscribe to busy lists (see #4 in the list of our
> requirements here:
> https://www.kernel.org/doc/projects/korg/linuxdev.html#rules-and-restrict=
ions)
>
> Overall, Migadu is a good recommendation for individual developer
> accounts, but may be too restricting for maintainers that do end up
> sending huge amounts of mail. Gmail or Fastmail could be better
> options for those folks.

I'm surprised to learn that linux.dev is using Migadu rather than its
own infrastructure. I would only recommend it for personal use.

I will say that I have also occasionally hit Migadu's limits, but they
have been accomodating in loosening them for legitimate use when asked.

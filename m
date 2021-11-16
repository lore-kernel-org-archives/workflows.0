Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10142C433EF
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 14:04:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E728460F9C
	for <workflows@archiver.kernel.org>; Tue, 16 Nov 2021 14:04:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237083AbhKPOHj (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 16 Nov 2021 09:07:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237088AbhKPOH0 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 16 Nov 2021 09:07:26 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD60C061766
        for <workflows@vger.kernel.org>; Tue, 16 Nov 2021 06:04:29 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id w15so20489728ill.2
        for <workflows@vger.kernel.org>; Tue, 16 Nov 2021 06:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kcG4KxOIVA5iK2+58QccdgitbHmzYhx1vi9K8aktiMQ=;
        b=ZUJHO3jLiA6D5JN9joLKFIN1yfHiYmd/xPmndvooRZRTKhhPzZ6qOa0KbVD+gBltQK
         zpzOd0UG648ebJ9KnUVjDAt11vLGIpH8bbNxNxEBhXRAh4zvAu0rAEUqX4yeqoYmhpDa
         TXXHw4u87oHv2FkVj/3HWa+6q86KJQz1zSRQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kcG4KxOIVA5iK2+58QccdgitbHmzYhx1vi9K8aktiMQ=;
        b=Pjyjt/tjRu1dIaj3/16XdsnKLDyOyOpcupgf+z5AlC0bQFZPVhOg4YtFu+k8N3keLP
         b374Xqzc671le1P+l60gBVzAlXrbV5qxUHeP+sxE4+Mv0uspaqT8OWU5wcFoqqqPSMYJ
         /VTeeCWzz6rlJq+edUqJuD7lUqG+gDtzK7POYSgE+gaG4ZE8M5h+6+FosV+t0r7PSBqh
         SrPn+m9aDYolXk98y9vYm3wNCU3YnWb5DN2wBxUUCCbeGPo5qZ2u4dF2M0tc/oecOMPw
         2sCeJ44l3iyfosv2ZuEusHdMRcZv+XcPGC2VxpDOLIfU5p/LAcBhKS7iShhaIHO23kRG
         DSfQ==
X-Gm-Message-State: AOAM532dMDpN2DoY5Xoz6mhxlhTcs661oTauBUK2kBsdxUJnLkzcQnqm
        zo45V+jaKeeHvFpvSsb/qsAIINcZiUaIDg==
X-Google-Smtp-Source: ABdhPJwAodlhSi2miRRPTT7CEtYiBzLLH61ghYz/VVG7mTklOgyBAdUcSBjYDCDKEFYShNr157kN7g==
X-Received: by 2002:a05:6e02:1561:: with SMTP id k1mr4738316ilu.135.1637071468545;
        Tue, 16 Nov 2021 06:04:28 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id r7sm12978955ilb.7.2021.11.16.06.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 06:04:28 -0800 (PST)
Date:   Tue, 16 Nov 2021 09:04:26 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        workflows@vger.kernel.org
Subject: Re: Gmail (was: Re: lore+lei: part 2, now with IMAP)
Message-ID: <20211116140426.7yghiglow66sd7y3@meerkat.local>
References: <lorelei.part2.202111121411.sznnvkvcywfbdghl@meerkat.local>
 <CAMuHMdXCbjx9CdkjVnp0cYhrjZCyGWYYraai=xSXXNbYjO2K1g@mail.gmail.com>
 <20211115214641.lxo5zhttrqq6mx2z@nitro.local>
 <CAMuHMdUjfGJcZt1J7+XUHdCBhK2Wvm=KkKEOrG3ieFsPqTcgng@mail.gmail.com>
 <CFR1QJQ34CD5.15GF612X2CADO@taiga>
 <CAMuHMdV0OHg5AkcQ0Kwh-8SpOHxNYmSu2StrqJ3r7ubDNuNxgA@mail.gmail.com>
 <CFR29P1BWFOA.2Q2A2RE31JGEW@taiga>
 <20211116134917.cqpca6auuzt7f5sw@meerkat.local>
 <CFR94YBY5YOV.3HUOHZ34CUV2Q@taiga>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CFR94YBY5YOV.3HUOHZ34CUV2Q@taiga>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Nov 16, 2021 at 02:51:59PM +0100, Drew DeVault wrote:
> > Overall, Migadu is a good recommendation for individual developer
> > accounts, but may be too restricting for maintainers that do end up
> > sending huge amounts of mail. Gmail or Fastmail could be better
> > options for those folks.
> 
> I'm surprised to learn that linux.dev is using Migadu rather than its
> own infrastructure. I would only recommend it for personal use.

1. We couldn't easily gauge how many people would be interested in the
   service, so the goal was to avoid setting up infrastructure if only a small
   subset of users would be interested in using it. And that's largely proven
   correct, as only about 20 people requested accounts on linux.dev, and only
   about 5-7 people use them regularly to send and receive mail.
2. Dealing with spammers is a huge effort sink, so if someone already has a
   good setup for recognizing and catching spammers, then we might as well
   delegate this to them.
3. Migadu offers open-source project discounts, so it's actually dramatically
   cheaper for us to use them than to run our own infra in terms of admin
   time. :)

> I will say that I have also occasionally hit Migadu's limits, but they
> have been accomodating in loosening them for legitimate use when asked.

Yes, I have no complaints about Migadu. They are great and I heartily
recommend it to others.

-K

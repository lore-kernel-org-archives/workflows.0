Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE850EB64DD
	for <workflows@archiver.kernel.org>; Fri, 28 Jul 2023 20:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbjG1UuO (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 28 Jul 2023 16:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjG1UuN (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 28 Jul 2023 16:50:13 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC5E422B
        for <workflows@vger.kernel.org>; Fri, 28 Jul 2023 13:50:12 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-47ec8c9d7a0so1024540e0c.3
        for <workflows@vger.kernel.org>; Fri, 28 Jul 2023 13:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690577411; x=1691182211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ysSfl5i6joVeguoUDlYgpDwoeX/MNO4AZC6tPC2qLPc=;
        b=J6wMHZyjgRPA7gOOAnp8A6h76r4qg40rYvTphUDsg5Yxk5C7kiTacMtfpl1pJTXniN
         Ej6DFcq22ZhPiHzuaCF2Q9kKjk3NhHMB5O4x5BFPGzCq9MtinXDtJ+ma7YRCqffXiyEB
         dVOhLG/djPSUU5ZCfBUqQ3L6IdQnibBO4dkGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690577411; x=1691182211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysSfl5i6joVeguoUDlYgpDwoeX/MNO4AZC6tPC2qLPc=;
        b=N+6vajxO/MBGX1su0VoCN3V5ivvb27CfnC8u5z6LTOKTKxjJJh5InEDVbhs58PacM2
         BBW2bcaRb66NlaF1lfVrw6HoCgRZuUJV/4uZK77Mu+jXA734OoFSfxEoMTngPhlSi7Cr
         YDd4RLttQm/cSsVYagwEP1F9mUI9+B/SSYm7nKXOEmjD0JwMs+GHCBLyJeMNNcvHuSQB
         Q/UW1kBGstDRo1zxJPel0e/ANkiNNtJUzdbP0L37OtGHQo1kv/Irhsk7khFh9vN9bog9
         bQHtKsxyrstiut/Ij9IG7WIz9hF2R7BIduqaAZBHDmZC4OdfAtCQh6KAh7AfhnmT5ze9
         DXEQ==
X-Gm-Message-State: ABy/qLZnVCRDb0gf2ofX7uJWNRH4cQE1YC4PcwvJKfFTiADPAaMRdRkc
        nwjoxs1laXghKcOO7tvYYRKLhA==
X-Google-Smtp-Source: APBJJlEq4ZSIG2aY8RwkENR4ErrwZWYBIpCoX9j9mf+WM2EzHhGjdzABHvdvmJYseO7Tqu2RkNwxMA==
X-Received: by 2002:a1f:5f12:0:b0:485:ac24:df1 with SMTP id t18-20020a1f5f12000000b00485ac240df1mr749000vkb.12.1690577411462;
        Fri, 28 Jul 2023 13:50:11 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-114.dsl.bell.ca. [142.113.79.114])
        by smtp.gmail.com with ESMTPSA id v6-20020a0c9c06000000b00623839cba8csm1545872qve.44.2023.07.28.13.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 13:50:10 -0700 (PDT)
Date:   Fri, 28 Jul 2023 16:50:09 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from using
 file paths
Message-ID: <20230728-driven-reliable-8a57d2@meerkat>
References: <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
 <20230726133648.54277d76@kernel.org>
 <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
 <20230726145721.52a20cb7@kernel.org>
 <20230726-june-mocha-ad6809@meerkat>
 <20230726171123.0d573f7c@kernel.org>
 <20230726-armless-ungodly-a3242f@meerkat>
 <1b96e465-0922-4c02-b770-4b1f27bebeb8@lunn.ch>
 <20230728-egotism-icing-3d0bd0@meerkat>
 <20230728133801.7d42dcf7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230728133801.7d42dcf7@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Jul 28, 2023 at 01:38:01PM -0700, Jakub Kicinski wrote:
> > It would require a bit more effort to adapt it so we properly handle bounces,
> > but effectively this does what you're asking about -- replies sent to a thread
> > will be sent out to all addresses we've associated with that thread (via
> > get_maintainer.pl). In a sense, this will create a miniature pseudo-mailing
> > list per each thread with its own set of subscribers.
> > 
> > I just need to make sure this doesn't fall over once we are hitting
> > LKML-levels of activity.
> 
> How does that square with the "subscribe by path / keyword" concept?
> If we can do deep magic of this sort can we also use it to SMTP to
> people what they wanted to subscribe to rather than expose it as
> POP/IMAP/NNTP?

Well, people can subscribe without needing to become an M: or R: entry in
MAINTAINERS. I guess that would be the main difference.

-K

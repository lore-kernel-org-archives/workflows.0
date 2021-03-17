Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F53C433E0
	for <workflows@archiver.kernel.org>; Wed, 17 Mar 2021 13:28:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F03B64F44
	for <workflows@archiver.kernel.org>; Wed, 17 Mar 2021 13:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbhCQN1l (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 17 Mar 2021 09:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230394AbhCQN10 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 17 Mar 2021 09:27:26 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FCC8C06174A
        for <workflows@vger.kernel.org>; Wed, 17 Mar 2021 06:27:26 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id x9so1328911qto.8
        for <workflows@vger.kernel.org>; Wed, 17 Mar 2021 06:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=v0uHm6kMg7bvBflXNZVg79OUO4KIIwPxTVSbDMWBivc=;
        b=FbqM3JzaqxQI8VUBgMgcGUTHMabft/QkUzzmiHdxdUVVKQ/Ab5YPaXehcfl4rRM7AU
         wizx4zJvSjj2bD0I8hgpUAGBWAgNEA8ftr2sz8d2bBxjudB3dqH6DhedsDBlOUNW1ZiJ
         9jcv1a8fW6DwNsQ1ghfe9CW++DjFKAdiypPus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=v0uHm6kMg7bvBflXNZVg79OUO4KIIwPxTVSbDMWBivc=;
        b=MIZN7FEihhcBx3NOVnf3xzHLQrWAARZtYQe4oXOo21wZO3eQlEt9SC3QIJEsTSWrUV
         I+dhZ7gvKey/FAiirWlHRxA1O/sFJ9Cg1fQeSSYm4WxRJbbt7R4QOTPdM3yFbV/j5HlX
         dVARxP2S9Fvvu7o1iz1s+ID9qsE6XTaZea4oOom+iB6az6r8FGl0iAmgOa5pbWDQ/3GU
         Cq5F0H/Q7R89eGrsajz+iAXEkRxVsvlRJ/ogUp8tXzfKSjuyS/YSvl59xZgjBPyk2HQx
         9WD2SIAcyvwYmzCjyVrzfa7pMGLptSw/sNkffF47gcNPEl/T1mVposGqdCL3Qlt0CcNv
         dRCQ==
X-Gm-Message-State: AOAM533SJ8ztrjXhtoKaHuQfNuDIiY7RFJ+xp7hBRXMb13FNEo0eiEpt
        l9XOKABbaoukCZ5raQl1cLbdk4zjtiREKmSSb2w=
X-Google-Smtp-Source: ABdhPJy3yVlCvOSr7SVC4d9WzFDYTPT1Z9LxHhh8vNv7mO21gGQhrveX3DunX63WCYHUjeWTGBKqtA==
X-Received: by 2002:ac8:4a18:: with SMTP id x24mr2509535qtq.33.1615987645211;
        Wed, 17 Mar 2021 06:27:25 -0700 (PDT)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id x36sm15770652qte.1.2021.03.17.06.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 06:27:24 -0700 (PDT)
Date:   Wed, 17 Mar 2021 09:27:23 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Eric Wong <e@80x24.org>
Cc:     workflows@vger.kernel.org, meta@public-inbox.org
Subject: Re: WIP: searching all of lore
Message-ID: <20210317132723.xx4klonordhsb6ve@chatter.i7.local>
Mail-Followup-To: Eric Wong <e@80x24.org>, workflows@vger.kernel.org,
        meta@public-inbox.org
References: <20201126194543.GA30337@dcvr>
 <20210317071116.GA8121@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210317071116.GA8121@dcvr>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Mar 17, 2021 at 01:11:16AM -0600, Eric Wong wrote:
> Eric Wong <e@80x24.org> wrote:
> > Requires Tor, for now:
> > 
> > http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/all/
> > http://lore.czquwvybam4bgbro.onion/all/
> 
> Also available without Tor:
> 
> 	https://yhbt.net/lore/all/ + https://80x24.org/lore/all/
>         (but no more reliable, since it's via ssh tunnels)

Looking good! I noticed that it doesn't "uniquify" the results. E.g. searching
for "lists.linux.dev" (just some uncommon wording I could think of) returns
multiple hits for the same message sent to multiple lists:

https://yhbt.net/lore/all/?q=lists.linux.dev

Is that intentional, or can this be tweaked to show a single result for the
same message-id?

-K

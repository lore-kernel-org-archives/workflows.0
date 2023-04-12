Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3E8C77B6F
	for <workflows@archiver.kernel.org>; Wed, 12 Apr 2023 14:07:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjDLOH2 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 12 Apr 2023 10:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbjDLOHZ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 12 Apr 2023 10:07:25 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2247D9E
        for <workflows@vger.kernel.org>; Wed, 12 Apr 2023 07:07:24 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-54f21cdfadbso170138307b3.7
        for <workflows@vger.kernel.org>; Wed, 12 Apr 2023 07:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681308443; x=1683900443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1sYxkROq82q/boyHt/eVSeQo3tvT+Mg4dBd4dGtx0j4=;
        b=VWDLBvponEwAUhE3RhIUHLIsX+mYfv41X54JsZmXuwMsbUpLDPsprmeMamFtHmdbmz
         Td88LzXDQorKPHuPhELN3MJ7Dpdl+edZYFauXLpDDKdQDtIba8L/nBkHhs4hKaPeUzFn
         F/Nzs9DyLZsyrVHYb4dezYnsqQ04LJ7UXdRo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681308443; x=1683900443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sYxkROq82q/boyHt/eVSeQo3tvT+Mg4dBd4dGtx0j4=;
        b=k5n1SjFWELEqCg9kvetfAwNyx092emrzcdKKILt5Z6LT38DNMV4xC6XAy0rI2ZVd7b
         2sB19RTsV4w8m5SEZW/u/iLLjvBpwo/qBYH2Mt60Ujzt8B9VIpbXk/2KIDiUJf3jH28k
         9ybLcYEVzaBuf6bTsjfvjl3pyv96DPwLEczQQ+2cTsDuCmfK/nnPj//4wPFnDqvw78k0
         gIJLGDOCP3ShJ+scQuP7iekaLURgpoXQRrOBMAX5dRb1VYhXby0HwidnBUue2Yz1125G
         6D6xmDGPq9yR9hvt9wqE8XAAThvH1jCEMzlOJKc1Iz4kfq4JjVrk5seCmQ+1/RMeVCk+
         gZ1g==
X-Gm-Message-State: AAQBX9dZx91NdCKvmupmZjZogKeZj2TWhLbJcwuPpcLqE7VGn6G8N1We
        6URshXFb02kzgLxy1yvy5M5URw==
X-Google-Smtp-Source: AKy350ZCKH9jN34tPhRn90jaxK8JgGB+RhiEn1nEenc43BnuIAU6jB13VU7S7JgrgNv8T7CS1mYcNA==
X-Received: by 2002:a0d:f684:0:b0:54f:b875:4976 with SMTP id g126-20020a0df684000000b0054fb8754976mr15436ywf.15.1681308443255;
        Wed, 12 Apr 2023 07:07:23 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id s128-20020a372c86000000b0074688c36facsm4703624qkh.56.2023.04.12.07.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 07:07:22 -0700 (PDT)
Date:   Wed, 12 Apr 2023 10:07:21 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Kalle Valo <kvalo@kernel.org>
Cc:     Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
        aros@gmx.com, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev, tools@linux.kernel.org
Subject: Re: Introducing bugbot
Message-ID: <20230412-appear-tiring-f5a896@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <1f0ebf13-ab0f-d512-6106-3ebf7cb372f1@leemhuis.info>
 <87fs958f2a.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fs958f2a.fsf@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Apr 12, 2023 at 03:23:25PM +0300, Kalle Valo wrote:
> > But here I decided to *not* use bugbot, as I know Kalle sometimes is
> > active in bugzilla -- and thus might hate it, if I re-categorize the bug.
> 
> Yeah, for me moving ath11k bugs away from Drivers/network-wireless
> component is not really helpful. And for ath11k I try to look at all
> reported bugs in bugzilla anyway, though just slowly.

Right, I did mean to say that the bot is only limited to Linux/Kernel during
the initial tryout stage. Once I'm more confident that it's not exploding and
mostly doing the right thing, I can enable it for other components.

> While at it, I have some things on my wishlist to make my use of
> bugzilla.kernel.org easier:
> 
> * A new state named UNCONFIRMED and have it as the default state for
>   reported bugs. This would help triaging bugs as some of the reports
>   are not valid. In other words only valid bugs would have NEW state.
>   IIRC the Mozilla project did this back in the day.

This is more hairy than it looks, but I'll try to figure out what happened to
the UNCONFIRMED state in our bugzilla.

> * Use P3 as the default priority for the new bugs. I try to keep ath11k
>   bugs in priority order but new reported bugs having P1 always messes
>   up the list always.

Okay, I set the default to P3, which is nicely in the middle.

-K

Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B82EC001DE
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 23:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbjGZXro (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 19:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjGZXrn (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 19:47:43 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A14FBF
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 16:47:42 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-63d058b9cafso2674156d6.2
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 16:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690415261; x=1691020061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b2NTLb/puU8U6C4ofXhlTQlXpZUglV4pD0JYAgBXbl0=;
        b=er1zrpYeIqGlzNrbH19Q6aMGuLmQQWTkL0L5MxIcF5ltPL3FTkYondsKru27rr5YST
         odC8GsnYuWW417RCXirGSvREgx3bAR4weKKRv66/tqjy3QVATAOE/xAT/QALb/fFibev
         xe2Gd6LOoDZ73xURnhSf+oV1bGTSauXHHfuMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690415261; x=1691020061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2NTLb/puU8U6C4ofXhlTQlXpZUglV4pD0JYAgBXbl0=;
        b=OePP8DsVv7Ytz8iyFwd2rAUBf/Zspwg3WDPmDSSL8arj9W2cVq4pV7b4MAA29rvlPj
         t6q02wtzEwnIh0e0Dwj/X6kD/3Kq51/tGy7o/21w1r6C4mIDg5aBq/rIrXcoGdpP4ob8
         U1/1iVg/yWY2RebK6XvA9f2GGbXxMjmEaL5AZDdYwxC51dMxvpfQVSw3dPJtFeUZI56B
         mtBSgGJZqXMbKVu0Hc86hUMjZP1jDttwJUC8Ops6reCavgspb7sHCj7bI0m0mBow0fgi
         Ts5fT0gA0RMqUWO78QnYDv8IqFvAqVroHknABLN0kGja3CaIgxJ5o5AfSEVkNZ2yzSOI
         eRsw==
X-Gm-Message-State: ABy/qLbZyKK0pz4PUkMf6W8U9WdIM9HkrneiZ5Hgb7aiZhcc/2WfewP/
        aC3b3kefgwAK4r/cutduWDRuRQ==
X-Google-Smtp-Source: APBJJlGCKembOaaHRK5Xt40R50gl2FC9xqA985Mdk/VdrxNGSAgyQc07IxqGLUBRm723Qx6jo99l6Q==
X-Received: by 2002:a05:6214:d46:b0:636:2e7c:4955 with SMTP id 6-20020a0562140d4600b006362e7c4955mr4994336qvr.20.1690415261717;
        Wed, 26 Jul 2023 16:47:41 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id v6-20020a0c9c06000000b00623839cba8csm11576qve.44.2023.07.26.16.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 16:47:40 -0700 (PDT)
Date:   Wed, 26 Jul 2023 19:47:31 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from using
 file paths
Message-ID: <20230726-june-mocha-ad6809@meerkat>
References: <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
 <20230726114817.1bd52d48@kernel.org>
 <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
 <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
 <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
 <20230726130318.099f96fc@kernel.org>
 <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
 <20230726133648.54277d76@kernel.org>
 <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
 <20230726145721.52a20cb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230726145721.52a20cb7@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jul 26, 2023 at 02:57:21PM -0700, Jakub Kicinski wrote:
> > The patchwork notification could be just a small note (the same way
> > the pull request notes are) that point to the submission, and say
> > "your name has been added to the Cc for this patch because it claims
> > to fix something you authored or acked".
> 
> Lots of those will be false positives, and also I do not want 
> to sign up to maintain a bot which actively bothers people.

I feel seen.

> And have every other subsystem replicate something of that nature.
> 
> Sidebar, but IMO we should work on lore to create a way to *subscribe*
> to patches based on paths without running any local agents. But if I
> can't explain how get_maintainers is misused I'm sure I'll have a lot
> of luck explaining that one :D

I just need to get off my ass and implement this. We should be able to offer
the following:

- subsystem maintainers come up with query language for what they want
  to monitor (basically, whatever the query box of lore.kernel.org takes)
- we maintain a bot that runs these queries and populates a public-inbox feed
- this feed is available via read-only pop/imap/nntp (pull subscription)
- it is also fed to a mailing list service (push subscription)

The goal is to turn the tables -- instead of patch submitters needing to
figure out where the patch needs to go (via get_maintainer or similar
scripts), they just send everything to lkml or patches@lists.linux.dev and let
the system figure out who needs to look at them.

That's for the part that I was already planning to do. In addition, coming
back to the topic of this thread, we could also look at individual patches
hitting the feed, pass them through any desired configuration of
get_maintainer.pl, and send them off any recipients not already cc'd by the
patch author. I believe this is what you want to have in place, right, Jakub?

-K

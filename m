Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E50C001DF
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 21:08:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjGZVIC (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 17:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjGZVHv (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 17:07:51 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E9519BF
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 14:07:49 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b701e1ca63so3138291fa.1
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 14:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690405667; x=1691010467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JM13H80q5tPRBtw1RJRrx00S2873BE47S6LyMBoeLrc=;
        b=KEzCk7K3VMZv1Q9p+eTxjPua8ZoW08eSA46go8tymGRj2oezeXzYiP/zGW3GR+TcJN
         3/jeakllZgu3CXMylcF2Y2uGmbv4w3IKd2Cysd1XW6t9uM3bhIYItMfxOTrjwyANPWn+
         0z4a+nqFzRdPlaVxnA48PKLxRSlQkRwHNU51o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690405667; x=1691010467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JM13H80q5tPRBtw1RJRrx00S2873BE47S6LyMBoeLrc=;
        b=L8L7Is4UmNScYSHqGO23sW29r0dZoXRnzh5DSwCa/96BcSmBnwVi9thVHOo08i0LbG
         K5YhmWsaCQ7203pareMm31we3T2XhKZyM1bdRGmd5a76sBJcH0DpkiPfjyGbzozL11S7
         Njg7HDXOPNVuHp1EtfB1ElGIlD7TSbcZQErhtKylPK/uTwxnQc9rpevgmcHoIV1+KO9K
         2NJp1fZnKLCDm+OFU8XIM9yH0bPKOqCjjTtcluyrJhgnGMWCaArC4rOocjqZjGSXqf6W
         1R0oQfC30WTB6QZMy80lnYtW0YWeWG+X3kZMZv7fCvdgLKeMljIs/pWFpUZm8/0U40PH
         UwQg==
X-Gm-Message-State: ABy/qLaG3K//peFwLW7OIsI5GJUZI1FbOPACyoD/y0nD4OM6XAVnLYXx
        SJhV4u2f37OLcZvIqXn85Z0seafUqbUp2hFV6w4nr3kC
X-Google-Smtp-Source: APBJJlH0TlgtJuzXt3GCA2eO5Q9gsSn5+XSt809+KFuAiNxTYVC3O8Tzd1Y4xvNJ5X9U9uDiLGzvrA==
X-Received: by 2002:a2e:720e:0:b0:2b9:53bd:47a7 with SMTP id n14-20020a2e720e000000b002b953bd47a7mr220968ljc.30.1690405667016;
        Wed, 26 Jul 2023 14:07:47 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id p22-20020a1709060dd600b00993a37aebc5sm10037672eji.50.2023.07.26.14.07.45
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 14:07:45 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-522462d8416so259848a12.1
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 14:07:45 -0700 (PDT)
X-Received: by 2002:a05:6402:1816:b0:522:3790:1303 with SMTP id
 g22-20020a056402181600b0052237901303mr235650edy.32.1690405665337; Wed, 26 Jul
 2023 14:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230726151515.1650519-1-kuba@kernel.org> <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
 <20230726092312.799503d6@kernel.org> <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
 <20230726112031.61bd0c62@kernel.org> <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
 <20230726114817.1bd52d48@kernel.org> <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
 <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
 <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
 <20230726130318.099f96fc@kernel.org> <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
 <20230726133648.54277d76@kernel.org>
In-Reply-To: <20230726133648.54277d76@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 26 Jul 2023 14:07:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
Message-ID: <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from using
 file paths
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 26 Jul 2023 at 13:36, Jakub Kicinski <kuba@kernel.org> wrote:
>
> Just so I fully understand what you're saying - what do you expect me
> to do? Send the developer a notifications saying "please repost" with
> this CC list? How is that preferable to making them do it right the
> first time?!

Not at all.

The whole point is that you already end up relying on scripting to
notice that some people should be cc'd, so just add them
automatically.

Why would you

 (a) waste your own time asking the original developer to re-do his submission

 (b) ask the original developer to do something that clearly long-time
developers don't do

 (c) waste *everybody's* time re-submitting a change that was detected
automatically and could just have been done automatically in the first
place?

just make patchwork add the cc's automatically to the patch - and send
out emails to the people it added.

Patchwork already sends out emails for other things. Guess how I know?
Because I get the patchwork-bot emails all the time for things I have
been cc'd on.  Including, very much, the netdevbpf ones.

And people who don't want to be notified can already register with
patchwork to not be notified. It's right there in that

   Deet-doot-dot, I am a bot.
   https://korg.docs.kernel.org/patchwork/pwbot.html

footer.

So I would literally suggest you just stop asking people to do things
that automation CAN DO BETTER.

The patchwork notification could be just a small note (the same way
the pull request notes are) that point to the submission, and say
"your name has been added to the Cc for this patch because it claims
to fix something you authored or acked".

See what I'm saying? Why are you wasting your time on this? Why are
you making new developers do pointless stuff that is better done by a
script, since you're just asking the developer to run a script in the
first place?

You are just wasting literally EVERYBODY'S time with your workflow
rules. For no actual advantage, since the whole - and only - point of
this all was that it was scriptable, and is in fact already being
scripted, which is how you even notice the issue in the first place.

You seem to be just overly attached to having people waste their time
on running a script that you run automatically *anyway*, and make that
some "required thing for inexperienced developers".

And it can't even be the right thing to do, when experienced
developers don't do it.

That, to me, seems completely crazy.

                   Linus

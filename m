Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20EAC0015E
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 22:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjGZWQD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 18:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjGZWQD (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 18:16:03 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48F6E270F
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 15:16:02 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fdd31bf179so487420e87.2
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 15:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690409760; x=1691014560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P/sqc18KIK7dshywkzhq0KOuh2Dzddlts3yGF32bqfQ=;
        b=dchqpLV7SRPQprn70CICb5MoiAOapA8YyqfY1jkvko2beqSDEfKw9OZBzldPdmlRZo
         1ypAoRkik5SI9cBKp8JkqX5C5fmiKcVZCaSjZw/5VSzKupD6dRL8aGafGoKJ59w2lnH7
         BFTMVvkYfRg5lW6uzaa6K9oedCu/piEuq88Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690409760; x=1691014560;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/sqc18KIK7dshywkzhq0KOuh2Dzddlts3yGF32bqfQ=;
        b=W5/HciN1Z9F0uYbANSDLR0nJf0/BQW7TAuHQ7uvGyfzf6SxLIJEJA/5ElOX8zNQPWL
         xOU1PctYouy7oX5D8ih1MrKyISwa7H0hAPqWP4WPxccqgu0+07PovOeIRs+pEWBqPLRC
         JZbf5nwmYAYaXgsuM+QUnmauhM1x8/G6aslps7uT32shFQkbPqrLe8pd6uWUmjbhwrv9
         0vRzBWCSUpJcDIxM72j35upUFE5kVajspVK4eoBUjainvoh5xyMZ9OD1yPzk6F5RmEzM
         2oMyYPQUBXIZUG9CPMcsWSs1Kd2irfhtDCmWOeM29XQlKjEXM2IDq6UHUGelZq3duWl6
         Mjsg==
X-Gm-Message-State: ABy/qLZlqv8DH0KpsFVad1PGpdJ9iokvs91ILNo9bmF4zkGf7xKC0Q+Z
        aqogisrNXKm4FNz3ozZlUfIZhO8WLkBQeH0PxW0XfSM/
X-Google-Smtp-Source: APBJJlHgompoBM+56AidEofYuzMqyA1AMoRyrDDY3LXL1iFqYVHCCBRh1t/QdE5YrDmqUFGJ6mpnfQ==
X-Received: by 2002:a05:6512:324e:b0:4fd:d9dd:7a1a with SMTP id c14-20020a056512324e00b004fdd9dd7a1amr264650lfr.31.1690409760312;
        Wed, 26 Jul 2023 15:16:00 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id u27-20020ac248bb000000b004fb7359ab83sm14092lfg.80.2023.07.26.15.15.58
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 15:15:58 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fdd14c1fbfso498857e87.1
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 15:15:58 -0700 (PDT)
X-Received: by 2002:ac2:5592:0:b0:4fb:772a:af17 with SMTP id
 v18-20020ac25592000000b004fb772aaf17mr288800lfg.37.1690409758357; Wed, 26 Jul
 2023 15:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230726151515.1650519-1-kuba@kernel.org> <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
 <20230726092312.799503d6@kernel.org> <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
 <20230726112031.61bd0c62@kernel.org> <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
 <20230726114817.1bd52d48@kernel.org> <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
 <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
 <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
 <20230726130318.099f96fc@kernel.org> <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
 <20230726133648.54277d76@kernel.org> <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
 <20230726145721.52a20cb7@kernel.org>
In-Reply-To: <20230726145721.52a20cb7@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 26 Jul 2023 15:15:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjrk1O+a74xKbKMNshZc9dKByWbyXvW+Wre=DQwPjTKGA@mail.gmail.com>
Message-ID: <CAHk-=wjrk1O+a74xKbKMNshZc9dKByWbyXvW+Wre=DQwPjTKGA@mail.gmail.com>
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

On Wed, 26 Jul 2023 at 14:57, Jakub Kicinski <kuba@kernel.org> wrote:
>
> Lots of those will be false positives, and also I do not want
> to sign up to maintain a bot which actively bothers people.

I don't really see the difference between creating a bot that
"actively bothers people" and asking _people_ to run a script and then
re-send the patch to actively bother the exact same people.

They'd get bothered either way.

At least with the bot, they can opt out of the automation.

> Sidebar, but IMO we should work on lore to create a way to *subscribe*
> to patches based on paths without running any local agents.

I already contacted Konstantin to see how hard it would be to change
patchwork-bot scripting, and he's trawling this thread.

Maybe he will just go "the code already does all the patch detection
and looks up pathnames in them anyway, and we already maintain a list
of people who do not want to be bothered, it would be easy to add the
'please bother me for these paths' script too".

             Linus

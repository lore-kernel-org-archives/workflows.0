Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFD0C001DC
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 20:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbjGZUNd (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 16:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjGZUNc (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 16:13:32 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73166BF
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 13:13:31 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bc0da5684so15911766b.0
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 13:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690402409; x=1691007209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9CJQI8Qdop0YIXvc46Q9cOG1BD1fZ1dUQROtQfx9W58=;
        b=HWeE6BYHQldG/g9aD2RlJWlrwEqBefZ0wRSion9GC2NbR8uOYIPDV0KCBPRjtLlt/F
         ouofWwC5054sE8u2erErqII+w/DCye6AiiGEle30Q8V7pn5Pk/rCPo8PjNEkEyd7W7aC
         VoBoBVApvYK8AfKl4/CVzylgrSnDNs83fMeqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690402409; x=1691007209;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CJQI8Qdop0YIXvc46Q9cOG1BD1fZ1dUQROtQfx9W58=;
        b=XHvDwNfC/b7pYvYxND8nmlD8sqkRI7ax7nzXDud8tD7Jszn6i2WW789WDYGg8QeNUh
         amCYdrQBE/yR4MUbwR0IIq3orqyb7GWRhq0hgNU8GwSMP85hKXJ6yp/jb4topJVxWrIA
         6nKv0HiWj0p5w9L4hXm6sPwuZh0+c8140S9XzgwHQvdmxYxaAyGV4g8/l5+VZlhYIYdu
         3F7bGe8+NucDKByhp89YLVXD1zVkWEVcbMHubvVopgoQuXQGuHw/H5Gy6L9RRASIhH/H
         8D9tdOshjz/HcwuzE0Wp+34avMgKy4wrALxH4Av2uQlTdF4JcpmBN73x3a0V07CFxftr
         q9ZQ==
X-Gm-Message-State: ABy/qLZPIDX9d/4CJKI0jO5IHWbT30GTl/bZ9DH6fuIhOI7PuOLtgXzI
        CJW5mZOpakiusrYtf/cC/fOo5hmnhj7JwTvVsjrk29g5
X-Google-Smtp-Source: APBJJlGTLZG8aDm6C6n94a9GDGSmdFUCeiHXdXQkeF+abiEW9O3s+gvuZZ35cdZVdGsnUOp1UWRpcg==
X-Received: by 2002:a17:907:1dd8:b0:997:e8b8:8d6 with SMTP id og24-20020a1709071dd800b00997e8b808d6mr174776ejc.28.1690402409655;
        Wed, 26 Jul 2023 13:13:29 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id jp7-20020a170906f74700b009937dbabbd5sm9958045ejb.220.2023.07.26.13.13.28
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 13:13:29 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31768ce2e81so198299f8f.1
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 13:13:28 -0700 (PDT)
X-Received: by 2002:a05:6000:1289:b0:313:ee2e:dae5 with SMTP id
 f9-20020a056000128900b00313ee2edae5mr156669wrx.21.1690402408465; Wed, 26 Jul
 2023 13:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230726151515.1650519-1-kuba@kernel.org> <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
 <20230726092312.799503d6@kernel.org> <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
 <20230726112031.61bd0c62@kernel.org> <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
 <20230726114817.1bd52d48@kernel.org> <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
 <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
 <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com> <20230726130318.099f96fc@kernel.org>
In-Reply-To: <20230726130318.099f96fc@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 26 Jul 2023 13:13:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
Message-ID: <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
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

On Wed, 26 Jul 2023 at 13:03, Jakub Kicinski <kuba@kernel.org> wrote:
>
> IOW solving the _actually_ missing CCs is higher priority for me.

You have the script. It's already being run. Use it.

Having scripting that complains about missing Cc's, even *lists* them,
and then requires a human to do something about it - that's stupid.

Why are you using computers and automation in the first place, if said
automation then just makes for more work?

Then requiring inexperienced developers to do those extra things,
knowing - and not caring - that the experienced ones won't even
bother, that goes from stupid to actively malicious.

And then asking me to change my workflow because I use a different
script that does exactly what I want - that takes "stupid and
malicious" to something where I will just ignore you.

In other words: those changes to get_maintainer are simply not going to happen.

Fix your own scripts, and fix your bad workflows.

Your bad workflow not only makes it harder for new people to get
involved, they apparently waste your *own* time so much that you are
upset about it all.

Don't shoot yourself in the foot - and if you insist on doing so,
don't ask *others* to join you in your self-destructive tendencies.

               Linus

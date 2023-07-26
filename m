Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4637C001DC
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 19:06:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjGZTGT (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 15:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjGZTGS (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 15:06:18 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32104198D
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 12:06:17 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4fbaef9871cso245157e87.0
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690398375; x=1691003175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ISopsp3GPjCEYylIemfLA0z3JmRG0JusuOWHSGEOLw=;
        b=Wyo2LaoVHtAiw2PazwAFDmQcirOzA6gP9C+wgO1nx2DyTeSWDe2UJT4YLSqbezPdXi
         FYtDoimOGsFJYfth3e4yqD0aQQCIlAZEvYrZJstJwIyZhZBqWxo2I2fHbgXhkZpRUsLY
         h0Ca7UDrIZ9c7yA/XeOF95zhnwrbRRHcS7fMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690398375; x=1691003175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ISopsp3GPjCEYylIemfLA0z3JmRG0JusuOWHSGEOLw=;
        b=ZwvVD8HPf5/vtQrhV5EjWoVt8ikaXnHaY6q1iiaEthu8zgFlSwbN5KvPhkkYGEKkXo
         rH+fIfD5cK/KqZp9DnZ0R34HDOAHqNp9dliiWQcnZ2dyFJJgHZT6C9F09ngEtVE/ikCR
         C5lAWyPbt2fFQTS3hRNHWoFScNJvARBhDnxdyKaIq3/binWttWb1sUy/fDO4eX3e2UWh
         FNt0cb0Awze5AeTc+SEUlcTFWwRTqL2zubrpMXhaO4Z3Zc4Qb7ogrkHTHJwCPt4IyLpp
         Cq7F2KeE0acZqLL6TApfqI7zwvz5EB/x4DZ2urP3h2nlQBPNR5HmzTtD8K/pDbsAcbZn
         88Zw==
X-Gm-Message-State: ABy/qLaBUDMQOD9DmbdfE+bj4CdRwhnDHq6aT+/FAukUc0E2G6OlirLN
        2iaErAMT+JzJmryzOE+Ivv+hCDso//EUjysNclPKawRO
X-Google-Smtp-Source: APBJJlExfXqoAzwwGCcHmVSLqHYtu21b6VzNA+jpdf9HLQjVRE9DUv8MairpCylstG2TVVw/rnYeyg==
X-Received: by 2002:ac2:5a48:0:b0:4f9:556b:93c2 with SMTP id r8-20020ac25a48000000b004f9556b93c2mr46164lfn.1.1690398375307;
        Wed, 26 Jul 2023 12:06:15 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id a12-20020ac2520c000000b004f4b42e2d7dsm3360294lfl.230.2023.07.26.12.06.14
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 12:06:14 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fe04882c66so206731e87.3
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 12:06:14 -0700 (PDT)
X-Received: by 2002:a19:c519:0:b0:4fb:c0b5:63d4 with SMTP id
 w25-20020a19c519000000b004fbc0b563d4mr42636lfe.43.1690398373839; Wed, 26 Jul
 2023 12:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230726151515.1650519-1-kuba@kernel.org> <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
 <20230726092312.799503d6@kernel.org> <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
 <20230726112031.61bd0c62@kernel.org> <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
 <20230726114817.1bd52d48@kernel.org> <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
In-Reply-To: <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 26 Jul 2023 12:05:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
Message-ID: <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
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

On Wed, 26 Jul 2023 at 11:59, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> You're already using 'patchwork'. Why don't you instead go "Oh, *that*
> tool isn't doing the right thing?"

Christ. Looking around, patchwork *ALREADY DOES THIS*.

Except it looks like it might be set up to just complain
("netdev/cc_maintainers"). Which seems to be why you're complaining.

IOW, you're complaining about *another* tool, because your own tool
use is set up to complain instead of being helpful.

I'm now even more convinced that that warning is completely bogus.

No way in hell am *I* going to bend over backwards and add some stupid
new rule to my workflow because *you* use a tool that is a whining
little complaint-machine instead of just *fixing* the problem.

Guys, tools are supposed to *help*, not just whine about
technicalities and make it harder for everybody else.

So just fix your tool. Don't complain about *my* use of another tool.

                 Linus

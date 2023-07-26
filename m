Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC341C0015E
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 19:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbjGZThg (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 15:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbjGZThg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 15:37:36 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F34071BD9
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 12:37:34 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b74fa5e7d7so1565111fa.2
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 12:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690400253; x=1691005053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p+iMlIz9uQbnImW6R6xhQWYY5Lm4RTCv4TZdvPS1rcA=;
        b=CJQldOJMx34hVnMk6LaZxcxB3dAuK5dGvI8w3Fg7dW9Jt+T8j0E360Emf67BiNc3m0
         7wEOl8WlkSnozAIDGmAgOCqjvNlpGMC02S2/WCZjdBC9SSgOGD6RR0OuinfaBvY/j45R
         u3eAi0PwgK0IPiK+Rk0zlxMqNu+aIzeePFUaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690400253; x=1691005053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+iMlIz9uQbnImW6R6xhQWYY5Lm4RTCv4TZdvPS1rcA=;
        b=ZHmeqg7RsjAWROfHhIOs0K1gXqiqUCRo8wB358oqxr9femBhp5IyCrd6ULhJBnfxdN
         63QdHYsHDdyXcgTvYucn5X0G35MgYWbYLwVl7Y7es3jT6vZ8P1BWwXKfpF9wGNfIWUJO
         btz490XAkK2FxC9kzhipXRSq2taetSBKFHYJdX/DwN+Bmudik++tbbFmdKEaLa4C4HEC
         KFvHqTJAe+6SJ0xp5YjWZODhabYvMnH6RnfvnyrUpHDZuRsypulNBIya/Q4iizttkv0P
         MYrZICw7drGeLiuGo9HUa/7cT4WVSFgs1wgzTZd0uVVb1wDIKwPfEpyvgFsvxx/duy/2
         h67A==
X-Gm-Message-State: ABy/qLbFqPGsvKg+3YkovTxhmrpSb+zUl2mcU8V+UQzHBqJrFyHF7O7S
        CAQvdAKk9VppXpU9X1wvKwTE9qoNtHUoAXazS+zrq8Qh
X-Google-Smtp-Source: APBJJlFFT3rpU5Ot0msjzYajvc8j19rncxy2/46/RtAbYwIKxFaYeIVXDEY+9zuh6kx2/QYS2llrQQ==
X-Received: by 2002:a19:2d5e:0:b0:4fc:3755:37de with SMTP id t30-20020a192d5e000000b004fc375537demr100534lft.3.1690400252981;
        Wed, 26 Jul 2023 12:37:32 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id l17-20020a1709061c5100b009888aa1da11sm9906706ejg.188.2023.07.26.12.37.31
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 12:37:32 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5222b917e0cso183940a12.0
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 12:37:31 -0700 (PDT)
X-Received: by 2002:a50:ee89:0:b0:522:678d:45e5 with SMTP id
 f9-20020a50ee89000000b00522678d45e5mr93988edr.30.1690400251387; Wed, 26 Jul
 2023 12:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230726151515.1650519-1-kuba@kernel.org> <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
 <20230726092312.799503d6@kernel.org> <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
 <20230726112031.61bd0c62@kernel.org> <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
 <20230726114817.1bd52d48@kernel.org> <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
 <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
In-Reply-To: <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 26 Jul 2023 12:37:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
Message-ID: <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
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

On Wed, 26 Jul 2023 at 12:05, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Except it looks like it might be set up to just complain
> ("netdev/cc_maintainers"). Which seems to be why you're complaining.
>
> IOW, you're complaining about *another* tool, because your own tool
> use is set up to complain instead of being helpful.

The very first case I actually looked at wasn't even some
"inexperienced developer" - the kind you claim is the problem, and the
kind you claim this would help.

It was a random fix from Florian Westphal, who has been around for
more than a decade, is credited with over 1500 commits (and mentioned
in many many more), and knows what he's doing.

He has a patch that references a "Fixes:" line, and clearly didn't go
through the get_maintainer script as such, and the
netdev/cc_maintainers script complains as a result.

So Jakub, I think you are barking *entirely* up the wrong tree.

The reason you blame this on mis-use by inexperienced maintainers is
that you probably never even react to the experienced ones that do the
very same things, because you trust them and never bother to tell them
"you didn't use get_maintainers to get the precise list of people that
patchwork complains about".

So the problem is not in get_maintainers. It's in having expectations
that are simply not realistic.

You seem to think that those inexperienced developers should do something that

 (a) experienced developers don't do *EITHER*

 (b) the scripts complain about instead of just doing

and then you think that changing get_maintainers would somehow hide the issue.

You definitely shouldn't require inexperienced developers to do
something that clearly experienced people then don't do.

Now, maybe I happened to just randomly pick a patchwork entry that was
very unusual. But I doubt it.

           Linus

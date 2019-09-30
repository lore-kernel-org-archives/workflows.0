Return-Path: <SRS0=YmVK=XZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1934C32792
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 16:10:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 88715216F4
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 16:10:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731996AbfI3QKD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 12:10:03 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37423 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731976AbfI3QKC (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Sep 2019 12:10:02 -0400
Received: by mail-oi1-f195.google.com with SMTP id i16so11617791oie.4
        for <workflows@vger.kernel.org>; Mon, 30 Sep 2019 09:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CsUA4zsA5i1yWTHOg1TIfUjbsbuz1Df7r+WAxZT+ygU=;
        b=Xz+39hEteW21YmuP+yFq9lmSpVHblMJU2eb/wNbyGi2LeRoKDGu9ho/tRVBHd/cwF4
         gdZhYRQ8VKcT+g65UjCKPjk7RsFgM9DWkVlUbUuQQEACcggf0z8N8j4G+yQeXovvK7cm
         eiyrg3xKHXju/80ca858a800nueOQ1qtZ6gAh2P8IYblN33mvXtJJvHVKsAh+rOou7aC
         Re7AcZiPISPUPeOi3SH5U3t17cM6aUilo39mGwCvnf6QiBmV4Dx6EvrFyReAp/tXdhW2
         naQ3JEQAs1+JjO3OXpBfBtT/GZXHNZqjF8FZWIXYYhccBfOhj2/mCAKoV9c9xHIrDJB9
         vyrA==
X-Gm-Message-State: APjAAAXerx7CAtm9VR6d+JcAasdkltLlioa21WczipXH+CaZlOV9Alnt
        tP54vWpGf8ncKkaE8wWQw5X/oUqkGil1Hlq6m/0=
X-Google-Smtp-Source: APXvYqyXrVoZfToTATchwnFElZAgwI8E6/s4QhCgJuQhxKyv/HcdLgrHbDo832xAGQHQUvkFyetxdTRcs1M8sqA9680=
X-Received: by 2002:aca:b654:: with SMTP id g81mr17882489oif.153.1569859801862;
 Mon, 30 Sep 2019 09:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20190924185312.GD6041@hmswarspite.think-freely.org>
 <20190924202423.GA14425@pendragon.ideasonboard.com> <20190924222502.GA11633@hmswarspite.think-freely.org>
 <20190925205036.GA7763@pendragon.ideasonboard.com> <20190926004045.GA20302@localhost.localdomain>
 <20190928185848.76c85a9d@oasis.local.home> <20190929115722.GA26820@hmswarspite.think-freely.org>
 <CACT4Y+Z8_fABZSXahiGaOxKiPa+K3hxhvH8EVenuuqOs3aCwZg@mail.gmail.com>
 <20190930145123.GA4001@mit.edu> <20190930111532.284f7adf@gandalf.local.home>
In-Reply-To: <20190930111532.284f7adf@gandalf.local.home>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Sep 2019 18:09:50 +0200
Message-ID: <CAMuHMdX0+8fn3bmq4By532+t5OUdUYwqGh+RWavb0E88AZqqLA@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Sep 30, 2019 at 5:17 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> On Mon, 30 Sep 2019 10:51:23 -0400
> "Theodore Y. Ts'o" <tytso@mit.edu> wrote:
> > (a) It's meant for a tree that has its own mailing list, but some
> > people cc LKML anyway, on general principles.  Since very few people
> > read LKML, it's kinda pointless, but people do it anyway.
>
> I prefer this method, as I'm not subscribed on every mailing list, but
> am with LKML. It makes it a lot easier for me to see threads when I get
> Cc'd on a patch thread that's from another mailing list. It's much
> easier for me to find the thread in my LKML folder, than to have to
> search archives someplace else. Although, lore.kernel.org is making
> this better.

+1

That's also why I sometimes report regressions as replies to emails from
git-commits-head, as that may be the only emails about the subject I do have
in my mbox.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

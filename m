Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E6AC47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 19:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3B6B21D7C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 19:07:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728777AbfJKTHc (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 15:07:32 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:36317 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728748AbfJKTHc (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 15:07:32 -0400
Received: by mail-ot1-f42.google.com with SMTP id 67so8873161oto.3
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 12:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rhr5wYlzl4WzSzt6Mg6Yrr/I5CWEh6mIHoaoIyiChgo=;
        b=Q+vmsEUED7QCc2onn9edbSSNBap/1mLYnF7zLEmn7ho+UeZ8H6b2xs7OJPBvwrRsAK
         oxfvFsnDTAM5MHLFR/UvfRbIHXxmVfnkrLscXjjIDjJ2RxFrMmrmjEXMguoyDVFIGbWE
         3x++xe/J45rcEMWC7Osp5uQnhvd9H35AXNuwZk3P2AATH/N1zTBRwH3WVuyOA+e+j5WJ
         k6Pocv5HAxn711/LoTVflXeiHIkOqi8aIVJr+ECObL9P49TiAjuJqkaKaEFQ6ZYl9Ql5
         r0+NWPu2TIG0UrH0czerPNli5Tbh9yGuRPj0Cu/keeVi6IQwSV+AVoPsbdAbJT6+uXBc
         TTxg==
X-Gm-Message-State: APjAAAVwt502HxD3EysEZCBWgpauDkwzGXV2S2udif7zd6luZBuWeqeD
        QsPRc+kl2d3an0RLWsl22wdLIQ/EwJNzN1KwRi8=
X-Google-Smtp-Source: APXvYqymalCSpECD9eK3t0DnFWteH1DPDPIUXuV2K3IWj+S6/0Yo/EQgAqRjcudGH193gbnbdC52USgk3WHKo1eQnnw=
X-Received: by 2002:a05:6830:1685:: with SMTP id k5mr1702899otr.250.1570820851530;
 Fri, 11 Oct 2019 12:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local> <CACT4Y+YddN06rOcE0jc8rVixamHSJALNvGLfzLk2moutL_9rTg@mail.gmail.com>
In-Reply-To: <CACT4Y+YddN06rOcE0jc8rVixamHSJALNvGLfzLk2moutL_9rTg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Oct 2019 21:07:20 +0200
Message-ID: <CAMuHMdU1cdWEfeH9pJESnVrUgWxEfcRO=c6CL=UJa7UVOkvD+g@mail.gmail.com>
Subject: Re: RFC: individual public-inbox/git activity feeds
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Dmitry,

On Fri, Oct 11, 2019 at 7:15 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> I also tend to conclude that some actions should not be done offline
> and then "synced" a week later. Ted provided an example of starting
> tests in another thread. Or, say if you close a bug and then push than
> update a month later without any regard to the current bug state, that
> may not be the right thing. Working with read-only data offline is
> perfectly fine. Doing _some_ updates locally and then pushing a week
> later is fine (e.g. queue a new patch for review). But not necessary
> all updates should be doable in offline mode. And this seems to be
> inherent conflict with any scheme where one can "queue" any updates
> locally, and then "sync" them anytime later without any regard to the
> current state of things and just tell the system and all other
> participants "deal with it". Also, if we have any kind of
> permissions/quotas, when are these checks done: when one creates an
> update or when it's synced?

Not unlike "git push" accepting fast-forwards only, and rejecting
forced updates.
Hence you cannot push the close of a bug (each bug has its own
branch?) before merging the updated remote state first.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

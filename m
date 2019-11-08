Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38145C5DF60
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 10:00:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14828214DB
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 10:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730899AbfKHKAH (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 8 Nov 2019 05:00:07 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:43087 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730719AbfKHKAH (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 8 Nov 2019 05:00:07 -0500
Received: by mail-oi1-f196.google.com with SMTP id l20so4719995oie.10
        for <workflows@vger.kernel.org>; Fri, 08 Nov 2019 02:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iB68wAG2ZYf3rG0IHgJEaNMEHWdaAhItIjOjO0AeHzM=;
        b=PyDAoC/Yyl2Vg/F1dnzzZv/9h+Mhy3JH/6aLxY0x2wjYYHglzw2GmoRKcakxpFa9EM
         azGbmZfpVxxmipb2BywrUhawyMJMDUG7oePp9v9BCpD1QssRybuv5RO/VRj/AH8acvTj
         /mycm0XcHcXJC+tdtqAt1DQFM2BLeH+Jg+VRhfHLhfZYC1+NnqvDMyb5ZiiFYUnRAJXH
         SqVIrDF9ARGDHXm6MfcxGs8L5ZiuvgBVsE8BimVv0GuzBtoYK4wWNPed00ANt5idyb4m
         snHhcHg7Bi5kvWz+U/IWukYVd2se94CNw+saZdLievYXonniywm4C4mnMS4yY2Xq0jBP
         ceCw==
X-Gm-Message-State: APjAAAWCXD1JL8qNX7uHzJb7L8VT46CMZGLQaIxKNQNVbKq+KfmnXfSw
        TuLbHck9wZRQ6/yw98y3npRAdHZLh+UsVcFb5gsADg==
X-Google-Smtp-Source: APXvYqwqzbl8Y05D3NstSeefw6VQVc1BEw2nmUccuiWPn2yHHRF2K4Yt+XlqHLBKiqs2x5XuWlGYfF/slyxse6xsJok=
X-Received: by 2002:aca:3a86:: with SMTP id h128mr8448103oia.131.1573207206604;
 Fri, 08 Nov 2019 02:00:06 -0800 (PST)
MIME-Version: 1.0
References: <20191107204349.hqpefgp7cowj6hof@chatter.i7.local>
 <1779121.stEDml5jbt@kreacher> <CAFQ2z_PCYbY_vBnbjVrVijMteG5iRYHSUswe3Vo8Jp-OFBxZAQ@mail.gmail.com>
In-Reply-To: <CAFQ2z_PCYbY_vBnbjVrVijMteG5iRYHSUswe3Vo8Jp-OFBxZAQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Nov 2019 10:59:55 +0100
Message-ID: <CAMuHMdXrPKUf5sJhw8s-NYCGpwDoLGOptN=poaCJb5dWDNkVaw@mail.gmail.com>
Subject: Re: RFC: using supersedes: trailer to indicate patch/series revision flow
To:     Han-Wen Nienhuys <hanwen@google.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Han-Wen,

On Fri, Nov 8, 2019 at 9:31 AM Han-Wen Nienhuys <hanwen@google.com> wrote:
> On Fri, Nov 8, 2019 at 12:45 AM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> > > 2. Should supersedes: link to the previous version of the patch, or the
> > >     first ever version of the patch? I am leaning towards the latter,
> >
> > And then how do you know that version 2 was superseded by version 3?
>
> You throw the message ID into a search engine, and see what it returns.
>
> The advantage of keeping the patch series ID stable is that you can
> consider a patchseries as a document and then easily index it inside a
> service (say, patchwork) using Lucene, ElasticSearch or some other
> common technology.
>
> If you make the "supersedes" refer to specific versions, a workflow
> service will be more susceptible to errors if messages were lost, and
> the service has to work harder to aggregate the different versions of
> a patchseries together.
>
> Is it common for different authors to superseed each other's patch
> series? If yes, "superseeds: precise version" is more precise, if not,
> you get the same information from the timestamp of the cover letter.

All/most of the above applies only to versioning of patch series that
implement a fixed feature, with a fixed scope.
So Vn+1 is really an improved version of Vn, and nothing more or less.

But this does not apply to many patch series in Linux kernel development.
Patch series may
  - grow (more patches added),
  - shrink (some patches rejected, or already applied independently),
  - be split in multiple series,
  - dropped but some parts reused in other series (possibly by someone
    else),
  - ...
That's the hard work in patch tracking.

So series IDs do not cope well with this, and "superseded" really should
apply to individual patches, not series, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

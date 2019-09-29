Return-Path: <SRS0=PzcX=XY=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21224C4360C
	for <workflows@archiver.kernel.org>; Sun, 29 Sep 2019 16:03:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E0B532086A
	for <workflows@archiver.kernel.org>; Sun, 29 Sep 2019 16:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O2penUza"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfI2QDP (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 29 Sep 2019 12:03:15 -0400
Received: from mail-qt1-f178.google.com ([209.85.160.178]:36130 "EHLO
        mail-qt1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfI2QDP (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 29 Sep 2019 12:03:15 -0400
Received: by mail-qt1-f178.google.com with SMTP id o12so13713978qtf.3
        for <workflows@vger.kernel.org>; Sun, 29 Sep 2019 09:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t5+jAQnvkM5Z8GtC0ia06/eQaUp+3beaqhdyhKveoBY=;
        b=O2penUza8Pz/uBd5K2IKpieL47+ubAqG58V8d8dzZTOjM5E44Y4zmdOolEleIppKMh
         ZNFp0UVVVxa89iI7mFVX0vYJHNUN4MWeXkhQeFPhV8rRcz9nSfFhteFVmt1lwspFlJW0
         Rj0SI25JMYk5I8vQS7WyvGbxJ3X4GK05iln/HvwqiPEBico/iPJ1W6hsTaFHkDP2tJ5+
         K3/E6FgW0ns2YnwJDH4UAhH7mysGyigYHnArZ3Jiba9W0AapVBqIfBd0E1jTs9GOL2lV
         iW30KwF7mkze/W706wHiXxvGLZvC2kWs1W9YhB+Ss4btGXNo864Pmdp10SkMaqr95+Hj
         FE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t5+jAQnvkM5Z8GtC0ia06/eQaUp+3beaqhdyhKveoBY=;
        b=a62MsE/GRDKC0nukBTmKp+OQMlpCmnuTkpZQZc48qAqyy9V5uEvrrGr87tY77xFOIy
         4Hu/AwcUzGQeks+aE6ig1LL0M+gEaXP6+ups5ribCKyzN0eBzVaCc0pbci3+KpARdlZQ
         pd3KhyAMfaETVHJ8mtBz+IzhtB0nKW52H8m0zbqcDnfe1empxKh0yAtsvwGNKxnVAylq
         sAc+eo6LsvzKM3zDDLUN9EHdIx04ViJhRtz7jcF6nrtv6n/9njfeLW8cEYHO9zq2+tSx
         ozQVwnFJ8MKXYBmS0N+tamvlvopsZOmVAUIqg25U4jKUhcqe/v/4e9bTSL3m99WLFKxP
         PY5w==
X-Gm-Message-State: APjAAAVv1IxkTtlNK84I3HsyWRTam9vp2HxOx7fkHWo6xFAqvC4xkQ2r
        txyMpyCtbEhtjXG/MhHa0UNtZ3ZZa0wXyUkxiEoWow==
X-Google-Smtp-Source: APXvYqwsNnvzCyj6b4t51Q5lEi1tE2hZPI0w4mwRrJD1dE7QwthOjmaXVAActvrajkHS8ua/hD7MmnqNc/cTfIFVRC8=
X-Received: by 2002:ac8:76c6:: with SMTP id q6mr9782429qtr.158.1569772993447;
 Sun, 29 Sep 2019 09:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <1811089.yxvLMk49Ug@kreacher> <20190923162001.GD6005@mit.edu>
 <CAMuHMdX31h-VEf0bCjdTTLSO8xwMdE1cR9GsQ2tEk4PSHOPctA@mail.gmail.com>
 <575CE8BF-4C3A-4AEB-8749-9D2B92FCD4D3@goodmis.org> <CAMuHMdUySTyRmuCrCbW61LYbsF_5Jvd7P=mhjGSB0oR2Ec+b3Q@mail.gmail.com>
 <20190928181615.581ea87d@oasis.local.home>
In-Reply-To: <20190928181615.581ea87d@oasis.local.home>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Sun, 29 Sep 2019 18:03:00 +0200
Message-ID: <CACT4Y+ZpP0d+bSGQRZSu-FJuQzHtrSnh+R29Py-rABe6U1D8Jw@mail.gmail.com>
Subject: Re: Kernel development collaboration platform wish list
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sun, Sep 29, 2019 at 12:16 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Thu, 26 Sep 2019 15:39:54 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > On Thu, Sep 26, 2019 at 3:02 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> > > That would be wonderful.
> >
> > Oh, the irony ;-)
> >
>
> Sorry, I couldn't resist ;-)
>
> -- Steve
>
> > > -- Steve
> > >
> > > On September 26, 2019 12:18:18 PM GMT+02:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > [...]
> >
> > > >And if it's done right, it may solve (or make it harder to show) other
> > > >bad review
> > > >behavior, like:
> > > >  - Top posting review comments,
> > > >- Quoting a 2000-line patch when commenting on a single line deep down.

Hi,

I've aggregated the requirements that people mentioned so far here:
https://github.com/dvyukov/kit/blob/master/doc/references.md
I think we need some centralized docs related to this effort.
Information scattered across multiple long email threads and some
private discussions won't be manageable. In future we can extend and
refine the list, put more structure (e.g. v1 vs v2 requirements), etc.

Also references to other development support systems:
https://github.com/dvyukov/kit/blob/master/doc/requirements.md
(people keep mentioning more and more, I've found some interesting
ones e.g. git-appraise, so I thought it would be good to collect the
list)

Why is this on my private github? It was just easier to put an initial
version there. If there is a better shared place, I am happy to move
this.

Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C389ECE58E
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 09:33:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E9AFC21A4A
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 09:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N+osb/uE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727668AbfJKJds (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 05:33:48 -0400
Received: from mail-qk1-f176.google.com ([209.85.222.176]:40559 "EHLO
        mail-qk1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726863AbfJKJds (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 05:33:48 -0400
Received: by mail-qk1-f176.google.com with SMTP id y144so8265423qkb.7
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 02:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aYAsqjRnfgcqU9gR38auUb9xRo83vOx6YTy7O9JRHzY=;
        b=N+osb/uEZP+3+/qCbbhANVDneSg9Qk9ngtgWQnGKfiN8N0CnwDnurmutKBafMZf2+Q
         hR7smtUe5J18RD4JibULCmT5IDm2DOi0vj2nfnrDTk9sd08/gq6Iene0JGk+17Fsq0mB
         rEF+T01lBPaJjltktx2rEWBqCgkLEBGaBhtoTwmATRnhX7yW31ySfG8VP/HoXqRMZB8m
         lfrZZIIJ6xryIXcDEBJqI2FBwEBinTYlvUVSxzb+S1Pf8EjICLU/cW8Xcdc/l5Ny4zry
         Gc7UHaHZ7MB9L9KxEho+855lYNorQsT21Xte7egt3oUX9HO75Vmbjp8ZUjp3ECAPmQfK
         0yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aYAsqjRnfgcqU9gR38auUb9xRo83vOx6YTy7O9JRHzY=;
        b=bQ3WtkWIv2zyb2GliHFGwn4DdqWIKbjdfb14pif5f78Ll68Vq5it+JF2YB3jnksFjO
         rJiZ766F9sO3/4jQNkTmVHwwrN+EExU7/nIoOtyWlKCiFFIl8mIoyDYscZQ+asyjN5tM
         iQ9AgQqb95p09/cUXpqMFMHCYH37GZqK5SEPSpjXKV9xTlRtYB5DCz3aJH+fKgIm5j+h
         5BxbStE1dX46yZeSI2iJ5ioPU3w+4bQPNX2ChsymhUomVq/sO9n4chYHsDMPzvnjZ+WT
         QhZsncNeexyzs5/mukKMJ0n2oLPUF3ykR81T5e/Zl8pLl38vqUhrIrTzX+HXCOPUfWdY
         UUwQ==
X-Gm-Message-State: APjAAAWqYGPx5KP1iV7FoHL7UBlnnyhoGxGqLsYpnXOzNv6u/74ZF3TR
        ibz+RBZDK5fOJ2eq4lGoceN5ljeGzLoDbl6LNwOtvA==
X-Google-Smtp-Source: APXvYqwXwWgIDcHg3wCn/AtwvDyN3Wu0yqh+6fL1pKqRtZYr5y/9AFTMXYruxPwig1p9pKsXUAGfPpKK7xlKyAK1hfw=
X-Received: by 2002:a37:65d0:: with SMTP id z199mr13523509qkb.407.1570786426999;
 Fri, 11 Oct 2019 02:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190912120602.GC29277@pure.paranoia.local> <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local> <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local> <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
 <20191011083057.GA1074413@kroah.com> <CACT4Y+Y=w-vBCKn__ZVM_qk=vU9wactVQkCTLiVp+4OpJW2BgA@mail.gmail.com>
In-Reply-To: <CACT4Y+Y=w-vBCKn__ZVM_qk=vU9wactVQkCTLiVp+4OpJW2BgA@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 11 Oct 2019 11:33:35 +0200
Message-ID: <CACT4Y+aBJctHyR3EXRevOU6KCaAWFJO75Gr6yB_t-xeWZ8tjLg@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Dmitry Vyukov <dvyukov@gmail.com>,
        "Theodore Ts'o" <tytso@mit.edu>, Rob Herring <robh@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        stefan@datenfreihafen.org, Sasha Levin <sashal@kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        David Miller <davem@davemloft.net>,
        Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 10:59 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Fri, Oct 11, 2019 at 10:31 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Oct 10, 2019 at 10:16:42PM -0400, Konstantin Ryabitsev wrote:
> > > On Tue, 8 Oct 2019 at 12:51, Konstantin Ryabitsev
> > > <konstantin@linuxfoundation.org> wrote:
> > > > >Hi Konstantin,
> > > > >
> > > > >Are you going to attend OSS Summit EU? If yes, I think we should sync
> > > > >up there. I know Dave and Greg are there too. Perhaps we could
> > > > >schedule some kind of semi-formal meeting?
> > > >
> > > > Unfortunately, no -- we have limited budget for traveling and I burned
> > > > through mine by going to Lisbon. I'd be happy to work on a draft
> > > > document that expands on my tooling vision (I'm doing so anyway), and I
> > > > can time it to be ready before the summit so you can review and improve
> > > > it. My hope is to submit it formally to the LF by the end of the month.
> > >
> > > Oh, hey, change of plans -- looks like I *will* be going to Lyon after
> > > all. I think sitting down together for a semi-formal meeting sounds
> > > like a good idea, considering all the active discussions happening
> > > lately. Should we hash out a tentative agenda about topics that we
> > > should and shouldn't cover? Who should be in attendance?
> >
> > I'd like to be there, as I will be at the conference.
>
>
> Cool! Konstantin, glad you will make it!
>
> Let's try to figure out time then.
> I propose the first day to not leave it to the last day and we may
> need some follow up discussions.
> On Monday I see Greg's keynote at 09:50 - 10:10. Steven's talk at
> 12:20 - 12:55. Sasha's talk at 12:20 - 12:55. Any other conflicts for
> people who want to attend?
> What about 10:30-11:30 (this covers a coffee break at 10:45-11:00, can
> prolong it to 12:00)? Any other time slot proposals?

+Christian also expressed interest, his talks are 14:25 - 15:50 and
16:20 - 16:55 on Monday.

>
> FTR here is the schedule link:
> https://events19.linuxfoundation.org/events/open-source-summit-europe-2019/program/schedule/
>
> Anybody knows how we can find a room, etc? Or knows somebody who
> knows? Should it be on a BoF track? Should we also tentatively reserve
> a slot on subsequent days?

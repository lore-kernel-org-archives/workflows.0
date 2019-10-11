Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10808C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 13:30:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7F45206CD
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 13:30:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JAtWJx/l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbfJKNan (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 09:30:43 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:38959 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728002AbfJKNan (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 09:30:43 -0400
Received: by mail-qt1-f196.google.com with SMTP id n7so13838145qtb.6
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gub81PiKw3sbaw61cEs0Jgp7B2dLYO8eh7x9FFp6K3c=;
        b=JAtWJx/lcEAvdLEDtye+AyICjUHL0Les8q6RBn8+LHJlzzuDjpgZIji8YCKWzc4AGK
         HDEFnic6lW+k7DNivwKTd4HQvCOBbYRvymJziz881a8TjpuO5qAef39YathSgvaTgEVY
         9cMpYowv/T76EAqbSIwyDStvT4GWP14UEtsjPrlH8zRpM3iRtKGAHAnxas1ZKGiRpqgJ
         Hh2juwugz7A6LneHo639XEMaRo4VyL4bko2a6zLoNuArGYrUv03unAkad37DuA7voPtP
         MaT97FfsCiotCorTQ39MujZgn4dPcNQbIXVYjQqkkPquaXOKpNImCIQ3g5sBBnDRfHMW
         pzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gub81PiKw3sbaw61cEs0Jgp7B2dLYO8eh7x9FFp6K3c=;
        b=JzusEJqxD/FMOvpjVV8AtDttQWkCW/sOrja3fXIg6b3mwMfCG+kzV3HH8+CH+Sgz2m
         sQMAORqRPao5voLvcV5N814r1z2MjyroVCw6fYQQFLSlHXVXPD0ZEaE9Q3JRV56a2BAG
         l6uhHloDiQinei+nqwmf/TkKWX/8D048sBx3x/M+zd1RUpXjSwrpxSAAUYJIHwTVtAti
         Od5gyAtVKBier3GdaXLN7xCKoTZ/6xjPuAOHtbvRw+w9LYshTN2/TbKinQImXjXXsLOu
         LBuaI3vEgp4mG6Rf3JRzYTBpC/Ibf68tAhbcRBaeoB7RqRbDA9uxNSi2ePW/GZKQhxbi
         tbRQ==
X-Gm-Message-State: APjAAAWvdM/ZGKO5YZIlTf3Jj8LPt1iVs89BDXCQtIyJ4ysNxp4h6MJc
        86mjGTpGLT+GhnmojUUsvDJ8uc1VSbrH5JzgPeF9kA==
X-Google-Smtp-Source: APXvYqyPfspyRtMmWMGf1vvYC2JmM9350M15O1Ec4RUSyjAKh9dDSHRv7VOcmGFVPVWEvS4MB+zszGwFUMHP3pcIojw=
X-Received: by 2002:a0c:fec3:: with SMTP id z3mr16307211qvs.122.1570800641872;
 Fri, 11 Oct 2019 06:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190912120602.GC29277@pure.paranoia.local> <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local> <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local> <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
 <20191011083057.GA1074413@kroah.com> <CACT4Y+Y=w-vBCKn__ZVM_qk=vU9wactVQkCTLiVp+4OpJW2BgA@mail.gmail.com>
 <CACT4Y+aBJctHyR3EXRevOU6KCaAWFJO75Gr6yB_t-xeWZ8tjLg@mail.gmail.com>
 <20191011091812.68257184@gandalf.local.home> <20191011131917.mkq3n5332xlf6lhy@wittgenstein>
In-Reply-To: <20191011131917.mkq3n5332xlf6lhy@wittgenstein>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 11 Oct 2019 15:30:29 +0200
Message-ID: <CACT4Y+ZinMiTq=PtA3ho9WNzvL0UW72FNMeSyY9_gkumjL0jVg@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
To:     Christian Brauner <christian.brauner@ubuntu.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
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

On Fri, Oct 11, 2019 at 3:19 PM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
>
> On Fri, Oct 11, 2019 at 09:18:12AM -0400, Steven Rostedt wrote:
> > On Fri, 11 Oct 2019 11:33:35 +0200
> > Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > > > Let's try to figure out time then.
> > > > I propose the first day to not leave it to the last day and we may
> > > > need some follow up discussions.
> > > > On Monday I see Greg's keynote at 09:50 - 10:10. Steven's talk at
> > > > 12:20 - 12:55. Sasha's talk at 12:20 - 12:55. Any other conflicts for
> > > > people who want to attend?
> > > > What about 10:30-11:30 (this covers a coffee break at 10:45-11:00, can
> > > > prolong it to 12:00)? Any other time slot proposals?
> > >
> > > +Christian also expressed interest, his talks are 14:25 - 15:50 and
> > > 16:20 - 16:55 on Monday.
> >
> > If everyone's giving a talk on Monday, can we do this meeting on
> > Tuesday?
> >
> > It's much easier to concentrate if you don't have to worry about a talk
> > you are about to give (or just finished).
>
> Seconded. :)

It's not that there is nothing on Tue, it's just that I looked only on
Monday schedule :)
For Tue I see for potentially interested people:
09:00 - 09:20 Linus keynote
11:00 - 12:00 Shuah Office Hours
12:20 - 12:55 Rafael talk
Anything else?

Tue is fine with me, I just did not want to leave it to the last day
because most likely it will take me a day to digest all info, so I
will be able to reply something meaningful only the next day. It would
be good to have some in-person conversations next day as well.

Tue 14:00-15:00?

Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E6AECE58C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 08:59:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E3DA21D6C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 08:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZZwYAL+W"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfJKI7g (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 04:59:36 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]:37737 "EHLO
        mail-qt1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbfJKI7f (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 04:59:35 -0400
Received: by mail-qt1-f182.google.com with SMTP id l51so12543633qtc.4
        for <workflows@vger.kernel.org>; Fri, 11 Oct 2019 01:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mMIKWY/GDZEFPiqjiSscuVdofKW1/FE7gKKd3+rtojs=;
        b=ZZwYAL+W/nbvOevpDev9Li8IXSox8+cOnXOoTMNqKTMt+NK16eP3f7MiXEuNEM92EB
         ocb1icjL+x7B5Kvhi5uVDXOs+aMLLb7j66Gyp8fcXrjOhppKZ1/vAyZYAA8YjmkWp4+Y
         se45vBhXu0VUAkIt33CwSNMo+DY6WPCB3vcawubHdTIPloarXPaFPIpmcN5Ic06/cvHp
         5vuL4urcRT7xSandTmtupmTR9gUuiowrrswF9Pi38/zDbco1NxuMZD+PwkETHuYispCB
         tBxaX8HLSztL3g79ndl7rstA52yZfQeJGNsa9+ZAJ4eqb/9h5Z9YeZKc2Xdyv7ZiM+Bn
         DMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mMIKWY/GDZEFPiqjiSscuVdofKW1/FE7gKKd3+rtojs=;
        b=YvOg1LNzZDs/CwUlDOonPIDDiRjfd5RnwYwmNP8ZI3+iQgb2wlbSiO4CjYEbM6gY++
         BwnfzxeE7tZVlTvus1zqQLkXQh+AzylDVZ5lu1tqgxBIkkmeyXABPH8JIWFejOiMxRtq
         xSEqf+M8QMsF58PpsQ/Eh/H3+55dD4Gfq5yspvPciFOplFEHjghVSsSkTuyjl2fFiSJY
         /gzVpj6sHnYBohUB4wF9saPuoamG8+PAOUqIn5tfJzozYKd7mFSMle1nMAFP3ioq8Y3/
         VlXrBczMNFPSCLYAc22Jm34ND0w758Hk8H9zlVMj+omjoxhRGAcjcunP49IpltyDeu6y
         aDDw==
X-Gm-Message-State: APjAAAUjgAuy66jSV6aLKUuAO3FjkuVVBWdui4GQOzDW1beUWvP+AXID
        IO9xC/Fyd+rzRKM4DYtV63Wee/gN1z/YdmPtU65mNQ==
X-Google-Smtp-Source: APXvYqxhVfYAK2JogamEXCreb5w6DPbQsS76kIfUCYd/05uQ6pBMPNPAqF5cNZbOzZG3wriEDNzCEoLTR8ZJFhkljJQ=
X-Received: by 2002:ac8:73c8:: with SMTP id v8mr15478643qtp.158.1570784374282;
 Fri, 11 Oct 2019 01:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190912120602.GC29277@pure.paranoia.local> <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local> <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local> <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
 <20191011083057.GA1074413@kroah.com>
In-Reply-To: <20191011083057.GA1074413@kroah.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Fri, 11 Oct 2019 10:59:22 +0200
Message-ID: <CACT4Y+Y=w-vBCKn__ZVM_qk=vU9wactVQkCTLiVp+4OpJW2BgA@mail.gmail.com>
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
        David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 10:31 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 10, 2019 at 10:16:42PM -0400, Konstantin Ryabitsev wrote:
> > On Tue, 8 Oct 2019 at 12:51, Konstantin Ryabitsev
> > <konstantin@linuxfoundation.org> wrote:
> > > >Hi Konstantin,
> > > >
> > > >Are you going to attend OSS Summit EU? If yes, I think we should sync
> > > >up there. I know Dave and Greg are there too. Perhaps we could
> > > >schedule some kind of semi-formal meeting?
> > >
> > > Unfortunately, no -- we have limited budget for traveling and I burned
> > > through mine by going to Lisbon. I'd be happy to work on a draft
> > > document that expands on my tooling vision (I'm doing so anyway), and I
> > > can time it to be ready before the summit so you can review and improve
> > > it. My hope is to submit it formally to the LF by the end of the month.
> >
> > Oh, hey, change of plans -- looks like I *will* be going to Lyon after
> > all. I think sitting down together for a semi-formal meeting sounds
> > like a good idea, considering all the active discussions happening
> > lately. Should we hash out a tentative agenda about topics that we
> > should and shouldn't cover? Who should be in attendance?
>
> I'd like to be there, as I will be at the conference.


Cool! Konstantin, glad you will make it!

Let's try to figure out time then.
I propose the first day to not leave it to the last day and we may
need some follow up discussions.
On Monday I see Greg's keynote at 09:50 - 10:10. Steven's talk at
12:20 - 12:55. Sasha's talk at 12:20 - 12:55. Any other conflicts for
people who want to attend?
What about 10:30-11:30 (this covers a coffee break at 10:45-11:00, can
prolong it to 12:00)? Any other time slot proposals?

FTR here is the schedule link:
https://events19.linuxfoundation.org/events/open-source-summit-europe-2019/program/schedule/

Anybody knows how we can find a room, etc? Or knows somebody who
knows? Should it be on a BoF track? Should we also tentatively reserve
a slot on subsequent days?

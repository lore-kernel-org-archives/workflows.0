Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA67C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 07:31:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 34D2E2086A
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 07:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MoQgjm7P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfJOHbg (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 03:31:36 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43263 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbfJOHbg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 03:31:36 -0400
Received: by mail-qt1-f196.google.com with SMTP id t20so23837116qtr.10
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 00:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DHhpg0Ms7aEJ9sfxg+GuI0b78PNa8BonM0dlUErSvx4=;
        b=MoQgjm7Pm45FEBiL0UzA0oOhlnjV+Eo17bvkX4nvOJGEzle10P4gVkfHERggvoRuVw
         UkQKh0xr+Zg80cea+lA/glzxSmzGdzGSlqSeVRBttz+79GG/0kNWvPSODeWN1R3qflpK
         814AkXDTOwe1rh/OUVWWDTQ0Gf/S7dsAOJi0cwZ4PbXDz28BGdaeioPHnpiWsE0wAmVe
         50z3vgcqroc1942Y9KHrG9V4gUdPvoZHbQp44NC4Ub+N0NP4fryps5J3LjJpRaZeEP6T
         Zm+uot8eQuD5Ovsu+4ZilxTfIUMn2uGPpfgaGGg9SzuNQ4z8DlQsOgIdoGKExDefwoV1
         9mYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DHhpg0Ms7aEJ9sfxg+GuI0b78PNa8BonM0dlUErSvx4=;
        b=QK/eQHMwDhU5bDX6LIRtJ70xRIRlj+dmY17DiVALTxXcU2EAr09G2TEZNNPQXwfTk8
         SBbzoSr1B1PpRC/5nbj3d5oyYNGRH/L6JfhZ1wsmfD/VJWNPjTfet5avhjBbCDPUbbaB
         qCGXQfqVOsPRgwYwS/ebnXX/432EiNhmy94BB9ROqX+CZtA2Jj2A4YFeOrPtkfHw2Q+c
         LEEDgrinSLb1f8DW1WZNUnDZst6ffp+6eyYc5sdP2yP7w1twuL+2pFiI9BwQqg2NYjSe
         k8KXm/yLI3ywN287b3Og+dfQJdv3gfSy84iT1Tcvy9VC8VJ28akTOPdMffabmwifEbMa
         lj0Q==
X-Gm-Message-State: APjAAAUNIVVS2vAzUTQnFvAHncRBPN00PcLjEQZvv43wYC9teN0LMgnH
        PyN0dJwhQfpAAVCUEe6ec+aggiwvbMJfOdT5vu8M0w==
X-Google-Smtp-Source: APXvYqz91VC/rAQ9muYGnb1N2nTLS2wCzWKne74IamQe83PVpNMTc6q8N2cNfdG6rTdjdKKo5taQREfxKWqkS9SjELw=
X-Received: by 2002:ac8:73c8:: with SMTP id v8mr36814329qtp.158.1571124695079;
 Tue, 15 Oct 2019 00:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190912120602.GC29277@pure.paranoia.local> <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local> <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local> <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
 <20191011083057.GA1074413@kroah.com> <CACT4Y+Y=w-vBCKn__ZVM_qk=vU9wactVQkCTLiVp+4OpJW2BgA@mail.gmail.com>
 <CACT4Y+aBJctHyR3EXRevOU6KCaAWFJO75Gr6yB_t-xeWZ8tjLg@mail.gmail.com>
 <20191011091812.68257184@gandalf.local.home> <20191011131917.mkq3n5332xlf6lhy@wittgenstein>
 <CACT4Y+ZinMiTq=PtA3ho9WNzvL0UW72FNMeSyY9_gkumjL0jVg@mail.gmail.com>
 <a0836974-15b6-e62f-59bb-95c6ebd95058@gandi.net> <CAKMK7uGwAvv87YQZshs+5r0424TirTDX3JSySMOupRp9uRPE0w@mail.gmail.com>
In-Reply-To: <CAKMK7uGwAvv87YQZshs+5r0424TirTDX3JSySMOupRp9uRPE0w@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 15 Oct 2019 09:31:23 +0200
Message-ID: <CACT4Y+bup25exQ4SjzmEMt3YQ_dT5fCgcfnvOQEM2a6NHnFb5g@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Nicolas Belouin <nicolas.belouin@gandi.net>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Steven Rostedt <rostedt@goodmis.org>,
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

On Mon, Oct 14, 2019 at 9:53 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Oct 14, 2019 at 9:42 AM Nicolas Belouin
> <nicolas.belouin@gandi.net> wrote:
> >
> >
> >
> > On 10/11/19 3:30 PM, Dmitry Vyukov wrote:
> > > On Fri, Oct 11, 2019 at 3:19 PM Christian Brauner
> > > <christian.brauner@ubuntu.com> wrote:
> > >> On Fri, Oct 11, 2019 at 09:18:12AM -0400, Steven Rostedt wrote:
> > >>> On Fri, 11 Oct 2019 11:33:35 +0200
> > >>> Dmitry Vyukov <dvyukov@google.com> wrote:
> > >>>
> > >>>>> Let's try to figure out time then.
> > >>>>> I propose the first day to not leave it to the last day and we may
> > >>>>> need some follow up discussions.
> > >>>>> On Monday I see Greg's keynote at 09:50 - 10:10. Steven's talk at
> > >>>>> 12:20 - 12:55. Sasha's talk at 12:20 - 12:55. Any other conflicts for
> > >>>>> people who want to attend?
> > >>>>> What about 10:30-11:30 (this covers a coffee break at 10:45-11:00, can
> > >>>>> prolong it to 12:00)? Any other time slot proposals?
> > >>>> +Christian also expressed interest, his talks are 14:25 - 15:50 and
> > >>>> 16:20 - 16:55 on Monday.
> > >>> If everyone's giving a talk on Monday, can we do this meeting on
> > >>> Tuesday?
> > >>>
> > >>> It's much easier to concentrate if you don't have to worry about a talk
> > >>> you are about to give (or just finished).
> > >> Seconded. :)
> > > It's not that there is nothing on Tue, it's just that I looked only on
> > > Monday schedule :)
> > > For Tue I see for potentially interested people:
> > > 09:00 - 09:20 Linus keynote
> > > 11:00 - 12:00 Shuah Office Hours
> > > 12:20 - 12:55 Rafael talk
> > > Anything else?
> > >
> > > Tue is fine with me, I just did not want to leave it to the last day
> > > because most likely it will take me a day to digest all info, so I
> > > will be able to reply something meaningful only the next day. It would
> > > be good to have some in-person conversations next day as well.
> > >
> > > Tue 14:00-15:00?
> > I'd like to be here too and this proposition fits well in my planned
> > schedule
>
> Me too on both interest and slot.
> -Daniel


Re logistics, it would be nice to get some room for this. Looking at
the program committee [1], I see Greg, Steve, Shuah there. Do you know
if it's possible to get a room? And who can help to organize it?

[1] https://events19.linuxfoundation.org/events/open-source-summit-europe-2019/program/program-committee/

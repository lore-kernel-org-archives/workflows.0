Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7020ECE58C
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 13:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE816214AF
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 13:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SAB7Tanc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727950AbfJKNkr (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 09:40:47 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36736 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727855AbfJKNkr (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 09:40:47 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01E3533A;
        Fri, 11 Oct 2019 15:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570801244;
        bh=qspUrZ2okurgFhrsokg+QKVpUH6VX5Z6g2x5NxguBq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SAB7TancD/25l45XqXccNJ/EdZU1WRGF+5IfpStH73FR1A7JLlgWa9CgKsoQYvPs3
         9n5UnKjS9+JiZfHkP1dEb+fRHts1N80+fbsnz/hiamOyTQ4i8qj+qzE4WksDAtVUyr
         2tVvOM0WhfNawzmTCDNECkIch2qoVZ3tRTJWSXu0=
Date:   Fri, 11 Oct 2019 16:40:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Christian Brauner <christian.brauner@ubuntu.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Dmitry Vyukov <dvyukov@gmail.com>,
        Theodore Ts'o <tytso@mit.edu>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [MAINTAINERS SUMMIT] Reflections on kernel development processes
Message-ID: <20191011134042.GG4882@pendragon.ideasonboard.com>
References: <20190930202451.GA14403@pure.paranoia.local>
 <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local>
 <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
 <20191011083057.GA1074413@kroah.com>
 <CACT4Y+Y=w-vBCKn__ZVM_qk=vU9wactVQkCTLiVp+4OpJW2BgA@mail.gmail.com>
 <CACT4Y+aBJctHyR3EXRevOU6KCaAWFJO75Gr6yB_t-xeWZ8tjLg@mail.gmail.com>
 <20191011091812.68257184@gandalf.local.home>
 <20191011131917.mkq3n5332xlf6lhy@wittgenstein>
 <CACT4Y+ZinMiTq=PtA3ho9WNzvL0UW72FNMeSyY9_gkumjL0jVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACT4Y+ZinMiTq=PtA3ho9WNzvL0UW72FNMeSyY9_gkumjL0jVg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 03:30:29PM +0200, Dmitry Vyukov wrote:
> On Fri, Oct 11, 2019 at 3:19 PM Christian Brauner wrote:
> > On Fri, Oct 11, 2019 at 09:18:12AM -0400, Steven Rostedt wrote:
> > > On Fri, 11 Oct 2019 11:33:35 +0200 Dmitry Vyukov wrote:
> > >
> > > > > Let's try to figure out time then.
> > > > > I propose the first day to not leave it to the last day and we may
> > > > > need some follow up discussions.
> > > > > On Monday I see Greg's keynote at 09:50 - 10:10. Steven's talk at
> > > > > 12:20 - 12:55. Sasha's talk at 12:20 - 12:55. Any other conflicts for
> > > > > people who want to attend?
> > > > > What about 10:30-11:30 (this covers a coffee break at 10:45-11:00, can
> > > > > prolong it to 12:00)? Any other time slot proposals?
> > > >
> > > > +Christian also expressed interest, his talks are 14:25 - 15:50 and
> > > > 16:20 - 16:55 on Monday.
> > >
> > > If everyone's giving a talk on Monday, can we do this meeting on
> > > Tuesday?
> > >
> > > It's much easier to concentrate if you don't have to worry about a talk
> > > you are about to give (or just finished).
> >
> > Seconded. :)
> 
> It's not that there is nothing on Tue, it's just that I looked only on
> Monday schedule :)
> For Tue I see for potentially interested people:
> 09:00 - 09:20 Linus keynote
> 11:00 - 12:00 Shuah Office Hours
> 12:20 - 12:55 Rafael talk
> Anything else?

I need to attend the libcamera talk at 15:15.

> Tue is fine with me, I just did not want to leave it to the last day
> because most likely it will take me a day to digest all info, so I
> will be able to reply something meaningful only the next day. It would
> be good to have some in-person conversations next day as well.
> 
> Tue 14:00-15:00?

Works for me. I wonder however if we should try to start the discussions
in the morning, in order to have time in the afternoon to handle the
leftovers (which, I think, will be orders of magnitude larger than the
initial discussions :-))

-- 
Regards,

Laurent Pinchart

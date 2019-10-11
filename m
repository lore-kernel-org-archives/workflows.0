Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D9CC47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 13:19:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C97B206A1
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 13:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728226AbfJKNTa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 09:19:30 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41495 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbfJKNTa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 09:19:30 -0400
Received: from v22018046084765073.goodsrv.de ([185.183.158.195] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1iIupE-0000oj-DR; Fri, 11 Oct 2019 13:19:20 +0000
Date:   Fri, 11 Oct 2019 15:19:18 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
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
Message-ID: <20191011131917.mkq3n5332xlf6lhy@wittgenstein>
References: <20190912120602.GC29277@pure.paranoia.local>
 <d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com>
 <20190930202451.GA14403@pure.paranoia.local>
 <CACT4Y+a9VXYF3N__Bw52RPhVhXc4B6hT7Hdpjn=wk_qzhgJZ8Q@mail.gmail.com>
 <20191008165155.GA30571@chatter.i7.local>
 <CAMwyc-TzGj4BE0E2tRn8Esj43SnpcWXpS-ureG1YWbmtzmfqbA@mail.gmail.com>
 <20191011083057.GA1074413@kroah.com>
 <CACT4Y+Y=w-vBCKn__ZVM_qk=vU9wactVQkCTLiVp+4OpJW2BgA@mail.gmail.com>
 <CACT4Y+aBJctHyR3EXRevOU6KCaAWFJO75Gr6yB_t-xeWZ8tjLg@mail.gmail.com>
 <20191011091812.68257184@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191011091812.68257184@gandalf.local.home>
User-Agent: NeoMutt/20180716
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Oct 11, 2019 at 09:18:12AM -0400, Steven Rostedt wrote:
> On Fri, 11 Oct 2019 11:33:35 +0200
> Dmitry Vyukov <dvyukov@google.com> wrote:
> 
> > > Let's try to figure out time then.
> > > I propose the first day to not leave it to the last day and we may
> > > need some follow up discussions.
> > > On Monday I see Greg's keynote at 09:50 - 10:10. Steven's talk at
> > > 12:20 - 12:55. Sasha's talk at 12:20 - 12:55. Any other conflicts for
> > > people who want to attend?
> > > What about 10:30-11:30 (this covers a coffee break at 10:45-11:00, can
> > > prolong it to 12:00)? Any other time slot proposals?  
> > 
> > +Christian also expressed interest, his talks are 14:25 - 15:50 and
> > 16:20 - 16:55 on Monday.
> 
> If everyone's giving a talk on Monday, can we do this meeting on
> Tuesday?
> 
> It's much easier to concentrate if you don't have to worry about a talk
> you are about to give (or just finished).

Seconded. :)

Christian

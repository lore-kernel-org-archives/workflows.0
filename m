Return-Path: <SRS0=9qbL=YC=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41868ECE58C
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 22:21:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2694C206BB
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 22:21:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731150AbfJIWV5 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 9 Oct 2019 18:21:57 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:45990 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730809AbfJIWV5 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 9 Oct 2019 18:21:57 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 9587F1F4BD;
        Wed,  9 Oct 2019 22:21:56 +0000 (UTC)
Date:   Wed, 9 Oct 2019 22:21:56 +0000
From:   Eric Wong <e@80x24.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Laura Abbott <labbott@redhat.com>
Cc:     Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191009222156.nedvmajswb3w3r3c@dcvr>
References: <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Wed, Oct 09, 2019 at 05:35:39PM -0400, Laura Abbott wrote:
> > > This doesn't mean that forges are entirely out -- but they must
> > > remain mere tools that participate in a globally decentralized,
> > > developer-attestable, self-archiving messaging service. Maybe let's
> > > call that "kernel developer bus" or "kdbus" -- pretty sure that name
> > > hasn't been used before.
> > > 
> > 
> > The big issue I see with anything decentralized is that as things
> > grow people don't actually want to host their own infrastructure.
> > Think about the decline in the number of people who host their own
> > e-mail server. Anything decentralized would still presumably require
> > a server somewhere, so you're going to either raising the bar to entry
> > by requiring people to set up their own server or end up with people
> > still relying on a service somewhere. This feels like it ends up with
> > the situation we have today where most things are locally optimized
> > but on average the situation is still lousy.

Laura: agreed, I think the important thing is designing for
"centralization resistance"; so that anybody can replicate it.

The dangerous thing is when forges become centralized identity
providers and users get siloed into communicating through them.

I consider email a viable alternative to OpenID.  And I'd be
100% in favor of forges which give outgoing mail access to their
users so they can interop with any other SMTP servers.  If
anything it'd put more pressure on the big email providers
to preserve interopability.

> > You've articulated you've articulated the reasons against centralization
> > very well from an admin point of view (which I won't dispute) but at
> > least from a user point of view a centralized forge infrastructure is
> > great because I don't have to worry about it. My university/company
> > doesn't have to set anything up for me to contribute. I get we are
> > probably going to end up optimizing more for the maintainer here but
> > it's worth thinking about how we could get forge-like benefits where
> > most users don't have to run infrastructure.
> 
> We're actually not in opposition to each-other -- I expect kernel.org
> (via Linux Foundation) would provide convenient bridge tools to cover the
> precise concern you mention. Think kind of like patchwork.kernel.org, but
> instead of exclusively using some local database that only admins at
> kernel.org have access to, it would provide a set of feeds allowing anyone
> else to set up a fully functioning replica -- or participate in the process
> using their own compatible tools.
> 
> So, in other words, the forge is still there and is still providing a
> valuable service, but it is not the single point of truth that can vanish
> and take invaluable data with it. That's my vision, and I think we have all
> we need to achieve it short of resolve, buy-in, and proper tooling.

Konstantin: 100% agreed.

I actually hope fewer people subscribe to mailing lists and read
via NNTP[*], because the subscriber list is centralized and
distributing it would also be a privacy violation.

One of my long-term visions is to have an agreed upon way to
have entirely forkable development communities.  Git already
gave us forkable code repositories.


[*] I'm planning on better client-side tooling around NNTP for
    reading email (still relying on SMTP to send).
    And maybe an NNTP -> POP3 server for webmail users since
    every webmail service can import POP3...

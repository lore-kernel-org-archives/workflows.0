Return-Path: <SRS0=22HX=YG=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F3BC4CECE
	for <workflows@archiver.kernel.org>; Sun, 13 Oct 2019 23:39:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4EEA1206A3
	for <workflows@archiver.kernel.org>; Sun, 13 Oct 2019 23:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbfJMXjb (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 13 Oct 2019 19:39:31 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:50588 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728691AbfJMXjb (ORCPT <rfc822;workflows@vger.kernel.org>);
        Sun, 13 Oct 2019 19:39:31 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 9CC731F4C0;
        Sun, 13 Oct 2019 23:39:30 +0000 (UTC)
Date:   Sun, 13 Oct 2019 23:39:30 +0000
From:   Eric Wong <e@80x24.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191013233930.GB13089@dcvr>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
 <20191011212308.xk7xcvfamwnkwovn@dcvr>
 <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Fri, Oct 11, 2019 at 09:23:08PM +0000, Eric Wong wrote:
> > > (This is the same reason I generally disagree with Eric Wong about
> > > preserving SMTP as the primary transmission protocol -- I've heard lots of
> > > complaints both from kernel developers and especially from people trying to
> > > contribute to CAF about corporate policies actually making it impossible to
> > > submit patches -- and no, using a different mail server is not a possibility
> > > for them because it can be a firing offense under their IT AUP rules.)
> > 
> > I'm not opposed to a webmail interface tailored to kernel hacking
> > which does stuff like checkpatch.pl and get_maintainer.pl before
> > sending (similar to your patchwork proposal and
> > gitgadgetgadget).  That would get around security appliances
> > but SMTP would still be used in the background.
> > 
> > Or offer full-blown HTTPS webmail + IMAP + SMTP access like any
> > other webmail provider + checkpatch + get_maintainer helpers.
> 
> Well, this is the bit where I say that it may not be allowed by corporate
> rules. I see this all the time in CAF/Android world where companies
> *require* that all email goes through their SMTP server so that it can be
> properly logged (often for legal reasons). And it is often equally required
> that any code submissions come from person@corporate.com and not
> person@free-email-provider.com for License/CLA reasons, so setting up a
> webmail server is not a solution either.

Aren't they still allowed to submit stuff via forges the same way
they'd use a potential hacker-oriented webmail/SMTP/IMAP solution?

Sometimes I see @username_COMPANY-type names on forges, but
AFAIK it's not very common.

> This is basically why SMTP sucks in my view -- and it's worthless trying to
> pick fights with IT departments, because they are told to do so by lawyers.
> So, I want to take SMTP out of the equation:

If the open source community can fight to get GPL accepted, I
don't see why we can't fight or subvert dumb corporate policies.

> 1. provide a way for someone to submit a patch using a web interface   (but
> still in a way that From: is their corporate ID)
> 2. use individual git feeds as a way to send out patches instead of   always
> being secondary to SMTP

username-COMPANY@users.kernel.org could probably work if they're
required to use @username_COMPANY on forges.

We can also find creative ways to subvert corporate policies:
For example; if their policy specifically prevents outgoing SMTP,
"git imap-send" could be used.

If their policy forbids using external "email" services, we'd
name it "Kernel Hackers' Messaging System" or something of that
sort and say we use an email bridge :>

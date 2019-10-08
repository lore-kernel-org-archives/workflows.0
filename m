Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757CEC10F14
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 13:19:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5460A2070B
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 13:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730316AbfJHNTH (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Oct 2019 09:19:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:54662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730249AbfJHNTH (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 8 Oct 2019 09:19:07 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AAC15206C0;
        Tue,  8 Oct 2019 13:19:06 +0000 (UTC)
Date:   Tue, 8 Oct 2019 09:19:05 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Axtens <dja@axtens.net>
Cc:     Eric Wong <e@80x24.org>, David Miller <davem@davemloft.net>,
        sir@cmpwn.com, nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191008091905.6b0474a7@gandalf.local.home>
In-Reply-To: <87muebr1pc.fsf@dja-thinkpad.axtens.net>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
        <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
        <20191007.173329.2182256975398971437.davem@davemloft.net>
        <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
        <20191008003931.y4rc2dp64gbhv5ju@dcvr>
        <87wodgqb86.fsf@dja-thinkpad.axtens.net>
        <20191008021125.slr35o3tmwphxfpz@dcvr>
        <87pnj7rkbp.fsf@dja-thinkpad.axtens.net>
        <20191008060302.vqf4ogk6s37ghrp3@dcvr>
        <87muebr1pc.fsf@dja-thinkpad.axtens.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 08 Oct 2019 21:06:23 +1100
Daniel Axtens <dja@axtens.net> wrote:

> >> I don't think so. I think it's because patchwork allows you to log in
> >> and perform actions like change state and delegate patches. That's not a
> >> thing that public-inbox has in scope.  
> >
> > It seems like those things are done to appease managerial types
> > rather than people who actually do work :>
> >
> > I prefer actual communication of delegation/state be done via
> > normal English.  Relying on states/tickets/severities/etc
> > unnatural and often leads to confusion.  
> 
> This is not a widely held view amongst lists and maintainers that use
> patchwork.

I agree with Daniel here. I prefer the state and delegation of patches.
This way I can easily see what I need to work on. I have people send me
various patches for review, which other people review. When they think
its at a point for me to include it, they delegate the patch to me.

Relying on email to say "Hey Steve this patch is ready" will get lost
in my Inbox (which currently has over 25,000 emails!). Ever since I
started using Patchwork, the number of "lost patches" has dropped
tremendously, because I no longer need to manage them in my Inbox.

-- Steve

Return-Path: <SRS0=J16y=YA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743B0ECE58C
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 15:47:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52D0C21721
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 15:47:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbfJGPrz (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 11:47:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:52206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727791AbfJGPry (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 7 Oct 2019 11:47:54 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CEAED20684;
        Mon,  7 Oct 2019 15:47:53 +0000 (UTC)
Date:   Mon, 7 Oct 2019 11:47:52 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     David Miller <davem@davemloft.net>
Cc:     sir@cmpwn.com, nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191007114752.0ac7f041@gandalf.local.home>
In-Reply-To: <20191007.173329.2182256975398971437.davem@davemloft.net>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
        <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
        <20191007.173329.2182256975398971437.davem@davemloft.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, 07 Oct 2019 17:33:29 +0200 (CEST)
David Miller <davem@davemloft.net> wrote:

> From: "Drew DeVault" <sir@cmpwn.com>
> Date: Tue, 24 Sep 2019 14:37:28 -0400
> 
> > Until this part. Phasing out email in favor of a centralized
> > solution like Gitlab would be a stark regression.  
> 
> I have to make a statement about this because it's really the elephant
> in the room.
> 
> Email is on the slow and steady decline to an almost certain death.

And so has IRC. I would hope that email doesn't face the same fate.
What replaced IRC? Slack! The most useless interface for having
anything more that watercooler conversations.

Whatever "replaces" email, please keep those stupid emojis and
especially the animated ones out of it. It does nothing but distract
from the conversation.

I blame Outlook as the death of email. It's probably the most used
email client but also the most useless one. It doesn't support proper
tree threading, and it's impossible to follow a long thread with it.
Not to mention, it can't do inlined conversations to save itself.

> 
> And I say this as someone who is maintaining email lists for more than
> 25 years, and has to sift through several hundred emails every day.
> 
> Somewhere down the road, in the not too distant future, email will
> simply not be an option.  You can "use" it, but I can guarantee it
> will not be in a state where you will want to.
> 
> So we can stay in denial about this, or we can do something proactive
> to prepare ourselve for this inevitable result.
> 
> And when we have these conversations about how important it is to
> retain email based workflows, is that really to make sure we have a
> backup plan in case new infrastructure fails, or is it to appease
> "senior" maintainers like myself and others who simply don't want to
> change and move on?
> 
> Personally, I seriously want to change and move on from email, it's
> terrible.
> 
> I just want tools and pretty web pages, in fact I'll use just about
> anything in order to move on from email based workflows entirely.

I want tools that work, and are versatile. If you have a replacement
that's not a "one size fits all", where you can build any client
against it (like we have with email), then I will be very happy. But
forcing everyone to a single workflow is going to be a huge step
backwards.

-- Steve

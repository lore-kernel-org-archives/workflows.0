Return-Path: <SRS0=479y=XX=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E07C4360C
	for <workflows@archiver.kernel.org>; Sat, 28 Sep 2019 23:53:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A971D20659
	for <workflows@archiver.kernel.org>; Sat, 28 Sep 2019 23:53:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbfI1XxC (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 28 Sep 2019 19:53:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:54212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728569AbfI1XxC (ORCPT <rfc822;workflows@vger.kernel.org>);
        Sat, 28 Sep 2019 19:53:02 -0400
Received: from oasis.local.home (unknown [12.174.139.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E5C5220866;
        Sat, 28 Sep 2019 23:53:00 +0000 (UTC)
Date:   Sat, 28 Sep 2019 19:52:59 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Dave Airlie <airlied@gmail.com>
Cc:     Neil Horman <nhorman@tuxdriver.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20190928195259.17b6587e@oasis.local.home>
In-Reply-To: <CAPM=9tzbwop5Wv9u5d2rDz_-eUmfckJdYff4WVnmAZKf-yBXXw@mail.gmail.com>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
        <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
        <20190924185312.GD6041@hmswarspite.think-freely.org>
        <20190924202423.GA14425@pendragon.ideasonboard.com>
        <20190924222502.GA11633@hmswarspite.think-freely.org>
        <20190925205036.GA7763@pendragon.ideasonboard.com>
        <20190926004045.GA20302@localhost.localdomain>
        <20190928185848.76c85a9d@oasis.local.home>
        <CAPM=9tzbwop5Wv9u5d2rDz_-eUmfckJdYff4WVnmAZKf-yBXXw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sun, 29 Sep 2019 09:16:53 +1000
Dave Airlie <airlied@gmail.com> wrote:


> How many patches is your workflow btw? 20 a month? 50?

For ftrace only, yeah. But for all the patches I'm Cc'd on (and would
like to review), it's more like several hundred.

> 
> I think the reason davem and my group have in using git(hub/lab) is
> our patch counts are way higher. You guys are inventing solutions for
> your problems that's great, but they don't scale.
> 
> Patchwork as currently sold still requires someone to spend time
> cleaning it up a lot, which is fine if you get 20-30 mails, when you
> 1-2k mails patchwork manual interactions end up taking a large chunk
> of time. The and the fact that there is one patchwork, everyone has
> forked it to add their favourite features. Unless someone spends time
> on a reboot and goes around bringing all the forks back to a central
> line, which is is a significantly larger task than if it has been
> maintained in the first place, because now everyone has their own
> niche hacks and cool features they can't do without, but are all
> different than everyone elses.

I think you misunderstood what I was saying. It's not that "I want
patchwork", but I want something that can do things offline. I would
love to have a reboot of patchwork, because it was an extreme pain to
get working. The focus of my email was about getting something that
works locally, that can be pushed public. The only reason I mentioned
patchwork, was because I was able to get it working locally (with a
bunch of hacks!)

Great, lets get something that works for you and Dave that handle 1000
patches a month, but most maintainers do not have that big of a queue.
I only ask for something that I can manage patches offline, and not
depend on a service for it.

-- Steve

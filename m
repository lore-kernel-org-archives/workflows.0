Return-Path: <SRS0=479y=XX=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46B0C4360C
	for <workflows@archiver.kernel.org>; Sat, 28 Sep 2019 22:58:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4D6120866
	for <workflows@archiver.kernel.org>; Sat, 28 Sep 2019 22:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbfI1W6v (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 28 Sep 2019 18:58:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728666AbfI1W6u (ORCPT <rfc822;workflows@vger.kernel.org>);
        Sat, 28 Sep 2019 18:58:50 -0400
Received: from oasis.local.home (unknown [12.174.139.122])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24D8A207E0;
        Sat, 28 Sep 2019 22:58:50 +0000 (UTC)
Date:   Sat, 28 Sep 2019 18:58:48 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Neil Horman <nhorman@tuxdriver.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20190928185848.76c85a9d@oasis.local.home>
In-Reply-To: <20190926004045.GA20302@localhost.localdomain>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
        <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
        <20190924185312.GD6041@hmswarspite.think-freely.org>
        <20190924202423.GA14425@pendragon.ideasonboard.com>
        <20190924222502.GA11633@hmswarspite.think-freely.org>
        <20190925205036.GA7763@pendragon.ideasonboard.com>
        <20190926004045.GA20302@localhost.localdomain>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 25 Sep 2019 20:40:45 -0400
Neil Horman <nhorman@tuxdriver.com> wrote:

> Eventually, barring any really significant objection, hes going to make
> the switch, and users will either have to get github accounts, or stop
> participating in netdev development.  

That will be a very sad day if that happened.

Whatever service should have an email interface. For example, if I get
a message from bugzilla.kernel.org, I can reply back via email and it
is inserted into the tool (as I see my Out of office messages going
into it. I need to fix my scripts not to reply to bugzilla).

I set up patchwork on my INBOX, as I'm having a hard time of separating
patches from the noise. And it works really well. I would love to be
able to push my patchwork list to a public place so that others can see
it too. As mentioned in the Maintainers Summit, it would be great to be
able to pull patchwork down to my laptop, get on the plane, process a
bunch of patches while flying, and then when I land, I could push the
updates to the public server.

That's pretty much all I'm looking for.

-- Steve

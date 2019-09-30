Return-Path: <SRS0=YmVK=XZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F895C32792
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 15:15:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A6C52168B
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 15:15:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731880AbfI3PPf (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 11:15:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:38958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730780AbfI3PPf (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 30 Sep 2019 11:15:35 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B83A215EA;
        Mon, 30 Sep 2019 15:15:34 +0000 (UTC)
Date:   Mon, 30 Sep 2019 11:15:32 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Neil Horman <nhorman@tuxdriver.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20190930111532.284f7adf@gandalf.local.home>
In-Reply-To: <20190930145123.GA4001@mit.edu>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
        <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
        <20190924185312.GD6041@hmswarspite.think-freely.org>
        <20190924202423.GA14425@pendragon.ideasonboard.com>
        <20190924222502.GA11633@hmswarspite.think-freely.org>
        <20190925205036.GA7763@pendragon.ideasonboard.com>
        <20190926004045.GA20302@localhost.localdomain>
        <20190928185848.76c85a9d@oasis.local.home>
        <20190929115722.GA26820@hmswarspite.think-freely.org>
        <CACT4Y+Z8_fABZSXahiGaOxKiPa+K3hxhvH8EVenuuqOs3aCwZg@mail.gmail.com>
        <20190930145123.GA4001@mit.edu>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, 30 Sep 2019 10:51:23 -0400
"Theodore Y. Ts'o" <tytso@mit.edu> wrote:

> 
> (a) It's meant for a tree that has its own mailing list, but some
> people cc LKML anyway, on general principles.  Since very few people
> read LKML, it's kinda pointless, but people do it anyway.

I prefer this method, as I'm not subscribed on every mailing list, but
am with LKML. It makes it a lot easier for me to see threads when I get
Cc'd on a patch thread that's from another mailing list. It's much
easier for me to find the thread in my LKML folder, than to have to
search archives someplace else. Although, lore.kernel.org is making
this better.

-- Steve

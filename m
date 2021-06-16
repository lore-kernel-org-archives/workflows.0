Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA95C48BE5
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 20:10:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 359E6613CD
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 20:10:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbhFPUMz (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 16:12:55 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:56217 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233278AbhFPUMb (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 16 Jun 2021 16:12:31 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 15GKABaX002368;
        Wed, 16 Jun 2021 22:10:11 +0200
Date:   Wed, 16 Jun 2021 22:10:11 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210616201011.GA2348@1wt.eu>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

On Wed, Jun 16, 2021 at 01:18:13PM -0400, Konstantin Ryabitsev wrote:
> - We can *probably* track when patch series get applied and auto-close pull
>   requests that are accepted

In haproxy we have a bot that forwards PRs to the mailing list. It
CCs the author and sends a gentle message saying that reviews are
made in public using plain-text e-mails, and that for this reason
the PR is automatically closed. And I think it's easier for both
sides, because users who are used to PRs would probably count a bit
too much on the "github mode", where they're certain that someone
will eventually notice that the PR count went from 1137 to 1138 and
will have a look, while it's certain that there will be quite some
losses, and by warning the submitter upfront there is less surprise.

In addition, responding to reviews over e-mail and having the submitter
do the same along the discussion basically means that everyone will
forget about closing the issue. Also one of the benefits of e-mail is
that maintainers can ultimately fix some typos in the commit message
or adjust the subject before committing, something which will quickly
confuse the bot.

For these reasons I think that instant close (with a gentle message)
will be more robust.

Just my two cents,
Willy

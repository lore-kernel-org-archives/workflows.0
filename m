Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAEBC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:25:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E54E561434
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233152AbhFQP1z (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:27:55 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:56416 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233130AbhFQP1y (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 11:27:54 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 15HFPe6g004492;
        Thu, 17 Jun 2021 17:25:40 +0200
Date:   Thu, 17 Jun 2021 17:25:40 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210617152539.GD4418@1wt.eu>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <20210616201011.GA2348@1wt.eu>
 <20210617151155.27vveohhnhe745d7@nitro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617151155.27vveohhnhe745d7@nitro.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 11:11:55AM -0400, Konstantin Ryabitsev wrote:
> On Wed, Jun 16, 2021 at 10:10:11PM +0200, Willy Tarreau wrote:
> > In haproxy we have a bot that forwards PRs to the mailing list. It
> > CCs the author and sends a gentle message saying that reviews are
> > made in public using plain-text e-mails, and that for this reason
> > the PR is automatically closed. And I think it's easier for both
> > sides, because users who are used to PRs would probably count a bit
> > too much on the "github mode", where they're certain that someone
> > will eventually notice that the PR count went from 1137 to 1138 and
> > will have a look, while it's certain that there will be quite some
> > losses, and by warning the submitter upfront there is less surprise.
> 
> Good to know. I was only aware of GitGitGadget, so knowing that HAProxy does
> it as well is useful. Unfortunately, I can't really use much of GitGitGadget
> code as it's too closely integrated into Azure and is written in typescript,
> which I don't know at all.

Note, I was speaking about a return on experience, not particularly about
code. I don't know what language the bot is written in, it's entirely
managed by one of our great contributors, but if you're interested in
exchanging with him I can put you in contact with him off-list.

Anyway if you're interested in seeking some feedback on such practices
from other projects, just look for old ones which adopted github long
after having solved their versionning issues. Very often the github
workflow doesn't suit them at all. Nginx automatically closes PRs for
example. For Apache it's not very clear. FreeBSD uses github as a mirror
and has very few PRs. Gcc also uses it as a mirror and has very few PRs.
Probably these ones use some form of automated bots to close them, or
do that in batches once a year.

Willy

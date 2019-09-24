Return-Path: <SRS0=lZea=XT=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4525C432C1
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 18:54:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86A5D21655
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 18:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436981AbfIXSyS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 24 Sep 2019 14:54:18 -0400
Received: from charlotte.tuxdriver.com ([70.61.120.58]:49169 "EHLO
        smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436863AbfIXSyR (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 24 Sep 2019 14:54:17 -0400
Received: from cpe-2606-a000-111b-43ee-0-0-0-162e.dyn6.twc.com ([2606:a000:111b:43ee::162e] helo=localhost)
        by smtp.tuxdriver.com with esmtpsa (TLSv1:AES256-SHA:256)
        (Exim 4.63)
        (envelope-from <nhorman@tuxdriver.com>)
        id 1iCpwT-0007aq-90; Tue, 24 Sep 2019 14:54:07 -0400
Date:   Tue, 24 Sep 2019 14:53:12 -0400
From:   Neil Horman <nhorman@tuxdriver.com>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20190924185312.GD6041@hmswarspite.think-freely.org>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Sep 24, 2019 at 02:37:28PM -0400, Drew DeVault wrote:
> On Tue Sep 24, 2019 at 2:25 PM Neil Horman wrote:
> > 	After hearing at LPC that that there was a group investigating moving
> > some upstream development to a less email-centric workfow, I wanted to share
> > this with the group:
> > 
> > https://gitlab.com/nhorman/git-lab-porcelain
> > 
> > Its still very rough, and is focused on working with RH based workflows
> > currently, but it can pretty easily be adapted to generic projects, if theres
> > interest, as well as to other services besides gitlab (github/etc).
> > 
> > The principle is pretty straightforward (at least currently), its a git
> > porcelain that wraps up the notion of creating a merge request with sending
> > patch emails.  It uses the gitlab rest api to fork projects, and manipulate MR's
> > in sync with email patch posting.  It also contains an email listener daemon to
> > monitor reqisite lists for ACK/NACK responses which can then be translated into
> > MR metadata for true MR approvals/notifications to the maintainer that a branch
> > is good to merge.
> 
> This is a great idea.
> 
> > Ostensibly, if this has any sort of legs, the idea in the long term is to add
> > the ability to use the porcelain to do reviews on the command line, and
> > eventually phase out email entirely, but I think thats a significant way off
> > here.
> 
> Until this part. Phasing out email in favor of a centralized solution
> like Gitlab would be a stark regression.
> 
Well, that by no rights has to happen (at least not in my mind).  I wouldn't
have an issue with maintaining a mailing list in perpituity.  I only mean to say
that if common practice becomes to us the git interface to preform reviews, and
email usage becomes less needed, a given project could choose to phase it out.

Neil


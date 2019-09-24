Return-Path: <SRS0=lZea=XT=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB43CC432C2
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 20:24:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77E9120872
	for <workflows@archiver.kernel.org>; Tue, 24 Sep 2019 20:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SRqgEH+j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410357AbfIXUYg (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 24 Sep 2019 16:24:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38570 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbfIXUYg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 24 Sep 2019 16:24:36 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8B6CC30F;
        Tue, 24 Sep 2019 22:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569356673;
        bh=etxPZ+94PjCqUXB6uaJt5Lf687GBfHt9gjgvSTqOaoE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SRqgEH+jS+Srzgynj9J9vC5DBqJMZDmICtGJLffeRhGYOeGwBzHwq2zItzUnDnJPv
         iEjaRnBZZdsEJlRHQhOk2MmBSXOqDq4zcTCWSPFle+gxjne0WYmAAvkRenEurn3sC3
         keS5HPfX7McTH/E+ZsIVJi5oJzVo9053vv+UzHEo=
Date:   Tue, 24 Sep 2019 23:24:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Neil Horman <nhorman@tuxdriver.com>
Cc:     Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20190924202423.GA14425@pendragon.ideasonboard.com>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20190924185312.GD6041@hmswarspite.think-freely.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190924185312.GD6041@hmswarspite.think-freely.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Neil,

On Tue, Sep 24, 2019 at 02:53:12PM -0400, Neil Horman wrote:
> On Tue, Sep 24, 2019 at 02:37:28PM -0400, Drew DeVault wrote:
> > On Tue Sep 24, 2019 at 2:25 PM Neil Horman wrote:
> > > 	After hearing at LPC that that there was a group investigating moving
> > > some upstream development to a less email-centric workfow, I wanted to share
> > > this with the group:
> > > 
> > > https://gitlab.com/nhorman/git-lab-porcelain
> > > 
> > > Its still very rough, and is focused on working with RH based workflows
> > > currently, but it can pretty easily be adapted to generic projects, if theres
> > > interest, as well as to other services besides gitlab (github/etc).
> > > 
> > > The principle is pretty straightforward (at least currently), its a git
> > > porcelain that wraps up the notion of creating a merge request with sending
> > > patch emails.  It uses the gitlab rest api to fork projects, and manipulate MR's
> > > in sync with email patch posting.  It also contains an email listener daemon to
> > > monitor reqisite lists for ACK/NACK responses which can then be translated into
> > > MR metadata for true MR approvals/notifications to the maintainer that a branch
> > > is good to merge.
> > 
> > This is a great idea.
> > 
> > > Ostensibly, if this has any sort of legs, the idea in the long term is to add
> > > the ability to use the porcelain to do reviews on the command line, and
> > > eventually phase out email entirely, but I think thats a significant way off
> > > here.
> > 
> > Until this part. Phasing out email in favor of a centralized solution
> > like Gitlab would be a stark regression.
>
> Well, that by no rights has to happen (at least not in my mind).  I wouldn't
> have an issue with maintaining a mailing list in perpituity.  I only mean to say
> that if common practice becomes to us the git interface to preform reviews, and
> email usage becomes less needed, a given project could choose to phase it out.

My opinion on this is that if anyone wants to move towards a more
git-centric workflow, be it for review, pull/merge requests, or anything
else, we will have to figure out a way to make this decentralised and
not bound to a single server instance. Without interoperability between
servers and decentralisation, the result will be vendor lock-in, and
that's a no-go for a large part of the community.

How this could be achieved remains to be discussed, and should be an
interesting exercise.

-- 
Regards,

Laurent Pinchart

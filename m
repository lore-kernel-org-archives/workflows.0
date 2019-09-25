Return-Path: <SRS0=xtfX=XU=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE58FC432C1
	for <workflows@archiver.kernel.org>; Wed, 25 Sep 2019 10:49:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA01220872
	for <workflows@archiver.kernel.org>; Wed, 25 Sep 2019 10:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729400AbfIYKtv (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 25 Sep 2019 06:49:51 -0400
Received: from charlotte.tuxdriver.com ([70.61.120.58]:53519 "EHLO
        smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728168AbfIYKtv (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 25 Sep 2019 06:49:51 -0400
Received: from cpe-2606-a000-111b-43ee-0-0-0-162e.dyn6.twc.com ([2606:a000:111b:43ee::162e] helo=localhost)
        by smtp.tuxdriver.com with esmtpsa (TLSv1:AES256-SHA:256)
        (Exim 4.63)
        (envelope-from <nhorman@tuxdriver.com>)
        id 1iD4re-00066R-OC; Wed, 25 Sep 2019 06:49:49 -0400
Date:   Wed, 25 Sep 2019 06:49:37 -0400
From:   Neil Horman <nhorman@tuxdriver.com>
To:     David Rientjes <rientjes@google.com>
Cc:     workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20190925104937.GA31002@hmswarspite.think-freely.org>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <alpine.DEB.2.21.1909241609540.78294@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1909241609540.78294@chino.kir.corp.google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Sep 24, 2019 at 04:15:18PM -0700, David Rientjes wrote:
> On Tue, 24 Sep 2019, Neil Horman wrote:
> 
> > Hey all-
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
> > 
> > Ostensibly, if this has any sort of legs, the idea in the long term is to add
> > the ability to use the porcelain to do reviews on the command line, and
> > eventually phase out email entirely, but I think thats a significant way off
> > here.
> > 
> > Anywho, food for thought.
> > 
> 
> This is very interesting.
> 
> It may be off-topic but this email raised my curiosity about how features 
> are maintained internally before they are ready to propose to upstream, 
> especially when those features are developed over multiple upstream base 
> releases.
> 
> We have features that we maintain in-house until they are ready to push 
> upstream and while they are still under active development or we are 
> collecting data to use as motivation for asking that feature to be merged.
> 
> For this, we have historically always rebased these features on top of new 
> kernel releases (unfortunately not 4.20 -> 5.0 -> 5.1, but somewhere in 
> between like 4.20 -> 5.2) and that creates a lot of churn, developer 
> resources, and rewrites the git history.
> 
> Exploring options for maintaining these features by merging rather than 
> rebasing has been done: instead of rebasing from 4.20 to 5.2, for example, 
> as a clean series on top of 5.2, we fork the feature branch based on 4.20 
> off and merge it with 5.2, fix it up, run tests, and publish.  The thought 
> process here was that we can always git rebase --onto linus to create a 
> nice clean patch series for posting upstream or asking for a git pull from 
> upstream.
> 
> I'd be very interested to know how others maintain patch series across 
> multiple base kernel version especially when they need to maintain the 
> feature for those kernel versions separately, how RH handles their patches 
> before they are ready to be officially posted, etc.
> 
As far as kernel features are concerned, RH follows an upstream first policy
(and does so generally speaking for all of our products).  If a new feature is
to be developed, we do so against the latest upstream, always, and then the
effort becomes one of adapting those features to the RHEL stabilized kernels.
That shifts the effort from constantly needing to adapt an existing feature to a
newer kernel, to needing to do take a newly developed feature and backport it to
an older stabilized kernel.  Its not necessecarily any less work per-se, but we
find it accelerates the development of the actual feature.

HTH
Neil


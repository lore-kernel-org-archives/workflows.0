Return-Path: <SRS0=YmVK=XZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E14C4360C
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 01:01:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8A8F2082F
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 01:01:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbfI3BBP (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 29 Sep 2019 21:01:15 -0400
Received: from charlotte.tuxdriver.com ([70.61.120.58]:54395 "EHLO
        smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfI3BBP (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 29 Sep 2019 21:01:15 -0400
Received: from cpe-2606-a000-111b-43ee-0-0-0-1ff7.dyn6.twc.com ([2606:a000:111b:43ee::1ff7] helo=localhost)
        by smtp.tuxdriver.com with esmtpsa (TLSv1:AES256-SHA:256)
        (Exim 4.63)
        (envelope-from <nhorman@tuxdriver.com>)
        id 1iEk3e-0001gw-UO; Sun, 29 Sep 2019 21:01:02 -0400
Date:   Sun, 29 Sep 2019 21:00:54 -0400
From:   Neil Horman <nhorman@tuxdriver.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20190930010054.GA2973@localhost.localdomain>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+Z8_fABZSXahiGaOxKiPa+K3hxhvH8EVenuuqOs3aCwZg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sun, Sep 29, 2019 at 02:55:25PM +0200, Dmitry Vyukov wrote:
> On Sun, Sep 29, 2019 at 1:57 PM Neil Horman <nhorman@tuxdriver.com> wrote:
> >
> > On Sat, Sep 28, 2019 at 06:58:48PM -0400, Steven Rostedt wrote:
> > > On Wed, 25 Sep 2019 20:40:45 -0400
> > > Neil Horman <nhorman@tuxdriver.com> wrote:
> > >
> > > > Eventually, barring any really significant objection, hes going to make
> > > > the switch, and users will either have to get github accounts, or stop
> > > > participating in netdev development.
> > >
> > > That will be a very sad day if that happened.
> > >
> > > Whatever service should have an email interface. For example, if I get
> > > a message from bugzilla.kernel.org, I can reply back via email and it
> > > is inserted into the tool (as I see my Out of office messages going
> > > into it. I need to fix my scripts not to reply to bugzilla).
> > >
> > Forge solutions do have the ability to use email as an interface to
> > issue tracking, thats not a problem.  What they don't currently seem to
> > have is the ability to emulate patch review workflows.  And thats not to
> > say they couldn't, but it seems to me that they haven't prioritized that
> > because they offer several different types of comment options
> > (commenting in the pull request discussion(s) themselves vs commenting
> > on code, etc.  If they sould implement that, I think alot of this would
> > become alot easier.
> >
> > > I set up patchwork on my INBOX, as I'm having a hard time of separating
> > > patches from the noise. And it works really well. I would love to be
> > > able to push my patchwork list to a public place so that others can see
> > > it too. As mentioned in the Maintainers Summit, it would be great to be
> > > able to pull patchwork down to my laptop, get on the plane, process a
> > > bunch of patches while flying, and then when I land, I could push the
> > > updates to the public server.
> > >
> > > That's pretty much all I'm looking for.
> > >
> > I think what you are looking for here is a way to pull down a set of
> > merge requests, review and merge those you approve, and push them back
> > when you are back online?  I think you can do at least some of that.
> > Forge solutions (definately gitlab, likely github), allow you to pull
> > a merge request reference namespace (on gitlab its
> > heads/merge_requests/<merge_request_id>).  You can merge whatever head
> > there you like to its intended target branch, and when you push, it will
> > update the corresponding MR to the MERGED state.  What you can't
> > currently do is make a comment on an MR, store that comment in git and
> > then have the MR updated with those comments.  That would be a great
> > item to make that feature more complete.
> 
> One mismatch with kernel dev process that seem to be there for lots of
> existing solutions (gerrit, git-appraise, github, gitlab) is that they
> are centered around a single "mail" git tree (in particular,
> gerrit/git-appraise check in metainfo right into that repo). Whereas
> kernel has lots of kernels. Now if Steve is CCed on lots of changes
> what git tree should he pull before boarding a place? For some changes
> it may be unclear what tree they should go into initially, or that may
> change over time. Then, there are some additional relations with
> stable trees.
> I suspect that kernel tooling should account for that and separate
> changes layer from exact git trees. Like mailing lists. Usually there
> is 1 mailing list and 1 git tree per subsystem, but still this
> relation is not fixed and one can always CC another mailing list, or
> retarget the change, etc.
> What do you think?
> 
I agree that newer review solutions (of the type you ennummerated) rely
on centralization of information, which is undesireable in many cases,
but I'm not sure how to avoid that.  

Just thinking off the top of my head, I wonder if a tool that converted
all forge type conversations to git notes would be useful here.  Those
could then be pulled by individuals for review and update?

Neil


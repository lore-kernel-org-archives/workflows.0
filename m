Return-Path: <SRS0=FCe/=XV=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D378C4360C
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 13:43:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4C403222C0
	for <workflows@archiver.kernel.org>; Thu, 26 Sep 2019 13:43:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfIZNnW (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 26 Sep 2019 09:43:22 -0400
Received: from charlotte.tuxdriver.com ([70.61.120.58]:35144 "EHLO
        smtp.tuxdriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfIZNnV (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 26 Sep 2019 09:43:21 -0400
Received: from cpe-2606-a000-111b-43ee-0-0-0-115f.dyn6.twc.com ([2606:a000:111b:43ee::115f] helo=localhost)
        by smtp.tuxdriver.com with esmtpsa (TLSv1:AES256-SHA:256)
        (Exim 4.63)
        (envelope-from <nhorman@tuxdriver.com>)
        id 1iDU36-0001nb-Ki; Thu, 26 Sep 2019 09:43:16 -0400
Date:   Thu, 26 Sep 2019 09:43:07 -0400
From:   Neil Horman <nhorman@tuxdriver.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20190926134225.GA7235@hmswarspite.think-freely.org>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20190924185312.GD6041@hmswarspite.think-freely.org>
 <20190924202423.GA14425@pendragon.ideasonboard.com>
 <20190924222502.GA11633@hmswarspite.think-freely.org>
 <20190925205036.GA7763@pendragon.ideasonboard.com>
 <CAMuHMdVbPFVLUBvQALR_fMbUpUWPpKKgdfkg5kY3v5nX42P_KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVbPFVLUBvQALR_fMbUpUWPpKKgdfkg5kY3v5nX42P_KA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Sep 26, 2019 at 12:23:52PM +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Thu, Sep 26, 2019 at 11:58 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Tue, Sep 24, 2019 at 06:25:02PM -0400, Neil Horman wrote:
> > > On Tue, Sep 24, 2019 at 11:24:23PM +0300, Laurent Pinchart wrote:
> > > > On Tue, Sep 24, 2019 at 02:53:12PM -0400, Neil Horman wrote:
> > > >> On Tue, Sep 24, 2019 at 02:37:28PM -0400, Drew DeVault wrote:
> > > >>> On Tue Sep 24, 2019 at 2:25 PM Neil Horman wrote:
> > > >>>>  After hearing at LPC that that there was a group investigating moving
> > > >>>> some upstream development to a less email-centric workfow, I wanted to share
> > > >>>> this with the group:
> > > >>>>
> > > >>>> https://gitlab.com/nhorman/git-lab-porcelain
> > > >>>>
> > > >>>> Its still very rough, and is focused on working with RH based workflows
> > > >>>> currently, but it can pretty easily be adapted to generic projects, if theres
> > > >>>> interest, as well as to other services besides gitlab (github/etc).
> > > >>>>
> > > >>>> The principle is pretty straightforward (at least currently), its a git
> > > >>>> porcelain that wraps up the notion of creating a merge request with sending
> > > >>>> patch emails.  It uses the gitlab rest api to fork projects, and manipulate MR's
> > > >>>> in sync with email patch posting.  It also contains an email listener daemon to
> > > >>>> monitor reqisite lists for ACK/NACK responses which can then be translated into
> > > >>>> MR metadata for true MR approvals/notifications to the maintainer that a branch
> > > >>>> is good to merge.
> > > >>>
> > > >>> This is a great idea.
> > > >>>
> > > >>>> Ostensibly, if this has any sort of legs, the idea in the long term is to add
> > > >>>> the ability to use the porcelain to do reviews on the command line, and
> > > >>>> eventually phase out email entirely, but I think thats a significant way off
> > > >>>> here.
> > > >>>
> > > >>> Until this part. Phasing out email in favor of a centralized solution
> > > >>> like Gitlab would be a stark regression.
> > > >>
> > > >> Well, that by no rights has to happen (at least not in my mind).  I wouldn't
> > > >> have an issue with maintaining a mailing list in perpituity.  I only mean to say
> > > >> that if common practice becomes to us the git interface to preform reviews, and
> > > >> email usage becomes less needed, a given project could choose to phase it out.
> > > >
> > > > My opinion on this is that if anyone wants to move towards a more
> > > > git-centric workflow, be it for review, pull/merge requests, or anything
> > > > else, we will have to figure out a way to make this decentralised and
> > > > not bound to a single server instance. Without interoperability between
> > > > servers and decentralisation, the result will be vendor lock-in, and
> > > > that's a no-go for a large part of the community.
> > >
> > > I think thats a bit of an overstatement.
> > >
> > > Yes, we definately want to avoid vendor lock in, and decentralization is
> > > definately a needed aspect of any highly parallelized workflow.  That said:
> > >
> > > 1) Regarding vendor lock in, if you want to work with any workflow-as-a-service
> > > provider, your going to want tooling that talks to it (via the web ui, the
> > > command line, etc).  But in the end, you're going to have to talk to that
> > > service.  Thats all this tooling I presented does.  And if you look at the REST
> > > apis for the major available services (gitlab/github), while they differ, their
> > > general objects and operations are sufficiently simmilar that they can be
> > > abstracted through tooling such that the same tool can be adapted to either.
> > > One would imagine that any to-be-created service would have sufficiently
> > > simmilar operations to also be adaptable to a generic set of operations
> >
> > Then let's create such a tool that also supports e-mail workflows, to
> > really offer a choice.
> >
> > > 2) Regarding decentrallization, the advantage of the decentrailzation of git
> > > lies in its ability for users to house their own local copies of a git tree, not
> > > so much in the ability to have multiple git servers (though the latter is
> > > important too).  In either case, the use of gitlab or github doesn't enjoin you
> > > from doing that.  You can still move your git tree around between clients and
> > > servers however you see fit.
> >
> > But it forces me to have one account with every git hosting service that
> > the projects I want to contribute to happen to select. Sure, we could
> > fix that by deciding to move the entire free software development to a
> > single git hosting provider, but that creates a vendor lock in issue
> > that few people would be comfortable with (including myself).
> >
> > > The thing to consider outside of that is the exportability of the data that
> > > resides outside of git - that is to say, if you want to move from gitlab to
> > > github, or from either to some 3rd service, or to a home built service, is there
> > > a way to export/import all that merge request and issue data, and honestly I
> > > don't know the answer to that, yet.  I can see ways that it could be done, but
> > > am completely unsure as to how it should be done.
> >
> > There's one way, and we have it today, it's called e-mail :-) Jokes
> > aside, a bi-directional e-mail gateway would allow interoperability
> > between services, and wouldn't require me to create an account with the
> > hosting provider you happen to favour, or the other way around. The
> > issue with e-mail gateways is that e-mail clients (and users) are
> > notorously bad at keeping formatting intact, so the e-mail to hosted
> > service direction is pretty unreliable. I would prefer investigating how
> > that could be improved instead of picking which vendor we'll get our
> > handcuffs from, as it would then benefit everybody.
> 
> Would it make sense to allow the user to run the web based merge
> request tool locally (think git instaweb), and send it out as an emailed
> patch series?
> 
> Gr{oetje,eeting}s,
> 
If I understand your suggestion correctly, thats what the tooling
project I posted earlier does.  It creates a git porcelain command (git
lab), with (among other subcommands), a git lab createmr command that:
a) uses the gitlab rest api to create a merge request from your local
git tree
and
b) emails the same patch series to a pre-configured list

Neil

>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

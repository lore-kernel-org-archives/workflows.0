Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64609C4360C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 19:42:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31CFB2190F
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 19:42:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfJJTmd (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 15:42:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:44566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbfJJTmc (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 10 Oct 2019 15:42:32 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0B07021835;
        Thu, 10 Oct 2019 19:42:30 +0000 (UTC)
Date:   Thu, 10 Oct 2019 15:42:29 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191010154229.2a986f72@gandalf.local.home>
In-Reply-To: <20191010150729.1355f33d@coco.lan>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
        <20191010150729.1355f33d@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 10 Oct 2019 15:07:29 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Em Thu, 10 Oct 2019 10:41:50 -0400
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> escreveu:
> 
> > Hi, all:
> > 
> > I would like to propose a new (large) feature to patchwork with the goal 
> > to make the process of submitting a patch easier for newbies and people 
> > generally less familiar with patch-based development. This was discussed 
> > previously on the workflows list: 
> > https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/
> > 
> > How I envision this would work:
> > 
> > - user creates an account (which requires a mail confirmation)
> > - they choose a "submit patch" option from the menu
> > - the patch submission screen has a succession of screens:
> > 
> >   1. a screen with a single field allowing a user to paste a URL to 
> >      their fork of the git repository.   
> 
> This will raise the bar, as it will force all developers to have a
> public site to host the tree. I guess only a fraction of the 4k kernel
> devs have it... In special, the ones that just want to send us a patch
> fixing a bug may have serious troubles implementing that.

A lot of people are going the way of gitlab/github. I don't think this
raises the bar very high. Anyone can trivially get a public git
repository somewhere.

We can still have email coming in for those die hards, as long as we
have someone to proxy it in. Note, I'm closer to one of the die hards,
but I see where the world is heading.

> 
> > Once submitted, patchwork does a 
> >      "git ls-remote" to attempt to get a list of refs and to verify that 
> >      this is indeed a valid git repository
> > 
> >   2. next screen asks the user to select the ref to work from using the 
> >      list obtained from the remote. Once submitted, patchwork performs a 
> >      `git clone --reference` to clone the repository locally using a 
> >      local fork of the same repo to minimize object transfer. This part 
> >      requires that:
> >        a. patchwork project is configured with a path to a local fork, 
> >           if this feature is enabled for a project
> >        b. that fork is kept current via some mechanism outside of 
> >           patchwork (e.g. with grokmirror)
> >        c. there is some sanity-checking during the clone process to 
> >           avoid abuse (e.g. a sane timeout, a tmpdir with limited size, 
> >           etc -- other suggestions welcome)  
> 
> That would require a high bandwidth at the machine with as patchwork.

Which most solutions may not be able to avoid this.

> 
> Also, doesn't sound a good idea to me, as the server may end by having
> tons of open sections, most waiting for tens of minutes, in order to
> complete git clone.
> 
> > 
> >   3. next screen asks the user to pick a starting commit from the log.  
> >      Once submitted, patchwork generates the patch from the commit 
> >      provided to the tip of the branch selected by the user earlier,
> >      using git format-patch.
> > 
> >   4. next screen asks the user to review the patch to make sure this is 
> >      what they want to submit. Once confirmed, patchwork performs two 
> >      admin-defined optional hooks:
> > 
> >        a. a hook to generate a list of cc's (e.g. get_maintainer.pl)
> >        b. a sanity check hook (e.g. checkpatch.pl)
> > 
> >   5. if sanity checking is defined, next screen shows the output of the 
> >      sanity check hook, asking confirmation to proceed.
> > 
> >   6. next screen shows the user three fields:
> > 
> >        a. title of the patch/series
> >        b. cover letter for the patch/series
> >        c. message-id of the previous patch revision (can be picked from 
> >           the list of previously submitted series by this user -- 
> >           patchwork should have them already)
> >        d. number of the revision (can be auto-filled if previous field 
> >           is provided) and other tags to include in []
> > 
> >   7. next screen shows final review of what would be sent out to the 
> >      list (and cc's, if the hook to get cc's is defined and returned any 
> >      results). Once submitted, patchwork sends the patch/series using 
> >      patchwork's envelope-from and the user's own email in the From: 
> >      header.
> > 
> >   8. once sent successfully, cleanups are performed (also needs to be 
> >      done as part of the regular cron job, for any aborted attempts)
> > 
> > I know this is a pretty big RFE, and I would like to hear your thoughts 
> > about this. If there is general agreement that this is doable/good idea, 
> > I may be able to come up with funding for this development as part of 
> > the overall tooling improvement proposal.  
> 
> The procedure itself is not bad, but, if implemented, IMHO, it should,
> instead, be something that will run at the machine of the one submitting
> the patch. For instance, this could be a perl or python script inside 
> Kernel's ./script directory that would handle everything locally, and
> then submit the patch via patchwork's REST API.
> 
> By using the REST API, it would avoid the need of having to do special
> e-mail setups for the casual developers.

I agree that having the most work done on the submitter's side is
probably the best. But we need to be very careful about security in any
way we do this.

-- Steve

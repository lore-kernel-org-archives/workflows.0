Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCF5C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 17:37:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4D8821835
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570815478;
	bh=qTX0WS/4AuCAFYzPBTdvA4ezBpnFjDR+CgawJwTBuKw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=nX/yrzU60jy8djpIx9/Z0+2g1YySpa/y3NiXUjlYCNpDkTRF38t1DJ0qFt7e2qZVR
	 6G5pE2KsowUtQI50cdaExEFkhGb4c7gCegkJQEjxCttKOISzNqH9R0xOVyRpQs8BYs
	 +HHRSajx2iXp6jjBzXZuprckgk9Y9vqENaAl34M8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbfJKRh6 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 13:37:58 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48444 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728416AbfJKRh6 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 13:37:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=EPHLEYc2lb5UzsQssSTPnMziMMFQ5s/xdnv897JkDm8=; b=rf2OJMzLfYsCSDYGs9W+tA09z
        UOfrzzkUyS43dJV9/F7fPlRWOzGuORqo5bZ+PIT+ffrm40/ZZwh3kwSXq7EVfPXavakfWTNTqdnjX
        k+693hUilyQg6rLAOtpHPdh71+FnkCcD//GoCLD8l9SsNsLYIfANuzk08hZkt5yOw2w2q43Eb+32X
        D7a5+OATcQRCvz3lfMzgoa+gU/Y2LqzZ6oaeAAQTTbS7EN4KfN1FhvshAv/AASpBLOkO6/XZp+E0f
        KQllZKl6s4F0toCDLN3gaFzNHPJMVUw7V4toofhjEsBQ4i7ApXrhThTpmXAusK6rhGEV6aQpQ3BKy
        sj0NwEZuw==;
Received: from 177.17.141.107.dynamic.adsl.gvt.net.br ([177.17.141.107] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iIyrU-00005J-GM; Fri, 11 Oct 2019 17:37:56 +0000
Date:   Fri, 11 Oct 2019 14:37:52 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011143744.4291b42d@coco.lan>
In-Reply-To: <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
        <20191011085702.GB1075470@kroah.com>
        <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Em Fri, 11 Oct 2019 11:20:17 -0600
Shuah Khan <skhan@linuxfoundation.org> escreveu:

> On 10/11/19 2:57 AM, Greg KH wrote:
> > On Thu, Oct 10, 2019 at 10:41:50AM -0400, Konstantin Ryabitsev wrote:  
> >> Hi, all:
> >>
> >> I would like to propose a new (large) feature to patchwork with the goal to
> >> make the process of submitting a patch easier for newbies and people
> >> generally less familiar with patch-based development. This was discussed
> >> previously on the workflows list:
> >> https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/
> >>
> >> How I envision this would work:
> >>
> >> - user creates an account (which requires a mail confirmation) >> - they choose a "submit patch" option from the menu
> >> - the patch submission screen has a succession of screens:
> >>
> >>   1. a screen with a single field allowing a user to paste a URL to     their
> >> fork of the git repository. Once submitted, patchwork does a     "git
> >> ls-remote" to attempt to get a list of refs and to verify that     this is
> >> indeed a valid git repository  
> > 
> > s/valid git repository/valid git repository based on the kernel git tree/
> > 
> > Otherwise you might be sending out lots of emails for other projects :)
> >   
> >>
> >>   2. next screen asks the user to select the ref to work from using the
> >> list obtained from the remote. Once submitted, patchwork performs a     `git
> >> clone --reference` to clone the repository locally using a     local fork of
> >> the same repo to minimize object transfer. This part     requires that:
> >>        a. patchwork project is configured with a path to a local fork,
> >> if this feature is enabled for a project
> >>        b. that fork is kept current via some mechanism outside of
> >> patchwork (e.g. with grokmirror)
> >>        c. there is some sanity-checking during the clone process to
> >> avoid abuse (e.g. a sane timeout, a tmpdir with limited size,          etc
> >> -- other suggestions welcome)
> >>
> >>   3. next screen asks the user to pick a starting commit from the log.
> >> Once submitted, patchwork generates the patch from the commit     provided
> >> to the tip of the branch selected by the user earlier,
> >>      using git format-patch.
> >>
> >>   4. next screen asks the user to review the patch to make sure this is
> >> what they want to submit. Once confirmed, patchwork performs two
> >> admin-defined optional hooks:
> >>
> >>        a. a hook to generate a list of cc's (e.g. get_maintainer.pl)
> >>        b. a sanity check hook (e.g. checkpatch.pl)  
> > 
> > I will note that many "first patch" submissions are checkpatch.pl
> > cleanups for staging.  When doing that, I require that they do "one
> > logical change per patch", which means that many of the individual
> > patches themselves will not be checkpatch.pl clean, because many lines
> > have multiple issues with them (tabs, spaces, format, length, etc.)
> > 
> > So other than that minor thing, sounds interesting.  It's hard to
> > determine just how difficult the whole "set up git and send a patch out"
> > process is for people these days given the _huge_ numbers of new
> > contributions we keep getting, and the numerous good tutorials we have
> > created that spell out exactly how to do this.
> > 
> > So you might be "solving" a problem that we don't really have.  It's
> > hard to tell :(
> >   
> 
> I agree with this. I don't think this a problem that is worth solving.
> When a new developer wants to send a patch, they don't need to create
> any accounts. They setup their email client and send patch.
> 
> We have several resources that walk them through setting up email
> clients and sending patches. checkpatch.pl can be automated with
> git hooks.
> 
> >> I know this is a pretty big RFE, and I would like to hear your thoughts
> >> about this. If there is general agreement that this is doable/good idea, I
> >> may be able to come up with funding for this development as part of the
> >> overall tooling improvement proposal.  
> > 
> > The workflow seems sane, and matches what most people do today, with the
> > exception that it "solves" the git send-email issue, right?  Is that our
> > biggest barrier?
> > 
> > I would recommend interviewing some of the recent kernel mentor project
> > and outreachy applicants first, to try to determine exactly what their
> > problems, if any, were with our development process.  If they say that
> > this type of tool/workflow would have saved them hours of time and
> > energy, then that's a great indication that we should try to do this.
> >   
> 
> I would say considering the number of applicants to mentorship program
> and new developers it will be lot overhead to require them to create
> patchwork accounts, and it might even be hard overtime. A lot of them
> start out and drop out in the middle. With the current setup, nothing
> to cleanup.
> 
> Setting up email clients and git hooks is one time task. It is the
> easiest of the learning curve for many new developers. New developers
> struggle with getting the change logs right, coding styles right, and
> responding to review comments and acting on them.
> 
> These aren't something that can be automated and they just have to
> learn through experience of sending patches.
> 
> My opinion based on contact with new developers as well running the
> mentorship program, I would sat this isn't something that needs
> solving.

I agree with Shuah. From time to time, we have one time only patch
submission from people that just want to fix something that affects
his machine.

The learning curve for such submissions is usually fast. It only takes one
or two e-mails to be exchanged with the person wanting to submit his
stuff in order to teach them how to do it.

Ok, there's always space to optimize it. 

For example, having something like:

	./scripts/submit_patches

That would automatically do whatever needed to check if patches are ok and
to submit them from origin/master to upstream would be great.

Such script should of course verify if the subject and descriptions appear
to be coherent, it should run checkpatch, run make with some options like
W=1 and check if the number of patches is below a certain default 
(let's say, 10 patches) - in order to prevent newbies to spam our mailing
lists. 

Another thing is to add a web interface for patch submission and requiring
people to open an account at github/gitlab (or on some other git hosting
service). That sounds a lot more complex than what we already have today.

Thanks,
Mauro

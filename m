Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A9EC4CECE
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 15:27:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46AE021835
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 15:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H7E8Jzw/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387495AbfJNP1g (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 11:27:36 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58250 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732968AbfJNP1f (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 11:27:35 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 078F451F;
        Mon, 14 Oct 2019 17:27:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571066854;
        bh=lj/rwuv7mKaCqlupTnIkzzqjKBUzNHkugb1JPVuD1pE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H7E8Jzw/CcwLrY6r90Dn3kMWSp6N8cLN006NoIiYHHlld95YqWcFUSBNQuhY5hbdq
         eRmRuTKXNdfkNngTfQ0hA3XOEmuKKw0iZ4luOiSbRhb9ONWCkg5dN7g9Eq/tk4VYkm
         PPczNt3V7U/xguwGJf9Y7yRGYtpM4ZtI2aC5MFkY=
Date:   Mon, 14 Oct 2019 18:27:31 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191014152731.GA23442@pendragon.ideasonboard.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <20191014151711.GA654561@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191014151711.GA654561@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Greg,

On Mon, Oct 14, 2019 at 05:17:11PM +0200, Greg KH wrote:
> On Mon, Oct 14, 2019 at 04:58:17PM +0200, Dmitry Vyukov wrote:
> > On Fri, Oct 11, 2019 at 7:20 PM Shuah Khan wrote:
> > > On 10/11/19 2:57 AM, Greg KH wrote:
> > > > On Thu, Oct 10, 2019 at 10:41:50AM -0400, Konstantin Ryabitsev wrote:
> > > >> Hi, all:
> > > >>
> > > >> I would like to propose a new (large) feature to patchwork with the goal to
> > > >> make the process of submitting a patch easier for newbies and people
> > > >> generally less familiar with patch-based development. This was discussed
> > > >> previously on the workflows list:
> > > >> https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/
> > > >>
> > > >> How I envision this would work:
> > > >>
> > > >> - user creates an account (which requires a mail confirmation) >> - they choose a "submit patch" option from the menu
> > > >> - the patch submission screen has a succession of screens:
> > > >>
> > > >>   1. a screen with a single field allowing a user to paste a URL to     their
> > > >> fork of the git repository. Once submitted, patchwork does a     "git
> > > >> ls-remote" to attempt to get a list of refs and to verify that     this is
> > > >> indeed a valid git repository
> > > >
> > > > s/valid git repository/valid git repository based on the kernel git tree/
> > > >
> > > > Otherwise you might be sending out lots of emails for other projects :)
> > > >
> > > >>
> > > >>   2. next screen asks the user to select the ref to work from using the
> > > >> list obtained from the remote. Once submitted, patchwork performs a     `git
> > > >> clone --reference` to clone the repository locally using a     local fork of
> > > >> the same repo to minimize object transfer. This part     requires that:
> > > >>        a. patchwork project is configured with a path to a local fork,
> > > >> if this feature is enabled for a project
> > > >>        b. that fork is kept current via some mechanism outside of
> > > >> patchwork (e.g. with grokmirror)
> > > >>        c. there is some sanity-checking during the clone process to
> > > >> avoid abuse (e.g. a sane timeout, a tmpdir with limited size,          etc
> > > >> -- other suggestions welcome)
> > > >>
> > > >>   3. next screen asks the user to pick a starting commit from the log.
> > > >> Once submitted, patchwork generates the patch from the commit     provided
> > > >> to the tip of the branch selected by the user earlier,
> > > >>      using git format-patch.
> > > >>
> > > >>   4. next screen asks the user to review the patch to make sure this is
> > > >> what they want to submit. Once confirmed, patchwork performs two
> > > >> admin-defined optional hooks:
> > > >>
> > > >>        a. a hook to generate a list of cc's (e.g. get_maintainer.pl)
> > > >>        b. a sanity check hook (e.g. checkpatch.pl)
> > > >
> > > > I will note that many "first patch" submissions are checkpatch.pl
> > > > cleanups for staging.  When doing that, I require that they do "one
> > > > logical change per patch", which means that many of the individual
> > > > patches themselves will not be checkpatch.pl clean, because many lines
> > > > have multiple issues with them (tabs, spaces, format, length, etc.)
> > > >
> > > > So other than that minor thing, sounds interesting.  It's hard to
> > > > determine just how difficult the whole "set up git and send a patch out"
> > > > process is for people these days given the _huge_ numbers of new
> > > > contributions we keep getting, and the numerous good tutorials we have
> > > > created that spell out exactly how to do this.
> > > >
> > > > So you might be "solving" a problem that we don't really have.  It's
> > > > hard to tell :(
> > > >
> > >
> > > I agree with this. I don't think this a problem that is worth solving.
> > > When a new developer wants to send a patch, they don't need to create
> > > any accounts. They setup their email client and send patch.
> > >
> > > We have several resources that walk them through setting up email
> > > clients and sending patches. checkpatch.pl can be automated with
> > > git hooks.
> > >
> > > >> I know this is a pretty big RFE, and I would like to hear your thoughts
> > > >> about this. If there is general agreement that this is doable/good idea, I
> > > >> may be able to come up with funding for this development as part of the
> > > >> overall tooling improvement proposal.
> > > >
> > > > The workflow seems sane, and matches what most people do today, with the
> > > > exception that it "solves" the git send-email issue, right?  Is that our
> > > > biggest barrier?
> > > >
> > > > I would recommend interviewing some of the recent kernel mentor project
> > > > and outreachy applicants first, to try to determine exactly what their
> > > > problems, if any, were with our development process.  If they say that
> > > > this type of tool/workflow would have saved them hours of time and
> > > > energy, then that's a great indication that we should try to do this.
> > > >
> > >
> > > I would say considering the number of applicants to mentorship program
> > > and new developers it will be lot overhead to require them to create
> > > patchwork accounts, and it might even be hard overtime. A lot of them
> > > start out and drop out in the middle. With the current setup, nothing
> > > to cleanup.
> > >
> > > Setting up email clients and git hooks is one time task. It is the
> > > easiest of the learning curve for many new developers. New developers
> > > struggle with getting the change logs right, coding styles right, and
> > > responding to review comments and acting on them.
> > >
> > > These aren't something that can be automated and they just have to
> > > learn through experience of sending patches.
> > >
> > > My opinion based on contact with new developers as well running the
> > > mentorship program, I would sat this isn't something that needs
> > > solving.
> > 
> > As one data point, I cannot send emails with git send-email anymore.
> > It used to work, then broke and I don't know how to fix it. Now it says:
> > 
> > 5.7.8 Username and Password not accepted. Learn more at
> > 5.7.8  https://support.google.com/mail/?p=BadCredentials
> > s10sm8376885wrr.5 - gsmtp
> > 
> > I suspect it has something to do with two factor auth.
> > So that's it: it cannot contribute to kernel right now.
> 
> That is because your employer changed how it manages imap.  So yes, this
> configuration is now broken, you can not contribute to the kernel this
> way.  They know about it, and there's an "opt-out" list you can sign up
> for if you want to fix it.  Nothing the community can do about something
> crazy like this.
> 
> > As another data point, I spoke to KP Singh at the Plumbers. He is a
> > "returning" kernel developer (so already did this before), he said it
> > took him 3 days and 52 configurations changes (all were committed to
> > git, so was possible to count exactly) to setup mail client properly.
> > And he is "staffed" to do kernel work, I would expect that most people
> > who don't _have_ to do kernel contributions will turn away half-way.
> > 
> > As another data point, several people told me that they are afraid of
> > sending kernel patches b/c there is so much "on you" to do right.
> > 
> > I would say that we need to aim at  a process that does not require a
> > friendly experienced person to answer any of your questions in the
> > common case. Lots of people will simply not ask any questions.
> 
> Again, interview the outreachy and mentorship applicants and see what
> they say about this.
> 
> All corporate email systems do crazy things with email to help prevent
> them from participating in Linux kernel development.  We have known this
> for decades.  Is it the community's job to fix that, or is it the
> individual company's job to do that for when they want to have people
> participate?

As I have replied separately, I don't think it's our duty to fix
corporate e-mail servers, but when we know about common issues with
large e-mail providers, and especially when we know of possible
workarounds, I think it would be useful to centralise that information
in a place that newcomers can easily find.

> There's a good reason almost all Linux groups at companies have a Linux
> email server in the corner from which to send out patches from.  This
> started 2 decades ago with IBM, and continues to this day with many many
> many other companies.  That's proof that if a company does want to
> participate, it will do the needed work to do so.
> 
> But that's not the group of people we are trying to help here, are we?
> I can't tell, there seems to be complaints from both sides (newbies and
> companies...)

-- 
Regards,

Laurent Pinchart

Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F0EC10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:30:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F4EC2086A
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:30:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PIZ7jPRm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728195AbfJOQaL (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 12:30:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56764 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387917AbfJOQaL (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 12:30:11 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E241E324;
        Tue, 15 Oct 2019 18:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571157008;
        bh=UOGzS7Mm5rf7UoH92XmkrDFCAiQlszNsOckS9bZuvg4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PIZ7jPRmjEwSHMk3qhWsh5s0H6fM/uiE3RfMefC7TK7Gb9spjSLjbbKFKYAVRTtYA
         bVdfNVwpWXGnUZtTR70WnPHOIvNGeG9TicDyco22Eh+wvQmafoqyaBikRcoX8k/+6p
         O3b0T5mBt5+50b6R/z/oJoiCufqkgXxE/EHVvWyc=
Date:   Tue, 15 Oct 2019 19:30:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org,
        KP Singh <kpsingh@google.com>
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015163005.GH4875@pendragon.ideasonboard.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <20191014151240.GA19861@pendragon.ideasonboard.com>
 <CACT4Y+YsGrLr5oeQ5pH2cV6bgXPY9y6X=VD+5zKTQTbbqVpbQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACT4Y+YsGrLr5oeQ5pH2cV6bgXPY9y6X=VD+5zKTQTbbqVpbQA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Dmitry,

On Tue, Oct 15, 2019 at 06:49:27AM +0200, Dmitry Vyukov wrote:
> On Mon, Oct 14, 2019 at 5:12 PM Laurent Pinchart wrote:
> > On Mon, Oct 14, 2019 at 04:58:17PM +0200, Dmitry Vyukov wrote:
> >> On Fri, Oct 11, 2019 at 7:20 PM Shuah Khan wrote:
> >>> On 10/11/19 2:57 AM, Greg KH wrote:
> >>>> On Thu, Oct 10, 2019 at 10:41:50AM -0400, Konstantin Ryabitsev wrote:
> >>>>> Hi, all:
> >>>>>
> >>>>> I would like to propose a new (large) feature to patchwork with the goal to
> >>>>> make the process of submitting a patch easier for newbies and people
> >>>>> generally less familiar with patch-based development. This was discussed
> >>>>> previously on the workflows list:
> >>>>> https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/
> >>>>>
> >>>>> How I envision this would work:
> >>>>>
> >>>>> - user creates an account (which requires a mail confirmation) >> - they choose a "submit patch" option from the menu
> >>>>> - the patch submission screen has a succession of screens:
> >>>>>
> >>>>>   1. a screen with a single field allowing a user to paste a URL to     their
> >>>>> fork of the git repository. Once submitted, patchwork does a     "git
> >>>>> ls-remote" to attempt to get a list of refs and to verify that     this is
> >>>>> indeed a valid git repository
> >>>>
> >>>> s/valid git repository/valid git repository based on the kernel git tree/
> >>>>
> >>>> Otherwise you might be sending out lots of emails for other projects :)
> >>>>
> >>>>>   2. next screen asks the user to select the ref to work from using the
> >>>>> list obtained from the remote. Once submitted, patchwork performs a     `git
> >>>>> clone --reference` to clone the repository locally using a     local fork of
> >>>>> the same repo to minimize object transfer. This part     requires that:
> >>>>>        a. patchwork project is configured with a path to a local fork,
> >>>>> if this feature is enabled for a project
> >>>>>        b. that fork is kept current via some mechanism outside of
> >>>>> patchwork (e.g. with grokmirror)
> >>>>>        c. there is some sanity-checking during the clone process to
> >>>>> avoid abuse (e.g. a sane timeout, a tmpdir with limited size,          etc
> >>>>> -- other suggestions welcome)
> >>>>>
> >>>>>   3. next screen asks the user to pick a starting commit from the log.
> >>>>> Once submitted, patchwork generates the patch from the commit     provided
> >>>>> to the tip of the branch selected by the user earlier,
> >>>>>      using git format-patch.
> >>>>>
> >>>>>   4. next screen asks the user to review the patch to make sure this is
> >>>>> what they want to submit. Once confirmed, patchwork performs two
> >>>>> admin-defined optional hooks:
> >>>>>
> >>>>>        a. a hook to generate a list of cc's (e.g. get_maintainer.pl)
> >>>>>        b. a sanity check hook (e.g. checkpatch.pl)
> >>>>
> >>>> I will note that many "first patch" submissions are checkpatch.pl
> >>>> cleanups for staging.  When doing that, I require that they do "one
> >>>> logical change per patch", which means that many of the individual
> >>>> patches themselves will not be checkpatch.pl clean, because many lines
> >>>> have multiple issues with them (tabs, spaces, format, length, etc.)
> >>>>
> >>>> So other than that minor thing, sounds interesting.  It's hard to
> >>>> determine just how difficult the whole "set up git and send a patch out"
> >>>> process is for people these days given the _huge_ numbers of new
> >>>> contributions we keep getting, and the numerous good tutorials we have
> >>>> created that spell out exactly how to do this.
> >>>>
> >>>> So you might be "solving" a problem that we don't really have.  It's
> >>>> hard to tell :(
> >>>
> >>> I agree with this. I don't think this a problem that is worth solving.
> >>> When a new developer wants to send a patch, they don't need to create
> >>> any accounts. They setup their email client and send patch.
> >>>
> >>> We have several resources that walk them through setting up email
> >>> clients and sending patches. checkpatch.pl can be automated with
> >>> git hooks.
> >>>
> >>>>> I know this is a pretty big RFE, and I would like to hear your thoughts
> >>>>> about this. If there is general agreement that this is doable/good idea, I
> >>>>> may be able to come up with funding for this development as part of the
> >>>>> overall tooling improvement proposal.
> >>>>
> >>>> The workflow seems sane, and matches what most people do today, with the
> >>>> exception that it "solves" the git send-email issue, right?  Is that our
> >>>> biggest barrier?
> >>>>
> >>>> I would recommend interviewing some of the recent kernel mentor project
> >>>> and outreachy applicants first, to try to determine exactly what their
> >>>> problems, if any, were with our development process.  If they say that
> >>>> this type of tool/workflow would have saved them hours of time and
> >>>> energy, then that's a great indication that we should try to do this.
> >>>
> >>> I would say considering the number of applicants to mentorship program
> >>> and new developers it will be lot overhead to require them to create
> >>> patchwork accounts, and it might even be hard overtime. A lot of them
> >>> start out and drop out in the middle. With the current setup, nothing
> >>> to cleanup.
> >>>
> >>> Setting up email clients and git hooks is one time task. It is the
> >>> easiest of the learning curve for many new developers. New developers
> >>> struggle with getting the change logs right, coding styles right, and
> >>> responding to review comments and acting on them.
> >>>
> >>> These aren't something that can be automated and they just have to
> >>> learn through experience of sending patches.
> >>>
> >>> My opinion based on contact with new developers as well running the
> >>> mentorship program, I would sat this isn't something that needs
> >>> solving.
> >>
> >> As one data point, I cannot send emails with git send-email anymore.
> >> It used to work, then broke and I don't know how to fix it. Now it says:
> >>
> >> 5.7.8 Username and Password not accepted. Learn more at
> >> 5.7.8  https://support.google.com/mail/?p=BadCredentials
> >> s10sm8376885wrr.5 - gsmtp
> >>
> >> I suspect it has something to do with two factor auth.
> >> So that's it: it cannot contribute to kernel right now.
> >> I will not consider time spent fixing it as useful time investment.
> >
> > Starting from an estalished working process, a change on your e-mail
> > provider side broke your workflow. The exact same problem could happen
> > regardless of how changes get submitted, a corporate HTTP proxy or
> > firewall could also break HTTP-based submissions.
> 
> If the network is down or firewalled, that's one problem. But for
> email we involve another third party. So it's not exactly as own app
> server.

Network or firewall are most of the time third parties as well, and it's
up to you to pick providers that play fair. There's more to the world
than gmail, and if one prefers to give up freedom for some temporary
ease of use, then one shouldn't be surprised to end up with neither.

> > Now, gmail being one of the largest e-mail providers, I think it's fair
> > to consider that the kernel community should provide clear and easy to
> > follow instructions on how to use git-send-email with gmail. In
> > particular, with two-factor authentication being widespread, how to set
> > it up with git-send-email should likely be described in
> > https://www.kernel.org/doc/html/latest/process/email-clients.html.
> > Blaming it solely on the SMTP protocol is a bit of a shortcut.
> >
> >> Any kernel documentation that I can find for gmail, mentions config
> >> that I am already using and that is not working:
> >> https://www.kernel.org/doc/html/latest/search.html?q=gmail&check_keywords=yes&area=default#
> >> https://www.kernel.org/doc/html/latest/process/email-clients.html?highlight=gmail
> >>
> >> As another data point, I spoke to KP Singh at the Plumbers. He is a
> >> "returning" kernel developer (so already did this before), he said it
> >> took him 3 days and 52 configurations changes (all were committed to
> >> git, so was possible to count exactly) to setup mail client properly.
> >> And he is "staffed" to do kernel work, I would expect that most people
> >> who don't _have_ to do kernel contributions will turn away half-way.
> >
> > That's very interesting information, is there any way that more details
> > about the 52 steps could be shared ?
> 
> +KP you told me that it was hard to setup a mail client on Plumbers.
> Did I get the numbers right? You have any details for that?
> 
> >> As another data point, several people told me that they are afraid of
> >> sending kernel patches b/c there is so much "on you" to do right.
> >
> > Is that related to the submission mechanism, or to all the other things
> > you need to get right ?
> 
> Email is part of this.
> 
> >> I would say that we need to aim at  a process that does not require a
> >> friendly experienced person to answer any of your questions in the
> >> common case. Lots of people will simply not ask any questions.
> >
> > I fully agree with that.

-- 
Regards,

Laurent Pinchart

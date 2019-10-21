Return-Path: <SRS0=C+WN=YO=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95F7CA9EAF
	for <workflows@archiver.kernel.org>; Mon, 21 Oct 2019 11:16:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82AC4206C2
	for <workflows@archiver.kernel.org>; Mon, 21 Oct 2019 11:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tZz7eRNl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbfJULQo (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 21 Oct 2019 07:16:44 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46024 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727831AbfJULQo (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 21 Oct 2019 07:16:44 -0400
Received: by mail-qk1-f195.google.com with SMTP id q70so4626869qke.12
        for <workflows@vger.kernel.org>; Mon, 21 Oct 2019 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I7HDqlovTWFXgZG5lFeXS0blu+MDoVkvU9HPoV8e7wM=;
        b=tZz7eRNlHnR57BGlc07Qh+OmO7JuZuZsonpMpzdHgK3axDs0W4p0NTy9N+I7kUmNP5
         8Q6LarW1T03mS888pCHwicSNvEjiIsS5BpwnTeXmQc9wFN27ZeXta6iXkGMLCEg/qObc
         rjf0GKdvy9wYB1ED+iUSffhDFlWR+OPTidUKuyHNAX90ygbblLn5SWJ8P77gDLXmhoLH
         nzP8KoqpV9rd/rDCfAum+aCdPZ6F92et3OqzD+rYHphf4GJ2/ICPUiLUhfukoOud9ydv
         FS8QeL4y9Ti0DdhPx/Z/BVPgnUOtk5diffRgGPcEWMCDVxLjQPxB8WRKT1Dr/Usgv5WE
         bkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I7HDqlovTWFXgZG5lFeXS0blu+MDoVkvU9HPoV8e7wM=;
        b=VFsBRF+EmDqiEeKTGM1Z3f9HXxlm1zjZP+pnLdCedNFB6tZTP27qM8eOOH/L95qaTZ
         rlkr+EA4NC5cyE8xqzE4/U5s91JNiCdPouTmZwZKnoCXd7D8KprNRaDgqwFmXMmVfHkQ
         mE9HnhvTrjqGSJveBSPfRnyUvT8+Inm9tjLfYsCsU6zU03DODq9pxv9wqZ6ep8BdsYd+
         8T0Hs9EtP2BU32SlPZD2KhiFUvhk64PGj0+XtpiQ0RGfiIRQcuRgz6LTWTr7toKxhJ50
         OGrDqSy1vkebc2MNQG+/1QjvrykWmBmA7/UpKp7n6Spazsu5PFMMicb3mCpTJ1f9RCye
         pfSw==
X-Gm-Message-State: APjAAAX2oIhPwfCdMcyKscH+Ospf3ppm4pWe8t97si4NXEpjCkxxJJUy
        aOQB1TWoTr99N881j/qoeCr8krWp1YPCl/R9lGVouQ==
X-Google-Smtp-Source: APXvYqz3jg7zY5VnAoZXS3NT7M9QIs6g6J+zYf5uFv03dOmcEcohb7O/xP0Olu1jjRj3wEmxTixmXNG8Bk7GQ2gI5jQ=
X-Received: by 2002:a05:620a:6b6:: with SMTP id i22mr21326895qkh.256.1571656602152;
 Mon, 21 Oct 2019 04:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
In-Reply-To: <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 21 Oct 2019 13:16:29 +0200
Message-ID: <CACT4Y+a29c=SYV_fNghFQpb0zLWFU-c4cs-etxx4EfKgWBGOow@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 4:58 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Fri, Oct 11, 2019 at 7:20 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
> >
> > On 10/11/19 2:57 AM, Greg KH wrote:
> > > On Thu, Oct 10, 2019 at 10:41:50AM -0400, Konstantin Ryabitsev wrote:
> > >> Hi, all:
> > >>
> > >> I would like to propose a new (large) feature to patchwork with the goal to
> > >> make the process of submitting a patch easier for newbies and people
> > >> generally less familiar with patch-based development. This was discussed
> > >> previously on the workflows list:
> > >> https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/
> > >>
> > >> How I envision this would work:
> > >>
> > >> - user creates an account (which requires a mail confirmation) >> - they choose a "submit patch" option from the menu
> > >> - the patch submission screen has a succession of screens:
> > >>
> > >>   1. a screen with a single field allowing a user to paste a URL to     their
> > >> fork of the git repository. Once submitted, patchwork does a     "git
> > >> ls-remote" to attempt to get a list of refs and to verify that     this is
> > >> indeed a valid git repository
> > >
> > > s/valid git repository/valid git repository based on the kernel git tree/
> > >
> > > Otherwise you might be sending out lots of emails for other projects :)
> > >
> > >>
> > >>   2. next screen asks the user to select the ref to work from using the
> > >> list obtained from the remote. Once submitted, patchwork performs a     `git
> > >> clone --reference` to clone the repository locally using a     local fork of
> > >> the same repo to minimize object transfer. This part     requires that:
> > >>        a. patchwork project is configured with a path to a local fork,
> > >> if this feature is enabled for a project
> > >>        b. that fork is kept current via some mechanism outside of
> > >> patchwork (e.g. with grokmirror)
> > >>        c. there is some sanity-checking during the clone process to
> > >> avoid abuse (e.g. a sane timeout, a tmpdir with limited size,          etc
> > >> -- other suggestions welcome)
> > >>
> > >>   3. next screen asks the user to pick a starting commit from the log.
> > >> Once submitted, patchwork generates the patch from the commit     provided
> > >> to the tip of the branch selected by the user earlier,
> > >>      using git format-patch.
> > >>
> > >>   4. next screen asks the user to review the patch to make sure this is
> > >> what they want to submit. Once confirmed, patchwork performs two
> > >> admin-defined optional hooks:
> > >>
> > >>        a. a hook to generate a list of cc's (e.g. get_maintainer.pl)
> > >>        b. a sanity check hook (e.g. checkpatch.pl)
> > >
> > > I will note that many "first patch" submissions are checkpatch.pl
> > > cleanups for staging.  When doing that, I require that they do "one
> > > logical change per patch", which means that many of the individual
> > > patches themselves will not be checkpatch.pl clean, because many lines
> > > have multiple issues with them (tabs, spaces, format, length, etc.)
> > >
> > > So other than that minor thing, sounds interesting.  It's hard to
> > > determine just how difficult the whole "set up git and send a patch out"
> > > process is for people these days given the _huge_ numbers of new
> > > contributions we keep getting, and the numerous good tutorials we have
> > > created that spell out exactly how to do this.
> > >
> > > So you might be "solving" a problem that we don't really have.  It's
> > > hard to tell :(
> > >
> >
> > I agree with this. I don't think this a problem that is worth solving.
> > When a new developer wants to send a patch, they don't need to create
> > any accounts. They setup their email client and send patch.
> >
> > We have several resources that walk them through setting up email
> > clients and sending patches. checkpatch.pl can be automated with
> > git hooks.
> >
> > >> I know this is a pretty big RFE, and I would like to hear your thoughts
> > >> about this. If there is general agreement that this is doable/good idea, I
> > >> may be able to come up with funding for this development as part of the
> > >> overall tooling improvement proposal.
> > >
> > > The workflow seems sane, and matches what most people do today, with the
> > > exception that it "solves" the git send-email issue, right?  Is that our
> > > biggest barrier?
> > >
> > > I would recommend interviewing some of the recent kernel mentor project
> > > and outreachy applicants first, to try to determine exactly what their
> > > problems, if any, were with our development process.  If they say that
> > > this type of tool/workflow would have saved them hours of time and
> > > energy, then that's a great indication that we should try to do this.
> > >
> >
> > I would say considering the number of applicants to mentorship program
> > and new developers it will be lot overhead to require them to create
> > patchwork accounts, and it might even be hard overtime. A lot of them
> > start out and drop out in the middle. With the current setup, nothing
> > to cleanup.
> >
> > Setting up email clients and git hooks is one time task. It is the
> > easiest of the learning curve for many new developers. New developers
> > struggle with getting the change logs right, coding styles right, and
> > responding to review comments and acting on them.
> >
> > These aren't something that can be automated and they just have to
> > learn through experience of sending patches.
> >
> > My opinion based on contact with new developers as well running the
> > mentorship program, I would sat this isn't something that needs
> > solving.
> >
> > thanks,
> > -- Shuah
>
>
> As one data point, I cannot send emails with git send-email anymore.
> It used to work, then broke and I don't know how to fix it. Now it says:
>
> 5.7.8 Username and Password not accepted. Learn more at
> 5.7.8  https://support.google.com/mail/?p=BadCredentials
> s10sm8376885wrr.5 - gsmtp
>
> I suspect it has something to do with two factor auth.
> So that's it: it cannot contribute to kernel right now.
> I will not consider time spent fixing it as useful time investment.
>
> Any kernel documentation that I can find for gmail, mentions config
> that I am already using and that is not working:
> https://www.kernel.org/doc/html/latest/search.html?q=gmail&check_keywords=yes&area=default#
> https://www.kernel.org/doc/html/latest/process/email-clients.html?highlight=gmail
>
> As another data point, I spoke to KP Singh at the Plumbers. He is a
> "returning" kernel developer (so already did this before), he said it
> took him 3 days and 52 configurations changes (all were committed to
> git, so was possible to count exactly) to setup mail client properly.
> And he is "staffed" to do kernel work, I would expect that most people
> who don't _have_ to do kernel contributions will turn away half-way.
>
> As another data point, several people told me that they are afraid of
> sending kernel patches b/c there is so much "on you" to do right.
>
> I would say that we need to aim at  a process that does not require a
> friendly experienced person to answer any of your questions in the
> common case. Lots of people will simply not ask any questions.

Just arrived: lost emails and patches:
https://groups.google.com/d/msg/syzkaller-bugs/GSD7eiEJm5M/XyKMJ_v8BAAJ

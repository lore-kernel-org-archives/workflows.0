Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDB47C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 04:49:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A09F72089C
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 04:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nw18VpCE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbfJOEtl (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 00:49:41 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36696 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbfJOEtl (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 00:49:41 -0400
Received: by mail-qt1-f196.google.com with SMTP id o12so28774367qtf.3
        for <workflows@vger.kernel.org>; Mon, 14 Oct 2019 21:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s+Vh3keDmlvcewi6PNSCIms5oZtn2iS9IOB9eveM0UE=;
        b=Nw18VpCEgpTJG4/TepN77/foCRlQfAr4/SwD4ZZvoi8S1ZTNfPZA78q2Bkkhx8fqWW
         aQIYpBZF6IcYihA7tIt0GfVyPDBE9Km4IgwtYfSpMX8K4OO0ojCgEPuUNQyH8mHZwOQR
         lzqimmCyYJCdLlGVA2f7HJCjq0/gkpCHP84KSraX5eq4yqOsTqauYNlw3a2iBZpPQqTW
         sr51rcZM3ISqinQXgvwzJM5lSlpY9lZnLV/sDUet9QXtIhNLBMRfBdV51xKBdmIGRiRu
         0XB5oQKqEl2nqsbhDv/KQzi6YwjAMBP35J7QPwfF8fi+rzv+zyZy9LqGD3Jc4by4n6Tg
         LZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s+Vh3keDmlvcewi6PNSCIms5oZtn2iS9IOB9eveM0UE=;
        b=pyWyL7AlAN3cYseQb8NKhL3zhGMivPmXyWQd07ni8yJryQgmCN0DIsC9Wyrc+SMVb4
         jfvKOAtwY/ADxMdyFeQuEHKZu49c5tSDb60fMVP7MpRPvCSAW+TsObQpWAOV5ZlQB8OC
         BSNKFRJiXDMlrDZ3EBYD2Yl0DgoGf9101MxfkXDBe3Qy/h9u3cAJK7uA9edWvas1lhzO
         PFpYmzuQRCZnbdcwYQrFpEnpgoz2ZrZjNjnBL57PVTmlB1IJrsNP43yVNkP34GaV3AzI
         TblBBHaxouRIAOPLbQVfGHMHkLD4ymZxciJqHorqMSWO3sqFU3tWABJ20KYo1cdpy7w9
         ZrLg==
X-Gm-Message-State: APjAAAWoSuvxjM5HIYtWQVZfy0Jm5Zw5Wp2Tw7tDR4Hm5KBmzGb665Z8
        v+M54X4liVVpNlykYid/lmsAvlViGc47vJH8Ymj9Vg==
X-Google-Smtp-Source: APXvYqy/+DrcAJX/2byab4zgHW6chc8DymX2MQ4Fun4H/6QyTzliMO5tAWQj9DQxS5novIISj+MIz/Jac9JfXJCbjng=
X-Received: by 2002:a0c:e2c9:: with SMTP id t9mr33882062qvl.22.1571114979043;
 Mon, 14 Oct 2019 21:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com> <20191014151240.GA19861@pendragon.ideasonboard.com>
In-Reply-To: <20191014151240.GA19861@pendragon.ideasonboard.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 15 Oct 2019 06:49:27 +0200
Message-ID: <CACT4Y+YsGrLr5oeQ5pH2cV6bgXPY9y6X=VD+5zKTQTbbqVpbQA@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org,
        KP Singh <kpsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Oct 14, 2019 at 5:12 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dmitry,
>
> On Mon, Oct 14, 2019 at 04:58:17PM +0200, Dmitry Vyukov wrote:
> > On Fri, Oct 11, 2019 at 7:20 PM Shuah Khan wrote:
> > > On 10/11/19 2:57 AM, Greg KH wrote:
> > >> On Thu, Oct 10, 2019 at 10:41:50AM -0400, Konstantin Ryabitsev wrote:
> > >>> Hi, all:
> > >>>
> > >>> I would like to propose a new (large) feature to patchwork with the goal to
> > >>> make the process of submitting a patch easier for newbies and people
> > >>> generally less familiar with patch-based development. This was discussed
> > >>> previously on the workflows list:
> > >>> https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/
> > >>>
> > >>> How I envision this would work:
> > >>>
> > >>> - user creates an account (which requires a mail confirmation) >> - they choose a "submit patch" option from the menu
> > >>> - the patch submission screen has a succession of screens:
> > >>>
> > >>>   1. a screen with a single field allowing a user to paste a URL to     their
> > >>> fork of the git repository. Once submitted, patchwork does a     "git
> > >>> ls-remote" to attempt to get a list of refs and to verify that     this is
> > >>> indeed a valid git repository
> > >>
> > >> s/valid git repository/valid git repository based on the kernel git tree/
> > >>
> > >> Otherwise you might be sending out lots of emails for other projects :)
> > >>
> > >>>   2. next screen asks the user to select the ref to work from using the
> > >>> list obtained from the remote. Once submitted, patchwork performs a     `git
> > >>> clone --reference` to clone the repository locally using a     local fork of
> > >>> the same repo to minimize object transfer. This part     requires that:
> > >>>        a. patchwork project is configured with a path to a local fork,
> > >>> if this feature is enabled for a project
> > >>>        b. that fork is kept current via some mechanism outside of
> > >>> patchwork (e.g. with grokmirror)
> > >>>        c. there is some sanity-checking during the clone process to
> > >>> avoid abuse (e.g. a sane timeout, a tmpdir with limited size,          etc
> > >>> -- other suggestions welcome)
> > >>>
> > >>>   3. next screen asks the user to pick a starting commit from the log.
> > >>> Once submitted, patchwork generates the patch from the commit     provided
> > >>> to the tip of the branch selected by the user earlier,
> > >>>      using git format-patch.
> > >>>
> > >>>   4. next screen asks the user to review the patch to make sure this is
> > >>> what they want to submit. Once confirmed, patchwork performs two
> > >>> admin-defined optional hooks:
> > >>>
> > >>>        a. a hook to generate a list of cc's (e.g. get_maintainer.pl)
> > >>>        b. a sanity check hook (e.g. checkpatch.pl)
> > >>
> > >> I will note that many "first patch" submissions are checkpatch.pl
> > >> cleanups for staging.  When doing that, I require that they do "one
> > >> logical change per patch", which means that many of the individual
> > >> patches themselves will not be checkpatch.pl clean, because many lines
> > >> have multiple issues with them (tabs, spaces, format, length, etc.)
> > >>
> > >> So other than that minor thing, sounds interesting.  It's hard to
> > >> determine just how difficult the whole "set up git and send a patch out"
> > >> process is for people these days given the _huge_ numbers of new
> > >> contributions we keep getting, and the numerous good tutorials we have
> > >> created that spell out exactly how to do this.
> > >>
> > >> So you might be "solving" a problem that we don't really have.  It's
> > >> hard to tell :(
> > >
> > > I agree with this. I don't think this a problem that is worth solving.
> > > When a new developer wants to send a patch, they don't need to create
> > > any accounts. They setup their email client and send patch.
> > >
> > > We have several resources that walk them through setting up email
> > > clients and sending patches. checkpatch.pl can be automated with
> > > git hooks.
> > >
> > >>> I know this is a pretty big RFE, and I would like to hear your thoughts
> > >>> about this. If there is general agreement that this is doable/good idea, I
> > >>> may be able to come up with funding for this development as part of the
> > >>> overall tooling improvement proposal.
> > >>
> > >> The workflow seems sane, and matches what most people do today, with the
> > >> exception that it "solves" the git send-email issue, right?  Is that our
> > >> biggest barrier?
> > >>
> > >> I would recommend interviewing some of the recent kernel mentor project
> > >> and outreachy applicants first, to try to determine exactly what their
> > >> problems, if any, were with our development process.  If they say that
> > >> this type of tool/workflow would have saved them hours of time and
> > >> energy, then that's a great indication that we should try to do this.
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
> > I will not consider time spent fixing it as useful time investment.
>
> Starting from an estalished working process, a change on your e-mail
> provider side broke your workflow. The exact same problem could happen
> regardless of how changes get submitted, a corporate HTTP proxy or
> firewall could also break HTTP-based submissions.

If the network is down or firewalled, that's one problem. But for
email we involve another third party. So it's not exactly as own app
server.

> Now, gmail being one of the largest e-mail providers, I think it's fair
> to consider that the kernel community should provide clear and easy to
> follow instructions on how to use git-send-email with gmail. In
> particular, with two-factor authentication being widespread, how to set
> it up with git-send-email should likely be described in
> https://www.kernel.org/doc/html/latest/process/email-clients.html.
> Blaming it solely on the SMTP protocol is a bit of a shortcut.
>
> > Any kernel documentation that I can find for gmail, mentions config
> > that I am already using and that is not working:
> > https://www.kernel.org/doc/html/latest/search.html?q=gmail&check_keywords=yes&area=default#
> > https://www.kernel.org/doc/html/latest/process/email-clients.html?highlight=gmail
> >
> > As another data point, I spoke to KP Singh at the Plumbers. He is a
> > "returning" kernel developer (so already did this before), he said it
> > took him 3 days and 52 configurations changes (all were committed to
> > git, so was possible to count exactly) to setup mail client properly.
> > And he is "staffed" to do kernel work, I would expect that most people
> > who don't _have_ to do kernel contributions will turn away half-way.
>
> That's very interesting information, is there any way that more details
> about the 52 steps could be shared ?

+KP you told me that it was hard to setup a mail client on Plumbers.
Did I get the numbers right? You have any details for that?

> > As another data point, several people told me that they are afraid of
> > sending kernel patches b/c there is so much "on you" to do right.
>
> Is that related to the submission mechanism, or to all the other things
> you need to get right ?

Email is part of this.

> > I would say that we need to aim at  a process that does not require a
> > friendly experienced person to answer any of your questions in the
> > common case. Lots of people will simply not ask any questions.
>
> I fully agree with that.
>
> --
> Regards,
>
> Laurent Pinchart

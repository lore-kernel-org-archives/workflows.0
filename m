Return-Path: <SRS0=YmVK=XZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC44DC32792
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 13:40:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94CEC2086A
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 13:40:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vFAPjeiB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731327AbfI3NkP (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 09:40:15 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:44892 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731062AbfI3NkO (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Sep 2019 09:40:14 -0400
Received: by mail-qt1-f194.google.com with SMTP id u40so17034543qth.11
        for <workflows@vger.kernel.org>; Mon, 30 Sep 2019 06:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a2Us1nmXF5GvFzWFixY+xaECBZe4HKM7zGRDBij4WnI=;
        b=vFAPjeiBIeumY7F9mY7awxjjRmr9i0Xz38CPVacNI8bOoKHL+r2Ho9z/cGFZTOQwEW
         flf8rwMt7PnQwVFC+Q/FmPwUtXNkdJzT2MX+hvbFXbfuf/gUTq54X9qShAzAAuDS8Wsn
         nxjVZ5grjxzwp3yORcHS0fseiSEDo50/KXj3BUVoif2JzQp6VuFVXZYgvuD9vNWRftac
         7hOfj9tOSRE0hDitdd3CQbDssxk7skY1FUrI6u88Oi3aQ/2MZdR94NKzeEYocNlASRxQ
         /mzL66+qWLM788zdbwtpBxUMGh/x/M0q4hSRAz5aKPBxvEBS7NDMuI3W4VzdjPdmEiCc
         GPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a2Us1nmXF5GvFzWFixY+xaECBZe4HKM7zGRDBij4WnI=;
        b=T55VRK7YLhdQNNjrv/W1kcjhZHZqhKge+Jj5Z+dDaoRxVLmkAbRhmxOm7jFrltBslj
         Xytc86HYXkA04nznUvL4UeMbGMWu7CELr33HcyyCXrsKBcbJJf5fYIJGBziAF/lMt2QK
         8rYm3Zzx2OjVoCtIVBPtNufvOKpt+CLySB7zgNC4q3to8XUwO8Y/GrioK86p7kOwltgM
         02ZV+PYw9YShW4G9VwzB9PK0u6Q7YbL6JoEZsvHJnvL3lqc9dWkJ5LTfjPr7XOF8iraJ
         6pDwNkCJGFnzqGlw8z6onZTgY59CYhKuzOP7/AL3sdzpHVxzXZZDycasP2KU3qnG8gi/
         LcNQ==
X-Gm-Message-State: APjAAAXNLwXWO5ajexphioH++W5L67SgFyZjd3yAyYW4ep1yQTHL0Ftj
        qXjrzYQrWJE5w6bl2iHy1x30XFjEcTv6N9tJEDOOoQ==
X-Google-Smtp-Source: APXvYqxZyOY2I7aK84vvk9O2rysgMRbNqp/YeR3j20K7E68A0mmVVGKUwgIDV0cAVSpuX3kqISNud9FwxSZfcC9oAaI=
X-Received: by 2002:a0c:e849:: with SMTP id l9mr20449208qvo.84.1569850813084;
 Mon, 30 Sep 2019 06:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190924185312.GD6041@hmswarspite.think-freely.org>
 <20190924202423.GA14425@pendragon.ideasonboard.com> <20190924222502.GA11633@hmswarspite.think-freely.org>
 <20190925205036.GA7763@pendragon.ideasonboard.com> <20190926004045.GA20302@localhost.localdomain>
 <20190928185848.76c85a9d@oasis.local.home> <20190929115722.GA26820@hmswarspite.think-freely.org>
 <CACT4Y+Z8_fABZSXahiGaOxKiPa+K3hxhvH8EVenuuqOs3aCwZg@mail.gmail.com>
 <20190930010054.GA2973@localhost.localdomain> <CACT4Y+ZUAa3_LMm3NqsUu7s9mRaY=1jNwDf+2x3cBVNouUTNXQ@mail.gmail.com>
 <20190930125548.GA6647@hmswarspite.think-freely.org>
In-Reply-To: <20190930125548.GA6647@hmswarspite.think-freely.org>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 30 Sep 2019 15:40:01 +0200
Message-ID: <CACT4Y+bHQOJhXmZ=+NPh7DnWargHWrC4BD537XooGNX9uBPqDA@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Neil Horman <nhorman@tuxdriver.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Drew DeVault <sir@cmpwn.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Sep 30, 2019 at 2:56 PM Neil Horman <nhorman@tuxdriver.com> wrote:
>
> On Mon, Sep 30, 2019 at 08:05:04AM +0200, Dmitry Vyukov wrote:
> > On Mon, Sep 30, 2019 at 3:01 AM Neil Horman <nhorman@tuxdriver.com> wrote:
> > >
> > > On Sun, Sep 29, 2019 at 02:55:25PM +0200, Dmitry Vyukov wrote:
> > > > On Sun, Sep 29, 2019 at 1:57 PM Neil Horman <nhorman@tuxdriver.com> wrote:
> > > > >
> > > > > On Sat, Sep 28, 2019 at 06:58:48PM -0400, Steven Rostedt wrote:
> > > > > > On Wed, 25 Sep 2019 20:40:45 -0400
> > > > > > Neil Horman <nhorman@tuxdriver.com> wrote:
> > > > > >
> > > > > > > Eventually, barring any really significant objection, hes going to make
> > > > > > > the switch, and users will either have to get github accounts, or stop
> > > > > > > participating in netdev development.
> > > > > >
> > > > > > That will be a very sad day if that happened.
> > > > > >
> > > > > > Whatever service should have an email interface. For example, if I get
> > > > > > a message from bugzilla.kernel.org, I can reply back via email and it
> > > > > > is inserted into the tool (as I see my Out of office messages going
> > > > > > into it. I need to fix my scripts not to reply to bugzilla).
> > > > > >
> > > > > Forge solutions do have the ability to use email as an interface to
> > > > > issue tracking, thats not a problem.  What they don't currently seem to
> > > > > have is the ability to emulate patch review workflows.  And thats not to
> > > > > say they couldn't, but it seems to me that they haven't prioritized that
> > > > > because they offer several different types of comment options
> > > > > (commenting in the pull request discussion(s) themselves vs commenting
> > > > > on code, etc.  If they sould implement that, I think alot of this would
> > > > > become alot easier.
> > > > >
> > > > > > I set up patchwork on my INBOX, as I'm having a hard time of separating
> > > > > > patches from the noise. And it works really well. I would love to be
> > > > > > able to push my patchwork list to a public place so that others can see
> > > > > > it too. As mentioned in the Maintainers Summit, it would be great to be
> > > > > > able to pull patchwork down to my laptop, get on the plane, process a
> > > > > > bunch of patches while flying, and then when I land, I could push the
> > > > > > updates to the public server.
> > > > > >
> > > > > > That's pretty much all I'm looking for.
> > > > > >
> > > > > I think what you are looking for here is a way to pull down a set of
> > > > > merge requests, review and merge those you approve, and push them back
> > > > > when you are back online?  I think you can do at least some of that.
> > > > > Forge solutions (definately gitlab, likely github), allow you to pull
> > > > > a merge request reference namespace (on gitlab its
> > > > > heads/merge_requests/<merge_request_id>).  You can merge whatever head
> > > > > there you like to its intended target branch, and when you push, it will
> > > > > update the corresponding MR to the MERGED state.  What you can't
> > > > > currently do is make a comment on an MR, store that comment in git and
> > > > > then have the MR updated with those comments.  That would be a great
> > > > > item to make that feature more complete.
> > > >
> > > > One mismatch with kernel dev process that seem to be there for lots of
> > > > existing solutions (gerrit, git-appraise, github, gitlab) is that they
> > > > are centered around a single "mail" git tree (in particular,
> > > > gerrit/git-appraise check in metainfo right into that repo). Whereas
> > > > kernel has lots of kernels. Now if Steve is CCed on lots of changes
> > > > what git tree should he pull before boarding a place? For some changes
> > > > it may be unclear what tree they should go into initially, or that may
> > > > change over time. Then, there are some additional relations with
> > > > stable trees.
> > > > I suspect that kernel tooling should account for that and separate
> > > > changes layer from exact git trees. Like mailing lists. Usually there
> > > > is 1 mailing list and 1 git tree per subsystem, but still this
> > > > relation is not fixed and one can always CC another mailing list, or
> > > > retarget the change, etc.
> > > > What do you think?
> > > >
> > > I agree that newer review solutions (of the type you ennummerated) rely
> > > on centralization of information, which is undesireable in many cases,
> > > but I'm not sure how to avoid that.
> >
> > Well, FWIW the SSB protocol and similar would avoid that:
> > https://people.kernel.org/monsieuricon/patches-carved-into-developer-sigchains
> >
> I wasn't aware of this framework, thats pretty cool and could be a
> potential solution, yes.
>
> That said, it doesn't solve the casual contributor issue.  From the
> section on raising the entry barrier:
>
> "We would need full-featured web clients that would allow someone to browse projects
> in a similar fashion as they would browse them on Git..b, including viewing issues,
> submitting bug reports, and sending patches and pull requests."

Well, it does not have to be complex. See a potential new developer workflow:
https://lore.kernel.org/workflows/d6e8f49e93ece6f208e806ece2aa85b4971f3d17.1569152718.git.dvyukov@google.com/

> Once we start talking about having to maintain web interfaces, and
> especially if we are also considering features like CI, it seems to me
> we are talking about falling back effectively to a forge solution that
> allows data interchange via SSB.  While thats a good feature add, its
> really an addition to a forge solution, not a standalone mechanism.

Re web interfaces, Gerrit allows running locally (with your local
checkout as data source), or there will always be an option to apply
the change locally and review in your favorite editor. While a hosted
web interface is nice, it may be only one of the available options.
E.g. git-appraise has a bridge to github, but that's only a bridge.

Re CI. It does not seem to be much to reuse for kernel testing here.
Besides push notifications about new changes and UI for
"passed"/"failed" result. It would be nice for KernelCI, LKFT, CKI,
0-day to talk to the rest of the kernel dev process using some
standardized API, but if it's a github API or some other similar API
probably does not matter much.


> > > Just thinking off the top of my head, I wonder if a tool that converted
> > > all forge type conversations to git notes would be useful here.  Those
> > > could then be pulled by individuals for review and update?
> >
> > git-appriaise does something similar, but the other way around:
> > https://github.com/dvyukov/kit/blob/master/doc/references.md#git-appraise
> > git notes is the _main_ storage, but then it has bridge to github.
> >
> > However, it's unclear how use such solution for kernel:
> > https://lore.kernel.org/ksummit-discuss/9fee1356-cf48-6198-4001-5d9d886fbf88@iogearbox.net/T/#m869c5253d10931823bba74942df7da062a7bbb13
> > (world writable, force pushes)
> >
> Yeah, I've messed with git-appraise, and thats the issue I've run into -
> it forgoes the need for account creation on a forge, but at the expense
> of...well, not having any significant meaningful authentication.

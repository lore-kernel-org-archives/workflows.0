Return-Path: <SRS0=YmVK=XZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA19C4360C
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 06:05:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6278920815
	for <workflows@archiver.kernel.org>; Mon, 30 Sep 2019 06:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B+1HCxdF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729667AbfI3GFS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 30 Sep 2019 02:05:18 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:38296 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfI3GFR (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 30 Sep 2019 02:05:17 -0400
Received: by mail-qt1-f195.google.com with SMTP id j31so15562850qta.5
        for <workflows@vger.kernel.org>; Sun, 29 Sep 2019 23:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KBBrXEp8xhy766yyBZIxgiV1HsISLZXHgDb+e7TotXc=;
        b=B+1HCxdF1NHjQG7vqgFRgMxwt/Ssj19Ll0q5Ou382FuiFt+vO9BIFTw1GS3DwhJmvi
         vDALHrV8HLqrn4iN71y5RMzMlC4eyfANdni/AbaHhHtcJUEvdHqNs5x5Fn0xBCR+WSen
         dNvRmwOC2wjkaQtYChUB/dcAtEtZm3wkZGI5p1AxYTl4KsrBxySX+WOHX9kLr5uuDP1w
         gJgDEo82FkPl2TaK5y1+WdK60WjM8YZCmUR6J8OF7d+NUOwH4T0ZeOfye6z6kF+dL7Eh
         NFk99mHFth4M+W1NrFGRxysuUtDH6zfef1noOzWoxCAV+5Uj9CYEXcyEAbzXEhMbuNWk
         nfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KBBrXEp8xhy766yyBZIxgiV1HsISLZXHgDb+e7TotXc=;
        b=DkpSUyg2tpWuQvwHE4g+8CWnCPBRCxb/GugO1ka2/9XdW7ved2csn/V8tDmu9rRfNV
         swyfg5pwKUB+JTjtv1fkcP2kia7qzgKNMsGpXQmf0L2/y/qlSosBPIojPCp0NV++Vrzg
         E87Eq+6hcV/efFpaq81CFhD+PHezsFfjfsnxsAxkYyXoZYxLw1BPafPzuysu4wjouF76
         1SwZ7+uoa6Sem4SwGuUSfHZK4d/O3y6sx+4WVw3UuZGf2saLNMebh74isU/9uimoKcH7
         uhIphdrelYn0oXDMAR/wgCI3ZftY+SqAVybtl9/DGNCtKZ6MB4R8e9PhcXEE0AVCxfEi
         oAlg==
X-Gm-Message-State: APjAAAXPqJqazhaAOWbNxuDl4q9JNg0eH3c39fvFLRY0+Khz7qjrbjs8
        YRoxu2WYeSjj8FGr+TytfGw074gkrMgnE+XcQS9zWfGbvQA=
X-Google-Smtp-Source: APXvYqzDzsToJXEBM5k6lNuYpyV/eZqEfm3c+ZL/Qq+XNVlwZrJ+PUioxDYeOhCZdZDCLoq7UkxRmyrxPHfDOh/fimU=
X-Received: by 2002:ac8:2c50:: with SMTP id e16mr23137228qta.257.1569823515964;
 Sun, 29 Sep 2019 23:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20190924185312.GD6041@hmswarspite.think-freely.org>
 <20190924202423.GA14425@pendragon.ideasonboard.com> <20190924222502.GA11633@hmswarspite.think-freely.org>
 <20190925205036.GA7763@pendragon.ideasonboard.com> <20190926004045.GA20302@localhost.localdomain>
 <20190928185848.76c85a9d@oasis.local.home> <20190929115722.GA26820@hmswarspite.think-freely.org>
 <CACT4Y+Z8_fABZSXahiGaOxKiPa+K3hxhvH8EVenuuqOs3aCwZg@mail.gmail.com> <20190930010054.GA2973@localhost.localdomain>
In-Reply-To: <20190930010054.GA2973@localhost.localdomain>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 30 Sep 2019 08:05:04 +0200
Message-ID: <CACT4Y+ZUAa3_LMm3NqsUu7s9mRaY=1jNwDf+2x3cBVNouUTNXQ@mail.gmail.com>
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

On Mon, Sep 30, 2019 at 3:01 AM Neil Horman <nhorman@tuxdriver.com> wrote:
>
> On Sun, Sep 29, 2019 at 02:55:25PM +0200, Dmitry Vyukov wrote:
> > On Sun, Sep 29, 2019 at 1:57 PM Neil Horman <nhorman@tuxdriver.com> wrote:
> > >
> > > On Sat, Sep 28, 2019 at 06:58:48PM -0400, Steven Rostedt wrote:
> > > > On Wed, 25 Sep 2019 20:40:45 -0400
> > > > Neil Horman <nhorman@tuxdriver.com> wrote:
> > > >
> > > > > Eventually, barring any really significant objection, hes going to make
> > > > > the switch, and users will either have to get github accounts, or stop
> > > > > participating in netdev development.
> > > >
> > > > That will be a very sad day if that happened.
> > > >
> > > > Whatever service should have an email interface. For example, if I get
> > > > a message from bugzilla.kernel.org, I can reply back via email and it
> > > > is inserted into the tool (as I see my Out of office messages going
> > > > into it. I need to fix my scripts not to reply to bugzilla).
> > > >
> > > Forge solutions do have the ability to use email as an interface to
> > > issue tracking, thats not a problem.  What they don't currently seem to
> > > have is the ability to emulate patch review workflows.  And thats not to
> > > say they couldn't, but it seems to me that they haven't prioritized that
> > > because they offer several different types of comment options
> > > (commenting in the pull request discussion(s) themselves vs commenting
> > > on code, etc.  If they sould implement that, I think alot of this would
> > > become alot easier.
> > >
> > > > I set up patchwork on my INBOX, as I'm having a hard time of separating
> > > > patches from the noise. And it works really well. I would love to be
> > > > able to push my patchwork list to a public place so that others can see
> > > > it too. As mentioned in the Maintainers Summit, it would be great to be
> > > > able to pull patchwork down to my laptop, get on the plane, process a
> > > > bunch of patches while flying, and then when I land, I could push the
> > > > updates to the public server.
> > > >
> > > > That's pretty much all I'm looking for.
> > > >
> > > I think what you are looking for here is a way to pull down a set of
> > > merge requests, review and merge those you approve, and push them back
> > > when you are back online?  I think you can do at least some of that.
> > > Forge solutions (definately gitlab, likely github), allow you to pull
> > > a merge request reference namespace (on gitlab its
> > > heads/merge_requests/<merge_request_id>).  You can merge whatever head
> > > there you like to its intended target branch, and when you push, it will
> > > update the corresponding MR to the MERGED state.  What you can't
> > > currently do is make a comment on an MR, store that comment in git and
> > > then have the MR updated with those comments.  That would be a great
> > > item to make that feature more complete.
> >
> > One mismatch with kernel dev process that seem to be there for lots of
> > existing solutions (gerrit, git-appraise, github, gitlab) is that they
> > are centered around a single "mail" git tree (in particular,
> > gerrit/git-appraise check in metainfo right into that repo). Whereas
> > kernel has lots of kernels. Now if Steve is CCed on lots of changes
> > what git tree should he pull before boarding a place? For some changes
> > it may be unclear what tree they should go into initially, or that may
> > change over time. Then, there are some additional relations with
> > stable trees.
> > I suspect that kernel tooling should account for that and separate
> > changes layer from exact git trees. Like mailing lists. Usually there
> > is 1 mailing list and 1 git tree per subsystem, but still this
> > relation is not fixed and one can always CC another mailing list, or
> > retarget the change, etc.
> > What do you think?
> >
> I agree that newer review solutions (of the type you ennummerated) rely
> on centralization of information, which is undesireable in many cases,
> but I'm not sure how to avoid that.

Well, FWIW the SSB protocol and similar would avoid that:
https://people.kernel.org/monsieuricon/patches-carved-into-developer-sigchains

> Just thinking off the top of my head, I wonder if a tool that converted
> all forge type conversations to git notes would be useful here.  Those
> could then be pulled by individuals for review and update?

git-appriaise does something similar, but the other way around:
https://github.com/dvyukov/kit/blob/master/doc/references.md#git-appraise
git notes is the _main_ storage, but then it has bridge to github.

However, it's unclear how use such solution for kernel:
https://lore.kernel.org/ksummit-discuss/9fee1356-cf48-6198-4001-5d9d886fbf88@iogearbox.net/T/#m869c5253d10931823bba74942df7da062a7bbb13
(world writable, force pushes)

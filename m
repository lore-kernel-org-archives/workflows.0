Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C12C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 13:45:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B051F21D7C
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 13:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="haFVo+wf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732013AbfJONpW (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 09:45:22 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35140 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728880AbfJONpW (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 09:45:22 -0400
Received: by mail-ot1-f68.google.com with SMTP id z6so16957793otb.2
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 06:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6DQMmHeUji0YVpLVlROI2mZnynSDsyEiV2eHQq+1xPQ=;
        b=haFVo+wf9BogoCSX0Jtp4gIABp0GYWQX9u4k9qstdWXtNUyLw+HjF3S4iNNjtfDZOR
         CrhRkfY/Epwth/J16Zn5zn9ZiShniWUPslOW78lApXJdgv3iy8e5B+ZWnKx8+C523Tb1
         Bk/XJFUdi/IrYJ1jXGHNlJT3c/L24N17hQ2JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6DQMmHeUji0YVpLVlROI2mZnynSDsyEiV2eHQq+1xPQ=;
        b=gZmDARPc0u5vY+FRtYS9oOI3VXn85ySSGUpQeqXtJ+J99LAv5Bna+lKSqngOGdeWZB
         Zq8eE5JMfYLuV5SpTUGuZxgZYGRsAjl3wmMpAzEYjECo/YsQlmR4nxkBx3xkGLBa7xxA
         Y1N4678WwJUZXDxiaHcgq3p07mI1raxznApq+3vVThued3LouSprq23KD8VVf3xGmYV1
         v//nxX6O7QCv9sRT0hUogVsUXPcBThsRDdsGLClOG3tRib2jBNVIEObjMozqZaqn/h64
         OneLZbQttkoCVgyNw1wDd2OcvaAH0YcEdGm4brNj/zzf+uPTflBg20ARLoO6czNB5sv2
         s2GA==
X-Gm-Message-State: APjAAAXkfhlaBmIRUVxCgyRJZz/eJPEP3dAbT2dyIS8iwXRNYm8CC5GQ
        AoBxwreEDrT5sCG5zgn5Hw/bX7g78O0eHyEJYg/OrL/eFPo=
X-Google-Smtp-Source: APXvYqx1b3Hhuw3Av3mpOY+O6ahPna26PxqcTcQx6yHlfxGI02BbEMUwvknfceACu8xr/1rjWmdjqgsHrUTQhqRSCtA=
X-Received: by 2002:a9d:6343:: with SMTP id y3mr4700074otk.106.1571147120462;
 Tue, 15 Oct 2019 06:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191007211704.6b555bb1@oasis.local.home> <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home> <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local> <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local> <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu> <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015015425.GA26853@mit.edu> <CAKMK7uGtvqFSw+wOBeGjV88DeyUoMTV3+F4Fpqv6NGUBCkAAgA@mail.gmail.com>
 <CAFQ2z_Pxc=0LjEieUC7Dz_sQiUKBr2oKUVrW7Fppj5AQbD_W5A@mail.gmail.com>
In-Reply-To: <CAFQ2z_Pxc=0LjEieUC7Dz_sQiUKBr2oKUVrW7Fppj5AQbD_W5A@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Tue, 15 Oct 2019 15:45:08 +0200
Message-ID: <CAKMK7uGseMAmmLkawkaMMJgK=XAXoK+vOP8Uo9obXpss_v+WYQ@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Han-Wen Nienhuys <hanwen@google.com>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Laura Abbott <labbott@redhat.com>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 3:14 PM Han-Wen Nienhuys <hanwen@google.com> wrote:
> On Tue, Oct 15, 2019 at 2:00 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > Today, this can be easily done by cc'ing the patch to multiple mailing
> > > lists.  Exactly how this works may get tricky, especially in the
> > > federated model where (for example) perhaps the btrfs tree might be
> > > administered by Facebook, while the xfs tree might be administrated by
> > > Red Hat.  Given that we *also* have to support people who want to keep
> > > using e-mail during the transition period, it may be that using
> > > unauthenticated e-mail messages where comments are attached quoted
> > > patch hunks, perhaps that can be the interchange format between
> > > different servers that aren't under a common administrative domain.
> >
> > Last time I looked none of the common web ui tools (gerrit, gitlab,
> > github) had any reasonable support for topic branches/patch series
> > that target multiple different branches/repositories. They all assume
> > that a submission gets merged into one branch only and that's it. You
> > can of course submit the same stuff for inclusion into multiple
> > places, but that gives you separate discussion tracking for each one
> > (at least with the merge/pull request model, maybe gerrit is better
> > here), which is real bad.
>
> Can you say a little more about what you expect when working with
> multiple branches/repos?
>
> In gerrit, you can assign freeform tags ("topics") to changes, to
> group them. See eg.
>
>   https://gerrit-review.googlesource.com/q/topic:"rename-reviewdb-package"+(status:open%20OR%20status:merged)
>
> this will let you group changes, that can be in different repos and/or
> different branches. See also
> https://gerrit-review.googlesource.com/Documentation/intro-user.html#topics
>
> Discussions are tied to a single commit, but you can easily navigate
> between different changes in topics, and submission is synchronized
> (submitting one change will submit all of the topic. it's
> unfortunately not atomic).
>
> This is how submissions to Android work, as Android is stitched
> together from ~1000 repos. It is likely that this support will further
> improve, as Android is one of our biggest internal key customers.

I think gitlab is working on this under the heading of "supermerge",
where you tie together a pile of changes for different repos under one
overall label to keep the discussion together.

For the kernel we need something slightly different:
- There's a large pile of forks of the same underlying repo (Linus'
upstream branch). So not a huge pile of independent histories and file
trees, but all the same common kernel history and file layout.
- The _same_ set of patches is submitted to multiple branches in that
fork network. E.g. a refactoring patch series which touches both
driver core and a few subsystems.

Afaiui Android has cross-tree pulls, but the patches heading to each
target repo are distinct, and they're all for disjoint history chains
(i.e. no common ancestor commit, no shared files between all the
different branches/patches). I'm not aware of any project which uses
topic branches and cross-tree submissions as extensively as the linux
kernel in this fashion. Everyone with multiple repos seems to use the
Android approach of splitting up the entire space in disjoint repos
(with disjoint histories and disjoint files). I've done a fairly
lengthy write-up of this problem:

https://blog.ffwll.ch/2017/08/github-why-cant-host-the-kernel.html

Android is a multi-repo, multi-tree approach, the linux kernel is a
monotree but multi-repo approach. Most people think that the only
other approach than multi-tree is the huge monolithic monotree w/
monorepo approach. That one just doesn't scale. If you'd do Android
like the linux kernel you'd throw out the repo tool, instead have
_all_ repos merged into one overall git history (placed at the same
directory like they're now placed by the repo tool). Still each
"project/subsystem" would retain their individual git repo to be able
to scale sufficiently well, through localizing of most
development/review work to their specific area.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

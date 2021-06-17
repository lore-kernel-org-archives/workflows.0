Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A92C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:33:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 691A6613CB
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:33:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbhFQOfu (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 10:35:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:32810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231346AbhFQOfu (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 10:35:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88A7E613EA
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 14:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623940422;
        bh=akYCRDR7hRHCuqn+eExSor0NNpx0BUjJjGLJe7a/GrQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=kzxqw6Zij3Trq9ZJldDaKqUgKdytswFfq2FxNgKWEhk/yJE9xUXZnE2tlfDqgig+Q
         FMqLrqy/BtJsh/eF15uFZ1ZE6p2mIsWl4FnVM76kuUXZbhwm3BiUCtPmxauHhghia8
         i7xFeKAUGMEswQ7+kVYCCvdFfZX+uERE81l8OPYzaHa5KUP8fKoWoHoHYkR8ZduFpM
         amZh/+X5wQ0t4ERyfsoCBVO3Y7K4+rohbV++iEjN1NP7irdFE5qPA0SQcNLE53IFCM
         CKaqEY/YV2tdPsmq40idufI65PvF30c5ZMZD93UzkF2gVsFS/CC8N6wI7u9x5gzrSp
         HjLjcw2W02iBg==
Received: by mail-ed1-f45.google.com with SMTP id z12so4365129edc.1
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 07:33:42 -0700 (PDT)
X-Gm-Message-State: AOAM531fYTvpFMh9TPqZc6yx++vUzz5Ge4inStOJL1EZgKKO0khP+k2H
        E0BPYVmdOdYGaxrRUMabS9KNoC05eHS6QjiKcw==
X-Google-Smtp-Source: ABdhPJxvPJH9duc8iokf5yy6xqpZqoBDrmSIh9dE3raa3tQ1hsrk1/QN087BtcS/PKrzbthP0m9cPLmH4UdWL/LmX4k=
X-Received: by 2002:a05:6402:cb0:: with SMTP id cn16mr6847590edb.165.1623940421107;
 Thu, 17 Jun 2021 07:33:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
 <20210617085251.78d376d7@coco.lan> <CACT4Y+bJNuPV2sXtGn+v0PcNP+6uFO7GdmW9XL4pQMF_vokmhg@mail.gmail.com>
 <20210617105534.0d4c02df@coco.lan>
In-Reply-To: <20210617105534.0d4c02df@coco.lan>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 17 Jun 2021 08:33:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJNriy1HwY-A-4Qczt-MNvMh0zOvWhvd0DAX3EHm6hhNw@mail.gmail.com>
Message-ID: <CAL_JsqJNriy1HwY-A-4Qczt-MNvMh0zOvWhvd0DAX3EHm6hhNw@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 2:55 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Thu, 17 Jun 2021 10:20:31 +0200
> Dmitry Vyukov <dvyukov@google.com> escreveu:
>
> > On Thu, Jun 17, 2021 at 8:53 AM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > Em Wed, 16 Jun 2021 15:11:33 -0600
> > > Rob Herring <robh@kernel.org> escreveu:
> > >
> > > > On Wed, Jun 16, 2021 at 11:18 AM Konstantin Ryabitsev
> > > > <konstantin@linuxfoundation.org> wrote:
> > > > >
> > > > > Hi, all:
> > > > >
> > > > > I've been doing some work on the "github-pr-to-ml" bot that can monitor GitHub
> > > > > pull requests on a project and convert them into fully well-formed patch
> > > > > series. This would be a one-way operation, effectively turning Github into a
> > > > > fancy "git-send-email" replacement. That said, it would have the following
> > > > > benefits for both submitters and maintainers:
> > > >
> > > > What makes this specific to Github PRs? A Github PR is really just a
> > > > git branch plus a target at least to the extent we would use it here.
> > > > The more of this that works on just a git branch, the more widely
> > > > useful it would be.
> > > >
> > > > > - submitters would no longer need to navigate their way around
> > > > >   git-format-patch, get_maintainer.pl, and git-send-email -- nor would need to
> > > > >   have a patch-friendly outgoing mail gateway to properly contribute patches
> > > >
> > > > Presumably, the bot would rely on get_maintainer.pl or it would get
> > > > who to send to based on GH repo and reviewers? Without work on
> > > > get_maintainer.pl, I don't think it will work well beyond simple
> > > > cases.
> > >
> > > Some sanity test is needed, as otherwise it will end by trying to send
> > > the patch to a large number of people.
> >
> > I think this system needs to use get_maintainer.pl results as is and
> > any fixing/filtering/sanity checking needs to go into
> > get_maintainer.pl itself.
> > get_maintainer.pl is what is used by lots of contributors, the only
> > option for any automated systems, what is used by new contributors if
> > they don't use this system anyway. And even experienced developers
> > know internal rules only for a few subsystems and use
> > get_maintainer.pl when sending a one-off patch to another subsystem
> > (what else?).
> >
> > I don't see where we are getting if we accept get_maintainer.pl
> > produces bad results and needs additional fixing in every system out
> > there (dozens) and when used by humans. All systems would need the
> > same filtering/checking rules and they need to keep in sync. What a
> > kernel developer would even need to do to fix something (add/remove
> > themselves)? Go and talk to a large unknown set of systems that
> > duplicate the same additional rules?
> >
> > And the only way to surface actual issues with get_maintainer.pl is to
> > start using it. In fact it's already widely used as is, so I am not
> > sure it's particularly bad.
>
> I'm not saying that get_maintainer.pl produces bad result. Depending
> on what is done, it could produce a very large output.
>
> Let's suppose that someone do something like globally renaming a
> widely-used kAPI, e. g. something like:
>
>         $ git ls-files|xargs sed s,mutex_,new_mutex_, -i
>
> A change like that would touch lots of subsystems, making get_maintainer.pl
> to spend a lot of time processing it, and producing thousands of
> entries (btw, we had a change somewhat similar to the above a long time
> ago when mutex API was introduced and most of the semaphores were converted
> to use mutex kAPI instead).

What I end up doing in those cases is only Cc'ing the subsystem
maintainers. But that's a manual step of dropping all the driver and
SoC maintainers. A related problem is if you want to put who should
apply the patch on To. That's maybe as simple as whether the
maintainer entry has a git tree. I'd tackle that, but it's Perl, no
thanks.

Rob

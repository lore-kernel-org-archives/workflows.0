Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_RED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B6BC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:24:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A742561413
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:24:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233152AbhFQP1C (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:27:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:45104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233130AbhFQP1C (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 11:27:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 593F461412;
        Thu, 17 Jun 2021 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623943494;
        bh=7iigdUewpvgUUEFXNuhje761aqOpvtns3tPxTmJK2hg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=u2PeNXjV6p93RIRLNv0Kt5mTA+wesTyPcb5X6O6cAnAydDxAFtByG9u5AzzhRChBz
         9QMOA6xE69sAqCNngjtRFHG0YT+V9vxdip2k/DekeaDKXRCSE8bWoEMgZQNFnTGTeH
         1FswW/rx8ZN5NVoWaiWos5uWF/efrrCohCKl9j2lVqWRA7oPxoqaJx7iN7PHwUagpO
         hj7j7uBbDwZA2XmdeyYZdSkxsikEJKx+ajPKdNM0IZqKIkCqgd51JqF1oI9wDh7jvF
         A59MbOAXeNit/b6COQXQS+iWLU7DPD3SjKN28AbOI8szkQoxYXXcrzfvp2qoXnk0Us
         b3s14+ijuWtNg==
Date:   Thu, 17 Jun 2021 17:24:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210617172450.05f91115@coco.lan>
In-Reply-To: <CAL_JsqJNriy1HwY-A-4Qczt-MNvMh0zOvWhvd0DAX3EHm6hhNw@mail.gmail.com>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
        <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
        <20210617085251.78d376d7@coco.lan>
        <CACT4Y+bJNuPV2sXtGn+v0PcNP+6uFO7GdmW9XL4pQMF_vokmhg@mail.gmail.com>
        <20210617105534.0d4c02df@coco.lan>
        <CAL_JsqJNriy1HwY-A-4Qczt-MNvMh0zOvWhvd0DAX3EHm6hhNw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Em Thu, 17 Jun 2021 08:33:29 -0600
Rob Herring <robh@kernel.org> escreveu:

> On Thu, Jun 17, 2021 at 2:55 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Thu, 17 Jun 2021 10:20:31 +0200
> > Dmitry Vyukov <dvyukov@google.com> escreveu:
> >  
> > > On Thu, Jun 17, 2021 at 8:53 AM Mauro Carvalho Chehab
> > > <mchehab+huawei@kernel.org> wrote:  
> > > >
> > > > Em Wed, 16 Jun 2021 15:11:33 -0600
> > > > Rob Herring <robh@kernel.org> escreveu:
> > > >  
> > > > > On Wed, Jun 16, 2021 at 11:18 AM Konstantin Ryabitsev
> > > > > <konstantin@linuxfoundation.org> wrote:  
> > > > > >
> > > > > > Hi, all:
> > > > > >
> > > > > > I've been doing some work on the "github-pr-to-ml" bot that can monitor GitHub
> > > > > > pull requests on a project and convert them into fully well-formed patch
> > > > > > series. This would be a one-way operation, effectively turning Github into a
> > > > > > fancy "git-send-email" replacement. That said, it would have the following
> > > > > > benefits for both submitters and maintainers:  
> > > > >
> > > > > What makes this specific to Github PRs? A Github PR is really just a
> > > > > git branch plus a target at least to the extent we would use it here.
> > > > > The more of this that works on just a git branch, the more widely
> > > > > useful it would be.
> > > > >  
> > > > > > - submitters would no longer need to navigate their way around
> > > > > >   git-format-patch, get_maintainer.pl, and git-send-email -- nor would need to
> > > > > >   have a patch-friendly outgoing mail gateway to properly contribute patches  
> > > > >
> > > > > Presumably, the bot would rely on get_maintainer.pl or it would get
> > > > > who to send to based on GH repo and reviewers? Without work on
> > > > > get_maintainer.pl, I don't think it will work well beyond simple
> > > > > cases.  
> > > >
> > > > Some sanity test is needed, as otherwise it will end by trying to send
> > > > the patch to a large number of people.  
> > >
> > > I think this system needs to use get_maintainer.pl results as is and
> > > any fixing/filtering/sanity checking needs to go into
> > > get_maintainer.pl itself.
> > > get_maintainer.pl is what is used by lots of contributors, the only
> > > option for any automated systems, what is used by new contributors if
> > > they don't use this system anyway. And even experienced developers
> > > know internal rules only for a few subsystems and use
> > > get_maintainer.pl when sending a one-off patch to another subsystem
> > > (what else?).
> > >
> > > I don't see where we are getting if we accept get_maintainer.pl
> > > produces bad results and needs additional fixing in every system out
> > > there (dozens) and when used by humans. All systems would need the
> > > same filtering/checking rules and they need to keep in sync. What a
> > > kernel developer would even need to do to fix something (add/remove
> > > themselves)? Go and talk to a large unknown set of systems that
> > > duplicate the same additional rules?
> > >
> > > And the only way to surface actual issues with get_maintainer.pl is to
> > > start using it. In fact it's already widely used as is, so I am not
> > > sure it's particularly bad.  
> >
> > I'm not saying that get_maintainer.pl produces bad result. Depending
> > on what is done, it could produce a very large output.
> >
> > Let's suppose that someone do something like globally renaming a
> > widely-used kAPI, e. g. something like:
> >
> >         $ git ls-files|xargs sed s,mutex_,new_mutex_, -i
> >
> > A change like that would touch lots of subsystems, making get_maintainer.pl
> > to spend a lot of time processing it, and producing thousands of
> > entries (btw, we had a change somewhat similar to the above a long time
> > ago when mutex API was introduced and most of the semaphores were converted
> > to use mutex kAPI instead).  
> 
> What I end up doing in those cases is only Cc'ing the subsystem
> maintainers. But that's a manual step of dropping all the driver and
> SoC maintainers.

Yeah, surely it would be a lot better if the maintainer's file would
have a way to distinguish between driver and subsystem maintainers.

> A related problem is if you want to put who should
> apply the patch on To. That's maybe as simple as whether the
> maintainer entry has a git tree. 

It is not that simple. Driver maintainers usually also point to the
subsystem's tree.

One way would be to look at the committer for the file.

Another one would be to check if there are multiple maintainers
for the same file, with different entries. If so, the first
entry is the driver maintainer, and the last one, the subsystem
maintainer. Yet, this is heuristics, and may lead to errors.

Thanks,
Mauro

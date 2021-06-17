Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9824C48BE5
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 08:55:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF38661245
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 08:55:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbhFQI57 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 04:57:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:46148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231321AbhFQI54 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 04:57:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5297B61245;
        Thu, 17 Jun 2021 08:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623920138;
        bh=44ZZ6mAr/Ga5bVEytO9hY6EFfPAO0KiZHIf6dabD1CU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Qc1iXWppdvn6tUDnaMdhRdWBBcv0hR4XmGOHkY1uEPRnVkn0/ZMPg3FXsAhalcnaI
         QyRT89ppHwcGgmM/9Jn9l5NDHexBU0dYqK+tDXRwIHTlnpR7dUpqJ6hppD8aam8RCs
         FcPG7ow20dJ7gx1Mzhr44WTl1Pd0vMgXM+3o5PeT4D2crT6/w46UJ1aADfBbXCx4qx
         z6YtmblpvKKKc0w/9VGAAaqHWEEIjA3pRqOjurn5DACEbRirFP8GY+k6NE6YpD7TLv
         O2tX9Z3aX42osFJadeq3xME3t3F8Dd7jStC/eIyjIMPnfCBlOw3vDsAnKqNa6kB5RZ
         7rFHHW33qLEZA==
Date:   Thu, 17 Jun 2021 10:55:34 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Rob Herring <robh@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210617105534.0d4c02df@coco.lan>
In-Reply-To: <CACT4Y+bJNuPV2sXtGn+v0PcNP+6uFO7GdmW9XL4pQMF_vokmhg@mail.gmail.com>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
        <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
        <20210617085251.78d376d7@coco.lan>
        <CACT4Y+bJNuPV2sXtGn+v0PcNP+6uFO7GdmW9XL4pQMF_vokmhg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Em Thu, 17 Jun 2021 10:20:31 +0200
Dmitry Vyukov <dvyukov@google.com> escreveu:

> On Thu, Jun 17, 2021 at 8:53 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Em Wed, 16 Jun 2021 15:11:33 -0600
> > Rob Herring <robh@kernel.org> escreveu:
> >  
> > > On Wed, Jun 16, 2021 at 11:18 AM Konstantin Ryabitsev
> > > <konstantin@linuxfoundation.org> wrote:  
> > > >
> > > > Hi, all:
> > > >
> > > > I've been doing some work on the "github-pr-to-ml" bot that can monitor GitHub
> > > > pull requests on a project and convert them into fully well-formed patch
> > > > series. This would be a one-way operation, effectively turning Github into a
> > > > fancy "git-send-email" replacement. That said, it would have the following
> > > > benefits for both submitters and maintainers:  
> > >
> > > What makes this specific to Github PRs? A Github PR is really just a
> > > git branch plus a target at least to the extent we would use it here.
> > > The more of this that works on just a git branch, the more widely
> > > useful it would be.
> > >  
> > > > - submitters would no longer need to navigate their way around
> > > >   git-format-patch, get_maintainer.pl, and git-send-email -- nor would need to
> > > >   have a patch-friendly outgoing mail gateway to properly contribute patches  
> > >
> > > Presumably, the bot would rely on get_maintainer.pl or it would get
> > > who to send to based on GH repo and reviewers? Without work on
> > > get_maintainer.pl, I don't think it will work well beyond simple
> > > cases.  
> >
> > Some sanity test is needed, as otherwise it will end by trying to send
> > the patch to a large number of people.  
> 
> I think this system needs to use get_maintainer.pl results as is and
> any fixing/filtering/sanity checking needs to go into
> get_maintainer.pl itself.
> get_maintainer.pl is what is used by lots of contributors, the only
> option for any automated systems, what is used by new contributors if
> they don't use this system anyway. And even experienced developers
> know internal rules only for a few subsystems and use
> get_maintainer.pl when sending a one-off patch to another subsystem
> (what else?).
> 
> I don't see where we are getting if we accept get_maintainer.pl
> produces bad results and needs additional fixing in every system out
> there (dozens) and when used by humans. All systems would need the
> same filtering/checking rules and they need to keep in sync. What a
> kernel developer would even need to do to fix something (add/remove
> themselves)? Go and talk to a large unknown set of systems that
> duplicate the same additional rules?
> 
> And the only way to surface actual issues with get_maintainer.pl is to
> start using it. In fact it's already widely used as is, so I am not
> sure it's particularly bad.

I'm not saying that get_maintainer.pl produces bad result. Depending 
on what is done, it could produce a very large output.

Let's suppose that someone do something like globally renaming a
widely-used kAPI, e. g. something like:

	$ git ls-files|xargs sed s,mutex_,new_mutex_, -i 

A change like that would touch lots of subsystems, making get_maintainer.pl
to spend a lot of time processing it, and producing thousands of
entries (btw, we had a change somewhat similar to the above a long time
ago when mutex API was introduced and most of the semaphores were converted
to use mutex kAPI instead).

People that use to work with github/gitlab won't care much on doing a
change like that on a single patch, but this is something that won't
work on a PR -> email interface - nor maintainers would like to review
such big patch touching on multiple subsystems.

So, a bot would need to not only check the size of the patches,
but also the output of checkpatch.pl.

It will also need to have a timeout to abort checkpatch.pl, not only
to avoid the bot to become out of service for a long time, but also
because checkpatch.pl taking more than a minute or so is a good 
indication that the patch is not good - as it is touching too many
stuff.

Thanks,
Mauro

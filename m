Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE2BC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 08:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BB3C6143F
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 08:20:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbhFQIWx (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 04:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhFQIWv (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 04:22:51 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578F5C06175F
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 01:20:44 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id r20so4074730qtp.3
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uvsh9FowkdlOZCsHImrmtFDtHO4e4J4Ml9yBH55eO2w=;
        b=LeU7yWWKmNr8EgH12k5pvOIglWF/+/qVQ2nk0A0K4dDzKCHbhF5ySiC7rNC/gREv2c
         64Zf/Ug9c0sHoYv4dqyhMnrQ3DlYbuJs9AMDKYDKX+zIf9hHkt1739yzgVMDmtdC15xx
         ulyX0jdkeBBM5wiNgfYnO3RK0dJgtgJAEOBKhp6BoucsIR8U6Y4T4Kc/ckcDKLbQqGTw
         /tgEMVw5ctenIjOs5edYviJS28O069JUQdkEOo74L7edjUPACBJGp2BX7N09Y8aGvX3q
         NQnIZ7R2s5HatO7PGHkg+MXpmi4gARoXQieub62dHVbbhd7u0U4n6qZJubEYbdSbjI68
         iN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uvsh9FowkdlOZCsHImrmtFDtHO4e4J4Ml9yBH55eO2w=;
        b=GSYBWbzLrIFBOsGAgjo9H+8w4dG1FDJejVj75Fa2PPklpRxNlk/ZGxOlDATCtmD4Rn
         wNAvtbg7jxGgCi0iicUZtaRM8wiAVhEvoPgt8hNfwPJ8Y6iaP0Wkgx1oORgKyJMGSU++
         nayeGglWzHWY4nrI98iurYXweLVYnsjNYXU/OuswrkpcOrP5UtUh4bnYOyLFSKxwg6RZ
         JG4tOwExOUsvr0hyxvSCod92XanJfXAB2FYQLfeD19Joc8VfaTe9Fp0ePC8B/ToEE78X
         W8UCvD3asvB3tv7Cg9xtLQNGBoXdbUDIpnAQliZaMDkbc0oWluEbtnY6HU6KWqgSLb7u
         G3eA==
X-Gm-Message-State: AOAM532ykugNs+W9xUeAEVDiSUdE/Nom89FCfpVml0/Iqg766IfU0MgR
        S56J19LPpKWu8Rp/2GODOLar2WI2v7H0mgB2poq+oQ==
X-Google-Smtp-Source: ABdhPJxie9SVnib/+lt8wyEu4Cd7yrzXLKIUgDGwWSsvHIIr8PjjOWTPY2o64CRmO3fptMMqDUcBZ46zYWyTH8VmzWU=
X-Received: by 2002:a05:622a:1aa4:: with SMTP id s36mr3857873qtc.337.1623918043169;
 Thu, 17 Jun 2021 01:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
 <20210617085251.78d376d7@coco.lan>
In-Reply-To: <20210617085251.78d376d7@coco.lan>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 17 Jun 2021 10:20:31 +0200
Message-ID: <CACT4Y+bJNuPV2sXtGn+v0PcNP+6uFO7GdmW9XL4pQMF_vokmhg@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Rob Herring <robh@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 8:53 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Wed, 16 Jun 2021 15:11:33 -0600
> Rob Herring <robh@kernel.org> escreveu:
>
> > On Wed, Jun 16, 2021 at 11:18 AM Konstantin Ryabitsev
> > <konstantin@linuxfoundation.org> wrote:
> > >
> > > Hi, all:
> > >
> > > I've been doing some work on the "github-pr-to-ml" bot that can monitor GitHub
> > > pull requests on a project and convert them into fully well-formed patch
> > > series. This would be a one-way operation, effectively turning Github into a
> > > fancy "git-send-email" replacement. That said, it would have the following
> > > benefits for both submitters and maintainers:
> >
> > What makes this specific to Github PRs? A Github PR is really just a
> > git branch plus a target at least to the extent we would use it here.
> > The more of this that works on just a git branch, the more widely
> > useful it would be.
> >
> > > - submitters would no longer need to navigate their way around
> > >   git-format-patch, get_maintainer.pl, and git-send-email -- nor would need to
> > >   have a patch-friendly outgoing mail gateway to properly contribute patches
> >
> > Presumably, the bot would rely on get_maintainer.pl or it would get
> > who to send to based on GH repo and reviewers? Without work on
> > get_maintainer.pl, I don't think it will work well beyond simple
> > cases.
>
> Some sanity test is needed, as otherwise it will end by trying to send
> the patch to a large number of people.

I think this system needs to use get_maintainer.pl results as is and
any fixing/filtering/sanity checking needs to go into
get_maintainer.pl itself.
get_maintainer.pl is what is used by lots of contributors, the only
option for any automated systems, what is used by new contributors if
they don't use this system anyway. And even experienced developers
know internal rules only for a few subsystems and use
get_maintainer.pl when sending a one-off patch to another subsystem
(what else?).

I don't see where we are getting if we accept get_maintainer.pl
produces bad results and needs additional fixing in every system out
there (dozens) and when used by humans. All systems would need the
same filtering/checking rules and they need to keep in sync. What a
kernel developer would even need to do to fix something (add/remove
themselves)? Go and talk to a large unknown set of systems that
duplicate the same additional rules?

And the only way to surface actual issues with get_maintainer.pl is to
start using it. In fact it's already widely used as is, so I am not
sure it's particularly bad.

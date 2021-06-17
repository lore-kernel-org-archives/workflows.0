Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B756AC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 06:52:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 831BE61159
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 06:52:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhFQGzD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 02:55:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229666AbhFQGzD (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 02:55:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD8F461159;
        Thu, 17 Jun 2021 06:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623912776;
        bh=Y5S+jcCFo5/vSbHiAGEA+NlifSIswEwNK/Zd042nwTU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gUujJBhorl+RY4b34KdsGsiRi6vyx4Vvs2RAjgWSrcZNDbU5/G1xDhDvza2ze7bng
         VjwSS7hLD28PLHaqOPmpDDJSkICNKu5ChjwstXZ+AioHSIvtrkY2/tpi4gBoo/OmNo
         rme7PbwFiCAPKyp0w0FCnfntufiwccvCX41jEbSIgOGwGg/FY4eMWH+ltoyISurwnc
         uk4JCV02N5qIBclgL03nvuU5uHUVhhwvzbH/LwrxqeZmqrtcrJZ31cxoq3equY93iR
         gRSvjQXtzLktVKIIPZi1SDsu/kUFzaNsmoeq+NIlIfF4BqE3DAEkxE8vUs+1S+teB/
         +v/YAkMl5envw==
Date:   Thu, 17 Jun 2021 08:52:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <20210617085251.78d376d7@coco.lan>
In-Reply-To: <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
        <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Em Wed, 16 Jun 2021 15:11:33 -0600
Rob Herring <robh@kernel.org> escreveu:

> On Wed, Jun 16, 2021 at 11:18 AM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> >
> > Hi, all:
> >
> > I've been doing some work on the "github-pr-to-ml" bot that can monitor GitHub
> > pull requests on a project and convert them into fully well-formed patch
> > series. This would be a one-way operation, effectively turning Github into a
> > fancy "git-send-email" replacement. That said, it would have the following
> > benefits for both submitters and maintainers:  
> 
> What makes this specific to Github PRs? A Github PR is really just a
> git branch plus a target at least to the extent we would use it here.
> The more of this that works on just a git branch, the more widely
> useful it would be.
> 
> > - submitters would no longer need to navigate their way around
> >   git-format-patch, get_maintainer.pl, and git-send-email -- nor would need to
> >   have a patch-friendly outgoing mail gateway to properly contribute patches  
> 
> Presumably, the bot would rely on get_maintainer.pl or it would get
> who to send to based on GH repo and reviewers? Without work on
> get_maintainer.pl, I don't think it will work well beyond simple
> cases.

Some sanity test is needed, as otherwise it will end by trying to send
the patch to a large number of people.

> 
> > - subsystem maintainers can configure whatever CI pre-checks they want before
> >   the series is sent to them for review (and we can work on a library of
> >   Github actions, so nobody needs to reimplement checkpatch.pl multiple times)  
> 
> What about all the patches that don't come from the GH PR? Those need
> CI pre-checks too. We're going to implement CI twice? 

> The biggest
> issue I have on CI checks is applying patches. My algorithm is apply
> to my current base (last rc1 typically) or give up. I'm sure it could
> be a lot smarter trying several branches or looking at base-commit
> (not consistently used) or the git diff treeish hashes. 

Finding the common parent for a PR is easy. In the case of github,
all the script need is to get the common ancestor between the forked
tree (from where the PR originated) and the tree where the PR is being
submitted.

It shouldn't be hard to add this at a patch 00/xx.

Thanks,
Mauro

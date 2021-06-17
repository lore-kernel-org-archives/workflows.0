Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_NONE,URIBL_RED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EE5C49EA7
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 17:15:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0620D613FA
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 17:15:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbhFQRRs (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 13:17:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:43148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232263AbhFQRRr (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 13:17:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46D11613CA
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623950139;
        bh=ohUfXvaWqhyGJW8JcFYQJ0xVNHFWt/MtVaJwEUZB7Z4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IHhnqinbOw+3CK2j5XhhYqE81rfjpxOF6UK1aiRbJg6XI+caaKvw8mYYhVoR7unBJ
         lXItzFAxJjJ9wpFWspnLwBVdvYzDCawHsV+Nqb0Gqtta0+Iw7lWxX2Rfnrk15fWeBt
         9hfUmKhW1Lj+ktsQQ+Ri+y2sNnO9X0hzxnRsGm4e0FZAQFDepEen2oVJ5pKww/bdE6
         PKZkLmhI2msJPDioRiHFWKpbW4ivU3WfS4c2LZMvtnvt6Elo95jEMk85N6kgmHoDQY
         c187viWZweAjshKxSSX99FR8sc0KylGRy8wZi+tZTdYkJr4hFnnK56gYfPLMqJZuZS
         KebDv+w1B6ggw==
Received: by mail-ed1-f43.google.com with SMTP id s6so5018197edu.10
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 10:15:39 -0700 (PDT)
X-Gm-Message-State: AOAM531YgYKoLMtyYiNc48LDgdlyUOqpBYCkQpz62SoOxA0qpWHu63tN
        rVr1HDMRruWj9Tck7NHCUy3HVQo/DlE4VNAI3A==
X-Google-Smtp-Source: ABdhPJx9y3JKHLsLpRyhNKWoLXaeOekNhUfBYyjbVV7IGRJjNNJqngplU3agH/hzQQiJaVocjYUwS3wjTsGx7wKi8h4=
X-Received: by 2002:a50:9345:: with SMTP id n5mr7978786eda.289.1623950137865;
 Thu, 17 Jun 2021 10:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
 <20210617144741.jxachwj46ftzlgns@nitro.local>
In-Reply-To: <20210617144741.jxachwj46ftzlgns@nitro.local>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 17 Jun 2021 11:15:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJTP-G2H08OQwGRMTqP+-gxZmxw9-W4pKBuG1HgGeD0VQ@mail.gmail.com>
Message-ID: <CAL_JsqJTP-G2H08OQwGRMTqP+-gxZmxw9-W4pKBuG1HgGeD0VQ@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 8:47 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Wed, Jun 16, 2021 at 03:11:33PM -0600, Rob Herring wrote:
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
>
> It's not specific to GH at all. The same bot will be able to perform similar
> actions to emails created by git-request-pull, e.g.:
>
> - submitter runs git request-pull instead of git-format-patch
> - submitter sends the output to a dedicated mailing list like
>   pulls@lists.linux.dev
> - the bot auto-converts these requests into patch series and sends them to
>   proper destinations

This seems like 2 separate problems. The first is automating the steps
from a branch to patch series. The second is just avoiding email
configuration issues.
The first would be useful to everyone, so it would be great if we
could keep these as separate tools. This is why b4 is so great and has
been pretty widely adopted. Maintainers can plug-in whatever parts of
it they want for their existing workflow.


> This is more cumbersome to implement, though, which is why I want to get it
> done with GH first, as this gets us some immediate perks:
>
> 1. we get a fast, stable remote to pull from instead of potentially slow,
>    broken remote that's intermittently working
> 2. we can offload all sanity checking to github instead of reimplementing them
>    with our own CI
> 3. we end up doing a lot less state tracking for v1..v2..v3 with github
>
> Once the GH implementation is working, I can adapt it to also support other
> forges and pull requests sent to mailing lists.
>
> > > - submitters would no longer need to navigate their way around
> > >   git-format-patch, get_maintainer.pl, and git-send-email -- nor would need to
> > >   have a patch-friendly outgoing mail gateway to properly contribute patches
> >
> > Presumably, the bot would rely on get_maintainer.pl or it would get
> > who to send to based on GH repo and reviewers? Without work on
> > get_maintainer.pl, I don't think it will work well beyond simple
> > cases.
>
> The bot will actually rely on git-send-email, which can be configured to use
> "tocmd" and "cccmd" to get the necessary info from get_maintainer.pl. E.g. in
> my tests I have the following:
>
>     tocmd = "$(git rev-parse --show-toplevel)/scripts/get_maintainer.pl --norolestats --nol"
>     cccmd = "$(git rev-parse --show-toplevel)/scripts/get_maintainer.pl --norolestats --nom"
>
> This does the right thing *most* of the time, and if it's not doing the right
> thing, then it's the fault of get_maintainer.pl. :)

True, but I suspect the complaints will be directed at the bot rather
than generating fixes to get_maintainer.pl.

> > > - subsystem maintainers can configure whatever CI pre-checks they want before
> > >   the series is sent to them for review (and we can work on a library of
> > >   Github actions, so nobody needs to reimplement checkpatch.pl multiple times)
> >
> > What about all the patches that don't come from the GH PR? Those need
> > CI pre-checks too. We're going to implement CI twice?
>
> Most likely, yes, though we can certainly weigh how much we want to do on the
> GH side. One thing I've thought about is letting bot inject a Tested-by: into
> the patches it creates in order to reflect what's been already done, e.g.:
>
>     Tested-by: GH Preflight Bot <ghbot@kernel.org>
>
> There is indeed a lot of duplicated CI testing happening for Linux patches,
> but it's a separate problem that I believe is being looked at by the Kernel CI
> folks.
>
> > The biggest issue I have on CI checks is applying patches. My algorithm is
> > apply to my current base (last rc1 typically) or give up. I'm sure it could
> > be a lot smarter trying several branches or looking at base-commit (not
> > consistently used) or the git diff treeish hashes. What I'd really like is
> > some bot or script that's applying series and publishing git branches with a
> > messageid to git branch tool. 0-day is doing this now. Basically, the
> > opposite direction as others have mentioned.
>
> b4 will try to do this for you with -g, but it will only check against the
> last 10 tags, as otherwise this takes a very long time, especially on series
> that modify a lot of files. It can probably be a lot more intelligent about it
> and work more like git bisect. I'll look into improving this feature.

Humm, I can't seem to get -g to tell me anything but 'current tree'.

How I think this could work is extracting all the files and their base
treeish hash from a patch and iterate thru branches (user and/or
project specific) and find branch which has matching set of treeish
hashes. Seems like this wouldn't be too hard for someone that knows
the git internals.

Rob

Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF054C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:02:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99E5C611CA
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 14:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhFQOFF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 10:05:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:51588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229915AbhFQOFF (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 10:05:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9299F611CA
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 14:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623938577;
        bh=ZlymbQVpOvwQlFwvq7bFCqeXsmp3X5OQzMjftv7lFGs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Uf9AKap/BI3zTNdRAZwf2njFJZOMG4qcDdNPcDzOpxA2+ZPkM23jwj9xcEP/mZLK8
         gjg7l9Rsvt9yc0GkNW4NNtTTImZbMIX8J0fWYVJ2MK83ZFNdYqY7aTMgN0tWAFAliL
         rCjntyuSj5sUXm05T7SS+EBs23ZRii4NRYir6UM7xCG3KrSyg7ewUtu4O5FIZB7kv0
         o5T2Z/0wYXy8uoghxC1GZsl1wMQptcSIEIzWRALY7XfEQqL7LijeAchvZ6WpVN3X+P
         LJOj+NvI1YbXPhiM17Po8gCsQGlhcqw9oyT5skQ3vtGfmlyhi0qqmQWurJyL0CsW0u
         UaNtP4qgIUBcQ==
Received: by mail-ej1-f54.google.com with SMTP id nd37so10125551ejc.3
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 07:02:57 -0700 (PDT)
X-Gm-Message-State: AOAM5325M3/DNbE5mB3f1+buNVlkA6Z6a3lIcQ9o0jZm+VpFmmnmqZRf
        y7YGlDTjU+4yRPPFWOkhugg8TliBnlhNT4/zAg==
X-Google-Smtp-Source: ABdhPJyHGmdAQ0boUnbCK4H3DiDYLR/JsMX4Db57T3yOKo74UPZ/YoLWxBiXS9nrPxjBGE1fgZDQHTW789ePW620Rrw=
X-Received: by 2002:a17:906:82cf:: with SMTP id a15mr3658553ejy.359.1623938576096;
 Thu, 17 Jun 2021 07:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
 <20210617085251.78d376d7@coco.lan>
In-Reply-To: <20210617085251.78d376d7@coco.lan>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 17 Jun 2021 08:02:43 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKWxpVWdC5teZKezLy-Buag-8mkUnkZvdnsZ_Ou9aDsRQ@mail.gmail.com>
Message-ID: <CAL_JsqKWxpVWdC5teZKezLy-Buag-8mkUnkZvdnsZ_Ou9aDsRQ@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 12:52 AM Mauro Carvalho Chehab
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
>
> >
> > > - subsystem maintainers can configure whatever CI pre-checks they want before
> > >   the series is sent to them for review (and we can work on a library of
> > >   Github actions, so nobody needs to reimplement checkpatch.pl multiple times)
> >
> > What about all the patches that don't come from the GH PR? Those need
> > CI pre-checks too. We're going to implement CI twice?
>
> > The biggest
> > issue I have on CI checks is applying patches. My algorithm is apply
> > to my current base (last rc1 typically) or give up. I'm sure it could
> > be a lot smarter trying several branches or looking at base-commit
> > (not consistently used) or the git diff treeish hashes.
>
> Finding the common parent for a PR is easy. In the case of github,
> all the script need is to get the common ancestor between the forked
> tree (from where the PR originated) and the tree where the PR is being
> submitted.

I'm not interested in doing it in Github. It's about applying a patch
from a list, so how would Github help there anyways? It's not easy in
git either because there's not a command to do it AFAIK. I suspect
much of what's needed exists as git-am can find the merge base. I
think it's something like for a given set of branches or refs, which
ones match all the base treeishs in the diff. Then you'd know for
certain that the patch would apply to those branches. If that doesn't
work, then you could fallback to just try to apply patches to
different branches. It would be nice if the fallback could work
without doing a checkout though.

> It shouldn't be hard to add this at a patch 00/xx.

Not hard and we have that with base-commit, but that's left up to the
submitter. I don't use base-commit in my patches because it's more
work. For example, it doesn't work if you didn't setup a tracking
branch. In general, for anything left up to the submitter, we have to
deal with the submitter not doing it. If it is built-in to the tools
(git) then we can start relying on it.

Maybe if patch 0 became more automated like a git PR email, then it
would work. But then what happens on single patches without a cover.

Rob

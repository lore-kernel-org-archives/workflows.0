Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3177AC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 09:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 166C1610CA
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 09:33:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbhFQJfr (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 05:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhFQJfr (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 05:35:47 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D635C061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 02:33:40 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id k9so1274318qvu.13
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 02:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VO825Lk1s55Z/6it3cjFoEzdHtcyOYuklXXHt+fMR6Q=;
        b=Rwu6juI3+aDNTGB9WOFkic4DBe7sk1RK+eGSnk8d1Fge1wF49Ds5rD+mxZvZrgxYAW
         obRlwqYjZuwalh9Sy3eQUZ4uGDbMV5PbfQrIYltN50g0QCVYYZeDmWUN82wqxjIF49US
         ZrfGH9xQ24VfR0RMFJamFUE22Ks6lJ+XShSU74wiMCEvtNzb+Kv9IZxPCHCPsY+vEA9c
         L+KKkDVUejC56YyeUHf+nRgu5I0t0slz/YFQ3xZhEJVMitqtd6XfArdoq0b3TGWChE7z
         7+aZ+zDUUFaVCr8HZzpre9Q1YgeOgMpL96JH7cwxUEpiFgtbC3Y+ucsx31t9UsPBpAu/
         WH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VO825Lk1s55Z/6it3cjFoEzdHtcyOYuklXXHt+fMR6Q=;
        b=E7+6Vy2oULDc1R0YQomwui2Ge1WRm88UZi9I+L/gMom2am4jjOQrN8dsJfleB4uerQ
         BOl9XZHqV0N9ERPI07uB2lt7hGiJOZR8CThj2lRx1h78zHw99ZCxsmzQBmOIIRigHnmP
         VGEG0KL+xzupWKJdQIMY84PN5TqM9DH9ZKz3Bq4uDScJPNt7ZSs4eP/BcQnQvUEobniy
         Cs3CTwKQdVLHMcqCJ0aIJf1PMWtQGeNiVWunPsHovehCUBfP1DELYFMBiITyQblxibmg
         jtfqNh/YgNkSCrwpAcNsfkphmXoXI8dgwPnFjw2T6QEwCs5dWRwJ0DqQ29d+m8T1vykJ
         KGww==
X-Gm-Message-State: AOAM532fGiB2w0DoPI8uiixDr+Ku3JSd7CbPl6OLovaYpOavtxzJMtj0
        bS1/oT7GpD5q2HrHJ7sWoqYk8yFZEMf5uwV6VF/xf+uBU1kHtg==
X-Google-Smtp-Source: ABdhPJzZh/8Q7oezpHmtnUKrlsl5CiNEpPI9pO9DS300DEDEuCEbXJ4vICWaUo6n4f+W7sb8eDXpKZ5H5G5UWZZV/rc=
X-Received: by 2002:a05:6214:80c:: with SMTP id df12mr4912108qvb.18.1623922418889;
 Thu, 17 Jun 2021 02:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
 <20210617085251.78d376d7@coco.lan> <CACT4Y+bJNuPV2sXtGn+v0PcNP+6uFO7GdmW9XL4pQMF_vokmhg@mail.gmail.com>
 <20210617105534.0d4c02df@coco.lan>
In-Reply-To: <20210617105534.0d4c02df@coco.lan>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 17 Jun 2021 11:33:27 +0200
Message-ID: <CACT4Y+bmFbW_fkQJmLugGjt4o3YjyoqBMwq1qeuggF-P+Rz6dg@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Rob Herring <robh@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 10:55 AM Mauro Carvalho Chehab
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
>
> People that use to work with github/gitlab won't care much on doing a
> change like that on a single patch, but this is something that won't
> work on a PR -> email interface - nor maintainers would like to review
> such big patch touching on multiple subsystems.
>
> So, a bot would need to not only check the size of the patches,
> but also the output of checkpatch.pl.
>
> It will also need to have a timeout to abort checkpatch.pl, not only
> to avoid the bot to become out of service for a long time, but also
> because checkpatch.pl taking more than a minute or so is a good
> indication that the patch is not good - as it is touching too many
> stuff.

Hi Mauro,

Interesting point.

But maybe it still can be incorporated into get_maintiners.pl?... at
least some part of it?
It may be useful for a new contributor who invokes it manually to get
the same "your patch is probably too big, consider splitting it"
message. And any other automated system probably wants the same
threshold for "running too long"/"returning too many emails" w/o
duplicating the values on its side.
Not sure what's the best interface for this... either
get_maintiners.pl can accept an additional flag that will make it fail
for the "no, don't mail this patch automatically" case. Or it can
always produce an additional recognizable message at the end for
"that's too many emails, consider splitting the patch".
What do you think?

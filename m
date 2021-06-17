Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DF0C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 09:52:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10337613F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 09:52:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhFQJy5 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 05:54:57 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:40537 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbhFQJy5 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 05:54:57 -0400
Received: by mail-ua1-f44.google.com with SMTP id r9so528827ual.7
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 02:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bXaAYqQ68sywjKIDL/epk/+JNHFW3fQ84KE59BzqUhM=;
        b=LjSuGoKbop1fQep/9fDj4xtqZ1h78hNGMrGDOFxzPgWtAyxypIBHrG6C+QwZoUSRXT
         eFwkhmlbMkU1tZwRC7pEDlILW7psyCvygvEsY1X/R4WbiF6ntn8TnK7vDdf0zUUR+J94
         KY1CkzsVn3oSIE8YOeooKnliZim7/m5hHPAiVA8xnJ61Nc47leDFOyjNcSL1QBjAFGde
         RMHeMAyAgsxKbV3762+tvHsXqyXhL1/LKHqUyVqk80wc6yRVCU/oIMdKUhQeqKNISb2D
         EuHVxdR+4kMYgGct1KN4WCkZggkE4hGHjysw6sfW0h2QUgf51GCZZxSWBbJjNb3QAFcC
         NAqw==
X-Gm-Message-State: AOAM533f6CQ1vqT8wNG05q493ZbbZ+RScwGJ7F6q1KGSYpBpUzY7Ap3L
        6isIlMsHgxWzKw2nUJIBgXSUUpBXVkXNDhxSwIk=
X-Google-Smtp-Source: ABdhPJx9aX/BJ8I1SbvcN7QBoYUhefRLrt+lRLVGHjxeRPZAXrGSvKzvOC+1us2F2V898m7XKwmagxu7GnadPNxbHHI=
X-Received: by 2002:ab0:647:: with SMTP id f65mr4180906uaf.4.1623923568374;
 Thu, 17 Jun 2021 02:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
 <20210617085251.78d376d7@coco.lan> <CACT4Y+bJNuPV2sXtGn+v0PcNP+6uFO7GdmW9XL4pQMF_vokmhg@mail.gmail.com>
 <20210617105534.0d4c02df@coco.lan> <CACT4Y+bmFbW_fkQJmLugGjt4o3YjyoqBMwq1qeuggF-P+Rz6dg@mail.gmail.com>
In-Reply-To: <CACT4Y+bmFbW_fkQJmLugGjt4o3YjyoqBMwq1qeuggF-P+Rz6dg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jun 2021 11:52:37 +0200
Message-ID: <CAMuHMdWRL4Ce=90cQctCX-QnC3V7bG8jVe5zwsd=guabohRB1A@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 11:33 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> On Thu, Jun 17, 2021 at 10:55 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
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
> >
> > People that use to work with github/gitlab won't care much on doing a
> > change like that on a single patch, but this is something that won't
> > work on a PR -> email interface - nor maintainers would like to review
> > such big patch touching on multiple subsystems.
> >
> > So, a bot would need to not only check the size of the patches,
> > but also the output of checkpatch.pl.
> >
> > It will also need to have a timeout to abort checkpatch.pl, not only
> > to avoid the bot to become out of service for a long time, but also
> > because checkpatch.pl taking more than a minute or so is a good
> > indication that the patch is not good - as it is touching too many
> > stuff.
>
> Hi Mauro,
>
> Interesting point.
>
> But maybe it still can be incorporated into get_maintiners.pl?... at
> least some part of it?

There's definitely room for improvement.
For changes to drivers, it usually works fine without a need to do
manual tuning.
But if you touch a Makefile or Kconfig file, get_maintainer.pl may
list all former contributors to the file.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

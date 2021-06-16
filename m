Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6CAC48BE5
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 21:11:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B78CF61042
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 21:11:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233872AbhFPVNx (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 17:13:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:41606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233836AbhFPVNx (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 16 Jun 2021 17:13:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE92161375
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 21:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623877906;
        bh=bjUcYQd0hF103iPYrZUsOnuTwxR83Z7RV41fDvP0ImA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iQsUDkXXjGq7ur6TIUhjXKG48UDQ4aXodzcA88yEtykRYzRk0ywk1yBwHTVT5fpU5
         9MdNe1D6twN0FvASHqZZcAssV1Jhvcp6mx9Xi9HSr23P62rPhBwqJrSX2MnSSDjO2h
         TcDyDOzBILfYzl47kEBm9wg/M6u2w4SdAV+MZFL+6Rxc+mHnOnSdxUuxjkVaPv91fw
         4Yc99E/6odQ+DVtffdTm2ghaf8jeRJtV5CZ4SrYGRSGvj+GjvwdBO7WoEyEDRA5j+E
         d9vmUGmXtVmme+Y+sz1XNxf8naKbhJJiQ9Z47FeFeMdy5751wVwvu9HEvNvHjbgYaM
         15I32PulND7hw==
Received: by mail-ej1-f52.google.com with SMTP id he7so5985215ejc.13
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 14:11:46 -0700 (PDT)
X-Gm-Message-State: AOAM531uKnRYHpvfxQcW889aglWiI0hojvJ2yAofYHGeCXzDwGi473F+
        Y+LKf5ShvAaFXGjjr6HO9GSl7kPRdGrUZWbpwg==
X-Google-Smtp-Source: ABdhPJyVMfrlebtKRtcJyx6t7AypEPOQweXNr3VSexV7IbcqAA+2HRVtO5zES6r+Pe7dlCs7u/D8q7hEk3yc/IqWS5Q=
X-Received: by 2002:a17:907:3da4:: with SMTP id he36mr1537316ejc.108.1623877905421;
 Wed, 16 Jun 2021 14:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
In-Reply-To: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 16 Jun 2021 15:11:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
Message-ID: <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 11:18 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> I've been doing some work on the "github-pr-to-ml" bot that can monitor GitHub
> pull requests on a project and convert them into fully well-formed patch
> series. This would be a one-way operation, effectively turning Github into a
> fancy "git-send-email" replacement. That said, it would have the following
> benefits for both submitters and maintainers:

What makes this specific to Github PRs? A Github PR is really just a
git branch plus a target at least to the extent we would use it here.
The more of this that works on just a git branch, the more widely
useful it would be.

> - submitters would no longer need to navigate their way around
>   git-format-patch, get_maintainer.pl, and git-send-email -- nor would need to
>   have a patch-friendly outgoing mail gateway to properly contribute patches

Presumably, the bot would rely on get_maintainer.pl or it would get
who to send to based on GH repo and reviewers? Without work on
get_maintainer.pl, I don't think it will work well beyond simple
cases.

> - subsystem maintainers can configure whatever CI pre-checks they want before
>   the series is sent to them for review (and we can work on a library of
>   Github actions, so nobody needs to reimplement checkpatch.pl multiple times)

What about all the patches that don't come from the GH PR? Those need
CI pre-checks too. We're going to implement CI twice? The biggest
issue I have on CI checks is applying patches. My algorithm is apply
to my current base (last rc1 typically) or give up. I'm sure it could
be a lot smarter trying several branches or looking at base-commit
(not consistently used) or the git diff treeish hashes. What I'd
really like is some bot or script that's applying series and
publishing git branches with a messageid to git branch tool. 0-day is
doing this now. Basically, the opposite direction as others have
mentioned.

> - the bot should (eventually) be clever enough to automatically track v1..vX
>   on pull request updates, assuming the API makes it straightforward
>
> A this point, I need your input to make sure I'm not going down any wrong
> paths:
>
> - My general assumption is that putting this bot on github.com/torvalds/linux
>   would not be useful, as this will probably result in more noise than signal.
>   I expect that subsystem maintainers would prefer to configure their own
>   GitHub projects so they can have full control on what kind of CI prechecks
>   must succeed before the series is sent out. Is that a valid assumption, or
>   should I be working towards having a single point of submission on each
>   forge platform (Github, Gitlab, etc)?

I think it needs to be per maintainer in terms of what checks run, but
if submission is per maintainer project then the problem will be how
does the submitter know where to send something? get_maintainer.pl
tells them? It doesn't do a great job of that IMO. There's not a clear
distinction of who applies my patch and others Cc'ed (file
maintainers).

I've kind of reached the conclusion that relying on submitters to get
it right is never going to work (is Cc the DT list for DT patches so
PW picks them up so hard!?). I think the model needs to be send
patches to 'the kernel' and then maintainers have tools to extract all
the patches they are interested in (the planned lore
local-email-interface).

I'm sure there are maintainers who want nothing to do with Github or
anything else. So it's got to work without any maintainer involvement.
The submitter can't be expected to figure out who will and will not
take GH PR based submissions.

Rob

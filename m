Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC24C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 06:37:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F03F661465
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 06:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhFQGjg (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 02:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhFQGjf (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 02:39:35 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 572D7C061574
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 23:37:27 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id df15so225484qvb.10
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 23:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=csjDRN0pB2UDGUSx+N23T677EjkKR82hDHD3flWoOag=;
        b=SkFI9Id+09jGq6HlNXbhqpEZELOaJUCd9/LsNjGgxlijWQZQaLIQlDwHxkMWfPeG6X
         x5ObKEos30lCfdXZFEgCQfen/JXDgwkdcPohWzcqVwQULjtmbZOD6N4C4+01iJwwHGdu
         fDEoCDsO3eJxuzrkuHzHgkBicdzeVCqJQ5b4Mo3qH/oiBbxytMCrR8PW/blEO6jZ8RQh
         alVapR0p607jKcTg3yccOusjfYzjjlX+t+iWJ2zCnt8jjX8chvpTg/lypAAQy1/UTwPZ
         yC9GMdS3gCWDRDYC/Xxcf71FLsXRT+RGwJ0gzKT8VLSKFZqcxpUSYiIjko4Ctq8QM5mW
         bN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=csjDRN0pB2UDGUSx+N23T677EjkKR82hDHD3flWoOag=;
        b=gahqJ0gldRnzKUY8biCV0O1EaKZ75/FX4cq7ud663Yf8HBURJmCaSk5wOeMhQOAaLk
         FXfBrsDGozbg3qaUWVBvBa3fhQBGsCUx4mHZ/pQBh3b/sI00qRm2Z5bZzyRWnIA1wpR5
         78hox2OlmVlYHWQlYgH5MJc1jwt6bjpw8EuZaU5B6h+j6MbZRFpKZl4Anma2clBgkjms
         bo2dPxGAkFwdICncnoMDYjH2VC5bZGAa0hdxPOY1jZCTtsXbKD9cu1LdxxWWMNHJx0wH
         DzYETy+QeStXZfx84mn5hQL4+4q7ftpIWrNaWYPIfNavbdi1PJckfUhMXIkKjd3vpsnG
         FNFg==
X-Gm-Message-State: AOAM532iqy8nEMtZDMh69u9Ryw02bB2gzxRV5UQHAVO+I24/1VWipax3
        MP+XbPF7BiolFiM0YnFvN2JImvMpaoA67uok/4Hrl0gM38zS/w==
X-Google-Smtp-Source: ABdhPJxy5VuzfrI0i48VEXhV3J6vQIYBKGFl2v74yo3L16lTrLFz2zg+pN5+eJs0fGnEIlg73LZ1pqsM9r/udhHdBBo=
X-Received: by 2002:ad4:4084:: with SMTP id l4mr4369183qvp.37.1623911846175;
 Wed, 16 Jun 2021 23:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
In-Reply-To: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 17 Jun 2021 08:37:14 +0200
Message-ID: <CACT4Y+ZYG5EB3re0Lby920Atkmb7e_FthN_5XO881XOhF_iJzg@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

think On Wed, Jun 16, 2021 at 7:18 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> I've been doing some work on the "github-pr-to-ml" bot that can monitor GitHub
> pull requests on a project and convert them into fully well-formed patch
> series. This would be a one-way operation, effectively turning Github into a
> fancy "git-send-email" replacement. That said, it would have the following
> benefits for both submitters and maintainers:
>
> - submitters would no longer need to navigate their way around
>   git-format-patch, get_maintainer.pl, and git-send-email -- nor would need to
>   have a patch-friendly outgoing mail gateway to properly contribute patches
> - subsystem maintainers can configure whatever CI pre-checks they want before
>   the series is sent to them for review (and we can work on a library of
>   Github actions, so nobody needs to reimplement checkpatch.pl multiple times)
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

Hi Konstantin,

This is exciting!
I think it will be more useful in the long run to have it on a single
github repo with multiple branches (single point of submission). The
advantages I see are:
 - having single integration point with testing systems
 - no version skew, no broken deployments that need maintenance
 - no radically different configurations, these rules are like code
style (does not matter which one exactly we use as long as it's
consistent across the project)
 - much higher RoI for testing/CI/tool experts contributions (this
addresses one of the main pain points of the current kernel testing --
it's simply not possible to contribute to it. Why would I contribute
only to a single subsystem testing that runs on somebody's personal
machine which may disappear tomorrow? and how do I even choose one
subsystem if I don't have personal interest in any?)
I also assume that lots of maintainers either won't have lots of
interest in configuring/maintaining this, or will have some interest
initially but will lose it over time.
For once: it will be possible to have proper documentation on the
process (as compared to current per-subsystem rules, which are usually
not documented again because of low RoI for anything related to a
single subsystem only).

If we have a single point of submission, will it be possible to have
some per-branch/subsystem settings? If yes, that may be a good
compromise: having a well-defined set of preferences (maintainer can
choose A or B, or opt-in into a new static check or not) that are
managed centrally.



> - We can *probably* track when patch series get applied and auto-close pull
>   requests that are accepted -- but it's not going to be perfect (we'd
>   basically be using git-patch-id to match commits to pull requests). Or is it
>   better to auto-close the pull request right after it's sent to the list with
>   a message like "thank you, please monitor your email for the rest of the
>   process"? The latter is much easier for me, of course. :)
>
> I'll probably have more questions as I go along, but I wanted to start with
> these two.
>
> Thanks,
> -K

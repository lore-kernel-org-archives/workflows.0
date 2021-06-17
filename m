Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_RED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D52C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 20:43:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7D46610CD
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 20:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhFQUpM (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 16:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbhFQUpM (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 16:45:12 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF0AC061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 13:43:03 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id t17so5924795pga.5
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 13:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hgi6gBgUXoAg1WLfO7wk8pQo3kpyPyhXHW62cqXwst8=;
        b=KD4IO7hNy6zeLTb88nfjh9o/dopoZAoK2RxzTj2yCSqxjMLyVyyMS+5y/IBBbzD+nx
         IhvACgF+yb+mnhCT8YLCM+JAFeull2UMLVnTh5ynPNrqZKHg7lwIMSLOWLfNdzYLGDb5
         7laGKVf/wPVw9lIFoYuqEZtkbNILmDq2ygOItN2YY83uACXsEz99wnNZKAEaHxUtvZab
         1OmJ/ZUh2/iSX+WH0l9jZFEAtCRws2+lnn605Id4027crQi2lJ1wNHxPk0sq9ADyjy8h
         2+7Cg0mXNl7QWW7l+x5zLp2ScDqnlrhkIbOl4C9Nj9arpn0ucTwOUqBlzQJa97wW71cA
         2ibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hgi6gBgUXoAg1WLfO7wk8pQo3kpyPyhXHW62cqXwst8=;
        b=Yz4E8k5gGerOvXGLdxHIZiYKA9DBcV3cBqh5VsFnZ4Lm1NI65S0fPcqlsgVDLHNjpv
         mDhF1pbVHghwrlWiczpgS96OQJqwBT2AtBF17M/B4OCiY7UvaFuRerEjul1VFyyXJOWp
         Ao2JMgCu/7X1JDk+s3Rjx/XUyGrj2MgkXGdHItCGJeyT3mHPjRIfdjNUeQcIdD7/nhX4
         m+r4vxBQ/7kLLTl6AgaHkpfhman1yGjVR63hiMBPDu3K2BDpddqGzBJ67OgUYjLOkfsC
         w46wyppF99Jk8SU2as0OIZUjRXx7LvHQuNPp+9qQw3N1g6EOIAR34/Y2UJ0Q2l7adTmF
         amvA==
X-Gm-Message-State: AOAM530WG1NX4Ll7LFSdcthC7QDop09JqJdYPJZtaguB6cqP8KFQ+bgL
        mOXlYi/y0bEm3h5by9mQ1E+CIvfvtWnBlzJRMGBJhA==
X-Google-Smtp-Source: ABdhPJyzcZ4bh2BPYLYrocjdlYlE+kK4gtXjpL9yZW6k3hjUeR8L/m5DEwllaEL7n2qNd9YnFJ7srHWpThW2UB6Kgyw=
X-Received: by 2002:a63:485a:: with SMTP id x26mr6634594pgk.159.1623962582395;
 Thu, 17 Jun 2021 13:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
In-Reply-To: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 17 Jun 2021 13:42:30 -0700
Message-ID: <CAFd5g44cerCLF6yd_voFAEr9B+G4bLPve-ARVv8N30pHj9Zdzg@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Jun 16, 2021 at 10:18 AM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Hi, all:
>
> I've been doing some work on the "github-pr-to-ml" bot that can monitor GitHub
> pull requests on a project and convert them into fully well-formed patch
> series. This would be a one-way operation, effectively turning Github into a
> fancy "git-send-email" replacement. That said, it would have the following
> benefits for both submitters and maintainers:

Neat! I have been going from the other direction, trying to take
patches sent to LKML (actually from the kselftest mailing list) and
upload them to Gerrit:

https://linux-review.googlesource.com/

My thinking was that most developers would want to keep sending
patches via git-send-email, but sometimes it is really nice to have a
side-by side diff without having to download a patch and apply it
somewhere. Also, sometimes it is nice to have all the comments on code
in a single place (I have got it able to extract comments from emails
- although not super reliably).

I was thinking it might be nice to be able to go both directions, but
it had not been on the top of my priority list.

> - submitters would no longer need to navigate their way around
>   git-format-patch, get_maintainer.pl, and git-send-email -- nor would need to
>   have a patch-friendly outgoing mail gateway to properly contribute patches

I like having the tools run automatically, that was something I wanted
to do with my LKML-Gerrit-Bridge at some point.

> - subsystem maintainers can configure whatever CI pre-checks they want before
>   the series is sent to them for review (and we can work on a library of
>   Github actions, so nobody needs to reimplement checkpatch.pl multiple times)

That would be awesome!

> - the bot should (eventually) be clever enough to automatically track v1..vX
>   on pull request updates, assuming the API makes it straightforward

Yeah, that's something I have wanted to do with the
LKML-Gerrit-Bridge. This would be super awesome!

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

I would like to be able to run KUnit tests, and I am sure other
maintainers would want to run other tests. Beyond that, I don't think
I would want to deviate from your above defaults too much.

> - We can *probably* track when patch series get applied and auto-close pull
>   requests that are accepted -- but it's not going to be perfect (we'd
>   basically be using git-patch-id to match commits to pull requests). Or is it
>   better to auto-close the pull request right after it's sent to the list with
>   a message like "thank you, please monitor your email for the rest of the
>   process"? The latter is much easier for me, of course. :)

That would be super awesome as well. My plan with the
LKML-Gerrit-Bridge was to leave it open until applied and then have
some sort of timeout.

> I'll probably have more questions as I go along, but I wanted to start with
> these two.

Not sure how far along you are with this. But I would love to see this
happen. It sounds like you are planning on supporting most of the
features I am trying to get in LKML-Gerrit-Bridge, but not all - I
mainly would like to get patches uploaded from the mailing lists. I am
not sure how much we could collaborate here depending on how far along
you are. I saw some concerns in some other emails about relying on
open source, Gerrit could be a solution to that. Anyway, let me know
if you are interested in my project. You can see my code here:

https://github.com/google/lkml-gerrit-bridge

Also note, I said "I" above, but I have gotten some contributions from
others. I'm not trying to take credit away from them, more that I
don't want them to take blame for any of my bad ideas. Also, this is
in NO WAY a plug for my project. It's not very stable right now, and
has some issues - it is very experimental. I am just hoping that it
can maybe be of some help to you.

Cheers

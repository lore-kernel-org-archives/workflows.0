Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A16C48BE5
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 20:25:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50D8861606
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 20:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbhFPU1T (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 16:27:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233390AbhFPU1S (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Jun 2021 16:27:18 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2850C061574
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 13:25:10 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id h4so6379176lfu.8
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 13:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W36PKqjyCgJx3swhfk6AEGvf2MC/9qZadAzrVClXIqA=;
        b=fIyzHmBFOcQP8W9H8TkghprkZWvYg/vPP8GAW8i2sCuk/vnV3F/IKYoVCmMJajsFt6
         fi/9oSceupuB+SAYjT9r4hXQCLE/wnfpMvrQ8jVQ/wp2j0cpcHrCIeJ/BQ4hWXM/+CHT
         FBE8fPYNXG9zLJSIsL+ef7RPoyOcnkpoaC3e4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W36PKqjyCgJx3swhfk6AEGvf2MC/9qZadAzrVClXIqA=;
        b=jcDt9LrieTuK3kCldThpUuB2qW127FjhpdovtB/tFHli5LFfAC1Xb/pHCJlSJhFI7W
         KFV/LHsDaU2xh8Pw1Fx+dZTOxoWT4j6QdKfzdTUDpWkr7tZ6vfcuISj9MQEDj3vaP6ac
         CxnEtC0FlPYE/8q6+5seBuVEXNav+INLo8RPk+gz3FDrF+nQWeEKfZaBhdtsroAKRt99
         X9TEtpx83p49LJgxD04ITe9HH4PDpuRmVGnae3jQw2ccJBNDHRHXNYrhxo0IPPSConWO
         C8m2jvoIS60RpUcJ+bHObBKJfqd6R5F/zQp0desNbGuGZfdbcdteGRvDX1efXhOjCJVN
         27ig==
X-Gm-Message-State: AOAM531rrdYMXsVE8drZoWl3A0FLSAihKQBe+9evoGs1scdwntJF+A0w
        gkaQcjTjAJ/pArrhnMFn1MB5QalcIv/7sxPHdsI=
X-Google-Smtp-Source: ABdhPJxLKO26XmIIwbXPvzvTun0xwbtdLfM/MkxX1MQojDy9n+J154lUfxgUCqUPYNNPbNh9m6r8kw==
X-Received: by 2002:a19:690f:: with SMTP id e15mr1151708lfc.192.1623875109009;
        Wed, 16 Jun 2021 13:25:09 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id s28sm397160ljc.34.2021.06.16.13.25.08
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 13:25:08 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id i13so6369200lfc.7
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 13:25:08 -0700 (PDT)
X-Received: by 2002:ac2:55b7:: with SMTP id y23mr1109625lfg.40.1623875108287;
 Wed, 16 Jun 2021 13:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
In-Reply-To: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
From:   Linus Torvalds <torvalds@linuxfoundation.org>
Date:   Wed, 16 Jun 2021 13:24:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=whEZ23h_Gvg3aOuQgXbUjxn6gwvcS2dHawkPgpDwKmssw@mail.gmail.com>
Message-ID: <CAHk-=whEZ23h_Gvg3aOuQgXbUjxn6gwvcS2dHawkPgpDwKmssw@mail.gmail.com>
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
> - My general assumption is that putting this bot on github.com/torvalds/linux
>   would not be useful, as this will probably result in more noise than signal.

Yeah, I've had to turn off all emails from github because it's too
noisy. Github also makes it very easyt to "invite" people to be team
members, whether they want to or not, so I'm a "member" of random
projects. There needs to be some way to make this _very_ much opt-in,
not "anybody can do anything whether the target is ok with it or not".

I do think that having a way to generate patch series would be good,
but I really really hope your robot would have

 (a) some limit on sizes

 (b) check that the commit messages are well-formed

I've seen a lot of github code that doesn't have the Linux kernel kind
of "good commit messages required".

And no, it's not just about proper sign-off chains. It's about things
like "proper one-line header". It's about things like "actual
whitespace and proper line breaks and indentation for quoted text
etc".

I see way too many projects that have a mess of unwrapped (or purely
auto-wrapped) wall of text for commit messages. I think some of the
"do commits in the browser" workflows seem to think it's ok to have
reflowed text and not have proper formatting of quoting (error
messages) etc.

Yes, yes, that happens in emailed patches too (I actually spend time
on emailed patches making sure 'dmesg' snippets are cleaned up etc -
not everybody does), but it happens a _lot_ in other projects that
don't have quote the same quality requirements for commit messages
that we do.

               Linus

Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63010C48BE6
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 18:11:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28EF161027
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 18:11:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbhFPSNl (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 14:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhFPSNl (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Jun 2021 14:13:41 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3862DC061574
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 11:11:35 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id p184so4275148yba.11
        for <workflows@vger.kernel.org>; Wed, 16 Jun 2021 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u+8af1CFPSAepoNG4MQoYgPhi9JnnkajIyv11hAvWfY=;
        b=Hcdm5Z5ODlUkMcDXCdiPlrTpcR8ki3DUBo1+1+uzL2AlHxSBVY6krjt7siq/DBY9Mb
         Muhk7/7yQ+8BmFhBD+jbaD9A2L8RsZpqeuGYAidvGP0IK5DsIkomN0QFBSSNOUZyXPOz
         rKrJwTkwMqploagZAAU9fJY9EcTcdqQhM6NBsWPBVRjHBDKCdQLjXGbG2wq/rT+ukd+i
         P5PEpKEMqGh8O+NAo8blqksJnAnJ9HZlbmTdudrv7BE+5YQmGKCKl4L+UVOdTGGCoxEL
         mbHlMKYNUyhlhrNvH3usdh8z1sRl15R2iyiMbanEP6mTBqhEnx34d1lVYbtotqHFtfq4
         1g8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u+8af1CFPSAepoNG4MQoYgPhi9JnnkajIyv11hAvWfY=;
        b=hQdndLZLWnD72ap6tTHAqihmHgMkqvNeyBAGbr5CBfE86woXkKVBdiZ0AHVLggTsi+
         a2KqCUkYZzSj+JrEDBVLuYLbxTHbWP9g5PHPsbCbW0HHjriR/erY0iGv0drgnip6WGOm
         MH/+R5XFvdlqADUNGpCYGfE70aS4uIu3uOXICmYrqkJkiKtR+l8FZC565ucI3awcs2q5
         2jA41HTWIJ6MWhmSm4lFiCBA4qHqBkNUIu8bJPCShP4KuSZVVxrd8KcBlrPv0lMAffHJ
         38OgD85fKeMf8Bc6ciDtmzMex9I7XUf6m8UkGLRgCZgR8VHid+wAl5FhDXlnLwUigkSb
         1/RA==
X-Gm-Message-State: AOAM5327qzqmUgm8/xMZyw1qV0KL022Y7eF622Xcd7Ef/TscIj93f0as
        +UlXzfrwWLxs3ewnqv9p1eOKsGrm6g2Dl4ef2hc=
X-Google-Smtp-Source: ABdhPJyxMLDJL1EnkO39krnxACEJXPGK0bGpxj/H9gbl3vpquerwixPFDOrVhLUi/5xqSS/IUoA6QlANyBV35t1a8+M=
X-Received: by 2002:a25:cc55:: with SMTP id l82mr541366ybf.26.1623867094430;
 Wed, 16 Jun 2021 11:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
In-Reply-To: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 16 Jun 2021 20:11:23 +0200
Message-ID: <CANiq72=qmGRTUYzXs_FP0Y2_pJOm=5O7bSTBwXawH29oTApuuw@mail.gmail.com>
Subject: Re: RFC: Github PR bot questions
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

On Wed, Jun 16, 2021 at 7:18 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> I've been doing some work on the "github-pr-to-ml" bot that can monitor GitHub
> pull requests on a project and convert them into fully well-formed patch
> series. This would be a one-way operation, effectively turning Github into a
> fancy "git-send-email" replacement. That said, it would have the following
> benefits for both submitters and maintainers:

For Rust for Linux, I have a GitHub bot that reviews PRs and spots the
usual mistakes in commit messages (tags, formatting, lkml vs. lore
links, that sort of thing). It has been very effective so far to teach
newcomers how to follow the kernel development process.

I am also extending it to take Acks, Reviewed-by's, Tested-by's, etc.,
and then performing the merge only if the CI passes (which includes
running tests under QEMU, code formatting, lints, etc.) after applying
each patch.

So, in a way, I am trying to go a bit further by bringing the kernel
development workflow into GitHub (and similar services), rather than
keeping the ML as the main place for code review etc. I know it can be
controversial, but hey, I want to try. :)

I also thought about having the bot parse the ML and create PRs
automatically from that (i.e. the reverse direction from what you want
to achieve), and I thought about reusing some of your `b4` code for
that, but it will depend on the amount of patches we receive in the ML
etc. One could even make it bi-directional to some degree, but I am
not sure it is worth the complexity.

By the way, the gccrs project (also in GitHub, but also following
GCC's workflow which involves MLs) also wanted something like ML-to-PR
direction, and I suggested to them taking a look at `b4` too.

Cheers,
Miguel

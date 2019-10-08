Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21926C47404
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 03:24:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBB0720867
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 03:24:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="d9arvGrd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729860AbfJHDYU (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 23:24:20 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:40057 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729772AbfJHDYU (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 7 Oct 2019 23:24:20 -0400
Received: by mail-pg1-f171.google.com with SMTP id d26so9458469pgl.7
        for <workflows@vger.kernel.org>; Mon, 07 Oct 2019 20:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=Am56/P4eqvCnzBgNgYVzeZ1r9c0IgF6RktzKPEr6sRo=;
        b=d9arvGrdAofz3okoMMLrDhlmYNkErBcQ0pDYtEGQdhWG7onfb6L1ls+luzJq0O0vg+
         tur/gDf65eY4HPzmayV89aH7Tb7H+oSj6B4ZhOTxa+H3CKdIWfPzNEfiKmsmR6bFUHfp
         LrdxhEsDBpKu3nj0p9erifOIS+rBQUwFywGIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=Am56/P4eqvCnzBgNgYVzeZ1r9c0IgF6RktzKPEr6sRo=;
        b=e/qrjxS37qwLhAZ0ORjzhQz+mKpVXIu7HOYbfPWSggRu8TiMgCep7ocDw8ipnz3t5T
         XrM2oqsRIvXq6DkaH348uRI8xrIL1u8HgERhHT3L3B50CGYWBHiNFZVcl72WoUM/ucGz
         b9/41VWnHR4y3ZHqvorY66+cZJlUkuxudelkEIhiBy69DBsjErnjbDEfLYVBetEVbUNz
         HAIxNa/8ToG5kUXEweny9gqd6Oo/p1IK5ZZUx+LCLklJCL6PS2KLn+Iy6K5mYSWfiktV
         3YJZs0otaLiALtUkgDehNRe0IFZT5F0dUtbsSM30uuocElcqBNnQL2tRc6/y0g3e1oe6
         Pn2Q==
X-Gm-Message-State: APjAAAUgi45ob8VhzihhxFAMVJIKL8/Q76TRd/zI5wxjQgVbtjcFuWJ6
        ddnX9oq7+OdTtqdaZqFbAzalAw==
X-Google-Smtp-Source: APXvYqwI59xbuwKmhMGNXP0rlfn5LpeN9g46E2YaqdEnhh6y43JbNCjPpqQDbZjnHt/8hcUzqNVuow==
X-Received: by 2002:a63:175c:: with SMTP id 28mr11240538pgx.300.1570505054980;
        Mon, 07 Oct 2019 20:24:14 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id m68sm15509629pfb.122.2019.10.07.20.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 20:24:13 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Eric Wong <e@80x24.org>
Cc:     David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
In-Reply-To: <20191008021125.slr35o3tmwphxfpz@dcvr>
References: <20190924182536.GC6041@hmswarspite.think-freely.org> <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20191007.173329.2182256975398971437.davem@davemloft.net> <87zhicqhzg.fsf@dja-thinkpad.axtens.net> <20191008003931.y4rc2dp64gbhv5ju@dcvr> <87wodgqb86.fsf@dja-thinkpad.axtens.net> <20191008021125.slr35o3tmwphxfpz@dcvr>
Date:   Tue, 08 Oct 2019 14:24:10 +1100
Message-ID: <87pnj7rkbp.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

>> >> For example:
>> >> 
>> >>  - is a given series a revision of a previous series? Humans can change
>> >>    the name of the cover letter, they can re-order or drop patches,
>> >>    split and merge series, even change sender, and other humans just
>> >>    figure it out. But if I try to crystalise that logic into patchwork,
>> >>    things get very tricky. This makes it hard to build powerful APIs
>> >>    into patchwork, which makes it harder to build really cool tools on
>> >>    top of patchwork.
>> >
>> > I'm confident that we can build much of that logic off search
>> > and do similar things to what git does with rename detection.
>> 
>> A lot of people on this list are confident of a great many things :)
>> 
>> There should be an API in the next minor version of Patchwork that
>> allows you to set patch relations. I would encourage you to try to build
>> this - if it works, we can plug it in to the core.
>
> Manually set relations should not be needed if people use
> format-patch with --interdiff or --range-diff.
>
> A well-tuned search engine will be able to figure out the
> preceding series using the git blob IDs from interdiff or commit
> IDs from range-diff.
>
> No need to introduce extra metadata into the system, especially
> not in a way that can't be reproduced.  Reuse what we have.
>
> Even without interdiff or range-diff, it should be possible to
> determine relationships based on common pre-image blob IDs
> if the sender used the same base.

As I said, I'd be really happy to see this piggy-back on the API once it
lands.

>> >>  - what are the dependencies of a patch series? Does it need another
>> >>    series first? Does it apply to a particular tree? (maintainer/next,
>> >>    maintainer/fixes, stable?) This affects every CI system that I'm
>> >>    aware of (some of which build on patchwork). Humans can understand
>> >>    this pretty easily, computers not so much.
>> >
>> > I think can do all these things off existing data in archives.
>> > We already have pre/post-image blob IDs in git patches.
>> > To get there, I think we'll need:
>> 
>> > 1) efficient way to map blobs -> trees -> commits -> refs
>> >    (a reverse-mapping for git's normal DAG)
>> >
>> > 2) automatic scanning of known repos (searching what appear to
>> >    be pull-requests, similar to what pr-tracker-bot does).
>> >
>> > None of which requires patch senders to do anything differently.
>> >
>> > git format-patch features such as --base and --range-diff can
>> > certainly help with this, and it's probably easier to train people
>> > to use newer options in existing tools than new tools, entirely.
>> 
>> I don't understand any of what you're proposing, unfortunately.
>> 
>> AIUI snowpatch (to pick an open source patch CI example) tries applying
>> patches to a set of different (instance-configured) trees until it finds
>> one that works. I'm sure they'd be interested in seeing patches to make
>> this more efficient.
>
> Every patch from git format-patch has abbreviated pre/post-image
> SHA-1 blob IDs.  If we had an efficient reverse mapping of those
> blob IDs to trees, we could quickly figure out which trees those
> patches can apply to.
>
> I've already been using pre/post-image blob IDs to recreate blobs
> efficiently:
>
>   https://lore.kernel.org/workflows/20190924013920.GA22698@dcvr/
>
> But it doesn't yet find which trees the patch can apply to;
> since it cannot (yet) tell you which trees those blob exist in.

Cool.

>> >> Non-email systems have an easier time of this: with gerrit (which I'm
>> >> not a big fan of, but just take it as an example) you push things up to
>> >> a git repository, and it requires a change-id. So you can track the base
>> >> tree, dependencies, and patch revisions easily, because you build on a
>> >> richer, more structured data source.
>> >
>> > Right, decentralization is a HARD problem; but it starts off
>> > with centralization-resistance, a slightly easier problem to
>> > solve :)
>> >
>> > The key is: don't introduce things which mirrors can't reproduce
>> 
>> Mirrors already can't meaningfully reproduce patchwork. They can only
>> make a read-only copy of some of the data, but it's not enough to spin
>> up a new identical instance.
>
> Right, that seems to be a consequence of not having the
> prerequisite storage or search that public-inbox does:

I don't think so. I think it's because patchwork allows you to log in
and perform actions like change state and delegate patches. That's not a
thing that public-inbox has in scope.

>> > Unlike in 2005 when git started; things like Xapian and SQLite
>> > are much more mature and I'm comfortable leaning on them to
>> > solve harder problems.

Regards,
Daniel

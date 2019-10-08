Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC17DECE58C
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 01:26:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE782206C0
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 01:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="AIxq1OTx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729638AbfJHB0I (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 21:26:08 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:42769 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729327AbfJHB0I (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 7 Oct 2019 21:26:08 -0400
Received: by mail-pg1-f177.google.com with SMTP id z12so9280401pgp.9
        for <workflows@vger.kernel.org>; Mon, 07 Oct 2019 18:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=E2efTX77+yyhcZMGGGqEwFbp35gDNsMaon6bxwJ5eOk=;
        b=AIxq1OTx9T8+Czqbuhhl6R8H9nEX0hTBp6nWQb7Ysl/OVEkod1Fd6748CsjYEEPG7f
         FmhH4EP++lSAz6mFAPUYAJX5swDksnoGTKWDzuTHtYVhJh0gPPYT6NmA2hFSc4PmbElG
         aKgd4fcslJn/O4x08PANycgf0kdD3PT1v50ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=E2efTX77+yyhcZMGGGqEwFbp35gDNsMaon6bxwJ5eOk=;
        b=RjdrDDdxTFaPbypzqbYj8pjrldMNAiH0ohKIXCcOTaicxoFG+oU9kgb+jT4y8uqSwT
         Mqi3JNK8o5RFLoqGj6dCEB0QQYTS4G0yqg2YDx/2Z4YYjBGO3XXXqMtNQ9sovp66aKQI
         EjXiUDNU8Xu2xHgfAKeABIGrpyVeFycQOaqODgXejBLB5W1K+nTd6Evqe31ma5nChT2r
         4mgNo3Pai9tCrZRhlUNxlHLmfGwIqKx2yBzCmVt2HrvT5aWEnVVVwkg4m52cwXWDpN94
         NwNc00sZ9P5TeDbuGnIy19GaIaRJi402nTmEF5R8NeCVxryx6vStA/9Dm3LmnUz5FgoJ
         2IGQ==
X-Gm-Message-State: APjAAAXjPoh82maB/k6l1OnMfIt8nmrwPkhKnX1NurNW2t+4K4ua+0M1
        vxew+pO0u9h5psyzDMrHHyefFTg4I3A=
X-Google-Smtp-Source: APXvYqz1T0se16zcM9B/m4NfuucgnzmHZCbyPJOqSMJYhp4rhpweM6YLhpFHNGLDbGudiJuKmt6xDA==
X-Received: by 2002:a17:90a:bb0a:: with SMTP id u10mr2678229pjr.14.1570497965784;
        Mon, 07 Oct 2019 18:26:05 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id y17sm26813142pfo.171.2019.10.07.18.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 18:26:05 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Eric Wong <e@80x24.org>
Cc:     David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
In-Reply-To: <20191008003931.y4rc2dp64gbhv5ju@dcvr>
References: <20190924182536.GC6041@hmswarspite.think-freely.org> <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20191007.173329.2182256975398971437.davem@davemloft.net> <87zhicqhzg.fsf@dja-thinkpad.axtens.net> <20191008003931.y4rc2dp64gbhv5ju@dcvr>
Date:   Tue, 08 Oct 2019 12:26:01 +1100
Message-ID: <87wodgqb86.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

>> For example:
>> 
>>  - is a given series a revision of a previous series? Humans can change
>>    the name of the cover letter, they can re-order or drop patches,
>>    split and merge series, even change sender, and other humans just
>>    figure it out. But if I try to crystalise that logic into patchwork,
>>    things get very tricky. This makes it hard to build powerful APIs
>>    into patchwork, which makes it harder to build really cool tools on
>>    top of patchwork.
>
> I'm confident that we can build much of that logic off search
> and do similar things to what git does with rename detection.

A lot of people on this list are confident of a great many things :)

There should be an API in the next minor version of Patchwork that
allows you to set patch relations. I would encourage you to try to build
this - if it works, we can plug it in to the core.

>>  - what are the dependencies of a patch series? Does it need another
>>    series first? Does it apply to a particular tree? (maintainer/next,
>>    maintainer/fixes, stable?) This affects every CI system that I'm
>>    aware of (some of which build on patchwork). Humans can understand
>>    this pretty easily, computers not so much.
>
> I think can do all these things off existing data in archives.
> We already have pre/post-image blob IDs in git patches.
> To get there, I think we'll need:

> 1) efficient way to map blobs -> trees -> commits -> refs
>    (a reverse-mapping for git's normal DAG)
>
> 2) automatic scanning of known repos (searching what appear to
>    be pull-requests, similar to what pr-tracker-bot does).
>
> None of which requires patch senders to do anything differently.
>
> git format-patch features such as --base and --range-diff can
> certainly help with this, and it's probably easier to train people
> to use newer options in existing tools than new tools, entirely.

I don't understand any of what you're proposing, unfortunately.

AIUI snowpatch (to pick an open source patch CI example) tries applying
patches to a set of different (instance-configured) trees until it finds
one that works. I'm sure they'd be interested in seeing patches to make
this more efficient.

>> Non-email systems have an easier time of this: with gerrit (which I'm
>> not a big fan of, but just take it as an example) you push things up to
>> a git repository, and it requires a change-id. So you can track the base
>> tree, dependencies, and patch revisions easily, because you build on a
>> richer, more structured data source.
>
> Right, decentralization is a HARD problem; but it starts off
> with centralization-resistance, a slightly easier problem to
> solve :)
>
> The key is: don't introduce things which mirrors can't reproduce

Mirrors already can't meaningfully reproduce patchwork. They can only
make a read-only copy of some of the data, but it's not enough to spin
up a new identical instance.

> Unlike in 2005 when git started; things like Xapian and SQLite
> are much more mature and I'm comfortable leaning on them to
> solve harder problems.

Regards,
Daniel

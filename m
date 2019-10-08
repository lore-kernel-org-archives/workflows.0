Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDF12C4360C
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 10:06:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB1C62070B
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 10:06:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="ZvxOOQl+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729893AbfJHKGa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Oct 2019 06:06:30 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33905 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729790AbfJHKGa (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 8 Oct 2019 06:06:30 -0400
Received: by mail-pf1-f193.google.com with SMTP id b128so10530721pfa.1
        for <workflows@vger.kernel.org>; Tue, 08 Oct 2019 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=G8P3ghOn13F90/utYhOeOCBiPwXiPrpkhMQjBcSyPc0=;
        b=ZvxOOQl+jpFDbGcs2PdinN0yMq4FfmZ4giMz8g8J9YU26c7VmYepoG6JvYCrkdox7C
         IB9Nj/CIUb1BomRC+l1oIQPo9iXou31ObNoSdynpXW+rTC3lsqtVrLemrgkUstlFYvHu
         5MFseaU1VJnMcL18W6WeDs9CXDn/cN7FYtXMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=G8P3ghOn13F90/utYhOeOCBiPwXiPrpkhMQjBcSyPc0=;
        b=QNJnvNBMu3I/pk9Im52Ga+DrTm6BFxvXOolzds1WxnrkskGdo/iPbEfEK40xtTRSFS
         vbmTdp/dVOqgjWQq0AfGNhPKkbt0+LAgvJYf6Cyp8dA1hoc/D0lU4DCdAVi9BMIJS91w
         /SKyy0kvpIMMggyeVgnNcIZib7T25gjsUu2+PrDG8nv35jPaD7AIi5JqKepMwFTLrBCb
         ZQDXUKNOL2tcUqgfWN5f5s6UEWgRhOFHTQwcBSifl95HwNr1/+tV9k79S3zRer+Tzy/p
         yTNcaSu2RGvLu9Nuw/jLIdgFewVqthpSIOAn7lUgwGOlKmVQZs4aGU/5h8DPo+iSUzZV
         Mblw==
X-Gm-Message-State: APjAAAUtGXPls2oScUU4XdBEFKByLKhIX9tChYY+FcgIuoKw9PC5QNiX
        RVidl6oOJkzypfQIxtdJ/KeSNLuoCQw=
X-Google-Smtp-Source: APXvYqyAg+qiBcPeXA/zI4k+8fnvH9i6izCzCn/OPrfwUgwaUNOfA7GHFpAI7uIUjdwV0IB3grG6iQ==
X-Received: by 2002:a63:10:: with SMTP id 16mr3613248pga.222.1570529188868;
        Tue, 08 Oct 2019 03:06:28 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net. [59.167.251.205])
        by smtp.gmail.com with ESMTPSA id b11sm15742128pgr.20.2019.10.08.03.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 03:06:27 -0700 (PDT)
From:   Daniel Axtens <dja@axtens.net>
To:     Eric Wong <e@80x24.org>
Cc:     David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
In-Reply-To: <20191008060302.vqf4ogk6s37ghrp3@dcvr>
References: <20190924182536.GC6041@hmswarspite.think-freely.org> <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20191007.173329.2182256975398971437.davem@davemloft.net> <87zhicqhzg.fsf@dja-thinkpad.axtens.net> <20191008003931.y4rc2dp64gbhv5ju@dcvr> <87wodgqb86.fsf@dja-thinkpad.axtens.net> <20191008021125.slr35o3tmwphxfpz@dcvr> <87pnj7rkbp.fsf@dja-thinkpad.axtens.net> <20191008060302.vqf4ogk6s37ghrp3@dcvr>
Date:   Tue, 08 Oct 2019 21:06:23 +1100
Message-ID: <87muebr1pc.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Eric Wong <e@80x24.org> writes:

> Daniel Axtens <dja@axtens.net> wrote:
>> >> >> For example:
>> >> >> 
>> >> >>  - is a given series a revision of a previous series? Humans can change
>> >> >>    the name of the cover letter, they can re-order or drop patches,
>> >> >>    split and merge series, even change sender, and other humans just
>> >> >>    figure it out. But if I try to crystalise that logic into patchwork,
>> >> >>    things get very tricky. This makes it hard to build powerful APIs
>> >> >>    into patchwork, which makes it harder to build really cool tools on
>> >> >>    top of patchwork.
>> >> >
>> >> > I'm confident that we can build much of that logic off search
>> >> > and do similar things to what git does with rename detection.
>> >> 
>> >> A lot of people on this list are confident of a great many things :)
>> >> 
>> >> There should be an API in the next minor version of Patchwork that
>> >> allows you to set patch relations. I would encourage you to try to build
>> >> this - if it works, we can plug it in to the core.
>> >
>> > Manually set relations should not be needed if people use
>> > format-patch with --interdiff or --range-diff.
>> >
>> > A well-tuned search engine will be able to figure out the
>> > preceding series using the git blob IDs from interdiff or commit
>> > IDs from range-diff.
>> >
>> > No need to introduce extra metadata into the system, especially
>> > not in a way that can't be reproduced.  Reuse what we have.
>> >
>> > Even without interdiff or range-diff, it should be possible to
>> > determine relationships based on common pre-image blob IDs
>> > if the sender used the same base.
>> 
>> As I said, I'd be really happy to see this piggy-back on the API once it
>> lands.
>
> Sorry, I'm not sure who's piggy-backing off who :)
>
> I intend to keep the raw/gzipped-text URLs in public-inbox
> stable so anything can query it.  I'm not sure if there's
> anything for public-inbox to query from patchwork's API for
> this, since all the info public-inbox needs is in the archives.
>
> The interdiff stuff is easier and be done sooner in public-inbox
> since it won't require indexing changes.  So maybe by early Nov.
>
> range-diff will require the ability to scan repos, so more work
> to get that mapping into place.
>

OK, you're going in a completely different direction then.

>> >> >> Non-email systems have an easier time of this: with gerrit (which I'm
>> >> >> not a big fan of, but just take it as an example) you push things up to
>> >> >> a git repository, and it requires a change-id. So you can track the base
>> >> >> tree, dependencies, and patch revisions easily, because you build on a
>> >> >> richer, more structured data source.
>> >> >
>> >> > Right, decentralization is a HARD problem; but it starts off
>> >> > with centralization-resistance, a slightly easier problem to
>> >> > solve :)
>> >> >
>> >> > The key is: don't introduce things which mirrors can't reproduce
>> >> 
>> >> Mirrors already can't meaningfully reproduce patchwork. They can only
>> >> make a read-only copy of some of the data, but it's not enough to spin
>> >> up a new identical instance.
>> >
>> > Right, that seems to be a consequence of not having the
>> > prerequisite storage or search that public-inbox does:
>> 
>> I don't think so. I think it's because patchwork allows you to log in
>> and perform actions like change state and delegate patches. That's not a
>> thing that public-inbox has in scope.
>
> It seems like those things are done to appease managerial types
> rather than people who actually do work :>
>
> I prefer actual communication of delegation/state be done via
> normal English.  Relying on states/tickets/severities/etc
> unnatural and often leads to confusion.

This is not a widely held view amongst lists and maintainers that use
patchwork.

> And maybe NLP (natural language processing) can go far enough
> where we can build states to show managers using sentences like:
>
> Alice: "Bob, can you review these patches for foo?"
> Bob: "Sorry Alice, busy on the refactoring bar, maybe Eve can do it"
> Eve: "Alice, sure I can review those patches"
>
> I have no experience with NLP, though...

I suspect from our interactions that continuing with this conversation
isn't going to be of much value to either of us. Good luck with your
approach.

Regards,
Daniel

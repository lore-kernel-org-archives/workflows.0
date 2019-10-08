Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679D9C4360C
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 18:47:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3687D21835
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 18:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570560422;
	bh=3kjOzxLwYdlW3DVha/6hm4f0nkWryAa9d8B1Wa5wGJ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=IMPyLGsBuC1vcOwnTA545Dsp4ycz/zZMtd50r0AXKwccD/SueRo17fAqbXOnOqRup
	 BG6GwD21mz6PzqJ3PJDlAQZTmKzA+6gi+fAZk50IrDDaelUBcRTouylNOWMuKWJ/aR
	 Q9b3qQndK6+hcrecafPDIx6o+YQIw21+xP+yfBv8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbfJHSrB (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Oct 2019 14:47:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:58780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbfJHSrB (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 8 Oct 2019 14:47:01 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26F74218DE
        for <workflows@vger.kernel.org>; Tue,  8 Oct 2019 18:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570560420;
        bh=3kjOzxLwYdlW3DVha/6hm4f0nkWryAa9d8B1Wa5wGJ0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n4rnnEQxOEpFVXdHyAUjtpTZGYVOLcfA/3D0pxCppIdG/kMJiJLIORFhlbLvnOPjI
         Y3fd+zBTCfupWGZ6aWfQkTLju5QmBnFe0EJ/v2nijbDsQEeSjMZBRYhOugEF0uMZV6
         J+TaFRj5/9XqQWsKAgwGijusAgsLqa6LBKqVdB3c=
Received: by mail-qk1-f179.google.com with SMTP id x134so17815357qkb.0
        for <workflows@vger.kernel.org>; Tue, 08 Oct 2019 11:47:00 -0700 (PDT)
X-Gm-Message-State: APjAAAWSU19IThiMvubt73TDBo2skG12b12m4weaQk8Z6uNmsMrXqQ7J
        1djv5MwouIRcDSSULIew4ddMMtj1frGfWk6z1Q==
X-Google-Smtp-Source: APXvYqy1mRGyw37DJRzCz4sL8EynZkza9uR2mDxQFdYu/lBXXO2L99hXIK1tBe5rLZFaaok9nbOyrD1wDLHXuR3UhEo=
X-Received: by 2002:a37:be87:: with SMTP id o129mr31578534qkf.254.1570560419073;
 Tue, 08 Oct 2019 11:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net> <20191008003931.y4rc2dp64gbhv5ju@dcvr>
 <87wodgqb86.fsf@dja-thinkpad.axtens.net> <20191008021125.slr35o3tmwphxfpz@dcvr>
 <87pnj7rkbp.fsf@dja-thinkpad.axtens.net> <20191008060302.vqf4ogk6s37ghrp3@dcvr>
In-Reply-To: <20191008060302.vqf4ogk6s37ghrp3@dcvr>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 8 Oct 2019 13:46:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJOR89V8dKnpHpY2phnPRozVxdv+rnsT0sfxdRymgjxLA@mail.gmail.com>
Message-ID: <CAL_JsqJOR89V8dKnpHpY2phnPRozVxdv+rnsT0sfxdRymgjxLA@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Eric Wong <e@80x24.org>
Cc:     Daniel Axtens <dja@axtens.net>, David Miller <davem@davemloft.net>,
        sir@cmpwn.com, nhorman@tuxdriver.com, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 8, 2019 at 1:03 AM Eric Wong <e@80x24.org> wrote:
>
> Daniel Axtens <dja@axtens.net> wrote:
> > >> >> For example:
> > >> >>
> > >> >>  - is a given series a revision of a previous series? Humans can change
> > >> >>    the name of the cover letter, they can re-order or drop patches,
> > >> >>    split and merge series, even change sender, and other humans just
> > >> >>    figure it out. But if I try to crystalise that logic into patchwork,
> > >> >>    things get very tricky. This makes it hard to build powerful APIs
> > >> >>    into patchwork, which makes it harder to build really cool tools on
> > >> >>    top of patchwork.
> > >> >
> > >> > I'm confident that we can build much of that logic off search
> > >> > and do similar things to what git does with rename detection.
> > >>
> > >> A lot of people on this list are confident of a great many things :)
> > >>
> > >> There should be an API in the next minor version of Patchwork that
> > >> allows you to set patch relations. I would encourage you to try to build
> > >> this - if it works, we can plug it in to the core.
> > >
> > > Manually set relations should not be needed if people use
> > > format-patch with --interdiff or --range-diff.
> > >
> > > A well-tuned search engine will be able to figure out the
> > > preceding series using the git blob IDs from interdiff or commit
> > > IDs from range-diff.
> > >
> > > No need to introduce extra metadata into the system, especially
> > > not in a way that can't be reproduced.  Reuse what we have.
> > >
> > > Even without interdiff or range-diff, it should be possible to
> > > determine relationships based on common pre-image blob IDs
> > > if the sender used the same base.
> >
> > As I said, I'd be really happy to see this piggy-back on the API once it
> > lands.
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
> > >> >> Non-email systems have an easier time of this: with gerrit (which I'm
> > >> >> not a big fan of, but just take it as an example) you push things up to
> > >> >> a git repository, and it requires a change-id. So you can track the base
> > >> >> tree, dependencies, and patch revisions easily, because you build on a
> > >> >> richer, more structured data source.
> > >> >
> > >> > Right, decentralization is a HARD problem; but it starts off
> > >> > with centralization-resistance, a slightly easier problem to
> > >> > solve :)
> > >> >
> > >> > The key is: don't introduce things which mirrors can't reproduce
> > >>
> > >> Mirrors already can't meaningfully reproduce patchwork. They can only
> > >> make a read-only copy of some of the data, but it's not enough to spin
> > >> up a new identical instance.
> > >
> > > Right, that seems to be a consequence of not having the
> > > prerequisite storage or search that public-inbox does:
> >
> > I don't think so. I think it's because patchwork allows you to log in
> > and perform actions like change state and delegate patches. That's not a
> > thing that public-inbox has in scope.
>
> It seems like those things are done to appease managerial types
> rather than people who actually do work :>

+1 to what Steven said. PW is my todo list. That's never worked well
within my mail client.

>
> I prefer actual communication of delegation/state be done via
> normal English.  Relying on states/tickets/severities/etc
> unnatural and often leads to confusion.
>
>
> And maybe NLP (natural language processing) can go far enough
> where we can build states to show managers using sentences like:
>
> Alice: "Bob, can you review these patches for foo?"
> Bob: "Sorry Alice, busy on the refactoring bar, maybe Eve can do it"
> Eve: "Alice, sure I can review those patches"
>
> I have no experience with NLP, though...

I'm pretty sure solving managers workflows is a non-goal of this list.

Rob

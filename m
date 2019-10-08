Return-Path: <SRS0=dP5A=YB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C56C47404
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 02:11:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C9A4206C0
	for <workflows@archiver.kernel.org>; Tue,  8 Oct 2019 02:11:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbfJHCL0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 22:11:26 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:40988 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726917AbfJHCL0 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 7 Oct 2019 22:11:26 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id A51151F4BD;
        Tue,  8 Oct 2019 02:11:25 +0000 (UTC)
Date:   Tue, 8 Oct 2019 02:11:25 +0000
From:   Eric Wong <e@80x24.org>
To:     Daniel Axtens <dja@axtens.net>
Cc:     David Miller <davem@davemloft.net>, sir@cmpwn.com,
        nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191008021125.slr35o3tmwphxfpz@dcvr>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
 <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net>
 <20191008003931.y4rc2dp64gbhv5ju@dcvr>
 <87wodgqb86.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wodgqb86.fsf@dja-thinkpad.axtens.net>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Daniel Axtens <dja@axtens.net> wrote:
> >> For example:
> >> 
> >>  - is a given series a revision of a previous series? Humans can change
> >>    the name of the cover letter, they can re-order or drop patches,
> >>    split and merge series, even change sender, and other humans just
> >>    figure it out. But if I try to crystalise that logic into patchwork,
> >>    things get very tricky. This makes it hard to build powerful APIs
> >>    into patchwork, which makes it harder to build really cool tools on
> >>    top of patchwork.
> >
> > I'm confident that we can build much of that logic off search
> > and do similar things to what git does with rename detection.
> 
> A lot of people on this list are confident of a great many things :)
> 
> There should be an API in the next minor version of Patchwork that
> allows you to set patch relations. I would encourage you to try to build
> this - if it works, we can plug it in to the core.

Manually set relations should not be needed if people use
format-patch with --interdiff or --range-diff.

A well-tuned search engine will be able to figure out the
preceding series using the git blob IDs from interdiff or commit
IDs from range-diff.

No need to introduce extra metadata into the system, especially
not in a way that can't be reproduced.  Reuse what we have.

Even without interdiff or range-diff, it should be possible to
determine relationships based on common pre-image blob IDs
if the sender used the same base.

> >>  - what are the dependencies of a patch series? Does it need another
> >>    series first? Does it apply to a particular tree? (maintainer/next,
> >>    maintainer/fixes, stable?) This affects every CI system that I'm
> >>    aware of (some of which build on patchwork). Humans can understand
> >>    this pretty easily, computers not so much.
> >
> > I think can do all these things off existing data in archives.
> > We already have pre/post-image blob IDs in git patches.
> > To get there, I think we'll need:
> 
> > 1) efficient way to map blobs -> trees -> commits -> refs
> >    (a reverse-mapping for git's normal DAG)
> >
> > 2) automatic scanning of known repos (searching what appear to
> >    be pull-requests, similar to what pr-tracker-bot does).
> >
> > None of which requires patch senders to do anything differently.
> >
> > git format-patch features such as --base and --range-diff can
> > certainly help with this, and it's probably easier to train people
> > to use newer options in existing tools than new tools, entirely.
> 
> I don't understand any of what you're proposing, unfortunately.
> 
> AIUI snowpatch (to pick an open source patch CI example) tries applying
> patches to a set of different (instance-configured) trees until it finds
> one that works. I'm sure they'd be interested in seeing patches to make
> this more efficient.

Every patch from git format-patch has abbreviated pre/post-image
SHA-1 blob IDs.  If we had an efficient reverse mapping of those
blob IDs to trees, we could quickly figure out which trees those
patches can apply to.

I've already been using pre/post-image blob IDs to recreate blobs
efficiently:

  https://lore.kernel.org/workflows/20190924013920.GA22698@dcvr/

But it doesn't yet find which trees the patch can apply to;
since it cannot (yet) tell you which trees those blob exist in.

> >> Non-email systems have an easier time of this: with gerrit (which I'm
> >> not a big fan of, but just take it as an example) you push things up to
> >> a git repository, and it requires a change-id. So you can track the base
> >> tree, dependencies, and patch revisions easily, because you build on a
> >> richer, more structured data source.
> >
> > Right, decentralization is a HARD problem; but it starts off
> > with centralization-resistance, a slightly easier problem to
> > solve :)
> >
> > The key is: don't introduce things which mirrors can't reproduce
> 
> Mirrors already can't meaningfully reproduce patchwork. They can only
> make a read-only copy of some of the data, but it's not enough to spin
> up a new identical instance.

Right, that seems to be a consequence of not having the
prerequisite storage or search that public-inbox does:

> > Unlike in 2005 when git started; things like Xapian and SQLite
> > are much more mature and I'm comfortable leaning on them to
> > solve harder problems.

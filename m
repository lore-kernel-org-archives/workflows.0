Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5924C64E7A
	for <workflows@archiver.kernel.org>; Tue,  1 Dec 2020 18:48:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5689021741
	for <workflows@archiver.kernel.org>; Tue,  1 Dec 2020 18:48:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729888AbgLASsz (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 1 Dec 2020 13:48:55 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:46852 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726213AbgLASsy (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 1 Dec 2020 13:48:54 -0500
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id A02871F86C;
        Tue,  1 Dec 2020 18:48:14 +0000 (UTC)
Date:   Tue, 1 Dec 2020 18:48:14 +0000
From:   Eric Wong <e@80x24.org>
To:     workflows@vger.kernel.org, meta@public-inbox.org
Subject: Re: WIP: searching all of lore
Message-ID: <20201201184814.GA32272@dcvr>
References: <20201126194543.GA30337@dcvr>
 <20201201140033.gyxmaejay2ddpiz3@nitro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201201140033.gyxmaejay2ddpiz3@nitro.local>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Thu, Nov 26, 2020 at 07:45:43PM +0000, Eric Wong wrote:
> > Requires Tor, for now:
> > 
> > http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/all/
> > http://lore.czquwvybam4bgbro.onion/all/
> 
> Thanks for this work, Eric, things are looking good in my tests, though
> I uncovered a bunch of problems with b4 when used with torsocks. :)
> 
> When grabbing t.mbox.gz threads from /all, it appears to properly
> reconstitute follow-ups from multiple mailing lists, correct?

Yup, though some duplicates appear due to different mailing list-added
trailers.  Maybe some of the PublicInbox::Filter::* stuff (currently
only for -mda + -watch) can be applied to the indexing phase to better
dedupe and drop trailers

> Is there a
> way to "weight" different sources, so that when the same message-id
> exist in multiple places, we can prefer one source over another?

It indexes based on the order it iterates through the inboxes
and messages.  That's usually that follows order in the config file;
especially if indexing is delayed.   Of course it's possible a
message can show up in a low-priority source first due to
network latency or outages (something I'm too familiar with :<).

I have any idea to fix that via --reindex which *might*
allow performance improvements on the Xapian side, too.

--reindex is another mind twister when dealing with multiple
histories compared to normal inboxes and will need a new
approach.  Been working on that and my head hurts :x

> For
> example, this is useful when we're trying to do DKIM validation and some
> lists are known to mess that up, while others do the right thing.

Right, though I think it's somewhat less necessary given how sensitive
PublicInbox::ContentHash is compared to just using the Message-ID to
dedupe...

One bad thing about it being too sensitive is NNTP speedups couldn't rely
solely on contents hashing because of mailing list trailers yesterday:

https://public-inbox.org/meta/20201130194201.GA6687@dcvr/

> Thanks again,

You're welcome :>

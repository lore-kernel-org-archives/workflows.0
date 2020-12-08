Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624AFC4361B
	for <workflows@archiver.kernel.org>; Tue,  8 Dec 2020 18:03:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2AE4223B4B
	for <workflows@archiver.kernel.org>; Tue,  8 Dec 2020 18:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730667AbgLHSDM (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 8 Dec 2020 13:03:12 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:33804 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728633AbgLHSDM (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 8 Dec 2020 13:03:12 -0500
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 3C9FB1F4B4;
        Tue,  8 Dec 2020 18:02:32 +0000 (UTC)
Date:   Tue, 8 Dec 2020 18:02:32 +0000
From:   Eric Wong <e@80x24.org>
To:     workflows@vger.kernel.org, meta@public-inbox.org
Subject: Re: WIP: searching all of lore
Message-ID: <20201208180232.GA20637@dcvr>
References: <20201126194543.GA30337@dcvr>
 <20201128223457.GA31347@dcvr>
 <20201205200717.GA7923@dcvr>
 <20201208140111.3lxecf42d6ooskeb@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201208140111.3lxecf42d6ooskeb@chatter.i7.local>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Sat, Dec 05, 2020 at 08:07:17PM +0000, Eric Wong wrote:
> > Per-inbox search also uses subset search, so all the existing
> > inboxes should be searchable on an individual level, not just /all:
> > http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/lkml/
> > http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/workflows/
> > http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/netdev/
> 
> So, are things to the point where we only need a single xapian db for 
> all lists, or do we still need to keep individual list indexes?

Only indexlevel=basic (sqlite) for individual lists.  This saves
a bunch of FDs and provides ~60G overall space savings (not compacted).

For all of lore:

	git + {over,msgmap}.sqlite3:		51G
	extindex "all"	over.sqlite3 + Xapian:	193G

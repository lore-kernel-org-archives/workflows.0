Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF883C4361A
	for <workflows@archiver.kernel.org>; Sat,  5 Dec 2020 20:08:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACBFE23123
	for <workflows@archiver.kernel.org>; Sat,  5 Dec 2020 20:08:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725274AbgLEUH6 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 5 Dec 2020 15:07:58 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:37190 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725270AbgLEUH5 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Sat, 5 Dec 2020 15:07:57 -0500
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id A0C4F1F4B4;
        Sat,  5 Dec 2020 20:07:17 +0000 (UTC)
Date:   Sat, 5 Dec 2020 20:07:17 +0000
From:   Eric Wong <e@80x24.org>
To:     workflows@vger.kernel.org
Cc:     meta@public-inbox.org
Subject: Re: WIP: searching all of lore
Message-ID: <20201205200717.GA7923@dcvr>
References: <20201126194543.GA30337@dcvr>
 <20201128223457.GA31347@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201128223457.GA31347@dcvr>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Eric Wong <e@80x24.org> wrote:
> Eric Wong <e@80x24.org> wrote:
> > Requires Tor, for now:

An IMAP .onion running the latest per-inbox subset search patches(*)

X=rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion
torsocks mutt -f imap://$X/org.kernel.vger.workflows.0
torsocks mutt -f imap://$X/org.kernel.vger.linux-kernel.76

The ".0" and ".76" at the end is the mailbox slice, LKML
is currently at 77 ~50K message slices (I decided to cap IMAP
mailbox size to due to MUA/Maildir slowness on giant directories).

Per-inbox search also uses subset search, so all the existing
inboxes should be searchable on an individual level, not just /all:
http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/lkml/
http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/workflows/
http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/netdev/
...

(*) https://public-inbox.org/meta/20201205101138.11973-1-e@80x24.org/

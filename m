Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD46C63777
	for <workflows@archiver.kernel.org>; Sat, 28 Nov 2020 22:35:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0ACCD221FD
	for <workflows@archiver.kernel.org>; Sat, 28 Nov 2020 22:35:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387802AbgK1Wfh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 28 Nov 2020 17:35:37 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:40916 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387679AbgK1Wfh (ORCPT <rfc822;workflows@vger.kernel.org>);
        Sat, 28 Nov 2020 17:35:37 -0500
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 4A5391F86C;
        Sat, 28 Nov 2020 22:34:57 +0000 (UTC)
Date:   Sat, 28 Nov 2020 22:34:57 +0000
From:   Eric Wong <e@80x24.org>
To:     workflows@vger.kernel.org
Cc:     meta@public-inbox.org
Subject: Re: WIP: searching all of lore
Message-ID: <20201128223457.GA31347@dcvr>
References: <20201126194543.GA30337@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201126194543.GA30337@dcvr>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Eric Wong <e@80x24.org> wrote:
> Requires Tor, for now:

There's also an NNTP .onion and the ->ALL search speeds
up Xref for cross-post detection at:

  nntp://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion

  torsocks w3m nntp://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/org.kernel.vger.workflows

v3 .onion URLs are annoyingly long :<

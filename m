Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_40,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60F0C433E0
	for <workflows@archiver.kernel.org>; Wed, 17 Mar 2021 07:21:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7983664FAC
	for <workflows@archiver.kernel.org>; Wed, 17 Mar 2021 07:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbhCQHVL (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 17 Mar 2021 03:21:11 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:51288 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229469AbhCQHUk (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 17 Mar 2021 03:20:40 -0400
X-Greylist: delayed 564 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Mar 2021 03:20:40 EDT
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 4C37F1F9FC;
        Wed, 17 Mar 2021 07:11:16 +0000 (UTC)
Date:   Wed, 17 Mar 2021 01:11:16 -0600
From:   Eric Wong <e@80x24.org>
To:     workflows@vger.kernel.org
Cc:     meta@public-inbox.org
Subject: Re: WIP: searching all of lore
Message-ID: <20210317071116.GA8121@dcvr>
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
> 
> http://rskvuqcfnfizkjg6h5jvovwb3wkikzcwskf54lfpymus6mxrzw67b5ad.onion/all/
> http://lore.czquwvybam4bgbro.onion/all/

Also available without Tor:

	https://yhbt.net/lore/all/ + https://80x24.org/lore/all/
        (but no more reliable, since it's via ssh tunnels)

Still ironing out some UI bits, but at least "help" redirects
to the correct place.

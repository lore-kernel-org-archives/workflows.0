Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6424C49361
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 08:24:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09294616EC
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 08:24:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhFQI0b (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 04:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbhFQI0a (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 04:26:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 608CBC061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 01:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=B8xyDZpcle1hAyzW7VzK/XrA0mI0R+hh3Pf89ZLUjTE=; b=a4CE/2ZMY73xkfmvaQS76HLXMQ
        eVTv/rYfSuUtes2eHg0Ifwl1S6Bjl2t+FswVIeLPozCsRPiBJbKM9qlrY/AVeuFhiAmrbPJ2jV1nF
        W9OitghN8zgq64AzGJ9CGOwahXLte1nACVCN81XAGVhDIYicxTSIML88hIFpgQvuO3ppnjDpAMpSU
        X96Bz9WXPg0sIgadnZqiWXKLrNrN9lWD68b14MAj6poQ+JBri+QOIAWqhuE94hrl606kAMQO4GNSd
        rcGFvxkD85nbq/ilWTn3ywvOuxwmbC9OPbUkbMZttBYtxRCBsA2W4mgne6Z97J0ace8XVnBE0enkB
        vaJnjWRQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ltnJg-008uxH-9f; Thu, 17 Jun 2021 08:24:04 +0000
Date:   Thu, 17 Jun 2021 09:24:00 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <YMsGoI0UdbmUebhX@infradead.org>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Please opt all subsystems I maintain out of this crap.  The last thing
I need is patches from people that can't deal with a sane workflow.

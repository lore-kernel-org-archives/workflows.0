Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348E7C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 08:33:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F10A61474
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 08:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhFQIfM (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 04:35:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:42460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229931AbhFQIfL (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 17 Jun 2021 04:35:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B19C1610A2;
        Thu, 17 Jun 2021 08:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623918783;
        bh=mDw7bn5JbRg7WmWdusVgIXr8jSg1X9Op+N8geiskGqU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=A5U06KMWWsGws441pAkBls+H2CxPzffU3ZqmaKFoapAV4O68wEtz7M7yON9FwRx8r
         bWunKcLVwIhLRhKBw+RqrMxMwHIt+yjXrbgLmCeEOOSy6S6TqcpJgnFlD/lduCwY3L
         UlshGRnzNUezYx3sTNwC68vzhOdcMusMmLOt7c2tIuUHomTsbpFEGwXsE+epafOOgL
         jzaSeYPaaFb6ZhgMIz10Q9L46yvPQl5ejaAXxcnztSFTqK8CBqAqhaXqIqe/DJY7Ap
         tzOAuqcN4KSxhz0tfFptqEv5M1P34+TpNo/V2pPM/LYxUCSsyzOX++1agvRKjNX3v6
         Q1VK4GSZUZCkA==
Date:   Thu, 17 Jun 2021 10:33:00 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Christoph Hellwig <hch@infradead.org>
cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
In-Reply-To: <YMsGoI0UdbmUebhX@infradead.org>
Message-ID: <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local> <YMsGoI0UdbmUebhX@infradead.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 17 Jun 2021, Christoph Hellwig wrote:

> Please opt all subsystems I maintain out of this crap.  The last thing
> I need is patches from people that can't deal with a sane workflow.

I agree with Christoph. This (if at all) really needs to be on an explicit 
maintainer opt-in basis only (and I am not going to opt in with my 
subsystems :) ).

Thanks,

-- 
Jiri Kosina
SUSE Labs


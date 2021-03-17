Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E734DC433DB
	for <workflows@archiver.kernel.org>; Wed, 17 Mar 2021 18:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BFF264F38
	for <workflows@archiver.kernel.org>; Wed, 17 Mar 2021 18:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbhCQSTN (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 17 Mar 2021 14:19:13 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:38870 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232414AbhCQSSn (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 17 Mar 2021 14:18:43 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 4AE7E1F9FC;
        Wed, 17 Mar 2021 18:18:43 +0000 (UTC)
Date:   Wed, 17 Mar 2021 20:18:43 +0200
From:   Eric Wong <e@80x24.org>
To:     workflows@vger.kernel.org, meta@public-inbox.org
Subject: Re: WIP: searching all of lore
Message-ID: <20210317181843.GA9180@dcvr>
References: <20201126194543.GA30337@dcvr>
 <20210317071116.GA8121@dcvr>
 <20210317132723.xx4klonordhsb6ve@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210317132723.xx4klonordhsb6ve@chatter.i7.local>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> Looking good! I noticed that it doesn't "uniquify" the results. E.g. searching
> for "lists.linux.dev" (just some uncommon wording I could think of) returns
> multiple hits for the same message sent to multiple lists:
> 
> https://yhbt.net/lore/all/?q=lists.linux.dev
> 
> Is that intentional, or can this be tweaked to show a single result for the
> same message-id?

Not really.  At least for the summary search results, it makes
no sense:

	https://public-inbox.org/meta/20210317181408.9124-1-e@80x24.org/

The underlying cause that can be seen in
https://yhbt.net/lore/all/20210316102311.182375-1-gregkh@linuxfoundation.org/
is the Mailman-added signature for one of the posts.

I've been considering adding a "diff view" to more easily pick
out differences between messages with identical Message-ID with
subtly different content, but it could be expensive for PSGI...
I will probably prototype it in lei, first.

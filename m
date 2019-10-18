Return-Path: <SRS0=I4mM=YL=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A9DCA9EA0
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 19:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A6FE32070B
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 19:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394242AbfJRTBw (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 18 Oct 2019 15:01:52 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:44322 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389251AbfJRTBw (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 18 Oct 2019 15:01:52 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id E67381F4C0;
        Fri, 18 Oct 2019 19:01:51 +0000 (UTC)
Date:   Fri, 18 Oct 2019 19:01:51 +0000
From:   Eric Wong <e@80x24.org>
To:     workflows@vger.kernel.org
Cc:     meta@public-inbox.org
Subject: Re: workflow problems and possible public-inbox solutions
Message-ID: <20191018190151.bgipdtm4ragkz5ox@dcvr>
References: <20191018032516.GB29290@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191018032516.GB29290@dcvr>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Eric Wong <e@80x24.org> wrote:
> Maybe some other stuff, too (feel free to add)

Ease-of-use is another...  I was an early adopter of git
and a user of tla (GNU arch) before that, which probably
makes me too numb to deal with this matter :P

Perhaps web UIs which tells users about command-line tools would
be helpful.

Linking to the git-send-email(1) manpage is one example of
that in public-inbox (but IMHO not as important as informing
users about Message-IDs).

Pointers to inform casual readers which tools (e.g. git
request-pull, git format-patch) were used to generate certain
emails could be useful, too...  I remember being asked how I
generated my request pull emails to a low-key project several
years ago, at least...

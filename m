Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36692C4360C
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 20:05:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 005E6206B6
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 20:05:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfJJUF3 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 16:05:29 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:58324 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbfJJUF3 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 10 Oct 2019 16:05:29 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 9EA2F1F4C0;
        Thu, 10 Oct 2019 20:05:28 +0000 (UTC)
Date:   Thu, 10 Oct 2019 20:05:28 +0000
From:   Eric Wong <e@80x24.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191010200528.GA5612@dcvr>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191010150729.1355f33d@coco.lan>
 <20191010195335.fmh6atylozhehftt@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191010195335.fmh6atylozhehftt@chatter.i7.local>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> This is actually really fast if you already have a local copy of the
> repository with most objects. Try this yourself if you have
> torvalds/linux.git locally:
> 
> git clone --bare -s torvalds/linux.git test

Yep, -s (--shared) makes cloning really cheap.  One of my goals is to get

	git clone -s https://example.com/torvalds/linux.git

and

	git clone -s https://example.com/torvalds/linux.git/clone.bundle

working.  That would make it easier for new contributors to
setup lightweight clones and pull in history on an as-needed
basis w/o hacks like shallow cloning.

Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F285ECE587
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 13:19:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6601121848
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 13:19:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731092AbfJNNTt (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 09:19:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:34164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729858AbfJNNTt (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 14 Oct 2019 09:19:49 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2DE22089C;
        Mon, 14 Oct 2019 13:19:47 +0000 (UTC)
Date:   Mon, 14 Oct 2019 09:19:46 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Axtens <dja@axtens.net>
Cc:     Stephen Hemminger <stephen@networkplumber.org>,
        Dave Airlie <airlied@gmail.com>,
        David Miller <davem@davemloft.net>, mchehab@kernel.org,
        skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191014091946.35dcc070@gandalf.local.home>
In-Reply-To: <87lftotdv8.fsf@dja-thinkpad.axtens.net>
References: <20191011140108.589bbb52@gandalf.local.home>
        <20191011.113254.1964556815296845399.davem@davemloft.net>
        <20191011155949.145f0f7d@coco.lan>
        <20191011.121153.1410013220730418292.davem@davemloft.net>
        <20191011141909.1ccb58b3@hermes.lan>
        <20191011174719.16e997f5@gandalf.local.home>
        <CAPM=9tyjGBC2e5mi7=OetWACYjQ6iwiLPNXpuAEReeyttKNrtw@mail.gmail.com>
        <20191011190009.6ee15756@gandalf.local.home>
        <20191011170839.75c52ad3@hermes.lan>
        <87lftotdv8.fsf@dja-thinkpad.axtens.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, 14 Oct 2019 10:38:51 +1100
Daniel Axtens <dja@axtens.net> wrote:

> > It does bring up that any new workflow has to have security protocol
> > and threat model as part of its design.  
> 
> This is actually something that worries me about the patchwork
> workflow. Maintainers seem to trust the patchwork version of a patch
> without much (or any) verification that it matches what was sent to the
> list.

I tend to download the patch from patchwork, and review that. When I
find something to comment on, I go back to my INBOX and reply to the
original patch where I want to comment on.

Thus, what's in patchwork is what I have verified anyway.

-- Steve

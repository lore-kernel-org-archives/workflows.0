Return-Path: <SRS0=MafL=YF=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16B1C47404
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 00:14:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B2FF52190F
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 00:14:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbfJLAOt (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 20:14:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:52200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbfJLAOt (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 11 Oct 2019 20:14:49 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C54F2089F;
        Sat, 12 Oct 2019 00:14:48 +0000 (UTC)
Date:   Fri, 11 Oct 2019 20:14:46 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Hemminger <stephen@networkplumber.org>
Cc:     Dave Airlie <airlied@gmail.com>,
        David Miller <davem@davemloft.net>, mchehab@kernel.org,
        skhan@linuxfoundation.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011201446.32e606d9@oasis.local.home>
In-Reply-To: <20191011170839.75c52ad3@hermes.lan>
References: <20191011140108.589bbb52@gandalf.local.home>
        <20191011.113254.1964556815296845399.davem@davemloft.net>
        <20191011155949.145f0f7d@coco.lan>
        <20191011.121153.1410013220730418292.davem@davemloft.net>
        <20191011141909.1ccb58b3@hermes.lan>
        <20191011174719.16e997f5@gandalf.local.home>
        <CAPM=9tyjGBC2e5mi7=OetWACYjQ6iwiLPNXpuAEReeyttKNrtw@mail.gmail.com>
        <20191011190009.6ee15756@gandalf.local.home>
        <20191011170839.75c52ad3@hermes.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, 11 Oct 2019 17:08:39 -0700
Stephen Hemminger <stephen@networkplumber.org> wrote:

> Yes, my life is too short to fight with corporate stuff.

Heh, me too.

> There is a security first mindset which is good but gets in the way.
> The current generation of Internet standard mail protocols does not have enough security to be allowed.

Wish we could come up with a "secured email" RFC.

> 
> It does bring up that any new workflow has to have security protocol
> and threat model as part of its design.

True.

-- Steve


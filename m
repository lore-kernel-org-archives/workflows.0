Return-Path: <SRS0=J16y=YA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552E3ECE58C
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 19:24:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 363F620684
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 19:24:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbfJGTY0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 15:24:26 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:33380 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728325AbfJGTY0 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 7 Oct 2019 15:24:26 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 33C7E1F4BE;
        Mon,  7 Oct 2019 19:24:26 +0000 (UTC)
Date:   Mon, 7 Oct 2019 19:24:26 +0000
From:   Eric Wong <e@80x24.org>
To:     David Miller <davem@davemloft.net>
Cc:     sir@cmpwn.com, nhorman@redhat.com, nhorman@tuxdriver.com,
        workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191007192425.enyfsr5m6tonq4b7@dcvr>
References: <20191007162000.GC15431@hmswarspite.think-freely.org>
 <BXJFJX89OZEV.17YCLI5G860LW@homura>
 <20191007.204302.929569594786844719.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191007.204302.929569594786844719.davem@davemloft.net>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

David Miller <davem@davemloft.net> wrote:
> From: "Drew DeVault" <sir@cmpwn.com>
> Date: Mon, 07 Oct 2019 12:24:47 -0400
> 
> > The main issue is that many mail systems are ancient and
> > overcomplex, but nothing is stopping anyone from working with
> > simpler and more modern mail systems.
> 
> It's the modern ones, like gmail, that are the main problem.
> 
> Google controls such a huge chunk of the present day internet
> email traffic that they can effectively steer the medium in any
> direction they want, indescriminately, and even eradicate it
> slowly over time.

The megacorps will try to do that with any modern replacement
for SMTP, too :<

Maybe something pull-based such as IM2000
<https://cr.yp.to/im2000.html> can eventually work.  *shrug*

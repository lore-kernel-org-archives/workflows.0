Return-Path: <SRS0=J16y=YA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0FDC47404
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 18:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78EA820684
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 18:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728187AbfJGSnE (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 14:43:04 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:56226 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbfJGSnE (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 7 Oct 2019 14:43:04 -0400
Received: from localhost (unknown [50.237.170.134])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 5343A14732194;
        Mon,  7 Oct 2019 11:43:03 -0700 (PDT)
Date:   Mon, 07 Oct 2019 20:43:02 +0200 (CEST)
Message-Id: <20191007.204302.929569594786844719.davem@davemloft.net>
To:     sir@cmpwn.com
Cc:     nhorman@redhat.com, nhorman@tuxdriver.com,
        workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
From:   David Miller <davem@davemloft.net>
In-Reply-To: <BXJFJX89OZEV.17YCLI5G860LW@homura>
References: <20191007162000.GC15431@hmswarspite.think-freely.org>
        <BXJFJX89OZEV.17YCLI5G860LW@homura>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 07 Oct 2019 11:43:03 -0700 (PDT)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

From: "Drew DeVault" <sir@cmpwn.com>
Date: Mon, 07 Oct 2019 12:24:47 -0400

> The main issue is that many mail systems are ancient and
> overcomplex, but nothing is stopping anyone from working with
> simpler and more modern mail systems.

It's the modern ones, like gmail, that are the main problem.

Google controls such a huge chunk of the present day internet
email traffic that they can effectively steer the medium in any
direction they want, indescriminately, and even eradicate it
slowly over time.

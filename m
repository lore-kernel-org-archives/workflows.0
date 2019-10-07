Return-Path: <SRS0=J16y=YA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99EB0C47404
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 18:40:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79A1E20684
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 18:40:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbfJGSky (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 14:40:54 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:56198 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbfJGSky (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 7 Oct 2019 14:40:54 -0400
Received: from localhost (unknown [50.237.170.134])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 07A2614732187;
        Mon,  7 Oct 2019 11:40:52 -0700 (PDT)
Date:   Mon, 07 Oct 2019 20:40:49 +0200 (CEST)
Message-Id: <20191007.204049.836915048460407644.davem@davemloft.net>
To:     rostedt@goodmis.org
Cc:     sir@cmpwn.com, nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191007114752.0ac7f041@gandalf.local.home>
References: <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
        <20191007.173329.2182256975398971437.davem@davemloft.net>
        <20191007114752.0ac7f041@gandalf.local.home>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 07 Oct 2019 11:40:53 -0700 (PDT)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 7 Oct 2019 11:47:52 -0400

> I blame Outlook as the death of email.

I personally think Google harbors a lot of the blame, but there
are other culprits indeed.


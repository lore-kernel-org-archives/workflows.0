Return-Path: <SRS0=J16y=YA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95431ECE58C
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 15:33:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 74ED1206C2
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 15:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbfJGPde (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 11:33:34 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:53936 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728263AbfJGPdd (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 7 Oct 2019 11:33:33 -0400
Received: from localhost (unknown [144.121.20.163])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 1C6D6142C0140;
        Mon,  7 Oct 2019 08:33:33 -0700 (PDT)
Date:   Mon, 07 Oct 2019 17:33:29 +0200 (CEST)
Message-Id: <20191007.173329.2182256975398971437.davem@davemloft.net>
To:     sir@cmpwn.com
Cc:     nhorman@tuxdriver.com, workflows@vger.kernel.org
Subject: Re: thoughts on a Merge Request based development workflow
From:   David Miller <davem@davemloft.net>
In-Reply-To: <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
        <BX8G8FACJ68D.3RNYA1J9VP98Z@homura>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 07 Oct 2019 08:33:33 -0700 (PDT)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

From: "Drew DeVault" <sir@cmpwn.com>
Date: Tue, 24 Sep 2019 14:37:28 -0400

> Until this part. Phasing out email in favor of a centralized
> solution like Gitlab would be a stark regression.

I have to make a statement about this because it's really the elephant
in the room.

Email is on the slow and steady decline to an almost certain death.

And I say this as someone who is maintaining email lists for more than
25 years, and has to sift through several hundred emails every day.

Somewhere down the road, in the not too distant future, email will
simply not be an option.  You can "use" it, but I can guarantee it
will not be in a state where you will want to.

So we can stay in denial about this, or we can do something proactive
to prepare ourselve for this inevitable result.

And when we have these conversations about how important it is to
retain email based workflows, is that really to make sure we have a
backup plan in case new infrastructure fails, or is it to appease
"senior" maintainers like myself and others who simply don't want to
change and move on?

Personally, I seriously want to change and move on from email, it's
terrible.

I just want tools and pretty web pages, in fact I'll use just about
anything in order to move on from email based workflows entirely.

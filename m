Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A069AC47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 19:11:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B67521835
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 19:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728796AbfJKTL5 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 15:11:57 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:51584 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728776AbfJKTL5 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 15:11:57 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 6087E14F49A15;
        Fri, 11 Oct 2019 12:11:56 -0700 (PDT)
Date:   Fri, 11 Oct 2019 12:11:53 -0700 (PDT)
Message-Id: <20191011.121153.1410013220730418292.davem@davemloft.net>
To:     mchehab@kernel.org
Cc:     rostedt@goodmis.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191011155949.145f0f7d@coco.lan>
References: <20191011140108.589bbb52@gandalf.local.home>
        <20191011.113254.1964556815296845399.davem@davemloft.net>
        <20191011155949.145f0f7d@coco.lan>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 11 Oct 2019 12:11:56 -0700 (PDT)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 11 Oct 2019 15:59:49 -0300

> I can't see how just adding a web interface like github/gitlab
> would solve any of the above. I mean, the submitter will still
> need to write a proper subject/description before submitting the
> patch to the web interface, add the tags, etc. 

You can actually codify the various fields into a web form with
help texts etc.

Things that are mandatory can even be marked required and people
can't even submit a PR without Signed-off-by: for example.

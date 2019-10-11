Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F899C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 18:32:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 373BF2089F
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 18:32:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbfJKSc6 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 14:32:58 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:51172 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbfJKSc5 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 11 Oct 2019 14:32:57 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 43CED14F35C5E;
        Fri, 11 Oct 2019 11:32:57 -0700 (PDT)
Date:   Fri, 11 Oct 2019 11:32:54 -0700 (PDT)
Message-Id: <20191011.113254.1964556815296845399.davem@davemloft.net>
To:     rostedt@goodmis.org
Cc:     mchehab@kernel.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191011140108.589bbb52@gandalf.local.home>
References: <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
        <20191011143744.4291b42d@coco.lan>
        <20191011140108.589bbb52@gandalf.local.home>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 11 Oct 2019 11:32:57 -0700 (PDT)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

From: Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 11 Oct 2019 14:01:08 -0400

> Thus, if we want people to send us their fixes, we better keep just
> an email with a patch the lowest bar for entry.

I argue that for people coming into the software engineering world
today, a PR is the lowest bar for entry.  And email is the exact
opposite, _especially_ our way of doing email.

Because it IS NOT just an email with a patch.

It is an email with a specific Subject line format, with various
fields.  Some field are optional and some are mandatory, and it also
depends upon which tree you are targetting.

Then there is the commit message which has content and formatting
requirements.

And then there are the tags, of various types and flavors, and the
context (which is sometimes subtle) determines which of those tags are
relevant and how they should be filled in.

The various other standard email fields like TO: and CC: have to
be set a certain way otherwise the patch won't even be looked at.

If you think all of this stuff is a low barrier to entry you are
frankly kidding yourself.

It is ONLY a low barrier to entry for an experienced Linux kernel
developer.  Full stop.

You are not helping casual contributors with this "simple" email based
submission method.  It is understood and easy us, but nobody else.

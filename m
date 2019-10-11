Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60E9C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 18:01:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A55E9218AC
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 18:01:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbfJKSBL (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 14:01:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:38884 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728470AbfJKSBL (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 11 Oct 2019 14:01:11 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 443A420659;
        Fri, 11 Oct 2019 18:01:10 +0000 (UTC)
Date:   Fri, 11 Oct 2019 14:01:08 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011140108.589bbb52@gandalf.local.home>
In-Reply-To: <20191011143744.4291b42d@coco.lan>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
        <20191011085702.GB1075470@kroah.com>
        <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
        <20191011143744.4291b42d@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, 11 Oct 2019 14:37:52 -0300
Mauro Carvalho Chehab <mchehab@kernel.org> wrote:

> I agree with Shuah. From time to time, we have one time only patch
> submission from people that just want to fix something that affects
> his machine.

I like to stress this point. There's been projects that I have written
a patch for to fix or update a feature for that project for my own
personal machine. Then when looking at upstreaming it, if the
procedure is more than simply sending a patch to a mailing list, I
usually stop right there, and just maintain the fix locally. (Note,
this is for simple updates for my personal machine, if this is for
something for work, I spend the time to get it upstream).

Thus, if we want people to send us their fixes, we better keep just an
email with a patch the lowest bar for entry.

-- Steve

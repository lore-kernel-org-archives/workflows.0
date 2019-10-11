Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004CDECE58D
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 18:44:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D03E02190F
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 18:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728738AbfJKSoE (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 14:44:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:46818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728603AbfJKSoE (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 11 Oct 2019 14:44:04 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17E12206CD;
        Fri, 11 Oct 2019 18:44:03 +0000 (UTC)
Date:   Fri, 11 Oct 2019 14:44:01 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     David Miller <davem@davemloft.net>
Cc:     mchehab@kernel.org, skhan@linuxfoundation.org,
        gregkh@linuxfoundation.org, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011144401.61007c44@gandalf.local.home>
In-Reply-To: <20191011.113254.1964556815296845399.davem@davemloft.net>
References: <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
        <20191011143744.4291b42d@coco.lan>
        <20191011140108.589bbb52@gandalf.local.home>
        <20191011.113254.1964556815296845399.davem@davemloft.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, 11 Oct 2019 11:32:54 -0700 (PDT)
David Miller <davem@davemloft.net> wrote:

> From: Steven Rostedt <rostedt@goodmis.org>
> Date: Fri, 11 Oct 2019 14:01:08 -0400
> 
> > Thus, if we want people to send us their fixes, we better keep just
> > an email with a patch the lowest bar for entry.  
> 
> I argue that for people coming into the software engineering world
> today, a PR is the lowest bar for entry.  And email is the exact
> opposite, _especially_ our way of doing email.
> 
> Because it IS NOT just an email with a patch.

That is if the maintainer wants to be anal about the submission. I've
taken patches where I only asked the person to give me a signed off by.
I also ask:

"Hi, do you intend on being a contributor, or do you only want to get
this fix upstream? If the latter, I will handle the change log and
other formatting for you, all I need is the signed-off-by. Otherwise, I
will help you submit a proper patch."

Again, this is for one offs, where someone found something like an off
by one error or other trivial bug to fix. I just want the fix in, but
will let the submitter decide how strict I will be to get it in. I've
had people say "I don't care, just get it fixed", and I do the
formatting and all the grudge work, but still give the submitter the
credit.

Not to mention, there's several times I get a patch where the solution
is totally wrong, and I need to make the fix anyway. A simple
Reported-by is what the submitter gets. Also, perfectly done by email.

> 
> You are not helping casual contributors with this "simple" email based
> submission method.  It is understood and easy us, but nobody else.

I'm not saying that email is the only way, this entire thread is about
getting another tool to help. But I will scream very loudly if we
eliminate email totally.

-- Steve

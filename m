Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F48BECE588
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:47:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 608582086A
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbfJOQrx (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 12:47:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:55650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726362AbfJOQrx (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 12:47:53 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9EC7220650;
        Tue, 15 Oct 2019 16:47:51 +0000 (UTC)
Date:   Tue, 15 Oct 2019 12:47:49 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015124749.1a11926f@gandalf.local.home>
In-Reply-To: <20191015163704.GJ4875@pendragon.ideasonboard.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
        <20191011085702.GB1075470@kroah.com>
        <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
        <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
        <20191014205658.GG5564@mit.edu>
        <20191015083741.1d0731e5@gandalf.local.home>
        <20191015163704.GJ4875@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 15 Oct 2019 19:37:04 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> But how far could we push this reasoning ? I've worked for a company
> whose corporate policy was that all source code had to be stored in SVN,
> not exception. I didn't reach the community to move kernel development
> away from git. I've also worked with people whose corporate policy was
> that they had to do Linux kernel development on Windows, without using
> any virtual machine. There are all kind of crazy corporate policies, and
> if we don't push the pain it inflicts on all of us back to the people
> who enact those crazy policies, we'll always lose.

I understand your sentiment. But most of your examples are one-off
"crazy corporate policies". The "sucky email server" and "you must use
this sucky email server" is rather standard. Not saying that we don't
want to pressure them to change, but I'm hearing from people (like Dave
Miller), that new developers are moving away from email for
development.

I thought part of this thread was talking about having other ways
besides email to submit a patch. Something that can help people
correctly send a patch (at least their formatting) by making sure they
fill out the proper fields and have a tool that helps them do so. I
brought up the corporate email servers just as an example of having
this help out there too.

I plan on continuing to develop mostly in email (I still send my patch
series via quilt!). But I'm not going to enforce everyone to continue
to use email if we can come up with a better way. I also want to make
sure that whatever we do come up with will still support email.

-- Steve

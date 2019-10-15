Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5F1C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 12:37:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0553021928
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 12:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfJOMho (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 08:37:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:48630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725812AbfJOMho (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 08:37:44 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7372A205F4;
        Tue, 15 Oct 2019 12:37:43 +0000 (UTC)
Date:   Tue, 15 Oct 2019 08:37:41 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015083741.1d0731e5@gandalf.local.home>
In-Reply-To: <20191014205658.GG5564@mit.edu>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
        <20191011085702.GB1075470@kroah.com>
        <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
        <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
        <20191014205658.GG5564@mit.edu>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, 14 Oct 2019 16:56:58 -0400
"Theodore Y. Ts'o" <tytso@mit.edu> wrote:

> So it's an extreme case, and is an example of corp e-mail insanity.
> The good news is that for companies that are really serious about
> working with upstream, they will roll out solutions for their own
> customers.  For example, with IBM, since Lotus notes was maximally
> unfriendly to OSS development practices, they created a separate mail
> system with ldap@linux.ibm.com addresses be cause it was simply
> impossible to engage with upstream development using ibm.com
> addresses.  So there are work arounds, and I encourage you to reach
> out to other Google kernel developers --- and if you are unhappy,
> please file internal bugs against the corp infrastructure.

Note, one issue is that some corporations do not want to support two
email services. It's hard enough securing one, opening up another one
is just opening another door to be cracked.

We do file bugs when there's issues, but that doesn't mean they will be
resolved. I have special permission to use my personal account, but
most people at my company do not have that permission, and this is a
heart ache for those that need to send email via the corporate email
servers.

Now, if we had a way to send and receive upstream patches via a web
site, that would actually make things easier.

-- Steve

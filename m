Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC56ECE588
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 14:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 053D721925
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 14:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732457AbfJOOFe (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 10:05:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:40052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732329AbfJOOFe (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 10:05:34 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AF422064B;
        Tue, 15 Oct 2019 14:05:33 +0000 (UTC)
Date:   Tue, 15 Oct 2019 10:05:31 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015100531.44175c63@gandalf.local.home>
In-Reply-To: <20191015133526.GC7456@mit.edu>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
        <20191011085702.GB1075470@kroah.com>
        <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
        <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
        <20191014205658.GG5564@mit.edu>
        <20191015083741.1d0731e5@gandalf.local.home>
        <20191015133526.GC7456@mit.edu>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 15 Oct 2019 09:35:27 -0400
"Theodore Y. Ts'o" <tytso@mit.edu> wrote:

> On Tue, Oct 15, 2019 at 08:37:41AM -0400, Steven Rostedt wrote:
> > Now, if we had a way to send and receive upstream patches via a web
> > site, that would actually make things easier.  
> 
> Alas, for those corporations who choose to enable DMARC in hard-fail
> mode (which includes google.com BTW, although thankfully, not
> gmail.com) sending (from DMARC's perspective, "forging") e-mail from
> someone at that particular domain won't work unless it comes from an
> authorized e-mail server.

I'm not talking about the web interface forging an email. I'm assuming
that we have a way to communicate with something other than email.
Although, when submitting to this interface, you can be subscribed to
receive an email from the interface with something that looks just like
a patch.

-- Steve


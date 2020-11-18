Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0135DC3E8C5
	for <workflows@archiver.kernel.org>; Wed, 18 Nov 2020 18:13:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9384B217A0
	for <workflows@archiver.kernel.org>; Wed, 18 Nov 2020 18:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbgKRSN0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 18 Nov 2020 13:13:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:41844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725814AbgKRSN0 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 18 Nov 2020 13:13:26 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DB91B20872;
        Wed, 18 Nov 2020 18:13:24 +0000 (UTC)
Date:   Wed, 18 Nov 2020 13:13:22 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Evan Rudford <zocker76@gmail.com>
Cc:     Greg KH <greg@kroah.com>, workflows@vger.kernel.org
Subject: Re: Is the Linux kernel underfunded? Lack of quality and security?
Message-ID: <20201118131322.7bae7622@gandalf.local.home>
In-Reply-To: <CAE90CG5MQM+8qX0F_RHmHwrh3fP1oxbtTym_tv-UhW2K3pYD-A@mail.gmail.com>
References: <CAE90CG5h0RqNs8N7qbZzajYK9A3eY0LWHqLfzX7Z-v-aef4R2g@mail.gmail.com>
        <20200105081550.GB1667342@kroah.com>
        <CAE90CG5MQM+8qX0F_RHmHwrh3fP1oxbtTym_tv-UhW2K3pYD-A@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 18 Nov 2020 18:59:09 +0100
Evan Rudford <zocker76@gmail.com> wrote:

> This is perhaps hard to argue because the competition isn't good.
> To be honest, I feel that neither Linux nor any other "major" OS is
> reaching "high" security-standards.
> It is a fallacy to think that the security-situation is good just
> because nobody else is better.
> And of course, rewriting Linux is nearly impossible, but I doubt that
> Linux will ever become "truly secure" as long as everything is written
> in C.
> Let's face the reality: C is an excellent systems programming
> language, but it is like an "unprotected chainsaw" with respect to
> security.
> 

I call "bull" on the above statement. This C isn't secure, is just a
blanket statement. Yes, C has issues, and so does assembly (which there's
plenty of that in the kernel). But with the amount of static analyzers and
fuzz testing going on, the typical C bugs that are in most projects are
well discovered in the Linux kernel.

> > Again, citation please?  I would argue that right now we have too many
> > people/resources working on security issues that are really really minor
> > in the overall scheme of things.
> > greg k-h  
> 
> I agree that the current security-efforts might not be well-directed
> for the overall scheme of things.
> However, I don't think that security has "too many" people in total.
> It might be true that "minor" security-issues are eating too many
> resources, but there are still "non-minor" security issues that are
> not yet addressed.

Funny, I find that the biggest threat to security today is coming from the
hardware. Issues like spectre and meltdown, and everything to do with
parallel programming is going to be the new age of cracking the system. And
ironically, C and assembly are probably the best languages to counter it ;-)

-- Steve

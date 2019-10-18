Return-Path: <SRS0=I4mM=YL=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2ABCCA9ED0
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 05:17:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AAF8222C6
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 05:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405946AbfJRFRh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 18 Oct 2019 01:17:37 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:43188 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728020AbfJRFRh (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 18 Oct 2019 01:17:37 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id CA3E71F4C1;
        Fri, 18 Oct 2019 02:48:28 +0000 (UTC)
Date:   Fri, 18 Oct 2019 02:48:28 +0000
From:   Eric Wong <e@80x24.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Subject: Re: RFC: individual public-inbox/git activity feeds
Message-ID: <20191018024828.bifvcec36fvijyqb@dcvr>
References: <20191010192852.wl622ijvyy6i6tiu@chatter.i7.local>
 <20191010235725.GA15427@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191010235725.GA15427@dcvr>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Eric Wong <e@80x24.org> wrote:
> Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> 
> <snip a bunch of stuff I agree with>
> 
> > # Individual developer feeds
> 
> <snip>
> 
> > (With time, we can teach kernel.org to act as an MTA bridge that sends
> > actual mail to the mailing lists after we receive individual feed updates.)
> 
> I'm skeptical and pessimistic about that bit happening (as I
> usually am :>).  But the great thing is all that stuff can
> happen without disrupting/changing existing workflows and is
> totally optional.

Well, maybe less skeptical and pessimistic today...

Readers can look for messages intended for them on a DHT or some
other peer-to-peer system.  Or maybe various search engines can
spring into existence or existing ones can be optimized for this.

Readers can opt into this by using invalid/mangled addresses
(e.g "user@i-pull-my-email.invalid"); and rely on that to find
messages intended for them.

Senders sending to them will get a bounce, see the address; and
hopefully assume the reader will see it eventually if any
publically-archived address is also in the recipients list.

Or an an alternate header (e.g. "Intended-To", "Intended-Cc")
can also be used to avoid bounces (but MUAs would lose those on
"Reply-All"), so maybe putting those pseudo-headers in the
message body can work.


This will NOT solve the spam/flooding/malicious content problem.

However, the receiving end can still use SpamAssassin, rspamd,
or whatever pipe-friendly mail filters they want because it
still looks like mail.

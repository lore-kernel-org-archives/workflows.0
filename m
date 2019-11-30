Return-Path: <SRS0=Im9A=ZW=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44D0C432C0
	for <workflows@archiver.kernel.org>; Sat, 30 Nov 2019 18:17:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E57820833
	for <workflows@archiver.kernel.org>; Sat, 30 Nov 2019 18:17:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbfK3SRH (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 30 Nov 2019 13:17:07 -0500
Received: from s3.sipsolutions.net ([144.76.43.62]:50496 "EHLO
        sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfK3SRG (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 30 Nov 2019 13:17:06 -0500
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.92.3)
        (envelope-from <johannes@sipsolutions.net>)
        id 1ib7Ij-006oDa-NB; Sat, 30 Nov 2019 19:17:01 +0100
Message-ID: <ac18c57edf7581b874399d6a4f6c1fb20c3a6543.camel@sipsolutions.net>
Subject: Re: Structured feeds
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Stephen Finucane <stephen@that.guru>,
        Daniel Axtens <dja@axtens.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        patchwork@lists.ozlabs.org
Cc:     workflows@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        automated-testing@yoctoproject.org,
        Dmitry Vyukov <dvyukov@google.com>
Date:   Sat, 30 Nov 2019 19:16:59 +0100
In-Reply-To: <208edf06eb4c56a4f376caf0feced65f09d23f93.camel@that.guru>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
         <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
         <20191106205051.56v25onrxkymrfjz@chatter.i7.local>
         <87h83eh2op.fsf@dja-thinkpad.axtens.net>
         <223b3b048f644b4d0fd854f9e360ed6d451c8241.camel@sipsolutions.net>
         <208edf06eb4c56a4f376caf0feced65f09d23f93.camel@that.guru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sat, 2019-11-30 at 18:04 +0000, Stephen Finucane wrote:

> > Somebody (Daniel Borkmann?) posted a (very fast) public-inbox git to
> > maildir converter, with procmail support. I assume that would actually
> > satisfy this step already, since you can just substitute the patchwork
> > parser for procmail.
> 
> What do you mean "substitute the patchwork parser for procmail"? From
> reading this thread, I got the impression that we'd be changing what
> feeds things into the 'parsemail' management command, right?

Yes, that's exactly what I meant. I was looking at it from Daniel's
tool's POV, so instead of calling procmail it can call patchwork.

johannes


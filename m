Return-Path: <SRS0=Iv5R=ZB=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A520C43331
	for <workflows@archiver.kernel.org>; Sat,  9 Nov 2019 07:41:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 034A521882
	for <workflows@archiver.kernel.org>; Sat,  9 Nov 2019 07:41:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfKIHlO (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 9 Nov 2019 02:41:14 -0500
Received: from s3.sipsolutions.net ([144.76.43.62]:56296 "EHLO
        sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbfKIHlO (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 9 Nov 2019 02:41:14 -0500
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.92.3)
        (envelope-from <johannes@sipsolutions.net>)
        id 1iTLMs-0000af-Ae; Sat, 09 Nov 2019 08:41:10 +0100
Message-ID: <223b3b048f644b4d0fd854f9e360ed6d451c8241.camel@sipsolutions.net>
Subject: Re: Structured feeds
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Daniel Axtens <dja@axtens.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        patchwork@lists.ozlabs.org
Cc:     workflows@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        automated-testing@yoctoproject.org,
        Dmitry Vyukov <dvyukov@google.com>
Date:   Sat, 09 Nov 2019 08:41:08 +0100
In-Reply-To: <87h83eh2op.fsf@dja-thinkpad.axtens.net>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
         <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
         <20191106205051.56v25onrxkymrfjz@chatter.i7.local>
         <87h83eh2op.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sat, 2019-11-09 at 01:18 +1100, Daniel Axtens wrote:
> > 
>  - code that efficiently reads a public-inbox git repository/folder of
>    git repositories and feeds it into the existing parser. I have very
>    inefficient code that converts public-inbox to an mbox and then
>    parses that, but I'm sure you can do better with a git library.

Somebody (Daniel Borkmann?) posted a (very fast) public-inbox git to
maildir converter, with procmail support. I assume that would actually
satisfy this step already, since you can just substitute the patchwork
parser for procmail.

>  - careful thought about how to do this incrementally. It's obvious how
>    to do email incrementally, but I think you need to keep an extra bit
>    of state around to incrementally parse the git archive. I think.

Not sure he had an incremental mode figured out there, but that can't
really be all *that* hard, just store the last-successfully-parsed git
sha1?

johannes


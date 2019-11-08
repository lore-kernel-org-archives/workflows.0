Return-Path: <SRS0=Hr5F=ZA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BECFC43331
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 00:24:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 579372084C
	for <workflows@archiver.kernel.org>; Fri,  8 Nov 2019 00:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbfKHAYj (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 19:24:39 -0500
Received: from dcvr.yhbt.net ([64.71.152.64]:44258 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725928AbfKHAYi (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 7 Nov 2019 19:24:38 -0500
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 7DC151F454;
        Fri,  8 Nov 2019 00:24:38 +0000 (UTC)
Date:   Fri, 8 Nov 2019 00:24:38 +0000
From:   Eric Wong <e@80x24.org>
To:     Veronika Kabatova <vkabatov@redhat.com>
Cc:     Daniel Axtens <dja@axtens.net>, Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: Structured feeds
Message-ID: <20191108002438.GA7590@dcvr>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com>
 <8736f1hvbn.fsf@dja-thinkpad.axtens.net>
 <20191106205051.56v25onrxkymrfjz@chatter.i7.local>
 <CACT4Y+Ywzbwz7GNfOCJb+DGdKEdkAh+v+20hmNG7S1riEbhTNA@mail.gmail.com>
 <87tv7ggdio.fsf@dja-thinkpad.axtens.net>
 <1033825454.8368196.1573125977348.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1033825454.8368196.1573125977348.JavaMail.zimbra@redhat.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Veronika Kabatova <vkabatov@redhat.com> wrote:
> I'll be totally honest and admit I ignored most of the implementation details
> of public inbox feeds (will take a look when I have some free time) but as
> long as they contain the original email, the feature should be usable with
> them too.

Implementation details should not matter to consumers.

public-inbox exposes everything as NNTP which is the same
message format as email.  NNTP is also much more stable and
established than the v2 git layout of public-inbox (which could
be superceded by a hypothetical "v3" layout).

I highly recommend anybody consuming public-inbox (and not
making 1:1 mirrors) use NNTP since it's well-established
and doesn't enforce long-term storage requirements.

I hope to support HTTP(S) CONNECT tunneling as a means for users
behind firewalls to get around NNTP port 119/563 restrictions.

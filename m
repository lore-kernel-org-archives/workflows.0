Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A6DC4CECE
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 22:18:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 851ED2067B
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 22:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731691AbfJNWSh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 18:18:37 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:34936 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730369AbfJNWSh (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 14 Oct 2019 18:18:37 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 7CDB51F4C0;
        Mon, 14 Oct 2019 22:18:36 +0000 (UTC)
Date:   Mon, 14 Oct 2019 22:18:36 +0000
From:   Eric Wong <e@80x24.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191014221836.ktfe75amdk43uem7@dcvr>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
 <20191011212308.xk7xcvfamwnkwovn@dcvr>
 <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
 <20191013233930.GB13089@dcvr>
 <CAMuHMdUWCZSt4khKajise_UrRJxHS2a=LL334u8Y938PfK2rQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUWCZSt4khKajise_UrRJxHS2a=LL334u8Y938PfK2rQQ@mail.gmail.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Oct 14, 2019 at 2:12 AM Eric Wong <e@80x24.org> wrote:
> > We can also find creative ways to subvert corporate policies:
> > For example; if their policy specifically prevents outgoing SMTP,
> > "git imap-send" could be used.
> 
> IMAP may be blocked, too?

Yes, was just pointing to "git imap-send" which already exists;
but anything can go over HTTPS POST + Transfer-Encoding:chunked.

> Bascially the only thing you can rely on is HTTP(S), through a proxy,
> possibly with HTTPS inspection through a company-specific trusted
> certificate that allows MITM.

Right, I was tunneling arbitrary data over HTTP/1.1 via
Transfer-Encoding:chunked on both requests/responses over a
decade ago.  Probably won't work with nginx because of input
buffering, but public-inbox-httpd can be made to support it
w/o buffering, too (it already does HTTPS + chunk parsing).

I got something working on the server-side for git:// using Ruby
back in 2009:
  https://public-inbox.org/git/20090702085440.GC11119@dcvr.yhbt.net/

Client-side needed some work, though...

> > If their policy forbids using external "email" services, we'd
> > name it "Kernel Hackers' Messaging System" or something of that
> > sort and say we use an email bridge :>
> 
> Anything named "Hacker" may be blocked, too ;-)

Unpxref, then :>

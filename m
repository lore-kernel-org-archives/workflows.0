Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000C6C47404
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 21:23:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7CD72089F
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 21:23:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbfJKVXJ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 17:23:09 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:44784 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727500AbfJKVXJ (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 11 Oct 2019 17:23:09 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id ACF471F4C0;
        Fri, 11 Oct 2019 21:23:08 +0000 (UTC)
Date:   Fri, 11 Oct 2019 21:23:08 +0000
From:   Eric Wong <e@80x24.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191011212308.xk7xcvfamwnkwovn@dcvr>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> On Fri, Oct 11, 2019 at 10:57:02AM +0200, Greg KH wrote:
> > So other than that minor thing, sounds interesting.  It's hard to
> > determine just how difficult the whole "set up git and send a patch out"
> > process is for people these days given the _huge_ numbers of new
> > contributions we keep getting, and the numerous good tutorials we have
> > created that spell out exactly how to do this.
> > 
> > So you might be "solving" a problem that we don't really have.  It's
> > hard to tell :(
> 
> It is interesting that there are split views on this. The main reason why I
> was thinking about it was because the topic came up a few times already. For
> example, in a conversation last year on ksummit-discuss:
> 
> https://lore.kernel.org/ksummit-discuss/ECADFF3FD767C149AD96A924E7EA6EAF7C1EAA24@USCULXMSG01.am.sony.com/
> 
> Tim Bird mentioned that Sony developers couldn't send/receive patches
> because their corporate mail server rewrote all links to go through some
> kind of security appliance verification. If you read that thread, what we
> are discussing now is what I suggested we did then -- a web tool that could
> take corporate SMTP servers out of the equation.
> 
> (This is the same reason I generally disagree with Eric Wong about
> preserving SMTP as the primary transmission protocol -- I've heard lots of
> complaints both from kernel developers and especially from people trying to
> contribute to CAF about corporate policies actually making it impossible to
> submit patches -- and no, using a different mail server is not a possibility
> for them because it can be a firing offense under their IT AUP rules.)

I'm not opposed to a webmail interface tailored to kernel hacking
which does stuff like checkpatch.pl and get_maintainer.pl before
sending (similar to your patchwork proposal and
gitgadgetgadget).  That would get around security appliances
but SMTP would still be used in the background.

Or offer full-blown HTTPS webmail + IMAP + SMTP access like any
other webmail provider + checkpatch + get_maintainer helpers.

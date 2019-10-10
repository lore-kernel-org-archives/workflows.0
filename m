Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792B4C10F14
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 20:36:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 44839206B6
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 20:36:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbfJJUgR (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 16:36:17 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:34176 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726533AbfJJUgR (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 10 Oct 2019 16:36:17 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 3C03F1F4C0;
        Thu, 10 Oct 2019 20:36:17 +0000 (UTC)
Date:   Thu, 10 Oct 2019 20:36:17 +0000
From:   Eric Wong <e@80x24.org>
To:     Jonathan Nieder <jrnieder@gmail.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org,
        git@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191010203617.o6gyhnkjbbd7njnw@dcvr>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191010150729.1355f33d@coco.lan>
 <20191010195335.fmh6atylozhehftt@chatter.i7.local>
 <20191010200528.GA5612@dcvr>
 <20191010202151.GC191800@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191010202151.GC191800@google.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Jonathan Nieder <jrnieder@gmail.com> wrote:
> Eric Wong wrote:
> > Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> 
> >> This is actually really fast if you already have a local copy of the
> >> repository with most objects. Try this yourself if you have
> >> torvalds/linux.git locally:
> >>
> >> git clone --bare -s torvalds/linux.git test
> >
> > Yep, -s (--shared) makes cloning really cheap.  One of my goals is to get
> >
> > 	git clone -s https://example.com/torvalds/linux.git
> >
> > and
> >
> > 	git clone -s https://example.com/torvalds/linux.git/clone.bundle
> >
> > working.  That would make it easier for new contributors to
> > setup lightweight clones and pull in history on an as-needed
> > basis w/o hacks like shallow cloning.
> 
> Does "git clone --filter=blob:none" do what you're looking for?

Oops, haven't seen that new feature :x  And haven't tried, pu @
8d9027fa59b943db96a8a9090ec31d7f0f935596 is broken due to
conflicts with hashmap (probably won't have time for a bit to
look at it).

What I'm hoping to do with "git clone -s" would be client-only
and compatible with existing HTTP servers that run
"git update-server-info".

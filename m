Return-Path: <SRS0=71d8=X4=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8FAC32792
	for <workflows@archiver.kernel.org>; Thu,  3 Oct 2019 09:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8E62C21848
	for <workflows@archiver.kernel.org>; Thu,  3 Oct 2019 09:23:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbfJCJXb (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 3 Oct 2019 05:23:31 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:59572 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727611AbfJCJXb (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 3 Oct 2019 05:23:31 -0400
Received: from 79.184.253.225.ipv4.supernova.orange.pl (79.184.253.225) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id de9c46493afe9a6d; Thu, 3 Oct 2019 11:23:28 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Daniel Axtens <dja@axtens.net>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>, workflows@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Date:   Thu, 03 Oct 2019 11:23:28 +0200
Message-ID: <1881738.6USjZhhSkN@kreacher>
In-Reply-To: <87pnjf2pnw.fsf@dja-thinkpad.axtens.net>
References: <1811089.yxvLMk49Ug@kreacher> <2432650.iS68q0zTR2@kreacher> <87pnjf2pnw.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wednesday, October 2, 2019 4:22:11 PM CEST Daniel Axtens wrote:
> "Rafael J. Wysocki" <rjw@rjwysocki.net> writes:
> 
> > On Monday, September 23, 2019 6:20:01 PM CEST Theodore Y. Ts'o wrote:
> >> One of the things I'd like to add as a strong desire is the ability to
> >> review patches via web if that's what users would like to do.  There
> >> are some real benefits for web-based review.  It means that if you
> >> need to see greater context, it's relatively easy to do this.  It also
> >> is convenient to be able to see the conversation for a particular hunk
> >> of code right alongside the code.
> >
> > I totally agree.
> >
> > That may not be clear from my original posting (sorry about that), but it
> > was my basic assumption that the web-based functionality would be there.
> >
> >> It's clear that whatever we do, it needs to be compatible with e-mail.
> >> That's very clear.  But it would be useful if we can support both the
> >> e-mail and web-based review.
> >
> > Right.
> 
> A long time ago now (before I was involved) there was talk of extending
> patchwork to allow logged in users to comment on a patch in the web UI
> and have patchwork send the comment as an email on your behalf.

I actually would appreciate something like that. :-)

Today, if I look at a patch in Patchwork and want to make comments on it, I
need to find it in an email client and do that from there which at least is
somewhat cumbersome.

> This was in the happier(?) days before we had SPF and DMARC, so I don't know
> how feasible it would be today. (Maybe the emails would just have to come
> from 'Patchwork on behalf of J. R. Developer'.)

That would work for me.

> But could web-based review be as simple as a web form that sends an email?

That might work too I suppose, but I would like it to open up with the body of
the message I'm replaying to quoted with "> " (so things don't need to be
copied from there by hand).

> (I'm not advocating that this be put in patchwork straight away or
> necessarily at all, but I think a proof of concept that lives off to the
> side of patchwork could be an excellent use of the patchwork API!)

Sure.

Cheers,
Rafael




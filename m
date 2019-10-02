Return-Path: <SRS0=2Hi9=X3=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D378CC35280
	for <workflows@archiver.kernel.org>; Wed,  2 Oct 2019 09:55:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEA6E218DE
	for <workflows@archiver.kernel.org>; Wed,  2 Oct 2019 09:55:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbfJBJzj (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 2 Oct 2019 05:55:39 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:51952 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfJBJzj (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 2 Oct 2019 05:55:39 -0400
Received: from 79.184.253.225.ipv4.supernova.orange.pl (79.184.253.225) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id 3681733aa1936cac; Wed, 2 Oct 2019 11:55:37 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Date:   Wed, 02 Oct 2019 11:55:37 +0200
Message-ID: <2432650.iS68q0zTR2@kreacher>
In-Reply-To: <20190923162001.GD6005@mit.edu>
References: <1811089.yxvLMk49Ug@kreacher> <20190923162001.GD6005@mit.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Monday, September 23, 2019 6:20:01 PM CEST Theodore Y. Ts'o wrote:
> One of the things I'd like to add as a strong desire is the ability to
> review patches via web if that's what users would like to do.  There
> are some real benefits for web-based review.  It means that if you
> need to see greater context, it's relatively easy to do this.  It also
> is convenient to be able to see the conversation for a particular hunk
> of code right alongside the code.

I totally agree.

That may not be clear from my original posting (sorry about that), but it
was my basic assumption that the web-based functionality would be there.

> It's clear that whatever we do, it needs to be compatible with e-mail.
> That's very clear.  But it would be useful if we can support both the
> e-mail and web-based review.

Right.

> There have some prototypes that have
> been floated which shows that it is at least possible; perhaps
> imperfectly, but something which provides a bidrectional gateway
> between those who perfer to use e-mail and those that prefer to use a
> web-based UI would be able to do it.
> 
> There will be many potential kernel contributors who will be used to
> web-based UI's such as those that are available on github.  So while
> remaining e-mail compatible, having some way of allow as many
> operations to be done via web interfaces might help us get some newer
> developers who are more comfortable to living on the web than some of
> us more senior developers who remember when "gopher" was a text-based
> search engine, and not a mascot for the Go programming langauge.  :-)

I agree.

Cheers,
Rafael




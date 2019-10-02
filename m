Return-Path: <SRS0=2Hi9=X3=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E57C35280
	for <workflows@archiver.kernel.org>; Wed,  2 Oct 2019 09:30:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B0C921920
	for <workflows@archiver.kernel.org>; Wed,  2 Oct 2019 09:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfJBJaF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 2 Oct 2019 05:30:05 -0400
Received: from cloudserver094114.home.pl ([79.96.170.134]:60916 "EHLO
        cloudserver094114.home.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfJBJaF (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 2 Oct 2019 05:30:05 -0400
Received: from 79.184.253.225.ipv4.supernova.orange.pl (79.184.253.225) (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id 03f8d1b3f9a8aae1; Wed, 2 Oct 2019 11:30:02 +0200
From:   "Rafael J. Wysocki" <rjw@rjwysocki.net>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Kernel development collaboration platform wish list
Date:   Wed, 02 Oct 2019 11:30:01 +0200
Message-ID: <4436088.ncslsQyTqs@kreacher>
In-Reply-To: <20190913113753.GG29992@pendragon.ideasonboard.com>
References: <1811089.yxvLMk49Ug@kreacher> <20190913113753.GG29992@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Friday, September 13, 2019 1:37:53 PM CEST Laurent Pinchart wrote:
> Hi Rafael,
> 
> On Fri, Sep 13, 2019 at 10:22:20AM +0200, Rafael J. Wysocki wrote:
> > Hi All,
> > 
> > During the Maintainers Summit session yesterday I started to create a wish list
> > for the new kernel development collaboration platform to be created (and to
> > replace the multiple pieces of tooling in use today).  I also asked Bjorn,
> > Jiri, Greg and Shuah for input and here's the reslut:
> > 
> > 1. Compatible with e-mail
> > 
> >   (a) E-mail send to it stored and included automatically; appears as part of
> >       the normal flow.
> > 
> >   (b) Automatic e-mail responses
> >       If e-mail is sent to it, the sender will get all responses to it in the
> >       given thread by e-mail.
> > 
> > 2. History tracking
> > 
> >   (a) Should be able to track revisions of a given patch series (or patch) down
> >       to the initial submission.
> > 
> > 3. Integration with git
> > 
> >   (a) Should be able to create git commits from patches (or patch series)
> >       tracked by it if pointed to a git branch (either locally or remotely).
> > 
> >   (b) Link tags pointing back to it should be added automatically to git
> >       commits created from patches tracked by it.
> 
> In addition to a link, should the tag message contain a copy of the
> cover letter for the patch series ?

Well, that too unless there is a sufficiently straightforward way to get from
a patch (tracked by it) to the series cover letter.  For instance, if the cover
letter is one mouse click away from the patch, it may not be worth
duplicating is the tag message.




Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A16C433DB
	for <workflows@archiver.kernel.org>; Tue, 23 Mar 2021 16:31:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D595D619BB
	for <workflows@archiver.kernel.org>; Tue, 23 Mar 2021 16:31:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233169AbhCWQak (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 23 Mar 2021 12:30:40 -0400
Received: from bedivere.hansenpartnership.com ([96.44.175.130]:36856 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233342AbhCWQaf (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 23 Mar 2021 12:30:35 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id EA9091280510;
        Tue, 23 Mar 2021 09:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1616517034;
        bh=7yFG5lL2+BNpd1ONVR4hyeUFNcZHrwq0RYV98R5DXcY=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=LUacreyrugyWSFUJrW1JxkrINrQLIwKlzgLk0TErBBgxkIB/iQoDhT7ZGBGrvGOqZ
         n5DVIoL66VnDp7HnKHSiZ03dKPpv/DEoLASMVbYLui5SDViVC554+538qIb6laFUMm
         auCC/PZgZlglg7nMWv4CNwFu32HBSVqcdL70PVYo=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1EIiGR9pV7zf; Tue, 23 Mar 2021 09:30:34 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 720E4128050C;
        Tue, 23 Mar 2021 09:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1616517034;
        bh=7yFG5lL2+BNpd1ONVR4hyeUFNcZHrwq0RYV98R5DXcY=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=LUacreyrugyWSFUJrW1JxkrINrQLIwKlzgLk0TErBBgxkIB/iQoDhT7ZGBGrvGOqZ
         n5DVIoL66VnDp7HnKHSiZ03dKPpv/DEoLASMVbYLui5SDViVC554+538qIb6laFUMm
         auCC/PZgZlglg7nMWv4CNwFu32HBSVqcdL70PVYo=
Message-ID: <72f1c67bc8ad21bb1e5a7d77b88e2c3e50065e3b.camel@HansenPartnership.com>
Subject: Re: [Ksummit-discuss] RFC: create mailing list "linux-issues"
 focussed on issues/bugs and regressions
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Thorsten Leemhuis <linux@leemhuis.info>
Cc:     ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        workflows@vger.kernel.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date:   Tue, 23 Mar 2021 09:30:33 -0700
In-Reply-To: <20210323122025.77888b49@gandalf.local.home>
References: <613fe50d-fc9c-6282-f1f3-34653acb2ee9@leemhuis.info>
         <CAHk-=wgiYqqLzsb9-UpfH+=ktk7ra-2fOsdc_ZJ7WF47wS73CA@mail.gmail.com>
         <62b60247-7838-a624-706e-b1a54785b2a5@leemhuis.info>
         <20210323122025.77888b49@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, 2021-03-23 at 12:20 -0400, Steven Rostedt wrote:
> On Mon, 22 Mar 2021 20:25:15 +0100
> Thorsten Leemhuis <linux@leemhuis.info> wrote:
> 
> > I agree to the last point and yeah, maybe regressions are the more
> > important problem we should work on – at least from the perspective
> > of kernel development.  But from the users perspective (and
> > reporting-issues.rst is written for that perspective) it feel a bit
> > unsatisfying to not have a solution to query for existing report,
> > regressions or not. Hmmmm...
> 
> I think the bulk of user issues are going to be regressions. Although
> you may be in a better position to know for sure, but at least for
> me, wearing my "user" hat, the thing that gets me the most is
> upgrading to a new kernel and suddenly something that use to work no
> longer does. And that is the definition of a regression. My test
> boxes still run old distros (one is running fedora 13). These are the
> boxes that catch the most issues, and if they do, they are pretty
> much guaranteed to be a regression.
> 
> I like the "linux-regressions" mailing list idea.

Can't we use the fancy features of public inbox to get the best of both
worlds?  Have the bug list (or even a collection of lists) but make the
linux-regressions one a virtual list keying off an imap flag which a
group of people control.  That way anything that is flagged as a
regression appears in that public inbox.  I assume the search can be
quite wide so we could flag a regression on any list indexed by lore?

James



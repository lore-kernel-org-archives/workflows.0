Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4F0C2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:54:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C78961026
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232656AbhFQP4Z (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbhFQP4Z (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 11:56:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BEACC061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 08:54:17 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9B11E7B;
        Thu, 17 Jun 2021 17:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623945255;
        bh=i4aBjcYRL0+o7342BGSJ5sOfQGFX3QYmARVfkpyJV3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jvf/ioXV7F7+/xFZoaJSLl6aItcTEHeJv3K3ZOXOFrv3QL8g2+b5xqaMl60OkOy1K
         Imi/g9Dig1eQc7GuvldYHgrGsIj1IF2vitQy34Mq7hnsEJpqtTGMfIQef8mb6YirVx
         Lvfm7gbfm63u/zx+VqptcHyQgRKIlCX0xF9JXf8s=
Date:   Thu, 17 Jun 2021 18:53:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>, users@linux.kernel.org,
        workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <YMtwEURkkz9KKikh@pendragon.ideasonboard.com>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <CAL_JsqLMPnCpEHpbj_=LDQNU9+sq5oFrmSxngdiWNR3XOhtc_Q@mail.gmail.com>
 <20210617144741.jxachwj46ftzlgns@nitro.local>
 <20210617112556.41fe8200@gandalf.local.home>
 <YMtu66NhcXLUMmVC@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YMtu66NhcXLUMmVC@infradead.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Christoph,

On Thu, Jun 17, 2021 at 04:48:59PM +0100, Christoph Hellwig wrote:
> On Thu, Jun 17, 2021 at 11:25:56AM -0400, Steven Rostedt wrote:
> > Let me see if I understand the proposed work flow, and perhaps add some
> > myself.
> > 
> > 1) Someone clones Linus's tree or some subsystem tree into their github
> >    account.
> > 
> > 2) Does some work.
> > 
> > 3) Pushes it to their account on github.
> > 
> > 4) Runs git pull-request that will go to pulls@lists.kernel.dev
> > 
> > 5) Then this bot can pull the request into a kernel.org tree.
> > 
> > 6) Runs checkpatch on each commit.
> > 
> >    On errors, sends a report to the submitter, and stops here.
> > 
> > 7) Could have the zero-day-bot run against it.
> > 
> >    On errors, send it back to the submitter.
> > 
> > 8) If it passes all the above, it then gets broken into a patch series and
> >    then sent out to the mailing lists and Cc's maintainers based on the
> >    get_maintainers list. Probably should be filtered a bit.
> > 
> > Is this what is being proposed?
> 
> Minus checkpatch.pl which actively causes harm these days this would be
> incredibly useful.  I'm all for this while I'm totally opposed to
> plugging into the fashionable SAAS desaster of the day.

For the heuristics-based checkers that don't provide a 100% trustable
pass/fail result, we could send a report to the submitter with the
option to override the checker and go ahead, or submit a fixed pull
request. Assuming that good faith would be the norm rather than the
exception, I would expect submitters to take this into account more
often than not, which can reduce the load on maintainers.

This however doesn't solve the problem of differences between subsystems
in, for instance, coding style.

-- 
Regards,

Laurent Pinchart

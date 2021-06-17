Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1943BC2B9F4
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:24:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC34F613EF
	for <workflows@archiver.kernel.org>; Thu, 17 Jun 2021 15:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbhFQP0o (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233130AbhFQP0o (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Jun 2021 11:26:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DBFDC061574
        for <workflows@vger.kernel.org>; Thu, 17 Jun 2021 08:24:36 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 316AEE7B;
        Thu, 17 Jun 2021 17:24:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623943474;
        bh=rcnsVCK0rYMYm9twVzLQ0RVhL+YFWDB5DA88w+SfFl8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QcdBN/VT+rBSYBpH2tiMxTSmIyWrox71rNC6Gp9wd81DQVa4kuLnDIsg9o5Hehc2S
         ILQmkDP0Ps8CoCP837vvpGdR5mYkoKQ7z0VEuV69sY3QZghuqLtTzwgM22HvW3FRGW
         jY72nGOE64svQAotWOFD1qtaxBAlaAx6pE2PnOXI=
Date:   Thu, 17 Jun 2021 18:24:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jiri Kosina <jikos@kernel.org>, users@linux.kernel.org,
        workflows@vger.kernel.org
Subject: Re: RFC: Github PR bot questions
Message-ID: <YMtpHPaJzMxmhslt@pendragon.ideasonboard.com>
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
 <YMsGoI0UdbmUebhX@infradead.org>
 <nycvar.YFH.7.76.2106171031220.18969@cbobk.fhfr.pm>
 <CACT4Y+YoHYCKaLdZFSLqKsMz1j72i=k12FVpmSo-OyB7rCorsw@mail.gmail.com>
 <YMsfXuykH6z0ZbpM@infradead.org>
 <20210617145728.nahkvtxapozccm6c@nitro.local>
 <20210617151659.GF5067@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210617151659.GF5067@sirena.org.uk>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jun 17, 2021 at 04:16:59PM +0100, Mark Brown wrote:
> On Thu, Jun 17, 2021 at 10:57:28AM -0400, Konstantin Ryabitsev wrote:
> > On Thu, Jun 17, 2021 at 11:09:34AM +0100, Christoph Hellwig wrote:
> 
> > > Because I don't waste my time on the kind of crap that comes from
> > > github.  If you build a separate webinterface that allows anyone to send
> > > a proper series from a git tree that is all fine.  But github is toxic.
> 
> > Won't this just end up reimplementing a lot of stuff that we already get "for
> > free" from Github and other forges? Yes, I know Github is proprietary, but so
> > are many SMTP gateways used to send the patch series. I don't see how what
> > the GH bot would do is different from:
> 
> I think part of the concern here is that people have some standard
> expectations for how projects they work with on Github are going to
> function so if people end up using Github to submit patches we may end
> up with some culture and process mismatches which could cause issues.

There are some features (or lack thereof) of git..b that I suspect
actively decrease the quality of the hosted software. For instance, the
inability to comment on the commit messages during review can play a
role in the average low quality of those messages. Similarly, review is
often based on changes, not on individual commits, which results in
commits being badly split (or not split at all, it's common to see very
large commits with a "fix stuff" commit message).

Developers who have only been exposed to those platforms are very likely
to never have learnt the importance of commit messages, and of proper
split of changes across commits. Those are issues that are inherent to
those platforms and that we will likely need to handle in an automated
way (at least to some extent) or maintainers will become crazy (I know
we already suffer from those issues with the mailing list-based
workflow, but I believe it would get worse, not better, and some of our
maintainers are already suffering way more than they should).

-- 
Regards,

Laurent Pinchart

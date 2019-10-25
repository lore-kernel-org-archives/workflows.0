Return-Path: <SRS0=qLuY=YS=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD11CA9EA0
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 11:16:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E26C2070B
	for <workflows@archiver.kernel.org>; Fri, 25 Oct 2019 11:16:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G32ppvy6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfJYLQU (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 25 Oct 2019 07:16:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47352 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439182AbfJYLQT (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 25 Oct 2019 07:16:19 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5DBF33A;
        Fri, 25 Oct 2019 13:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1572002177;
        bh=x1DIdiASvwHdTyLtyIYpB6dfYp8NA4RvF151F8WG+6Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G32ppvy6q5b3NdB2jq7gCmUmQANr14QG3BFoEvnb150sP+S6JXPWcaWF3FT+/D1zj
         seE6h+x3fucecEatq1DseQqNgPgogXbWr1Q/7n5Tb72MKmY/0SV8tMzHw3+FFr4KpE
         D+aGMc5r2Bt4EjSU/OmSM6nCsIHvxEDkbWHiMWnA=
Date:   Fri, 25 Oct 2019 14:16:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     workflows@vger.kernel.org
Subject: Re: Tooling and workflows meeting at OSS EU Lyon
Message-ID: <20191025111610.GB4740@pendragon.ideasonboard.com>
References: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191024205803.qdn6p32iyj5rqvc6@chatter.i7.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

On Thu, Oct 24, 2019 at 04:58:03PM -0400, Konstantin Ryabitsev wrote:
> Hi, everyone:
> 
> So, if I read everything correctly, the meeting shall take place at OSS EU
> Lyon, on Tuesday, from 14:00 to 15:00. The following people have 
> expressed interest in attending:
> 
> - Steven Rostedt
> - Greg Kroah-Hartman
> - Dmitry Vyukov
> - Konstantin Ryabitsev
> - Christian Brauner
> - Laurent Pinchart
> - Jon Corbet
> - Daniel Vetter
> - Nicolas Belouin
> - Shuah Khan
> 
> (If your name is not on this list but you're planning to attend, please 
> follow up.)
> 
> I have confirmed that we can use the Developer Lounge, which will 
> contain either a whiteboard or a flip chart. Alternatively, if you think 
> we should get a dedicated meeting room, we can book one on-site. It's on 
> a first-come, first-served basis and it doesn't look like I can book it 
> before actually getting there. I will send exact details of the location 
> on Monday.

Thank you for organising this.

> Since we only have an hour, I propose that we focus on a couple of 
> topics and perhaps keep them anchored to the immediate future, 
> discussing evolutionary changes as opposed to grand schemes that will 
> require changing half the known world.
> 
> I can discuss any of the following topics at length:
> 
> 1. Current tools and automation offered at kernel.org, plus new features 
>    they are likely to see in the future that are interesting to both 
>    developers and maintainers:
>     - public-inbox
>     - patchwork
>     - bugzilla
>     - pr-tracker-bot and git-patchwork-bot
> 
> 2. Proposed enhancements to the email-based workflow
>     - cryptographic attestation of patches
>     - adding (and requiring) base tree information in submitted patches/series
>     - git-to-ML bridges ("turn this pull request into a well-formatted 
>       patch series and send it to the right places")
> 
> 3. CI and bot integration
>     - identifying the data that maintainers/developers want to see
>     - communicating structured data over email
>     - providing consumable feeds of CI/bot jobs (as public-inbox 
>       repositories?)
>     - avoiding bug duplication
>     - recognizing when a bug is fixed and following up on issues that 
>       nobody has taken on
> 
> 4. Maintainer tooling
>     - adaptability of existing tools for kernel development, such as:
>       - GitHub/GitLab
>       - SourceHut
>       - Gerrit
> 
>     - building on top of public-inbox feeds to create a tool that can:
>       - track patches obtained from multiple sources (multiple mailing 
>         lists, individual developer feeds, bot activity feeds, etc)
>       - collect the usual trailers (Reviewed-By's, etc)
>       - show interdiffs
>       - send automated templated replies
>       - apply series to a local git repository (streamlining "save these 
>         patches as an mbox, make a new branch, run git-am")
> 
> Unfortunately, that's enough topics to fill a 3-day mini-summit. :) 
> Which ones are folks most interested in discussing during the meet-up, 
> and which ones should be targeted for hallway discussions?

I usually favour a top-down approach when discussing these topics,
starting with the big picture. I would thus have proposed discussing how
we can address the problems raised by the forge enthousiasts while not
compromising on the requirements of the decentralisation advocates.

This being said, I think it would indeed take way more time than we have
allocated for this meeting. We could this pick one of the tools that we
think has the most potential today, and discuss how to move it towards
our long term goal that we haven't agreed on yet :-)

I think the maintainer tooling topic is the one that would benefit the
most from face to face discussios as there's more brainstorming there,
while the other three could possibly be discussed by e-mail more easily.

-- 
Regards,

Laurent Pinchart

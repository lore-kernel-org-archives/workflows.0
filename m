Return-Path: <SRS0=tG+E=YH=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E66ECE587
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 15:33:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F18F821848
	for <workflows@archiver.kernel.org>; Mon, 14 Oct 2019 15:33:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="U3BVJ5ow"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730534AbfJNPdi (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 14 Oct 2019 11:33:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60018 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728888AbfJNPdi (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 14 Oct 2019 11:33:38 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BA16A46;
        Mon, 14 Oct 2019 17:33:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571067216;
        bh=1PNtp+RNq6LAEWA+ZniNi/chikr2lTo2+v1cZ2zlWXg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U3BVJ5owmD+gwp8FGSBncUmudUg+jPLJ3KmOfxmX6d1MI5OSz8VgCLEPckLVem4oZ
         G5Gy1LwtQ+LqDSWELjXF1vzVhaFar3x31iI+X8Gxt0oe328/KzB3F/qZ88ED7WyLF3
         1J+28bqhvPcFoOSV+U15rC1YfhL7G4+lGFxpXDw0=
Date:   Mon, 14 Oct 2019 18:33:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Eric Wong <e@80x24.org>, Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191014153333.GB23442@pendragon.ideasonboard.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
 <20191011212308.xk7xcvfamwnkwovn@dcvr>
 <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

On Fri, Oct 11, 2019 at 05:35:53PM -0400, Konstantin Ryabitsev wrote:
> On Fri, Oct 11, 2019 at 09:23:08PM +0000, Eric Wong wrote:
> >> (This is the same reason I generally disagree with Eric Wong about
> >> preserving SMTP as the primary transmission protocol -- I've heard lots of
> >> complaints both from kernel developers and especially from people trying to
> >> contribute to CAF about corporate policies actually making it impossible to
> >> submit patches -- and no, using a different mail server is not a possibility
> >> for them because it can be a firing offense under their IT AUP rules.)
> >
> > I'm not opposed to a webmail interface tailored to kernel hacking
> > which does stuff like checkpatch.pl and get_maintainer.pl before
> > sending (similar to your patchwork proposal and
> > gitgadgetgadget).  That would get around security appliances
> > but SMTP would still be used in the background.
> >
> > Or offer full-blown HTTPS webmail + IMAP + SMTP access like any
> > other webmail provider + checkpatch + get_maintainer helpers.
> 
> Well, this is the bit where I say that it may not be allowed by 
> corporate rules. I see this all the time in CAF/Android world where 
> companies *require* that all email goes through their SMTP server so 
> that it can be properly logged (often for legal reasons). And it is 
> often equally required that any code submissions come from 
> person@corporate.com and not person@free-email-provider.com for 
> License/CLA reasons, so setting up a webmail server is not a solution 
> either.
> 
> This is basically why SMTP sucks in my view -- and it's worthless trying 
> to pick fights with IT departments, because they are told to do so by 
> lawyers. So, I want to take SMTP out of the equation:
> 
> 1. provide a way for someone to submit a patch using a web interface 
>    (but still in a way that From: is their corporate ID)
> 2. use individual git feeds as a way to send out patches instead of 
>    always being secondary to SMTP

If the goal is to work around SMTP-related technical issues, is a web UI
really the best way to go ? Wouldn't it be better to do the same through
a git push ? We could setup a git server that requires authentication,
and implement a push-to-email bridge. The information that would need to
be entered in a web UI could be put in a tag message, and we could have
a CLI to create the tag from a list of questions.

-- 
Regards,

Laurent Pinchart

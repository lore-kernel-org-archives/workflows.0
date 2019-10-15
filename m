Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126D5C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:32:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D23802086A
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:32:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RXvfy29w"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728692AbfJOQcq (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 12:32:46 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56794 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388141AbfJOQcq (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 12:32:46 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 32708324;
        Tue, 15 Oct 2019 18:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571157164;
        bh=ZM0Mqdj2kiMckZDMCDmqvlACpmLkUA3PPYIcHeWJm18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RXvfy29wcA4wuK7JkCGkfuRogTOTVKj/EbDtr65XdUzf4UZKZ+hhBjhLuQo4dnfz7
         zLMhOlx76UTUsVn0RrfdiDBciSNAEh58XMhsTwHjfEFps2qAiaQe92+sxgZ6LeeKVA
         JtqUJnTeHYd9P7YEY49f0QKCq/kNne3UYgWi38j8=
Date:   Tue, 15 Oct 2019 19:32:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Eric Wong <e@80x24.org>, Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015163241.GI4875@pendragon.ideasonboard.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <20191011200228.zuka44ve7hob4ia4@chatter.i7.local>
 <20191011212308.xk7xcvfamwnkwovn@dcvr>
 <20191011213553.g3pleurh5uomumi7@chatter.i7.local>
 <20191014153333.GB23442@pendragon.ideasonboard.com>
 <20191015154010.GC11491@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191015154010.GC11491@chatter.i7.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

On Tue, Oct 15, 2019 at 11:40:10AM -0400, Konstantin Ryabitsev wrote:
> On Mon, Oct 14, 2019 at 06:33:33PM +0300, Laurent Pinchart wrote:
> > If the goal is to work around SMTP-related technical issues, is a web UI
> > really the best way to go ? Wouldn't it be better to do the same through
> > a git push ? We could setup a git server that requires authentication,
> > and implement a push-to-email bridge. The information that would need to
> > be entered in a web UI could be put in a tag message, and we could have
> > a CLI to create the tag from a list of questions.
> 
> Well, this is largely what GitGitGadget does 
> (https://gitgitgadget.github.io), and we could go that route, sure. I'm 
> reluctant only because, quoth:
> 
>   GitGitGadget itself is a GitHub App that is backed by an Azure 
>   Function written in pure Javascript which in turn triggers an Azure 
>   Pipeline written in Typescript (which is really easy to understand and 
>   write for everybody who knows even just a little Javascript), 
>   maintained at https://github.com/gitgitgadget/gitgitgadget.
> 
> I have zero familiarity with any of the above. That said, we do have a 
> bunch of CI engineers working at the LF, and I can probably avail myself 
> of their expertise if we decide to set this up.

I certainly wouldn't recommend a solution based on a proprietary
closed-source stack :-) But as we're talking about performing new
development for patchwork, I wanted to point out that we could also
consider a different technical approach that would involve new
development for a different open-source project. For instance, is the
above idea something that could be developed on top of gitolite ? Or
possibly even as a tiny standalone git server ?

-- 
Regards,

Laurent Pinchart

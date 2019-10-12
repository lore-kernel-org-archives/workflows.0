Return-Path: <SRS0=MafL=YF=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856DEC10F14
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 16:19:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 528A421850
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 16:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=that.guru header.i=@that.guru header.b="PP3YIDWG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfJLQT4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 12 Oct 2019 12:19:56 -0400
Received: from q2relay92.mxroute.com ([160.202.107.92]:37419 "EHLO
        q2relay92.mxroute.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729469AbfJLQSz (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 12 Oct 2019 12:18:55 -0400
X-Greylist: delayed 300 seconds by postgrey-1.27 at vger.kernel.org; Sat, 12 Oct 2019 12:18:55 EDT
Received: from filter001.mxrelay.co ([64.52.23.203] filter001.mxrelay.co)
 (Authenticated sender: mN4UYu2MZsgR)
 by q2relay92.mxroute.com (ZoneMTA) with ESMTPSA id 16dc0bf5f1f0001de3.003
 for <workflows@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Sat, 12 Oct 2019 16:13:50 +0000
X-Zone-Loop: 0c3d54022a54c44989a9571f4a21fa9e1a07d3f5eef3
X-Originating-IP: [64.52.23.203]
Received: from one.mxroute.com (one.mxroute.com [195.201.59.211])
        by filter001.mxrelay.co (Postfix) with ESMTPS id 29DD11007C9;
        Sat, 12 Oct 2019 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=that.guru;
         s=default; h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
        In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=0UXjjQKir7TbIeYCPm4hXoV9uSfycZFbYDJj4xEZpCQ=; b=PP3YIDWGw2Sx2CyGjN1MGrIQCC
        WF5OEBsDOf4JtakObuFnyX6yyRnRId8ieh8tHIb75D73UV0w7Wjk9nl3S031FdX+3N6lOQGvM4RYH
        gbbDgVUsuW1kaTwPXn7RY1km5sE2HfXHutuPSB3ldVSBY2WPHlv6kDioSACIkgwplpiTitR0qv02O
        gigFiR2NEvmmSjfAW3eH8NeWi8ejHQT51HiYIuDRBb766v1XEzGqpgtRvS6gQlqqa4rTSiCUs8Q+Z
        ScJN0SImuSR7o3V+0hDNjg7TjMlFdZYE9dE63XiBnnLH7Kdjs5Jxn9S+F8wDhpgyvYrOavLtbn9se
        yiUV9Efg==;
Message-ID: <0d08fb5cff7d15d372aab77fba94f5707425383b.camel@that.guru>
Subject: Re: RFE: use patchwork to submit a patch
From:   Stephen Finucane <stephen@that.guru>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Date:   Sat, 12 Oct 2019 17:13:45 +0100
In-Reply-To: <89c029a82dfd83d8ad4cbe9bb983e867f321ce1b.camel@that.guru>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
         <89c029a82dfd83d8ad4cbe9bb983e867f321ce1b.camel@that.guru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AuthUser: stephen@that.guru
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sat, 2019-10-12 at 14:16 +0100, Stephen Finucane wrote:
> On Thu, 2019-10-10 at 10:41 -0400, Konstantin Ryabitsev wrote:
> > Hi, all:
> > 
> > I would like to propose a new (large) feature to patchwork with the goal 
> > to make the process of submitting a patch easier for newbies and people 
> > generally less familiar with patch-based development. This was discussed 
> > previously on the workflows list: 
> > https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/

[top posting, sort of]

After writing this, I reopened my email client and noticed a lot of
replies that hadn't been there before. Stupid client/email provider
(I'm not sure who's to blame). It _seems_ like I'm not the only one
questioning the need for a point and click patch submission format, but
that doesn't mean there isn't some work we can do here. Previously,
Patchwork had the stated goal of aquiring the ability to reply to
patches via the web UI a lá Google Groups. If email is really an issue,
what about if we added that functionality along with the ability to
POST patches via the REST API? That would mean people would be able to
submit patches via e.g. 'git pw series submit' and then reply on the
web UI. I haven't really thought it through fully, but this _should_ do
most of what you're looking for, right?

Stephen

> I'll echo Daniel's sentiments that I like the idea of a git-to-email
> bridge, but that I'm not sure if that should belong in Patchwork core.
> I too am open to being convinced but before we get to anything like a
> solution though, I'd like to identify the problem(s) you're trying to
> solve. From reading this thread, it seems there are three separate
> issues issues intertwined here.
> 
>  * Corporate email is often broken, meaning people have to jump through
>    hoops to simply submit a patch, if it's even possible. [1]
>  * Encoding metadata in emails has to be done in an ad-hoc, freeform
>    fashion, through special headers, tags in the subject or specific
>    annotations in the body. This requires reading large contributors
>    guides before sending anything.
>  * Using CLI tools in general is hard for newbies (?)
> 
> Asssuming those are correct, I'd like to challenge some of them :)
> There isn't a whole lot that can be done about broken email, at least
> until JMAP becomes a thing (it's done over HTTP so that could help. Or
> not. idk), but I'm not sure about the other two. I don't know what kind
> of metadata would be needed to submit a patch to a random subtree of
> the kernel, but I assume the metadata exists for a reason? If so, is
> this actually something we can tackle via a UI or CLI without producing
> custom workflow tools for every single project and if not, can we
> actually solve this particular issue? Personal, I would consider
> reading the contributor guide a minimum barrier to entry, as without
> this you're simply transferring work from contributors to (often
> overworked) maintainers but I do acknowledge that it's easy for me to
> say that since I know how to do this stuff already. The same idea
> applies to the idea of not using CLIs. Is there an statistically
> significant amount of people that would be able to submit useful
> changes but can't use a CLI tool? I know you can get away without using
> a terminal for traditional Windows development or web development, but
> surely terminal knowledge is a prerequisite for almost everything else?
> 
> What I'm trying to get at here is figure out if (a) this is something
> that can really benefit from living in Patchwork, (b) this is something
> that needs a UI, (c) this is something's that necessary full stop (vs.
> just waiting for projects to switch to GitLab or Gerrit or whatever new
> cool ends up being). If we can figure that out, we can look into how we
> can go about implementing stuff.
> 
> Stephen
> 
> [1] I've multiple personal examples of this, from having to ask IT
> during my Intel days to remove automatic legal signatures to
> outlook.com refusing to respect message-id's, resulting in broken
> threading at a minimum. Thankfully I don't have to jump through those
> hoops at Red Hat but yeah, eew.
> 
> _______________________________________________
> Patchwork mailing list
> Patchwork@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/patchwork


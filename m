Return-Path: <SRS0=MafL=YF=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3838C4360C
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 13:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 700BB2089F
	for <workflows@archiver.kernel.org>; Sat, 12 Oct 2019 13:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=that.guru header.i=@that.guru header.b="nBOKlL6Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbfJLNnC (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 12 Oct 2019 09:43:02 -0400
Received: from bonobo.elm.relay.mailchannels.net ([23.83.212.22]:10314 "EHLO
        bonobo.elm.relay.mailchannels.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727115AbfJLNnB (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 12 Oct 2019 09:43:01 -0400
X-Sender-Id: ulrhytps5d|x-authuser|stephen@that.guru
Received: from relay.mailchannels.net (localhost [127.0.0.1])
        by relay.mailchannels.net (Postfix) with ESMTP id 0BB935A0A71
        for <workflows@vger.kernel.org>; Sat, 12 Oct 2019 13:43:00 +0000 (UTC)
Received: from laststand (100-96-171-212.trex.outbound.svc.cluster.local [100.96.171.212])
        (Authenticated sender: ulrhytps5d)
        by relay.mailchannels.net (Postfix) with ESMTPA id 49B515A07B2
        for <workflows@vger.kernel.org>; Sat, 12 Oct 2019 13:42:59 +0000 (UTC)
X-Sender-Id: ulrhytps5d|x-authuser|stephen@that.guru
Received: from laststand ([TEMPUNAVAIL]. [160.202.65.146])
        (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256)
        by 0.0.0.0:2500 (trex/5.18.5);
        Sat, 12 Oct 2019 13:42:59 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: ulrhytps5d|x-authuser|stephen@that.guru
X-MailChannels-Auth-Id: ulrhytps5d
X-Whistle-Cure: 2ef3f8d225d1e79c_1570887779740_3382964024
X-MC-Loop-Signature: 1570887779739:2122286273
X-MC-Ingress-Time: 1570887779739
Received: from filter001.mxrelay.co ([64.52.23.203] filter001.mxrelay.co)
 (Authenticated sender: mN4UYu2MZsgR)
 by laststand (ZoneMTA) with ESMTPSA id 16dc029b6460001f27.003
 for <workflows@vger.kernel.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Sat, 12 Oct 2019 13:30:22 +0000
X-Zone-Loop: b2349fda5d744346f6b3a160750d845e009bb53d98b8
X-Originating-IP: [64.52.23.203]
Received: from one.mxroute.com (one.mxroute.com [195.201.59.211])
        by filter001.mxrelay.co (Postfix) with ESMTPS id 12DB7100C6D;
        Sat, 12 Oct 2019 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=that.guru;
         s=default; h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
        In-Reply-To:Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=oVeu4KBo1BumwsFCBtwER+ccZNPLsCUIJmPwhPPt2YE=; b=nBOKlL6Z1HL+6YZwHXJLYU5xFB
        nN77ynVYJGkFtX3rytCLLL9SC9C+QUsp66/UFfo4IgjLOuyNmvSMbGmBDn1VZlCY0YqG9fn5rPo7B
        ugUdsaGolIYaWPS6S82CeAY5LUcJ+iOEf2Qpp+RxL4KT18+WwrKp/hy+d2sA5ObgrSQ2XlSVJQm4u
        TvbFMn4mt1vGyVfYe/jqQPLVfLro1x1R0Rvo1OMl3rq9GRblA8iy13WzI53SDuEA8ZOGoBR3ebtVq
        51Q6a1SwPNjevRHoi/eiAOz4WlPoy7VGz5BVR7xmuHXq5NytYtit2TI1X8PIBRWRv+nksNy+5jnSp
        /w6hXstw==;
Message-ID: <89c029a82dfd83d8ad4cbe9bb983e867f321ce1b.camel@that.guru>
Subject: Re: RFE: use patchwork to submit a patch
From:   Stephen Finucane <stephen@that.guru>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Date:   Sat, 12 Oct 2019 14:16:22 +0100
In-Reply-To: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-AuthUser: stephen@that.guru
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 2019-10-10 at 10:41 -0400, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> I would like to propose a new (large) feature to patchwork with the goal 
> to make the process of submitting a patch easier for newbies and people 
> generally less familiar with patch-based development. This was discussed 
> previously on the workflows list: 
> https://lore.kernel.org/workflows/20190930202451.GA14403@pure.paranoia.local/

I'll echo Daniel's sentiments that I like the idea of a git-to-email
bridge, but that I'm not sure if that should belong in Patchwork core.
I too am open to being convinced but before we get to anything like a
solution though, I'd like to identify the problem(s) you're trying to
solve. From reading this thread, it seems there are three separate
issues issues intertwined here.

 * Corporate email is often broken, meaning people have to jump through
   hoops to simply submit a patch, if it's even possible. [1]
 * Encoding metadata in emails has to be done in an ad-hoc, freeform
   fashion, through special headers, tags in the subject or specific
   annotations in the body. This requires reading large contributors
   guides before sending anything.
 * Using CLI tools in general is hard for newbies (?)

Asssuming those are correct, I'd like to challenge some of them :)
There isn't a whole lot that can be done about broken email, at least
until JMAP becomes a thing (it's done over HTTP so that could help. Or
not. idk), but I'm not sure about the other two. I don't know what kind
of metadata would be needed to submit a patch to a random subtree of
the kernel, but I assume the metadata exists for a reason? If so, is
this actually something we can tackle via a UI or CLI without producing
custom workflow tools for every single project and if not, can we
actually solve this particular issue? Personal, I would consider
reading the contributor guide a minimum barrier to entry, as without
this you're simply transferring work from contributors to (often
overworked) maintainers but I do acknowledge that it's easy for me to
say that since I know how to do this stuff already. The same idea
applies to the idea of not using CLIs. Is there an statistically
significant amount of people that would be able to submit useful
changes but can't use a CLI tool? I know you can get away without using
a terminal for traditional Windows development or web development, but
surely terminal knowledge is a prerequisite for almost everything else?

What I'm trying to get at here is figure out if (a) this is something
that can really benefit from living in Patchwork, (b) this is something
that needs a UI, (c) this is something's that necessary full stop (vs.
just waiting for projects to switch to GitLab or Gerrit or whatever new
cool ends up being). If we can figure that out, we can look into how we
can go about implementing stuff.

Stephen

[1] I've multiple personal examples of this, from having to ask IT
during my Intel days to remove automatic legal signatures to
outlook.com refusing to respect message-id's, resulting in broken
threading at a minimum. Thankfully I don't have to jump through those
hoops at Red Hat but yeah, eew.


Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DF3ECE588
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:44:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A5B820650
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="admU+BAg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbfJOQoc (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 12:44:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57046 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727643AbfJOQoc (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 12:44:32 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 271EF324;
        Tue, 15 Oct 2019 18:44:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571157870;
        bh=HhC8NS8BY31v4XqF1X33Z7kj7PW/yMqs3HoAqR+F0hQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=admU+BAgcmt2mDXbaxCJDWA1FB1yxgF3KCXj/Y7KohpjjqXvSZ6uKzEyHjkfOyYQv
         fSb9QxTh/FOTjUKdKPSvL5sT2w+AeLd9ONmbTbv9kRRc780ebn+343knH50KYd1d/N
         8NcMqgGIexeigx272yPTi/NPPSqA6k3ipk835ObA=
Date:   Tue, 15 Oct 2019 19:44:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Eric Wong <e@80x24.org>, Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015164427.GK4875@pendragon.ideasonboard.com>
References: <20191015163241.GI4875@pendragon.ideasonboard.com>
 <BXQ8S25YPZ4K.2C3I7TKEUE81O@homura>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BXQ8S25YPZ4K.2C3I7TKEUE81O@homura>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Drew,

On Tue, Oct 15, 2019 at 12:34:57PM -0400, Drew DeVault wrote:
> On Tue Oct 15, 2019 at 7:32 PM Laurent Pinchart wrote:
> > I certainly wouldn't recommend a solution based on a proprietary
> > closed-source stack :-) But as we're talking about performing new
> > development for patchwork, I wanted to point out that we could also
> > consider a different technical approach that would involve new
> > development for a different open-source project. For instance, is the
> > above idea something that could be developed on top of gitolite ? Or
> > possibly even as a tiny standalone git server ?
> 
> Some of the work I'm doing with code review on sourcehut can be
> generalized, to support writing up arbitrary mailing lists with
> arbitrary review tools with a bidirectional workflow. I intend to make a
> reality of this for at least lists.sr.ht <-> gitlab and lists.sr.ht <->
> github, so that patchsets and the resulting discussion gets turned into
> git{hub,lab} code reviews, and vise versa. I think it's possible to make
> a system which presents both sides with an experience that is idiomatic
> for each context, so that you can't really tell whose using which tool
> because they're both speaking each other's conventional language.

First of all, please let me thank you for all the effort you're putting
into this.

I'm not very confident that perfect transparent e-mail bridges could be
developed, and the culprit here it e-mail. From forge to e-mail there's
no real issue, we have structure data, and we write it out in text form.
The other way around, though, involves recovering structure from text.
If the MTAs, MDAs, MUAs and, quite importanttly, users, behave
correctly, that's doable. We can handle some of the "features" of common
M*A, but if someone decides to throw the formatting through the window
completely, we'll be screwed.

An idea I was toying with in the past was to create a structured format
for review, that would match what we use now in e-mail very closely, but
with a clearly defined syntax and grammar. The format would appear as
just plain e-mails to users, and a MUA that behaves reasonably would
likely produce valid structured data as e-mail replies. Over time we
could develop clients or teach some MUAs about the structured format,
removing the risk that they, or the end users, would mess up a reply.
The migration would be mostly transparent as it wouldn't really impact
existing users of e-mail, and could thus be rolled out over a long
period of time.

-- 
Regards,

Laurent Pinchart

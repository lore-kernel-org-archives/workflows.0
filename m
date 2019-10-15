Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EF3ECE588
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:34:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C4902086A
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:34:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="dE6xo6Vy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729863AbfJOQe7 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 12:34:59 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:60328 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728864AbfJOQe6 (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 12:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1571157298; bh=a4FcV2gv7A7eQoDsIUeYIc8ivUXPf0jTlf/JNEGYsP4=;
        h=In-Reply-To:Date:Cc:Subject:From:To;
        b=dE6xo6VyGBc6U0biJ/nV2Ycq8Gws04n+NB8XqOtPpZ9/R/RtVtuxrovihbZyvHf9V
         emErjbM7Thq68DzOk/LG8ijZb2GKyQ9XxIyH/qg1sawY4kHBUVTQyst6PxTQWiZ1GL
         b57nhqJrjEomv1Kjzc5g+EtUvfwwQ9T242J+SSMw=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20191015163241.GI4875@pendragon.ideasonboard.com>
Date:   Tue, 15 Oct 2019 12:34:57 -0400
Cc:     "Eric Wong" <e@80x24.org>, "Greg KH" <gregkh@linuxfoundation.org>,
        <patchwork@lists.ozlabs.org>, <workflows@vger.kernel.org>
Subject: Re: RFE: use patchwork to submit a patch
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
Message-Id: <BXQ8S25YPZ4K.2C3I7TKEUE81O@homura>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue Oct 15, 2019 at 7:32 PM Laurent Pinchart wrote:
> I certainly wouldn't recommend a solution based on a proprietary
> closed-source stack :-) But as we're talking about performing new
> development for patchwork, I wanted to point out that we could also
> consider a different technical approach that would involve new
> development for a different open-source project. For instance, is the
> above idea something that could be developed on top of gitolite ? Or
> possibly even as a tiny standalone git server ?

Some of the work I'm doing with code review on sourcehut can be
generalized, to support writing up arbitrary mailing lists with
arbitrary review tools with a bidirectional workflow. I intend to make a
reality of this for at least lists.sr.ht <-> gitlab and lists.sr.ht <->
github, so that patchsets and the resulting discussion gets turned into
git{hub,lab} code reviews, and vise versa. I think it's possible to make
a system which presents both sides with an experience that is idiomatic
for each context, so that you can't really tell whose using which tool
because they're both speaking each other's conventional language.

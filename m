Return-Path: <SRS0=J16y=YA=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F419AECE58C
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 15:35:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 811FC206C2
	for <workflows@archiver.kernel.org>; Mon,  7 Oct 2019 15:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="C+siR3QH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbfJGPfo (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 7 Oct 2019 11:35:44 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:50804 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728620AbfJGPfo (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 7 Oct 2019 11:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1570462543; bh=5EbnibxgrtU8jnvxGjhX+ytfVOTjUJJX/f6hMIas9Js=;
        h=In-Reply-To:Date:Cc:Subject:From:To;
        b=C+siR3QHNQ5mShEZPfHw3NgNTq8WCIcy9KI5+sWc0Aap9oXia584KqiQFbWHZIeFB
         I80doRbk8Dw7+EisPDCWuMxMbixzVsLFwlAi9/szJ3EzJ//SEZ7AimZFoA0Xh5+BW/
         QNUiSxdJunUBiTbbVo5BK33oJ1ngjmVIs2f9Lrko=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20191007.173329.2182256975398971437.davem@davemloft.net>
Date:   Mon, 07 Oct 2019 11:35:43 -0400
Cc:     <nhorman@tuxdriver.com>, <workflows@vger.kernel.org>
Subject: Re: thoughts on a Merge Request based development workflow
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "David Miller" <davem@davemloft.net>
Message-Id: <BXJEICGE1NYW.39KN61VRNGXPL@homura>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

There's no substance here to back up your arguments. You just say email
is dying and hope we take it for granted that you're right. Email is
_not_ terrible, and there are serious flaws with any of the proposed
alternatives to it.

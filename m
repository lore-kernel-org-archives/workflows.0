Return-Path: <SRS0=iLUk=YE=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5543BECE58D
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 19:02:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 187C2218AC
	for <workflows@archiver.kernel.org>; Fri, 11 Oct 2019 19:02:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="CfDMiOjl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728936AbfJKTCi (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 11 Oct 2019 15:02:38 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:38310 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728794AbfJKTCi (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 11 Oct 2019 15:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1570820557; bh=jY55TPWGKBH1C4mQtoByqSvtWG77xJZvma6WneSOsbo=;
        h=In-Reply-To:Date:To:Cc:Subject:From;
        b=CfDMiOjl5Ui6UphrpnMhLgS5olmqeWHI4ymyLEOwYXRz+HOz2CnH4rtj/lYWmj0jz
         QMp4zw9sGrDP9IY/ylKbscPbUAfM3nQptfU4bbyzp9x4xupui2LaZ68Uj4ei2ClcyN
         DNxNkdCSlVdiY5hZlq4QJvcYybCSaN+gbGczmcYA=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20191011155949.145f0f7d@coco.lan>
Date:   Fri, 11 Oct 2019 15:02:37 -0400
To:     "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "David Miller" <davem@davemloft.net>
Cc:     <rostedt@goodmis.org>, <skhan@linuxfoundation.org>,
        <gregkh@linuxfoundation.org>, <patchwork@lists.ozlabs.org>,
        <workflows@vger.kernel.org>
Subject: Re: RFE: use patchwork to submit a patch
From:   "Drew DeVault" <sir@cmpwn.com>
Message-Id: <BXMXEXQZRM3R.BVHXKDSEV8A4@homura>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

I happen to have been working on something like this today:

https://sr.ht/x71F.png

This doesn't require any JavaScript.

I've also been working on the other side, but it's less shiny - I'm
teaching pygit2 about pluggable object db backends so that I can teach
my mailing lists to talk to my git repos, and do things like offer
expandable diffs, check mergability of patches, submit CI jobs, etc.

Some more screenshots from my work today:

https://sr.ht/3grl.png
https://sr.ht/rcsA.png
https://sr.ht/CLHm.png

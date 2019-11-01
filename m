Return-Path: <SRS0=NMkj=YZ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B92ACA9ECB
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 02:27:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2EBBD2086D
	for <workflows@archiver.kernel.org>; Fri,  1 Nov 2019 02:27:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbfKAC1q (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 31 Oct 2019 22:27:46 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:51074 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729217AbfKAC1q (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 31 Oct 2019 22:27:46 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 4ED841F454;
        Fri,  1 Nov 2019 02:27:46 +0000 (UTC)
Date:   Fri, 1 Nov 2019 02:27:46 +0000
From:   Eric Wong <e@80x24.org>
To:     workflows@vger.kernel.org
Subject: patch attachments still unwelcome?
Message-ID: <20191101022746.GA25491@dcvr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

The BDFL sets an example by attaching patches:

https://lore.kernel.org/lkml/?q=f%3Atorvalds+n%3Apatch

So the documentation in the kernel advising against sending
patch attachments seems hypocritical.  Changing the kernel docs
allow patch attachments could be a good start to making life
easier for contributors without SMTP or IMAP access.

Are many MUAs still incapable of handling them?
mutt shows text patches inline, at least.

I've already been making public-inbox look harder for pre/post-image
OIDs in attachments that it wouldn't decode before:

https://public-inbox.org/meta/20191031031220.21048-1-e@80x24.org/

And I'm considering making it handle application/octet-stream, too;
since patches do end up with the wrong Content-Type, sometimes:

https://lore.kernel.org/lkml/CANAwSgRs2DUXwvhJD5qpXg04qEdP_Nt-wQqRbD2FpY2SWnHpAA@mail.gmail.com/

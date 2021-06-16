Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_20,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A150BC48BE5
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 17:49:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 946C961921
	for <workflows@archiver.kernel.org>; Wed, 16 Jun 2021 17:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbhFPRvh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Jun 2021 13:51:37 -0400
Received: from out0.migadu.com ([94.23.1.103]:51570 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230291AbhFPRve (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 16 Jun 2021 13:51:34 -0400
X-Greylist: delayed 324 seconds by postgrey-1.27 at vger.kernel.org; Wed, 16 Jun 2021 13:51:34 EDT
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmpwn.com; s=key1;
        t=1623865438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=09OywGFbOH0AKNZgYQ+3bmwRxN7CHBvB4jCDhtKQ0a0=;
        b=au8MYGw8ta3Y3XDIN6Z+QBPoZywTk2Y6aOTD4QIZNVAuDuBVMxSKYNFU7PEC6uyLfAiuRn
        j++f5HbWpv8JjRSxMFYqUlJZVEzwe+/oY1njGO0zgCBLgLXcXkR87MszpIl/Fp2QBwVMfH
        XldaDwazM6BtxESBuo+qg7hqlB+XPprMZRZYwzJpYljTPRtixp2z/w8UxnbsAJTfyLnq65
        M37U37nuRG/GdWMVs2QbvX6EYlmQ3k6CrB7akMb+7r0VGLKIpCdNQLHkKWsfuk8XmcR5bO
        c3dtnJ7I+lujPyR238CZKuDEL+HcdchC728IfQcPaWlOZ61dpWbctOfAeqHrlA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 16 Jun 2021 13:24:33 -0400
Message-Id: <CC57UCW5H2NE.3A6404HP4WC2Z@taiga>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>,
        <users@linux.kernel.org>, <workflows@vger.kernel.org>
Subject: Re: RFC: Github PR bot questions
References: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
In-Reply-To: <20210616171813.bwvu6mtl4ltotf7p@nitro.local>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: sir@cmpwn.com
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

FYI I have some prior art doing this in the reverse:

https://lists.alpinelinux.org/~alpine/aports/patches/3527
https://gitlab.alpinelinux.org/alpine/aports/-/merge_requests/21708

via dispatch.sr.ht:

https://git.sr.ht/~sircmpwn/dispatch.sr.ht

I would be quite happy to see support for doing this the other way
around, too.

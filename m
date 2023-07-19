Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484DEC001E0
	for <workflows@archiver.kernel.org>; Wed, 19 Jul 2023 18:36:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjGSSgZ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 19 Jul 2023 14:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjGSSgZ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 19 Jul 2023 14:36:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DEFB6;
        Wed, 19 Jul 2023 11:36:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA321617C7;
        Wed, 19 Jul 2023 18:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147F2C433C7;
        Wed, 19 Jul 2023 18:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689791783;
        bh=i0UCInbZcP5QkOgVWTWoZZYo5sBM7w7AUy/qgXJAKqA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OtcJycs603KfeRaT7rm5I5qvi48ExseEPsUdOgdmUBJ+C9LuJxtAuAQ2gk3ug8Kg+
         Hfq7atKHckdBgbpkYNQOeTF327nRkSySRlK/1pLVPoCrXFf37SPu7KutRPZHnw1Uwf
         L+MM7I2XhptQuRIWhhM/vRuFHrF7vq8xbLORk8CKC517+UpSu0juNbFRxe391V6fnz
         algtCABm3I8s9kfiJwZYCO8tvF4ITYt47UZyLSau7rsGSRzCLNzwfRS74BPhRPI553
         nHxZNYeqsMN9q941DQUgojKWi3PrZxnyrPUELjCMjzJk3Ax4GitepwC9AtARTMXvAx
         f2ap+e9JCDMQw==
Date:   Wed, 19 Jul 2023 11:36:22 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, gregkh@linuxfoundation.org,
        linux@leemhuis.info, broonie@kernel.org, krzk@kernel.org
Subject: Re: [PATCH docs v2] docs: maintainer: document expectations of
 small time maintainers
Message-ID: <20230719113622.27afb5f0@kernel.org>
In-Reply-To: <CAL_JsqKBbP_dXZCbyKtgXVDMV-0Qp8YLQAXANg+_XSiMxou9vw@mail.gmail.com>
References: <20230718155814.1674087-1-kuba@kernel.org>
        <CAL_JsqKBbP_dXZCbyKtgXVDMV-0Qp8YLQAXANg+_XSiMxou9vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 19 Jul 2023 11:54:53 -0600 Rob Herring wrote:
> > We appear to have a gap in our process docs. We go into detail
> > on how to contribute code to the kernel, and how to be a subsystem
> > maintainer. I can't find any docs directed towards the thousands
> > of small scale maintainers, like folks maintaining a single driver
> > or a single network protocol.  
> 
> I think the split is great. It would be even better if this
> distinction could be made in MAINTAINERS and then the tools could use
> that. For example, on treewide changes on Cc subsystem maintainers and
> skip driver maintainers. The problem right now is Cc'ing everyone
> quickly hits maillist moderation for too many recipients.

Interesting idea. I wonder how much of this can be accomplished by
improvements to get_maintainers and interpreting what we already have.
There are inverse annoyances, too, where patches for subsystems get
CCed all the way up the hierarchy and including linux-kernel@
for not apparent reason. We have to go sprinkle X: entries in
MAINTAINERS currently to prevent it.

In any case, I think that's a bit tangential. I sent a v3 already
'cause people kept reporting the same typoes :)

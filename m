Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 526A6C001DF
	for <workflows@archiver.kernel.org>; Tue, 18 Jul 2023 15:38:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232789AbjGRPiW (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 18 Jul 2023 11:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbjGRPiV (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 18 Jul 2023 11:38:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B54719A0;
        Tue, 18 Jul 2023 08:37:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B98066163F;
        Tue, 18 Jul 2023 15:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8838C433C8;
        Tue, 18 Jul 2023 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689694674;
        bh=4lzpTYj2kIXHXWaJYs/83EbVi/o1EKnwum3LfzARXr8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cNzyHRvyhQo8fy2tY5qhlfauywDksEZ+wW+jlrLSvyw0CUNqEW+spb+JpKUeB2vOF
         XRpuWyi5psLzSvAtrML+E9fp18f+Wxveel+SbkG2kyrEQIi1sELC0TkdIjv8SKOj6E
         HvfhLomkv0Sc67piLn6lGkvzrpMvQz7GqNiKqfkczbT1uZnRHaCUYs7u4O3MUvUPeQ
         rP7waYDkAeKoM0V0LAbaZjfjyY+bD8tj/zX3/bJBJtCrOHshOjfjNsx8x45l1cEGDE
         37ios2bSMjDt03MW1wvDgqPoxSzZVqBJqMqK2DNaN3mYtVo/gjp/77YoiLOgZpOhX2
         XoHMPrp44k96A==
Date:   Tue, 18 Jul 2023 08:37:53 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Cc:     Linux regressions mailing list <regressions@lists.linux.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>, corbet@lwn.net,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH docs] docs: maintainer: document expectations of small
 time maintainers
Message-ID: <20230718083753.2d1e003a@kernel.org>
In-Reply-To: <bb8c6476-283c-3bc6-710b-5a8602ccd40e@leemhuis.info>
References: <20230713223432.1501133-1-kuba@kernel.org>
        <6f1014cd-f8c5-f935-dcc7-4f5a6b85e473@kernel.org>
        <20230714101028.337fb39a@kernel.org>
        <bb8c6476-283c-3bc6-710b-5a8602ccd40e@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sat, 15 Jul 2023 12:31:02 +0200 Linux regression tracking (Thorsten
Leemhuis) wrote:
> Maintainers must ensure severe problems in their code reported to them
> are resolved in a timely manner: security vulnerabilities, regressions,
> compilation errors, data loss, kernel crashes, and bugs of similar scope.

SG, thanks for the suggestion!

One edit - I'd like to remove "security vulnerabilities" from the list.
Security implications are an axis on which bug can be evaluated, one of
many. All kernel bugs have some security implications. Placing them as
a category like crashes, lockups or compiler errors could deepen the
confusion.

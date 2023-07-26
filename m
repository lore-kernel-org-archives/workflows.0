Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60CC6C0015E
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 16:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbjGZQXQ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 12:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjGZQXP (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 12:23:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D482698
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 09:23:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5EA3B61BAC
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 16:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81387C433C7;
        Wed, 26 Jul 2023 16:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690388593;
        bh=AElnco8jCL1hpSQykjxH2VNrzDAyihUbYuyPeUcjv9g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oyQ3bUvJ7GHPKG/BTY2Szw/fPrkBt4R8k+dpjWZZ/nQp52Dh1Cb9gj7VfHiTy+Zoj
         /IOM5qG459yCzkQiEmn4mlhiMgFkoO+yJmf+NlCIJhU6156Wbx1lkuhxoQq6X5fHzq
         em8FqJ2uc1wQ1aPOUAWR25W7fk/e4CtAPc4le7R0L9Zd8FMHDGR/8krC5Fo99aCWXf
         9mtM+uHOnAyFLWqDvH6hYGI9hmQvOvAD63JHscjZYFcKPrgSPsN1TRpJfATqk+n9Ur
         40v8m08D2Ijrz2a5l3ip9WMZGYQ1DT7pW0Q3valD5alnY7w8JGpovtRIwACvja9yTe
         Ep95yWvX6RJZQ==
Date:   Wed, 26 Jul 2023 09:23:12 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Joe Perches <joe@perches.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from
 using file paths
Message-ID: <20230726092312.799503d6@kernel.org>
In-Reply-To: <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
References: <20230726151515.1650519-1-kuba@kernel.org>
        <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 26 Jul 2023 08:43:30 -0700 Joe Perches wrote:
> > Print a warning when someone tries to use -f and remove
> > the "auto-guessing" of file paths.  
> 
> Nack on that bit.
> My recollection is it's Linus' preferred mechanism.

Let Linus speak for himself, hopefully he's okay with throwing
in the -f.

BTW get_maintainer is central to our ML-based development process.
I think the patches to get_maintainer and checkpatch should flow
to workflows@.

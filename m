Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB6ECA0FE6
	for <workflows@archiver.kernel.org>; Fri,  1 Sep 2023 14:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242406AbjIAOW4 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Sep 2023 10:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237954AbjIAOWz (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 1 Sep 2023 10:22:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 512B010CF;
        Fri,  1 Sep 2023 07:22:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B7570B8255E;
        Fri,  1 Sep 2023 14:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D72CC433C9;
        Fri,  1 Sep 2023 14:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693578168;
        bh=h1/Wzrzar7jmouGn/w0zA/gRRvOV5e0aTKvFAmaZlek=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=imHaNISNraldq/FXvYhvXFmCGrFiF4lQdF6AOK77QFbEaixunDT1VOUoSxjWvi3SX
         XUI+fFYsVQSoCZm49EebTbmvsucNQVBGbZSboPg67t1lpaedApRXkN05UULbQJOcnR
         uLcdPlsfJw52+rWKkg3xlD1jl1JnWKtm3br42LIIFs3Xalfja+4wMmckzL28XSlWHD
         777pehiDKlSm8Y4sdECyMXBRpToWge67x1rUK3AwahpNi1diiBuj4MbwVCnqOsFwzt
         CBPINhiXyJR1w+1EXRtD85lqGhk7CLf8zn0V4lfauu+o7cY4ryrqG5SqESr5VenS0U
         hxcXVYjAJ16+g==
Date:   Fri, 1 Sep 2023 07:22:47 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Sabrina Dubroca <sd@queasysnail.net>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, rdunlap@infradead.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH net v3] docs: netdev: document patchwork patch states
Message-ID: <20230901072247.20f84171@kernel.org>
In-Reply-To: <ZPGjdQOfM2POGoEW@hog>
References: <20230901014131.540821-1-kuba@kernel.org>
        <ZPGjdQOfM2POGoEW@hog>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, 1 Sep 2023 10:40:21 +0200 Sabrina Dubroca wrote:
> > v3:
> >  - clarify that patches once set to Awaiting Upstream will stay there  
> 
> mhmm, the patch looks identical to v2. Did you post the wrong version?

oops, forgot to commit, thanks for catching!

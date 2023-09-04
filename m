Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E23C83F33
	for <workflows@archiver.kernel.org>; Mon,  4 Sep 2023 08:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239683AbjIDIsK (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 4 Sep 2023 04:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234105AbjIDIsK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 4 Sep 2023 04:48:10 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189ED128;
        Mon,  4 Sep 2023 01:48:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7117FCE0E45;
        Mon,  4 Sep 2023 08:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A6459C433CA;
        Mon,  4 Sep 2023 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693817283;
        bh=jZFQQ/bZTC4QoTNj1R2NJ9O3+BqJ99m6FyLX06q8aw0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Vq0YZ+cWH0y+Cfxch0u65b9qRqp1w9SMKTZZosDzjonxTgihmLLo8KtoyC1S+t+W9
         xW1GiNVH0oStCOMUMxWgrhuSslHsh1M7saFvCTurh5uyiPB9caaPI9u/Ujjt8biO8B
         dQ7plU6yH6hrsUjjsqqyui8s0dQ2EtO4E/tUS4wrGxx5Xz6CQxrEpNgIHw1XWVhTJV
         Pcm7lUZCLPDksFFsVynuWjheRHVyDC4InZ4bG+HHittVunzr8E793xfWIOZsq/Ah+P
         36Ruuf39XphMWD9AkbpusgY91K4fYHLPyRAxGBboVkmBRLuNXgAOiIEaj3kOBDwwL7
         IKcdHgfJpgkBw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 90677C04DD9;
        Mon,  4 Sep 2023 08:48:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4] docs: netdev: document patchwork patch states
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169381728358.19158.3513881891823330714.git-patchwork-notify@kernel.org>
Date:   Mon, 04 Sep 2023 08:48:03 +0000
References: <20230901142406.586042-1-kuba@kernel.org>
In-Reply-To: <20230901142406.586042-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, rdunlap@infradead.org,
        laurent.pinchart@ideasonboard.com, sd@queasysnail.net
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri,  1 Sep 2023 07:24:05 -0700 you wrote:
> The patchwork states are largely self-explanatory but small
> ambiguities may still come up. Document how we interpret
> the states in networking.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> v4:
>  - clarify that patches once set to Awaiting Upstream will stay there
> v3: no change
> v2: https://lore.kernel.org/all/20230830220659.170911-1-kuba@kernel.org/
>  - add a sentence about New vs Under Review
>  - s/maintainer/export/ for Needs ACK
>  - fix indent
> v1: https://lore.kernel.org/all/20230828184447.2142383-1-kuba@kernel.org/
> 
> [...]

Here is the summary with links:
  - [net,v4] docs: netdev: document patchwork patch states
    https://git.kernel.org/netdev/net/c/ee8ab74aa0c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



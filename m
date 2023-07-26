Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E19AC001DC
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 20:03:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229824AbjGZUDX (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 16:03:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjGZUDW (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 16:03:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD471BF6
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 13:03:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A7E0161CB6
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 20:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C391FC433C7;
        Wed, 26 Jul 2023 20:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690401800;
        bh=VVHwf66l8pA8JawgRvoE5WwcQKi+dmka5tHGRFwa1yM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=g4VLiRDbwRTE5D2e1ZygoQiGkE8aYuemRt7GSFATpoPylmzCZfpY2no7d0ZUQMHNs
         N71VGPvICfZlDKrE39yYTBOtSM3VGOaXSUI03WSpSuzPSZif9JSiv2e2uHjghWL2Zw
         FuUXdFse777NtJz7vG4YPIdHKFpsl2KdUh1zm4B3mHtg0H43Xj7GIh86F/fo+XtBpA
         x4pySstbazZktAxEVTUAIxYTs1xXtC52MEPOZvjiGz8zB25v8r23Wb31jnYRU2kzYv
         SOxIvb5TfcsRfbjSm1W6eIYBr6OcxYI5XO/yy5v1ZDHZBHGDzRIKo+yXcvdG3RNmK9
         ow4ALY8QeqZKg==
Date:   Wed, 26 Jul 2023 13:03:18 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from
 using file paths
Message-ID: <20230726130318.099f96fc@kernel.org>
In-Reply-To: <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
References: <20230726151515.1650519-1-kuba@kernel.org>
        <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
        <20230726092312.799503d6@kernel.org>
        <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
        <20230726112031.61bd0c62@kernel.org>
        <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
        <20230726114817.1bd52d48@kernel.org>
        <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
        <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
        <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 26 Jul 2023 12:37:14 -0700 Linus Torvalds wrote:
> The very first case I actually looked at wasn't even some
> "inexperienced developer" - the kind you claim is the problem, and the
> kind you claim this would help.
> 
> It was a random fix from Florian Westphal, who has been around for
> more than a decade, is credited with over 1500 commits (and mentioned
> in many many more), and knows what he's doing.
> 
> He has a patch that references a "Fixes:" line, and clearly didn't go
> through the get_maintainer script as such, and the
> netdev/cc_maintainers script complains as a result.

Florian is sending us patches from his tree which have already been
reviewed on the netfilter mailing list. It's basically a PR.
There's a handful of people who do that and I don't care enough to
silence it because ignoring the false positives is a noop.

When some noob sends a patch which actually *should* have been CCed
to more people I need to either go and CC that person in myself.
Or tell the noob to repost.

IOW solving the _actually_ missing CCs is higher priority for me.

> So Jakub, I think you are barking *entirely* up the wrong tree.
> 
> The reason you blame this on mis-use by inexperienced maintainers is
> that you probably never even react to the experienced ones that do the
> very same things, because you trust them and never bother to tell them
> "you didn't use get_maintainers to get the precise list of people that
> patchwork complains about".
> 
> So the problem is not in get_maintainers. It's in having expectations
> that are simply not realistic.
> 
> You seem to think that those inexperienced developers should do something that
> 
>  (a) experienced developers don't do *EITHER*
> 
>  (b) the scripts complain about instead of just doing
> 
> and then you think that changing get_maintainers would somehow hide the issue.
> 
> You definitely shouldn't require inexperienced developers to do
> something that clearly experienced people then don't do.
> 
> Now, maybe I happened to just randomly pick a patchwork entry that was
> very unusual. But I doubt it.

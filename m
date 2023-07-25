Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B40C0015E
	for <workflows@archiver.kernel.org>; Tue, 25 Jul 2023 16:57:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjGYQ5v (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 25 Jul 2023 12:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231665AbjGYQ5v (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 25 Jul 2023 12:57:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D27AE3
        for <workflows@vger.kernel.org>; Tue, 25 Jul 2023 09:57:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 11A91617EF
        for <workflows@vger.kernel.org>; Tue, 25 Jul 2023 16:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C1CC433C8;
        Tue, 25 Jul 2023 16:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690304269;
        bh=xKzii9Y3wXY0xeuIVkRtPbTVcYf7KRfwTosUVm60whs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=VlJhakcz4b/DMDr9bYwDfPp/BMnco0Owjy3mDGJMTanVw87DT4PzEOJcCEOBu+XgV
         9LdwFAteInewwBg0HMYirxY49+W7b+ZXJtcFfRlyHmvBxg/l+bBSNi/I0JNfkEV/om
         nJYFyCSWrX4Pepfk5FbKqHYXv60Cy8lBqueqcUJwmh3sM2vSpGsRVarXEXu4axp6Mm
         veuFV4pNJ/2V7AtoWLYA6SaC+9pQ3zmZOYoNwqAs3YX5Yz06sM3paDqb7wUrDpk0zj
         FBGtT2RrUmxjQa8hN3l6xK09DR5bExUxUjTNhO1MmQKM41rY2LvZ3lUcaxk/JESMqX
         xeT5MHAAmDsSQ==
Message-ID: <22eb89c5-9c94-6498-4079-b3b732aacfe0@kernel.org>
Date:   Tue, 25 Jul 2023 18:57:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] scripts: checkpatch: steer people away from using file
 paths
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     joe@perches.com, geert@linux-m68k.org, netdev@vger.kernel.org,
        workflows@vger.kernel.org, mario.limonciello@amd.com
References: <b6ab3c25-eab8-5573-f6e5-8415222439cd@kernel.org>
 <20230725155926.2775416-1-kuba@kernel.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230725155926.2775416-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 25/07/2023 17:59, Jakub Kicinski wrote:
> We repeatedly see noobs misuse get_maintainer by running it on
> the file paths rather than the patchfile. This leads to authors
> of changes (quoted commits and commits under Fixes) not getting
> CCed. These are usually the best reviewers!
> 
> The file option should really not be used by noobs, unless
> they are just trying to find a maintainer to manually contact.
> 
> Print a warning when someone tries to use -f and remove
> the "auto-guessing" of file paths.
> 
> This script may break people's "scripts on top of get_maintainer"
> if they are using -f... but that's the point.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> This is what I had in mind.

"Anything that can go wrong will go wrong."
https://en.wikipedia.org/wiki/Murphy%27s_law

Therefore:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


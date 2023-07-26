Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47235C001DC
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 18:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbjGZSUf (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 14:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjGZSUf (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 14:20:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C1F100
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 11:20:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A158F61C3A
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 18:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2902C433C7;
        Wed, 26 Jul 2023 18:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690395633;
        bh=/XB7GSiYnWWBndJ8o+2CPxc3xzBL7SaoJwKNVSXs+bg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=R2GteAwwrl9iYxOfk9upIwOHyDQ1Ql91aiJvZKe2udtztUFPbnFhIGLztawwXwkgC
         U+T65Mc6dHcSNCN8Vlf1GEnGDFbZuGBFE4SEvTlZfh6vd7cUKomQHx8/iprJ23UInM
         q4q8jPywTAItrRwQMVKHVv5zE01re3gvmdjOktZoAFKkpyULAbVO+98sNuNSi9ShLN
         JFPRzOPe2Q6T8T1IGxMFtDCm7GbuKaAy4NcHP8Wi5BDNRYQMn43CHQpTnN7IKL/GkD
         wAi0nkztJzqvP14xYfqM2cbz56ROsAVYIXOZDB0zS2booNDYkHOuMBnmSpe2LLJYKu
         kO2Ut/6bTz+lA==
Date:   Wed, 26 Jul 2023 11:20:31 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from
 using file paths
Message-ID: <20230726112031.61bd0c62@kernel.org>
In-Reply-To: <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
References: <20230726151515.1650519-1-kuba@kernel.org>
        <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
        <20230726092312.799503d6@kernel.org>
        <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 26 Jul 2023 09:45:25 -0700 Linus Torvalds wrote:
> On Wed, 26 Jul 2023 at 09:23, Jakub Kicinski <kuba@kernel.org> wrote:
> > > Nack on that bit.
> > > My recollection is it's Linus' preferred mechanism.  
> >
> > Let Linus speak for himself, hopefully he's okay with throwing
> > in the -f.  
> 
> It's not the '-f' that would be the problem - that's how the script
> used to work long ago, and I still occasionally end up adding the -f
> by habit.
> 
> So removing the auto-guessing of file paths wouldn't be a problem.
> 
> But the annoying warning is wrong.
> 
> I use get_maintainers all the time, and I *only* use it for file
> paths. If I know the commit, I get the list of people from the commit
> itself, so why should I *ever* use that script if I have a patch?

You are special, you presumably use it to find who to report
regressions to, and who to pull into conversations.

This tool is primarily used by _developers_ to find _maintainers_.
I mean *thousands* of developers use it every release to send their
patches.

The tool needs to see the commit message to fish out Fixes tags.

> So the whole "use of get_maintainers is only for patches, and we
> should warn about file paths" is insane.

Hrmpf, hrmpf.

> No. If I get that patch, I will remove the warning. The *only* reason
> for me to ever use that script is for the file path lookup.
> 
>              Linus


Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C5BC0015E
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 18:48:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231825AbjGZSsV (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 14:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232076AbjGZSsU (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 14:48:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B92942709
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 11:48:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 24BDB61C00
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 18:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4953EC433C7;
        Wed, 26 Jul 2023 18:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690397298;
        bh=kEN47qLcvSl+2RGDErUZd6Gs7ZP2H8X9MFxpFdAaNNY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=k++zZlJMi3Q64vFadKV61Lz65nP5CmZ8AgIaQYbV+a+nhf3m/ok0vzkBshU2wKF1Z
         /g9qZAj8bQrlAOgj39Ln2+FDDk5uHyZXfXagkjqE9JTXxDs8LKDVWs/+4kEFKMOEB8
         KMlcBss0B85Q8X+AAVlBVvVpavgWRbEIiygrB/dd7QTGemqeIVfHC5w6WmaR0Wxlsr
         UX9P4C+pCrg1+caWhRgh+GOloJHQikoRAFNS2J46dAWzY66fZ1HowTIB1YnFvnfZcN
         +C+6YHPoi3EkDclccm5f9XzeZfO+aFwTBFCwz7VtZE6AwgZPKO/YQwSFbyp6TsXE9P
         39U3HPqOe1cWg==
Date:   Wed, 26 Jul 2023 11:48:17 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from
 using file paths
Message-ID: <20230726114817.1bd52d48@kernel.org>
In-Reply-To: <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
References: <20230726151515.1650519-1-kuba@kernel.org>
        <11ec5b3819ff17c7013348b766eab571eee5ca96.camel@perches.com>
        <20230726092312.799503d6@kernel.org>
        <CAHk-=wjEj2fGiaQXrYUZu65EPdgbGEAEMzch8LTtiUp6UveRCw@mail.gmail.com>
        <20230726112031.61bd0c62@kernel.org>
        <CAHk-=wi9MyyWmP_HAddLrmGfdANkut6_2f9hzv9HcyTBvg3+kA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 26 Jul 2023 11:29:44 -0700 Linus Torvalds wrote:
> On Wed, 26 Jul 2023 at 11:20, Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > You are special,  
> 
> So my mother tells me.
> 
> > you presumably use it to find who to report
> > regressions to, and who to pull into conversations.  
> 
> Yes. So what happens is that I get cc'd on bug reports for various
> issues, and particularly for oops reports I basically have a function
> name to grep for (maybe a pathname if it went through the full
> decoding).
> 
> I'm NOT interested in having to either remember all people off-hand,
> or going through the MAINTAINERS file by hand.
> 
> > This tool is primarily used by _developers_ to find _maintainers_.  
> 
> Well, maybe.
> 
> But even if that is true, I don't see why you hate the pathname thing
> even for that case. I bet developers use it for that exact same
> reason, ie they are modifying a file, and they go "I want to know who
> the maintainer for this file is".

I don't hate the file path, I say as much in the commit msg:

  The file option should really not be used by inexperienced developers,
  unless they are just trying to find a maintainer to manually contact.

I'd love to make it easier to use for people who know what they're
doing. Maybe check for a magic file in the tree, listed in .gitignore?
Feels dirty. Create a separate script "blame_maintainer.sh" which just
calls get_maintainer but tosses in --silence-file-warning -f ?

> I do not understand why you think a patch is somehow magically more
> important or relevant than a filename.

Judging by traffic on the ML vast majority of the submissions are
patches, not random reach outs and conversations. That's why patches
are more important.

We get at least one fix a week where author adds a Fixes tag
but somehow magically didn't CC the author of that commit.
When we ask they usually reply with "but I run get_maintainer -f,
isn't that what I'm supposed to do?".

Then there's people who only run -f on the path where most of 
the changes are, not all the paths.

Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF2AC0015E
	for <workflows@archiver.kernel.org>; Wed, 26 Jul 2023 20:36:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjGZUgw (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 16:36:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjGZUgv (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 16:36:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E52211C
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 13:36:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A81A61C50
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 20:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F20C433C8;
        Wed, 26 Jul 2023 20:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690403809;
        bh=P+z1ai9L/8DqCyjjGblxecqfSTi2k0L3ebpLlrfSYUE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gCPqwQ2WybGDUNyDcK5vsvV6yrA9vrqwCGMaRcZriaqORCXMD/Zw/DuI49DPmoVM1
         U33/2x18i39hdYToqmIgT0RwbG8UIRZB3+dIYUoc+/kxxGOrSueDet/Fr0Bf958z7V
         JtXVxLPz/jNsE4acR+wQtMWU21A1hvAHvzzBkPG5cnEn38deYXEiUBu8oaEGde9NjM
         ve09mw8HGdjRsPwLCIgY136sKHuaQiwGYwtsdXICPSVJspHE6SzDH5sTDrYg+qMKx2
         tjexY33eNiIfxX7CUpVgi1AnW73Mg/vbKAT12htPzFm/5YkoC9nPV46vCvtmBjx1qQ
         tEcJmKqCf2BFA==
Date:   Wed, 26 Jul 2023 13:36:48 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from
 using file paths
Message-ID: <20230726133648.54277d76@kernel.org>
In-Reply-To: <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
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
        <20230726130318.099f96fc@kernel.org>
        <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 26 Jul 2023 13:13:11 -0700 Linus Torvalds wrote:
> On Wed, 26 Jul 2023 at 13:03, Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > IOW solving the _actually_ missing CCs is higher priority for me.  
> 
> You have the script. It's already being run. Use it.
> 
> Having scripting that complains about missing Cc's, even *lists* them,
> and then requires a human to do something about it - that's stupid.

Just so I fully understand what you're saying - what do you expect me
to do? Send the developer a notifications saying "please repost" with
this CC list? How is that preferable to making them do it right the
first time?!

The script in patchwork *just runs get_maintainer on the patch*:

https://github.com/kuba-moo/nipa/blob/master/tests/patch/cc_maintainers/test.py#L58

And developers also *already* *run* get_maintainer, they just need to 
be nudged to prefer running it on the patch rather than on the path.

And no, Joe's position that this is "just a documentation problem"
does not survive crash with reality because we already documented:

Documentation/process/submitting-patches.rst:

  scripts/get_maintainer.pl can be very useful at this step (pass paths
  to your patches as arguments to scripts/get_maintainer.pl).

Documentation/process/3.Early-stage.rst:

 If passed a patch on the command line, it will list the maintainers
 who should probably receive copies of the patch.  This is the
 preferred way (unlike "-f" option) to get the list of people to Cc for
 your patches.

> Why are you using computers and automation in the first place, if said
> automation then just makes for more work?

Writing and maintaining that automation is also damn work. We complain
nobody wants to be a maintainer and then refuse to make maintainers'
life's easier :|

> Then requiring inexperienced developers to do those extra things,
> knowing - and not caring - that the experienced ones won't even
> bother, that goes from stupid to actively malicious.
> 
> And then asking me to change my workflow because I use a different
> script that does exactly what I want - that takes "stupid and
> malicious" to something where I will just ignore you.
> 
> In other words: those changes to get_maintainer are simply not going to happen.
> 
> Fix your own scripts, and fix your bad workflows.
> 
> Your bad workflow not only makes it harder for new people to get
> involved, they apparently waste your *own* time so much that you are
> upset about it all.
> 
> Don't shoot yourself in the foot - and if you insist on doing so,
> don't ask *others* to join you in your self-destructive tendencies.

No idea what you mean by "my workflow". But yeah, I kind of expected
that this patch would be a waste of time. Certain problems only become
clear with sufficient volume of patches, and I'm clearly incapable
of explaining shit.

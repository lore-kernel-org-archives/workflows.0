Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF613C001DE
	for <workflows@archiver.kernel.org>; Fri, 28 Jul 2023 20:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjG1UiY (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 28 Jul 2023 16:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjG1UiX (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 28 Jul 2023 16:38:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E501749F6
        for <workflows@vger.kernel.org>; Fri, 28 Jul 2023 13:38:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5F404621FE
        for <workflows@vger.kernel.org>; Fri, 28 Jul 2023 20:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68354C433C7;
        Fri, 28 Jul 2023 20:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690576682;
        bh=4nF+GP/Kww3rrhobqvwb8YD0LYwhm6uL18hfYnDTXT0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ah9t1Av/+mrp9gz1vavMwieu6GWj+odnnwWbwg/P7esq2m0PiEALIV3v4oy/NZPX6
         9nQOXW8PXV15h69bAeaUIMICisxJhmGZP1tsZQ70IJtiJmcrCgp1bd2QDFk0ONDkAg
         r6RIJ51vqQOML552wSayvC+G5SHL2HglyG6x84p20SqNYDLWhlvdf5VjWL55ThNiiJ
         ruiP8llW5slhOEGNk03v+6+a33qgLqXEiu7q9hJslR2q88Z2GqPVeQgvLh0vtseP5f
         my3nmvWFYPGKz951gEL+GgQtOlWqqZHJeIzwp7XkvP/Ht8MjFz27tMNPJrnVB6pc3M
         LITpPFePLC06Q==
Date:   Fri, 28 Jul 2023 13:38:01 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from
 using file paths
Message-ID: <20230728133801.7d42dcf7@kernel.org>
In-Reply-To: <20230728-egotism-icing-3d0bd0@meerkat>
References: <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
        <20230726130318.099f96fc@kernel.org>
        <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
        <20230726133648.54277d76@kernel.org>
        <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
        <20230726145721.52a20cb7@kernel.org>
        <20230726-june-mocha-ad6809@meerkat>
        <20230726171123.0d573f7c@kernel.org>
        <20230726-armless-ungodly-a3242f@meerkat>
        <1b96e465-0922-4c02-b770-4b1f27bebeb8@lunn.ch>
        <20230728-egotism-icing-3d0bd0@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, 28 Jul 2023 16:29:13 -0400 Konstantin Ryabitsev wrote:
> I have actually solved a similar problem already as part of a different
> project (bugbot). We associate a set of additional addresses with a thread and
> can send any thread updates to those addresses.
> 
> It would require a bit more effort to adapt it so we properly handle bounces,
> but effectively this does what you're asking about -- replies sent to a thread
> will be sent out to all addresses we've associated with that thread (via
> get_maintainer.pl). In a sense, this will create a miniature pseudo-mailing
> list per each thread with its own set of subscribers.
> 
> I just need to make sure this doesn't fall over once we are hitting
> LKML-levels of activity.

How does that square with the "subscribe by path / keyword" concept?
If we can do deep magic of this sort can we also use it to SMTP to
people what they wanted to subscribe to rather than expose it as
POP/IMAP/NNTP?

Could be easier for people to do dedup and alike if subscriptions were
flowing into their usual inbox.

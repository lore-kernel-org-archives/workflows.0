Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18138C001DE
	for <workflows@archiver.kernel.org>; Thu, 27 Jul 2023 00:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjG0A2E (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Jul 2023 20:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbjG0A2B (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Jul 2023 20:28:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC5C10CB
        for <workflows@vger.kernel.org>; Wed, 26 Jul 2023 17:28:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D09AB61CDB
        for <workflows@vger.kernel.org>; Thu, 27 Jul 2023 00:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE878C433C8;
        Thu, 27 Jul 2023 00:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690417679;
        bh=/ja/niSzKsJ+AK8DqyH6CXzmsKiY8kc2m8MtEeGp0xs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SOKlIpfkAbqxWBRF8F4VLb8tOzlZkVF4c0NYrYWW3/gGHXa+Ja7lu6aXFH7+/SE9K
         wV+/LA4g+S7t4hfq7c4IXdW3mFzhNgHUvBMiV5iqvMlPu2TbbZm/+zZjl0EZ0QJe4J
         isFR2xeEZt/NgDNdgMZPmb4nJD3hwIDdP6hYaL9RqkZ0qBzdwiGOAXahfyhTHhhpcv
         x1EzVTg9zWhRgwWRWJbgSdpBkwcGsiWiUmpDi+a6ex9KDit4l9DTlo8qniIgujBm/F
         wAEsgcgVSyzzayFDVymBigntBK24rxRAcrOywK5nHqVk68K3F4AN2RMMUqPXpN/MFn
         ZAP7Nn+jZWY5A==
Date:   Wed, 26 Jul 2023 17:27:58 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        netdev@vger.kernel.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH v2] scripts: get_maintainer: steer people away from
 using file paths
Message-ID: <20230726172758.3f6462f3@kernel.org>
In-Reply-To: <20230726-armless-ungodly-a3242f@meerkat>
References: <CAHk-=wiuR7_A=PbN8jhmqGPJQHypUHR+W4-UuSVhOVWvYXs1Tg@mail.gmail.com>
        <CAHk-=wh4pbrNZGqfV9u1urZr3Xjci=UV-MP+KneB6a5yo7-VOQ@mail.gmail.com>
        <CAHk-=whCE9cWmTXu54WFQ7x-aH8n=dhCux2h49=pYN=14ybkxg@mail.gmail.com>
        <20230726130318.099f96fc@kernel.org>
        <CAHk-=wjfC4tFnOC0Lk_GcU4buf+X-Jv965pWg+kMRkDb6hX6mw@mail.gmail.com>
        <20230726133648.54277d76@kernel.org>
        <CAHk-=whZHcergYrraQGgazmOGMbuPsDfRMBXjFLo1aEQPqH2xQ@mail.gmail.com>
        <20230726145721.52a20cb7@kernel.org>
        <20230726-june-mocha-ad6809@meerkat>
        <20230726171123.0d573f7c@kernel.org>
        <20230726-armless-ungodly-a3242f@meerkat>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, 26 Jul 2023 20:24:06 -0400 Konstantin Ryabitsev wrote:
> On Wed, Jul 26, 2023 at 05:11:23PM -0700, Jakub Kicinski wrote:
> > Hm, hm. I wasn't thrilled by the idea of sending people a notification
> > that "you weren't CCed on this patch, here's a link". But depending on
> > your definition of "hitting the feed" it sounds like we may be able to
> > insert the CC into the actual email before it hits lore? That'd be
> > very cool! At least for the lists already migrated from vger to korg?  
> 
> No, inserting their addresses into message headers would invalidate DKIM,
> which is not what we want to do. However, the idea is that they would receive
> the actual patches in the same way they would receive them if they were
> subscribed to a mailing list.

Ugh, right :S

> Think as if instead of being Cc'd on patches, they got Bcc'd on them.

I was being crafty 'cause if the CC is present in the lore archive
our patchwork check would see it :] 
But cant just trust the automation and kill the check, then.

Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB93E743EF
	for <workflows@archiver.kernel.org>; Fri, 29 Sep 2023 07:25:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232663AbjI2HZD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 29 Sep 2023 03:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232694AbjI2HZC (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 29 Sep 2023 03:25:02 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34DEC1A7;
        Fri, 29 Sep 2023 00:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
        s=mail; t=1695972298;
        bh=HpzRRZlXUO8idlHVwHRQ6iQGOBYk+mpAmBjFyjM6mRM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uSAYNFsvtTqI+DwUkO0HJIY9o3MgBjaKb5jrIv/qkeCCLjrzQV1eGlNRXWpMoNBPc
         GxUHZB7WWsfvRoZ2vpFQ0TDOBM7pWX20ceyJ42rMjwYKPgdNCo1rMso7UMfEEwtM//
         o1VXhnIHsv6+29Q68RWQwKlxm+IkwjRjV30LHRmo=
Date:   Fri, 29 Sep 2023 09:24:57 +0200
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: encourage direct notifications
 to reviewers
Message-ID: <f4ce8205-93a6-4ef5-94c0-1fb8d261bcac@t-8ch.de>
References: <20230927-docs-cc-reviewer-v1-1-2af46ceb2d3c@weissschuh.net>
 <ZRVDv2fiFyW2S0z1@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRVDv2fiFyW2S0z1@infradead.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Christoph,

On 2023-09-28 02:13:35-0700, Christoph Hellwig wrote:
> NAK.

That's honestly surprising.

I mentioned this process in various reviews before and nobody
had issues with it so far.

> This does not scale.

Could you elaborate in which way it doesn't scale?

> Please read the mailinglist, that's the whole
> point of having it.

When reviewing things in various subsystem this would require reading
all of LKML, which is impractical.

The goal of this patch was to make life easier for occasional reviewers.
If it negatively impacts the maintainers then that's not gonna work.


Thomas

Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADCFE80A92
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 06:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjI0GOW (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 02:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjI0GOT (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 27 Sep 2023 02:14:19 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5120797;
        Tue, 26 Sep 2023 23:14:18 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F082C433C7;
        Wed, 27 Sep 2023 06:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1695795257;
        bh=WeWvL6mLisH4rUale8MG2ovNzGYHrvb4LTlrdrK2zrA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=p2aKxWWrrYUAKXKw/M6j1OWFr03QifG2SBl6z/xjqbg1jlVgVJNKSj7DHe47eelCa
         OOomLqAztgadAzyQ9cmQ4/vJP5IrazS7RgZUWHHg3mZ64IXZRVWXd0KZ7t3hoLZFBt
         XLNqSuAA/A+VtV0bW0kgxZnnhOy4jj4ig710BW/Y=
Date:   Wed, 27 Sep 2023 08:14:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, workflows@vger.kernel.org,
        mario.limonciello@amd.com
Subject: Re: [PATCH 3/3] get_maintainer: add patch-only pattern matching type
Message-ID: <2023092713-music-democrat-cea3@gregkh>
References: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
 <20230927-get_maintainer_add_d-v1-3-28c207229e72@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927-get_maintainer_add_d-v1-3-28c207229e72@google.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Sep 27, 2023 at 03:19:16AM +0000, Justin Stitt wrote:
> Note that folks really shouldn't be using get_maintainer on tree files
> anyways [1].

That's not true, Linus and I use it on a daily basis this way, it's part
of our normal workflow, AND the workflow of the kernel security team.

So please don't take that valid use-case away from us.

thanks,

greg k-h

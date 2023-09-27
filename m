Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AA9E810A2
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 08:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjI0IVP (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 04:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjI0IVI (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 27 Sep 2023 04:21:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCB0E4;
        Wed, 27 Sep 2023 01:21:06 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79459C433C8;
        Wed, 27 Sep 2023 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1695802866;
        bh=fvYD/R4VnCFPyprkfMPRDUYwlbEFudVoXsX8Jlc8Ihk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ib4vQKUM8OZJszxyMrW1dzUcL3ZNJoyGVb0FOCsrVvmzpIrggSE90uY+xbhAAG+OT
         GRJYxhfYguVbn9p9sFBPlYi+f+9z70W9+NzJ7761koSD0iC8CLuiMLLIEeBAjFd4MB
         fca/yElMVqK3NT2c6H6sStYM46czrzNiQNBCigdA=
Date:   Wed, 27 Sep 2023 10:21:02 +0200
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
Message-ID: <2023092709-diminish-antelope-a803@gregkh>
References: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
 <20230927-get_maintainer_add_d-v1-3-28c207229e72@google.com>
 <2023092713-music-democrat-cea3@gregkh>
 <CAFhGd8rJ=-SVB2NLhjoHbpHS-3ar0g0qT0LY4YTakp8eD83s7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFhGd8rJ=-SVB2NLhjoHbpHS-3ar0g0qT0LY4YTakp8eD83s7Q@mail.gmail.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Sep 27, 2023 at 03:46:30PM +0900, Justin Stitt wrote:
> On Wed, Sep 27, 2023 at 3:14 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Sep 27, 2023 at 03:19:16AM +0000, Justin Stitt wrote:
> > > Note that folks really shouldn't be using get_maintainer on tree files
> > > anyways [1].
> >
> > That's not true, Linus and I use it on a daily basis this way, it's part
> > of our normal workflow, AND the workflow of the kernel security team.
> >
> > So please don't take that valid use-case away from us.
> 
> Fair. I'm on the side of keeping the "K:'' behavior the way it is and
> that's why I'm proposing adding "D:" to provide a more granular
> content matching type operating strictly on patches. It's purely
> opt-in.
> 
> The patch I linked mentioned steering folks away from using
> tree files but not necessarily removing the behavior.

Please don't steer folks away from it, it is a valid use case of the
tool, and I would argue, one of the most important ones given how often
I use it that way.

Hence my objection to this verbage in the changelog, it's not correct.

thanks,

greg k-h

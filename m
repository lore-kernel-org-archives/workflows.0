Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B988C001B1
	for <workflows@archiver.kernel.org>; Mon,  3 Jul 2023 15:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231585AbjGCPBB (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 3 Jul 2023 11:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbjGCPA6 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 3 Jul 2023 11:00:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2937DE4C;
        Mon,  3 Jul 2023 08:00:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B9A9F60DDE;
        Mon,  3 Jul 2023 15:00:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00A4C433C8;
        Mon,  3 Jul 2023 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688396456;
        bh=g15K/7qo5THEcmwNcrIRS7RE0gZsvdpbN6D2FfMKddA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=00FU15bX/mKlfaColAwxm28pVQc7kdodltzkxUQ3yEBGqvSlX/I9sgL/TEhcxmwqX
         PDw4s8BGzEZZv0Tk6dNok96hd3S13tMc2usZ2Z9qec3V76ZzqHXoBgVHQNvsZzzM4F
         h0QP+GFlqo5v+GpD4XwkP+Qmh68EMFXqgy0D8pzA=
Date:   Mon, 3 Jul 2023 17:00:51 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        security@kernel.org, corbet@lwn.net, workflows@vger.kernel.org
Subject: Re: [PATCH 1/2] Documentation: security-bugs.rst: update preferences
 when dealing with the linux-distros group
Message-ID: <2023070323-sloppy-panama-4868@gregkh>
References: <2023063020-throat-pantyhose-f110@gregkh>
 <202306301113.FA8FD533@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306301113.FA8FD533@keescook>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Jun 30, 2023 at 11:14:05AM -0700, Kees Cook wrote:
> On Fri, Jun 30, 2023 at 09:14:20AM +0200, Greg Kroah-Hartman wrote:
> > Because the linux-distros group forces reporters to release information
> > about reported bugs, and they impose arbitrary deadlines in having those
> > bugs fixed despite not actually being kernel developers, the kernel
> > security team recommends not interacting with them at all as this just
> > causes confusion and the early-release of reported security problems.
> > 
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Yeah, this is good. It might make sense to explicitly detail the
> rationale in security-bugs.rst (as you have in the commit log), but
> perhaps that's too much detail.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks for the review.  I'll keep this as-is as it's the content of the
file that matters in the end.

thanks,

greg k-h

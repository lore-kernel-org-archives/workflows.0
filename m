Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B0CDC433FE
	for <workflows@archiver.kernel.org>; Mon,  2 May 2022 15:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385671AbiEBPNf (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 2 May 2022 11:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352318AbiEBPNe (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 2 May 2022 11:13:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8987511A20;
        Mon,  2 May 2022 08:10:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 43129B81047;
        Mon,  2 May 2022 15:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB2DC385AC;
        Mon,  2 May 2022 15:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651504203;
        bh=1RDGYiWyZBH6Vi3qxYM1IjfyxCY9T/y3uWX30lhUTaA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JlhNxiGUN/aUI2exVkpMiE5f4bKU7CldyrKbLnwkQ8DK7Tmpq6YQns+DPwXsQmk1L
         eULFT6Q+PW1eQAg1FaQrBAdi8ftzs9jagq3MCzSznHz/oJGlBOZH3MzDXaRrnTvyZv
         sMujZSWyby0Q/ltjyerC5vzji6YMsjS0DRPs6je/vMd1UYyjZP0+5AiZ6t4COSpltN
         PRYKMD0oObsAhGPVLv7Qx8iosrmIpullIqP8at+c6x48fOrKTgNEtCcDIB7earyy95
         PoMH0vO/lZZLvViY/RBjcYG613/y/84MwK/Mz4EkR8Oyf1j3sASAlyUdriYsxUgq2j
         hoeJPvMcuLoYA==
Date:   Mon, 2 May 2022 08:10:01 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@kernel.org>, torvalds@linux-foundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        Thomas Osterried <thomas@osterried.de>
Subject: Re: Driver graveyard
Message-ID: <20220502081001.6135b370@kernel.org>
In-Reply-To: <87ee1cxb2o.fsf@meer.lwn.net>
References: <20220502071818.5101c752@kernel.org>
        <87ee1cxb2o.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, 02 May 2022 08:29:03 -0600 Jonathan Corbet wrote:
> Jakub Kicinski <kuba@kernel.org> writes:
>
> > Thomas suggested that it may be nice to create some form of a record
> > for drivers which were retired from the tree. I think a code-centric
> > equivalent of CREDITS could be a good idea.
> >
> > Does such a record already exist somewhere? If not any thoughts on
> > creating a file storing (Kconfig, short description, commit which
> > removed the driver)? E.g.
> >
> >
> > K: DMASCC
> > D: Hamradio high-speed (DMA) SCC driver for AX.25. Driver supported
> > D: Ottawa PI/PI2, Paccomm/Gracilis D: PackeTwin, and S5SCC/DMA boards.
> > C: 865e2eb08f51  
> 
> So what is the purpose for this file?  And more to the point, I guess:
> is there a need for it to be strictly machine-readable?  If the
> objective is to remember our history to minimize our chances of
> repeating it, something more prose-oriented might work better.

To be honest I found the existence of the CREDITS file useful when
removing stale MAINTAINERS entries. A move seems less hostile than 
a erasure (using a very broad definition of "move" in case of drivers).
Anything that makes people feel more at ease when I remove their driver
would be helpful.

The only practical (i.e. not armchair-psychology-based) use I can think
of is if someone is about to sit down and write a new driver they may
grep the tree for the name of the HW, and they may find the graveyard
entry. So I think listing the exact HW supported is useful. That said
as I'm writing this I'm reminded how old the hypothetical HW in the
previous sentence likely is.

I used the machine-readable format following CREDITS. I figured CREDITS
serves no practical purpose either today, in hindsight that's a bit
ahistoric.

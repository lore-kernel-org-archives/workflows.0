Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276E3C433EF
	for <workflows@archiver.kernel.org>; Mon,  2 May 2022 14:29:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237408AbiEBOce (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 2 May 2022 10:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385496AbiEBOcd (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 2 May 2022 10:32:33 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA101401C;
        Mon,  2 May 2022 07:29:04 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CC0395CC;
        Mon,  2 May 2022 14:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CC0395CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1651501743; bh=cW4di3yzWgRaJs1v9HhWyMCok/x29iDdApOjqke/9V0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QMFaI669aIpNgCSu+j/HypH+4V2GHmuybz9tw4GKY6ZHM72mDwjNDfkDHZ6MoXvKU
         zTgcWW/dJm8P2X+ytkgyirBBd+aF0zhVd6RnwAsA2aPO1WjSuSRUAZqMo7qavxXRgP
         M/GnfVY2gDW7HasD/NfUSxDEYuK0ae9SSGl6H451Ik5VN041i1EaDu2fv1pZMTEU12
         ylZD+3XZ2NzCx6hjO9oElaAtNzBMOLDlHhj7Cv/BZeIzzzjfZiL6kCsruFQZ/is0db
         nhhG+dliUuGCjW99CET13p/DFMoQd0jbuLyR1hALVGE8mj3QliuIFVzE7CSjVKY/Vw
         6/+hrQa5SqqWw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakub Kicinski <kuba@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@kernel.org>, torvalds@linux-foundation.org
Cc:     workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        Thomas Osterried <thomas@osterried.de>
Subject: Re: Driver graveyard
In-Reply-To: <20220502071818.5101c752@kernel.org>
References: <20220502071818.5101c752@kernel.org>
Date:   Mon, 02 May 2022 08:29:03 -0600
Message-ID: <87ee1cxb2o.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> Hi!
>
> Thomas suggested that it may be nice to create some form of a record
> for drivers which were retired from the tree. I think a code-centric
> equivalent of CREDITS could be a good idea.
>
> Does such a record already exist somewhere? If not any thoughts on
> creating a file storing (Kconfig, short description, commit which
> removed the driver)? E.g.
>
>
> K: DMASCC
> D: Hamradio high-speed (DMA) SCC driver for AX.25. Driver supported
> D: Ottawa PI/PI2, Paccomm/Gracilis D: PackeTwin, and S5SCC/DMA boards.
> C: 865e2eb08f51

So what is the purpose for this file?  And more to the point, I guess:
is there a need for it to be strictly machine-readable?  If the
objective is to remember our history to minimize our chances of
repeating it, something more prose-oriented might work better.

Thanks,

jon

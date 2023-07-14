Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EE8C001DC
	for <workflows@archiver.kernel.org>; Fri, 14 Jul 2023 03:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbjGNDQq (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 13 Jul 2023 23:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234671AbjGNDQo (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 13 Jul 2023 23:16:44 -0400
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37503269D
        for <workflows@vger.kernel.org>; Thu, 13 Jul 2023 20:16:44 -0700 (PDT)
Received: from cwcc.thunk.org (pool-173-48-82-193.bstnma.fios.verizon.net [173.48.82.193])
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 36E3GOMP025390
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jul 2023 23:16:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
        t=1689304587; bh=3LUnnjT3pGUyMkQArakk9mIcEmwYS0xaw1BgQ8VKDRg=;
        h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
        b=CVWRo4BJTpYkOkyNhrLG0MoY/jorNvWdYP7cusP9KHt9yv9adnylUDp44sPLrU6+A
         qJCrvlOIbnAjta+QKq01aAk9fqJmV1mtMv74WesBIQejUZfwCU2MkgdMB/l0R/nzxF
         e0UfhTibxVtxYLQfAZsT6vG4vFxIfCHafF3WyXJMk8AzvzL64LtrMAfy38y+47HwrF
         yIyE+xGRr+kETCX48C8kAeO2TpWr2CZ38UcpnLnurTa3hGrnVf6Vtq7Dcmul3b5M/T
         vtLbERS262NjluLvP/svl4E86plu2a0zutPNBthtWHzfq3mK9ZImBco736ynOor61O
         sNmyKqrB6bp7A==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
        id BFDEB15C0280; Thu, 13 Jul 2023 23:16:24 -0400 (EDT)
Date:   Thu, 13 Jul 2023 23:16:24 -0400
From:   "Theodore Ts'o" <tytso@mit.edu>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH docs] docs: maintainers: suggest including lore link for
 conflicts known to linux-next
Message-ID: <20230714031624.GA3736130@mit.edu>
References: <20230713230417.1504773-1-kuba@kernel.org>
 <CAHk-=wiyGEZKpb1h=OTYzxaam_g0ek4GKyCPCvVz4fOh+BzCEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiyGEZKpb1h=OTYzxaam_g0ek4GKyCPCvVz4fOh+BzCEA@mail.gmail.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Jul 13, 2023 at 05:47:18PM -0700, Linus Torvalds wrote:
> 
> You can point to the email that Stephen sent (using lore), or you can
> quote his resolution (or your own, if you do a test-merge, like many
> people do) if you want.  It's not a requirement.

Yeah, I normally do my own test merge.  I might check to see if it's
the same as the one which is in linux-next, but the more importantly,
I then run a full set of regression tests and make sure there are no
new test failures caused by the merge resolution.

					- Ted

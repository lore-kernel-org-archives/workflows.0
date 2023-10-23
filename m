Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7861CDB474
	for <workflows@archiver.kernel.org>; Mon, 23 Oct 2023 02:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjJWCbt (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sun, 22 Oct 2023 22:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjJWCbs (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sun, 22 Oct 2023 22:31:48 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5777DD53;
        Sun, 22 Oct 2023 19:31:46 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E472E490;
        Mon, 23 Oct 2023 02:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E472E490
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1698028306; bh=Uw61RBSrWO+kzG/8ysYLw2pSMNLgRXpIrb6BVel9Oww=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZvhDBVoOVqheBDZNUD8Z69j3AEYTCRPUL5xgE9tGqzJTMsCF8GSavgFPMxpXb2i46
         9VUz4ieS223/z2pSabl54fY/eiW9k+koODKyiDuqUcVGadNVBdXF7Ksz7WQ0X3eZJQ
         RUthLMM6Nr4EvGeLHke9UgmCsBUpskhVfvn/A654B+TPhiRF+jE5YrIj7E9BatD5sM
         Yo+vY0Ass9BwO3M8siYQtWkEIG2tEM9vfhp62qvPy8Za854K4aMvGTf4TccNVy94K/
         4t7/4iXBlpjdTAD7TGxxt0+6L9sWv/xeKJn4xNiV1yp9XRUS9phdOtbLBnPf4ykhgC
         sqOvUpyefts/A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Willy Tarreau <w@1wt.eu>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>,
        security@kernel.org, workflows@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Solar Designer <solar@openwall.com>,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH] Documentation: security-bugs.rst: linux-distros relaxed
 their rules
In-Reply-To: <20231015130959.26242-1-w@1wt.eu>
References: <20231015130959.26242-1-w@1wt.eu>
Date:   Sun, 22 Oct 2023 20:31:45 -0600
Message-ID: <87zg0ajcha.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Willy Tarreau <w@1wt.eu> writes:

> The linux-distros list relaxed their rules to try to adapt better to
> how the Linux kernel works. Let's update the Coordination part to
> explain why and when to contact them or not to and how to avoid trouble
> in the future.
>
> Link: https://www.openwall.com/lists/oss-security/2023/09/08/4
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Solar Designer <solar@openwall.com>
> Cc: Vegard Nossum <vegard.nossum@oracle.com>
> Acked-by: Jiri Kosina <jkosina@suse.cz>
> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>
> This is the final version for merging. Changes since RFC:
>   - s/BEFORE/UNTIL from Vegard
>   - improved wording from Alexander
>   - acked-by from Jiri

Greg, you've taken changes to this file in the past; do you want to grab
this one or should I pick it up?

Thanks,

jon

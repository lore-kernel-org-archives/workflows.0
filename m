Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD56C001B0
	for <workflows@archiver.kernel.org>; Fri, 14 Jul 2023 18:19:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236774AbjGNSTG (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 14 Jul 2023 14:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236739AbjGNSTD (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 14 Jul 2023 14:19:03 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1CF11BD;
        Fri, 14 Jul 2023 11:19:02 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 669CA5BF;
        Fri, 14 Jul 2023 18:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 669CA5BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689358742; bh=kKXWA+c2Cm/Sw1VCTU1wLREs010/IyM3OtFfP0eC0lc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=otSdXOsZUpCOtpqFHl615W5pfjTrD/1DfP4VQa7iLzHprdJvvZZ6lfyDA0VHM68Za
         xTd4HNpMWsioqpUCTwBC5E5Np5pd5DW5n1YrTlfUBkz03+pbuZ1FcQY+/biRpxumtz
         HMNM58WSKaP4EKoqIgBYCgThpGiK61mokZ6FlE38kmOHY27CU6MzdgQ1HX+gv6TMM8
         eg8pVaAqw6M54TjWyDrot6dvdV8Gp4IYmhr6Ozf6yOXM6M4p6hm9IcXuu5nwZJdMI/
         WNaoZ27O/Ue8/WfCwTxJ925b4Ae3PLeMFFsHEDNB1J7SzheH21YKfAtgo0ly2Pj8iM
         7O1wyA8hfvdeQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH docs] docs: maintainers: mention tag -s for signed tags
In-Reply-To: <20230713230606.1505458-1-kuba@kernel.org>
References: <20230713230606.1505458-1-kuba@kernel.org>
Date:   Fri, 14 Jul 2023 12:19:01 -0600
Message-ID: <87jzv21hm2.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> The documentation talks about -u and how to configure the default
> key. It does not mention that once the default key is set one
> should use the -s flag. Which is likely what most people end up
> using.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  Documentation/maintainer/configure-git.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/maintainer/configure-git.rst b/Documentation/maintainer/configure-git.rst
> index ec0ddfb9cdd3..a054de0c50dc 100644
> --- a/Documentation/maintainer/configure-git.rst
> +++ b/Documentation/maintainer/configure-git.rst
> @@ -7,9 +7,10 @@ This chapter describes maintainer level git configuration.
>  
>  Tagged branches used in :ref:`Documentation/maintainer/pull-requests.rst
>  <pullrequests>` should be signed with the developers public GPG key. Signed
> -tags can be created by passing the ``-u`` flag to ``git tag``. However,
> -since you would *usually* use the same key for the same project, you can
> -set it once with
> +tags can be created by passing ``-u <key-id>`` to ``git tag``. However,
> +since you would *usually* use the same key for the project, you can
> +set it in the configuration and use the ``-s`` flag. To set the default
> +``key-id`` use
>  ::

Applied, thanks.

jon

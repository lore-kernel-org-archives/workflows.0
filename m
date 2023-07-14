Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD5DC0015E
	for <workflows@archiver.kernel.org>; Fri, 14 Jul 2023 18:33:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236179AbjGNSdA (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 14 Jul 2023 14:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235910AbjGNSc7 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 14 Jul 2023 14:32:59 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB15CC6;
        Fri, 14 Jul 2023 11:32:58 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 670D82DC;
        Fri, 14 Jul 2023 18:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 670D82DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689359578; bh=4IjIrs1NuNwhNKtAS+I2TgTV+5V38m0w2jZr7bn8Xjg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rlxk5C6Zp6EhKs8e3qxRXgAmqOjQk6tu7+jvS5784QXzl1bWhfAcG8KNxgBzRvpAp
         9qAKgvkGngGD2nT9z8RbPlfREqyFn821iffzQ3JPLgGnCyfceTLwo6vqwoKbpyNCpE
         jsDM2LL+B/POBFpIeqaM0smT8UG21tIN7DefFlwVDM35edxZic6iaJKA0R3oZ1+U8c
         L6w37p4h5IPNXrmOh77ofAZydrAeNLubH1jathBqpDxLYmqX87F25UBaa7NygnMrBh
         RBx12I6VRDTikrPpHYv/AbNQoIdVUh3brGdtEomsuRb+96Ytfcs8ABuS/tU0fqqu+/
         HpJJbXrXlTEVw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH docs] docs: maintainers: add missing 's' in https for
 the base lore link
In-Reply-To: <20230713230510.1505201-1-kuba@kernel.org>
References: <20230713230510.1505201-1-kuba@kernel.org>
Date:   Fri, 14 Jul 2023 12:32:57 -0600
Message-ID: <87fs5q1gyu.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> The example and the git hook use HTTPS but the text for some
> reason links to the non-SSL version.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  Documentation/maintainer/configure-git.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/maintainer/configure-git.rst b/Documentation/maintainer/configure-git.rst
> index a054de0c50dc..b731e8b78565 100644
> --- a/Documentation/maintainer/configure-git.rst
> +++ b/Documentation/maintainer/configure-git.rst
> @@ -38,7 +38,7 @@ You may also like to tell ``gpg`` which ``tty`` to use (add to your shell rc fil
>  Creating commit links to lore.kernel.org
>  ----------------------------------------
>  
> -The web site http://lore.kernel.org is meant as a grand archive of all mail
> +The web site https://lore.kernel.org is meant as a grand archive of all mail
>  list traffic concerning or influencing the kernel development. Storing archives

Applied, thanks.

jon

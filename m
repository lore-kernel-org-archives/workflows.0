Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DB9EB64DD
	for <workflows@archiver.kernel.org>; Tue, 18 Jul 2023 17:25:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbjGRRZ6 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 18 Jul 2023 13:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232235AbjGRRZ5 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 18 Jul 2023 13:25:57 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBCCA10CB;
        Tue, 18 Jul 2023 10:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=FovgKUTGpm6tXObmTmcd/1kMqMzEO6PvlbruapMG9ag=; b=rDWTViwFkSwGVXh3/EvCigz/me
        7TQA/jViEcKAmkYTwDmdXjDk3SGZTTMJMWQKBgvjue5v7i/JIZQzC21KQAfIzfJchEdRzCD45f13B
        GVm6eOrjBRSnauMQrH12ys9bjrs+lx+p5flbV4Qvhc0l8qM1VkgqhisVO0Ov/ZbCX5Zc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qLnyy-001diZ-4N; Tue, 18 Jul 2023 18:55:28 +0200
Date:   Tue, 18 Jul 2023 18:55:28 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, gregkh@linuxfoundation.org,
        linux@leemhuis.info, broonie@kernel.org, krzk@kernel.org
Subject: Re: [PATCH docs v2] docs: maintainer: document expectations of small
 time maintainers
Message-ID: <25a50453-cbb6-4933-bb2f-79dfd2c76f9d@lunn.ch>
References: <20230718155814.1674087-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718155814.1674087-1-kuba@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

> +Selecting the maintainer
> +========================
> +
> +The previous section described the expectations of the maintainer,
> +this section provides guidance on selecting one and decribes common

s/decribes/describes

> +Maintainers must be human, however, it is not acceptable to add a mailing
> +list or a group email as a maintainer.

I would probably replace however, with therefore. 

> +Removing an inactive maintainer should not be seen as a punitive action.
> +Having an inactive maintainer has a real cost as all developeres have

Too many e's in developeres

Otherwise:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

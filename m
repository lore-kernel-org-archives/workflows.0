Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C38EB64DA
	for <workflows@archiver.kernel.org>; Fri, 30 Jun 2023 17:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232561AbjF3Rvj (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 30 Jun 2023 13:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbjF3Rvg (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 30 Jun 2023 13:51:36 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369632D4A;
        Fri, 30 Jun 2023 10:51:34 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0F1EE5CC;
        Fri, 30 Jun 2023 17:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0F1EE5CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1688147493; bh=EMN+eiSjMgLjxKvDwiKe5nrFjrnNYILvVkKYNIaSjI0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZoM31OkQe1Rowz0t3pu/hROMh4ZpU1u2XaNPcBgSc+qzo52rm7aPc7txhwdJnMCjJ
         ABh+qx8yKRs07HrcI9TYc/8Ip0pTLcvNqUgN1zz2355XTIrANo3zZnLuu50td1cKSG
         duNUMsSFZKBhPb6exJe5Mk+hK3Um0CEeHuFk/L2FLFvC1Rmavfsas7obTbvQ1Q+pi7
         /j21sUJh1EJd5vQO79iZaAmBllVJ3QheH1r4AmeSFQOakjCqS+hqBtKB1XbxcpJlI8
         EtZTg5SJ99UQLoyotkwW0g+ABEvQn6/oJ09SSz8ZBdZ00p9SZ23LM5EgfpnCNxuWhn
         JE6JrOFjBFrpQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     linux-doc@vger.kernel.org, workflows@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH docs] docs: remove the tips on how to submit patches
 from MAINTAINERS
In-Reply-To: <20230630171550.128296-1-kuba@kernel.org>
References: <20230630171550.128296-1-kuba@kernel.org>
Date:   Fri, 30 Jun 2023 11:51:32 -0600
Message-ID: <874jmolty3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> Having "how to submit patches" in MAINTAINTERS seems out of place.
> We have a whole section of documentation about it, duplication
> is harmful and a lot of the text looks really out of date.
>
> Sections 1, 2 and 4 look really, really old and not applicable
> to the modern process.
>
> Section 3 is obvious but also we have build bots now.
>
> Section 5 is a bit outdated (diff -u?!). But I like the part
> about factoring out shared code, so add that to process docs.
>
> Section 6 is unnecessary?
>
> Section 7 is covered by more appropriate docs.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  Documentation/process/6.Followthrough.rst |  7 ++
>  MAINTAINERS                               | 80 +----------------------
>  2 files changed, 9 insertions(+), 78 deletions(-)

This has been discussed in the past, I'm not sure why we've never done
it.  I totally agree, and will happily apply this unless somebody
objects or beats me to it.

Thanks,

jon

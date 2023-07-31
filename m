Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E842C001E0
	for <workflows@archiver.kernel.org>; Mon, 31 Jul 2023 15:53:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231567AbjGaPxw (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 31 Jul 2023 11:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbjGaPxv (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 31 Jul 2023 11:53:51 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0D4197;
        Mon, 31 Jul 2023 08:53:49 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E721B2B0;
        Mon, 31 Jul 2023 15:53:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E721B2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1690818829; bh=0QY6HyvA67YBA+RRCf78/xZwHKCdp8V5uvhfiTxon5k=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=TbBXu4W1XQowc/ukCvezgEJB6vZS6KlL4euv/FyTL37SZLY3sLWl1iA/fdBSLp9wK
         vC0D5aQlc5tthnWnkftnn8+3YMyS85tcKhRUeCJrnj55ViVoa3JQ0jbqGjcUw6RhLg
         AlJZkXLVeNyXbsrlxiL1zNqsa6S1XCpvRa/2HMfUjBdN0m8aUIQP+N1wFkdZ1pLvnR
         FHlSINSLf4PUuVgWEy1g4j9SR0WXRN4SS7yjDZckhcDEINv/Zmr3ZrISC307S6u1p2
         FrsyYPK2EF2Jt75mrtc6VrroEkhD0+T53R0gmAd08Fvaw4qM7gsrMAzv11ytfORjQF
         YpG2ZeFP5VjcA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     SeongJae Park <sj@kernel.org>
Cc:     SeongJae Park <sj@kernel.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Docs/process/changes: Consolidate NFS-utils update
 links
In-Reply-To: <20230728211616.59550-1-sj@kernel.org>
References: <20230728211616.59550-1-sj@kernel.org>
Date:   Mon, 31 Jul 2023 09:53:47 -0600
Message-ID: <87wmygdqlw.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

SeongJae Park <sj@kernel.org> writes:

> Two update links for NFS-utils are in two duplicate sessions.
> Consolidate.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  Documentation/process/changes.rst | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Both patches applied, thanks.

jon

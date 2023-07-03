Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514B4EB64DC
	for <workflows@archiver.kernel.org>; Mon,  3 Jul 2023 14:35:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbjGCOfq (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 3 Jul 2023 10:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjGCOfp (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 3 Jul 2023 10:35:45 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB1594;
        Mon,  3 Jul 2023 07:35:45 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E059A380;
        Mon,  3 Jul 2023 14:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E059A380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1688394945; bh=DK/Zjt0X/wkpOiqYyIxSo3gzv9UFdeyywGWFaQyeNRc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=gWgWeHOKiKkWU/1iTqTOWhcI+uo1108Dt8uwKRIjYigVW1CTVuHKch/7dJ+jbkxMa
         +5gMZ1b19JZ2O0RJD0URsCKA15w4N7gRSSLtj/jNDM8Uh8I668P4Zb9gfkJojINrZP
         +FjPMB2oxnaBAEoqCCMHwxmFl3R/G2KCfj9inIBlmaO15fTQIDbTC7BJVNd0aI8JTd
         ppvMwNbcNE3p1O/UV8u5sTT/7Zomh86IcGUBDeSRF0IJIU2gXrcdaJLodwk8cGL6ja
         +/IoQ6ZfNRw4bFYk8H946RC+d+tLGxigJP6DqIO26L9yXOXHO1mDTqpE7p51TdeuOh
         BPzXvzYQ1WxlA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     linux-doc@vger.kernel.org, workflows@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH docs] docs: remove the tips on how to submit patches
 from MAINTAINERS
In-Reply-To: <20230630171550.128296-1-kuba@kernel.org>
References: <20230630171550.128296-1-kuba@kernel.org>
Date:   Mon, 03 Jul 2023 08:35:44 -0600
Message-ID: <87mt0djc5b.fsf@meer.lwn.net>
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

Applied, thanks.

jon

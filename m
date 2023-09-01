Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7941BCA0FEC
	for <workflows@archiver.kernel.org>; Fri,  1 Sep 2023 21:51:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjIAVv0 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Sep 2023 17:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350862AbjIAVqY (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 1 Sep 2023 17:46:24 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6C5719B6;
        Fri,  1 Sep 2023 14:17:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 39596CE24C2;
        Fri,  1 Sep 2023 21:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1954EC433C8;
        Fri,  1 Sep 2023 21:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693603047;
        bh=Me0Z5gtD3X+vFlIiVu0e2+D0btlRSRW4qCN3xpDjeHE=;
        h=From:To:Cc:Subject:Date:From;
        b=I9gT0CzyxOb4cWviUs4e+rVXO6nuSjRS9HZ2v3AUrZG5VHlUGB3W8yajwuCS5d9Li
         8MNXQAMbA6kgNvE/DryPex7m08UrIwcSLjSVVf8xjGbsdKL/tTWf2GQW0nSE0eJRug
         rfrS7qvYUP1SD4Q2lmbLnMz0MWxOYVi9Rn3NOLfPQ0IbgUbUTkDQwTb0lypnDYSW4k
         ZBw03AsquhIsW5EGLh2/VFv/75J2MMSzjrCBmmhflf8RNHaf/rxQ0NmbljjC9mur2t
         28i9uDmmrplgFTNsRrMJblMDg3vNjTkdKZ3RAlgMvc6G3TSO5bmwHSzOmivNlXOqqn
         OnyoN2DNuX8Pg==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org
Subject: [PATCH net] docs: netdev: update the netdev infra URLs
Date:   Fri,  1 Sep 2023 14:17:18 -0700
Message-ID: <20230901211718.739139-1-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Some corporate proxies block our current NIPA URLs because
they use a free / shady DNS domain. As suggested by Jesse
we got a new DNS entry from Konstantin - netdev.bots.linux.dev,
use it.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: corbet@lwn.net
CC: workflows@vger.kernel.org
CC: linux-doc@vger.kernel.org

CC: intel-wired-lan@lists.osuosl.org

Please LMK if the old URLs pop up somewhere, I may have missed
some place. The old patchwork checks will continue to use the
old address but new ones should link via netdev.bots...
---
 Documentation/process/maintainer-netdev.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index db1b81cfba9b..09dcf6377c27 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -98,7 +98,7 @@ If you aren't subscribed to netdev and/or are simply unsure if
 repository link above for any new networking-related commits.  You may
 also check the following website for the current status:
 
-  https://patchwork.hopto.org/net-next.html
+  https://netdev.bots.linux.dev/net-next.html
 
 The ``net`` tree continues to collect fixes for the vX.Y content, and is
 fed back to Linus at regular (~weekly) intervals.  Meaning that the
@@ -185,7 +185,7 @@ must match the MAINTAINERS entry) and a handful of senior reviewers.
 
 Bot records its activity here:
 
-  https://patchwork.hopto.org/pw-bot.html
+  https://netdev.bots.linux.dev/pw-bot.html
 
 Review timelines
 ~~~~~~~~~~~~~~~~
-- 
2.41.0


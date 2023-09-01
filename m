Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6321CA0FE3
	for <workflows@archiver.kernel.org>; Fri,  1 Sep 2023 01:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239488AbjIABli (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 31 Aug 2023 21:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjIABlh (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 31 Aug 2023 21:41:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F244DE6E;
        Thu, 31 Aug 2023 18:41:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5A0026068A;
        Fri,  1 Sep 2023 01:41:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D52AC433C7;
        Fri,  1 Sep 2023 01:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693532493;
        bh=QGNSZhUE0TcKpqB9TuiQghQywRsl9vXdYfik8Gx8toA=;
        h=From:To:Cc:Subject:Date:From;
        b=HmYQ6buURzjjJARm9cCAv+JjHumeRAsOS8eLxfr0hBn0IuUkoGB+RkKF7fTBg5Wxh
         JPERo4gWP3+0b+ObcXp9oqHlGYo1PoPbYorH8tjSJHdssl/pwjfLqlwfEj0cUkuTPT
         HOc0Kwnrl39lUaVMr2omNpG2tsUpIxsbQ6/5jVES52LGbf+fBlT2ISLhPTKcMJy7Oh
         FUvlNKddUpQDXDoQg5rRRhstXvE1jpdCVIcPqn+VpmC7AuXQvGEA36/J9vIQGDnf9n
         k/oDqY7NIPRg6bm2sofs/Rkb4ZS60TtGJOenpqnE+K5vHSGPX52FzvTsPCgVT2X9PP
         GBl2DDLj2TN6Q==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        rdunlap@infradead.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH net v3] docs: netdev: document patchwork patch states
Date:   Thu, 31 Aug 2023 18:41:29 -0700
Message-ID: <20230901014131.540821-1-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

The patchwork states are largely self-explanatory but small
ambiguities may still come up. Document how we interpret
the states in networking.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v3:
 - clarify that patches once set to Awaiting Upstream will stay there
v2: https://lore.kernel.org/all/20230830220659.170911-1-kuba@kernel.org/
 - add a sentence about New vs Under Review
 - s/maintainer/export/ for Needs ACK
 - fix indent
v1: https://lore.kernel.org/all/20230828184447.2142383-1-kuba@kernel.org/

CC: corbet@lwn.net
CC: workflows@vger.kernel.org
CC: linux-doc@vger.kernel.org

CC: rdunlap@infradead.org
CC: laurent.pinchart@ideasonboard.com
---
 Documentation/process/maintainer-netdev.rst | 29 ++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index c1c732e9748b..b2c082e64c95 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -120,7 +120,34 @@ Status of a patch can be checked by looking at the main patchwork
   https://patchwork.kernel.org/project/netdevbpf/list/
 
 The "State" field will tell you exactly where things are at with your
-patch. Patches are indexed by the ``Message-ID`` header of the emails
+patch:
+
+================== =============================================================
+Patch state        Description
+================== =============================================================
+New, Under review  pending review, patch is in the maintainer’s queue for
+                   review; the two states are used interchangeably (depending on
+                   the exact co-maintainer handling patchwork at the time)
+Accepted           patch was applied to the appropriate networking tree, this is
+                   usually set automatically by the pw-bot
+Needs ACK          waiting for an ack from an area expert or testing
+Changes requested  patch has not passed the review, new revision is expected
+                   with appropriate code and commit message changes
+Rejected           patch has been rejected and new revision is not expected
+Not applicable     patch is expected to be applied outside of the networking
+                   subsystem
+Awaiting upstream  patch should be reviewed and handled by appropriate
+                   sub-maintainer, who will send it on to the networking trees
+Deferred           patch needs to be reposted later, usually due to dependency
+                   or because it was posted for a closed tree
+Superseded         new version of the patch was posted, usually set by the
+                   pw-bot
+RFC                not to be applied, usually not in maintainer’s review queue,
+                   pw-bot can automatically set patches to this state based
+                   on subject tags
+================== =============================================================
+
+Patches are indexed by the ``Message-ID`` header of the emails
 which carried them so if you have trouble finding your patch append
 the value of ``Message-ID`` to the URL above.
 
-- 
2.41.0


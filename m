Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BA7C6FA8F
	for <workflows@archiver.kernel.org>; Wed, 30 Aug 2023 22:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245328AbjH3WMR (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 30 Aug 2023 18:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245332AbjH3WMQ (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 30 Aug 2023 18:12:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1771A4;
        Wed, 30 Aug 2023 15:11:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 495A662351;
        Wed, 30 Aug 2023 22:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260A1C433C9;
        Wed, 30 Aug 2023 22:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693433229;
        bh=iOlG6QCwPEJAv18mUAR+gdYgQ3y/Ze8QpP2zXy4kL3o=;
        h=From:To:Cc:Subject:Date:From;
        b=OSGioPeq7kf+PXKsN9z4re0fo54QSQB74WhbvhWvlQ9x1HR+fMd0ddWlA8zQDRA6X
         kKLqf95hKIZKgoZfEBNc+EuV2GsjbsOOicm323e1xCIg39xa/NnIdCoMlpfxgt0Izw
         FjKy7RpolV5TiAkHKpYnruB1xCWCFyaXfBaQY6mX9RQyxTBbxpA9ZmpDH6M+LnISpL
         NILcX4ZyRnz6+qAWAfmNeus3GNMTU7dsWZ3BzHrNkyFP0RFBqLjA1Xp41iyS9eKOpL
         edDfpkjxispR+CgX2ute1NZKTfZObfkgLMW+vgOGU1O92+kfqy8XEpIihd3ZzdxYre
         Vb+B6gkcZ6y9A==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        rdunlap@infradead.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH net v2] docs: netdev: document patchwork patch states
Date:   Wed, 30 Aug 2023 15:06:58 -0700
Message-ID: <20230830220659.170911-1-kuba@kernel.org>
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
v2:
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


Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C44DCA0FE5
	for <workflows@archiver.kernel.org>; Fri,  1 Sep 2023 14:24:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349972AbjIAOYP (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 1 Sep 2023 10:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349965AbjIAOYP (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 1 Sep 2023 10:24:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D874DCC5;
        Fri,  1 Sep 2023 07:24:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 90C42B82447;
        Fri,  1 Sep 2023 14:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F18C433C7;
        Fri,  1 Sep 2023 14:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693578249;
        bh=OOhCtZIDeEuvCmuQ9P67An3LMk7p9jF2AWqTMjsBM4E=;
        h=From:To:Cc:Subject:Date:From;
        b=f/1h2N+Mji5JYs/Yex9ztPL1SVMjrHxbyeqEQPP91dYKPZBTMOhp/ryQprDvk8pP5
         ayicrV6ZzTDNH5mdZTqsukBseOV74syT3hcoSG2OZm6S5qDg3o7bfHEAA5vH9GIQSh
         bV6wYPgOlGsOrEgdHAqk9PEMnGX21pMdHgVmxmDPJkB3LGI8RledC1Y2tirwMA4nJb
         mQ18z5oEiqohn9wtdPRaS5NX1JR+oXcEEDU1ja7XrYCHM8G/NLbgFcUz0VP1JXAjT8
         9iSl23bUQcIjJobSc1wVvNSHllkkJyrxVVeOq8GFjrs+vtpde0AiCzeSS48v5QfUdZ
         yBN+AgEYNeArA==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        rdunlap@infradead.org, laurent.pinchart@ideasonboard.com,
        sd@queasysnail.net
Subject: [PATCH net v4] docs: netdev: document patchwork patch states
Date:   Fri,  1 Sep 2023 07:24:05 -0700
Message-ID: <20230901142406.586042-1-kuba@kernel.org>
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
v4:
 - clarify that patches once set to Awaiting Upstream will stay there
v3: no change
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
CC: sd@queasysnail.net
---
 Documentation/process/maintainer-netdev.rst | 32 ++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index c1c732e9748b..db1b81cfba9b 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -120,7 +120,37 @@ Status of a patch can be checked by looking at the main patchwork
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
+                   sub-maintainer, who will send it on to the networking trees;
+                   patches set to ``Awaiting upstream`` in netdev's patchwork
+                   will usually remain in this state, whether the sub-maintainer
+                   requested changes, accepted or rejected the patch
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


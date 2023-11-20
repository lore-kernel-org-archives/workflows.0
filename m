Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0B1C2BB3F
	for <workflows@archiver.kernel.org>; Mon, 20 Nov 2023 20:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbjKTUBS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 20 Nov 2023 15:01:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233787AbjKTUBR (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 20 Nov 2023 15:01:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37A7E3
        for <workflows@vger.kernel.org>; Mon, 20 Nov 2023 12:01:12 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2FDC433C8;
        Mon, 20 Nov 2023 20:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700510472;
        bh=xhLK50jLAz04UHazu67omTgum5sysPJRblqRFVwcoQM=;
        h=From:To:Cc:Subject:Date:From;
        b=k5qECeYsVfWze77kgqY/oCQAC1fqRDNultn3l8W2z1cbdec99TBye+DVRcUkhJuJA
         0vP2dfmOjTqCYKFYdUMfngUr3LKDT7iO0xvPAcNZSZk/FkprASJhzqvOOD2VPT9JQ/
         /5IVwLlZfHuFpqGBj1SDVJMDJkNUnSq6gHr5fmPMm1sWq/0Cme2ipthhdB7Ke3Iulb
         x/cvEPsJW91cHAP8KriLIkreYSov0UPTSUvv+xvqzCK2RF6qumRKLo/5GUCk+k7GVv
         5jZuN5qZmIGo1/8fJsQO//3U270ky986bQJSTHia1yzwxqGuhQha44yRpPthEWGFVc
         eqp2dRfCXhTZA==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        andrew@lunn.ch, Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH net] docs: netdev: try to guide people on dealing with silence
Date:   Mon, 20 Nov 2023 12:01:09 -0800
Message-ID: <20231120200109.620392-1-kuba@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

There has been more than a few threads which went idle before
the merge window and now people came back to them and started
asking about next steps.

We currently tell people to be patient and not to repost too
often. Our "not too often", however, is still a few orders of
magnitude faster than other subsystems. Or so I feel after
hearing people talk about review rates at LPC.

Clarify in the doc that if the discussion went idle for a week
on netdev, 95% of the time there's no point waiting longer.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - rephrase the first paragraph
v1: https://lore.kernel.org/all/20231118152232.787e9ea2@kernel.org/

CC: corbet@lwn.net
CC: workflows@vger.kernel.org
CC: linux-doc@vger.kernel.org
---
 Documentation/process/maintainer-netdev.rst | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index 7feacc20835e..84ee60fceef2 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -193,9 +193,23 @@ Review timelines
 Generally speaking, the patches get triaged quickly (in less than
 48h). But be patient, if your patch is active in patchwork (i.e. it's
 listed on the project's patch list) the chances it was missed are close to zero.
-Asking the maintainer for status updates on your
-patch is a good way to ensure your patch is ignored or pushed to the
-bottom of the priority list.
+
+The high volume of development on netdev makes reviewers move on
+from discussions relatively quickly. New comments and replies
+are very unlikely to arrive after a week of silence. If a patch
+is no longer active in patchwork and the thread went idle for more
+than a week - clarify the next steps and/or post the next version.
+
+For RFC postings specifically, if nobody responded in a week - reviewers
+either missed the posting or have no strong opinions. If the code is ready,
+repost as a PATCH.
+
+Emails saying just "ping" or "bump" are considered rude. If you can't figure
+out the status of the patch from patchwork or where the discussion has
+landed - describe your best guess and ask if it's correct. For example::
+
+  I don't understand what the next steps are. Person X seems to be unhappy
+  with A, should I do B and repost the patches?
 
 .. _Changes requested:
 
-- 
2.42.0


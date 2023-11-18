Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E033C5ACB3
	for <workflows@archiver.kernel.org>; Sat, 18 Nov 2023 17:24:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjKRRYU (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 18 Nov 2023 12:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjKRRYU (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 18 Nov 2023 12:24:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3C2D8
        for <workflows@vger.kernel.org>; Sat, 18 Nov 2023 09:24:17 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CC8C433C8;
        Sat, 18 Nov 2023 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700328255;
        bh=62dpH03N4qYBj5fuvCh5GIsG70ZbcO/hYsqFaTMiAv4=;
        h=From:To:Cc:Subject:Date:From;
        b=cC4Vgh/opsJGfm2nMGf9HZtZeW+zRi1ogM9OdcJUNsOilMzzYY36hH+/SsQn8oZfY
         N1mXPnu2S16SWFEwn277dtliEhyWyYpi/CvrNUmEteCp4JnN58ZtLuCDmGR/CX2OT3
         8Uvj8Y1ufhnugI8tlkzdWeQjUYAKpaR01CSuEuVAcedMAEy29tvJiMraSnR7/fmUwA
         GN5c2qb1RbPshpFc9j2PbZwDk3amSw3aY0cW1o+GrXGUGfs4ZC4GxAFXDei8Ikej/m
         mx6c1EObGnc2ZjWhYKa6cfkiOdNs7dgTG4BhWPeaLOwUcY10HLPZ6X3uFhDxby5N0N
         GsCe1aHdisxmg==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        andrew@lunn.ch, Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH net] docs: netdev: try to guide people on dealing with silence
Date:   Sat, 18 Nov 2023 09:24:12 -0800
Message-ID: <20231118172412.202605-1-kuba@kernel.org>
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
CC: corbet@lwn.net
CC: workflows@vger.kernel.org
CC: linux-doc@vger.kernel.org
---
 Documentation/process/maintainer-netdev.rst | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/maintainer-netdev.rst b/Documentation/process/maintainer-netdev.rst
index 7feacc20835e..9debfff3c65e 100644
--- a/Documentation/process/maintainer-netdev.rst
+++ b/Documentation/process/maintainer-netdev.rst
@@ -193,9 +193,22 @@ Review timelines
 Generally speaking, the patches get triaged quickly (in less than
 48h). But be patient, if your patch is active in patchwork (i.e. it's
 listed on the project's patch list) the chances it was missed are close to zero.
-Asking the maintainer for status updates on your
-patch is a good way to ensure your patch is ignored or pushed to the
-bottom of the priority list.
+
+On the other hand, due to the volume of development discussions on netdev
+are very unlikely to be reignited after a week of silence. If patch is
+no longer active in patchwork and the thread went idle for more than
+a week - clarify the next steps and/or post the next version.
+
+For RFC postings specifically, if nobody responded in a week - reviewers
+either missed the posting or have no strong opinions. If the code is ready
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


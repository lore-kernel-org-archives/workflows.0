Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE18C001DF
	for <workflows@archiver.kernel.org>; Thu,  3 Aug 2023 09:07:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234954AbjHCJHa (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 3 Aug 2023 05:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234952AbjHCJH1 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 3 Aug 2023 05:07:27 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAD6E53
        for <workflows@vger.kernel.org>; Thu,  3 Aug 2023 02:07:26 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9923833737eso98594666b.3
        for <workflows@vger.kernel.org>; Thu, 03 Aug 2023 02:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1691053644; x=1691658444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+vK4CDRp2kRR+ETGhQNSzYi1bWA+u6yABASACTrU9k=;
        b=emuunKVYRmeCC0tRn2vc1hgX2tLz6iD+0kBQj7pqTEzjq+W7fuGuEu4LwszX6f41lE
         HRKYhJUb2J3HCzfeNaxPRX1dBur+wgf2ZsOWP/wUwJ2ItNcQjYNd8P6QHM5yppEr5yZl
         xEcG10wMNJSZo1czk+TbdCM+M7U7b5Mpc51S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691053644; x=1691658444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+vK4CDRp2kRR+ETGhQNSzYi1bWA+u6yABASACTrU9k=;
        b=ESWHUe0VNVJxvpFlztGSRiVno2pzw82t1tXSl7ree81COdNTt9PDk+sEx8HPlbL/i6
         Pg4VPBw7raOx88/Dqtt5dM7W1ecihAfjLyG6IJE4i/uxB/TZ8Xf/f8C1ZShvEnGL8I4J
         i5hVPEU1nmCcQN6fsxcGghPFqnbjTYfyD4FBchig9iNCb/mPTXuVmTsRI7uGB62Rr03a
         j/EofSQW0rlTB+qWgZgIUvBUD63gqoUgbJ03FwKPpMtPY+AyqsjgWZ4hdgVOTZg6ukew
         VrF4gAB1FTwuw8OlLSDXQ3OFUGn3MV1GgBFn2veVEsGiyodfMjW3zMc7Y5wq5qG+C8a/
         xwrA==
X-Gm-Message-State: ABy/qLaYwJrnW58YOJT8au1sImXnb2NzdBY9AExfKUvPCm22HZ8ORyH8
        53ooA2pqWABwagwc7Rba7aT+Ww==
X-Google-Smtp-Source: APBJJlG7lb59aiJs8bPCIMKN1lFw3zOeNKMNfLOSJAKpi1c15PgYGENt4jd89GntHB/Pmc6zhml5lQ==
X-Received: by 2002:a17:907:a058:b0:987:5761:2868 with SMTP id gz24-20020a170907a05800b0098757612868mr6742281ejc.11.1691053644472;
        Thu, 03 Aug 2023 02:07:24 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id ga15-20020a170906b84f00b00997c1d125fasm10305033ejb.170.2023.08.03.02.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 02:07:24 -0700 (PDT)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: changes.rst: add entry for git
Date:   Thu,  3 Aug 2023 11:07:10 +0200
Message-Id: <20230803090711.2261876-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

git is obviously used for development, directly and also
indirectly (via checkpatch, get_maintainer and other helper
scripts). But it is also invoked during the build to produce the
`uname -r` string.

It's useful to have some minimal git version one can expect people to
use. For now, set a somewhat conservative minimum of 1.8.0, which is
already more then ten years old.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 Documentation/process/changes.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 5561dae94f85..a82c619f4bb2 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -62,6 +62,7 @@ Sphinx\ [#f1]_         1.7              sphinx-build --version
 cpio                   any              cpio --version
 GNU tar                1.28             tar --version
 gtags (optional)       6.6.5            gtags --version
+git                    1.8.0            git --version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
@@ -189,6 +190,13 @@ The kernel build requires GNU GLOBAL version 6.6.5 or later to generate
 tag files through ``make gtags``.  This is due to its use of the gtags
 ``-C (--directory)`` flag.
 
+git
+---
+
+When building with CONFIG_LOCALVERSION_AUTO=y, the build system uses
+git to produce a version string of the form
+6.4.6-00128-gd78b7f406397, which will be shown e.g. by running `uname -r`.
+
 System utilities
 ****************
 
-- 
2.37.2


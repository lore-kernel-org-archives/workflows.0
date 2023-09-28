Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2562CE7B00
	for <workflows@archiver.kernel.org>; Thu, 28 Sep 2023 04:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjI1EXM (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 28 Sep 2023 00:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjI1EXL (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 28 Sep 2023 00:23:11 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C716411F
        for <workflows@vger.kernel.org>; Wed, 27 Sep 2023 21:23:09 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d7fd4c23315so19806488276.2
        for <workflows@vger.kernel.org>; Wed, 27 Sep 2023 21:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695874989; x=1696479789; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=It56Gguh650ffaTkOSZVGPYI0c6LZFqw9TQutV5nNWg=;
        b=SaH29wOd+6o/wD+lXYe9HUk7MM9XTCIb1CCutWuRCUgC5eBj9Cf6bPVNMh2gFd+06o
         qDJN52VdFGdPimSgc4wGN8iAw5QStz69l7k4PikxzruStK26QDsnHlTbC0sIhcDfZrZe
         2mDIabAVR066zlM+Ge9s+7xjxI2x8iPfizwrbn7EPw1SZN0MIc79Qy57QMGOxlg9cF86
         63c9npcLxT+zVQ7PH3vLZJQVTcOc1knXYAE6+JvC5SMvrGiALIOo/BLNFtyOxzCWKZ6J
         jxCP6qhEUHuzKqr3ufZVY5n15PNwldU0mDKFsfnMsDX0wFtE17qOW2DEHG+o9vHE+YN8
         z4mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695874989; x=1696479789;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=It56Gguh650ffaTkOSZVGPYI0c6LZFqw9TQutV5nNWg=;
        b=LHJQln5Y39sjUYMWc3yfRh2JydnTs45D50rAIpWi1Bja0M4FccBcobQupfGV7LclMy
         Zaxzp3E8wAPA4gFhUrmwYqhcq9vPmnoYsSGNsGg9L2Skt+BMXZXvy6dIH0U+JzIKZpj1
         TiEizLiSZmf5cMyZ5Ptg8Fcj/pA1S1KZMl3PiRctvw/1Y2CqZrB2lt2PtZp72vUYd76t
         pevs+Q5JB76ZAV8F4mfaE7ngT92FREWFrZ6HrRzcgbxFVuglNGIgAbjuULjahSSbOJke
         J3fmgtv0Kc1vl47BDCPcoXEARcvhmlZ9lANg3AAeFmbSuHtzFM/I9ZAkg8XKTY9UKmWd
         UCPQ==
X-Gm-Message-State: AOJu0YxrDlhdg/8a6/VKp6S6hv/iiyYXJ52kefrhx9VIsDBHqk7u5s2o
        lz8o7QVkSPePmc5gtUUQZDxKigL30xkN7Oy14Q==
X-Google-Smtp-Source: AGHT+IFTRC62+VLY1BTpQX7M0NE8NBu7Eq8lACHDawBOl1EaIH77JSN9AdWvwSVQWPQ/nmaoLbuw+K0YZGm9eNyX/g==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:e7ce:0:b0:d85:ae1e:f696 with SMTP
 id e197-20020a25e7ce000000b00d85ae1ef696mr1475ybh.0.1695874989048; Wed, 27
 Sep 2023 21:23:09 -0700 (PDT)
Date:   Thu, 28 Sep 2023 04:23:06 +0000
In-Reply-To: <20230928-get_maintainer_add_d-v2-0-8acb3f394571@google.com>
Mime-Version: 1.0
References: <20230928-get_maintainer_add_d-v2-0-8acb3f394571@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695874985; l=2073;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=4hd7+/dabC4gbCt9QP7ey8KnfpeloJyHMAZcMSG16Pc=; b=5iUwsCmlzFiWkU7VqHvK/fjbdDZIPAvMcq0fNvbGLegNp3sy3Je2cZlK4W5lStx/DivvtSiJP
 0jPvoyI5v0BAB72qcEpj2pSgwIV1RR4LX3wsUVjDlHqlC+GDvPzfOwF
X-Mailer: b4 0.12.3
Message-ID: <20230928-get_maintainer_add_d-v2-2-8acb3f394571@google.com>
Subject: [PATCH v2 2/2] MAINTAINERS: migrate some K to D
From:   Justin Stitt <justinstitt@google.com>
To:     Joe Perches <joe@perches.com>
Cc:     linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        workflows@vger.kernel.org, mario.limonciello@amd.com,
        Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Let's get the ball rolling with some changes from K to D.

Ultimately, if it turns out that 100% of K users want to change to D
then really the behavior of K could just be changed.

Signed-off-by: Justin Stitt <justinstitt@google.com>
Original-author: Kees Cook <keescook@chromium.org>
---
 MAINTAINERS | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 94e431daa7c2..80ffdaa8f044 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5038,7 +5038,7 @@ F:	Documentation/kbuild/llvm.rst
 F:	include/linux/compiler-clang.h
 F:	scripts/Makefile.clang
 F:	scripts/clang-tools/
-K:	\b(?i:clang|llvm)\b
+D:	\b(?i:clang|llvm)\b
 
 CLK API
 M:	Russell King <linux@armlinux.org.uk>
@@ -8149,7 +8149,7 @@ F:	lib/strcat_kunit.c
 F:	lib/strscpy_kunit.c
 F:	lib/test_fortify/*
 F:	scripts/test_fortify.sh
-K:	\b__NO_FORTIFY\b
+D:	\b__NO_FORTIFY\b
 
 FPGA DFL DRIVERS
 M:	Wu Hao <hao.wu@intel.com>
@@ -11405,8 +11405,10 @@ F:	Documentation/ABI/testing/sysfs-kernel-warn_count
 F:	include/linux/overflow.h
 F:	include/linux/randomize_kstack.h
 F:	mm/usercopy.c
-K:	\b(add|choose)_random_kstack_offset\b
-K:	\b__check_(object_size|heap_object)\b
+D:	\b(add|choose)_random_kstack_offset\b
+D:	\b__check_(object_size|heap_object)\b
+D:	\b__counted_by\b
+
 
 KERNEL JANITORS
 L:	kernel-janitors@vger.kernel.org
@@ -17290,7 +17292,7 @@ F:	drivers/acpi/apei/erst.c
 F:	drivers/firmware/efi/efi-pstore.c
 F:	fs/pstore/
 F:	include/linux/pstore*
-K:	\b(pstore|ramoops)
+D:	\b(pstore|ramoops)
 
 PTP HARDWARE CLOCK SUPPORT
 M:	Richard Cochran <richardcochran@gmail.com>
@@ -19231,8 +19233,8 @@ F:	include/uapi/linux/seccomp.h
 F:	kernel/seccomp.c
 F:	tools/testing/selftests/kselftest_harness.h
 F:	tools/testing/selftests/seccomp/*
-K:	\bsecure_computing
-K:	\bTIF_SECCOMP\b
+D:	\bsecure_computing
+D:	\bTIF_SECCOMP\b
 
 SECURE DIGITAL HOST CONTROLLER INTERFACE (SDHCI) Broadcom BRCMSTB DRIVER
 M:	Kamal Dasu <kamal.dasu@broadcom.com>

-- 
2.42.0.582.g8ccd20d70d-goog


Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C1DE7E62B
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 04:15:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjI0EPQ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 00:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbjI0EN5 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 27 Sep 2023 00:13:57 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCA61E97C
        for <workflows@vger.kernel.org>; Tue, 26 Sep 2023 20:19:29 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a1df5b7830so60236617b3.1
        for <workflows@vger.kernel.org>; Tue, 26 Sep 2023 20:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695784768; x=1696389568; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XvH7PL3IpModIaBYSEYbzRLGYczZCvDsof3AAq/Ed5g=;
        b=OnFJE9kRJEMfnj+J8Dazd3JtLlJOfuWeEGIJ75lxe9pSGvoYTig6LWVxRmD3WV4UDd
         ngpzt3poF50HsYl6XPmP6V5dOtwjoON53X4i3J+ne2MWuiRGY8JDeGvTRH44tiMRBw6w
         CMsW1fjm5hBTtypzISnFucs3S+9VeIlM+sspcbeCrr974+I/xgITt08KWV4nHXmnd91/
         nqb3qajN2PynCDpFIq65MTKNg31QKAS40pxEPbFO05imvQ1BMkw9OoLCjTVg365ud/sc
         pnpQz+hX7O0y/GIoXNw1RM0jrb0A/pbBvJWxfoChdvF2vm8F6Hts2mts1Z0u/Ybd28N2
         IYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695784768; x=1696389568;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XvH7PL3IpModIaBYSEYbzRLGYczZCvDsof3AAq/Ed5g=;
        b=NjgFbT1XoKVA6L/9ULbnLvEKYVS/9WsYoXRu5HDmQ/eOpXf4i8spLEeaN3zOvyZyV3
         TCs4EfLpxLMjPlLkVCx3MEWbx+SoQ4GX+3TgzNgsteLqZJ5BOrVwsL7/8vzw5HEQHPjp
         buyDUgbw4sUyTKfTEK4FwjmWGAk/J/KbdlzSAILV2Sb9j3sPH/qnvVjt1fLgk6Qorczt
         pyNgW+0vfFmhen8ZCEBw1ELVW8n6ohJfEMkOObeB0ySFdKOe1IYO6wvGsCYayBadvqMo
         FDrn1bnzKUQDvtPg9vvcL9g3uNXP5jDLJFxUa6XiDoqtVFViakVqPGJX25z13s9ALGxA
         DWhw==
X-Gm-Message-State: AOJu0Yw7sfqNvPNPLy0pMcjgQMMhbVPZo8J/iY+vUGe9XchCFX8c3RTR
        CU3u7nrwBT/Jgb0W1IE4pod00ceNl4El+j5wjA==
X-Google-Smtp-Source: AGHT+IGX4aoZtFbXWqtcc89JYRugDUdZL8Q0ZVg1uDzMCVnMVhOige2x8o48WdF4wz747v/NdVDp0Nfv9lnj33uqnQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1682:b0:d81:78ec:c403 with
 SMTP id bx2-20020a056902168200b00d8178ecc403mr8895ybb.12.1695784768704; Tue,
 26 Sep 2023 20:19:28 -0700 (PDT)
Date:   Wed, 27 Sep 2023 03:19:14 +0000
In-Reply-To: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
Mime-Version: 1.0
References: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695784766; l=763;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=2rn2uSI1b/tbHIH/62Nxy5AAUtpBQ8U5oR+vuYQXIoI=; b=k5mgYo0NjhNugGvWFfhtXCMelIJg2LvlsL9wPmo4rkG4DGHOlWQBB/INT2DnhE1URuwBK7bcG
 skiIAN+HNkDDW8yYsxqZez8N7mkqSxYepGVQRhwoni0TZfLCcmEuIfO
X-Mailer: b4 0.12.3
Message-ID: <20230927-get_maintainer_add_d-v1-1-28c207229e72@google.com>
Subject: [PATCH 1/3] MAINTAINERS: add documentation for D:
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

Document what "D:" does.

This is more or less the same as what "K:" does but only works for patch
files.

See [3/3] for more info and an illustrative example.
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b19995690904..de68d2c0cf29 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -59,6 +59,9 @@ Descriptions of section entries and preferred order
 	      matches patches or files that contain one or more of the words
 	      printk, pr_info or pr_err
 	   One regex pattern per line.  Multiple K: lines acceptable.
+  D: *Content regex* (perl extended) pattern match patches only.
+     Usage same as K:.
+
 
 Maintainers List
 ----------------

-- 
2.42.0.582.g8ccd20d70d-goog


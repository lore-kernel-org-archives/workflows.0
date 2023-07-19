Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58B3C04A6A
	for <workflows@archiver.kernel.org>; Wed, 19 Jul 2023 14:33:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbjGSOdb (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 19 Jul 2023 10:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231609AbjGSOd3 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 19 Jul 2023 10:33:29 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D6B1722
        for <workflows@vger.kernel.org>; Wed, 19 Jul 2023 07:33:20 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51e5e4c6026so9886835a12.0
        for <workflows@vger.kernel.org>; Wed, 19 Jul 2023 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689777199; x=1692369199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=me1tA/8BMNe18uM5MYD2lF7qBGxRDWqKn8M9Ck3Z2Ac=;
        b=QVGAL3gwk97MJMgiDHCYJ8wjpSiVzT/mtr7lB1Q5/tvSt/KyR4gsS3WsYQTVagh2dg
         riRAJotPhzkb+aEJMq2ZUEaSL881W1eP+plGKUKWLpwRGT6fj0CLLa5aoSAn41rdyiTB
         kuvBO+Flz2HEQZAt9XYvK3XFuZO5E+oXxanE46xzU1h/nEYWVoYT24X30bYmihoFhf7F
         ql9JkL19h2im+NWFI06TVvE18e+OhCNI3BAXvpbiTh+en0Fx8GOD6Kdi61NXaPoaGFkf
         RQPa4QxYSCpCkwrBdHKofMR3sDxgjK9rMCnHWXcVC0QcQzG3x8uLiIL17TwGQzn8hSdt
         hpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689777199; x=1692369199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=me1tA/8BMNe18uM5MYD2lF7qBGxRDWqKn8M9Ck3Z2Ac=;
        b=EAJfHrkxM68DaFCtzn/ZdIXvHxXvl81aL+rST3sYZwvkjBYnPGtZVYeT7LpVXSsIjb
         5NLc72/RkdK6oKZq+2StHuYtuqNn9QH4SHhX9j17o+S/1U2WLNIgYaDTDrVeLiFO9xCr
         CATdvsl2Neqf3zPIzRZvUJ/VvUQhDuSbL5pCnwMcoa/335PRAohePW2hdpZ8ehT56+xF
         hhRMrWEBygLmKvhQTb0SWs1z7f0g4lw4fcAqwwal/2qMap7BPnJF9a6LTWy44ByBVlSL
         jGz1fLd8S3UkbWvWutuLf1SQSYAhru6aiYXtgcIpxfXUgxgkPkeaY2QhUakDNsyvIAIX
         8YZQ==
X-Gm-Message-State: ABy/qLbXJ8b+L8B/rfG8NkhGsxO5AxrZRTa2FzI/KDWaw9fkl/bSrQeJ
        2qs+imS4YXy1MRiilwVFvtbcgA==
X-Google-Smtp-Source: APBJJlHjqimEB9KgibSCvGrF+kWBxeRpB0ykcHOFq2/ua4YG+ANhFtH7/tsnMuNURi7d9m1BNiZeaw==
X-Received: by 2002:a17:906:8603:b0:992:54dc:9cf2 with SMTP id o3-20020a170906860300b0099254dc9cf2mr2040726ejx.62.1689777199268;
        Wed, 19 Jul 2023 07:33:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id e9-20020a170906374900b009893650453fsm2454597ejc.173.2023.07.19.07.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 07:33:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, arm@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] MAINTAINER: samsung: document dtbs_check requirement for Samsung
Date:   Wed, 19 Jul 2023 16:33:09 +0200
Message-Id: <20230719143309.204766-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
References: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Samsung ARM/ARM64 SoCs (including legacy S3C64xx and S5PV210) are also
expected not to bring any new dtbs_check warnings.  In fact this have
been already enforced and tested since few release.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. None
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a70c32790427..e7b923d2fd55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2646,6 +2646,7 @@ R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+P:	Documentation/process/maintainer-soc-clean-dts.rst
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
 B:	mailto:linux-samsung-soc@vger.kernel.org
 C:	irc://irc.libera.chat/linux-exynos
-- 
2.34.1


Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285541A7045
	for <workflows@vger.kernel.org>; Tue, 25 Feb 2025 18:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740509310; cv=none; b=mXF+SLefDD1dfcT+B0LUWRhOv1cSV8UxracWPnuUI8teB+VZtk2w3okut9hpeGW+ZOdmqTVA+Mg2McJal/vrkwC4usTY2ros23o4/aAnjigi/vp4ULZpPcyp2hgyZ94bcLZAtjwyfnPsOOH4UI+2JoUc1SxhEG3kYhJkQcyAgkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740509310; c=relaxed/simple;
	bh=w+svvFUZeh+NUVQcPgIj5rGGXE1ylyMV4ce0O+x3V5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nLegMVakefXZJR8mnADON0p81w1+QbIJFN1ApJCUhhGDqcMsL2oPnI2YojZOO622Kcw0sS8EIQR7UGUs6Fg9nOeYxWbDfVGYg5UShEC/+fIQ+FiyhTPm6i74JtJbIOdXb113uaC/KHuiDTONERqrjKamr3eYn27JKIzF7hlpqpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KvMU9Xlc; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KvMU9Xlc"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7c4350826so100287466b.3
        for <workflows@vger.kernel.org>; Tue, 25 Feb 2025 10:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740509306; x=1741114106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xonXqxvKrBNVv9VbDpJk9UUk6NvAaABwloKGPZx8qJg=;
        b=KvMU9XlcBVlxILWDFDxKalyyRvVQt77tQDiASGgm9RSSCuIEIdd6/xhRIVvrUiAUOu
         WuRx95uwW3z13sxKsJorhgzEk203MWNpbRVPj3RcZHeABGYaUcFg/dXL9NVKcnLAqXyc
         N1cDwYHDbPbjVNZIm1ugpwmv37rQkpGu3D8KpJ+HD/Cx524SuMPxdJhnzyKD2NY1Q1Da
         +UG5+z/PGhDm/Ok1snig1882XTTdU5amGjUSiOHWeQ4EMrf+eF2qw9hc6ele9VSxnSJH
         CnZh+L7YwQnx6CEFVOmmcsI5U7B4aRx25hkWc4WUG3DowMvNmfXzrd3hTEruRcxNX0Rb
         gaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740509306; x=1741114106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xonXqxvKrBNVv9VbDpJk9UUk6NvAaABwloKGPZx8qJg=;
        b=ovfS+aaJsCC6n71J1RJXmoP8XV/OihOiQ7Dx2ug7WoSk+w0YYUoziL4P7MMZn5ssMI
         l2eX6tLm3D6MDGu22Gn4S7KH2zvdP2KXDCZZZEyX/6oicPkt4eS+JIKnoBVoSxG6t21P
         F/8ZauDH9f0IYIZnvryEmpltuk3C+mCl9ljRovP5ZDAMWLTUmeiiyND7ENaYidBDlePM
         e4v2c8Qu+AK36LVo6RKcvMthA2/ml4Pg5h3giKAAUNgZnL2ERk53j4Cf/CGBczKqi2/m
         7sUlgXJVGaMwT2HnwFNUhzBva1Hs/TqYGUxTd9sp5ss/pGxrc1fVPPH8jgHC7uxpV4ZJ
         O87g==
X-Forwarded-Encrypted: i=1; AJvYcCWswPAqHg+zTxpmzvenrZ7R3dVBi9qe6bpgvvULcWKpqpuiMAaoWmoTkuZk1Jih5ezEGye2I+zVLes=@vger.kernel.org
X-Gm-Message-State: AOJu0YzywdKypF2tDflJW1Aeg79IljXy0slo/ns0ez9IhUarRF00ePjM
	NP0S86n8mnRqmHK8N+KJHKyQ9sRyVHaFFtCWeghfQyz6AQKx8i/r2r2lukgPPH0=
X-Gm-Gg: ASbGnct5YY4FpxWIvZvsRXlaRL2o+gNhtajDTwLItuPvbX6Y0Y2N4LqlMAkYRZ/seW3
	SUfoWSsp4ZNRj04sSi8TpnjqFLu+W7PkT7VHPTR3OqHubWnJJfFDm3Wk4k9CuTfgPlilKQgCIHu
	D8FliBOfAJvs4yaQH6kcm9pRpjFxwMLVp9JVLfjyz7G8GPlwm4RMF8hcMhefxVPzbkcR+imYGUo
	+SE9Q65WyRGPycLldCwlDW3W3V6Er+PVkFvqxDpLke5EaqoNCumY2CS26eSSdrzpr69IErD3YPq
	CPIAY40ZJYPIE4aS4ESN4fCcUrLQYImCCiJIghMf0WRMWdH4YfIPlN5f5sdXaq1y1z128Csl0IA
	=
X-Google-Smtp-Source: AGHT+IHgg2NfoJNIoVPeDVM+ZICkn7h+QLq/e1GcetAUMNdHAqmG1KBd1VC5Ah7e3zEn4CVbWsAd/g==
X-Received: by 2002:a17:907:1c0d:b0:ab7:c28f:de59 with SMTP id a640c23a62f3a-abc09d2deb1mr534837166b.13.1740509306244;
        Tue, 25 Feb 2025 10:48:26 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1cdbf55sm185359466b.15.2025.02.25.10.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 10:48:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] docs: dt: submitting-patches: Document sending DTS patches
Date: Tue, 25 Feb 2025 19:48:21 +0100
Message-ID: <20250225184822.213296-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document two rules already widely used and enforced by DT maintainers
and SoC platform maintainers:

1. DTS patches should be placed at the end of driver patchset to
   indicate no dependencies of driver code on DTS.

2. DTS patches should be applied via SoC platform maintainers, because
   it is a driver-independent hardware description.  However some
   driver maintainers are reluctant to pick up portions of patchsets and
   prefer to take entire set at once.  For such cases, the DTS portion
   should be split into separate patchset, so it will not end up in the
   driver subsystem integration tree.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/submitting-patches.rst           | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/submitting-patches.rst b/Documentation/devicetree/bindings/submitting-patches.rst
index a64f21a5f299..f3e23e69a638 100644
--- a/Documentation/devicetree/bindings/submitting-patches.rst
+++ b/Documentation/devicetree/bindings/submitting-patches.rst
@@ -54,11 +54,22 @@ I. For patch submitters
      followed as of commit bff5da4335256513497cc8c79f9a9d1665e09864
      ("checkpatch: add DT compatible string documentation checks"). ]
 
-  7) If a documented compatible string is not yet matched by the
+  7) DTS is treated in general as driver-independent hardware description, thus
+     any DTS patches, regardless whether using existing or new bindings, should
+     be placed at the end of patchset to indicate no dependency of drivers on
+     the DTS.  DTS will be anyway applied through separate tree or branch, so
+     different order would indicate the serie is non-bisectable.
+
+     If a driver subsystem maintainer prefers to apply entire set, instead of
+     their relevant portion of patchset, please split the DTS patches into
+     separate patchset with a reference in changelog or cover letter to the
+     bindings submission on the mailing list.
+
+  8) If a documented compatible string is not yet matched by the
      driver, the documentation should also include a compatible
      string that is matched by the driver.
 
-  8) Bindings are actively used by multiple projects other than the Linux
+  9) Bindings are actively used by multiple projects other than the Linux
      Kernel, extra care and consideration may need to be taken when making changes
      to existing bindings.
 
@@ -79,6 +90,10 @@ II. For kernel maintainers
   3) For a series going though multiple trees, the binding patch should be
      kept with the driver using the binding.
 
+  4) The DTS files should however never be applied via driver subsystem tree,
+     but always via platform SoC trees on dedicated branches (see also
+     Documentation/process/maintainer-soc.rst).
+
 III. Notes
 ==========
 
-- 
2.43.0


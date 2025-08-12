Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FAE2E972A
	for <workflows@vger.kernel.org>; Tue, 12 Aug 2025 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754995323; cv=none; b=X2Y6bEmZAwT9M4eezJEqsV4yBS7YQKtujLhmCiA+io/voJEz0bBnFg5Qpch8gugg0OZjbO3qC48Nh7GQFbze+i2UaRsDkc5jvQPhSvtz7Qc/gRSxf6kfBR011kSyd9GyhrV59wwz28NED7Xfno6zbQVBvwBGgfpa47qZPVYiUag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754995323; c=relaxed/simple;
	bh=btAyvRtmkbXxP+i+9dkWP6dlhtZYn7iXm7lHIO+hiSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H329/mAlzZ/xreB+2ueP9RfXE2v/EDjBxe9G9BbwHyNpmcsmYqsi/8v85kfwOH3JwuEFjlqvbTO88M1uC8Ksog14JlrRQLv1uZuGeDJW+/eCAsV7IhwoTGNwdUSfH42YSsgICUDdbs45+Wq0ZSmjqJX66S1WomK3TaqJdG310nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rLpSdnf/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rLpSdnf/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6158c9766f8so882729a12.0
        for <workflows@vger.kernel.org>; Tue, 12 Aug 2025 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754995320; x=1755600120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAaiOy/N3h7yB/4dFeIEkdF56kDC1q6Gqt9cvra5SPs=;
        b=rLpSdnf/pDMpBqrmnjMsGp+OSG01Hv4w5tJObPxPQ8pb1U9LD84tPqWnErvtbbuhk5
         m3Ve4wrxrBNOicbqWCXpKvo9F0nLdNjfOQxpQ5C+rh0vc4lzuojGevJE4zFDTjz+SK6N
         hss6BMQWdRDzmI3KtNnZl5yB+9jXYJ0lV42wih892arjGwJm6GVQdP027vzQNc5M0iTj
         FU16BIF8Cjw/J3y0QZLIR+WJ8JmYlLZDJLrWS7prcFcbt7YybNzeVkWzFRoLEOoWVLut
         DaY6vmD06QyOC1/gwGn43eV0JcWaz8+vIYoQeSKYE2yPmiezEyGuKBVRu8SFZIoRIrmd
         xFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754995320; x=1755600120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAaiOy/N3h7yB/4dFeIEkdF56kDC1q6Gqt9cvra5SPs=;
        b=UnniuaUdIOdy9jGNM61MMgjCwP3EcviDrkp0N4C7TxLjH5IQKoBG06EXwb99i+hBa0
         uEuetCttL27lDwluKoYh2eUbz5NNPWB0pRWopf2Q189LzLoPp1god1EWBUI/2JAogZRR
         tTpC7NY+7hLXglAs9F3siKnvUGVGS82e3Ktfwbintui5NT40KYlB1L1H4rj1HYirv4J7
         /d7ooeFdbEbULidT3xwKXLMBeFykPisJDopEptreUaFmcBrF17ESfM6VcydZlNWdW5AJ
         KBNb3FWHFThEbRT4inJJWx/D68/28YRr6hKBKZj4vggRHwldoua+2vG8vs2iw79F0qWG
         hA+g==
X-Forwarded-Encrypted: i=1; AJvYcCVooqRjgdeqhdkscKb/a5syYIitWFXuhrKvTTnmC783aLVjB1OlcmKRDRCPKvJjYDuN5QzPhsxVdHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQRmcz2A1u2MmpfxqnuDtVl6A69HOv3jyG4oJC8VbTan4t+dF2
	bmOXnQGSoedcNYqiEEU615yLRLm9+HjSMX3/ulDi4NoQwGNbYVJ0mgTFGs1KFDZsr+0=
X-Gm-Gg: ASbGncvXw1u6c8oCiG7vjQNbz57RAzmvYHoCFQdHm69iqAX0EJ8+zebBerntGl3wndC
	BjlIx4h4m1nsra+kbhBGR2JpL+JcZo7bgYkWtBH+eF4KKiFAu7r7MCMiXz6qLGPjBaC5H8u+5ev
	lbEnRqA3Q5aDSTn8JH5ROleLhzgi3a14oyoBUqDfDODOWjh4ug1T6aRLSkXK/COXDCAc0N2ZvOa
	AGXpFb/nTKpqj6wwXsR2gwZlRgATihA1QHPaNu3LoOCjQFifiB8Ac23sRtMYGV2iqDGqa7zztBu
	mdq0N5Ey8w+kpoYqa3xz7WOZfWpdokstzZoULlfTRjiVPTmbtb+7eD+0jb4/eF/NE0WmxBKrX5T
	ZA4t4O5L45EAfm0qGzBijk5Jb7zdRiMtexQ==
X-Google-Smtp-Source: AGHT+IFVuPBX1WWXHjE5WiQCW0z9z7axEQSpNRILYD7CKS+Z1ca46MwosUVW2g0lgYDVQmrovf+vTQ==
X-Received: by 2002:a05:6402:520c:b0:615:7ba6:4876 with SMTP id 4fb4d7f45d1cf-61859a4adaamr378641a12.8.1754995319829;
        Tue, 12 Aug 2025 03:41:59 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6184b807728sm1460348a12.12.2025.08.12.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:41:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] Documentation/process: maintainer-soc: Use "DTS" instead of "devicetree"
Date: Tue, 12 Aug 2025 12:41:55 +0200
Message-ID: <20250812104154.42289-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=btAyvRtmkbXxP+i+9dkWP6dlhtZYn7iXm7lHIO+hiSI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBomxpy/fIPdRspqyjtDspdwQP8eCSdbbk/qvY1e
 4DUh4r8dLeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaJsacgAKCRDBN2bmhouD
 153BD/9pbsdOLBBjuH1T+Qx7JutSi91jJK1OztVssLYs4N3tTNF+Fu++ubUyfqjTPN9DDfUMc7z
 r8N7GY/iIODwgdDoMexHzoriyr70+llWuV2NjB6Nd4Xj9YHZXyxaxnhyhy+GJJ1SXRM3Pw919eq
 616seqX5p2xJqBexrpCIkRLpR3QNaEEQSCC41ZLQ2BJNqgxZAIKjrRs0pkFzMYB1QSIofSoyFna
 f9yeIBIJs9WND+wnezDp5bsBNIE7OkaPZrKwZ0bQPG3eVeI9m4zsCht+AsngcHv79+UG5dEQ6E6
 +9XrLuX3vzUyFkqQ6muXyv9uDNpFdwyeh7B3sd3ZUMezddVdjFBZnabjjUSLntgJuJFl0oB9YIB
 WeTPZ1LNxCaOkY59Jt+dSdUrarHHqxVsL8woIvnHiE7nQhspm4pnReYjzgIqX15ol/dgbDmiQ3+
 a7Xfr3sz3hvMC3ynzjpbZFHIkHlL5EvZ3ZUMO0ru24+KMxFqFNXBqDq/Ay2IYRBRcjMuQIxkqZn
 I5reux0ksT9YUxOa6Bv/K9gHFG+CSX1i+6ssJ0t688S8c+bYD/crDYQi4OZR1tPSkhMyo+aYevb
 Ca6YM98/dQ7Sc/Wm1cIRb7S2HtQ0kzggeb61K8+3DLwfR9swlMo6APbfYaCFZUa3be3Q281MTSi HBP/vBdc3HJW2MA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Devicetree is a data structure and it is a bit generic term, because
some treat Devicetree bindings as Devicetree.  What the SoC maintainers
profile is mentioning in ABI stability are the Devicetree sources, so
DTS files.  It is also more common during reviews to refer to these as
per "DTS" instead "devicetree".

Clarify that by using "DTS" name in few more places.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is a doc patch, but covering SoC tree, so maybe it can be applied
by SoC (Arnd)?
---
 Documentation/process/maintainer-soc.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index fe9d8bcfbd2b..3ba886f52a51 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -10,7 +10,7 @@ Overview
 The SoC subsystem is a place of aggregation for SoC-specific code.
 The main components of the subsystem are:
 
-* devicetrees for 32- & 64-bit ARM and RISC-V
+* devicetrees (DTS) for 32- & 64-bit ARM and RISC-V
 * 32-bit ARM board files (arch/arm/mach*)
 * 32- & 64-bit ARM defconfigs
 * SoC-specific drivers across architectures, in particular for 32- & 64-bit
@@ -97,8 +97,8 @@ Perhaps one of the most important things to highlight is that dt-bindings
 document the ABI between the devicetree and the kernel.
 Please read Documentation/devicetree/bindings/ABI.rst.
 
-If changes are being made to a devicetree that are incompatible with old
-kernels, the devicetree patch should not be applied until the driver is, or an
+If changes are being made to a DTS that are incompatible with old
+kernels, the DTS patch should not be applied until the driver is, or an
 appropriate time later.  Most importantly, any incompatible changes should be
 clearly pointed out in the patch description and pull request, along with the
 expected impact on existing users, such as bootloaders or other operating
-- 
2.48.1


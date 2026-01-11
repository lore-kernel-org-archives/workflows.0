Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627093033E4
	for <workflows@vger.kernel.org>; Sun, 11 Jan 2026 16:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768147681; cv=none; b=RLXLPDUqeuP/zcDdRxjpdiJSGrE4VUmAuU9Fp2gJS0DZV9ifW/cTkcHB4SntLc3FAlo4TSQhp8tgHNqU3HyqobidLQpTRjzKLF+pFXRcJZ/LFqLDG2Pg15Cw8jxhrGExiWonO+U43mY61gHjwg94xdKgjmHgGAxnjuy6sB8J9Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768147681; c=relaxed/simple;
	bh=mrJ2r/higfpselGc6ELPbZ4mu5aGxqm5xTx8ZYso3Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WtS8LvAak75NQIs/zw9zSTfR+rnw2TYrItdN5LhsTvFWJVqsKbZp/sCdqxx6pID9UiIkMTf7vk1sNWb1swO5yGy0ELOucRdmNcD684e96A0dAsY+zEWsBUwq6GqDY9WRbzPlPWXJzHLba+OU0zvz3Os0OFFD8nMLI7KCO4eOJ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZEh7Fna; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OVi0knrj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZEh7Fna";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OVi0knrj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B76sbs1861677
	for <workflows@vger.kernel.org>; Sun, 11 Jan 2026 16:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UfXDHbQVS5pwkRsJmLRMNBG+krLGYWt0QDZ
	Ek+fS9RM=; b=SZEh7FnavRWYsAtKGkrVniuyYpnHDKWlXD8k9EFcuM3NvMZ0Lse
	9pMRLlLMPMNgI+A4+oQRBdBc095R8G7p2I7iAK4xvAlssdrhS52D1KWX4Cg8r/jl
	IKZEL5FHcspB5J/GmUE36I+uSu3MULYaXiG7+A2F59rptaxPVDv+aFZcmQJhOJnO
	Mm41ebNgLt8dGzTT5gquOTv2I6uC+/t82EQefZGYGfCl9mfAjliImMEYbELpLeN7
	YxMA4RcAQQgvqsmkqGJR2x1dGStQ1Uvx2r4olY9F7WRiMa92xsF8nQgKnsPqnbgt
	5qUmjB5cgkH2nsajRReMjZ1ANb+ZJUNgMPA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks259k5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Sun, 11 Jan 2026 16:07:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9ff555d2dso1607951885a.0
        for <workflows@vger.kernel.org>; Sun, 11 Jan 2026 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768147679; x=1768752479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UfXDHbQVS5pwkRsJmLRMNBG+krLGYWt0QDZEk+fS9RM=;
        b=OVi0knrjhTvug/OjX79DrMfVRb6dbHrjvHnFa1kXV/lZXV1B3IohD/Ci5NoFxr2yqW
         LQP/b6sYah6IoM40+laAsZGGKAeqGS7oWaRSa+hVxYQ6E36MZHfK2qLVdkV5VJ0K8NF2
         b9YI8Rxmhg9aeC0oN9zsV6MBXBHEFEvmhdgGrbcmWhYbfcVpxJiqVfxGYD6Dil719YOM
         1TYoKIf3nP3NoeFoCXYPHv4rCQkGu/7h+s3nyzkzpy0CZzSoTeqn1u/AZR2376jR+Jmr
         s0dkDBSFxy7YI2VRjphD6ZEHgz04MY0PdtviHfhllQFg428fuf+1DT8nM8nqlKpNpGfz
         ytug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768147679; x=1768752479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfXDHbQVS5pwkRsJmLRMNBG+krLGYWt0QDZEk+fS9RM=;
        b=GjAMwumoTbSRYVYTKkO30s2vu/+HKLkcZpHaM9a26P+0KdDa13FcYq0OPyXWPiCHS9
         vZbEIEXGuqhO31SuFavvHfz2YRxfTfer+5zaUHbwOUbq6CrkWvXSJxDGiyY7EWEzaQoG
         2MnAbGfSUIWUMBGhqGw+ilWsXFddnTYeqcsladOhYc11h5tZbNDhKJ5OFVcAhyWyWVBx
         SGhUvk01JIRSBjM9gvipnW5JXyi9OKAkbSgwjIRxxmjUZi1Pen5mOhe2Cs0VImYWJepR
         kL0h4QXVFUPJ6YM9E3Kb6aGstxJtX2aBTyMm7TxGDEYdBmoQ+DgznIYG+gzEYWDd/JAY
         EcKw==
X-Forwarded-Encrypted: i=1; AJvYcCUrpsz7uglu8K5jBM7dCp5winTONLkUkc0c2/TJ9Opy0P9F/aX4ARJOpbaBsGCHBWnF8O8c7o7h6+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYRAJo3w47h7oCv7rStMoxR3hQQGQ7w6DR/zdgpJvKbOknnJGZ
	JOVgTXzMX/ZpA4dEdz5WXJm9gZHwg+fkkBXLQNPFblXoTZvoYn/eZdX9v0KMUvokm1q2I98Mtav
	54pF+f+jEEOM/SdiSXjL0DxGZIrhar5vkAGYLfuOcQNQr25DaKSyenUCRBC1il9s=
X-Gm-Gg: AY/fxX7dPrWw1lUJbaho7KUuYPe3ZdP3etatTMQuDGIP0lbiuTYBnaiUsAexW/hVpc/
	8MwBizpBIcPXl8P3RD0FOkMq1SVYvbXJI33bj08P628gSu9zwyybIwKRAwOC82CRV02gBx0FG+y
	AtZAagjBuDJFaFV9iKZUcNd26XEzryC0ZBTdWaFLf+k+u1AM8OUY6KoGfKE20kdPGhJaaRhCfVm
	Qw7PCoAV6V190qo0dF38XDYs0HpTTTNoSpZX/uXDmKdY+cHwVnEjcuzMZL1Xi+SIw1GmULy2Re1
	hVyjK6Jh2fY+Goq3GGYETTlVi35qCoeizBWLYa0DAXQq3wjXH1ir32CO8/bH4uK6QNwW40FZnD9
	hnHY14RjtjNCtZicxNJPCmASrnA==
X-Received: by 2002:a05:620a:2915:b0:8b2:dfb3:dc2a with SMTP id af79cd13be357-8c3894072a3mr2212355185a.75.1768147678696;
        Sun, 11 Jan 2026 08:07:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwCjCH6EdXW2J7irnqLz5o/yB3SzSXcXwviTX1wmXmPQwpzYcLaFaox6xfVLe5CbPSPXUU3Q==
X-Received: by 2002:a05:620a:2915:b0:8b2:dfb3:dc2a with SMTP id af79cd13be357-8c3894072a3mr2212351785a.75.1768147678294;
        Sun, 11 Jan 2026 08:07:58 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6f0e15sm307246465e9.10.2026.01.11.08.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 08:07:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2] LICENSES: Explicitly allow SPDX-FileCopyrightText
Date: Sun, 11 Jan 2026 17:07:51 +0100
Message-ID: <20260111160750.17569-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2749; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=mrJ2r/higfpselGc6ELPbZ4mu5aGxqm5xTx8ZYso3Q8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8rWn4lKtNED4bXwPlQGOV2waA/b7Ss9A0shQ
 JaUJWeko+WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPK1gAKCRDBN2bmhouD
 1xFWD/92jI3k/cDAvEeWpS0m/rW9JKqyC+dXTlXNEjYOdi9kh4F0TP1H5C75exA91rVOncDuBTi
 XsdsRmcYK1wNS3cPjmqsUEU/axosOqgvqLH8LZ/zZgkbTjDur5sF6YYKFfgJDy7zO+nYPRWPxTo
 M7TREvFci/b1Fdzk4p0qhXu8mIxofsTHqpA4mBM+l2qHoHhWKnuxC0XZE2sXw9FyfxRIL6E1BnB
 zDi9PER2GG5LNNbjPUhN2Tt6u16An+vqZx9By2ccLAxg5E7H3Y/19qrOXi5BirPQsdbkGh7uuMh
 xCbmfVyMWmRprbEjg2wFIJ0LWNz4MRdiD/1Zgv0Rxu2k5ZJONzG/EycoAZ9PseivLDBnJ03SVCz
 ylE2sI68mSbTnfzUqa1wbUaYQ9r6RnQHK+/CM/zwmt9bnLo4pxEMPvKBAx7gYvYkhRRDlRm2e3r
 D6ZnCeD30Q1npEpVCcuxsC3Lr+xdIKA/LoiUfxbJepaRbQh5Vg+N4JHYkcw3CW/77Xu3FKbE8xL
 ESnVAwUUBWhR7KS1+9P4zaY5GKSOPMxiDcacU/x0kXM4Ys3qivg3APpXCM+zDXXgcpRaGVq5s93
 llk5SBAyLcWZn9fbJIjaHL1nW6ztUPvKdnYy2HMbzKSb4L9yuCjYRWlpuNvzFRNsiyvHtYwwano 19EIqgGPxKabXxQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0OSBTYWx0ZWRfX94cum2eZGr41
 9hhndWE6B11ZE4YGpph+iCX5o1Rr+5ZswwB4+9J/A2LFAY71MqM7Cds9VQP9bZ6PZzewkG00AsK
 CYlmwkqVSCVDX+vkouleJ1QGbiN3wSBedLipxaLLzfczureyYbRszN0Z34no/XyJ5sZfJR97j7B
 YLZ4nS7rTa6SE3JV/XoI6PBKsaFoMx86ebM1u6SC8x1e5vL2/KFzrC8GPN187/B7n5E6t/WtzQd
 tb3Z3GHIEcBuEI/NE+1WiOXa/u0kxeD2ftqzLBouUOTgM+4pVmoR/cT2nI7o3mQbfe2dm1CTazj
 ZhuOasbpzFeUHBc6a99TJ5LfjBVY/NXSFnrnnv5b1lkiz9fEfbjZ3W6TOZsiEt1x411k6MEQMok
 I/TQXL/WHll7CECzr6Hk1/t/VMKZE+f6/w0jBJSa7D9dj31zc0R32ao2pR2DhYjUYqlqfKiflz9
 8IOGkE/G2jVJ9f7d5LA==
X-Proofpoint-GUID: uDcCTplZWdsGlN_F0-xKIRegKuRX3oIa
X-Proofpoint-ORIG-GUID: uDcCTplZWdsGlN_F0-xKIRegKuRX3oIa
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=6963cadf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P1BnusSwAAAA:8 a=ag1SF4gXAAAA:8 a=IJv9LcIfAAAA:8 a=EUspDBNiAAAA:8
 a=_UQAGB7oVweOm72raGYA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=D0XLA9XvdZm18NrgonBM:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=cmr4hm9N53k6aw-X_--Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110149

Sources already have SPDX-FileCopyrightText (~40 instances) and more
appear on the mailing list, so document that it is allowed.  On the
other hand SPDX defines several other tags like SPDX-FileType, so add
checkpatch rule to narrow desired tags only to two of them - license and
copyright.  That way no new tags would sneak in to the kernel unnoticed.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Other way would be to remove SPDX-FileCopyrightText from existing files
and disallow this, but one way or another we should be explicit about
it.  Otherwise people will be sending more of these and each maintainer
would need to make their own call.

Changes in v2:
1. Doc adjustments based on feedback from Greg and Laurent.
2. "unused" -> "unsupported"
3. Drop redundant blank line
---
 Documentation/process/license-rules.rst | 7 +++++--
 scripts/checkpatch.pl                   | 8 ++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
index 59a7832df7d0..5cc58168e3d9 100644
--- a/Documentation/process/license-rules.rst
+++ b/Documentation/process/license-rules.rst
@@ -63,8 +63,11 @@ License identifier syntax
    The SPDX license identifier in kernel files shall be added at the first
    possible line in a file which can contain a comment.  For the majority
    of files this is the first line, except for scripts which require the
-   '#!PATH_TO_INTERPRETER' in the first line.  For those scripts the SPDX
-   identifier goes into the second line.
+   '#!PATH_TO_INTERPRETER' in the first line.  For those scripts, the SPDX
+   license identifier goes into the second line.
+
+   The license identifier line can then be followed by one of multiple
+   SPDX-FileCopyrightText lines if desired.
 
 |
 
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 362a8d1cd327..cc2a5882fef8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3844,6 +3844,14 @@ sub process {
 			     "Misplaced SPDX-License-Identifier tag - use line $checklicenseline instead\n" . $herecurr);
 		}
 
+# check for unsupported SPDX file tags
+		if ($rawline =~ /\bSPDX-.*:/ &&
+		    $rawline !~ /\bSPDX-License-Identifier:/ &&
+		    $rawline !~ /\bSPDX-FileCopyrightText:/) {
+			WARN("SPDX_LICENSE_TAG",
+			     "Unsupported SPDX tag\n" . $herecurr);
+		}
+
 # line length limit (with some exclusions)
 #
 # There are a few types of lines that may extend beyond $max_line_length:
-- 
2.51.0


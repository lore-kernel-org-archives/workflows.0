Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BE736C5A5
	for <workflows@vger.kernel.org>; Wed,  7 Jan 2026 17:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767805977; cv=none; b=dUvHrvVvFDhg2bnLp2hlqfezky3PbgzllNN5e+/ezSWwXzCoNbDgEQ1xqeqRMOXFxA6L4YF1dd1we/I20RIRL3deR1kbLDIMOnhDFLK8jqP/tyyN8uNQLSGh6U0lA2y9/4MWhAH7Xutv/3W2l/QbSxEKauPs/+Nc3ybTD6w8x6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767805977; c=relaxed/simple;
	bh=N0G2ffuDBbq7gpywhPKYxodelqUo83XYdwlcWpXg4Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ch3KjOIf1RyeQbWZYOrwWUbmEXzjUm8ayRzGq1fYXJ0MErz6YeZeSsKYbU35GVlC1B8UZRZ8dUIO19EyS4fAIjaox9DktRwSnJkgKhIVbLcnDf/5Y/N/pYZEoVCKbZ2x7LW0QKDDR3j6Dr0Gc/+EqYpOdsEVIp84lGUVTywZW6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N093k1cA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a8K1Euzb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N093k1cA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a8K1Euzb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607CsQhZ2239346
	for <workflows@vger.kernel.org>; Wed, 7 Jan 2026 17:12:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BhnC1bjxr1aLOi+Ek+VPvbB77/IQtQmkLcU
	O8GRpqt4=; b=N093k1cABGW2OOdeQRvGwlARqfhw4rQpyRh1/2yUxeFxcPGcj0j
	4iBJMWJZxZHV5GqApW/70CN2AP+O1DH7tNgxdlJ2k+KXRmaE88J2rJiXV2k6rVhc
	+YBZmDFkx1/zQdcDsX6rc6OXwvEUhozI+uhxHZXr4PIq/ZZCpxRF8W9d55/GSjw8
	Tbxa8fNZfiWq45QxEVpublEitrIEyO8PIYW7nWoG6iFOFVOBAWovz0tu68vedHy1
	0QFC+0ohks2uIN0Uvkx+KiCzuGCClMrAEozgADrR5OyMPYTZsw8n3nndeRfv0LR9
	eP1V1RYr03ZF6jDTh1gTz0L8Pkg+GKUgZow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg0utg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 07 Jan 2026 17:12:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2ea3d12fcso554280285a.0
        for <workflows@vger.kernel.org>; Wed, 07 Jan 2026 09:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767805973; x=1768410773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BhnC1bjxr1aLOi+Ek+VPvbB77/IQtQmkLcUO8GRpqt4=;
        b=a8K1Euzb6KNH+LgPPk9Y4CJiqsHMeNgDiUErYxZgHxxWmiiia3HFY05ODl19ZWDrkf
         1PGMDnWP+wFBsCxCGloLkaoI+ZOEoT7Y75b8oip5WqZgVxAYLzr14c30I23yPzGIhNcA
         4wUAHk0wNlmfLYJvvzqjNgQSzQP0H2SPGRaP2Z689JmchlhM5tAd9BzxLo157JuXlk3A
         uwG7zZq6lthf42bJAcBFO2IrpswmnU6pJ4rI3+N217mUwOEEO4y/pwB1e8m2okv+7Xty
         hAlpljnsguQdTa1y5P4PORoJdFm+1ZBr8MVs4QH8u+aEbuT/9itfxN+s5ZFe/MqYjHkz
         Vsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767805973; x=1768410773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhnC1bjxr1aLOi+Ek+VPvbB77/IQtQmkLcUO8GRpqt4=;
        b=Vy9o8gTicJFX/VXdX7VLmorFKT4hFnDiEuRyfT9tjq8DfdleKjip2MacDesi3T5FiT
         B/13jmLrMrT5cY9l22yF91+VKHbjbELu90ZaJvy9wRYv+9ZZA59SuzSX7ZIh9U6/Q1I6
         /FX0BJsGSOxq7PnyanGUmv0WxUsfnh/vPfaY78lyHTM6FglKD4QwFG5BpIjV36cpJX4+
         1pi3NLtHUX4m8cnNciCAg7LwPOZwr1bkwVhy5K1HUNhpFONn96eJ1/Bbtq9Wi78ouwZp
         YCcw2bwFPCP8K4FUlbmDxdgkehTAhNtoIDycdnX54xR/NIklR69CN2Lm75tVZamCpSli
         pO+g==
X-Forwarded-Encrypted: i=1; AJvYcCX7Xl+UxwZjuT9uG46kfJvhP75T4NE4oQqqG6H/jsopVQQFQqlDaSY3nrcuN4mwG/ncdZtbBdi8yVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rSckgiujMHEgBwvsOJroq9+zolXLC8ijtzAx5bY6xBI3om1w
	XWvdIrpE2CMgs2gxq3UrjTuOXtVdKIx7zVD2g0968Q21bLHxYWFdOMnUTl6XPErgkqYJTwiG3XL
	84TombUBhKZk3Ml4FzqVuAvzUVJsg5gFCRQbKG4yhzBohie+5I5YmwFYeb0pM/gM=
X-Gm-Gg: AY/fxX4RbLdWZLI1S5VP2vZa+8Hl7s6tu5NBEVV94jTUT0WNan1lownyMlJX1X3KZd5
	kkRj/HmGi87YRaOe2mEwMY0WX1a76sr2/ggeOfriFxHQG74p6967WfT3qa9k9SfpPDjzGy455oJ
	R6pKYwRa9OGUiLo+k2x8R27dzixDlrMINc1aTaFJTLAA/14dUF9IC/eSXt/6Iiytf9jeQ/uIaeF
	WSBzAEs4hQewz6Gfs2oK4nRderWcacfQqqGLl44Ieg2wWUm1BhX3B6R3pax5kFgfj0sCGI52+om
	jgU8QU/GKdql8HMDDXB4LFony6SR16yHXkTvboFKXMq51JwZA825r8UqwLHu/SK+Thq0NuQjnXm
	a9//Pzekpfun3SYN4LUClXb3SHQ==
X-Received: by 2002:a05:620a:298c:b0:89f:764b:a4aa with SMTP id af79cd13be357-8c389368df1mr410775285a.18.1767805973268;
        Wed, 07 Jan 2026 09:12:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLq08CZ8nR23ucExLb4CvsXiIo6kX5gKzzk5m3Bnc4mP9c5+jrDXuBenuswHmQfCHvBHgBhQ==
X-Received: by 2002:a05:620a:298c:b0:89f:764b:a4aa with SMTP id af79cd13be357-8c389368df1mr410770885a.18.1767805972725;
        Wed, 07 Jan 2026 09:12:52 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d4c89sm5013433a12.10.2026.01.07.09.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 09:12:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] LICENSES: Explicitly allow SPDX-FileCopyrightText
Date: Wed,  7 Jan 2026 18:12:47 +0100
Message-ID: <20260107171246.242973-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=N0G2ffuDBbq7gpywhPKYxodelqUo83XYdwlcWpXg4Hk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpXpQONpIx8JizfVZLFVjxx6DLOMsYGW8KsBkpa
 qAMvsTQAxaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaV6UDgAKCRDBN2bmhouD
 1/LiD/92HMWwthUq97pAgrlmQK2KTUMQjI9xM8nj8LLUUNsUwbFN3r27YcK9rePVTFHJ/zN5sWB
 cly/tUfSL+BxCpmm6bAfN3UYQESDPPl9mXRI7CxoBVxLax0+pyEtUThr3efoWCFDNKfoCMCTOIZ
 M9Uk/bs2QH9zQEXqerzDItocxG3uQmWF97/NFmMWVf5ehWLVjsl7X9IuZ20QnW7gx5WdB7GPalN
 hFNsBnCJTvGXxVBL18k0oAFbBo5w0fTdTt/j+naBjpbv1NA5DrGpyPoe5xfs/wRZZusyX7uOLjU
 N8Q3ULMTn9zGOU3w2itOFTh5cXH1W/11epzr9pDrrF4tJ0TFC6uS+x6kMkClIdfS+ds5DhdPnG5
 J6BrnYHLXWq/Jx/uSVQm4kP68pKhUCevjA5wC+n1DpApFGpgR9J0351hgzmA2Bjqe04OL/P17BL
 bg7plkzZCQWcI07zR3d9Owmp8AGL7YJrE986nITr4A0ienJOxvodLSMQnVclW8UhtbiL4gcMrSx
 hVsDwlB81FUhIbmMqSQzNaaSEFvOZCGYkK/mBr2yI0XljFoZDl+8a9WouxnXzgVTi/214PHmoqF
 s7HzuOJ0C0BIdNlysX4O7GHLRO3oPXsHJt7uTTWgFbAIepIoyyDTuRKobcIHJCWpTHVcS0ROdb/ R4X+yxCv2lZz9Hw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5vzdqJ805C6lZFXaSuFIp983mlNmeRel
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDEzNSBTYWx0ZWRfX/zkZLWAVMPAJ
 SUZVj+EanerxONIHvus3OGokm76vaF3R2v+6xLt5LU2oxON7fUNV32fUpNGEmLB+7Qg3NvEKaAA
 qGv1Un4zXwjgr3lF/GF4hQfrHrqMpRdJ5v1VNiEyP54Jdfyi8hbpTfyCoAPYGQgErK1e9bldHx7
 6ti2rntR9kyqycYWexUKYxP4yoB7QvCHzOHLsTy98Zn07gzG/o4pe79NZZwMkANo4ES2KIBClrw
 5taqUA5TYMrVI2MsfhHD8toVst/vlbx7AjAiUlSgQQTz5ppCetBedVGan6A3FLIsMo9ud5GcJ1Q
 9kZaSkFRDjWSWTIE8nsmBMt/I4WUgxAvEdLq4bCWUXrg/hHUvqi2Bs8T6C1bPAI6zcX0svL9xIs
 siLdFvc7EFqywcFK1jDrqInfeu/pJgCXXDL1bCAMx24ZYXOX6iWlsLsMWjjiSR87b8DdQ7F/ppW
 U6SpGVhGpH7OPEgV7kw==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695e9416 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dRIqDbwSeJKetXV8Y-0A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 5vzdqJ805C6lZFXaSuFIp983mlNmeRel
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070135

Sources already have SPDX-FileCopyrightText (~40 instances) and more
appear on the mailing list, so document that it is allowed.  On the
other hand SPDX defines several other tags like SPDX-FileType, so add
checkpatch rule to narrow desired tags only to two of them - license and
copyright.  That way no new tags would sneak in to the kernel unnoticed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Other way would be to remove SPDX-FileCopyrightText from existing files
and disallow this, but one way or another we should be explicit about
it.  Otherwise people will be sending more of these and each maintainer
would need to make their own call.
---
 Documentation/process/license-rules.rst | 2 ++
 scripts/checkpatch.pl                   | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
index 59a7832df7d0..8d7c0214f283 100644
--- a/Documentation/process/license-rules.rst
+++ b/Documentation/process/license-rules.rst
@@ -66,6 +66,8 @@ License identifier syntax
    '#!PATH_TO_INTERPRETER' in the first line.  For those scripts the SPDX
    identifier goes into the second line.
 
+   Identifier line can be followed by another one with SPDX-FileCopyrightText.
+
 |
 
 2. Style:
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 362a8d1cd327..98261ee97e2b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3844,6 +3844,15 @@ sub process {
 			     "Misplaced SPDX-License-Identifier tag - use line $checklicenseline instead\n" . $herecurr);
 		}
 
+# check for unused SPDX file tags
+		if ($rawline =~ /\bSPDX-.*:/ &&
+		    $rawline !~ /\bSPDX-License-Identifier:/ &&
+		    $rawline !~ /\bSPDX-FileCopyrightText:/) {
+			WARN("SPDX_LICENSE_TAG",
+			     "Unsupported SPDX tag\n" . $herecurr);
+		}
+
+
 # line length limit (with some exclusions)
 #
 # There are a few types of lines that may extend beyond $max_line_length:
-- 
2.51.0


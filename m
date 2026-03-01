Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71EB3002DC
	for <workflows@vger.kernel.org>; Sun,  1 Mar 2026 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772375611; cv=none; b=oYO8nWUBO5qNcMQ3OeIsoIe3zlwYQbtxgZFEcCKyzwyCQGvH8yzyPX63/E8ttNVe+1KK6c044LIMmup9Pq3rnckRX9d6bJKtHxAKungqrlNaeGD+1bLwZtTywvTJLOviJF2HCggejlmzvJknBxVXJRGQdBG4A079tk5mXHvoCpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772375611; c=relaxed/simple;
	bh=hepAsTbXOdpEQ283mZa1ve5BGe00kT8YrPrcvwQEyP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d883dFerZeggpHWsEZiSvy2r8d7XW57vwsbvELagk5pvEcu41ozemFC9M08Im9oXhOz/M94FOp7OjPf8YM3bWypGzsl+t99J23lFddGuOe2gOePrPoucBJTSH7+Oiu10EUdm06bn49HVmjNeUWMtIvHeIoxTNaLtjr/gtiONPR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2Rd4fxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JW7O3NLC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2Rd4fxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JW7O3NLC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621DLXxi1308121
	for <workflows@vger.kernel.org>; Sun, 1 Mar 2026 14:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9/PjmX8kfjwszjEJKsrBmKTogNX4/jmM1He
	eSPke0Fg=; b=n2Rd4fxij0+y7pqqH5fxhop3muag+bUZdW0LBeC6dK0vrjvv7B/
	Y8bwi1SueLX9rJpmYe4UBBF1zj1EBqNeGeB+r7Z1WAQwKbYVdPhXDplFJ8uF1ToK
	xzgLQmqZrcNAJyVplJulQNGeDKzQeZxKvs1ikMm6fQdujz3IjYUz80WDl7/bNpSk
	KvDG6eTjEl3Pwepv8qHoFMvXE1lEwNIkH/hbsQl4ZKA7JugeVg5cbsKIynJN1tyJ
	HEys2IKrHt0te+1TWokvdi7f3/pGvGwseOSHM1U0yIB4EVOTpbMhBfF6c6YHPjWr
	eD5jeXTPw/hhGHfKdQ5KTbSdE+pyDER5LLA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgq2ugh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Sun, 01 Mar 2026 14:33:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70d16d5a9so2838028185a.3
        for <workflows@vger.kernel.org>; Sun, 01 Mar 2026 06:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772375608; x=1772980408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/PjmX8kfjwszjEJKsrBmKTogNX4/jmM1HeeSPke0Fg=;
        b=JW7O3NLC+OBU4/bOaDhdB8mizq/A4R/x+DAKF9GAcO4vIo4/nnFNrgeoxgYNmuV5K6
         ROUvxdo30F0Q3mCixjm5bJ3l0LPnpe/rIpfJpdvtGnmg3wjyjwrQo2543ohGhInRfECv
         5+JxU2yRar63HB9IcSaA1bo0EGV2HCjvGecPKiJCzBG404mYDsNJGay4FscYg2IDrfzV
         G7Few6Gx8I6o5INjF6O/cgFhCv1wPxqH3nD73xXK1xF6a1xnoEd+JtkQwsKgTF2XaAKa
         /A2dzP/rVU2yUUmk5EoYXhhc4HmIkz7uvIzrSLo8FlzedckbbDVYSZ2Vh/1jIJqx0QVB
         dgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772375608; x=1772980408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/PjmX8kfjwszjEJKsrBmKTogNX4/jmM1HeeSPke0Fg=;
        b=ls3K/ON1fMlP0CeRUctCGzbBlNow/dNcG4d+bUvwYi4dGR2AjDaoej0Grv6vVM+NPE
         73p+Gy/3YVPdu6LiM/oUXi77daHYx+uos+0KQL8p13pS/uijo6U3N2Zg5a7LIRbKY8ub
         z3rCR4GKxtD6/9PZ4lmk19dR1I6ECmWHlYoLeUin5e1/228Rx2suuuZ7tPmSFw192Q2K
         2jxiwXdVtI4C8uMwGSV7qsoSrgt2iWQ7i+iiQ62KwIMnpB2LMeYOi5lR0NKZoZP7/hx8
         FH+TA72TnrkWRF7CVzlpGQDqTCQsduu1JxMnVC4TsX6T/+Da4GPUU1gYTK3+Ff6ggJ+d
         tD3A==
X-Forwarded-Encrypted: i=1; AJvYcCWNqUkd5YBPCOA2+FMcpRk1Bs3kVG87LshBakovHQNwBMAjdygCDay76LKQvPpuGkUn+J3zRpZ5jSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA3VjSEUk8fVWC01Gqpto8TbWN2noGxX9x2BZqOyLuNT6zak6t
	Je1jj5SXxRWSdKfAcCKFBl0riOtmVMJu2wZZ5bvcYhntRNFQHQy3UA0QLaayHedjriZBGpCVXNP
	oSl7hZytZmSvHnSiovtWJJWX4SjQWxK2n8dvosy1a4Lne0H9kZ4OcmFvNW1JAXSA=
X-Gm-Gg: ATEYQzw5ASIjeJaPT//jNg/oSmWm4/z8qWdugX3NCQ/1Nv6WsDe13utyaySe0bY0Lro
	cD9cp2qBR4r7ezIOxuxTnM2PXi/WRiGwF2yUAlpDaXB6cVoTnqhZT4Wbih+yI3HjKRlVODl/PDa
	5aoSEByarEykwHOrsdkzS1R5bXgzrjCuCWnCV8++IeNNWVSb+DuwEKtFa28P58d/p4dIOCwvw4l
	keuPW2PFMlgNbCD1KAGLT9lo2i4u/tmyMrvqL64flZqYzv/grtuXboEkWHujp0bkVXAPWV8nHzM
	QWs/ltLV1YKwSZVydTSHqzMQd89RmcPlfj/HqhjQhXb8S3npIy6pfImReHwvri63x0Y2rthRWPF
	skj1WzPlKrpD6W8qJfoIgvPaXCW5WCm4jsvxn
X-Received: by 2002:a05:620a:190a:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cbc8e187camr1065906885a.59.1772375608084;
        Sun, 01 Mar 2026 06:33:28 -0800 (PST)
X-Received: by 2002:a05:620a:190a:b0:8cb:4d05:aa43 with SMTP id af79cd13be357-8cbc8e187camr1065903985a.59.1772375607546;
        Sun, 01 Mar 2026 06:33:27 -0800 (PST)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf789sm110700135e9.17.2026.03.01.06.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 06:33:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4] LICENSES: Explicitly allow SPDX-FileCopyrightText
Date: Sun,  1 Mar 2026 15:33:23 +0100
Message-ID: <20260301143322.92894-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2924; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=hepAsTbXOdpEQ283mZa1ve5BGe00kT8YrPrcvwQEyP8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppE4yzr81YaW4Dl6FtLqzHGA07kx+X6aHi/CKL
 tKuVG2PZeeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaROMgAKCRDBN2bmhouD
 1y7DD/4hrk+Ktgai+hvAoEYD7rn8j2xWnIKtpFwdFmZ7xo0DXI4lDPcdXRmn0HZAYkaTkWVFG54
 KsFZxTnUm/KCAdmczjPDRCmsm7VRgnWN+1cTh80CQGEjGytoNOPCgaPBjC8cOF0IMc7cCFLRm6y
 EfaSi227B+Z6s9lfYazFSt6ZP4hIoK+zwSNUHVhYPlcotvJVlBCrSDF0fXc6XwHmOih9v+mz2L+
 DdFhpffwAjuBl6xJOGeCL7XT/dH6tBEzY/jKd4sxWihwyaMCkqZZMriSs+HkculsP3xpLb5xwt5
 yjRR1ydK3F8JoCCupJdHlwJooDVtxF9OD8vJC9hu795FaM79iTWAjWgLL/WR+q4alDzW88V6JAm
 sWyKiCLzfb0ds7AEr8WQc3WKTKIYK5gnW644Kfkn966CbcYHJBHCgJs0SU8pG1JFT/SpNxbEqwK
 JrY8wPSfTcRxs8++ivUN9KJx1JCIo/t2uilbGY4Ee5e/8K0qbagtsg5mEvsx57ZOBHbrqlXxcGP
 pdD80gLvwiIPBaBpbfhJRZJX9qbGnetT2GC0HXu60euZfGDrH30ofimlvBj8x5Ywf3UjGUvDyhV
 RBBxIgVqhc1ZfLTDyR4ykUeyCf+m1ZLmaV8dfpR+SFMJ0+QV2AROTqG6p32/5L8nC7RVTpyiZJv +zuO6gKljIBpUzg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LbvJdZIVdJBFDhLOhzs0VveA7qhwYW0S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEzMiBTYWx0ZWRfX5iGM5wpIoL/A
 YjbaY00hdhE121LBqsJUZyQ/nth8jMmxK2ZXEggFmpmHwCFXg3q/C4S/vvyCdjf2eoZRloVmBUS
 2c6LpNjsaS8+y63fOKiiZSepCesPmzqxR5Bf+HA6doVVIQpVzWMGZ+f2yEBT5CLpsbPW71DJWHH
 1yW+05PaNYcOQe5kpyTiAJAOJzawph1UvuM53H0RDY0yk2b6TPOUmwFPylHZyAu2QEtXVnv+di5
 ainPG4ze/CVPlKzH252imxsUoWFCZU2WfndkdN0t9s8CHYWN6JEmXr9lOtdqFcUHj1vEFaPnHQK
 z4+bedttm2OuXHkIBp6Wfy0RMUuNLLjJ4qxqVhUVagwpXJQd8ajLKQMwJRH5dSKUpdqsRutvVY0
 6N2zeYM6oyOBNuWAUDCUFQG1FoC/8lIRyiXjO/QWpeYhXX7op9dev/rvqN9w8TO/T0QBfusG4WX
 3g3dgM2pY9LvDVDzbpQ==
X-Authority-Analysis: v=2.4 cv=bdRmkePB c=1 sm=1 tr=0 ts=69a44e39 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=P1BnusSwAAAA:8
 a=ag1SF4gXAAAA:8 a=IJv9LcIfAAAA:8 a=EUspDBNiAAAA:8 a=_UQAGB7oVweOm72raGYA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=D0XLA9XvdZm18NrgonBM:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=cmr4hm9N53k6aw-X_--Q:22
X-Proofpoint-ORIG-GUID: LbvJdZIVdJBFDhLOhzs0VveA7qhwYW0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010132

Sources already have SPDX-FileCopyrightText (~40 instances) and more
appear on the mailing list, so document that it is allowed.  On the
other hand SPDX defines several other tags like SPDX-FileType, so add
checkpatch rule to narrow desired tags only to two of them - license and
copyright.  That way no new tags would sneak in to the kernel unnoticed.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Joe Perches <joe@perches.com>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Other way would be to remove SPDX-FileCopyrightText from existing files
and disallow this, but one way or another we should be explicit about
it.  Otherwise people will be sending more of these and each maintainer
would need to make their own call.

Changes in v4:
1. Grammar - "unsupported" -> "disallowed"
2. Add tag

Changes in v3:
1. Typo "or multiple"

Changes in v2:
1. Doc adjustments based on feedback from Greg and Laurent.
2. "unused" -> "unsupported"
3. Drop redundant blank line
---
 Documentation/process/license-rules.rst | 7 +++++--
 scripts/checkpatch.pl                   | 8 ++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/license-rules.rst b/Documentation/process/license-rules.rst
index 59a7832df7d0..b0176bb8a465 100644
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
+   The license identifier line can then be followed by one or multiple
+   SPDX-FileCopyrightText lines if desired.
 
 |
 
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index bec7930cdd66..c0025d2f5741 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3856,6 +3856,14 @@ sub process {
 			     "Misplaced SPDX-License-Identifier tag - use line $checklicenseline instead\n" . $herecurr);
 		}
 
+# check for disallowed SPDX file tags
+		if ($rawline =~ /\bSPDX-.*:/ &&
+		    $rawline !~ /\bSPDX-License-Identifier:/ &&
+		    $rawline !~ /\bSPDX-FileCopyrightText:/) {
+			WARN("SPDX_LICENSE_TAG",
+			     "Disallowed SPDX tag\n" . $herecurr);
+		}
+
 # line length limit (with some exclusions)
 #
 # There are a few types of lines that may extend beyond $max_line_length:
-- 
2.51.0


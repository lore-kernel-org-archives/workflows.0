Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C2D32720C
	for <workflows@vger.kernel.org>; Sun,  1 Mar 2026 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772372467; cv=none; b=ftsC4Td9xfj2QiOnuywy9nCYKKhY3srcFPYr5VF1GXajWPBeMDNai2F3o+DK9mcWK2WLiYQIzpSOYYxoMQ5I9AITC3JxiQ33hQ2ok3789HRIaogCOgChL2ak6Th/3kh56X6CQ4kzRNS7peYLS3yrxk5uLeWpWYWEgAKR2bOt/0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772372467; c=relaxed/simple;
	bh=+ES5/OC/9LPBAa993HFBienoS1osDIOASawAF5IW9TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R8XyVeUiTN46rEGjpTNwuUTTjqCcUsLLHdCwuuD6zXYy6CpJwNAGtE4fv7hwSUDDeNcm9AlTrRqGrxu1O1mckw4CKX2Z87Z5RPN830PGInvqVo7rlGqXX4FGfyrNa2SP+3KDro5+jYVsahCkWy1i9/rpocvg9+fzV8gvc6QQF8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Td17FqzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQms9avH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Td17FqzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQms9avH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621Ac89k1330592
	for <workflows@vger.kernel.org>; Sun, 1 Mar 2026 13:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=7xlenVyuNtjntNFqpEinehs1xY4pgd5f7lk
	7THeCl2Y=; b=Td17FqzEfTGEK5beOqSpZBhpp8WhB9khRw+FmgBOWe6ZUeRw5sm
	4W2lxDTnRfYKuPhAXvstaTfGgxbNVUxMdbplh2UekKWxnhD7V+5P9RvN4erbjaLe
	ItxjsPeIpTQ2D2LeJfEkL6zAnKZXtPToSBsTBJWQD5ABxvD2r6us6Ta1/WwPi++H
	9U0PzHC2q3zbuNAMkQZ/9o882mwqB3pGODtVly1dVu+UrdVRG0NceTyVtDJasRjc
	nXJo8wIHUu/tEM35FxtCan0iBnStCXANbw6/DtKPMbKFPBKOp5fHeveS6BTOgzBJ
	6rnYTS6N8Pp26f1UgfUoiJnRZlC85Ga0+pg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbaredu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Sun, 01 Mar 2026 13:41:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3ad1b81aso5134423085a.2
        for <workflows@vger.kernel.org>; Sun, 01 Mar 2026 05:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772372465; x=1772977265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xlenVyuNtjntNFqpEinehs1xY4pgd5f7lk7THeCl2Y=;
        b=BQms9avHRMozheEVje/NBX1MxSJIFEmNPwmcecGNeIDQC06kOfJIuo1HlNkDc7lFxz
         MwWQtQ4HLDOY7Tug9tyYKroRdJmyZO0/GDpvMPykKfWy0B96JNB7w8rhwQmVB2FIDo/T
         nVyDZK9YV6yTpFe5eMpKk8a75SRtt9QiUMwhQIyUNpxABtxFBqPCMpRnqSv0tL2H5fZQ
         6f3xulFY8HnSWX4TCRzoxraen7ztGnyk5IFH7Rumq/RzC6ODsQ8tQfEf0ksRRyoH/QfJ
         KWEcDjzp5u/sFNRsPUA8zKfSIIWrAZ7jqR4Df971k/FItkmtMHwbMppAHIraHnPdN/69
         l8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772372465; x=1772977265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xlenVyuNtjntNFqpEinehs1xY4pgd5f7lk7THeCl2Y=;
        b=aer8Zlg2IZ1RQJHzLx5few5myVLM1NVC3E4j9+lfHCDWWx0kq5hIf5m9JwbA10tekF
         diNNThO0a84oqOVcYVg42OQ3F7f8BnjR3tau9/enyKPZLvtW1elWncr33Zxbcd6EJ0d2
         o6l+1ud/BrK6syqZnvfIRPEz6O39pAMI2y30r4xofm7Nx5tHXDXJ2LnNe3b4WlCDFLrG
         VHkGto5nMfpuNki2qQRQYlePxVtNYJvQJZTim9Dtvrus2O0itwxvjezfSLaXXpSC8GJv
         MjiQJBzhNqGX9MhRgDy+py9TfkWT2AxD7dCQ2Rp2yXeeYiaFv59mCu3h1UbNesO2Zu3c
         ir7w==
X-Forwarded-Encrypted: i=1; AJvYcCUgwb/n3VVVcsXguCnizkD1/lcflE9zyyPfUCaKYErXrxxjIFPhXzbdSsj8aWkQ4gMvFA4HqY7G7LI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSOV32Adfr+LtQIg/SgNCWgamxuWwTsNWSX2ZvZT+UCH+fUkxy
	WTLJZXjUsmJIk/cBpqFuQy4sVogp9ijw3a1A1oG+7tJMpKUUsdD0B091DYc/OaLvjM/+fgfpFFJ
	FllraEUjJ5JRsQtrj7PXUlnrymTR73cwLPK5f8+kmxHcUAcRrnv6xkSddFtrF6g8=
X-Gm-Gg: ATEYQzxBuj3XnhVYJz/2FpOH3VAvGEdnJ1kboWRRgjTaMP2bV3GX9HsazNxB4cwvcPt
	4tuekFY+yl0ZDtgRhTyVGU0Al16U4rj7s7n8N/xyjNYLPpSEBILyViCpr8QdhN+L95MFlbL/91F
	+94W5IOeVTzz7RHA7StR6ST6zd0xpsur7CDiEhJcwUrJADdN37iF1b6jCle5lj1yBf8B7nkFsnI
	llnvKvjmjNl5Puf2vAzLKFwkmtZ3DoxnHMMuR71qiEz1eodT6tsyZf6NNg1GjAL5PFBDfP/b0zo
	Eex82hfBEgJ7mytpOMfZKrSCb8k5fL78OWOB4aWv3cOAfiqADU1ETLdxSfy/KKYsbdpWljL3nkc
	cVbgt70UjLZW4G+fd/O3H17jq+5iXJUT3UlwL
X-Received: by 2002:a05:620a:2947:b0:8c7:1986:6b3e with SMTP id af79cd13be357-8cbc8def8camr1140377585a.32.1772372464536;
        Sun, 01 Mar 2026 05:41:04 -0800 (PST)
X-Received: by 2002:a05:620a:2947:b0:8c7:1986:6b3e with SMTP id af79cd13be357-8cbc8def8camr1140374685a.32.1772372464007;
        Sun, 01 Mar 2026 05:41:04 -0800 (PST)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abded86esm9847067f8f.6.2026.03.01.05.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 05:41:03 -0800 (PST)
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
Subject: [PATCH v3] LICENSES: Explicitly allow SPDX-FileCopyrightText
Date: Sun,  1 Mar 2026 14:40:55 +0100
Message-ID: <20260301134054.44229-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2790; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=+ES5/OC/9LPBAa993HFBienoS1osDIOASawAF5IW9TQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBppEHmK/0xzDXEFIefYYocp9laE66FRSmlk6eBm
 Juur/xk0vmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaaRB5gAKCRDBN2bmhouD
 18AoEACHaXDFDxGawaFu1oOLvwIynprJbUpmMovJXVw6SSMjRFIAUQWKJjjBO3NoegzdynlrPe0
 mEl2Vby5k+zfFJVXeqLrBt1RaeMNSL1G0HPcPc0XYnPrBEH9FvzCtMdxjrWlCc/TwB9R0F6Dy9a
 zvMCZq5ShdgMt8bigrJ8eiUUcc76aF/q9/r3mVNbpxx+QTG0DCtBVxBYiTfL4dbGyjPV6K1NWK3
 lAnkS109Cky7tzkK0Q8t4pCa3kCGELDLaVEumc51FXPncMYHVAOjAZZTlbfqFx93a9vfHKfmPaW
 hjpp7J9+uqiDVlERI09lII0KofDF6ijc/66yh3zpvVG44lVcOWK9AWMJgf+ZeiQa3CNAhVHPPd7
 IH/2SEAndxQDLUGQTKeqBIlTFw6erWPFCvEePGQ+XoC7BWDOuVSU5GdJAfDJS7NbgPszU+83gRv
 9Bs8zxSNMIJeDi+cOW/7dKoJysohNRzYjcHKB1K/Jnk6JycuUjrzFWzUqfO0JdaqoNxv5ClQTDl
 Sueiq/KqkHpAgvbGyQDUZsJwjtl6c/faxM/8JiKLx+WyywSqxy2cefSL4bS+yzpFJbYafoed9EU
 wiywXGHl7t3Zp8gYTYDR6G7W3hZuDFZikCXIoQR5+L7PkT5kAfIvD8jqoBtT2gzs17OIKvhif4J 7k9/VDjmwQH9pHQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEyNCBTYWx0ZWRfX2D1EqItApCx4
 i7ZaAw96bWfh3ExT4g3EzsmSyxdlu6hlAtXb2ElBz+dAZr51jzU9BS15iea7ewkmRi8Z3tPoRFK
 SIv4HOAxXh0/Ngvh4tsaPfAYkQm7GXiJ++6sCyz6Mae06AWT5mZ2FN4jVZkCtfcj2zlSGhyhWiF
 F0LqGAc5R0Z/PHCcVdGs9SlwKmcvxIiD5NCkAb73SQ9QWqKxecnF1Lh5Zz/mL0SP7vyvxZ3LZqM
 5Sdo4osH54uWvKB2DKTJvZ3oEycBo5E4LGWyKaRvFgr1LqjObX1kt9V08yTSE0Kqwsa69gYi5RB
 Np8NO9ReKDvv3i2Xa4dQQ7m8KqyfXMsogyoZLAzOsFl3k+dJl4E7hQe2HtwluXzHTPFqkmmiDaR
 sZarOdRIQXBCC7r9SesEBPHgtbk3rdfE447nODTsh2KgJHNVJSTSisNzVIQ0uTIfj34Hy9uoMDw
 iT0QGNKfrsEUHsaOVSw==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a441f1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=P1BnusSwAAAA:8
 a=ag1SF4gXAAAA:8 a=IJv9LcIfAAAA:8 a=EUspDBNiAAAA:8 a=_UQAGB7oVweOm72raGYA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=D0XLA9XvdZm18NrgonBM:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=cmr4hm9N53k6aw-X_--Q:22
X-Proofpoint-ORIG-GUID: I80OVw13UAd_1RjRZzrxFkXFPOu2WLv3
X-Proofpoint-GUID: I80OVw13UAd_1RjRZzrxFkXFPOu2WLv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010124

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
index bec7930cdd66..e317cf2ffc58 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3856,6 +3856,14 @@ sub process {
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


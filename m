Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A00D1C5D72
	for <workflows@vger.kernel.org>; Sat, 16 May 2026 12:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778935140; cv=none; b=X/9C4TnCu45ZkaVyxBqACQXWU7FVh8avwp/YD4Eekoix0fcrCMtX52V1g0r6nUAnv/U5YisaxaT6+R9Pf75uKS7qMnRwwzx+BTBjuNsdGLupv8Z1x4LH4pP/9LC95ic4K5OU0GnawgHjHP3YA0Ond2Tc6jGNAyT52fTcCfMiE2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778935140; c=relaxed/simple;
	bh=XownEF1ZA8+BZ4so4kFUJoSB7ccyVoF2TgIsRnoeSVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3QDY0/zRrc/wnf1GMJCEn5Yl8Nu4ByivDV3ROwExMlS1iZLmzMq1JuX7H4c6TFqA/1jd1v23U0YCumTQUQ/3D/3b1NmjAFhcSYf1pW19p9Qw0QC4c4sElyFfuCvF6PVbs6xdR6vaVfKoF6J11U1gAK94eEiJ2WgHGo9SuJcSLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1UZQFJs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bo7gfyuX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1UZQFJs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bo7gfyuX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G4dXZP000716
	for <workflows@vger.kernel.org>; Sat, 16 May 2026 12:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yI+hkDJTFWIfUgvVkqhcukRSCQpMvsqvvsX
	RaQo4gg8=; b=n1UZQFJsW1iLB1o22sqN7gm7ymb0y7jaiKqqVls0qw5s4vtr3l9
	0WCkLOfnFtiit1XhvH/KLnpWQrvNO9XbEC2DgEAhHYWop0mpB/7NLr+ZWykJmRXy
	YcWW4qGk3K6qu3/ISF8l1DoJKif53RCmAkAucgjPrUsuStD8sVe1u/pWoWusptfk
	RLc3AKFBx28/e0SFVoCugsn3tnVilo2mzPtO2P3pUH5iWmVI1q3LxuCt7IKfSA2y
	fsmSSktJQnt3Glq+hfvQOjyhbtxgcLf/gfhuXHVsNWQim32J/cS4xNqCvUMaIWvq
	GtfHrQMyzq/xNJTh1YMISP7dQSonDtub2fA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hrggrb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Sat, 16 May 2026 12:38:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90fb1490e2cso217356185a.2
        for <workflows@vger.kernel.org>; Sat, 16 May 2026 05:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778935137; x=1779539937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yI+hkDJTFWIfUgvVkqhcukRSCQpMvsqvvsXRaQo4gg8=;
        b=Bo7gfyuX6+fXNlzSNf0F8S1MYJLbeId8SvCW0z97Y67wudw9m7xNX/P9xyoZO8/+J3
         YHgrp+/1bE8lsK7DNKV5UhSlms3PfDIT2aTxh0uYkXc31JSIedEaU52vBHg3LLwnQ2nN
         qhqSofNFT1Ege/WQefbWEzxIPqpGm3/Qi78WEHHOAqWUvE9UDAm8wOokOeMFBsaUfdNE
         7Iqgu3rLHFGPr/8APd4AR/s47JNOn0drbhX/tETpR4tQJwHzA/ii3STBdXx9Z3e8Ru7o
         PoiZJotnTKWNfVRtHKQzhiGRR7X69ntw44lec5rjwaor89ydjy68J0MUMhfngAzaz9xU
         xFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778935137; x=1779539937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yI+hkDJTFWIfUgvVkqhcukRSCQpMvsqvvsXRaQo4gg8=;
        b=Rw5p7vUsq7puKM4VL4AGvlgnEBJJca8CjO4xSTvxCjquD49RZZA2wMGvxSAOUbxVj9
         oyFyBqcrB8KxYpkGWGz08oVy+GNApP9rD3ciwI/PtksiFMJZ0dc3QMG8vbNl9p9eOAU6
         uQ4ZYg5n5wo3o2i8pPrN/uvoLTDaU/0j6a/j8zYMPctnM+cOU7fOzRax92jaP9jjU5p3
         bcySqm8AxPzstDdLSWA1lHwk2WcEoywGdbcyewpPTLJPHRdezJuZT8A8X4333puYJt/X
         fCoaZGrV7z3xuZbnCzHseISRS0mEuepCKTzygBDX9lGHEkkwbJVXg0w7m0YeKYtipppz
         l/HQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RLAHrCAigoK6/4lo+PfRCJtwS1Fd9LjMYMirHwgf1u178IjfBJqr9uzB3DJajdTIp36sgNJk01C0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMqVADmkRmuwLNXbug4tb682D4BLNOO1g7zrm07wjD67Ino0N
	v0IT6rvF8aPWLRJe8M1DV6SFjJIszWny3/BljIeMn3vrcEZROXTnVgyfIpflqMZ++nscnffmBJq
	msMCBG9wIkyc7POALCEcrg5kmCfSYbqenMbywGulnANEDeRrAZVAeihty2tqCm2U=
X-Gm-Gg: Acq92OG08QpLT/lIs0ebmc5C51oXVlb5ZaG1aTygzTrg2LJL5yYu/nzJBKOuofSbbIe
	tJJploNvRVXDBkgqSvXgoGQSqebpx64C888ExnCv+e7m9hhRaXIfOIT7REeaFthKex+IoHMzPkC
	wgMOasGFJn2ZpKQm8dsLGBhCMkqkH3g2+ClsjI7uSZVOe2Dw/IJPu7spN9QkrH+CkN8wz5mhTwQ
	gQNr33bUM9Y97diozWL8mjS0QEihbmGkOPx7NZFycW/Wu6buPRX1gExpMs/J1fUbCOviI8QvAwa
	eRhx3Ix5ZxT0lhqFv6r2SqRtUN3p9ufBEB2x0ysR2e4iapFKxcykODMY6wJznNfYIk5/EkfKhPr
	vy8eRDtH+c2gZuKjSFbkSRwSuq8a9PcTLQavQ
X-Received: by 2002:a05:622a:5:b0:50f:b81e:c663 with SMTP id d75a77b69052e-5165a20bbd0mr116096611cf.40.1778935137529;
        Sat, 16 May 2026 05:38:57 -0700 (PDT)
X-Received: by 2002:a05:622a:5:b0:50f:b81e:c663 with SMTP id d75a77b69052e-5165a20bbd0mr116096011cf.40.1778935136969;
        Sat, 16 May 2026 05:38:56 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe661e1sm36867215e9.22.2026.05.16.05.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:38:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vlastimil Babka <vbabka@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] docs: submitting-patches: Clarify that in English "reviewer" is a person
Date: Sat, 16 May 2026 14:38:47 +0200
Message-ID: <20260516123846.63413-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=XownEF1ZA8+BZ4so4kFUJoSB7ccyVoF2TgIsRnoeSVM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqCGVWgOdJBmpcR1EUc81fTjGqI+PwlEiLtcipB
 3Cdyovlra2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaghlVgAKCRDBN2bmhouD
 153JD/4wQ6vQeXwCR4wuMqwWJoKGxC+tr9Td9WFleL89/wtk1PG1ebQmC4Pc0aESUDN5LvXgbVM
 1UVbsBpFd0zjOH9k4/X6ly2tU/+IhKnsbnKgYSrz2H/wZs/O73/Q9dR84Xf1puEhoLnW9L+BN/n
 4Fjmvs9NcK2eSxVOFm7omFg3yJL6wRUDMAerBX5nlHeag4u0FKeWdLlL0gTTuFUFxTQE3yGRbRb
 UYWipXNyZoB0Eg9rdhGY0/ogETXIRjw9x4UNJ6J9mRGt4Ogx/DJfXz4jhjPZXAwMH12FkR33oll
 YOp/9wIGq+oClecDbQamHEil2sKsdt1zEj57xVpu79IOS/0BgNKnPZLCJOqK0km7MQzbwP5EPZw
 9pphGsGYmzvjxU5+gm/Z27K1VIVKzcaxIXoeKvP1DdCUhGPhwFG2Sozly9doh+C8pW5YnuAMAJo
 I4WcaN+O+bFb4MVagH2Y+5+se2XnRZ5LK3stVJnCAFBXllYwL5bCFw2v1YY7LsuO3gRjTlBdA4u
 kMzhDCU5H6z5SMyICuRGuqeDpvN59zzvV7SiwUaJb1avTX/2gXZLIrGnnSGrsJicAELhLrDB8KU
 1EHo2Pp1Fbpluj9/mHwAiNW1JsSXF0QCrRsCLsJUKfgTXFBuJigT68viMYN0Qd06QxJ5Z7Bip4D CV3sXK1kLPWJiwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cdIceHKfkGRF5kzuiJXFaKytKFUDnQCs
X-Authority-Analysis: v=2.4 cv=ApLeGu9P c=1 sm=1 tr=0 ts=6a086562 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=1Qhj-OTkAAAA:8
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=ag1SF4gXAAAA:8 a=Z4Rwk6OoAAAA:8
 a=EUspDBNiAAAA:8 a=wap1pylHR8j5C7hGLnoA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=nlm17XC03S6CtCLSeiRr:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-ORIG-GUID: cdIceHKfkGRF5kzuiJXFaKytKFUDnQCs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDEyNCBTYWx0ZWRfX04C1bklRC+YG
 i+9EoCFLzLSmdRU+AE2WjyM+uBieRWVXvXxTGfrWwKtSIgsYxldtz1wNdlGfmYs0wVwyd/lX6Pv
 sMJ2E6iLEs5LJPoWGCCStRTdvhsKCjr6HCFxGOFH422ylVZc9Bex1PWBl81kQ8lxQZMnSb51Y4G
 dT2xG8RPOThS0x1pdBTwzjoWXo91kvnGuJMvCPij5ZAxvnofJhBdmJC1+fqXiyf3qZujernsumL
 OTf0uixSEFbiCBA1zyBt7ceexhUUI6gm8aS15kctZfOP14iy1rLzz92iAt+UcReXsLjZER7sPQp
 3OlIRAdSyb6j4c9cw85CRGkzeIXDqIWUlt9EUMdzlRaipMa8UuULFWcBTUK/IBFGelAAYYhoaUN
 m9zZmJK0GzLyrSMm4gXME5IaNj8rm9GI8a2+/s4PqhVstr/s7tvNZDza3Bqd3te8vR/9iwO/doi
 41ID2m5AJlvXOoPeRkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160124

Common understanding of word "Reviewer" is: a person performing a review
work [1]. Tools are not persons, thus cannot be reviewers in this term.
Also tools cannot make statements ("A Reviewed-by tag is a statement of
opinion"), since making a statement needs some sort of conscious mind.

Our docs already clearly mark that "Reviewed-by" must come from a
person:

 - "By offering my Reviewed-by: tag, I state that:"

   Usage of first person "I" and word "state"

 - "A Reviewed-by tag is *a statement of opinion* that the patch is an
    appropriate modification of the kernel without any remaining serious"

   Only a person can make a statement of opinion.

 - "Any interested reviewer (who has done the work) can offer a
   Reviewed-by"

   A person can offer a tag thus above does not grant the tool
   permission to offer a tag.

However this is not enough and apparently English is not that precise,
so let's clarify that only a person can state the "Reviewer's statement
of oversight".

Link: https://en.wiktionary.org/wiki/reviewer [1]
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I find it silly to need to describe English, but it seems it is needed.

https://lore.kernel.org/all/fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net/
---
 Documentation/process/submitting-patches.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index d7290e208e72..a989de43f3db 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -581,10 +581,10 @@ By offering my Reviewed-by: tag, I state that:
 
 A Reviewed-by tag is a statement of opinion that the patch is an
 appropriate modification of the kernel without any remaining serious
-technical issues.  Any interested reviewer (who has done the work) can
-offer a Reviewed-by tag for a patch.  This tag serves to give credit to
-reviewers and to inform maintainers of the degree of review which has been
-done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
+technical issues.  Any interested reviewer (who has done the work and is a
+person) can offer a Reviewed-by tag for a patch.  This tag serves to give
+credit to reviewers and to inform maintainers of the degree of review which has
+been done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
 understand the subject area and to perform thorough reviews, will normally
 increase the likelihood of your patch getting into the kernel.
 
-- 
2.51.0


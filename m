Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5313112BE
	for <workflows@vger.kernel.org>; Wed, 26 Nov 2025 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764145155; cv=none; b=YwusAVgurVck0hNTrlU1WFLBkRMrY8JSEw6MyLrcnHolNzKsBLjmatkVAGmm8mkRbBDTFPAIwxTbuP0Auyf19FfFfT+l7csjKB9GMtzgfn/0+maE7Ki5EfSM7LjLRABp6VFIbwNJFxRS7IDu99iPAQ7XmfKijDgq73BSjjxWuoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764145155; c=relaxed/simple;
	bh=Va5CGNuTjaQ+61C1Q+uQU1I3V3X/zhK8i2UpbXmstWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HsCc3DLu84bkHsznjaFj/KFipTeAihjPMSrmCmVZqwozOzZO/vL4dpaWaRtPq4a4ZtHmJZglZ6P4d4QuWlGiBhzJS+1K5TnVyjxXf3fNxdiV63r96p6dDYm8AHmfurlEfpdqFKjPzp9UWATZsoFoS4POVguCJ3edGPUHpDRUlQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jBpW+AaT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NCHAAFWX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jBpW+AaT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NCHAAFWX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APNM30f4048329
	for <workflows@vger.kernel.org>; Wed, 26 Nov 2025 08:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IvDE0Ygyk+QKs5TPrEHv293vjQEPjkX1SpF
	BnjqqKBo=; b=jBpW+AaTTnUzeIYiryuMV+vXX/tmapTOJ6dJDtIOy8NhW/j6CKA
	hY/udiY7bi+Cmy8xugUTHmzKQjV8REgAMXDIqLvt8F/dPd6cF1X5m0bJ76ZyGQIe
	vnYGaRXS4BMmA3Y7FQS0viGPpF65VVdKAGCsarx7MqTwF5KxHA4/02NYWe94jDsa
	it3+eVNCLaKR7aNwuljHUl78bRfq6F/kvHHba2F8iae9b/U5l+vnidOHu4mAQ79G
	woo3ckZRkzHnDHO/QLMQ9CytXOC8W38LhJ7hn8/cz8dVxjkcFspGM257zVgBHg43
	0npvutMwWc5Bkm56y6YIVwUfsd0ge/EjIDA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anp2nh6sx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 26 Nov 2025 08:19:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-89ee646359cso1679805585a.1
        for <workflows@vger.kernel.org>; Wed, 26 Nov 2025 00:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764145151; x=1764749951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IvDE0Ygyk+QKs5TPrEHv293vjQEPjkX1SpFBnjqqKBo=;
        b=NCHAAFWXfhL0DnWobkEvElSlfcvhAqFHbdczb0RU8f61tKyBbbqfZN8oxQ0A5rUOoA
         oBkP82PBzUn/6XYl38t4swfSIHYhO+1g7SMtEMJwEnVdKUnS4d2V6OPDfKGd8RA7h0B0
         QYUIdkrE4LdadfgcCj1IwZui0Uhso/nxslYgLIjwwCogsxtW1D0dBfhLt/2+q3q2xmGW
         Ugbtyb57NWNqxuzmh2iiZmz95q0J4yNAoBilnrU2EjggnXqnZg1u8QMvKJF0iFVTNx7P
         qCb8WMECrzHw944UPRSuKrSvsstHvqjHSuqq7JLL30CL4P1vPRaXhEFCj2YnuTGn63nR
         sfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764145151; x=1764749951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvDE0Ygyk+QKs5TPrEHv293vjQEPjkX1SpFBnjqqKBo=;
        b=VNT3TtQjaFImSQzJwb73rLU4za+d+6yE2QItr7NcaGMlL5b9T8c8qSc7gGuSvCu9R2
         djXkzmPRNgFF0W5n7Vo/E/U2gnlaA06Voe8GeATgvRfUFGuI6qwDr/4AymZ/iZtZ55lJ
         QnYk4GxS/93iI8F40ntTRFhTPWED2Cl3ZquSSskOUEK37ywDITNnUgNEUvhgJLvfGEth
         20KmuDfRbLPCqQvIRcNX6U7rMUWOi1ob3b9E7vWQJPwUmhc6flMk8YReuCewBu0SPWpz
         eZUMLmRV95DDnK7xmPPbuLnb8BFnLQUjSy+41iw7vNJKfGsykRgofhylFFQljBnyGgYZ
         oFTg==
X-Forwarded-Encrypted: i=1; AJvYcCXxAbnuGkRF7l0RmHRfbJmRFAu4YHJxoTthISyyHz1+3ogYVDfB840m3bh9too+MPzVwLXHZk2PmpY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5dcWOTso6DRsFniJTo0kyeSIHStgBbI+Ye9F/z8SOubLQcykO
	G6bazeBh0WltigjRoPCemkr1dokxjTT+4pxakYQyOJZhA9JGPjONxRSb3RrNvvgrdlIxTtzzXYi
	4uSCq2Ci/b3eKDjZ9t1NKuf0QiDBnYamT7WZwBknv3WnlfmLZixxvncCjHEm85kLX5UWG4hI=
X-Gm-Gg: ASbGnctbf266pdLlKdfKPlK38hBQ/Q1GzE16E/umjqfCbPGXjvdgCMKUgePNkgA801R
	LjRZow3sqDIOo29KzZp7XK04/9pqclbmsWiDpJ8xWWhpBlKutgk+kUrdgVjwaje4eakZ/01K2yt
	q5tLZrv9R75o3YxZBASm15dtUSjS0VaaOyy2kfPAVNrJjkDpZB6UFcB2Z/NNAOU5xDmH/8vooH7
	hP4gO7Ko9tyfez+GFFsn5eo32MlmZA0Tpg7hM/NyFqovVGQLDGSbprbJA9yzC91yXEuv+dGVP1p
	LgZBkoNG1nmjC+xU1l1z+ZshusyuPHV3I3+4ZXUU+QiiZUWIj0zLRs0d6aT+G3dZvpXDrxcb1wn
	xHda6VrCbWNSFojwAZ1vEZygjWGZy
X-Received: by 2002:a05:620a:7003:b0:8a3:1b83:1025 with SMTP id af79cd13be357-8b4ebdc1d29mr759333185a.73.1764145150811;
        Wed, 26 Nov 2025 00:19:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCrKFc7MsUrz6jj+yFbGZMJO8DfX35or9wIKYqC5c7E+xpxX03JyUO+Bw/kGlqeuN77ZtB7Q==
X-Received: by 2002:a05:620a:7003:b0:8a3:1b83:1025 with SMTP id af79cd13be357-8b4ebdc1d29mr759331285a.73.1764145150407;
        Wed, 26 Nov 2025 00:19:10 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645ef325a4asm3868411a12.28.2025.11.26.00.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:19:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] docs: submitting-patches: Clarify that removal of Acks needs explanation too
Date: Wed, 26 Nov 2025 09:19:06 +0100
Message-ID: <20251126081905.7684-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KerfcAYD c=1 sm=1 tr=0 ts=6926b800 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mSz3GvdCR8lolErGETwA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: fWToXH68ZohuQcg_Mbqepguocx_zDFfy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA2NiBTYWx0ZWRfX1wNUuoRgN5LI
 GrMP9UgJOnCBPZcqzDCYuQju+GHAThrbFDQg9Idf6nk1zjTtVKCa3m1u0Y9E7g2pUyjpMSj0N0s
 2VZAvTarDC/HthebhyJnz1W/XCGTdlFNqRhRt0bs0s75yV63zBdngGEJVAJ4Xy85sqjAYtRt/5S
 hAVcfZG33wQCTE1im6nr5l8wI8gExr5/V3LY8cWdXSCHrqelooMF8Qsw+L90YQKZh7iaiLrKHZV
 JmSGuE+vw9l40jesrygaDWcP27CG8e15eB+XkOmQJB/2QX1yeo1uaEAc25cQ4JUpzOJU4PpUeIP
 CpWfaXpiBJLlFGQGGk2pmPC2BWJRbAAYJL/Tkw1rwezfj5t/ezGYwnY7oPQYwNK6OXcNY3q00Zz
 tgXKoGxntyRuny8fSLT5BiGNPCeZHg==
X-Proofpoint-ORIG-GUID: fWToXH68ZohuQcg_Mbqepguocx_zDFfy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260066

The paragraph mentions only removal of Tested-by and Reviewed-by tags as
action needing mentioning in patch changelog, so some developers treat
it too literally.  Acks, as a weaker form of review/approval, should
rarely be removed, but if that happens it should be explained as well.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/submitting-patches.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 910e8fc9e3c8..9a509f1a6873 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -592,8 +592,9 @@ Both Tested-by and Reviewed-by tags, once received on mailing list from tester
 or reviewer, should be added by author to the applicable patches when sending
 next versions.  However if the patch has changed substantially in following
 version, these tags might not be applicable anymore and thus should be removed.
-Usually removal of someone's Tested-by or Reviewed-by tags should be mentioned
-in the patch changelog (after the '---' separator).
+Usually removal of someone's Acked-by, Tested-by or Reviewed-by tags should be
+mentioned in the patch changelog with an explanation (after the '---'
+separator).
 
 A Suggested-by: tag indicates that the patch idea is suggested by the person
 named and ensures credit to the person for the idea: if we diligently credit
-- 
2.48.1


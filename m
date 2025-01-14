Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54E923355F;
	Tue, 14 Jan 2025 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736832977; cv=none; b=nMgW51WEN5musur4IF8MwIEaz6qKqVsAL90vT72YcmkK4wUhSTnO+b1gxE90rY1YIwuhAVv/bomIGqDrH6uxOwvykWYOT98V7RXRF8ahMe4lQVq6MCaJC52y9DGWsK8daCeYcfHzdLmlJ+X2jvVrpVbLe2wzU1GZTilrCf5Vd2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736832977; c=relaxed/simple;
	bh=cUrFJ9xlku6iOVJmqRm3AKSPyxlxbIELfrHlRVSE678=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DMyohpSn7BjoA5WoItLE6/hjVxwR5+ybKlM2Y0uzOHQH+rn7z67QEd/B5o2IhulQb0rS673gxMpNcIIOwWafIReXno+L+w0nR0QM3F2NmnA7T1TZj+PRxk1HPY2FzfkJ0lxECJ3i6C0/YPi5e1m1R8p1WR0Orfb3cit3vU6IOiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aXbBkGUg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aXbBkGUg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E2fc3u019144;
	Tue, 14 Jan 2025 05:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CFVY0tjOmtO4qAqPnzy1tUQpQ6ETWmPtYq/HPU3qSi0=; b=aXbBkGUgRenYY+kr
	GhmhQxZFugwhs7ZerU+nCDz07oNXy4dB4IsS2Dn6ffnsRAFAHFmCulqCfnvn0VZR
	bIytfkOm3h0P5hnNhe8KtDRHc8NH8eI9DlQNPjFbr8uU61jzSSWI8lo63KxdwObG
	g+W8U0oLtB92OF40g3tTxMK1mz7UYvFQ8oMYPZrIgS+gcyD4nqoVAm9Gz6kFruCF
	s4DxNhbl1OReEc6X2stwMw0UD7kOwcqAU55wLJ0gHbGVK0i5TF/P7V49jaVzrFOQ
	HtJqJkcvB2YAuVoH74/8hjKc+QzkWFrpur5WdJVKmG7EukAMBxVk0586B5vLzQkx
	lXQJPQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445fc68apd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:35:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5Zwtu020376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:35:58 GMT
Received: from la-sh002-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 21:35:52 -0800
From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
Date: Tue, 14 Jan 2025 13:34:33 +0800
Subject: [PATCH 3/7] kcov: allow using KCOV_TRACE_UNIQ_[PC|EDGE] modes
 together
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250114-kcov-v1-3-004294b931a2@quicinc.com>
References: <20250114-kcov-v1-0-004294b931a2@quicinc.com>
In-Reply-To: <20250114-kcov-v1-0-004294b931a2@quicinc.com>
To: Dmitry Vyukov <dvyukov@google.com>,
        Andrey Konovalov
	<andreyknvl@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton
	<akpm@linux-foundation.org>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo
	<tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <kasan-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
        <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736832942; l=1250;
 i=quic_jiangenj@quicinc.com; s=20250114; h=from:subject:message-id;
 bh=cUrFJ9xlku6iOVJmqRm3AKSPyxlxbIELfrHlRVSE678=;
 b=PN4imkwKcD7/nAryYV3lJaq77IA4e+9rhwFDEIua2TPoylFR2tEVvYzX1A0kElet197HOJhRv
 KnL6OAxKhzVAAeMfHluhR5AD/KnczeQvktL1Pe8Wg8BhWFmOtiquMjy
X-Developer-Key: i=quic_jiangenj@quicinc.com; a=ed25519;
 pk=JPzmfEvx11SW1Q1qtMhFcAx46KP1Ui36jcetDgbev28=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2ybqo6M8sHxWZsrwE_g4pZ5-4RN20TNw
X-Proofpoint-GUID: 2ybqo6M8sHxWZsrwE_g4pZ5-4RN20TNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=891 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140043

KCOV_TRACE_UNIQ_PC and KCOV_TRACE_UNIQ_EDGE modes can be used
separately, and now they can be used together to simulate current
KCOV_TRACE_PC mode without sequence info.

Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
---
 kernel/kcov.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 5a0ead92729294d99db80bb4e0f5b04c8b025dba..c04bbec9ac3186a5145240de8ac609ad8a7ca733 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -716,6 +716,8 @@ static int kcov_close(struct inode *inode, struct file *filep)
 
 static int kcov_get_mode(unsigned long arg)
 {
+	int mode = 0;
+
 	if (arg == KCOV_TRACE_PC)
 		return KCOV_MODE_TRACE_PC;
 	else if (arg == KCOV_TRACE_CMP)
@@ -724,12 +726,14 @@ static int kcov_get_mode(unsigned long arg)
 #else
 		return -ENOTSUPP;
 #endif
-	else if (arg == KCOV_TRACE_UNIQ_PC)
-		return KCOV_MODE_TRACE_UNIQ_PC;
-	else if (arg == KCOV_TRACE_UNIQ_EDGE)
-		return KCOV_MODE_TRACE_UNIQ_EDGE;
-	else
+	if (arg & KCOV_TRACE_UNIQ_PC)
+		mode |= KCOV_MODE_TRACE_UNIQ_PC;
+	if (arg & KCOV_TRACE_UNIQ_EDGE)
+		mode |= KCOV_MODE_TRACE_UNIQ_EDGE;
+	if (!mode)
 		return -EINVAL;
+
+	return mode;
 }
 
 /*

-- 
2.47.1


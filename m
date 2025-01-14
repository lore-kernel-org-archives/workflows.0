Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF41023499F;
	Tue, 14 Jan 2025 05:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736832993; cv=none; b=W28GOUMvb3Wp8vOsGUdZ4tIdwO/4TZjI62dQcPiTdlzkARnTiDAXMV/luZPXX/sFGI83RcwkHEsGfLZv5K+XkFqPbPp6s/7uuXiTtnhkaEAhZFDAZSHHNWtHspfBbcDJgUDfdxUbMsWI8HRqv4IX8q1l51qlsSb7kIds3rtfrYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736832993; c=relaxed/simple;
	bh=1kWeMy8H18bHx7q6bxqI4S7xMp8TmEXRvurq+o8jSTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bwIZ1x5bXcRKDcbGKXpKCt3ts9PsyZJYHglc8cljsHWvizTVPdkQmnsDGuRpi0fH7CDPK3maNcrSrBnop1C29YjbupbPcx7lguY9Cp4psSKPtgs8KIOEbbEt5U/D7IL4z8+eu17XPiSdfHhXwhuZodEh7nOpAljsWucmiRlxb8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HikSzvI7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HikSzvI7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E40bZB020725;
	Tue, 14 Jan 2025 05:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Ra3dSoqbIv2eF9zoZUbyQQPjXpOzfwJvCpeTMxHEKs=; b=HikSzvI7KYxlMco7
	RYWzAkybYaofzND7NE4hK4kh74cceDeIxcHy4IlcELeV+V1szgEwQftpeoMU4ZxX
	I5vZm1eC4knIGqbT81HKE+xnKB7NP/T/S7DL4FTYVVSQLQp6k8hlGJ0JB6OvTIIV
	ogtxPXvzkGPqKoc7DrYPk8ot36bUWdSE1GZRtMUo5ZGxUkfriEokjDsR+THoxPFo
	3etaL6pf3ZUxjT2Pq4NLi9xe0h3p0Klve1MwE/m7AFjjw78z1UPxTkdW6KVSr6YB
	EkcMcoBwvtfq0HISfK3vjQQEjxjnepwx64iXQBs1PRNTtxowDx9vO1yyLUvkocWX
	qu4VSA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445gh60526-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:36:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5aCok016202
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:36:12 GMT
Received: from la-sh002-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 21:36:06 -0800
From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
Date: Tue, 14 Jan 2025 13:34:37 +0800
Subject: [PATCH 7/7] arm64: disable kcov instrument in header files
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250114-kcov-v1-7-004294b931a2@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736832942; l=1362;
 i=quic_jiangenj@quicinc.com; s=20250114; h=from:subject:message-id;
 bh=1kWeMy8H18bHx7q6bxqI4S7xMp8TmEXRvurq+o8jSTk=;
 b=zPdx/wsH9uf3YlAIvy013JGGUIrnRUGzN+n5UmShLK05sjrO5Bv+UKhmFiYiSigdphGdNZ4mt
 wlcCgEsIO2HASI15aSluF7QMoXny39DoX3F20cozNtGxwEHgHdqrSVX
X-Developer-Key: i=quic_jiangenj@quicinc.com; a=ed25519;
 pk=JPzmfEvx11SW1Q1qtMhFcAx46KP1Ui36jcetDgbev28=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SJSYjyfLnYMRCxOaFXFtA289YzGmtz-L
X-Proofpoint-GUID: SJSYjyfLnYMRCxOaFXFtA289YzGmtz-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=761 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140044

Disable instrument which causes recursive call to __sanitizer_cov_trace_pc

Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
---
 arch/arm64/include/asm/percpu.h  | 2 +-
 arch/arm64/include/asm/preempt.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
index 9abcc8ef3087b7066c82db983ae2753f30607f7f..a40ff8168151bb481756d0f6cb341aa8dc52a121 100644
--- a/arch/arm64/include/asm/percpu.h
+++ b/arch/arm64/include/asm/percpu.h
@@ -29,7 +29,7 @@ static inline unsigned long __hyp_my_cpu_offset(void)
 	return read_sysreg(tpidr_el2);
 }
 
-static inline unsigned long __kern_my_cpu_offset(void)
+static __no_sanitize_coverage inline unsigned long __kern_my_cpu_offset(void)
 {
 	unsigned long off;
 
diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 0159b625cc7f0e7d6996b34b4de8e71b04ca32e5..a8742a57481a8bf7f1e35b9cd8b0fd9a37f0ba78 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -8,7 +8,7 @@
 #define PREEMPT_NEED_RESCHED	BIT(32)
 #define PREEMPT_ENABLED	(PREEMPT_NEED_RESCHED)
 
-static inline int preempt_count(void)
+static __no_sanitize_coverage inline int preempt_count(void)
 {
 	return READ_ONCE(current_thread_info()->preempt.count);
 }

-- 
2.47.1


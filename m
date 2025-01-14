Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C20233558;
	Tue, 14 Jan 2025 05:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736832993; cv=none; b=eYXi/9mpL0+1C6AsBVft0c8TwXeepblnuYGwYgHjZP4cthAMunRLzM/KuVS1gfP/Xo5fi3BoknAAAQnGcJTmzWMjCFDnE6B/2TuPARNwJdqSrkPfWaY4zP5zFbX/wmvcSGDKIXAIYstjFyS/Q8KKE0KPWD4xMyL+014h3uQJCug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736832993; c=relaxed/simple;
	bh=EXcTVhs0X6v2Sn7y/hEncpAKcEG0rAcAKxXrOMGyy08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OhU+hNCzmLBhTo9iGQkSXsy8L0ugUE0ZtOLYEe6SuDPCocAyS04QEvvtmwq5pNf7RwpBZgQjj4EoEmj+FdN1ll1fSb4jeT1KRjjJe0W0nwbUFV+FN+WvBnFFNY10RdvS347K/o0/eG26ZFlRHXDwuu2t5sIlVITl020hd1BSf6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pib3eWcG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pib3eWcG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E40k6j020873;
	Tue, 14 Jan 2025 05:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sbZl6GtDotLNfy1i0ybFvuNDyQMsou97Y3PruXQtvYc=; b=pib3eWcGHBy1q5JO
	eqjOf146/5gOab2zbejzkS2zfNrQW2mDtMyDQAhbTP8n6nM/nD+Fm8FIRFxSv/hw
	PLyXf92MGH3p2QrEOwHZ6bW4YJ5bXwPBnoJValvoWFGYWzgcj/X2gtl2h7iBE+Vd
	Ud3nCD2wZycQ/XRcxOh4udyfp965MOGdXQDIT855hgCMhLfW9+XnleDiTW2QSIB4
	X87O1VDwqdCOSIV5lQRK7vXnwtIAGY6aUU8y2LGTB+70/wXMtS3h3aUhQ5LO7jvG
	4syLPlEWs1ra4stuiLFpyJfP6FDVN09pNxgY7lcUnDKkKAZbJ2L8nYFv1UwTtxj+
	NhOR9Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445gh60522-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:36:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5a9Sk032192
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:36:09 GMT
Received: from la-sh002-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 21:36:03 -0800
From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
Date: Tue, 14 Jan 2025 13:34:36 +0800
Subject: [PATCH 6/7] kcov: disable instrumentation for genalloc and bitmap
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250114-kcov-v1-6-004294b931a2@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736832942; l=875;
 i=quic_jiangenj@quicinc.com; s=20250114; h=from:subject:message-id;
 bh=EXcTVhs0X6v2Sn7y/hEncpAKcEG0rAcAKxXrOMGyy08=;
 b=DPbLlmPLNl9LVZSN1bfAVqQsyLNyv2HqNKFt/s+LvYi8cIICAf3fRzFkJUf2iumIUN1xDcknK
 z8FbRLfWBReCSA8dPFnjOChSeV9/ToF4C7tcNQG1a9YzeqfEVSpKKbd
X-Developer-Key: i=quic_jiangenj@quicinc.com; a=ed25519;
 pk=JPzmfEvx11SW1Q1qtMhFcAx46KP1Ui36jcetDgbev28=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CzmwwnNWwZyaCVN5LYXu9a4ccWBCgyOh
X-Proofpoint-GUID: CzmwwnNWwZyaCVN5LYXu9a4ccWBCgyOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=778 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140044

gen_pool_alloc in kcov_map_add triggers recursive call, which trigger
BUG: TASK stack guard page was hit at ffffc9000451ff38.

Disable KCOV to avoid the recursive call.

Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
---
 lib/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/Makefile b/lib/Makefile
index a8155c972f02856fcc61ee949ddda436cfe211ff..7a110a9a4a527b881ca3a0239d0b60511cb6e38b 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -15,6 +15,8 @@ KCOV_INSTRUMENT_debugobjects.o := n
 KCOV_INSTRUMENT_dynamic_debug.o := n
 KCOV_INSTRUMENT_fault-inject.o := n
 KCOV_INSTRUMENT_find_bit.o := n
+KCOV_INSTRUMENT_genalloc.o := n
+KCOV_INSTRUMENT_bitmap.o := n
 
 # string.o implements standard library functions like memset/memcpy etc.
 # Use -ffreestanding to ensure that the compiler does not try to "optimize"

-- 
2.47.1


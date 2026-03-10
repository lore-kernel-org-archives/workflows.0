Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF535AC07
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173972; cv=none; b=IYrcaKddthZ6/kIFrlrnZJ3pjcdbhvAmjw0w2C6EKTjN5jOoKxViBa3UCA74jhwCNzTPH8b52PFnf8knlucEPKoxvz65wmGoZQmAodXlhU7bnnZLjz6peBEEOdHadDqOAb8qlBOnbfvSDhD44lNhL949Z8UKgJMAFGM4FfKHb6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173972; c=relaxed/simple;
	bh=SDVzuWlIT0Mtepv+39geIXaXq+UWjaDr7JbnOUNe6QM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u7VhQg4I+OgLG6nAVAP7gFEiRrbG9amr43BKRvp4T/zeFwyrEAFhqEl6SJe86JtCcsU9XhqaNPUFVYKoMyJkBU4fS+TVM3rDMTUyxF8csSGka1HEYE0bbHnQxpPrLrd7Cfwtfu5iETLD5fm5QPstJSpTIflPcDWyJGPVuFLNdDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lpukSPyA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RFJEfbkt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpukSPyA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFJEfbkt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIoGUL303861
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o14Z2a6/l2NPuJTTgYLWWvyApkp7bYXMngm3IoV823k=; b=lpukSPyA3VeEnHyR
	NLJSoEqP4ax8Yy2GOodPU4MzO3kLLtNTNCVaqaajOgmUE5ZC1WAur70H7NsehL4E
	GtQ9HNrCOhegZZFynzYM6fnATHBTeZ3o+wH/Yq7J3k9EVPuVbRRiMMPsDcwFHuHr
	XOcT39XRmjb3bwN52r+AnJZD5kU118bZa73vAx3Yv5QoYGmGpkvts05pinATjuhV
	wSf0t5jNLICVa69+TV4FioHsK/egPTVNgWdbu2uEL86s5BWsNV2aJzVTNYENoA1W
	qnHbsscQCwJAEsPoPKAyDgJSgJIn5hOHgQes0gIOMWxoxEEMxkkHZcjGIW7N84/u
	tMOAvA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf2b32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:19:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6097ca315bso58405738a12.3
        for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 13:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173970; x=1773778770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o14Z2a6/l2NPuJTTgYLWWvyApkp7bYXMngm3IoV823k=;
        b=RFJEfbktKiowYBV2iPbyR/8QII5dUu/1/5LaSPsOXYIpY/hZ5EHKzrflWTBOisZ+76
         J9seCoZN0/o6ZCBZczZ7KePFnoeY1AsSs49PJAy+jbQVzq/kU4E61AvCp9y12kSOUNFU
         aslBZtsMaM8Px1hhrqEwi/k1nhBzrXPm6DXaPzx2CL67P29Wb/SZ4v5FCP4+1SAn+Em8
         tZIDG45yVGbYd+BbOc3vkcKZyBaehJxEW2QOoMZ/j5fdSNPrI3Jl/DsMidTTgHCzJlfo
         kUTIki0jGMhcyVvjNYA5Q66AUXKgBscm8yzykgnZ3W3BAI2gSt61hQEDOW7/nvQvTEae
         esXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173970; x=1773778770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o14Z2a6/l2NPuJTTgYLWWvyApkp7bYXMngm3IoV823k=;
        b=LKnk+BEM3/R7VJr3lOSJLjTSNFz/07gHVDcaUYP1a/Jdurdnqc2Q5Zuj/uTOCL6yE2
         pRem2b1nJgIRy2Oj7z1wIgLp5WSSfRQSNXZ1Aw5xkbsKm9O2mPxu975nL0VURHI8nQTY
         3T5WFBn7kggwzAP3zE4kNEkh9v3oJPrKzWHuonSw1GcR2z/TVtM9Dt5qqebpRAtIQdzg
         WG4RoJ2C+XUbWIhCZm02iGR3OlOjGkImIHTiZ5br6FkLV/+VPoX20scFef6/kgCoT0Jj
         4+mkp0d/QNvBtUqeC36ESnLtKUZWJOFgTXSSQ8aVyi+bslmUd+0DpGZqYJxwwV7YQCpZ
         fj9A==
X-Gm-Message-State: AOJu0YxNAXyE0GN/orDJrkx270xfqVVWF1xcH59B103WB8Ut/Y/TcTCz
	fc5ldnekSLJl9mONTIJDCZrecqe3ErSDh7VspCWkPuVYzMcQlWwLG3mLAXFgEa9bgQjKaTSlr5U
	pKAelAGNuLZB9QRV98NnTAlh+Qlv17Oa+oj+x9n0WQj86iIEdrGq5mL6SKDOvkxo=
X-Gm-Gg: ATEYQzw0vH/UFzSISvZyDfhl5zdJ13cuKwVsa8yfam1zkjjhJCDbnxEtVaZ4azTWaE7
	Ui7jjJNxTYOy2OG7ILX4i+Ruxj3PdOETD+Ln85LGfsS1eVaAsU99QktcqxcKTtPXSgUflyBV1sK
	GGLv3T7ErL1D1CJdzXjrrAOopoD5JWnBnzZLt6IppcfPSL8u77c+/zhH/7P5WzTCjBh6sPM95gc
	GCbiPNcgq6ObwwgkJEIZ/b7EVH11nGN01SPg6CsUmTjm7ZmTVoNyDD7DPUgPQZMKYQ8MoMqLqHN
	yyuM/Pg9+fHF67voSLBkNJ60AoJpIeG+JOhEu8UaSioTu81v130+JZMImT4YmDLz+G2cZBfCGdQ
	OjHFsoMaQx2oHDpi+etpord5+4g2IiYPAXX5aKxVUvCWQheH3
X-Received: by 2002:a05:6a00:94d2:b0:827:4372:dd15 with SMTP id d2e1a72fcca58-829f710801fmr145167b3a.40.1773173969630;
        Tue, 10 Mar 2026 13:19:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:94d2:b0:827:4372:dd15 with SMTP id d2e1a72fcca58-829f710801fmr145089b3a.40.1773173968931;
        Tue, 10 Mar 2026 13:19:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:19:28 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:57 +0530
Subject: [PATCH v2 13/25] mm/init-mm: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-13-f91cedc6f99e@oss.qualcomm.com>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
In-Reply-To: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <eugen.hristev@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=1598;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=5nQ0p9n3c31Q2RIq4yMUZPGaE3IA3pjushf8tYEqgcs=;
 b=t7nzKjfrKipDpTwS4ZqlI9VkibqL8C9dDspYDVaOjrd+X4QGwj5GMAm1C9hhwSvzQOmAs+88P
 roE/qXbWEnYD4lhp8Gct4DRbuiio0CZSZC02jdz7e/q3zVjh3RXgYE2
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: T_V5_Frogi0nZU1EonSBypRyii5uD3iW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX7LybckTN6E8W
 IJ6bYCdqZLoh4UuOJ04hNa65EAKWeMFGLEqIZZKhk5ZXTWreXdmp9ZNUYqjD6bfuz/31HA69LsG
 1TTbRqLCWvICXeebaTtyMG5yWMgx6c/2C0tXmhqtDy8j9D+yif5Q1YVu4TpA/BdpAbMI60C6bmk
 MnFtFY8Lp8uqC96nwEjRqT0KKz/WAOryzoWvoOpR9cM4luI9BiD2myNdXmkxk2xhGhaZSvlfVsD
 EwOsqhVv/6CKFHUxAuTV6igRNb0Rhc7Xk6mOjNy9RKOfPLMkUBYG0T/LStjyNdnyQDESe8kHXFT
 uiIujwhfwMRiTAp1TSufbPruHurYjoptXbuWSh0kk1Q49vVqOXzYbFAU9+69T+oR84FXx9H39pR
 p8DR3vsqrSECB+q4f3G4Jug1iP6pdQxEOZJWV23aWZWgFtsxLQ4iFRnyw5jAZxhj6SEJzKED0Og
 0xhjBIw4xVdcI/jZp1w==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69b07cd2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=HJIP93yTpLwjP442z3MA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: T_V5_Frogi0nZU1EonSBypRyii5uD3iW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - init_mm
 - swapper_pg_dir
 - _sinittext
 - _einittext
 - _end
 - _text
 - _stext
 - _etext

Information on these variables is stored into dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/init-mm.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index c5556bb9d5f0..4add144a0e99 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -7,6 +7,7 @@
 #include <linux/cpumask.h>
 #include <linux/mman.h>
 #include <linux/pgtable.h>
+#include <linux/meminspect.h>
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
@@ -19,6 +20,13 @@
 
 const struct vm_operations_struct vma_dummy_vm_ops;
 
+MEMINSPECT_AREA_ENTRY(_sinittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_einittext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_end, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_text, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_stext, sizeof(void *));
+MEMINSPECT_AREA_ENTRY(_etext, sizeof(void *));
+
 /*
  * For dynamically allocated mm_structs, there is a dynamically sized cpumask
  * at the end of the structure, the size of which depends on the maximum CPU
@@ -51,6 +59,9 @@ struct mm_struct init_mm = {
 	INIT_MM_CONTEXT(init_mm)
 };
 
+MEMINSPECT_SIMPLE_ENTRY(init_mm);
+MEMINSPECT_AREA_ENTRY(swapper_pg_dir, sizeof(void *));
+
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
 {

-- 
2.50.1


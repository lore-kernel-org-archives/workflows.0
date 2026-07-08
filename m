Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59243BBFC3
	for <workflows@vger.kernel.org>; Wed,  8 Jul 2026 05:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488956; cv=none; b=hNHNcY9FBW489fHnMeijNf5brKadltenFOMEsiS3K+Xd9XAMew15zLsYYOTcAGY7MFcJRZRegLltu3846hzszxyYbnF0RhsLpSLETO5U1YWaoV6anplV4pW+89Smd7MkvXZRDXbAZmpxmmEnYcgG3k9hu5/OHZ+Cfqll8u8q+CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488956; c=relaxed/simple;
	bh=XB0hnr+SeoDNBsLD4keyubVFabUM7ZTQY5JWjuUzUR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q6DKW9DEJnBQoRSLYdal0V7jdqi1zdF94H8q4vcnJx48L48Isk+bek4j5VvyyaqKV/XjhURQPqiRWKSdgZkNyTgMIxQeel74vU9LdmvEOV+MFKBX4AJQauHntA36tw2d81/QDWvCgvTvts3r8sMCqZJZCDeCuvT5Zxn7o14M82w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyVGMjHS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rm9pEug6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyVGMjHS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rm9pEug6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842S801447410
	for <workflows@vger.kernel.org>; Wed, 8 Jul 2026 05:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xAshyy6/VO0qiyWiPgZ2rAgo5RvZA1Z9f52v0WVoR68=; b=iyVGMjHSYXLMOvvb
	whTK6oJiXUtt4IV+/SzT1wIWF1tRxXGFzPJB5KDz0Fe8VB+7px3ddcHqPJp94fgx
	Ze5L7Vr5soKn+zKznGYkt98thcz+2A1Gq2WZBO25klO57cRwKc6RPyi5zY8PkyES
	pvG++Irv6hL5nzc3s4OWjhuzUexAuPSgLt8ypxUtXHlbe1ZpsPfnrdkS73qp9xNl
	3T3NFIzF7q2wemmc/4H9IA1i3tN2GPs0fXWn+/ftR+t9FeInphgSkGQnLHsM9sVg
	+xYp4XB3BkS/hYwyLcQxUDw4MIeT1AAxE01wXzb2Gig4tlJhnHv995tiIJoogDk2
	ngKXnw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u11tug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 08 Jul 2026 05:35:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso474266a12.0
        for <workflows@vger.kernel.org>; Tue, 07 Jul 2026 22:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488953; x=1784093753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAshyy6/VO0qiyWiPgZ2rAgo5RvZA1Z9f52v0WVoR68=;
        b=Rm9pEug6etr/bAuEdYavxUzcKwWbX3elyXd7gp6EZtLYyqGP0rzuaaUH4/4CCCgw/f
         BpSizE2mKRnHfQGahJ96lDMMj7lZp1PNH5tO3oT/Jp+hJxNwbyiFMKEMGr/iYVVtyLAk
         ezF3nyNf7dd9Vd6IJqc7FYDZ1AfF9Dh5JD1LG05kfetWKIQ+nsh0NZ14ROGfLuoYt2yt
         1mrjaSEYsWSvzu0cPc4VMS1FfU0mWieMjuLI9u/SSTSHDOeqE/rGYRqK1NWhkLb7p7ID
         2uEKmTK6vHvf8klS0V6woDtR+fMs00lIGLwvGr+ZfJ9LUa6ZjSYfIrJmkYfajWFcR9EV
         rrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488953; x=1784093753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAshyy6/VO0qiyWiPgZ2rAgo5RvZA1Z9f52v0WVoR68=;
        b=psUvDNPtp8kAXOB3gTv8ug3SyG7ITjgnRArQhFF1Q86o32GRO7Q64HD3MfSMI+skG8
         JI5xJfxF34WUnO0ISbM0VhkAVyGwv9Ts1fTvJnUr3ytrqcWRfWJk7f9P4g2+SQVmsqL5
         eDmNFs1NyFsWFuRq2SptXVfKguQ35cyW/SY/pXZI5zDzGa8kYH6w0CaZSHHlOrWY1LSp
         rQR2kANwMSmWYaAN8nc2yrwe/qghMZ3znGoZl63sn9adFxYXPAWAc8J/wC0U/dYiKANu
         T9S2VCCKcvE/P1kvZ5sZx4H7a9Lr1grRKEpoXLm5tE5vyL/oHsg4/RG+ruSlUOB4EEqV
         /WKA==
X-Gm-Message-State: AOJu0YxMGkZdRwk4zEAiYwucb8ee1LGcVWn4HPPK1Und9HO9JrWy0yUX
	omjgZKLcdrh0+I885KKgFRjzU1wh6R+nJqEgfvccl7ncvLR2ByoG2hjcjg+G9D9NG92588KVKqP
	4RvJthP5H+bQCIrWbEKqmYxDT66sn3wQUrHlPvJhu2PuuK1qXGKdFwloxX1Xj7GA=
X-Gm-Gg: AfdE7cmFKkxDEYjF64GrRRO8zPbEtzUbnLpR6uCLdHepd2vNP0qsAXeM6Ztk0G8auZy
	fX+JhkyVxKIyWyEvGP/mVD7YqcietVK+lz81BvMQ+1i3CUStXLUQaXGRWD03c7Seb24Nc+uLstj
	s5lNNxz9zXlab6ZfbRzGbG8HAEofriUTznPuBm746HSZGIAHUrDeKLhgapUzoY5zz/Z1oxRczVl
	GbHbM6O1+ZFqUfwAL+CV/mYHwC7jAJsOs/k7XcX2BIlm/Q1mZl4Vzu75mSvc+5PBvKLVn772V8Y
	sTiAP4GVKt4JguXXQy5DBBCJPBAAYQ/hnNv7qaDGS/uB0ciUC3J4cpSeUw0UrrckaAaBQWLThzC
	EIwwhrwiRWh+4C36uAy3jMHZjSZ8rdUm+WG/UcQ==
X-Received: by 2002:a05:6a00:12cf:b0:848:2f84:f431 with SMTP id d2e1a72fcca58-848432cc7a0mr1101653b3a.74.1783488953381;
        Tue, 07 Jul 2026 22:35:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:12cf:b0:848:2f84:f431 with SMTP id d2e1a72fcca58-848432cc7a0mr1101621b3a.74.1783488952811;
        Tue, 07 Jul 2026 22:35:52 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:35:52 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:53 +0530
Subject: [PATCH v3 14/26] mm/init-mm: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-14-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
In-Reply-To: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1627;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=C66R4z8t2Qna/gYEl08YE1zQ0IYA/DB7tbhATdDv314=;
 b=a4ZKz7sKq0X3Xk4djKf4AkkMOFWqa+Gt3qunjb5YpftQ8eDqQGmZHBmWWdz2ObrXjPZiVPIj7
 /TQu22VS0TvAfSBd7UB5LIi8aMhGbP2gVYcpIP8hELXfmPA5AwjOiwA
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: BjOlY8DYvve910d7jmF9G36Y5oGJBLct
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXxeJmJJjhMDtU
 DnA1RMPiqVEOTUslvIK34kyT1oi/30Hqa/sLkSv82LnuXGnLG2lsi0Valo7Ady6xOtq59l7Ksus
 vjaq5fidkE4XvjV+GtPWUEUpDfiJSpc=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4de1ba cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=HJIP93yTpLwjP442z3MA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BjOlY8DYvve910d7jmF9G36Y5oGJBLct
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX3TeaVA5pbpgU
 zZuqA+k8eSbiaX3RZKH1sLtHJzYZyx5YFb9GTevHO3dTpaysF8tPaN/xc6oxQHPn+y/1qaAiYXg
 M6L341SiIE4WwhzTLkZ04utVbeaPaTYlZssgTYBPfRiQAyQnRo+zXvcIXW9kBtiPUTM22oHhTzq
 k8YVZ9srRjLB4cU7c9vg1BwIXT47fRlBxwTkD27OcB5AhOxeanWzyGmvsDyOqkdXA7uXPzjC/ou
 6k2yM10NmRHLGlL15nh9P/i29M0GRacUzvewqzWSIocJFY5SR6C8y4g5PPhLrhvvnHwVFdYqNAf
 LCAK6iOI4RJEHGpY45NbSzxTfubVnIlrQ0KlLjQ5xaomgnMOWJo1jCGD0BEDWyl5LdLyEcAEdm8
 oaaUQtYbj/wR3w1oxWkz+Ayyx43FVLhTqsd/hMWcdfnsqlbqQR9o1ifj1bgr4ELpBkmPRR33heq
 K0z3C5v0lF+e7eMuG7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

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
 mm/init-mm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index 3e792aad7626..cf53058410b1 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -7,6 +7,8 @@
 #include <linux/cpumask.h>
 #include <linux/mman.h>
 #include <linux/pgtable.h>
+#include <linux/meminspect.h>
+#include <asm/sections.h>
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
@@ -19,6 +21,13 @@
 
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
@@ -50,6 +59,9 @@ struct mm_struct init_mm = {
 	INIT_MM_CONTEXT(init_mm)
 };
 
+MEMINSPECT_SIMPLE_ENTRY(init_mm);
+MEMINSPECT_AREA_ENTRY(swapper_pg_dir, sizeof(void *));
+
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
 {

-- 
2.53.0


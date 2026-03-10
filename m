Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D21358382
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174017; cv=none; b=BtmkOkCoJrM2H2nefeuWXtEv6yk9p7Sj/K4U6PcQtwbrFFBzjOhNUF2d/dzVtX7KewUpI+w3gGHFZvcrrcsb7o8SRY9Y9Wyk9Xl/5FsMEInQCQrr5iTdOGBVewZst9B18IK6FlQIbopJ3W9S3EPVqjfOknFSVAmN8hEL2ijLBZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174017; c=relaxed/simple;
	bh=WMywfnI9PbjUKLPp2Fs3M4g0w7tyQGBNDo7yzMHxSAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhmrVf/Ow5mMmciwq8R1Hlc8Fgqbl/Bh+glsXrrsJ4e6OI7S2EXedwri0eJW+oewQ1A5x/7fJFCjht4LePfJxTchDRHCNCVh701jMGFlDsv97oi/gBRT9u8ZoCPo+s+/ZOvIpu6UZCsvwdCvp5PyVNgswvqJIIkhzPcNOhcTo9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kcj/fPZ/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gsp2uhf+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kcj/fPZ/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gsp2uhf+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJ36kt3893457
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t2HzBtnh7QV7EHA7wh8q9lV9zRoeqSwGw+3QCMSiaC0=; b=Kcj/fPZ/cpOljFC8
	ggqErlBTtfF+TdraC1O0f1rho0XEPKKZ6o2Yw+WE95wpJdRXAc0+qCBIN/zepz9i
	LcSwm3oqsSsUlZC2OQRvxxPdClhNjkpWeEXSilhPesJt7G/DBKTu/jGAm3JuKgQ5
	H9XHXg/vRhgxSrecNxbG+HBo8xI+R1DxZ++B63aTilUJ8O8BYsPcxoZAk7kTDz3d
	7c/FUBMuxtNOBhlSPTp96BX9PefFu3KoMjtDL6+WGxEyQrJtf8LdlVhuJLK1twzh
	REzMRHwO0BV2rzW+BpmfiwiDIeZD8OL2t8QqGeF3nlYgxmBh7Ih3AT7Xazciul7e
	i4LpUA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmystcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:20:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8298150caddso4554189b3a.3
        for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 13:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174015; x=1773778815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2HzBtnh7QV7EHA7wh8q9lV9zRoeqSwGw+3QCMSiaC0=;
        b=gsp2uhf+cUpw1yLMgDC/7LfTJOApP0h1NhfOKqvmVCAUbVheigkxY35cl1JpOKBX26
         pwR4ztMW6PPFSJRHMxCNC9taPrt0XNDHe32pbZReq6uw3UJxO66HtahqnJE9TSXotjsX
         MMsngP/R7tfvx8dC2fYcvZcFpFtuke/eiQjEWD6fzgliFZI4zYoora5UyeQwa+mgFiyH
         RVp4zbsZas2/mwOpuykPhYIo8I2RszZc267ie0mwz3xvz538MbgY25fC2TDmweiVDKcZ
         PSWgLVksWevyJ/VTWRTDbKbVBIwiz50/vLrV8f5JpbhBZPLWQ1qIvNM5sq3ndBAO1Hko
         ce/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174015; x=1773778815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t2HzBtnh7QV7EHA7wh8q9lV9zRoeqSwGw+3QCMSiaC0=;
        b=GpsDQ9kVUEiADUHWKkjdQJ1epCQ7qD7KelpqC9A1vogt5owJsbFPbasmEd/cac1QRn
         TmyvVMgy1UxLZH5aAPPaNfiBg5lJ5IBnMZ5jGqYaeJxmOkwT1EALc7TebDlpBO+Uanqv
         FYcGfcpm1H3XEKsq7NNAF39RMZFZg8S8mW7gjUkeIWzPFMn4a1+jrh2A2zQsWgNlDJju
         Rqvr3rznARXrx/UXBcP/wfTSBiET/1oWBnXPF1+t2Wjd4bpD55ShDwzPHldMib9PuLp9
         ki3mVPUT3AoR+buOgHsh96dFpWxwFRNWdO8Y1lPAXdEHRzp2ETWWDp+qz5WX3jcvOJNy
         dd4Q==
X-Gm-Message-State: AOJu0YyePRtUDnZwAFCLvhEjn4ShgpAm+nOgtx3IqiIxHX5+gAOIvjv4
	B/xHPCCVzMqMLAaqRKIjrN5Gx3PN2MtNzS7dzX8EmrvChLrLYmNu/2NkGiTmUXo+BqTlUlABHgU
	jm1OfwcfqKnnMZ1V3eQr+Yra6/C3jLTN5X2DW0XG5nGcO46Rm6nP5DNCvRk2kY9w=
X-Gm-Gg: ATEYQzwd4jxXnQetMB17F37b8DQKqbkDNkqLusUH2Ot9HSpP9yKMGU36DtclrpaVXWU
	JZw/QhYMC18UJB1Kje/h1PNS0ocxJwMlkoVeF1Pv+PM1bC9vmLWHUeYBZA807OBA86FzY6couN8
	XDS2BW/sQ3ZuB+drRPxn2NuCUGBWir75cwfr1gLmAZU6srATMtY0682wT5khDhhDaa5KVNW4oa9
	iWyTSXYGHfeN6ZWaKnoB10gCeCg5W0VTVaZXqbXuOmgVz7z6mrLoZp/HDpWVE78KAOt7xDrQGmQ
	xcq3G8352Fs62oX1vYmP1rSNcGlQERHCXwWfldAlh0DS8Zl1kr2ZTPZBPCi3lViXXAMUEgjrHcO
	cPsaV8kxR5LW25HdFSGZsaq0QDoAQVmDd/o5c4t02+Jjt3EpX
X-Received: by 2002:a05:6a00:9298:b0:821:8ebc:2899 with SMTP id d2e1a72fcca58-829f6ee87aemr174151b3a.7.1773174014905;
        Tue, 10 Mar 2026 13:20:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:9298:b0:821:8ebc:2899 with SMTP id d2e1a72fcca58-829f6ee87aemr174107b3a.7.1773174014221;
        Tue, 10 Mar 2026 13:20:14 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:20:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:00 +0530
Subject: [PATCH v2 16/25] mm/mm_init: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-16-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=916;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=DTT/RubkS1uO6w8Q2uLlEU+1CHFNOkom7gwELIcItBM=;
 b=2RE1s2i4KuvAIh/et2VJGLUruCSAirKOtEoh43eZpI8VBrpC3JkYwLQaT5N0Z0sjwA4h7TPsx
 8yuvgeVV1F/DrKNesJyEKMfCO6ycGwgttYEV2WQsmy/djxLHR8nIR9O
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b07cff cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=R-PfVeyQBJMsRd_P_MAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HAVn4CPkRR8te_gjBF7uLnwIyDav1-8E
X-Proofpoint-ORIG-GUID: HAVn4CPkRR8te_gjBF7uLnwIyDav1-8E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX7BWLSPGLX/Bv
 XdwJ5WHJ2ps3H6WrqwBYEAVMNR2BidjFRXfHkeGBXob/hviXuFYJhkjiko4aOjHPik3NmKyUROd
 HU/FXbih/tJXn60v4hYerN9aalAGpVNW5gKg0FoRJNo9nqyOaEETieJGNe55Fh5DKsAUiskxZP3
 qzDdNV9Rm30etYHro8aNKzOmhkMUVWH3qs6tpmS5cC9mAhjp+YMohxvQO3jKVH7zFH0WK3uzKRW
 moIg6ngjvfiwJCF5+Obr2zcJyhCmDvViVaIAw1fg1CmXtObKinFGF9+FtMOLqX4qy6LnmJWA0ik
 uNY1Ma1e90WphjiPOMRAOX+hQloAR3utvtBGzf6r4VJBtyIWca/aLxyJCD6JWr3Rsu3YWIkQztn
 EFkfzkbpZ7sgpkTbeYywjSa/jJ2N6bAzuYu6GWh/ejnf7ozKyK2XvLuP8HCvgHD8SzB1K9GUfih
 RBbWqX0SJgzwooPXUgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - high_memory

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/mm_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index cec7bb758bdd..3cfaea1e0b21 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -32,6 +32,7 @@
 #include <linux/vmstat.h>
 #include <linux/kexec_handover.h>
 #include <linux/hugetlb.h>
+#include <linux/meminspect.h>
 #include <linux/mmzone_lock.h>
 #include "internal.h"
 #include "slab.h"
@@ -53,6 +54,7 @@ EXPORT_SYMBOL(mem_map);
  */
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
+MEMINSPECT_SIMPLE_ENTRY(high_memory);
 
 unsigned long zero_page_pfn __ro_after_init;
 EXPORT_SYMBOL(zero_page_pfn);

-- 
2.50.1


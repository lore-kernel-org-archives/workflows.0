Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786783C8705
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173942; cv=none; b=DEPxG95GH8Vog+yzUv9GMfbG4MdVGucywExnsq6OTRzpPj28WNxcJBXtPZyBZmPt2S/bwJeqb0D/Nu2FD2PXsiDmj00FzM38xT56IT/llD3FwSJIXHY0SP3VbJMcFJLVKCAzb/piVGgHueLzj7SsfqSbSXfqUK263+f6DlZGa/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173942; c=relaxed/simple;
	bh=JjyaV+tgv5UDZXjq5MizMtlnFRKCCCj76Cp/0PM5tSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JdOIPy4u12VFGiqaFvhNxc/INy1Eulkp3L9DOWbQDz+G3jycBOgM0rBfTq0fSQjAqFQXpwSwi1Bz0u/Z5JJVjjATJBDxBkwmmWx0KBniEEkGTNh0ySa9MlU9fFR43MnSIMCKkUgp9Ve0vUp5+fxi3GO2X8KMc6bCXscBQcr5v50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXvMHFKq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7/neEOg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXvMHFKq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7/neEOg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AJ45c33419279
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9TmROf+bPb6FNDxEurt6WhWR2L8qwZm5Ni95BDxLLsk=; b=WXvMHFKq+20+1g7L
	oZQU641VdU9D+cbX6AIovAiQqEr5nAj6pMMuZPy3yOFt3Wt9bNablBID4RKL4D3g
	wg6x7qai8CZwzdERZf/AnCgVVCABZDxrhBm4+3Ud6c5AnhIjA2TA/UpstU/qGbWu
	+pWrTVu6616q2Wi4HqFtVl+AGsMqXRERL62sHA3SQOIXs9juL8KIHh/u2/Lju7rG
	M+R4VT/5h+i59gwg0bduxUeOpuKM3zoFr5pBjSK4hmThUnqHwHC5S41U3f010/Vm
	yRSEenFCQbwavL+2kM2e/Hcge38aLh71cAdRl44mye1AUAnxyt/RCCt0icuwO1YW
	INbz1w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2a3ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:19:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c738563e61eso4143862a12.2
        for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 13:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173939; x=1773778739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TmROf+bPb6FNDxEurt6WhWR2L8qwZm5Ni95BDxLLsk=;
        b=c7/neEOgrsodjS2HuECUIxr23vrCrMYJlk8alfWeYYh//tzRp2PS5kZl5afBOATPgG
         ViGyUcZnlYjxUcteWO1LT1IuNGFtDGv1/ENkyiptl+niUMVy5U5awXKrJgS4nEcJX0fw
         XRxnk8mOV0NntsapoQ37sTjPe2oxwMJCcQGrZD3IKZBclBHoDu3Guc8cKms75ArOa144
         cozgDNGqtyjfmnIJpf3q/KgA869Ltry7+4zCRZSbPDWtS0MC68R2xcZs7h/CRD6lSp/k
         iXLbJL5IzaSWVC4lU5ebz7sgIoNuM3fNjp0kUN959rOuPcHiNL8GgXHhf3VEI7X4iJts
         FBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173939; x=1773778739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9TmROf+bPb6FNDxEurt6WhWR2L8qwZm5Ni95BDxLLsk=;
        b=Xz4z2LO4YvXAnxNZ+VAaxlHMSXrx5U1g00AsCmU+O2HXaT2qz0gRAMS2CYtZemy0Q9
         yMhRYnvK+K0cOKpxOloDa3gbU80avZOQFk9h0zjzPV57f9ltczgaEkvXiC2sOeWfLvV0
         2dPGfno2LgsIbjSYVainBHJ3hL4REMLM2qvvHjuj+jInOgx9wclKMibEtRmlVveyLmNm
         1tfh/fstVdwbm23CrNZxnRsWVZWWDFznjEwt46LdehQxKNrC1der2ghSfSZ9d9oL9t9g
         Cq2ARfNEHjYPzADyI9T/0NtWsl3u59hw93npSZggGUtH+kztrb+7vFz6daxNBd/bGdm4
         bfKA==
X-Gm-Message-State: AOJu0YxcXOYCZTaOMX0P5jHpn4xkdWqYxOYN78TPMT3W5oH1WcgkQYH+
	KNBCVoV2KKe4+orpS0br3bHwrKFxL+ODZ48rsoV5MWVb2pd3GGghMVM+UaEOsopehGDGCs3BQdI
	JNNDwKBNJhqCx+3qfLRS1EagliifA0m1QhQEjLnUyaYPxzCJykvcg5zsA1DUZ0wQ=
X-Gm-Gg: ATEYQzyel9wjTn9xNlKMYXRTu4UIasuObD5AxJH4md05U4JP+j8R57swzVAKjaR7tY4
	UjQwzoKROyCDAkSIbVFxyE4a+EFXXph2YZXmF3hNW6lTqoqAuiCxZpGmQZPeYhwvI1b9As73N/c
	8rQBvTtI3wGCk+07Huz3PllFcYRxInlgEp6Ld4XBsUfNymFjLEGDpLrE2aOuKVWjOWYlZ0OAdw/
	KMlp7DuhzSbDfa86ISX0ToDkxpXA93M6BJgXpc7IlZlUX1OMWgdIvi7LgAWqv8HO4yl4qse9fDn
	lMqaEWsmY6t/VkZ2EuO7VsaqIXRdwZLtdW7vjuVul3TZBivGNEsSpKJ4RBzausokNVeobn903xX
	KWXp0+t/a4pbnmiI4IrOFiE4hjTl412Ei4/hhFKSIdUQFnOgM
X-Received: by 2002:a05:6a00:a208:b0:81f:852b:a934 with SMTP id d2e1a72fcca58-829f6ec4858mr185478b3a.24.1773173939238;
        Tue, 10 Mar 2026 13:18:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:a208:b0:81f:852b:a934 with SMTP id d2e1a72fcca58-829f6ec4858mr185434b3a.24.1773173938596;
        Tue, 10 Mar 2026 13:18:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:18:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:55 +0530
Subject: [PATCH v2 11/25] kernel/vmcore_info: Register dynamic information
 into meminspect
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-11-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=1244;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=W0/rYOUIz9/ZCoXh44K186q/e3UtR3GkqMBkRm9T0k4=;
 b=ludxEbTdMls4VjiNy/QHAIk8/k+SgkzNMzSydpcQb8gVJ4uiMEuIbGBNqWIItJVo0Zf5Xkd+v
 kxXcoDDsIsOAhyrZZK7SX5Tg2/pa7IFWKbP5zQo7BszRJRELF9pecT6
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b07cb4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6_paXCCOVaejlYIppVYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GN3iB7CbtrEDdl1wszv7xOyUV1Eo8QEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX3QwQB0tkrQ3o
 nRQocuhjLlrJ9ygMils3OQZoOsk7dKN9jW2KXwYji7C/hQ87vNK0L1c3LHRLjCzF2t/SRaftmEx
 Y2kjMoI90kXgefiGGJzve5KjISfBeTLEBgplIs2VL57MsToYfQw8EQIs4IGjbtcV/aYUrk4Gpww
 lQ0YDTm5VEjoRW41oH/pfKCK4cxLYGU/C9wuhLL7MKYo866fv0Z1nsz5LZIOOh1NQS4jYq/s4Iu
 p5d19PnPAGnOsTBJGpjNG+tPKFNtwZ205uU4v888dpxOK8NkOM6Dwq/QXl41Zmq3MLO5GF0YG0a
 xbpmpFSSKwTMfyg9EZjH8r/HLLiBGQoAdDr1GEffw+vp5PTw56Q0Q6AST4yTUlDynDij7Gp4v7B
 LnO4iv758dfUIarhLAB1QhBrCne3WSmuzf2iKTngJHFuo2UVL3Jx0IeCrHVKA44Xg2y2ifg2XxF
 GnqZOFvVpRqaupUgGZw==
X-Proofpoint-GUID: GN3iB7CbtrEDdl1wszv7xOyUV1Eo8QEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Register vmcoreinfo information into inspection table. Because the size
of the info is computed after all entries are being added, there is no
point in registering the whole page, rather, call the inspection
registration once everything is in place with the right size. A second
reason is that the vmcoreinfo is added as a region inside the ELF
coreimage note, there is no point in having blank space at the end.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/vmcore_info.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index 94e4ef75b1b2..4ebb280dc38a 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/meminspect.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -249,6 +250,9 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	meminspect_register_id_va(MEMINSPECT_ID_VMCOREINFO,
+				  (void *)vmcoreinfo_data, vmcoreinfo_size);
+
 	return 0;
 }
 

-- 
2.50.1


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBCE3BCD02
	for <workflows@vger.kernel.org>; Wed,  8 Jul 2026 05:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488909; cv=none; b=aCr7oGaVfvHjTRb7TJoe8QikcAH4aZD784jgWgptruhDk3BcsKYKKtaUcJj7+9OIvy4dIqYjqGWbs8EUK8bfmAam1V5JaoExz7Yq9Fsirc8mXZJNZPr6HuTT+RABa0selsR4NAB8+tZFcpSXK/7yDzquat2DUAOdA836EVbdIbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488909; c=relaxed/simple;
	bh=dQKKnqGBFhStTej2/7vdZRU0D9KWrTARaJgojwH0KLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCAopS0UpCffrvzqwRkq0Xmi9uTceGzI7f9/Dw2Ss/xuNQ7spcmBvIEPJBn6jx46k4Ensu/nZ8gBuxjtCijubHrtNF0VZiCAXigXvRmUdP52IUFrlzgouUF4pdMxd8m76T3B0J6NW7bgJ+BURmcWxsAXwxsWq4Fdi0VyquoRLkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4u4oLee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEohFnZ6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4u4oLee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEohFnZ6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842a3L1491301
	for <workflows@vger.kernel.org>; Wed, 8 Jul 2026 05:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e3kzuLsbVSP+LQEgSP+wDvBNkj7pdMjocJ33jwAybcM=; b=M4u4oLeej6p8aS0u
	TRiwSM6+IF3MEJ73TbAD5e3O6bITNiVhDsevvmXVA8qM7eHF8ko+X7aB5nuu9aa0
	VGyZj0lxfsCcIoLynfx+qcUXzgOwfBJSVD6Coh/wG1mrFdfAuVOm4FeR5jHxaJcn
	OSVcziuUAkVr0Jsie3RsCsuxwHRnw92TBYL2AsOpSOI25B2LX4lyximoVyCKH89k
	RCi4EMAa0qHudCXQ4GNEai/e3XLrrL90yW7MoFAGAG61/ffzdilghSC5UKSGVJkZ
	pBAjnOcJqrkdnfbmUkEkRcCbaSL2MoV/Z0A5zUJxUgBmiq/OUVKrib1maXiZWC4R
	hd26Nw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5g94m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 08 Jul 2026 05:35:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845df469a26so905309b3a.3
        for <workflows@vger.kernel.org>; Tue, 07 Jul 2026 22:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488906; x=1784093706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3kzuLsbVSP+LQEgSP+wDvBNkj7pdMjocJ33jwAybcM=;
        b=DEohFnZ6WJR00zFFPJAACmfqd0/7Z5qygNKKSELYajpkEo2DpXCC06rx3DzUHN5fUk
         ej//lIrahmH1Ytwl5bQ+b4vSP2BcB0hwbvCG86TTHcm2A/5Bm+Aj+tXCjRdt3bML+mjr
         8THIyNZkdIUFBRguHtOpOoplwtlAyXI4kZ23esjPHAiKy45NRDqkazMgeJrC2FAkNtWf
         0GZAEiUW8evsTZN9M5n6Ua3xgtE7FwAk8q5ELW0QsohQLgij2llf35pjmyi+oxCxi23f
         De1rgKkVm+5u4sCbZE69KH+vovAg5oOsk1pybYjQ1HgMj/7W/uiw7voUg1RAUERrDoI8
         CUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488906; x=1784093706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e3kzuLsbVSP+LQEgSP+wDvBNkj7pdMjocJ33jwAybcM=;
        b=Abnjx1fHKPhuUeFDgU6VXRQOwi3XTV/aVQZp9D4rG10WFwgqnYpViMdKHgmcFpwOp0
         CM/hiNLBkY02vBTm7FnjeLIVDEm+C9ktiF+C4fB9U3JztBfODSS53pj/iQu2XmYYlQ8L
         qjOcRHs3O21TXp76jFjfelGECPmrUjB8YxkvPIe/8ybctjoyhkzgQYs+YPuWAT0yedfl
         CKp3TVKwxhdiP/t69P57DeE4xiKcMlrlyKbQgMJu1W0XewrSxOF2/ndZua5O8eyPdKDt
         aGRgtLbaXZFPGOQIXHrjLaXf/veY1ZDtfEnH36MHFLxt5Pb4oq9XKayRBRor8oAwYMSi
         FQSQ==
X-Gm-Message-State: AOJu0Yy0576rsDEqoA5YVdr1F7kkWWgGAg9GVJU0dI2RQG2EbjPumsNu
	GJIh0HbL4TN8jLwWmVHAyHRf2777bXW0nu1ijkSbSWO6JpvZVPYC3YFZE/e+i9TWa/e9FXaYB37
	9IUtzgY0T2SuyDodhIaaByFib5vgi/PviyG10nmpoXvjhr5nWyw23lm2Dlwq5za8=
X-Gm-Gg: AfdE7clqI7SBvg5zQjrazW8cVTbiJYibsQBax0L3FVQ06LUsXnfX7bb9YtFKGw4EoWH
	EFBxJC4TGC10fzmzc+nneKU2sUc3RhGDq1U9NTd6i8IZs4gfmG/X7o9BOVQeDsJvS2DjNKoXSO/
	f2bIc3hTSc8UTJS2TVxvBQBE5YnP7onjnbei1fkP7suh/NvXKTTMnPAhnOUZPr5j6jLe1bxurjO
	OsICXn1Wn4WrcmMK6DYI5OgGUkxZX0Lu2O+7gAUyZgtI4Ybmh65+PDjzj8rYcYcJz+QJ0oI66oX
	bLtn0VSZQ79JfEt8ZflB9IGJrbf3sKvkEo82SIOnqqic5U25RgmjCZ0N0itve+Ep+uLt3MZnFyJ
	z6MffMqTXao9Te8FyAVvm6Gr1WwWm7Mqy6sDjNA==
X-Received: by 2002:a05:6a00:9aa:b0:843:49f0:f5a0 with SMTP id d2e1a72fcca58-848432a16ebmr1252326b3a.32.1783488905617;
        Tue, 07 Jul 2026 22:35:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:9aa:b0:843:49f0:f5a0 with SMTP id d2e1a72fcca58-848432a16ebmr1252249b3a.32.1783488904894;
        Tue, 07 Jul 2026 22:35:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:35:04 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:50 +0530
Subject: [PATCH v3 11/26] mm/swapfile: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-11-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=977;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=Le/Q1zQCFzKw7TzU97mwXcZteClh+RXmg0tVYvpLcUg=;
 b=/A38jB8jdahPqFeNwjbw3VsOCOB71d39aCOjB+lkv/q++5YdKJm74I+QKrYoRlSQmDy7ph1py
 Js3L+F1YhD2A103w/t5mZSZ9W83XBW+cKVhsPjinjQelhxoWx2X6Hww
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX8NNehU3R0K+v
 cNWZNZu7qgXlLUoLzclavz72AYLnhSHjfCgXH7LY/J+r3Wh4xQfq6X39zfZYoP1i/UNR579lhE/
 yBaJPCDhG8oo11DogkQON8fpIiT1c7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX3Gl/HVcIa8dt
 7hFLh4n/m0yMhE2JnceNnpBISe5aqf1C+npJIYA4lAiqPbcRFC1X+kmaI7YO0IN6iMAvf2ARFTs
 pSYcQDsc96ZkWnKALrThofRMrL+UA+rt46VsmUGIQbEE7ZQXweRRKkmbSDdIiSnMO7TFJhzDiEU
 7RXWi4iwIPPbpx8cRgFs43gPvxTYO5NLLt/zb/lHaJpWttnXtrPjCNNkBGJuN+pFFywIQYNoGg3
 iGZlYdHlFpGF6RwPXfMAwo1uaFY9/3UU+Px4yAB0jE7XbXdLbJYMxkYVOpyL2cXgAmLETbxygSE
 b+DO58EiWG1tj4wz7cEQ8Ac+w7h5c41lXTufebgEHHhn5uVEeF90Wssugs5YBmie7xTvI8bGcef
 b/c32k85ZkgQDBni4UJODFGCl4JAlWdvt0ILsHNq2qAFIFsjTautN2T1Xp/2YgfXyPcSD57ugvT
 NZ3GOg8iyG7UunFjh+Q==
X-Proofpoint-ORIG-GUID: HyyfdkdOZZ1dEuD1JUeR6dK1C5r8J3xk
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4de18a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7W-H8-9HiqHpPtFVMfQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HyyfdkdOZZ1dEuD1JUeR6dK1C5r8J3xk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - nr_swapfiles

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/swapfile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index a602e5820513..d480727e4987 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,6 +42,7 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/meminspect.h>
 
 #include <asm/tlbflush.h>
 #include <linux/leafops.h>
@@ -65,6 +66,7 @@ static void move_cluster(struct swap_info_struct *si,
  */
 static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
+MEMINSPECT_SIMPLE_ENTRY(nr_swapfiles);
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under

-- 
2.53.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8CC313527
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174049; cv=none; b=pNWonSdquZXcjDdBMBoxWngoiN0KDyHujSSq9457H88vrm7Pz0f0KrzWAt6x8XQWuNiZ3+h/0M0aOyXs1CjT/zNm+p6WtLU64zp+c9aGgb1oXE4h+4E0qNCAMFddhjAZMWwwSLKsgyu3dxM0zhqj2+J096geUMzWZj5KFQiPQbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174049; c=relaxed/simple;
	bh=6Bj6mC+a6VBQpII15E95Sp6w7GOQTay+uqnC/6WwCwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t9/eh5qNNA9K8Uw16k9d0TkL3yu9qv/j3WQgdkWksGSp1WLB16blwECUknX8Rj7OeWXj6oknX4mHipoql0R5IWZfYip/BEnCCT+n7C5A8bLjk4KFUHx1TK2kIQcAsd6+nPcH4qmt2CQLYbbIyEyDFy98jZDk3Sid1Zd8nxD0O2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TA9HNEAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDJW3FnF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TA9HNEAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDJW3FnF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AGH2gS508450
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jopR4iBKMZiW0WEP0sLMhWOcTp6GXZxGsMBTPgmxLMk=; b=TA9HNEAS5Og9Z2Fk
	ReNSVQ1eeRV43iBdF8RJ0o+ZkbZMFzv62RmBioWH2uZQ5SxhGftXd7erjg/h5JUz
	AEIwuvWttlHhFCoDGWWBB4PUnq5fLu8MhbDVUVsO/XLUiPu9a7d9V+HaPKy1nTAX
	BEhwiXcEQwgOVRKwfPNCYi+fogRJxPvYFeibZfpIxiTGfsZUuKho1/ZTQ8Bdq4T5
	OKuwj6BnpDpdAn0jJ6pEcoED8ux8lYBJw+LzCj/cAn6NyA64nF17PjpxxswLXfsH
	AWF80tVORsa7QPW4nJFoM7DzoLE7rCX9L0RIR30iZJg1tfIREX+RwJFHHJoa9Cgo
	hP2gyQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctppagx30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:20:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62da7602a0so8029565a12.2
        for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 13:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174046; x=1773778846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jopR4iBKMZiW0WEP0sLMhWOcTp6GXZxGsMBTPgmxLMk=;
        b=ZDJW3FnFXEpNhwbrESJkN4UJINRxCbCiwoG+AowG4ZGiufQZGiNlFrll4QoZRycJ+X
         bKtv6lyPUo4g9sVQhWUI3wwm87+tXqDmmR0cYiFUBr0u6ZtPde3XSD3mbvkxpBcusbBz
         a34kYt2RyuxbB975AUZzjiaP6q/63S3it8/h0Ql3KJXilzRzMk+He3jdIUVAeZ0/P+e1
         dvuhsji5czjDN0BUOFTVAf8t+5ZDL50uMx6qLivJ4tcUI2r7C4ZoHOkUR7Dydhod3T8n
         OxpijVDugx26NhcA9sYpyoFUlIekq2o/8smv1ruUY/zBlP7nUHjhzaALSDr75DYLRJPS
         cOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174046; x=1773778846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jopR4iBKMZiW0WEP0sLMhWOcTp6GXZxGsMBTPgmxLMk=;
        b=UjFLOYrMyAg6Rxm6MdycW3ZiW7R+CUvQ8Z+0vmtOmqPJdEw/v1lWezcZAJ66lIcxuQ
         eClqY04uZQbBItFzgKXofAtflWvjyRZpRWXn0BzcW3mjikUEuKMPPyPz1e6vttvrKF8D
         OPdC7N9oakzyuDHydZLMsOHX1ikRNotu2obpSkY0ElFOiWBQRzv6msN0KmMKNCmR575g
         xQTc6TQ/hl7qxjEQJtqVKQ5Lv4/8kBTwh9ADhK0iDeAn6fmayLb5+EOeKjgkriAXfddg
         w6fRFiaBVS2Eow7iPY86rK581+oNcC9c1Pstz1A5bofUmxgcxjI4Ke0NWVKV/+A7WHX7
         1b/A==
X-Gm-Message-State: AOJu0YyFM8yH88wE0Th/DJoNbqXmVFzjcfWTOLNFjJByL1pAtTYS1Fnp
	KUJm6QgIZ+oD/HqVz7b5DMfMdw6FIlpjYrwBoeUxEudOhVA42Dvm518pNzn/+IyX2YkoGHemK0B
	VE6JPsNOojFExmfAnHmix16zxgbhGUdKwzOqGLao27Y4LJubczadGHIjghrOpGFs=
X-Gm-Gg: ATEYQzxaSaTM+SEeI2mBIsc8t0T+tezX5YBVClKYm1e+SqQWNkVMyBY1wqE9gGS06SM
	p8IzyyKmScCLaMj65PDO9HYFWLkA54aziWsWho32efUAUpWUoePO6xtK+IBnrx6Sy03oJGkeOp6
	vZypzzwwjOAamDGvfgnBJGLMFK1JIjwllNKKofv17ntFB+g+LFxeCbNKT7EDlq+fv02ulpQs+R2
	eVg/rMIVT76j8CvKv3hPJwvqLlYUSNyq8lp3PsW//F5/kw8Mluuhm6tOQp1YhCLq60k4ifx4O8W
	WvEY7Y96AFk8zkzXQhXKTVFGhllPQ+gYR4K/82lGjJtGUeyiD9BCoEkpLffHu+XdjkTfJ5OKWsp
	8aKlOo75zVZjwsk1YGSYSWtSgJBFYuvZltEycKbrH/EVCzGlt
X-Received: by 2002:a05:6a00:a245:b0:829:7a62:5f with SMTP id d2e1a72fcca58-829f70729eamr159362b3a.9.1773174045418;
        Tue, 10 Mar 2026 13:20:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:a245:b0:829:7a62:5f with SMTP id d2e1a72fcca58-829f70729eamr159313b3a.9.1773174044746;
        Tue, 10 Mar 2026 13:20:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:20:44 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:02 +0530
Subject: [PATCH v2 18/25] mm/numa: Register node data information into
 meminspect
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-18-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=1043;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=6Bj6mC+a6VBQpII15E95Sp6w7GOQTay+uqnC/6WwCwU=;
 b=sVE7UB8h95VErsPUO4HLhhiTiKsqQAwG/9Ded5XkdsuZg+zS19SjzGCGHXAkoG9YisCapzqnx
 q5gzTZGzf7tAtbmkLgYEPHDDptUq+d/dYvl4noJdNZrSjHyxzW3MTLb
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: xZ_1OBUviDSUPFhNr7JRkjkkvDn-OenW
X-Authority-Analysis: v=2.4 cv=D7BK6/Rj c=1 sm=1 tr=0 ts=69b07d1e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nLJQaZXserL0MincpKQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX8Rka4a/c90ge
 6XbhN3OaUL50S2VwY5QJiQHq3EOp6Lzk3oDY973764Af8bLiFCvFDC6pQiw3A8t746fW2/0DV4S
 fZ5t4JnCHT+0pwAhcPjQsWuBRM6hf7qa0cvPuwzt94B0UkshKGiWjBfhl/HTEURAuIbNtGGELCk
 LbUk92PFXPUR/uHnLceQ0S46twscFPMna26kGxVu4Z7uPrs3yaoNmwanU78K9pWDvEdyjPS3rSS
 NpPLhvQSJnY51GO27elJJzZSidZxArl7P4SGvCl1t1urJiGEegtdPDcUWi30xS8NDCbqSAE7uki
 61KRFGSBxiDPCe0PX6vPcimleTftBYf9+CJN+r5DTpCWsONNNQTVufOX8bXv4+At6S2IyYaQBIq
 el4EXchkZWeXa1Bo+XflnLfXrLY0iDR9Fthq56/J7s7u8NJungwgsMs0l6pwRgcB/zYb2vipgVf
 mcjpKlgZoE+PMtXDe3A==
X-Proofpoint-ORIG-GUID: xZ_1OBUviDSUPFhNr7JRkjkkvDn-OenW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100177

Register dynamic information into meminspect for debugging:
 - dynamic node data for each node

Use meminspect_register_pa() to collect node data into meminspect.

Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 mm/numa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/numa.c b/mm/numa.c
index 7d5e06fe5bd4..fcf31bf2c552 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -4,6 +4,7 @@
 #include <linux/printk.h>
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
+#include <linux/meminspect.h>
 
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
@@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
 	if (!nd_pa)
 		panic("Cannot allocate %zu bytes for node %d data\n",
 		      nd_size, nid);
+	meminspect_register_pa(nd_pa, nd_size);
 
 	/* report and initialize */
 	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,

-- 
2.50.1


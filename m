Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610DA3BCD13
	for <workflows@vger.kernel.org>; Wed,  8 Jul 2026 05:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783489035; cv=none; b=lzF8lAcVQ/AZBItPwJ93uGYYWSOy0G/AWewUxMjJ2sGTnz+c9vzZCVDMjYjYFelgHgbexiTqlhrzioO15tQ/h1EB4JP88hI7ia5QrzrHpPUrkLL/wqCBGCwIR2NzcAXrVY/1b2ifPMieZ5GhqyO7zkUhUb3Z88HSTMBWvCFkUO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783489035; c=relaxed/simple;
	bh=ulGsdKu+z7HvLotkVxGi0y8RHEdMhDyQClvnrll+Bzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L5RHR0iUgNt+N5SJswXfJ/0k4Ltd/Nj77Wurlgw3a3fPhZ/Ws6bvUiEIh2zoVF10RoF2xNcecIJShOUuK4MVnNmBNzFIdY369o5J3g4lWXJHxTlI5m58tTT8G/zTHWCQNDDH4GAGH8rqze7g4PgnQPHUTZGH5U1EKaxZ6XBZT+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+jq7OyT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8xkuJtb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+jq7OyT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8xkuJtb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842GVc1508981
	for <workflows@vger.kernel.org>; Wed, 8 Jul 2026 05:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	236Inguw/8J4ynlJvnfLp1ewWMlbBoPnuOUaZpd8dt8=; b=P+jq7OyTqjAc9wXu
	RxNeVEVWgYrBpdAGK5o3b6AWPpRdC/g1cbrqpKSQiGfUKvq1e+0DgOyE1riJOnZj
	lMFxe7ytkjieiLs1bLJJoI6UfdSwS/kZFnw6Ci9E1IqzyI6Y9DJJ7r08KjH1V0ru
	9wrL3tchIUUG+dXTt3ewbVrMxTEodI7+6+wCRFSxdpxYZ7QWyJD1wL8qcbsxkW5N
	PWAAHB8x9PzRoHQMrt8RSH2RzIU9BvQagmTR5nMG7cOd30b9kwE3GnbuBDdz/2dk
	0MbD7d+C9BijjANSzQYL0Nrm5mXyk//z9XTUjvKIIksxsnJNEWkm7PJ44mkMqK5t
	bfEhbw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9be591n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 08 Jul 2026 05:37:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894391f000so690852a12.1
        for <workflows@vger.kernel.org>; Tue, 07 Jul 2026 22:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783489033; x=1784093833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=236Inguw/8J4ynlJvnfLp1ewWMlbBoPnuOUaZpd8dt8=;
        b=h8xkuJtbuDUK/6glmEL5W0ajqq21kzfRtjwCvyXm5wtJLYBGQweI8X/ZlHcvHOTS8R
         mCzSRT8AWj3x9dao13wIdi8Jw+Vc1S476/bExe0K77kYkdeGl+S8AYj5D7iR7iTOUhbN
         0CraUq8PwP8pCV0nh04tXClOkOwYZZ3U96Y6laQEKuHs3ooX0+GQlbH5yQgy9QA2Eoqr
         pWACC23IoU85UKqnIbwnH65DZvaGuPOcTZkhGprHIW25eUJFcuhmNQ+WO6pmp1p69cTn
         Dd2y7+Bo4GDXGgPddQ6SlIEJikmMXOVSlSUzslbWnUNEPLYYjTqaP8eHJJn3cbyA/9fv
         wKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783489033; x=1784093833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=236Inguw/8J4ynlJvnfLp1ewWMlbBoPnuOUaZpd8dt8=;
        b=eYFehp+HfRhv947nSbGak+8xnlxxvY8OK2/pFB3pfsLUDttaP9zQYYLFisvWy6nPW6
         YKmkJJSlLnGrk0ELdf3hAE0Jivg2IrbJSJxM28jisXiouIe01NMAGGihnN3viv/twO5W
         Hj8jKJEm/89cVPSZM+qdVsdomFF7+7pQlkUk2nGsUpEXcQ1AY1rRpBkegMEv6oKt1hPN
         R5oyIDPChlN+iQy7KV2uH323BgqaILDdYZAEz1n90f2VFj7mky9EZacJSH3ZZ+EcCHkw
         UQ3AYRVXpvAZJ8/YmJsB2zNuP1qli+bY44T6SbELzWoqT5qJhI7uFh+17q14rCOF35jl
         eMwg==
X-Gm-Message-State: AOJu0YzIpn0kFPdB/Gy1e8y7UqKHjJ50WpvxSf2uaKvPN+zpw9+IqmB5
	J61ENPVDzNMa/wAwjRUUlLolh+RVMMZbYT3cVwBpGpZRWpLbPfid4hx/nKG2KpvW72GcTwWDrd9
	B3Gp/ucr0Idt27ErMY1fBc6FiQCCB7GRehOFzv43l0Hk8q+7e/g3ZZ7T1490yur4=
X-Gm-Gg: AfdE7ck1Ads/d6ksI+BiIDWK3c+Gvs+HYZAegeNlnOKBZzWU9b4aFUsKkVz9aLuJhJN
	CJqBV4VaWD57F6AG3ht03nL0imbVuq2uN84EQ96y15gig3wzuFF3QNwf6ckR4aQMgSsZmp7Weyd
	JwSp/UfHxbohBI15KGnJCjdH3H5pH+ZfdKCdGNhXNlIpSz1Ip5CSuf48/M6EweI7iOyr27kkrMc
	43uLaF5gTpPExMLUHPkGdJu+/tjABKsNpeNEIW/5KtG7/GFKjG4k7lHAhWgGyBhBfl99Tmau7th
	vN+pQ6hju45xxaeLXrWA2XyNkL1WL8v5mkZkgxndcxQQe7N1S0L5uRJs4VEW+vPgGMbhiI2e+/U
	nH6JysTdjeCE5MRDE7hvH+uC4ZZz39qEz6S/lUA==
X-Received: by 2002:a05:6a00:2990:b0:847:927d:47a8 with SMTP id d2e1a72fcca58-8484327cab4mr1157515b3a.18.1783489032870;
        Tue, 07 Jul 2026 22:37:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:2990:b0:847:927d:47a8 with SMTP id d2e1a72fcca58-8484327cab4mr1157416b3a.18.1783489032130;
        Tue, 07 Jul 2026 22:37:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:37:11 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:58 +0530
Subject: [PATCH v3 19/26] mm/numa: Register node data information into
 meminspect
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-19-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1048;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=ulGsdKu+z7HvLotkVxGi0y8RHEdMhDyQClvnrll+Bzk=;
 b=MyMhtvJ0wOXNwjzXvlmiA8Ab9JBujyIxKxBCpE0ObhCZPfckWyAffIDGpRxS9EBhvOuKic1KN
 jH7INpGJKThDjepKcHIt//QYPSzCAx6MP/DqcCdV9jTWtJ2PBlwoCaR
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=GJc41ONK c=1 sm=1 tr=0 ts=6a4de209 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nLJQaZXserL0MincpKQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXx/IuJzENKsOb
 l+KVOxZ2VfDqX6zux4rmcap8jh9jV38zFPjClDxelBxVzLeqUw83dacBLHw3daHtvAp0TWqoNeX
 ZACqc5P4wkIYY6OIgEndtkGkItf8fys=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX12BXQTeD2+uF
 TWGKehwBWCWQALI6JK3OcrTbo4l2e7rHXQnXJcIiVEhj+0gxOICa09USQrD4WCck3EIfH9+9k51
 he5y3fvLdnjtDxAAyngFpVmbYRmdrzsYyb8I38/WIg9mXn5oYDbZmNfJE01kVhk7dCk+ja89q6/
 8DNR5mbkJvguPcnalD9zfMgQM1yA56Nyn0V7qOM1B6q1ACUrYvxXAGRbSPAv+4y5OychObhU/GE
 hQiXtkpNYo1MJnqvczNM48ti1zJHQf9Xy2c+yRFsYM4X6eKHqS2HRBJdmgm+qJQI/TFEFMEvVzU
 dxq/LOMPrWyek+e9EGYujWPeAxxazOeJ0ViRPK75Mo1DronNNC1QK2wF3ML8MmwJy8Dc378fsTp
 cNRqYWp9sghxocszjMSD/UFSX2RdC+GSplYPx5AzKksxF2brk7BIXzQ9DQlfFdJlzO8Wkn/MpMb
 zmvh5CtuU+qRbWQK4qw==
X-Proofpoint-ORIG-GUID: 3F0n4c5s4btPhSM8n6DD5NTzbp2HrGlZ
X-Proofpoint-GUID: 3F0n4c5s4btPhSM8n6DD5NTzbp2HrGlZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

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
index 7d5e06fe5bd4..f04740dfb2cb 100644
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
+	meminspect_lock_register_pa(nd_pa, nd_size);
 
 	/* report and initialize */
 	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,

-- 
2.53.0


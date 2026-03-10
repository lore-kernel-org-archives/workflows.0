Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1CF2E4257
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174125; cv=none; b=t6YWS1wcscFNbo/rXKqp89/oPJHmxkpt8N6zUZGuFuqzw4jOBJZe+rQ5CGn2j+HoGm313ZXnFPd+AZb46cPsuc8geTqvnHNXfsF+BmJhC+RK1xYcdrpp/rd1ZK659EpFwKlF9GDTc0bxaIc5w06fO4GiHx8xWq9MclxC4+15zyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174125; c=relaxed/simple;
	bh=wj+luXvDqOTuhru6DvwVtnX3t9V+pGkO1cWy33gHiXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LrF+XoI97LF5ahXz31+qEsAVWyGxK8ToQiIJbWKdX2P7bHFUSTOKUrqWaHFOspM7XubtSRET5RopIF3ArcDlsJWR09iugx/kPb3RbBb/uoEYCtIIn1mjAmEdLRIhG1CuNfk39SQcWhUiFN+wNyfQz0y1hAB8TUumrWu6cDaR5lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSJh4uFS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkGKb7cA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSJh4uFS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkGKb7cA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIekDw3893219
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	brkrGexervsDjeRqs9RzmRiixQVaocfEogoUtg08MW4=; b=YSJh4uFSvGRFmKbt
	xH++W5JgTe8Mvq0fGvsD2Y99YvKm3+U/JThznCK640M/4G1wZVGCwHZuJB5AL4uc
	BGdG2d5v0LPy05QsTa5J4pE91O5LS2IhS89xNVbJre3CaYQyhisVPdBrzA0Csrsf
	ch4dglNxZaJuU09OJoFN/NN/bZrojYcf+1p/WJ8VkvCTyRWoZfnLvhSr7kLf17QM
	MMnsMfF4h2wPWDlhwdbI84cesSWDUgqAj9pzWnJb+p16SotfK08GiYiZbRVt8sNd
	ckvjBYeQ1d4X6tW2894rVZYZgNXJ9STajqqZp56lAN+Eq/iY+76uyyg1rOD0XXbA
	cbB/LQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctkmystjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:22:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8298b363fb6so15165014b3a.0
        for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773174123; x=1773778923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brkrGexervsDjeRqs9RzmRiixQVaocfEogoUtg08MW4=;
        b=IkGKb7cA6L+SM0btttu2n9BPmYXlhzQ5cYCiQxGbMlYBdZ0rAvl2cgh3Vy4NSueScH
         wl++0CyHSI9+AZtVWTQPHqweiF1fj2JhLopqZGTKKUVdaYyf7ioZB4H9ScSiAebWT03k
         OgvK3yXFyJ6YQJdKhTdyOcLlzOWeCL/nolrtXYGo9jE08OyT9CzhIzJ0FGy+KrHgNgQI
         3g8axPLjmQCZGTn1cCpVSFExlXEEFquuSG3bvDfIBmcayxkWRO5mfkV4xI7Zexo0/V1z
         APPTn3LkpSYzWlNEdyu8VjcONXu+hLa3zSH1j0YFHGBxNd+W1OUNq/3KJejfmILJv7wg
         ooKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174123; x=1773778923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=brkrGexervsDjeRqs9RzmRiixQVaocfEogoUtg08MW4=;
        b=dBAQOlQDeQodOdTL/8wUI97Dm34mePNVa/lPmsNKUTdNeAHaEyx0o02lcjHsY1f8gl
         P/bICVVXnfwp2qGQ83yCH4NaXVqtT5zbi9ydn9W5qtzwk7pApfzXEiqpiUSRxFMLg62d
         KZqQ8VTQ6VP+SreP42zkwFazdq8aoAKZk5a8Qiu33HEnjnYE6vBgC0c1y0aC/oumyI5d
         7zPxhgzQUPncYPv40DEe8YVnWJ2iH0RQNt39BypOzoL3X+n8shKEDpP8mCtprHeh/eHS
         Uroe3Xg6ML2wcvzpZIe1PV6UjaDZvCbHm8oSY16sJAcETTxtMztTqScLNF/BOqQzChBc
         Xq6Q==
X-Gm-Message-State: AOJu0YzEdKEgnsgpeqIDVXZjTcYC59xcUwCSdZtqFE1rpktEJSVJ67s/
	rxAfxHmdcokBxXLuUeQ65udsKRKYSrX3Y7r3e+0PdYhyM2SJqdjOOyvLxjzTGkHyAzVOZH8fTZT
	YcKWrNKZC5eyzsvtCYh7HgiuKGR4K8uCxQvPlmj4hQZHibW2hGOJxsgcQOvCA8w4=
X-Gm-Gg: ATEYQzxOGAMjJriGMo1IjFz9Hv3prx028Q3WgqiqFkbl3z3//hy46ZRzDguWaJHSIme
	bzAoBNFfmJUxwbCBlC8pK/hBkJuyO6JSQx0/Um7zAJFKT8X7c2Zx0psO+Ic9G7vlESET+KbrvN9
	LqcgHtQGKt2JtALsL/OdcG0Bi0sPHQMtNYmoYhVtWn0WZvBF+SB7ZJYtPUcCRV+FKTCLxR/ecEP
	o9SxZKtoZpJsJf3wo07Ilg9AwQmA9k3K+wOROk7SgPvjvRu8txnrHuXO/QMkLalsU7LpuGUxORZ
	iNZkHAbx2NPwI/O7OYD03Vel/d/mm2mrGDiyXU3ebhEWmmk742vv0QTuk8kydVcm9BEWOqbQ8Yc
	YOXbeLVH6kfNzXWO6tHnJn6VDd7mf6rfE3r9AUm+JF4TCpMDs
X-Received: by 2002:a05:6a00:3e17:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-829f6f2abe6mr177038b3a.20.1773174123251;
        Tue, 10 Mar 2026 13:22:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e17:b0:828:f1d9:22cc with SMTP id d2e1a72fcca58-829f6f2abe6mr176989b3a.20.1773174122629;
        Tue, 10 Mar 2026 13:22:02 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:22:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:46:07 +0530
Subject: [PATCH v2 23/25] soc: qcom: smem: Add minidump platform device
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-23-f91cedc6f99e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=2191;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=I7h36vRINCl73eGOjCLTs1uEZfJpGZtYWsp4d/Eb0ng=;
 b=rMdSNPF/xiEgp7h/2PrlHDpbz9A7fwnRMH+HKK1W4eqdbkbtkF909spMFFFZNQ9yLATM6QiGz
 i5Npb95/nW8AU/UjvwC8S9P1wIPcyGpH6PiS6CA9GiFk8+2THVKvvef
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=RYudyltv c=1 sm=1 tr=0 ts=69b07d6c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3CFpAjl5I9ltKDqHFfsA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MGCPmiVzVakoe7jfyk6HcgRZiyCJqN44
X-Proofpoint-ORIG-GUID: MGCPmiVzVakoe7jfyk6HcgRZiyCJqN44
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX5IFZRiEN9TjJ
 93DrKmvPbLNdE30Fb/QJvlEmh4eckGu1Mk40SuE9hSz7k4gbn9LkowKodmpAbacTiOlMmrSa8mC
 wyr5rapesNPRzjfw0HfDt4Oqw3upcvah17XXEOXNe2upL4S0K/dChFc7CGtGz8w/6TnpFX4kuZl
 EAwRG5c/Jagk4vv3anbIiUEhcAx7Ragf1o1441KUP4fBM4LMp6V6T0eHgNJEB5fWFej/WLPX3L7
 xXC/Rk+8sVh5B+pfx/pmqQwsh3+qpN/EPjgBVJY/3PqYUxkcooXhq6I08HZmQGp43Zs6pJ0biaT
 +CsqJ1+3wWi+JSqPgzNQiM2NNlx/MCGh5GQRarbyw4YJ81Mfs3oWcwiJyEtPmOvuixXHfQQWVxt
 52+nFfGc5HCCpnjaRWKkKIIoSfNLrVR5YcdRbLtFEbu24XBLh1mVKREs0DE+YvFXIDrFZlNjmF9
 pl4bYVAYEz1L0WSXxrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Minidump can collect various memory snippets using Qualcomm boot firmware
support. To determine which snippets should be collected, each snippet
must be registered by the kernel into a shared memory table managed by
the Qualcomm SMEM driver. To instantiate the minidump platform driver,
register its data using platform_device_register_data(). The minidump
driver will later probe the device and retrieve the required memory
snippets from the memory inspection table (meminspect).

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index d5c94b47f431..65d7b4d99677 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -270,6 +270,7 @@ struct smem_region {
  * @partitions: list of partitions of current processor/host
  * @item_count: max accepted item number
  * @socinfo:	platform device pointer
+ * @mdinfo:	minidump device pointer
  * @num_regions: number of @regions
  * @regions:	list of the memory regions defining the shared memory
  */
@@ -280,6 +281,7 @@ struct qcom_smem {
 
 	u32 item_count;
 	struct platform_device *socinfo;
+	struct platform_device *mdinfo;
 	struct smem_ptable *ptable;
 	struct smem_partition global_partition;
 	struct smem_partition partitions[SMEM_HOST_COUNT];
@@ -1242,12 +1244,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
 	if (IS_ERR(smem->socinfo))
 		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
 
+	smem->mdinfo = platform_device_register_data(&pdev->dev, "qcom-minidump",
+						     PLATFORM_DEVID_AUTO, NULL,
+						     0);
+	if (IS_ERR(smem->mdinfo))
+		dev_err(&pdev->dev, "failed to register platform md device\n");
+
 	return 0;
 }
 
 static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
+	if (!IS_ERR(__smem->mdinfo))
+		platform_device_unregister(__smem->mdinfo);
 
 	/* Set to -EPROBE_DEFER to signal unprobed state */
 	__smem = ERR_PTR(-EPROBE_DEFER);

-- 
2.50.1


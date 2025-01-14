Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9455B23A574;
	Tue, 14 Jan 2025 05:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736832981; cv=none; b=KNY0WCbGnKHyChzNi+rz+yU8kMme5LzR+Un2ZOTKmXSh0W+yLpLdLMdxXEnKpmyxTWEj+kk+0s/WSzFUS2lvc0rOKWP79VXysrd0n9zeDhKbqBOsdFXwZpqyGsVRzIb4jRqR/k9rx/yCt42/udOynLaKQKNB1ARC0RwO4qw+yVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736832981; c=relaxed/simple;
	bh=87rus4o59M/h6mbCeTYN+uwPYg3Cu8v5VQQt/ES6TT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=LNbSexJEAS6+A79mtIw3EoQ0C0Vh9J41OCYO5bDnaiqjdBT73WjDKHUh8SoblnwHDW9U0zsP8DjUDl/3f9yinNDsyBkDMpMlijat1rlAbxTfGXbxuTqApVg6u9BGKrChylSnghawvVi/P+bGT1iGBaTpas/XflH9K75g1S9HNb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iXWopfu7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iXWopfu7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DH3oqq020410;
	Tue, 14 Jan 2025 05:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	drhXWUnxNp13ZTiPp3leq5WA8tzUkJEr4CWQ0Yv1pZw=; b=iXWopfu7nQ9ngkx7
	h9V/MplxVwH+7w8ND4lXLO9AoxrObwWm6Rv9F5E1sL5EmPsM5k+9BrZTA29a60rc
	4No3GOYTHQc1X4zvMoRu75RlwOXDjgCwnxKCS2q/cMNwKsgdgMz384yv0sCYO/dR
	oGaop5K6sWKj8cnCleQybJtOqPRZxMpj/PPi1xZeAMP/QUZqfcIoapQ6GlXYNh8V
	m6cOTT02MFtvDQR1DqIEjklPJtQOC0gPnqbJcghap6FBH09vAJ3KExYiSQnIZsl9
	3DHoKQ2l2vjts65JrffTIAFnhTPtgDX7P5T1qnliGRJ9hoCDYRzf830qHzYjaqCR
	Bl+x9A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4456wa9fhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:36:03 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5a28k020523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:36:02 GMT
Received: from la-sh002-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 21:35:56 -0800
From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
Date: Tue, 14 Jan 2025 13:34:34 +0800
Subject: [PATCH 4/7] kcov: introduce new kcov KCOV_TRACE_UNIQ_CMP mode
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250114-kcov-v1-4-004294b931a2@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736832942; l=6956;
 i=quic_jiangenj@quicinc.com; s=20250114; h=from:subject:message-id;
 bh=87rus4o59M/h6mbCeTYN+uwPYg3Cu8v5VQQt/ES6TT4=;
 b=dLbyxsjISwicFnHI2UlW7HXO0FqBJGbKRAtWrXffXPrseH1onOKQ7Uil5a0dOqyIK0G9Sonh3
 Af14LF0A5HiDGL5/ZS9Y7gv/n6tgLyBJ6vxQua47w0wN4Ujd1sTIXzx
X-Developer-Key: i=quic_jiangenj@quicinc.com; a=ed25519;
 pk=JPzmfEvx11SW1Q1qtMhFcAx46KP1Ui36jcetDgbev28=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -qyd1GNp6Gcg_3HTW0CFg-UHDCJbFmyY
X-Proofpoint-ORIG-GUID: -qyd1GNp6Gcg_3HTW0CFg-UHDCJbFmyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 mlxlogscore=734 priorityscore=1501
 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140044

Similar to KCOV_TRACE_CMP mode, KCOV_TRACE_UNIQ_CMP stores unique CMP data
into area.

Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
---
 include/linux/kcov.h      |   2 +
 include/uapi/linux/kcov.h |   2 +
 kernel/kcov.c             | 112 ++++++++++++++++++++++++++++++++--------------
 3 files changed, 83 insertions(+), 33 deletions(-)

diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index 56b858205ba16c47fc72bda9938c98f034503c8c..a78d78164bf75368c71a958a5438fc3ee68c95ca 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -27,6 +27,8 @@ enum kcov_mode {
 	KCOV_MODE_TRACE_UNIQ_PC = 16,
 	/* Collecting uniq edge mode. */
 	KCOV_MODE_TRACE_UNIQ_EDGE = 32,
+	/* Collecting uniq cmp mode. */
+	KCOV_MODE_TRACE_UNIQ_CMP = 64,
 };
 
 #define KCOV_IN_CTXSW	(1 << 30)
diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index 9b2019f0ab8b8cb5426d2d6b74472fa1a7293817..08abfca273c9624dc54a2c70b12a4a9302700f26 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -39,6 +39,8 @@ enum {
 	KCOV_TRACE_UNIQ_PC = 2,
 	/* Collecting uniq edge mode. */
 	KCOV_TRACE_UNIQ_EDGE = 4,
+	/* Collecting uniq CMP mode. */
+	KCOV_TRACE_UNIQ_CMP = 8,
 };
 
 /*
diff --git a/kernel/kcov.c b/kernel/kcov.c
index c04bbec9ac3186a5145240de8ac609ad8a7ca733..af73c40114d23adedab8318e8657d24bf36ae865 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -36,6 +36,11 @@
 
 struct kcov_entry {
 	unsigned long		ent;
+#ifdef CONFIG_KCOV_ENABLE_COMPARISONS
+	unsigned long		type;
+	unsigned long		arg1;
+	unsigned long		arg2;
+#endif
 
 	struct hlist_node	node;
 };
@@ -44,7 +49,7 @@ struct kcov_entry {
 #define MIN_POOL_ALLOC_ORDER ilog2(roundup_pow_of_two(sizeof(struct kcov_entry)))
 
 /*
- * kcov hashmap to store uniq pc, prealloced mem for kcov_entry
+ * kcov hashmap to store uniq pc|edge|cmp, prealloced mem for kcov_entry
  * and area shared between kernel and userspace.
  */
 struct kcov_map {
@@ -87,7 +92,7 @@ struct kcov {
 	unsigned long		prev_pc;
 	/* Coverage buffer shared with user space. */
 	void			*area;
-	/* Coverage hashmap for unique pc. */
+	/* Coverage hashmap for unique pc|cmp. */
 	struct kcov_map		*map;
 	/* Edge hashmap for unique edge. */
 	struct kcov_map		*map_edge;
@@ -289,14 +294,23 @@ static notrace inline void kcov_map_add(struct kcov_map *map, struct kcov_entry
 	struct kcov *kcov;
 	struct kcov_entry *entry;
 	unsigned int key = hash_key(ent);
-	unsigned long pos, *area;
+	unsigned long pos, start_index, end_pos, max_pos, *area;
 
 	kcov = t->kcov;
 
-	hash_for_each_possible_rcu(map->buckets, entry, node, key) {
-		if (entry->ent == ent->ent)
-			return;
-	}
+	if ((mode == KCOV_MODE_TRACE_UNIQ_PC ||
+	     mode == KCOV_MODE_TRACE_UNIQ_EDGE))
+		hash_for_each_possible_rcu(map->buckets, entry, node, key) {
+			if (entry->ent == ent->ent)
+				return;
+		}
+	else
+		hash_for_each_possible_rcu(map->buckets, entry, node, key) {
+			if (entry->ent == ent->ent && entry->type == ent->type &&
+			    entry->arg1 == ent->arg1 && entry->arg2 == ent->arg2) {
+				return;
+			}
+		}
 
 	entry = (struct kcov_entry *)gen_pool_alloc(map->pool, 1 << MIN_POOL_ALLOC_ORDER);
 	if (unlikely(!entry))
@@ -306,16 +320,31 @@ static notrace inline void kcov_map_add(struct kcov_map *map, struct kcov_entry
 	memcpy(entry, ent, sizeof(*entry));
 	hash_add_rcu(map->buckets, &entry->node, key);
 
-	if (mode == KCOV_MODE_TRACE_UNIQ_PC)
+	if (mode == KCOV_MODE_TRACE_UNIQ_PC || mode == KCOV_MODE_TRACE_UNIQ_CMP)
 		area = t->kcov_area;
 	else
 		area = kcov->map_edge->area;
 
 	pos = READ_ONCE(area[0]) + 1;
-	if (likely(pos < t->kcov_size)) {
-		WRITE_ONCE(area[0], pos);
-		barrier();
-		area[pos] = ent->ent;
+	if (mode == KCOV_MODE_TRACE_UNIQ_PC || mode == KCOV_MODE_TRACE_UNIQ_EDGE) {
+		if (likely(pos < t->kcov_size)) {
+			WRITE_ONCE(area[0], pos);
+			barrier();
+			area[pos] = ent->ent;
+		}
+	} else {
+		start_index = 1 + (pos - 1) * KCOV_WORDS_PER_CMP;
+		max_pos = t->kcov_size * sizeof(unsigned long);
+		end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
+		if (likely(end_pos <= max_pos)) {
+			/* See comment in __sanitizer_cov_trace_pc(). */
+			WRITE_ONCE(area[0], pos);
+			barrier();
+			area[start_index] = ent->type;
+			area[start_index + 1] = ent->arg1;
+			area[start_index + 2] = ent->arg2;
+			area[start_index + 3] = ent->ent;
+		}
 	}
 }
 
@@ -384,33 +413,44 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 	struct task_struct *t;
 	u64 *area;
 	u64 count, start_index, end_pos, max_pos;
+	struct kcov_entry entry = {0};
+	unsigned int mode;
 
 	t = current;
-	if (!check_kcov_mode(KCOV_MODE_TRACE_CMP, t))
+	if (!check_kcov_mode(KCOV_MODE_TRACE_CMP | KCOV_MODE_TRACE_UNIQ_CMP, t))
 		return;
 
+	mode = t->kcov_mode;
 	ip = canonicalize_ip(ip);
 
-	/*
-	 * We write all comparison arguments and types as u64.
-	 * The buffer was allocated for t->kcov_size unsigned longs.
-	 */
-	area = (u64 *)t->kcov_area;
-	max_pos = t->kcov_size * sizeof(unsigned long);
-
-	count = READ_ONCE(area[0]);
-
-	/* Every record is KCOV_WORDS_PER_CMP 64-bit words. */
-	start_index = 1 + count * KCOV_WORDS_PER_CMP;
-	end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
-	if (likely(end_pos <= max_pos)) {
-		/* See comment in __sanitizer_cov_trace_pc(). */
-		WRITE_ONCE(area[0], count + 1);
-		barrier();
-		area[start_index] = type;
-		area[start_index + 1] = arg1;
-		area[start_index + 2] = arg2;
-		area[start_index + 3] = ip;
+	if (mode == KCOV_MODE_TRACE_CMP) {
+		/*
+		 * We write all comparison arguments and types as u64.
+		 * The buffer was allocated for t->kcov_size unsigned longs.
+		 */
+		area = (u64 *)t->kcov_area;
+		max_pos = t->kcov_size * sizeof(unsigned long);
+
+		count = READ_ONCE(area[0]);
+
+		/* Every record is KCOV_WORDS_PER_CMP 64-bit words. */
+		start_index = 1 + count * KCOV_WORDS_PER_CMP;
+		end_pos = (start_index + KCOV_WORDS_PER_CMP) * sizeof(u64);
+		if (likely(end_pos <= max_pos)) {
+			/* See comment in __sanitizer_cov_trace_pc(). */
+			WRITE_ONCE(area[0], count + 1);
+			barrier();
+			area[start_index] = type;
+			area[start_index + 1] = arg1;
+			area[start_index + 2] = arg2;
+			area[start_index + 3] = ip;
+		}
+	} else {
+		entry.type = type;
+		entry.arg1 = arg1;
+		entry.arg2 = arg2;
+		entry.ent = ip;
+		kcov_map_add(t->kcov->map, &entry, t, KCOV_MODE_TRACE_UNIQ_CMP);
 	}
 }
 
@@ -730,6 +770,12 @@ static int kcov_get_mode(unsigned long arg)
 		mode |= KCOV_MODE_TRACE_UNIQ_PC;
 	if (arg & KCOV_TRACE_UNIQ_EDGE)
 		mode |= KCOV_MODE_TRACE_UNIQ_EDGE;
+	if (arg == KCOV_TRACE_UNIQ_CMP)
+#ifdef CONFIG_KCOV_ENABLE_COMPARISONS
+		mode = KCOV_MODE_TRACE_UNIQ_CMP;
+#else
+		return -EOPNOTSUPP;
+#endif
 	if (!mode)
 		return -EINVAL;
 

-- 
2.47.1


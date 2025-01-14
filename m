Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A05620F075;
	Tue, 14 Jan 2025 05:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736832975; cv=none; b=JPWGGe8yS/jAFHxV9NUiPPL01P8hrRdkeGplSLM8P4e1c2MMutotiO+mF7dbo70/t/aBqnrlHkXSQjd0fI06l6BJT2MgjpKswwylJt+uNBXjKsOrXQ/qjX1/1EF5c91Q6PeQ1q0J6XUqobymawN49mrxJuUdyq+zImCl6Xq7bHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736832975; c=relaxed/simple;
	bh=B7wHQFKQobnmg8wdM6NUVeUWs1lU5h8VAiYZXhUuszQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RL1zzpbWXyaJFzbGFEevU3u4FKOszIbUPa//ZPH1ISu7E22af/Hs/5eKs7vhUY0QIGh1/jojsS8lFE/tSC/yP7GffNBKa1N35N6Cj/YsmbnvgfvwOaMHWfX1EC5qluJhyqxCDDnZsv4GSc9DyFEmK7NteOVV0uDJZlV6BQ5wbos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h4nA0eA4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h4nA0eA4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E2faK3019063;
	Tue, 14 Jan 2025 05:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qDL277UfuO/ZrvRomYA8juO/sG4dUYnxhYSbKtRIw2g=; b=h4nA0eA4UEs6Tu4k
	wBfX7hgWFXXrnM+JGs+WebRVn7gpdPNJKHjYRSmkvrgEFV6N8C1Wtoo5mNH54CmU
	b5vckJfXnF6+ezglMfy/TK+YUxne1465BNOuXwxR17lz8k10fKU8kMC0l7QO2x5d
	Ym/yBCF6U5EKWI1tJvKVzF95OMKkz4P+ZQVKy7/TmkVpw0KC+MRsfGsiV7A0ivHk
	r8+MMeA1vSZ/O1nSBZZCnBrVcSIrKEHLwl22a8MgDFQsmp41YFwKkQhxWa4u6WEW
	1sKZxzqy1COV3V0YYAqGHp5YoUMrXvPGWR++NEv6X6u4P8BKFkdxcxnJXkPWuoh+
	6SF9aw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445fc68ap7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:35:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5ZpkU015485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:35:51 GMT
Received: from la-sh002-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 21:35:46 -0800
From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
Date: Tue, 14 Jan 2025 13:34:31 +0800
Subject: [PATCH 1/7] kcov: introduce new kcov KCOV_TRACE_UNIQ_PC mode
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250114-kcov-v1-1-004294b931a2@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736832941; l=9637;
 i=quic_jiangenj@quicinc.com; s=20250114; h=from:subject:message-id;
 bh=B7wHQFKQobnmg8wdM6NUVeUWs1lU5h8VAiYZXhUuszQ=;
 b=3Fvg8y8dQ7utfwGWRCIqEI/3IwdHZiSSLCJAtwDZ3DSR+sj7AgVMY66KyCdxL52wgtcbIHf8o
 9j75hRm567mDu2jxJ/jTIXR40Kjt9iqFT8hdyyzRUDAE3mZ2DSasfbM
X-Developer-Key: i=quic_jiangenj@quicinc.com; a=ed25519;
 pk=JPzmfEvx11SW1Q1qtMhFcAx46KP1Ui36jcetDgbev28=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qeP3yiT5DpcBwuW5hL4M01mTLK8jZQWF
X-Proofpoint-GUID: qeP3yiT5DpcBwuW5hL4M01mTLK8jZQWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=777 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140043

The current kcov KCOV_TRACE_PC mode stores PC in sequence.

Introduce KCOV_TRACE_UNIQ_PC mode to store unique PC info.
In unique PC mode,
- use hashmap to store unique PC in kcov_entry
- use gen_pool_alloc in __sanitizer_cov_trace_pc to avoid
sleeping function kmalloc

Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
---
 include/linux/kcov.h      |   6 +-
 include/uapi/linux/kcov.h |   2 +
 kernel/kcov.c             | 190 ++++++++++++++++++++++++++++++++++++++++------
 3 files changed, 173 insertions(+), 25 deletions(-)

diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index 75a2fb8b16c32917817b8ec7f5e45421793431ae..aafd9f88450cb8672c701349300b54662bc38079 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -20,9 +20,11 @@ enum kcov_mode {
 	 */
 	KCOV_MODE_TRACE_PC = 2,
 	/* Collecting comparison operands mode. */
-	KCOV_MODE_TRACE_CMP = 3,
+	KCOV_MODE_TRACE_CMP = 4,
 	/* The process owns a KCOV remote reference. */
-	KCOV_MODE_REMOTE = 4,
+	KCOV_MODE_REMOTE = 8,
+	/* COllecting uniq pc mode. */
+	KCOV_MODE_TRACE_UNIQ_PC = 16,
 };
 
 #define KCOV_IN_CTXSW	(1 << 30)
diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index ed95dba9fa37e291e9e9e0109eb8481bb7a5e9da..d2a2bff36f285a5e3a03395f8890fcb716cf3f07 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -35,6 +35,8 @@ enum {
 	KCOV_TRACE_PC = 0,
 	/* Collecting comparison operands mode. */
 	KCOV_TRACE_CMP = 1,
+	/* Collecting uniq PC mode. */
+	KCOV_TRACE_UNIQ_PC = 2,
 };
 
 /*
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 28a6be6e64fdd721d49c4040ed10ce33f9d890a1..bbd7b7503206fe595976458ab685b95f784607d7 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -9,9 +9,11 @@
 #include <linux/types.h>
 #include <linux/file.h>
 #include <linux/fs.h>
+#include <linux/genalloc.h>
 #include <linux/hashtable.h>
 #include <linux/init.h>
 #include <linux/jiffies.h>
+#include <linux/jhash.h>
 #include <linux/kmsan-checks.h>
 #include <linux/mm.h>
 #include <linux/preempt.h>
@@ -32,6 +34,29 @@
 /* Number of 64-bit words written per one comparison: */
 #define KCOV_WORDS_PER_CMP 4
 
+struct kcov_entry {
+	unsigned long		ent;
+
+	struct hlist_node	node;
+};
+
+/* Min gen pool alloc order. */
+#define MIN_POOL_ALLOC_ORDER ilog2(roundup_pow_of_two(sizeof(struct kcov_entry)))
+
+/*
+ * kcov hashmap to store uniq pc, prealloced mem for kcov_entry
+ * and area shared between kernel and userspace.
+ */
+struct kcov_map {
+	/* 15 bits fit most cases for hash collision, memory and performance. */
+	DECLARE_HASHTABLE(buckets, 15);
+	struct gen_pool		*pool;
+	/* Prealloced memory added to pool to be used as kcov_entry. */
+	void			*mem;
+	/* Buffer shared with user space. */
+	void			*area;
+};
+
 /*
  * kcov descriptor (one per opened debugfs file).
  * State transitions of the descriptor:
@@ -60,6 +85,8 @@ struct kcov {
 	unsigned int		size;
 	/* Coverage buffer shared with user space. */
 	void			*area;
+	/* Coverage hashmap for unique pc. */
+	struct kcov_map		*map;
 	/* Task for which we collect coverage, or NULL. */
 	struct task_struct	*t;
 	/* Collecting coverage from remote (background) threads. */
@@ -171,7 +198,7 @@ static inline bool in_softirq_really(void)
 	return in_serving_softirq() && !in_hardirq() && !in_nmi();
 }
 
-static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_struct *t)
+static notrace unsigned int check_kcov_mode(enum kcov_mode needed_mode, struct task_struct *t)
 {
 	unsigned int mode;
 
@@ -191,7 +218,94 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru
 	 * kcov_start().
 	 */
 	barrier();
-	return mode == needed_mode;
+	return mode & needed_mode;
+}
+
+static int kcov_map_init(struct kcov *kcov, unsigned long size)
+{
+	struct kcov_map *map;
+	void *area;
+	unsigned long flags;
+
+	map = kzalloc(sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	area = vmalloc_user(size * sizeof(unsigned long));
+	if (!area) {
+		kfree(map);
+		return -ENOMEM;
+	}
+
+	spin_lock_irqsave(&kcov->lock, flags);
+	map->area = area;
+
+	kcov->map = map;
+	kcov->area = area;
+	spin_unlock_irqrestore(&kcov->lock, flags);
+
+	hash_init(map->buckets);
+
+	map->pool = gen_pool_create(MIN_POOL_ALLOC_ORDER, -1);
+	if (!map->pool)
+		return -ENOMEM;
+
+	map->mem = vmalloc(size * (1 << MIN_POOL_ALLOC_ORDER));
+	if (!map->mem) {
+		vfree(area);
+		gen_pool_destroy(map->pool);
+		kfree(map);
+		return -ENOMEM;
+	}
+
+	if (gen_pool_add(map->pool, (unsigned long)map->mem, size *
+	    (1 << MIN_POOL_ALLOC_ORDER), -1)) {
+		vfree(area);
+		vfree(map->mem);
+		gen_pool_destroy(map->pool);
+		kfree(map);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static inline u32 hash_key(const struct kcov_entry *k)
+{
+	return jhash((u32 *)k, offsetof(struct kcov_entry, node), 0);
+}
+
+static notrace inline void kcov_map_add(struct kcov_map *map, struct kcov_entry *ent,
+					struct task_struct *t)
+{
+	struct kcov *kcov;
+	struct kcov_entry *entry;
+	unsigned int key = hash_key(ent);
+	unsigned long pos, *area;
+
+	kcov = t->kcov;
+
+	hash_for_each_possible_rcu(map->buckets, entry, node, key) {
+		if (entry->ent == ent->ent)
+			return;
+	}
+
+	entry = (struct kcov_entry *)gen_pool_alloc(map->pool, 1 << MIN_POOL_ALLOC_ORDER);
+	if (unlikely(!entry))
+		return;
+
+	barrier();
+	memcpy(entry, ent, sizeof(*entry));
+	hash_add_rcu(map->buckets, &entry->node, key);
+
+	area = t->kcov_area;
+
+	pos = READ_ONCE(area[0]) + 1;
+	if (likely(pos < t->kcov_size)) {
+		WRITE_ONCE(area[0], pos);
+		barrier();
+		area[pos] = ent->ent;
+	}
 }
 
 static notrace unsigned long canonicalize_ip(unsigned long ip)
@@ -212,25 +326,34 @@ void notrace __sanitizer_cov_trace_pc(void)
 	unsigned long *area;
 	unsigned long ip = canonicalize_ip(_RET_IP_);
 	unsigned long pos;
+	struct kcov_entry entry = {0};
+	unsigned int mode;
 
 	t = current;
-	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, t))
+	if (!check_kcov_mode(KCOV_MODE_TRACE_PC | KCOV_MODE_TRACE_UNIQ_PC, t))
 		return;
 
 	area = t->kcov_area;
-	/* The first 64-bit word is the number of subsequent PCs. */
-	pos = READ_ONCE(area[0]) + 1;
-	if (likely(pos < t->kcov_size)) {
-		/* Previously we write pc before updating pos. However, some
-		 * early interrupt code could bypass check_kcov_mode() check
-		 * and invoke __sanitizer_cov_trace_pc(). If such interrupt is
-		 * raised between writing pc and updating pos, the pc could be
-		 * overitten by the recursive __sanitizer_cov_trace_pc().
-		 * Update pos before writing pc to avoid such interleaving.
-		 */
-		WRITE_ONCE(area[0], pos);
-		barrier();
-		area[pos] = ip;
+	mode = t->kcov_mode;
+	if (mode == KCOV_MODE_TRACE_PC) {
+		area = t->kcov_area;
+		/* The first 64-bit word is the number of subsequent PCs. */
+		pos = READ_ONCE(area[0]) + 1;
+		if (likely(pos < t->kcov_size)) {
+			/* Previously we write pc before updating pos. However, some
+			 * early interrupt code could bypass check_kcov_mode() check
+			 * and invoke __sanitizer_cov_trace_pc(). If such interrupt is
+			 * raised between writing pc and updating pos, the pc could be
+			 * overitten by the recursive __sanitizer_cov_trace_pc().
+			 * Update pos before writing pc to avoid such interleaving.
+			 */
+			WRITE_ONCE(area[0], pos);
+			barrier();
+			area[pos] = ip;
+		}
+	} else {
+		entry.ent = ip;
+		kcov_map_add(t->kcov->map, &entry, t);
 	}
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
@@ -432,11 +555,33 @@ static void kcov_get(struct kcov *kcov)
 	refcount_inc(&kcov->refcount);
 }
 
+static void kcov_map_free(struct kcov *kcov)
+{
+	int bkt;
+	struct hlist_node *tmp;
+	struct kcov_entry *entry;
+	struct kcov_map *map;
+
+	map = kcov->map;
+	if (!map)
+		return;
+	rcu_read_lock();
+	hash_for_each_safe(map->buckets, bkt, tmp, entry, node) {
+		hash_del_rcu(&entry->node);
+		gen_pool_free(map->pool, (unsigned long)entry, 1 << MIN_POOL_ALLOC_ORDER);
+	}
+	rcu_read_unlock();
+	vfree(map->area);
+	vfree(map->mem);
+	gen_pool_destroy(map->pool);
+	kfree(map);
+}
+
 static void kcov_put(struct kcov *kcov)
 {
 	if (refcount_dec_and_test(&kcov->refcount)) {
 		kcov_remote_reset(kcov);
-		vfree(kcov->area);
+		kcov_map_free(kcov);
 		kfree(kcov);
 	}
 }
@@ -546,6 +691,8 @@ static int kcov_get_mode(unsigned long arg)
 #else
 		return -ENOTSUPP;
 #endif
+	else if (arg == KCOV_TRACE_UNIQ_PC)
+		return KCOV_MODE_TRACE_UNIQ_PC;
 	else
 		return -EINVAL;
 }
@@ -698,7 +845,6 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	unsigned int remote_num_handles;
 	unsigned long remote_arg_size;
 	unsigned long size, flags;
-	void *area;
 
 	kcov = filep->private_data;
 	switch (cmd) {
@@ -713,16 +859,14 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		size = arg;
 		if (size < 2 || size > INT_MAX / sizeof(unsigned long))
 			return -EINVAL;
-		area = vmalloc_user(size * sizeof(unsigned long));
-		if (area == NULL)
-			return -ENOMEM;
+		res = kcov_map_init(kcov, size);
+		if (res)
+			return res;
 		spin_lock_irqsave(&kcov->lock, flags);
 		if (kcov->mode != KCOV_MODE_DISABLED) {
 			spin_unlock_irqrestore(&kcov->lock, flags);
-			vfree(area);
 			return -EBUSY;
 		}
-		kcov->area = area;
 		kcov->size = size;
 		kcov->mode = KCOV_MODE_INIT;
 		spin_unlock_irqrestore(&kcov->lock, flags);

-- 
2.47.1


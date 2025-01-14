Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEC423355D;
	Tue, 14 Jan 2025 05:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736832977; cv=none; b=Bztx2tlrvZi05eISPhAefeijYdqXGlmSADJgXkmnI9xrGBlRKosJfLxsQvVGRXJ4UXJthnCh0+8nthfTFt3DroQGFNQ1NURMO3JhCaOAofEfP4k9UmRojBMczV+TelCJx1FH0nx+4dC5wRCOcP5iZdw8cQ7ngOSErdYjUvGt/NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736832977; c=relaxed/simple;
	bh=fvIA7qPV+F40Lv2i0NOI93SQe1UCKicXtboCEOT2WIE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gk/casC2uHItah8rwSuG7UtAkb+mudxRvcKB9PFZdTOSTvWtp8HXgzP7t62v8ec7bI/e3ysD11PJmRAsdsLdUKP1+qaAg1ZqMjkU9V1TSBfWnqLV7eJAMrunO8GPA8BcIGRwG6+uwed2M7UbLWPEJsupVdYraWOxsgl4vVSX8Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jjgWv3xq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jjgWv3xq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DKsOnq026165;
	Tue, 14 Jan 2025 05:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZBlk7f8TqoTzSTj9rN2g/BtOKJD+wVKUTcgd9+/bG5o=; b=jjgWv3xqg/L/e6Uo
	AC9koJ2vVx9qp+MOxby5ntqzJyl0t4sN+iJH7F+MitXJEnoPQTTTUF8FWPdgpyfG
	nmRmCe5zMMpuXNDjldrt9ZRfgbc4K+IXR4JV1Dju1Lbji7Va4g/aK5Ur21ZtFrTA
	y+VLaeSLn9s9YIWPiZEtwt1mhbGfJYMkKpYSwbhBIxmOfMNQGr7v8RPnMAUPQOAz
	GyvMwdFGp6bYQapq+o0ALxLzjE7JaGQovBEWY3eaz+izjXycBFCus5vKRXGkq+7n
	ShZx0lMOufzrKVPJC/P1Xh/GQ8vIyxWnQb5PTKDNcGPNUwNOCZ2SZdo4OLwn8NNW
	w4FtSw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445a928wyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:35:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5ZtXN019909
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:35:55 GMT
Received: from la-sh002-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 21:35:49 -0800
From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
Date: Tue, 14 Jan 2025 13:34:32 +0800
Subject: [PATCH 2/7] kcov: introduce new kcov KCOV_TRACE_UNIQ_EDGE mode
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250114-kcov-v1-2-004294b931a2@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736832942; l=7640;
 i=quic_jiangenj@quicinc.com; s=20250114; h=from:subject:message-id;
 bh=fvIA7qPV+F40Lv2i0NOI93SQe1UCKicXtboCEOT2WIE=;
 b=kUJuqBf1WmXlkxHJKhCifPFT0HbTOCIQVzM7sdSklSI6WvFaFMlQeqx5N+zeSQr1xFpBOVsHQ
 FNLdRqhqeubCMcg5KCoYN8gH6gRE5trVbdd0mTyeNPGbGPsxiea0tMG
X-Developer-Key: i=quic_jiangenj@quicinc.com; a=ed25519;
 pk=JPzmfEvx11SW1Q1qtMhFcAx46KP1Ui36jcetDgbev28=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YQARHycxSoqmMiVizCvzkbVFl1mo40vy
X-Proofpoint-ORIG-GUID: YQARHycxSoqmMiVizCvzkbVFl1mo40vy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140044

KCOV_TRACE_UNIQ_EDGE stores uniq edge info, which is bitwise xor operation
of prev_pc and current pc.
And only hash the lower 12 bits so the hash is independent of any module
offsets.

Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
---
 include/linux/kcov.h      |  4 ++-
 include/uapi/linux/kcov.h |  2 ++
 kernel/kcov.c             | 73 ++++++++++++++++++++++++++++++++++++-----------
 3 files changed, 61 insertions(+), 18 deletions(-)

diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index aafd9f88450cb8672c701349300b54662bc38079..56b858205ba16c47fc72bda9938c98f034503c8c 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -23,8 +23,10 @@ enum kcov_mode {
 	KCOV_MODE_TRACE_CMP = 4,
 	/* The process owns a KCOV remote reference. */
 	KCOV_MODE_REMOTE = 8,
-	/* COllecting uniq pc mode. */
+	/* Collecting uniq pc mode. */
 	KCOV_MODE_TRACE_UNIQ_PC = 16,
+	/* Collecting uniq edge mode. */
+	KCOV_MODE_TRACE_UNIQ_EDGE = 32,
 };
 
 #define KCOV_IN_CTXSW	(1 << 30)
diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index d2a2bff36f285a5e3a03395f8890fcb716cf3f07..9b2019f0ab8b8cb5426d2d6b74472fa1a7293817 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -37,6 +37,8 @@ enum {
 	KCOV_TRACE_CMP = 1,
 	/* Collecting uniq PC mode. */
 	KCOV_TRACE_UNIQ_PC = 2,
+	/* Collecting uniq edge mode. */
+	KCOV_TRACE_UNIQ_EDGE = 4,
 };
 
 /*
diff --git a/kernel/kcov.c b/kernel/kcov.c
index bbd7b7503206fe595976458ab685b95f784607d7..5a0ead92729294d99db80bb4e0f5b04c8b025dba 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -83,10 +83,14 @@ struct kcov {
 	enum kcov_mode		mode;
 	/* Size of arena (in long's). */
 	unsigned int		size;
+	/* Previous PC. */
+	unsigned long		prev_pc;
 	/* Coverage buffer shared with user space. */
 	void			*area;
 	/* Coverage hashmap for unique pc. */
 	struct kcov_map		*map;
+	/* Edge hashmap for unique edge. */
+	struct kcov_map		*map_edge;
 	/* Task for which we collect coverage, or NULL. */
 	struct task_struct	*t;
 	/* Collecting coverage from remote (background) threads. */
@@ -221,7 +225,7 @@ static notrace unsigned int check_kcov_mode(enum kcov_mode needed_mode, struct t
 	return mode & needed_mode;
 }
 
-static int kcov_map_init(struct kcov *kcov, unsigned long size)
+static int kcov_map_init(struct kcov *kcov, unsigned long size, bool edge)
 {
 	struct kcov_map *map;
 	void *area;
@@ -240,8 +244,12 @@ static int kcov_map_init(struct kcov *kcov, unsigned long size)
 	spin_lock_irqsave(&kcov->lock, flags);
 	map->area = area;
 
-	kcov->map = map;
-	kcov->area = area;
+	if (edge) {
+		kcov->map_edge = map;
+	} else {
+		kcov->map = map;
+		kcov->area = area;
+	}
 	spin_unlock_irqrestore(&kcov->lock, flags);
 
 	hash_init(map->buckets);
@@ -276,7 +284,7 @@ static inline u32 hash_key(const struct kcov_entry *k)
 }
 
 static notrace inline void kcov_map_add(struct kcov_map *map, struct kcov_entry *ent,
-					struct task_struct *t)
+					struct task_struct *t, unsigned int mode)
 {
 	struct kcov *kcov;
 	struct kcov_entry *entry;
@@ -298,7 +306,10 @@ static notrace inline void kcov_map_add(struct kcov_map *map, struct kcov_entry
 	memcpy(entry, ent, sizeof(*entry));
 	hash_add_rcu(map->buckets, &entry->node, key);
 
-	area = t->kcov_area;
+	if (mode == KCOV_MODE_TRACE_UNIQ_PC)
+		area = t->kcov_area;
+	else
+		area = kcov->map_edge->area;
 
 	pos = READ_ONCE(area[0]) + 1;
 	if (likely(pos < t->kcov_size)) {
@@ -327,13 +338,15 @@ void notrace __sanitizer_cov_trace_pc(void)
 	unsigned long ip = canonicalize_ip(_RET_IP_);
 	unsigned long pos;
 	struct kcov_entry entry = {0};
+	/* Only hash the lower 12 bits so the hash is independent of any module offsets. */
+	unsigned long mask = (1 << 12) - 1;
 	unsigned int mode;
 
 	t = current;
-	if (!check_kcov_mode(KCOV_MODE_TRACE_PC | KCOV_MODE_TRACE_UNIQ_PC, t))
+	if (!check_kcov_mode(KCOV_MODE_TRACE_PC | KCOV_MODE_TRACE_UNIQ_PC |
+			       KCOV_MODE_TRACE_UNIQ_EDGE, t))
 		return;
 
-	area = t->kcov_area;
 	mode = t->kcov_mode;
 	if (mode == KCOV_MODE_TRACE_PC) {
 		area = t->kcov_area;
@@ -352,8 +365,15 @@ void notrace __sanitizer_cov_trace_pc(void)
 			area[pos] = ip;
 		}
 	} else {
-		entry.ent = ip;
-		kcov_map_add(t->kcov->map, &entry, t);
+		if (mode & KCOV_MODE_TRACE_UNIQ_PC) {
+			entry.ent = ip;
+			kcov_map_add(t->kcov->map, &entry, t, KCOV_MODE_TRACE_UNIQ_PC);
+		}
+		if (mode & KCOV_MODE_TRACE_UNIQ_EDGE) {
+			entry.ent = (hash_long(t->kcov->prev_pc & mask, BITS_PER_LONG) & mask) ^ ip;
+			t->kcov->prev_pc = ip;
+			kcov_map_add(t->kcov->map_edge, &entry, t, KCOV_MODE_TRACE_UNIQ_EDGE);
+		}
 	}
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
@@ -555,14 +575,17 @@ static void kcov_get(struct kcov *kcov)
 	refcount_inc(&kcov->refcount);
 }
 
-static void kcov_map_free(struct kcov *kcov)
+static void kcov_map_free(struct kcov *kcov, bool edge)
 {
 	int bkt;
 	struct hlist_node *tmp;
 	struct kcov_entry *entry;
 	struct kcov_map *map;
 
-	map = kcov->map;
+	if (edge)
+		map = kcov->map_edge;
+	else
+		map = kcov->map;
 	if (!map)
 		return;
 	rcu_read_lock();
@@ -581,7 +604,8 @@ static void kcov_put(struct kcov *kcov)
 {
 	if (refcount_dec_and_test(&kcov->refcount)) {
 		kcov_remote_reset(kcov);
-		kcov_map_free(kcov);
+		kcov_map_free(kcov, false);
+		kcov_map_free(kcov, true);
 		kfree(kcov);
 	}
 }
@@ -636,18 +660,27 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 	unsigned long size, off;
 	struct page *page;
 	unsigned long flags;
+	void *area;
 
 	spin_lock_irqsave(&kcov->lock, flags);
 	size = kcov->size * sizeof(unsigned long);
-	if (kcov->area == NULL || vma->vm_pgoff != 0 ||
-	    vma->vm_end - vma->vm_start != size) {
+	if (!vma->vm_pgoff) {
+		area = kcov->area;
+	} else if (vma->vm_pgoff == size >> PAGE_SHIFT) {
+		area = kcov->map_edge->area;
+	} else {
+		spin_unlock_irqrestore(&kcov->lock, flags);
+		return -EINVAL;
+	}
+
+	if (!area || vma->vm_end - vma->vm_start != size) {
 		res = -EINVAL;
 		goto exit;
 	}
 	spin_unlock_irqrestore(&kcov->lock, flags);
 	vm_flags_set(vma, VM_DONTEXPAND);
 	for (off = 0; off < size; off += PAGE_SIZE) {
-		page = vmalloc_to_page(kcov->area + off);
+		page = vmalloc_to_page(area + off);
 		res = vm_insert_page(vma, vma->vm_start + off, page);
 		if (res) {
 			pr_warn_once("kcov: vm_insert_page() failed\n");
@@ -693,6 +726,8 @@ static int kcov_get_mode(unsigned long arg)
 #endif
 	else if (arg == KCOV_TRACE_UNIQ_PC)
 		return KCOV_MODE_TRACE_UNIQ_PC;
+	else if (arg == KCOV_TRACE_UNIQ_EDGE)
+		return KCOV_MODE_TRACE_UNIQ_EDGE;
 	else
 		return -EINVAL;
 }
@@ -747,7 +782,8 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		 * at task exit or voluntary by KCOV_DISABLE. After that it can
 		 * be enabled for another task.
 		 */
-		if (kcov->mode != KCOV_MODE_INIT || !kcov->area)
+		if (kcov->mode != KCOV_MODE_INIT || !kcov->area ||
+		    !kcov->map_edge->area)
 			return -EINVAL;
 		t = current;
 		if (kcov->t != NULL || t->kcov != NULL)
@@ -859,7 +895,10 @@ static long kcov_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 		size = arg;
 		if (size < 2 || size > INT_MAX / sizeof(unsigned long))
 			return -EINVAL;
-		res = kcov_map_init(kcov, size);
+		res = kcov_map_init(kcov, size, false);
+		if (res)
+			return res;
+		res = kcov_map_init(kcov, size, true);
 		if (res)
 			return res;
 		spin_lock_irqsave(&kcov->lock, flags);

-- 
2.47.1


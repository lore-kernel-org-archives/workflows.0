Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887083F5BDD
	for <workflows@vger.kernel.org>; Wed,  8 Jul 2026 07:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783494543; cv=none; b=kYa4Vve/x89P0id4Li+a1o+OjckuMleGoEwD6ZohYWFR+J8/ydLZSXcsgCd1x/etqPCXx7Bar9hWzTlbdMGtDYwpTzkLBtZB4qkf3qiWeyeDCCnIFc/+pUzZELL5ivhWGemtmJ/2cerbSGv06HeY+mcMQ/ECH4cuks5Ee7dh3FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783494543; c=relaxed/simple;
	bh=RGp5QueaPiZd0P6W8KCH9xrLiM6DbSkJnCCzWwCQ2yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJr1/fhyEMccY2JZRH36Hc4OpnV0YCW0H+nnK0A1gujqCm4gJ8n1Bb2H4usdYVMIfUctbd2nYkeU9IFzHtNeQBWcsT+DIbTUcRNqAdWRFercDiHtrzskqCAgaoEuqhfIypGeMOd84WQBrNwZ9y5ITdkNcmiTvPaI4jhQMZZa77c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWA6Inxr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D9WCai9+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWA6Inxr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9WCai9+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6686qbVC2026508
	for <workflows@vger.kernel.org>; Wed, 8 Jul 2026 07:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nJqYhVncBU+
	d62V+AHvnJXoOTo03C+xWxG51CnST7TU=; b=dWA6InxrM1RDSuiXJWA8wNLflNn
	bjANDuPY7kJ2Uiv12Ah48NqX8rczX8ICeD49ThCPjfrxwDYvjDxGKz9TTTt4lcSy
	6CdqHUbjjbBrjrcFaa7ppQC+kldPN6iJVr8ovr6Cpw9lYjW9FNo6UzysXJkoMdQn
	W4wwr6HHJyeLZeFOsIEMQMGKFVmIw/83kT8n75XoFBAnTZyE15fA4huaUutPBeZz
	IxXwuRpA3MMGvJyii3Ju74nPN3LN9N7nfhkIaOFrr3wk31zMpV0WVtG4i+GAduni
	FbUnjHxWmv+nWZzRz0zqBeTgIvQ8ZII1udWS9nED984qtdCzvsPdUDYXx+A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9hnv023e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 08 Jul 2026 07:08:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c98a4ded1d7so382406a12.3
        for <workflows@vger.kernel.org>; Wed, 08 Jul 2026 00:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783494521; x=1784099321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJqYhVncBU+d62V+AHvnJXoOTo03C+xWxG51CnST7TU=;
        b=D9WCai9+7I+IOHtnXwNqjGgUHa5eGfOOdXs4JsPyooBFEXOy/2hRJIlTYH6sMZ6ke6
         DuqLtFUQkhKqjb8xh5IWzgeLFckTi9tzxIKAaq9eaaRkRfGkKk9Q2z31xKLhSd9YZaL7
         NE8c8ugHfYjH9yBjUdqqhRuFpNqcYXqyT66MPwymBIghsbgKzBNg8C3mV3vF0jOZXbtV
         6x0ZMubF0BkdzsQW66Mxl7PnjxfAI4lL86purI06ABe7cmovHVVDV21/yULd+ZSDhNXr
         YOeadjQvEflAnxlJB0jq0FfLC2wlleJ2gWPz0QdaqJZlalDSVNEzZ4r6zD+wRgz18MgZ
         GDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783494521; x=1784099321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJqYhVncBU+d62V+AHvnJXoOTo03C+xWxG51CnST7TU=;
        b=YyLTpkt//3rDr2yTyB+hASUE/5Aq6PlBGD2ry2gHnuWciG1YYiYXLuE3zn121SnyDV
         lQsjIjvRoYacdQyOM++vWdnFQACScTLJmYflbnjRxbawWrO6igQPkK2G4ciHpjcALMBt
         IFIBV+f+iJ/c98vmKipuqU6bRNA2nKJzcZJJL3AaqhypI4fR5HjJsKOCYWW+yO6cNjY3
         xFf4tnq151zG8fz6/1+OKstIQNCn3YjaHIVhQKKHM+OQKle268Hu5Vlj3rixbltG+yWf
         TOynm7VhoIfAmj5vkWrEuJS5BdburL/tfXWfw/jjBcn7OlB8SekR1Etcev06RTdvLFA6
         BMRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7pmnlsY9u77L+7oZ+5YV6st6Osm0RpRfel3qkDg06iKMsw7q2/aMW2FEh7YWanuINtSstcTRxOyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRL7iJqqXrg6tI5bItmjBXMyWCtDrNAD9Iv6aEUToLVPqzecao
	ZXcSw2t8jyj1T2Qq1JqNXn4OFkMlrcRzb/Z88UbTXGYlFzCfTmgie7WZ0+siZClz0eDvM7CR/XS
	/fS5cFrpmTZJ9+1/s4gzew6o9ujLXRoJOcFNCHAFaIT6TICN67+i6pQeF3hKIkeo=
X-Gm-Gg: AfdE7cnGKYUQYUAyOqnIa/yPMS5A864NgT9+2DSxgVIVaE8Fs/G+rWypvee2TiAT9GD
	P9P88Ht4Jc8qtZ2vRxDDutAZ+wn5jZDwtOD+CvR8lUlPGyDeDEuxNysHKHI6fKegsfwzPm8TU0t
	jv48kgQmTxEzYCrhtfa/SJXIcOFOAjsJGnjVIrgI+CMnckB3KzvZ2LIVoh9N+GeTjLL1qnBgEi1
	DKMjZY6dNJgjLTt0Iwf6fJ/TGrR3D5I6BRN67OE0cm2CdO3uDUhxSdaSWbLgJscUroKHV9WDAXR
	Yax5sV16VuL2L10vOjulLJWYaybbuHY7QMkJ74gEshpZoxCeFpFxM0ZW/cdzqnhKyVzbuxRmdkL
	Zoqj9Py0/kzT1dVC3JEJBUOIFphm76sH4HlQfQA==
X-Received: by 2002:a05:6a21:10e:b0:3c0:9c19:65b1 with SMTP id adf61e73a8af0-3c0bd3acfb6mr1445411637.73.1783494520986;
        Wed, 08 Jul 2026 00:08:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:10e:b0:3c0:9c19:65b1 with SMTP id adf61e73a8af0-3c0bd3acfb6mr1445323637.73.1783494520337;
        Wed, 08 Jul 2026 00:08:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb754asm1893624a12.13.2026.07.08.00.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 00:08:39 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de,
        andersson@kernel.org, chrisl@kernel.org, cl@gentwo.org,
        conor+dt@kernel.org, david@kernel.org, dennis@kernel.org,
        devicetree@vger.kernel.org, ehristev@kernel.org, frederic@kernel.org,
        mingo@redhat.com, jstultz@google.com, corbet@lwn.net,
        juri.lelli@redhat.com, kasong@tencent.com, kees@kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org, linux-arch@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
        mukesh.ojha@oss.qualcomm.com, peterz@infradead.org, pmladek@suse.com,
        robh@kernel.org, saravanak@kernel.org, tj@kernel.org, tglx@kernel.org,
        vincent.guittot@linaro.org, workflows@vger.kernel.org
Cc: atomlin@atomlin.com, ast@kernel.org, aliceryhl@google.com,
        linux.amoon@gmail.com, ardb@kernel.org, baoquan.he@linux.dev,
        baohua@kernel.org, bsegall@google.com, jackmanb@google.com,
        leitao@debian.org, brauner@kernel.org, coxu@redhat.com,
        dietmar.eggemann@arm.com, dianders@chromium.org, ebiggers@kernel.org,
        feng.tang@linux.alibaba.com, yangfeng@kylinos.cn, gary@garyguo.net,
        guohanjun@huawei.com, jack@suse.cz, wangjinchao600@gmail.com,
        joel.granados@kernel.org, hannes@cmpxchg.org,
        john.ogness@linutronix.de, jpoimboe@kernel.org,
        shikemeng@huaweicloud.com, kas@kernel.org, kprateek.nayak@amd.com,
        liam@infradead.org, ljs@kernel.org, elver@google.com, mgorman@suse.de,
        mhocko@suse.com, ojeda@kernel.org, rppt@kernel.org,
        namcao@linutronix.de, nathan@kernel.org, nphamcs@gmail.com,
        n.schier@fritz.com, pasha.tatashin@soleen.com, petr.pavlu@suse.com,
        pnina.feder@mobileye.com, rdunlap@infradead.org,
        rioo.tsukatsukii@gmail.com, senozhatsky@chromium.org,
        skhan@linuxfoundation.org, sboyd@kernel.org, rostedt@goodmis.org,
        surenb@google.com, thomas.weissschuh@linutronix.de,
        vschneid@redhat.com, vbabka@kernel.org, youngjun.park@lge.com,
        zhengyejian@huaweicloud.com, ziy@nvidia.com,
        Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH v3 26/26] meminspect: Add debug kinfo compatible driver
Date: Wed,  8 Jul 2026 12:38:09 +0530
Message-ID: <20260708070809.2660886-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNNqylFo c=1 sm=1 tr=0 ts=6a4df77a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Tty9oNO6AAAA:8 a=1XWaLZrsAAAA:8
 a=rSYwI8UV6N779v-tbp0A:9 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
 a=Bts-Es6F1CBXvF7u4C_G:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA2NyBTYWx0ZWRfX4DFquyrqW8y9
 azbt6g5N+FE8LiL0uNTiDwmuu7LLWVJe+t9KdnSDAAeT+94MSaYLlsCvBkiiEJa8r1GZldcb3ha
 kpnkyXB95beP9fqqNjgG2IS91igJIk8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA2NyBTYWx0ZWRfX/qq3f1wwWk/+
 v8Mwg/qujT0AJ9oWKrEDQ6EHQCZkQD1Az9egQIJv+8FHHQ2Xkwm9gXjyCjzsMzcyWG2NEisKlJ0
 3JIAGCmwHHyLHkKq9jf9p0GQSC8+mzVi0mrIERyqtpktWV9VlV5pvVK9Dqq12KXx+3ZJqLrHmqS
 NHRptVq6J5ezehcqFsjkdOMY3LVROMay+PpxsSZkxbawqBkA7lieX4go/NUhF/BZlAh0E5+BXtJ
 rFineDNKuPduNQ9IhAh74XlYdH0SyrfDy+JPIoGUyd3PFhqLhsbvF9ukmei9rJS59Zi94F9i6J5
 rObWl9XjkU/l3jU6FD76C+n/jgecYt3pUL2Vt0lWNal84vjpKyw5FI/pKuiHvlbVys9GbM0IrvA
 aGJWdvO90DXo/NsqmglPO8B2dbRJ+L3u9c6+Y1Cfg7GKhaaR8Elh6TJdem0dnrPktBBfoyIMiW1
 OJrIFk29uzgeLSpQKdA==
X-Proofpoint-ORIG-GUID: 8ILedsWgOhKwhEczVTtogJRlGtrydRWk
X-Proofpoint-GUID: 8ILedsWgOhKwhEczVTtogJRlGtrydRWk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080067

From: Eugen Hristev <eugen.hristev@linaro.org>

With this driver, the registered regions are copied to a shared memory
zone at register time. The shared memory zone is supplied via OF. This
driver will select only regions that are of interest, and keep only
addresses. The format of the list is Kinfo compatible, with devices like
Google Pixel phone. The firmware is only interested in some symbols'
addresses.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 MAINTAINERS                |   1 +
 drivers/of/platform.c      |   1 +
 kernel/meminspect/Kconfig  |  11 ++
 kernel/meminspect/Makefile |   1 +
 kernel/meminspect/kinfo.c  | 257 +++++++++++++++++++++++++++++++++++++
 5 files changed, 271 insertions(+)
 create mode 100644 kernel/meminspect/kinfo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 2d816d783024..d805ff9fedac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16906,6 +16906,7 @@ M:	Eugen Hristev <eugen.hristev@linaro.org>
 M:	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
+F:	kernel/meminspect/kinfo.c
 
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 53bca8c6f781..f80bd25fc481 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -494,6 +494,7 @@ static const struct of_device_id reserved_mem_matches[] = {
 	{ .compatible = "qcom,smem" },
 	{ .compatible = "ramoops" },
 	{ .compatible = "nvmem-rmem" },
+	{ .compatible = "google,debug-kinfo" },
 	{ .compatible = "google,open-dice" },
 	{}
 };
diff --git a/kernel/meminspect/Kconfig b/kernel/meminspect/Kconfig
index 18ff511ad4cf..7f6436c3344b 100644
--- a/kernel/meminspect/Kconfig
+++ b/kernel/meminspect/Kconfig
@@ -16,3 +16,14 @@ config MEMINSPECT
 
 	  Note that modules using this feature must be rebuilt if this
 	  option changes.
+
+config MEMINSPECT_KINFO
+	tristate "Shared memory KInfo compatible driver"
+	depends on MEMINSPECT
+	help
+	  Say y here to enable the Shared memory KInfo compatible driver.
+	  With this driver, the registered regions are copied to a shared
+	  memory zone at register time.
+	  The shared memory zone is supplied via OF.
+	  This driver will select only regions that are of interest,
+	  and keep only addresses. The format of the list is Kinfo compatible.
diff --git a/kernel/meminspect/Makefile b/kernel/meminspect/Makefile
index 09fd55e6d9cf..283604d892e5 100644
--- a/kernel/meminspect/Makefile
+++ b/kernel/meminspect/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_MEMINSPECT) += meminspect.o
+obj-$(CONFIG_MEMINSPECT_KINFO) += kinfo.o
diff --git a/kernel/meminspect/kinfo.c b/kernel/meminspect/kinfo.c
new file mode 100644
index 000000000000..7451c13bc316
--- /dev/null
+++ b/kernel/meminspect/kinfo.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * Copyright 2002 Rusty Russell <rusty@rustcorp.com.au> IBM Corporation
+ * Copyright 2021 Google LLC
+ * Copyright 2025 Linaro Ltd. Eugen Hristev <eugen.hristev@linaro.org>
+ */
+#include <linux/container_of.h>
+#include <linux/kallsyms.h>
+#include <linux/meminspect.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/utsname.h>
+
+#define BUILD_INFO_LEN		256
+#define DEBUG_KINFO_MAGIC	0xcceeddff
+
+/*
+ * Header structure must be byte-packed, since the table is provided to
+ * bootloader.
+ */
+struct kernel_info {
+	/* For kallsyms */
+	u8 enabled_all;
+	u8 enabled_base_relative;
+	u8 enabled_absolute_percpu;
+	u8 enabled_cfi_clang;
+	u32 num_syms;
+	u16 name_len;
+	u16 bit_per_long;
+	u16 module_name_len;
+	u16 symbol_len;
+	u64 _relative_pa;
+	u64 _text_pa;
+	u64 _stext_pa;
+	u64 _etext_pa;
+	u64 _sinittext_pa;
+	u64 _einittext_pa;
+	u64 _end_pa;
+	u64 _offsets_pa;
+	u64 _names_pa;
+	u64 _token_table_pa;
+	u64 _token_index_pa;
+	u64 _markers_pa;
+	u64 _seqs_of_names_pa;
+
+	/* For frame pointer */
+	u32 thread_size;
+
+	/* For virt_to_phys */
+	u64 swapper_pg_dir_pa;
+
+	/* For linux banner */
+	u8 last_uts_release[__NEW_UTS_LEN];
+
+	/* For module kallsyms */
+	u32 enabled_modules_tree_lookup;
+	u32 mod_mem_offset;
+	u32 mod_kallsyms_offset;
+} __packed;
+
+struct kernel_all_info {
+	u32 magic_number;
+	u32 combined_checksum;
+	struct kernel_info info;
+} __packed;
+
+struct debug_kinfo {
+	struct device *dev;
+	void *all_info_addr;
+	size_t all_info_size;
+	struct notifier_block nb;
+};
+
+static void update_kernel_all_info(struct kernel_all_info *all_info)
+{
+	struct kernel_info *info;
+	u32 *checksum_info;
+	int index;
+
+	all_info->magic_number = DEBUG_KINFO_MAGIC;
+	all_info->combined_checksum = 0;
+
+	info = &all_info->info;
+	checksum_info = (u32 *)info;
+	for (index = 0; index < sizeof(*info) / sizeof(u32); index++)
+		all_info->combined_checksum ^= checksum_info[index];
+}
+
+static void __maybe_unused register_kinfo_region(void *priv,
+						 const struct inspect_entry *e)
+{
+	struct debug_kinfo *kinfo = priv;
+	struct kernel_all_info *all_info = kinfo->all_info_addr;
+	struct kernel_info *info = &all_info->info;
+	struct uts_namespace *uts;
+	u64 paddr;
+
+	if (e->pa)
+		paddr = e->pa;
+	else
+		paddr = __pa(e->va);
+
+	switch (e->id) {
+	case MEMINSPECT_ID__sinittext:
+		info->_sinittext_pa = paddr;
+		break;
+	case MEMINSPECT_ID__einittext:
+		info->_einittext_pa = paddr;
+		break;
+	case MEMINSPECT_ID__end:
+		info->_end_pa = paddr;
+		break;
+	case MEMINSPECT_ID__text:
+		info->_text_pa = paddr;
+		break;
+	case MEMINSPECT_ID__stext:
+		info->_stext_pa = paddr;
+		break;
+	case MEMINSPECT_ID__etext:
+		info->_etext_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_num_syms:
+		info->num_syms = *(__u32 *)e->va;
+		break;
+	case MEMINSPECT_ID_kallsyms_offsets:
+		info->_offsets_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_names:
+		info->_names_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_token_table:
+		info->_token_table_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_token_index:
+		info->_token_index_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_markers:
+		info->_markers_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_seqs_of_names:
+		info->_seqs_of_names_pa = paddr;
+		break;
+	case MEMINSPECT_ID_swapper_pg_dir:
+		info->swapper_pg_dir_pa = paddr;
+		break;
+	case MEMINSPECT_ID_init_uts_ns:
+		if (!e->va)
+			return;
+		uts = e->va;
+		strscpy(info->last_uts_release, uts->name.release, __NEW_UTS_LEN);
+		break;
+	default:
+		break;
+	};
+
+	update_kernel_all_info(all_info);
+}
+
+static int kinfo_notifier_cb(struct notifier_block *nb,
+			     unsigned long code, void *entry)
+{
+	struct debug_kinfo *kinfo = container_of(nb, struct debug_kinfo, nb);
+
+	if (code == MEMINSPECT_NOTIFIER_ADD)
+		register_kinfo_region(kinfo, entry);
+
+	return NOTIFY_DONE;
+}
+
+static int debug_kinfo_probe(struct platform_device *pdev)
+{
+	struct kernel_all_info *all_info;
+	struct device *dev = &pdev->dev;
+	struct reserved_mem *rmem;
+	struct debug_kinfo *kinfo;
+	struct kernel_info *info;
+
+	rmem = of_reserved_mem_lookup(dev->of_node);
+	if (!rmem)
+		return dev_err_probe(dev, -ENODEV, "no such reserved mem of node name %s\n",
+			      dev->of_node->name);
+
+	/* Need to wait for reserved memory to be mapped */
+	if (!rmem->priv)
+		return -EPROBE_DEFER;
+
+	if (!rmem->base || !rmem->size)
+		dev_err_probe(dev, -EINVAL, "unexpected reserved memory\n");
+
+	if (rmem->size < sizeof(struct kernel_all_info))
+		dev_err_probe(dev, -EINVAL, "reserved memory size too small\n");
+
+	kinfo = devm_kzalloc(dev, sizeof(*kinfo), GFP_KERNEL);
+	if (!kinfo)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, kinfo);
+
+	kinfo->dev = dev;
+	kinfo->all_info_addr = rmem->priv;
+	kinfo->all_info_size = rmem->size;
+
+	all_info = kinfo->all_info_addr;
+
+	memset(all_info, 0, sizeof(struct kernel_all_info));
+	info = &all_info->info;
+	info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
+	info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
+	info->enabled_base_relative = IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE);
+	info->enabled_cfi_clang = IS_ENABLED(CONFIG_CFI_CLANG);
+	info->name_len = KSYM_NAME_LEN;
+	info->bit_per_long = BITS_PER_LONG;
+	info->module_name_len = MODULE_NAME_LEN;
+	info->symbol_len = KSYM_SYMBOL_LEN;
+	info->thread_size = THREAD_SIZE;
+	info->enabled_modules_tree_lookup = IS_ENABLED(CONFIG_MODULES_TREE_LOOKUP);
+	info->mod_mem_offset = offsetof(struct module, mem);
+	info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
+
+	kinfo->nb.notifier_call = kinfo_notifier_cb;
+
+	meminspect_notifier_register(&kinfo->nb);
+	meminspect_lock_traverse(kinfo, register_kinfo_region);
+
+	return 0;
+}
+
+static void debug_kinfo_remove(struct platform_device *pdev)
+{
+	struct debug_kinfo *kinfo = platform_get_drvdata(pdev);
+
+	meminspect_notifier_unregister(&kinfo->nb);
+}
+
+static const struct of_device_id debug_kinfo_of_match[] = {
+	{ .compatible	= "google,debug-kinfo" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
+
+static struct platform_driver debug_kinfo_driver = {
+	.probe = debug_kinfo_probe,
+	.remove = debug_kinfo_remove,
+	.driver = {
+		.name = "debug-kinfo",
+		.of_match_table = debug_kinfo_of_match,
+	},
+};
+module_platform_driver(debug_kinfo_driver);
+
+MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
+MODULE_AUTHOR("Jone Chou <jonechou@google.com>");
+MODULE_DESCRIPTION("meminspect Kinfo Driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0


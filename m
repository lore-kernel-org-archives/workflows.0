Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEB8233555;
	Tue, 14 Jan 2025 05:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736832990; cv=none; b=oIncuGEm9R3KyCQcH/NewC2v0NfOCSMhTsFzbQM1nHfsJ8+ZTe2JhwqQryMTKiyV6jUm1xGdpIaY2iK0KEmhX3uMwPT7A0a74l1yz5AXgAxQIEMCUHhoGCfyV4NshGg/6V8hep1CQsDP8ix8mMFG+zwifBiNMR4bWEZQbH9XbUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736832990; c=relaxed/simple;
	bh=Lulb9I7d15ITpgpA7vYK556BzHyWX5kLFMs7zHurtPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uunMn0ZDN12kK6h0AsWVDWsR1QFpJFU7UULkb4qI6stV3KprO6mtsOE+7+GiRfDSwWgxeTIbUuoIY/NLV/iszmMcdRptM0XYK1Nc8shdaFaPIjvebDMnJjBhhlXi3Fgc5aSfpv9W46ATc8Yjg6ytfIylVeYwHBdyOqFhP9o7m08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JCcY18Jy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JCcY18Jy"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E23rPd008664;
	Tue, 14 Jan 2025 05:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SnTIiCvc99mwVePAnY7xDBhzjlSnYyKXixXlpKzOnM4=; b=JCcY18JyP35QhE2i
	nTjLZc54+6+TZtbHeqOYLvTzs51/WglbUjzKvSN3lsVfQz+xcPJwbZ99TgdvzWn7
	LXMehmLWqLiUyLd4SPi0JjnNHo2mo15MwWRqxvyHDbA9BfK+Hr/9CV2YcB9CJ8oW
	D9iSo3GMZWa0RQfAoewUcgVxfAF0ofbldSUuN/t1rRoSVGgmjZO2MU5La2FXQemL
	fWgQqX6qZ79MfriW7E0xk2uwE2Gbku+0Sm4DgW20S7AdSBXti4neB5cW/rvT+y84
	739faLja8SC7lzZzbseLpoMcCZmkxjWf0zEbIuuq1tvq8HD+iroq0bUWawsQ24pl
	HEv1UQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445eterdbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:36:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5a5VP031710
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:36:05 GMT
Received: from la-sh002-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 21:35:59 -0800
From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
Date: Tue, 14 Jan 2025 13:34:35 +0800
Subject: [PATCH 5/7] kcov: add the new KCOV uniq modes example code
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250114-kcov-v1-5-004294b931a2@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736832942; l=11230;
 i=quic_jiangenj@quicinc.com; s=20250114; h=from:subject:message-id;
 bh=Lulb9I7d15ITpgpA7vYK556BzHyWX5kLFMs7zHurtPk=;
 b=PsYnlyeqPpQvbH0Tjx/23z40jyNSYl78V1dqIGIKdCPIfjW6tQcTCFyzJ9UvXBOuXjtWtUwDB
 TAqwKIXfgCUBSNrKOSChk4WtD7SAjYOBbZ/LvHcIKI1yVt1GRWOuj8H
X-Developer-Key: i=quic_jiangenj@quicinc.com; a=ed25519;
 pk=JPzmfEvx11SW1Q1qtMhFcAx46KP1Ui36jcetDgbev28=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wnv8w4hud187Ydr9CX1bF6ILuw6Aa77S
X-Proofpoint-GUID: wnv8w4hud187Ydr9CX1bF6ILuw6Aa77S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140044

- Use single program to select different mode.
- Mode [0|1|2|4|8] to KCOV_TRACE_[PC|CMP|UNIQ_PC|UNIQ_EDGE|UNIQ_CMP].
- Mode 6 to KCOV_TRACE_UNIQ_PC and KCOV_TRACE_UNIQ_EDGE.

Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
---
 Documentation/dev-tools/kcov.rst | 243 ++++++++++++++++++++-------------------
 1 file changed, 122 insertions(+), 121 deletions(-)

diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
index 6611434e2dd247c6c40afcbf1e6c4e22e0562176..061ae20b867fd9e68b447b86719733278ee6b86f 100644
--- a/Documentation/dev-tools/kcov.rst
+++ b/Documentation/dev-tools/kcov.rst
@@ -40,11 +40,12 @@ Coverage data only becomes accessible once debugfs has been mounted::
 
         mount -t debugfs none /sys/kernel/debug
 
-Coverage collection
+Coverage collection for different modes
 -------------------
 
 The following program demonstrates how to use KCOV to collect coverage for a
-single syscall from within a test program:
+single syscall from within a test program, argv[1] can be provided to select
+which mode to enable:
 
 .. code-block:: c
 
@@ -60,55 +61,130 @@ single syscall from within a test program:
     #include <fcntl.h>
     #include <linux/types.h>
 
-    #define KCOV_INIT_TRACE			_IOR('c', 1, unsigned long)
+    #define KCOV_INIT_TRACE		_IOR('c', 1, unsigned long)
     #define KCOV_ENABLE			_IO('c', 100)
-    #define KCOV_DISABLE			_IO('c', 101)
+    #define KCOV_DISABLE		_IO('c', 101)
     #define COVER_SIZE			(64<<10)
 
     #define KCOV_TRACE_PC  0
     #define KCOV_TRACE_CMP 1
+    #define KCOV_TRACE_UNIQ_PC 2
+    #define KCOV_TRACE_UNIQ_EDGE 4
+    #define KCOV_TRACE_UNIQ_CMP 8
+
+    /* Number of 64-bit words per record. */
+    #define KCOV_WORDS_PER_CMP 4
+
+    /*
+     * The format for the types of collected comparisons.
+     *
+     * Bit 0 shows whether one of the arguments is a compile-time constant.
+     * Bits 1 & 2 contain log2 of the argument size, up to 8 bytes.
+     */
+
+    #define KCOV_CMP_CONST		(1 << 0)
+    #define KCOV_CMP_SIZE(n)		((n) << 1)
+    #define KCOV_CMP_MASK		KCOV_CMP_SIZE(3)
 
     int main(int argc, char **argv)
     {
-	int fd;
-	unsigned long *cover, n, i;
-
-	/* A single fd descriptor allows coverage collection on a single
-	 * thread.
-	 */
-	fd = open("/sys/kernel/debug/kcov", O_RDWR);
-	if (fd == -1)
-		perror("open"), exit(1);
-	/* Setup trace mode and trace size. */
-	if (ioctl(fd, KCOV_INIT_TRACE, COVER_SIZE))
-		perror("ioctl"), exit(1);
-	/* Mmap buffer shared between kernel- and user-space. */
-	cover = (unsigned long*)mmap(NULL, COVER_SIZE * sizeof(unsigned long),
-				     PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
-	if ((void*)cover == MAP_FAILED)
-		perror("mmap"), exit(1);
-	/* Enable coverage collection on the current thread. */
-	if (ioctl(fd, KCOV_ENABLE, KCOV_TRACE_PC))
-		perror("ioctl"), exit(1);
-	/* Reset coverage from the tail of the ioctl() call. */
-	__atomic_store_n(&cover[0], 0, __ATOMIC_RELAXED);
-	/* Call the target syscall call. */
-	read(-1, NULL, 0);
-	/* Read number of PCs collected. */
-	n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
-	for (i = 0; i < n; i++)
-		printf("0x%lx\n", cover[i + 1]);
-	/* Disable coverage collection for the current thread. After this call
-	 * coverage can be enabled for a different thread.
-	 */
-	if (ioctl(fd, KCOV_DISABLE, 0))
-		perror("ioctl"), exit(1);
-	/* Free resources. */
-	if (munmap(cover, COVER_SIZE * sizeof(unsigned long)))
-		perror("munmap"), exit(1);
-	if (close(fd))
-		perror("close"), exit(1);
-	return 0;
+        int fd;
+        unsigned long *cover, *edge, n, n1, i, type, arg1, arg2, is_const, size;
+        unsigned int mode = KCOV_TRACE_PC;
+
+        /* argv[1] controls which mode to use, default to KCOV_TRACE_PC.
+         * supported modes include:
+         * KCOV_TRACE_PC
+         * KCOV_TRACE_CMP
+         * KCOV_TRACE_UNIQ_PC
+         * KCOV_TRACE_UNIQ_EDGE
+         * KCOV_TRACE_UNIQ_PC | KCOV_TRACE_UNIQ_EDGE
+         * KCOV_TRACE_UNIQ_CMP
+         */
+        if (argc > 1)
+            mode = (unsigned int)strtoul(argv[1], NULL, 10);
+        printf("The mode is: %u\n", mode);
+        if (mode != KCOV_TRACE_PC && mode != KCOV_TRACE_CMP &&
+            !(mode & (KCOV_TRACE_UNIQ_PC | KCOV_TRACE_UNIQ_EDGE | KCOV_TRACE_UNIQ_CMP))) {
+            printf("Unsupported mode!\n");
+            exit(1);
+        }
+        /* A single fd descriptor allows coverage collection on a single
+         * thread.
+         */
+        fd = open("/sys/kernel/debug/kcov", O_RDWR);
+        if (fd == -1)
+            perror("open"), exit(1);
+        /* Setup trace mode and trace size. */
+        if (ioctl(fd, KCOV_INIT_TRACE, COVER_SIZE))
+            perror("ioctl"), exit(1);
+        /* Mmap buffer shared between kernel- and user-space. */
+        cover = (unsigned long*)mmap(NULL, COVER_SIZE * sizeof(unsigned long),
+                    PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+        if ((void*)cover == MAP_FAILED)
+            perror("mmap"), exit(1);
+        if (mode & KCOV_TRACE_UNIQ_EDGE) {
+            edge = (unsigned long*)mmap(NULL, COVER_SIZE * sizeof(unsigned long),
+                        PROT_READ | PROT_WRITE, MAP_SHARED, fd, COVER_SIZE * sizeof(unsigned long));
+            if ((void*)edge == MAP_FAILED)
+                perror("mmap"), exit(1);
+        }
+        /* Enable coverage collection on the current thread. */
+        if (ioctl(fd, KCOV_ENABLE, mode))
+            perror("ioctl"), exit(1);
+        /* Reset coverage from the tail of the ioctl() call. */
+        __atomic_store_n(&cover[0], 0, __ATOMIC_RELAXED);
+        if (mode & KCOV_TRACE_UNIQ_EDGE)
+            __atomic_store_n(&edge[0], 0, __ATOMIC_RELAXED);
+        /* Call the target syscall call. */
+        read(-1, NULL, 0);
+        /* Read number of PCs collected. */
+        n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
+        if (mode & KCOV_TRACE_UNIQ_EDGE)
+            n1 = __atomic_load_n(&edge[0], __ATOMIC_RELAXED);
+        if (mode & (KCOV_TRACE_CMP | KCOV_TRACE_UNIQ_CMP)) {
+            for (i = 0; i < n; i++) {
+                uint64_t ip;
+
+                type = cover[i * KCOV_WORDS_PER_CMP + 1];
+                /* arg1 and arg2 - operands of the comparison. */
+                arg1 = cover[i * KCOV_WORDS_PER_CMP + 2];
+                arg2 = cover[i * KCOV_WORDS_PER_CMP + 3];
+                /* ip - caller address. */
+                ip = cover[i * KCOV_WORDS_PER_CMP + 4];
+                /* size of the operands. */
+                size = 1 << ((type & KCOV_CMP_MASK) >> 1);
+                /* is_const - true if either operand is a compile-time constant.*/
+                is_const = type & KCOV_CMP_CONST;
+                printf("ip: 0x%lx type: 0x%lx, arg1: 0x%lx, arg2: 0x%lx, "
+                        "size: %lu, %s\n",
+                        ip, type, arg1, arg2, size,
+                is_const ? "const" : "non-const");
+            }
+        } else {
+            for (i = 0; i < n; i++)
+                printf("0x%lx\n", cover[i + 1]);
+            if (mode & KCOV_TRACE_UNIQ_EDGE) {
+                printf("======edge======\n");
+                for (i = 0; i < n1; i++)
+                    printf("0x%lx\n", edge[i + 1]);
+            }
+        }
+        /* Disable coverage collection for the current thread. After this call
+         * coverage can be enabled for a different thread.
+         */
+        if (ioctl(fd, KCOV_DISABLE, 0))
+            perror("ioctl"), exit(1);
+        /* Free resources. */
+        if (munmap(cover, COVER_SIZE * sizeof(unsigned long)))
+            perror("munmap"), exit(1);
+        if (mode & KCOV_TRACE_UNIQ_EDGE) {
+            if (munmap(edge, COVER_SIZE * sizeof(unsigned long)))
+                perror("munmap"), exit(1);
+        }
+        if (close(fd))
+            perror("close"), exit(1);
+        return 0;
     }
 
 After piping through ``addr2line`` the output of the program looks as follows::
@@ -137,85 +213,10 @@ mmaps coverage buffer, and then forks child processes in a loop. The child
 processes only need to enable coverage (it gets disabled automatically when
 a thread exits).
 
-Comparison operands collection
-------------------------------
-
-Comparison operands collection is similar to coverage collection:
-
-.. code-block:: c
-
-    /* Same includes and defines as above. */
-
-    /* Number of 64-bit words per record. */
-    #define KCOV_WORDS_PER_CMP 4
-
-    /*
-     * The format for the types of collected comparisons.
-     *
-     * Bit 0 shows whether one of the arguments is a compile-time constant.
-     * Bits 1 & 2 contain log2 of the argument size, up to 8 bytes.
-     */
-
-    #define KCOV_CMP_CONST          (1 << 0)
-    #define KCOV_CMP_SIZE(n)        ((n) << 1)
-    #define KCOV_CMP_MASK           KCOV_CMP_SIZE(3)
-
-    int main(int argc, char **argv)
-    {
-	int fd;
-	uint64_t *cover, type, arg1, arg2, is_const, size;
-	unsigned long n, i;
-
-	fd = open("/sys/kernel/debug/kcov", O_RDWR);
-	if (fd == -1)
-		perror("open"), exit(1);
-	if (ioctl(fd, KCOV_INIT_TRACE, COVER_SIZE))
-		perror("ioctl"), exit(1);
-	/*
-	* Note that the buffer pointer is of type uint64_t*, because all
-	* the comparison operands are promoted to uint64_t.
-	*/
-	cover = (uint64_t *)mmap(NULL, COVER_SIZE * sizeof(unsigned long),
-				     PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
-	if ((void*)cover == MAP_FAILED)
-		perror("mmap"), exit(1);
-	/* Note KCOV_TRACE_CMP instead of KCOV_TRACE_PC. */
-	if (ioctl(fd, KCOV_ENABLE, KCOV_TRACE_CMP))
-		perror("ioctl"), exit(1);
-	__atomic_store_n(&cover[0], 0, __ATOMIC_RELAXED);
-	read(-1, NULL, 0);
-	/* Read number of comparisons collected. */
-	n = __atomic_load_n(&cover[0], __ATOMIC_RELAXED);
-	for (i = 0; i < n; i++) {
-		uint64_t ip;
-
-		type = cover[i * KCOV_WORDS_PER_CMP + 1];
-		/* arg1 and arg2 - operands of the comparison. */
-		arg1 = cover[i * KCOV_WORDS_PER_CMP + 2];
-		arg2 = cover[i * KCOV_WORDS_PER_CMP + 3];
-		/* ip - caller address. */
-		ip = cover[i * KCOV_WORDS_PER_CMP + 4];
-		/* size of the operands. */
-		size = 1 << ((type & KCOV_CMP_MASK) >> 1);
-		/* is_const - true if either operand is a compile-time constant.*/
-		is_const = type & KCOV_CMP_CONST;
-		printf("ip: 0x%lx type: 0x%lx, arg1: 0x%lx, arg2: 0x%lx, "
-			"size: %lu, %s\n",
-			ip, type, arg1, arg2, size,
-		is_const ? "const" : "non-const");
-	}
-	if (ioctl(fd, KCOV_DISABLE, 0))
-		perror("ioctl"), exit(1);
-	/* Free resources. */
-	if (munmap(cover, COVER_SIZE * sizeof(unsigned long)))
-		perror("munmap"), exit(1);
-	if (close(fd))
-		perror("close"), exit(1);
-	return 0;
-    }
-
 Note that the KCOV modes (collection of code coverage or comparison operands)
-are mutually exclusive.
+are mutually exclusive, KCOV_TRACE_UNIQ_PC and KCOV_TRACE_UNIQ_EDGE can be
+enabled together.
+
 
 Remote coverage collection
 --------------------------

-- 
2.47.1


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D240424025D;
	Tue, 14 Jan 2025 05:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736832974; cv=none; b=FJyxPyfLRawUKjFduFAp/F7Edq+D77If2OB+lNw7sx6tylwXCOWlniyQEqx6HS0q5sWjYNWEk7p79SI8bDiR46qx9eW4hzhYxfy3ZMGx1KlaXSmT8ZcqWX7L7K+1a+o7vyHOjcdCoi9qCcdSEgcBQcgFlw0ycWC8RKfhmwYRWsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736832974; c=relaxed/simple;
	bh=KF+hdYTmC0kaoWHPMMW6dtsTZWgnKqQ/QLSr+4P37p8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=BXOnRNj3DFuTuvPhIPBxDCbP3EFTyOjPi+xsNROYJ/pVPOqCzuSu92CWoTMBWdOTWLFkzPji1yqe0qVNGSsJzRcUW9dQXdHRYB3YILP96Sk9rZ/ibQCKw2AabEkuiVbX+5fYeFcfDX1dWKQWV7c8tRoHO3KiQm7K8l1t+punyes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nyGQ2yT1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nyGQ2yT1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DJLZn7002853;
	Tue, 14 Jan 2025 05:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fGXqRSIT8iEokM5NpyWSUn
	u+CJKUU08IeXrkQyvtOR8=; b=nyGQ2yT1uki8fxdIwfkDSfYTvGhwsgIQNR8Y3K
	A5gMrUzsV5+SWIBWuzLUaNonLLAAaom8bsvi0VR5maHmArF/dPZCgttkBr2q0qqO
	/+Ctq7cbaxMwoImYRuJxu+y1Olwf2EUb7gUW0WbiuS9gRBt9fz4S2w0uJmrUUb1i
	iyWmOQq9AmhUElH1QnNp8e4gWF/JOwHrYoo6hbx/Jc6wSGzmkgZdV42rQnesybES
	8tQdth8EevNpwPVsWcW9I5unLSoCP/cDU6LkuH/v7xuifcR0js+bs+DTnZePWf6L
	x49fxxkAYVlvEx5OLGZ9nhHUOtgcBrNp3MVXc2XABnw81quw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4458ww943r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:35:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5ZnsK019741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:35:49 GMT
Received: from la-sh002-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 21:35:42 -0800
From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
Subject: [PATCH 0/7] kcov: Introduce New Unique PC|EDGE|CMP Modes
Date: Tue, 14 Jan 2025 13:34:30 +0800
Message-ID: <20250114-kcov-v1-0-004294b931a2@quicinc.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGf3hWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0MT3ezk/DJdS9Pk1JTU5FQTM1MTJaDSgqLUtMwKsDHRsbW1AKxXN/F
 WAAAA
X-Change-ID: 20250114-kcov-95cedece4654
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736832941; l=4982;
 i=quic_jiangenj@quicinc.com; s=20250114; h=from:subject:message-id;
 bh=KF+hdYTmC0kaoWHPMMW6dtsTZWgnKqQ/QLSr+4P37p8=;
 b=nAwxJxgoU1Q8LXtKwFqlrO6wF8qseE8RRM3mpTnNkDOJW0S2nAezeabZxQjA4mCxTlAmyGo8a
 DfF4x/4tIOJActPFgWO0910pfQVzG+JdHbQjV5X7EQQJQL55VWc6VYf
X-Developer-Key: i=quic_jiangenj@quicinc.com; a=ed25519;
 pk=JPzmfEvx11SW1Q1qtMhFcAx46KP1Ui36jcetDgbev28=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: W6wLUaQRtXns5-yBsMSVi63JGdBpU7pd
X-Proofpoint-ORIG-GUID: W6wLUaQRtXns5-yBsMSVi63JGdBpU7pd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=864 mlxscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140044

Hi,

This patch series introduces new kcov unique modes: 
`KCOV_TRACE_UNIQ_[PC|EDGE|CMP]`, which are used to collect unique PC, EDGE,
CMP information.

Background
----------

In the current kcov implementation, when `__sanitizer_cov_trace_pc` is hit,
the instruction pointer (IP) is stored sequentially in an area. Userspace 
programs then read this area to record covered PCs and calculate covered
edges.  However, recent syzkaller runs show that many syscalls likely have
`pos > t->kcov_size`, leading to kcov overflow. To address this issue, we 
introduce new kcov unique modes.

Solution Overview
-----------------

1. [P 1] Introduce `KCOV_TRACE_UNIQ_PC` Mode:
   - Export `KCOV_TRACE_UNIQ_PC` to userspace.
   - Add `kcov_map` struct to manage memory during the KCOV lifecycle.
     - `kcov_entry` struct as a hashtable entry containing unique PCs.
     - Use hashtable buckets to link `kcov_entry`.
     - Preallocate memory using genpool during KCOV initialization.
     - Move `area` inside `kcov_map` for easier management.
   - Use `jhash` for hash key calculation to support `KCOV_TRACE_UNIQ_CMP` 
     mode.

2. [P 2-3] Introduce `KCOV_TRACE_UNIQ_EDGE` Mode:
   - Save `prev_pc` to calculate edges with the current IP.
   - Add unique edges to the hashmap.
   - Use a lower 12-bit mask to make hash independent of module offsets.
   - Distinguish areas for `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
     modes using `offset` during mmap.
   - Support enabling `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
     together.

3. [P 4] Introduce `KCOV_TRACE_UNIQ_CMP` Mode:
   - Shares the area with `KCOV_TRACE_UNIQ_PC`, making these modes
     exclusive.

4. [P 5] Add Example Code Documentation:
   - Provide examples for testing different modes:
     - `KCOV_TRACE_PC`: `./kcov` or `./kcov 0`
     - `KCOV_TRACE_CMP`: `./kcov 1`
     - `KCOV_TRACE_UNIQ_PC`: `./kcov 2`
     - `KCOV_TRACE_UNIQ_EDGE`: `./kcov 4`
     - `KCOV_TRACE_UNIQ_PC|KCOV_TRACE_UNIQ_EDGE`: `./kcov 6`
     - `KCOV_TRACE_UNIQ_CMP`: `./kcov 8`

5. [P 6-7] Disable KCOV Instrumentation:
   - Disable instrumentation like genpool to prevent recursive calls.

Caveats
-------

The userspace program has been tested on Qemu x86_64 and two real Android
phones with different ARM64 chips. More syzkaller-compatible tests have
been conducted. However, due to limited knowledge of other platforms, 
assistance from those with access to other systems is needed.

Results and Analysis
--------------------

1. KMEMLEAK Test on Qemu x86_64:
   - No memory leaks found during the `kcov` program run.

2. KCSAN Test on Qemu x86_64:
   - No KCSAN issues found during the `kcov` program run.

3. Existing Syzkaller on Qemu x86_64 and Real ARM64 Device:
   - Syzkaller can fuzz, show coverage, and find bugs. Adjusting `procs`
     and `vm mem` settings can avoid OOM issues caused by genpool in the
     patches, so `procs:4 + vm:2GB` or `procs:4 + vm:2GB` are used for
     Qemu x86_64.
   - `procs:8` is kept on Real ARM64 Device with 12GB/16GB mem.

4. Modified Syzkaller to Support New KCOV Unique Modes:
   - Syzkaller runs fine on both Qemu x86_64 and ARM64 real devices.
     Limited `Cover overflows` and `Comps overflows` observed.

5. Modified Syzkaller + Upstream Kernel Without Patch Series:
   - Not tested. The modified syzkaller will fall back to `KCOV_TRACE_PC`
     or `KCOV_TRACE_CMP` if `ioctl` fails for Unique mode.

Possible Further Enhancements
-----------------------------

1. Test more cases and setups, including those in syzbot.
2. Ensure `hash_for_each_possible_rcu` is protected for reentrance
   and atomicity.
3. Find a simpler and more efficient way to store unique coverage.

Conclusion
----------

These patches add new kcov unique modes to mitigate the kcov overflow
issue, compatible with both existing and new syzkaller versions.

Thanks,
Joey Jiao

---
Jiao, Joey (7):
      kcov: introduce new kcov KCOV_TRACE_UNIQ_PC mode
      kcov: introduce new kcov KCOV_TRACE_UNIQ_EDGE mode
      kcov: allow using KCOV_TRACE_UNIQ_[PC|EDGE] modes together
      kcov: introduce new kcov KCOV_TRACE_UNIQ_CMP mode
      kcov: add the new KCOV uniq modes example code
      kcov: disable instrumentation for genalloc and bitmap
      arm64: disable kcov instrument in header files

 Documentation/dev-tools/kcov.rst | 243 ++++++++++++++--------------
 arch/arm64/include/asm/percpu.h  |   2 +-
 arch/arm64/include/asm/preempt.h |   2 +-
 include/linux/kcov.h             |  10 +-
 include/uapi/linux/kcov.h        |   6 +
 kernel/kcov.c                    | 333 +++++++++++++++++++++++++++++++++------
 lib/Makefile                     |   2 +
 7 files changed, 423 insertions(+), 175 deletions(-)
---
base-commit: 9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
change-id: 20250114-kcov-95cedece4654

Best regards,
-- 
<Jiao, Joey> <quic_jiangenj@quicinc.com>


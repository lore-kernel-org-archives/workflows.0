Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46238229620;
	Tue, 14 Jan 2025 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736859639; cv=none; b=ALPrbu4V3KEtYnWSPDfgRnMnw8oMk/VPAk6EeDYVIeOGjN0CEy+Yv1ep0hoKGwcMPvqrbSFYoeO8xNcp5awmRuOo2h0l3nf9nmuNR8bxJHHNSGtgaV0SiSPms6dmoOeB/VqpcLYIxid9X6MRzAg4xiBpC/wRsAuC/DasORqFeIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736859639; c=relaxed/simple;
	bh=HdA5Zr88MdL5PWEGDuvmcpSo7c/Cek1s/vOQKnrI2YY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ng7wyB1fzx5zny/BIsj510bZqp044GUtYB8YPrWSCs8yJmaDuA3I0GcsdRDD9Bw5Lnvqvk0qnix27X6ZaHCdVs+88il8Hu7HphzMilQ5tPauHQD6S9NbJHdrIT+rzruRsD/R5780cu2pXcttht5IrMRyj4hzzXMbqYEePUH2PGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wi8ITHJc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wi8ITHJc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ECvaDA029334;
	Tue, 14 Jan 2025 13:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pHaapRq9KPEM5wkA9qBkuMyn
	p0US/1hBcSuicBhsMLQ=; b=Wi8ITHJctIruwohHYBU96OoT70AyObs97T8cNC41
	ZZjVK/5ihf19AGY94EBd8PoFpVa6qu0yGN7uCrNiS/L48UdGH8WF201evNadOlhW
	o0P0Tnr4/yaqxNsFrPvXOR5dS9X/o66D2BGhrH4sIleeIxuAI2fgb0uw5o4fPLx7
	euV40s0h1RmHBd0IWVRqCGTre6K7HmdX4Qgmk+YJto0u+vpLVTGYv4yJL//KJMFe
	zp0+4KEgI2MKM8bNVeitNMB6P+vkLNyIo/8uvokLZ4DM8rasFRQJMvLGO7OGuFRp
	3Yo9qHkQLXysKycjfv5BdHD5W5TrUlJBrZTosqC2kLKYPw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445rcy0046-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 13:00:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50ED08Nx031490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 13:00:08 GMT
Received: from hu-jiangenj-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 Jan 2025 05:00:02 -0800
Date: Tue, 14 Jan 2025 18:29:58 +0530
From: Joey Jiao <quic_jiangenj@quicinc.com>
To: Marco Elver <elver@google.com>
CC: Dmitry Vyukov <dvyukov@google.com>,
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
        Will Deacon <will@kernel.org>, <kasan-dev@googlegroups.com>,
        <linux-kernel@vger.kernel.org>, <workflows@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@quicinc.com>
Subject: Re: [PATCH 0/7] kcov: Introduce New Unique PC|EDGE|CMP Modes
Message-ID: <Z4ZfzoqhrJA0jeQI@hu-jiangenj-sha.qualcomm.com>
References: <20250114-kcov-v1-0-004294b931a2@quicinc.com>
 <CANpmjNPUFnxvY-dnEAv09-qB5d0LY_vmyxhb3ZPJV-T9V9Q6fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CANpmjNPUFnxvY-dnEAv09-qB5d0LY_vmyxhb3ZPJV-T9V9Q6fg@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9bWMrs7yTO1d9x5OkhyqPh_zpoALy6eE
X-Proofpoint-ORIG-GUID: 9bWMrs7yTO1d9x5OkhyqPh_zpoALy6eE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140108

On Tue, Jan 14, 2025 at 11:43:08AM +0100, Marco Elver wrote:
> On Tue, 14 Jan 2025 at 06:35, Jiao, Joey <quic_jiangenj@quicinc.com> wrote:
> >
> > Hi,
> >
> > This patch series introduces new kcov unique modes:
> > `KCOV_TRACE_UNIQ_[PC|EDGE|CMP]`, which are used to collect unique PC, EDGE,
> > CMP information.
> >
> > Background
> > ----------
> >
> > In the current kcov implementation, when `__sanitizer_cov_trace_pc` is hit,
> > the instruction pointer (IP) is stored sequentially in an area. Userspace
> > programs then read this area to record covered PCs and calculate covered
> > edges.  However, recent syzkaller runs show that many syscalls likely have
> > `pos > t->kcov_size`, leading to kcov overflow. To address this issue, we
> > introduce new kcov unique modes.
> 
> Overflow by how much? How much space is missing?
Ideally we should get the pos, but the test in syzkaller only counts how many 
times the overflow occurs. Actually I guess the pos is much bigger than cover 
size because originally we have 64KB cover size, the overflow happens; then now 
syzkaller set it to 1MB, but still 3535 times overflow for 
`ioctl$DMA_HEAP_IOCTL_ALLOC` syscall which has only 19 inputs. mmap syscall is 
also likely to overflow for 10873 times with 181 inputs in my case. Internally, 
I tried also 64MB cover size, but I still see the overflow case. Using 
syz-execprog together with -cover options shows many pcs are hit frequently, 
but disabling instrumentation for each these PC is less efficient and sometimes 
no lucky to fix the overflow problem.
I think the overflow happens more frequent on arm64 device as I found functions 
in header files hit frequently.
And I'm not able to access syzbot backend syz-manager data, perhaps qemu x86_64 
setup has more info.
> 
> > Solution Overview
> > -----------------
> >
> > 1. [P 1] Introduce `KCOV_TRACE_UNIQ_PC` Mode:
> >    - Export `KCOV_TRACE_UNIQ_PC` to userspace.
> >    - Add `kcov_map` struct to manage memory during the KCOV lifecycle.
> >      - `kcov_entry` struct as a hashtable entry containing unique PCs.
> >      - Use hashtable buckets to link `kcov_entry`.
> >      - Preallocate memory using genpool during KCOV initialization.
> >      - Move `area` inside `kcov_map` for easier management.
> >    - Use `jhash` for hash key calculation to support `KCOV_TRACE_UNIQ_CMP`
> >      mode.
> >
> > 2. [P 2-3] Introduce `KCOV_TRACE_UNIQ_EDGE` Mode:
> >    - Save `prev_pc` to calculate edges with the current IP.
> >    - Add unique edges to the hashmap.
> >    - Use a lower 12-bit mask to make hash independent of module offsets.
> >    - Distinguish areas for `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
> >      modes using `offset` during mmap.
> >    - Support enabling `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
> >      together.
> >
> > 3. [P 4] Introduce `KCOV_TRACE_UNIQ_CMP` Mode:
> >    - Shares the area with `KCOV_TRACE_UNIQ_PC`, making these modes
> >      exclusive.
> >
> > 4. [P 5] Add Example Code Documentation:
> >    - Provide examples for testing different modes:
> >      - `KCOV_TRACE_PC`: `./kcov` or `./kcov 0`
> >      - `KCOV_TRACE_CMP`: `./kcov 1`
> >      - `KCOV_TRACE_UNIQ_PC`: `./kcov 2`
> >      - `KCOV_TRACE_UNIQ_EDGE`: `./kcov 4`
> >      - `KCOV_TRACE_UNIQ_PC|KCOV_TRACE_UNIQ_EDGE`: `./kcov 6`
> >      - `KCOV_TRACE_UNIQ_CMP`: `./kcov 8`
> >
> > 5. [P 6-7] Disable KCOV Instrumentation:
> >    - Disable instrumentation like genpool to prevent recursive calls.
> >
> > Caveats
> > -------
> >
> > The userspace program has been tested on Qemu x86_64 and two real Android
> > phones with different ARM64 chips. More syzkaller-compatible tests have
> > been conducted. However, due to limited knowledge of other platforms,
> > assistance from those with access to other systems is needed.
> >
> > Results and Analysis
> > --------------------
> >
> > 1. KMEMLEAK Test on Qemu x86_64:
> >    - No memory leaks found during the `kcov` program run.
> >
> > 2. KCSAN Test on Qemu x86_64:
> >    - No KCSAN issues found during the `kcov` program run.
> >
> > 3. Existing Syzkaller on Qemu x86_64 and Real ARM64 Device:
> >    - Syzkaller can fuzz, show coverage, and find bugs. Adjusting `procs`
> >      and `vm mem` settings can avoid OOM issues caused by genpool in the
> >      patches, so `procs:4 + vm:2GB` or `procs:4 + vm:2GB` are used for
> >      Qemu x86_64.
> >    - `procs:8` is kept on Real ARM64 Device with 12GB/16GB mem.
> >
> > 4. Modified Syzkaller to Support New KCOV Unique Modes:
> >    - Syzkaller runs fine on both Qemu x86_64 and ARM64 real devices.
> >      Limited `Cover overflows` and `Comps overflows` observed.
> >
> > 5. Modified Syzkaller + Upstream Kernel Without Patch Series:
> >    - Not tested. The modified syzkaller will fall back to `KCOV_TRACE_PC`
> >      or `KCOV_TRACE_CMP` if `ioctl` fails for Unique mode.
> >
> > Possible Further Enhancements
> > -----------------------------
> >
> > 1. Test more cases and setups, including those in syzbot.
> > 2. Ensure `hash_for_each_possible_rcu` is protected for reentrance
> >    and atomicity.
> > 3. Find a simpler and more efficient way to store unique coverage.
> >
> > Conclusion
> > ----------
> >
> > These patches add new kcov unique modes to mitigate the kcov overflow
> > issue, compatible with both existing and new syzkaller versions.
> 
> Thanks for the analysis, it's clearer now.
> 
> However, the new design you introduce here adds lots of complexity.
> Answering the question of how much overflow is happening, might give
> better clues if this is the best design or not. Because if the
> overflow amount is relatively small, a better design (IMHO) might be
> simply implementing a compression scheme, e.g. a simple delta
> encoding.
I tried many ways to store the uniq info, like bitmap, segment bitmap, 
customized allocator + allocation index, also considering rhashmap, but perhaps 
hashmap (maybe rhashmap) is better.
I also tried a full bitmap to record all PCs from all threads which shows that
syzkaller can't find the new coverage while the full bitmap recorded it. If I 
replay the syzkaller log (or prog), kernel GCOV can also show these 
functions/lines are hit (not because flaky or interrupt) but syzkaller coverage 
doesn't have that data, which can be another proof of the kcov overflow.
> 
> Thanks,
> -- Marco

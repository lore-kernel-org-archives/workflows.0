Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6327F236A78;
	Tue, 14 Jan 2025 12:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736858394; cv=none; b=pSTwXDc4YCe+J1MrmAkpYs1nG9UZCnkkWNyKdZC4pjMA00w21pDVq52nbqGdIYdVLpNAbs/dYQtgvaarPSq2RShRrYTxVGJQ61t5ohl6w3T2ZZp8VOtmKV6RM6vd0TO80Nn13i0lT3wum6J6Nzj93PIaIxfCMJddj3nd3W6x16w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736858394; c=relaxed/simple;
	bh=kMpoK6d5fKzcrthLnTW7PEJqlmXron/SJJyOeh90a8Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPEM3NyO9ZqQ8Ny/917e+pDPt9P18ufHgM2JHuCB44mPMt8xjq6fo+TJagnVcw2yWlQPA12aqxvX/bOC4rzEgpLcTM4EqiZ6HjvzX8146Q6xX17+yu4Hg99ZbnaPzWMK+KNSFHkdYCpfCpZe28nNqDMqpOd2J/R0zW9Rr2y5Wqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cpwb9zYI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cpwb9zYI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E7Sbug024112;
	Tue, 14 Jan 2025 12:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mLKLiLaeqNSpkNvN0pu0c0rj
	tZRgVlaoo0nPXj6GPfg=; b=Cpwb9zYI/NpofelQGF5lwf+J42qpVAuO8DtrfPpV
	qRwAwWsTgbA95SVtBuuk9mcwQEZNykQPoK58/en0Tf1sdTEeGusgRV/V/MidkjDe
	uWpB+jjlSat9afECCjhoBJlTwyTUna1kZTBICWszECfSy75PzpAYJvp9dOse6V7b
	S+RQ7yLfkZy+QE0VUC9oMMBWKuYpGgqty8GJtyX8ebVIXwGH8rxRb2iYqdxzzDdw
	xm9CVIOcEvxrjd366Fs/qbhGP1EkJYAAjs9SDwP3MVlgk+jCrfkULynJ7BuIqNTb
	E40keL2leoADdDXIJqm+aS8YmePd88aA7PrKkYP5vuXuCQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445kjq0n27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 12:39:37 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50ECdbwG001123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 12:39:37 GMT
Received: from hu-jiangenj-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 Jan 2025 04:39:31 -0800
Date: Tue, 14 Jan 2025 18:09:27 +0530
From: Joey Jiao <quic_jiangenj@quicinc.com>
To: Dmitry Vyukov <dvyukov@google.com>
CC: Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter
	<cl@linux.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, <kasan-dev@googlegroups.com>,
        <linux-kernel@vger.kernel.org>, <workflows@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@quicinc.com>
Subject: Re: [PATCH 0/7] kcov: Introduce New Unique PC|EDGE|CMP Modes
Message-ID: <Z4Za/3Vz7t5NSbE6@hu-jiangenj-sha.qualcomm.com>
References: <20250114-kcov-v1-0-004294b931a2@quicinc.com>
 <CANpmjNPUFnxvY-dnEAv09-qB5d0LY_vmyxhb3ZPJV-T9V9Q6fg@mail.gmail.com>
 <CACT4Y+badwgw=ku--uJRWA94SA6bGXdtT+J9eO_VQxqWDxGheg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACT4Y+badwgw=ku--uJRWA94SA6bGXdtT+J9eO_VQxqWDxGheg@mail.gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7224EfXEZdMQZV_igTObt1jrINb3Kk-J
X-Proofpoint-ORIG-GUID: 7224EfXEZdMQZV_igTObt1jrINb3Kk-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140105

On Tue, Jan 14, 2025 at 12:02:31PM +0100, Dmitry Vyukov wrote:
> On Tue, 14 Jan 2025 at 11:43, Marco Elver <elver@google.com> wrote:
> > On Tue, 14 Jan 2025 at 06:35, Jiao, Joey <quic_jiangenj@quicinc.com> wrote:
> > >
> > > Hi,
> > >
> > > This patch series introduces new kcov unique modes:
> > > `KCOV_TRACE_UNIQ_[PC|EDGE|CMP]`, which are used to collect unique PC, EDGE,
> > > CMP information.
> > >
> > > Background
> > > ----------
> > >
> > > In the current kcov implementation, when `__sanitizer_cov_trace_pc` is hit,
> > > the instruction pointer (IP) is stored sequentially in an area. Userspace
> > > programs then read this area to record covered PCs and calculate covered
> > > edges.  However, recent syzkaller runs show that many syscalls likely have
> > > `pos > t->kcov_size`, leading to kcov overflow. To address this issue, we
> > > introduce new kcov unique modes.
> >
> > Overflow by how much? How much space is missing?
> >
> > > Solution Overview
> > > -----------------
> > >
> > > 1. [P 1] Introduce `KCOV_TRACE_UNIQ_PC` Mode:
> > >    - Export `KCOV_TRACE_UNIQ_PC` to userspace.
> > >    - Add `kcov_map` struct to manage memory during the KCOV lifecycle.
> > >      - `kcov_entry` struct as a hashtable entry containing unique PCs.
> > >      - Use hashtable buckets to link `kcov_entry`.
> > >      - Preallocate memory using genpool during KCOV initialization.
> > >      - Move `area` inside `kcov_map` for easier management.
> > >    - Use `jhash` for hash key calculation to support `KCOV_TRACE_UNIQ_CMP`
> > >      mode.
> > >
> > > 2. [P 2-3] Introduce `KCOV_TRACE_UNIQ_EDGE` Mode:
> > >    - Save `prev_pc` to calculate edges with the current IP.
> > >    - Add unique edges to the hashmap.
> > >    - Use a lower 12-bit mask to make hash independent of module offsets.
> > >    - Distinguish areas for `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
> > >      modes using `offset` during mmap.
> > >    - Support enabling `KCOV_TRACE_UNIQ_PC` and `KCOV_TRACE_UNIQ_EDGE`
> > >      together.
> > >
> > > 3. [P 4] Introduce `KCOV_TRACE_UNIQ_CMP` Mode:
> > >    - Shares the area with `KCOV_TRACE_UNIQ_PC`, making these modes
> > >      exclusive.
> > >
> > > 4. [P 5] Add Example Code Documentation:
> > >    - Provide examples for testing different modes:
> > >      - `KCOV_TRACE_PC`: `./kcov` or `./kcov 0`
> > >      - `KCOV_TRACE_CMP`: `./kcov 1`
> > >      - `KCOV_TRACE_UNIQ_PC`: `./kcov 2`
> > >      - `KCOV_TRACE_UNIQ_EDGE`: `./kcov 4`
> > >      - `KCOV_TRACE_UNIQ_PC|KCOV_TRACE_UNIQ_EDGE`: `./kcov 6`
> > >      - `KCOV_TRACE_UNIQ_CMP`: `./kcov 8`
> > >
> > > 5. [P 6-7] Disable KCOV Instrumentation:
> > >    - Disable instrumentation like genpool to prevent recursive calls.
> > >
> > > Caveats
> > > -------
> > >
> > > The userspace program has been tested on Qemu x86_64 and two real Android
> > > phones with different ARM64 chips. More syzkaller-compatible tests have
> > > been conducted. However, due to limited knowledge of other platforms,
> > > assistance from those with access to other systems is needed.
> > >
> > > Results and Analysis
> > > --------------------
> > >
> > > 1. KMEMLEAK Test on Qemu x86_64:
> > >    - No memory leaks found during the `kcov` program run.
> > >
> > > 2. KCSAN Test on Qemu x86_64:
> > >    - No KCSAN issues found during the `kcov` program run.
> > >
> > > 3. Existing Syzkaller on Qemu x86_64 and Real ARM64 Device:
> > >    - Syzkaller can fuzz, show coverage, and find bugs. Adjusting `procs`
> > >      and `vm mem` settings can avoid OOM issues caused by genpool in the
> > >      patches, so `procs:4 + vm:2GB` or `procs:4 + vm:2GB` are used for
> > >      Qemu x86_64.
> > >    - `procs:8` is kept on Real ARM64 Device with 12GB/16GB mem.
> > >
> > > 4. Modified Syzkaller to Support New KCOV Unique Modes:
> > >    - Syzkaller runs fine on both Qemu x86_64 and ARM64 real devices.
> > >      Limited `Cover overflows` and `Comps overflows` observed.
> > >
> > > 5. Modified Syzkaller + Upstream Kernel Without Patch Series:
> > >    - Not tested. The modified syzkaller will fall back to `KCOV_TRACE_PC`
> > >      or `KCOV_TRACE_CMP` if `ioctl` fails for Unique mode.
> > >
> > > Possible Further Enhancements
> > > -----------------------------
> > >
> > > 1. Test more cases and setups, including those in syzbot.
> > > 2. Ensure `hash_for_each_possible_rcu` is protected for reentrance
> > >    and atomicity.
> > > 3. Find a simpler and more efficient way to store unique coverage.
> > >
> > > Conclusion
> > > ----------
> > >
> > > These patches add new kcov unique modes to mitigate the kcov overflow
> > > issue, compatible with both existing and new syzkaller versions.
> >
> > Thanks for the analysis, it's clearer now.
> >
> > However, the new design you introduce here adds lots of complexity.
> > Answering the question of how much overflow is happening, might give
> > better clues if this is the best design or not. Because if the
> > overflow amount is relatively small, a better design (IMHO) might be
> > simply implementing a compression scheme, e.g. a simple delta
> > encoding.
> 
> Joey, do you have corresponding patches for syzkaller? I wonder how
> the integration looks like, in particular when/how these maps are
> cleared.
Uploaded in https://github.com/google/syzkaller/pull/5673

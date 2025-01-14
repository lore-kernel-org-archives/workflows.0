Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802C6B673;
	Tue, 14 Jan 2025 05:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736833502; cv=none; b=U+cKCj3448+R6YRS+vHBWC5+TpUP6Kc5HQytNl7oW1LGL3aPUwbD3nmlt6sYAYgsWX//g+a081QDs+XO61Aa/I86QWhpcN46ICi3hpB0y+6yKL/ptQPkKbieweL60jgiHgC/8TYF/OTpWPfsoKP1KGW5KhhvAPKtd/6xzTjHr5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736833502; c=relaxed/simple;
	bh=Cvo2a+tdnuszTQD97sZEGFZ1Cs9rwqjGP2ZYcBe2VLU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijyBRSfTbR7Qy4rNi8UYTL3IazqdhEwiNrE9Re6M76qU5+ByUMzqLyvsQxk0lykkALqluAasftIf1oEb40D4ThHJnXiEPPhtJaeiNNk9rIE7axAdNNHW3viYrfvZv9QyZMJcc+Bsmy/TTcPyzXsLQR66JojxrLJ0Z0TR27hkqo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DL0uxWQR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DL0uxWQR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E2h0wH003293;
	Tue, 14 Jan 2025 05:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Ho/hzWqKaR7WmES103bnR+a
	CJ3CIJMTmRLpOr/yJsM=; b=DL0uxWQROXVP4FXGglVBielJfhdi78bFuHjfUfDr
	PU3RBaCvt1S5MJlWuRAJw6NeT88q1PvxF4OOWlSrUfytwhLlagTUY5/tOuKYeSVO
	ALBrQjc1I5K9eim2DziUQeZNgzjmmcspXTyiQ2C1Gd294dFVKRA0WSzWMaKKbIu5
	s6fs2alPCgV/IOzkNC9DDi0TBaTHAoInWUzImd6HPss+gfFnqhoByWY+pXSC9Zq2
	L77IYRiKb0ncm0qhIMMZjVA4nz1aJT23htAIJD9W9LS2XXEqLLJV0299cS3mfV0i
	0lJwCwMKy3fKrmACh5HTciFWAcz8NPjz2b3nihUfZmzpXQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445fcr8aka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:44:24 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5iNHN001341
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:44:23 GMT
Received: from hu-jiangenj-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 21:44:14 -0800
Date: Tue, 14 Jan 2025 11:14:11 +0530
From: Joey Jiao <quic_jiangenj@quicinc.com>
To: Marco Elver <elver@google.com>
CC: <dvyukov@google.com>, <andreyknvl@gmail.com>, <corbet@lwn.net>,
        <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
        <nogikh@google.com>, <pierre.gondois@arm.com>, <cmllamas@google.com>,
        <quic_zijuhu@quicinc.com>, <richard.weiyang@gmail.com>,
        <tglx@linutronix.de>, <arnd@arndb.de>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <dennis@kernel.org>, <tj@kernel.org>,
        <cl@linux.com>, <ruanjinjie@huawei.com>, <colyli@suse.de>,
        <andriy.shevchenko@linux.intel.com>, <kernel@quicinc.com>,
        <quic_likaid@quicinc.com>, <kasan-dev@googlegroups.com>,
        <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mm@kvack.org>
Subject: Re: [PATCH] kcov: add unique cover, edge, and cmp modes
Message-ID: <Z4X5qyKmw03u91fx@hu-jiangenj-sha.qualcomm.com>
References: <20250110073056.2594638-1-quic_jiangenj@quicinc.com>
 <CANpmjNOg9=WbFpJQFQBOo1z_KuV7DKQTZB7=GfiYyvoam5Dm=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CANpmjNOg9=WbFpJQFQBOo1z_KuV7DKQTZB7=GfiYyvoam5Dm=w@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1ocO8HRdM0OP4OGLu_yO60qlBwPczBE-
X-Proofpoint-GUID: 1ocO8HRdM0OP4OGLu_yO60qlBwPczBE-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140045

On Fri, Jan 10, 2025 at 10:22:44AM +0100, Marco Elver wrote:
> On Fri, 10 Jan 2025 at 08:33, Joey Jiao <quic_jiangenj@quicinc.com> wrote:
> >
> > From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
> >
> > The current design of KCOV risks frequent buffer overflows. To mitigate
> > this, new modes are introduced: KCOV_TRACE_UNIQ_PC, KCOV_TRACE_UNIQ_EDGE,
> > and KCOV_TRACE_UNIQ_CMP. These modes allow for the recording of unique
> > PCs, edges, and comparison operands (CMP).
> 
> There ought to be a cover letter explaining the motivation for this,
> and explaining why the new modes would help. Ultimately, what are you
> using KCOV for where you encountered this problem?
> 
> > Key changes include:
> > - KCOV_TRACE_UNIQ_[PC|EDGE] can be used together to replace KCOV_TRACE_PC.
> > - KCOV_TRACE_UNIQ_CMP can be used to replace KCOV_TRACE_CMP mode.
> > - Introduction of hashmaps to store unique coverage data.
> > - Pre-allocated entries in kcov_map_init during KCOV_INIT_TRACE to avoid
> >   performance issues with kmalloc.
> > - New structs and functions for managing memory and unique coverage data.
> > - Example program demonstrating the usage of the new modes.
> 
> This should be a patch series, carefully splitting each change into a
> separate patch.
> https://docs.kernel.org/process/submitting-patches.html#split-changes
Done in `20250114-kcov-v1-0-004294b931a2@quicinc.com`
> 
> > With the new hashmap and pre-alloced memory pool added, cover size can't
> > be set to higher value like 1MB in KCOV_TRACE_PC or KCOV_TRACE_CMP modes
> > in 2GB device with 8 procs, otherwise it causes frequent oom.
> >
> > For KCOV_TRACE_UNIQ_[PC|EDGE|CMP] modes, smaller cover size like 8KB can
> > be used.
> >
> > Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
> 
> As-is it's hard to review, and the motivation is unclear. A lot of
> code was moved and changed, and reviewers need to understand why that
> was done besides your brief explanation above.
> 
> Generally, KCOV has very tricky constraints, due to being callable
> from any context, including NMI. This means adding new dependencies
> need to be carefully reviewed. For one, we can see this in genalloc's
> header:
> 
> > * The lockless operation only works if there is enough memory
> > * available.  If new memory is added to the pool a lock has to be
> > * still taken.  So any user relying on locklessness has to ensure
> > * that sufficient memory is preallocated.
> > *
> > * The basic atomic operation of this allocator is cmpxchg on long.
> > * On architectures that don't have NMI-safe cmpxchg implementation,
> > * the allocator can NOT be used in NMI handler.  So code uses the
> > * allocator in NMI handler should depend on
> > * CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG.
> 
> And you are calling gen_pool_alloc() from __sanitizer_cov_trace_pc.
> Which means this implementation is likely broken on
> !CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG architectures (do we have
> architectures like that, that support KCOV?).
> 
> There are probably other sharp corners due to the contexts KCOV can
> run in, but would simply ask you to carefully reason about why each
> new dependency is safe.
Need to investigate more on CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG.

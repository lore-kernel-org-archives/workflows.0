Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC6E235BF7;
	Tue, 14 Jan 2025 05:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736834264; cv=none; b=lnQAHxr8NM900lZk6Tl1qrsBZkJx/kHazai7X+EmYw0VZrEA2f+NQi976bWbSBU8z4H561cTFKU4gG6lR3El5oe8Bhv9QEZPfhVkrwJ7sdBcLo8PqHM5sgRhuuonInewctB26RkD00Qn8VkbqPHe7BG5ySaWR3JOL60nlH+mPfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736834264; c=relaxed/simple;
	bh=/6Dh2ii9U43eIEV0efWLGxLma/92LONaMOA6LK+iB7A=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghK8YENrpxdgWocYNWOE5Rad5qGNLuiPz9Oy44K53mcPrDpEAHpiUEUnz064ybfd7OWn7XOuZISMBrLKb6qL4xWglb6mdJ6uoxcE7MahcgsGpNEUZMEoxxKQDLLeZiP7mqumMLu1jFjdWUiEu0pTfXatRYMTGK1WfKqoXb+TQwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dPWtt7oR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dPWtt7oR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E2hC4h003789;
	Tue, 14 Jan 2025 05:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wflJvgOfYDiozwhOrxz/xwhE
	oy/saP7Rhgjz/nRTzpI=; b=dPWtt7oR0YCMPyYflXbtehLmb9zVjiS1bKk5Dlsl
	2/FPWyy8euZ1ar7TIMhXcZ17hCtARPkrGfuMYBr8ozCSVYFQ9t/PL3njzXyVnKKP
	rS2TXtMsmYJcwMD4BBV9HJ/ee44++B8Zm/FwaxV5JEKmFe/bogotfghDWwEoAh1e
	aS2Ujkz7vTtYZPTJ7PNFhIKoEb9Kuvwhv6TvjD0FVO/5AxC44AQ5iGqH21ATKI21
	dC5tDpIm4KROGfufD8SYu6K4g/GB93oPXGmBK9EwUGJCE6sHgbdU9m6gxFm6R61R
	wwTW1wtI4iKokDFF/ofJaLWD/9sb2vmNvUI3Av7NgVXlzg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445fcr8b7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:57:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E5vEe6018616
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 05:57:14 GMT
Received: from hu-jiangenj-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 21:57:05 -0800
Date: Tue, 14 Jan 2025 11:27:02 +0530
From: Joey Jiao <quic_jiangenj@quicinc.com>
To: Dmitry Vyukov <dvyukov@google.com>
CC: Marco Elver <elver@google.com>, <andreyknvl@gmail.com>, <corbet@lwn.net>,
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
Message-ID: <Z4X8riQq8NJ1nLLW@hu-jiangenj-sha.qualcomm.com>
References: <20250110073056.2594638-1-quic_jiangenj@quicinc.com>
 <CANpmjNOg9=WbFpJQFQBOo1z_KuV7DKQTZB7=GfiYyvoam5Dm=w@mail.gmail.com>
 <CACT4Y+Zm5Vz1LL7m_BubwV=bMPgVjOVNpp12nDZRi5oesH47WA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACT4Y+Zm5Vz1LL7m_BubwV=bMPgVjOVNpp12nDZRi5oesH47WA@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0rhj6FadLSEWHnh83gbXJHKqA-09fD2G
X-Proofpoint-GUID: 0rhj6FadLSEWHnh83gbXJHKqA-09fD2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140047

On Fri, Jan 10, 2025 at 01:16:27PM +0100, Dmitry Vyukov wrote:
> On Fri, 10 Jan 2025 at 10:23, Marco Elver <elver@google.com> wrote:
> > > From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
> > >
> > > The current design of KCOV risks frequent buffer overflows. To mitigate
> > > this, new modes are introduced: KCOV_TRACE_UNIQ_PC, KCOV_TRACE_UNIQ_EDGE,
> > > and KCOV_TRACE_UNIQ_CMP. These modes allow for the recording of unique
> > > PCs, edges, and comparison operands (CMP).
> >
> > There ought to be a cover letter explaining the motivation for this,
> > and explaining why the new modes would help. Ultimately, what are you
> > using KCOV for where you encountered this problem?
> >
> > > Key changes include:
> > > - KCOV_TRACE_UNIQ_[PC|EDGE] can be used together to replace KCOV_TRACE_PC.
> > > - KCOV_TRACE_UNIQ_CMP can be used to replace KCOV_TRACE_CMP mode.
> > > - Introduction of hashmaps to store unique coverage data.
> > > - Pre-allocated entries in kcov_map_init during KCOV_INIT_TRACE to avoid
> > >   performance issues with kmalloc.
> > > - New structs and functions for managing memory and unique coverage data.
> > > - Example program demonstrating the usage of the new modes.
> >
> > This should be a patch series, carefully splitting each change into a
> > separate patch.
> > https://docs.kernel.org/process/submitting-patches.html#split-changes
> >
> > > With the new hashmap and pre-alloced memory pool added, cover size can't
> > > be set to higher value like 1MB in KCOV_TRACE_PC or KCOV_TRACE_CMP modes
> > > in 2GB device with 8 procs, otherwise it causes frequent oom.
> > >
> > > For KCOV_TRACE_UNIQ_[PC|EDGE|CMP] modes, smaller cover size like 8KB can
> > > be used.
> > >
> > > Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
> >
> > As-is it's hard to review, and the motivation is unclear. A lot of
> > code was moved and changed, and reviewers need to understand why that
> > was done besides your brief explanation above.
> >
> > Generally, KCOV has very tricky constraints, due to being callable
> > from any context, including NMI. This means adding new dependencies
> > need to be carefully reviewed. For one, we can see this in genalloc's
> > header:
> >
> > > * The lockless operation only works if there is enough memory
> > > * available.  If new memory is added to the pool a lock has to be
> > > * still taken.  So any user relying on locklessness has to ensure
> > > * that sufficient memory is preallocated.
> > > *
> > > * The basic atomic operation of this allocator is cmpxchg on long.
> > > * On architectures that don't have NMI-safe cmpxchg implementation,
> > > * the allocator can NOT be used in NMI handler.  So code uses the
> > > * allocator in NMI handler should depend on
> > > * CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG.
> >
> > And you are calling gen_pool_alloc() from __sanitizer_cov_trace_pc.
> > Which means this implementation is likely broken on
> > !CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG architectures (do we have
> > architectures like that, that support KCOV?).
> >
> > There are probably other sharp corners due to the contexts KCOV can
> > run in, but would simply ask you to carefully reason about why each
> > new dependency is safe.
> 
> I am also concerned about the performance effect. Does it add a stack
> frame to __sanitizer_cov_trace_pc()? Please show disassm of the
> function before/after.
# Before the patch
ffffffff8195df30 __sanitizer_cov_trace_pc:
ffffffff8195df30: f3 0f 1e fa          	endbr64
ffffffff8195df34: 48 8b 04 24          	movq	(%rsp), %rax
ffffffff8195df38: 65 48 8b 0c 25 00 d6 03 00   	movq	%gs:251392, %rcx
ffffffff8195df41: 65 8b 15 c0 f6 6d 7e 	movl	%gs:2121135808(%rip), %edx
ffffffff8195df48: 81 e2 00 01 ff 00    	andl	$16711936, %edx
ffffffff8195df4e: 74 11                	je	17 
<__sanitizer_cov_trace_pc+0x31>
ffffffff8195df50: 81 fa 00 01 00 00    	cmpl	$256, %edx
ffffffff8195df56: 75 35                	jne	53 
<__sanitizer_cov_trace_pc+0x5d>
ffffffff8195df58: 83 b9 1c 16 00 00 00 	cmpl	$0, 5660(%rcx)
ffffffff8195df5f: 74 2c                	je	44 
<__sanitizer_cov_trace_pc+0x5d>
ffffffff8195df61: 8b 91 f8 15 00 00    	movl	5624(%rcx), %edx
ffffffff8195df67: 83 fa 02             	cmpl	$2, %edx
ffffffff8195df6a: 75 21                	jne	33 
<__sanitizer_cov_trace_pc+0x5d>
ffffffff8195df6c: 48 8b 91 00 16 00 00 	movq	5632(%rcx), %rdx
ffffffff8195df73: 48 8b 32             	movq	(%rdx), %rsi
ffffffff8195df76: 48 8d 7e 01          	leaq	1(%rsi), %rdi
ffffffff8195df7a: 8b 89 fc 15 00 00    	movl	5628(%rcx), %ecx
ffffffff8195df80: 48 39 cf             	cmpq	%rcx, %rdi
ffffffff8195df83: 73 08                	jae	8 
<__sanitizer_cov_trace_pc+0x5d>
ffffffff8195df85: 48 89 3a             	movq	%rdi, (%rdx)
ffffffff8195df88: 48 89 44 f2 08       	movq	%rax, 8(%rdx,%rsi,8)
ffffffff8195df8d: 2e e9 cd 3d 8b 09    	jmp	160120269 <__x86_return_thunk>
ffffffff8195df93: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffffffff8195df9d: 0f 1f 00             	nopl	(%rax)

# After the patch

vmlinux:	file format ELF64-x86-64


Disassembly of section .text:

ffffffff8195df30 __sanitizer_cov_trace_pc:
ffffffff8195df30: f3 0f 1e fa          	endbr64
ffffffff8195df34: 41 57                	pushq	%r15
ffffffff8195df36: 41 56                	pushq	%r14
ffffffff8195df38: 41 54                	pushq	%r12
ffffffff8195df3a: 53                   	pushq	%rbx
ffffffff8195df3b: 48 8b 5c 24 20       	movq	32(%rsp), %rbx
ffffffff8195df40: 65 4c 8b 34 25 00 d6 03 00   	movq	%gs:251392, %r14
ffffffff8195df49: 65 8b 05 b8 f6 6d 7e 	movl	%gs:2121135800(%rip), %eax
ffffffff8195df50: 25 00 01 ff 00       	andl	$16711936, %eax
ffffffff8195df55: 74 19                	je	25 
<__sanitizer_cov_trace_pc+0x40>
ffffffff8195df57: 3d 00 01 00 00       	cmpl	$256, %eax
ffffffff8195df5c: 0f 85 54 01 00 00    	jne	340 
<__sanitizer_cov_trace_pc+0x186>
ffffffff8195df62: 41 83 be 1c 16 00 00 00      	cmpl	$0, 5660(%r14)
ffffffff8195df6a: 0f 84 46 01 00 00    	je	326 
<__sanitizer_cov_trace_pc+0x186>
ffffffff8195df70: 41 8b 86 f8 15 00 00 	movl	5624(%r14), %eax
ffffffff8195df77: a9 12 00 00 00       	testl	$18, %eax
ffffffff8195df7c: 0f 84 34 01 00 00    	je	308 
<__sanitizer_cov_trace_pc+0x186>
ffffffff8195df82: 41 83 be f8 15 00 00 02      	cmpl	$2, 5624(%r14)
ffffffff8195df8a: 75 25                	jne	37 
<__sanitizer_cov_trace_pc+0x81>
ffffffff8195df8c: 49 8b 86 00 16 00 00 	movq	5632(%r14), %rax
ffffffff8195df93: 48 8b 08             	movq	(%rax), %rcx
ffffffff8195df96: 48 ff c1             	incq	%rcx
ffffffff8195df99: 41 8b 96 fc 15 00 00 	movl	5628(%r14), %edx
ffffffff8195dfa0: 48 39 d1             	cmpq	%rdx, %rcx
ffffffff8195dfa3: 0f 83 0d 01 00 00    	jae	269 
<__sanitizer_cov_trace_pc+0x186>
ffffffff8195dfa9: 48 89 08             	movq	%rcx, (%rax)
ffffffff8195dfac: e9 fe 00 00 00       	jmp	254 
<__sanitizer_cov_trace_pc+0x17f>
ffffffff8195dfb1: 48 89 d8             	movq	%rbx, %rax
ffffffff8195dfb4: 48 c1 e8 20          	shrq	$32, %rax
ffffffff8195dfb8: 49 8b 8e 08 16 00 00 	movq	5640(%r14), %rcx
ffffffff8195dfbf: 4c 8b 79 58          	movq	88(%rcx), %r15
ffffffff8195dfc3: 05 f7 be ad de       	addl	$3735928567, %eax
ffffffff8195dfc8: 8d 93 f7 be ad de    	leal	-559038729(%rbx), %edx
ffffffff8195dfce: 89 c1                	movl	%eax, %ecx
ffffffff8195dfd0: 81 f1 f7 be ad de    	xorl	$3735928567, %ecx
ffffffff8195dfd6: 89 c6                	movl	%eax, %esi
ffffffff8195dfd8: c1 c6 0e             	roll	$14, %esi
ffffffff8195dfdb: 29 f1                	subl	%esi, %ecx
ffffffff8195dfdd: 31 ca                	xorl	%ecx, %edx
ffffffff8195dfdf: 89 ce                	movl	%ecx, %esi
ffffffff8195dfe1: c1 c6 0b             	roll	$11, %esi
ffffffff8195dfe4: 29 f2                	subl	%esi, %edx
ffffffff8195dfe6: 31 d0                	xorl	%edx, %eax
ffffffff8195dfe8: 89 d6                	movl	%edx, %esi
ffffffff8195dfea: c1 c6 19             	roll	$25, %esi
ffffffff8195dfed: 29 f0                	subl	%esi, %eax
ffffffff8195dfef: 89 c6                	movl	%eax, %esi
ffffffff8195dff1: c1 c6 10             	roll	$16, %esi
ffffffff8195dff4: 31 c1                	xorl	%eax, %ecx
ffffffff8195dff6: 29 f1                	subl	%esi, %ecx
ffffffff8195dff8: 31 ca                	xorl	%ecx, %edx
ffffffff8195dffa: 89 ce                	movl	%ecx, %esi
ffffffff8195dffc: c1 c6 04             	roll	$4, %esi
ffffffff8195dfff: 29 f2                	subl	%esi, %edx
ffffffff8195e001: 31 d0                	xorl	%edx, %eax
ffffffff8195e003: c1 c2 0e             	roll	$14, %edx
ffffffff8195e006: 29 d0                	subl	%edx, %eax
ffffffff8195e008: 89 c2                	movl	%eax, %edx
ffffffff8195e00a: c1 c2 18             	roll	$24, %edx
ffffffff8195e00d: 31 c8                	xorl	%ecx, %eax
ffffffff8195e00f: 29 d0                	subl	%edx, %eax
ffffffff8195e011: 44 69 e0 47 86 c8 61 	imull	$1640531527, %eax, %r12d
ffffffff8195e018: 41 c1 ec 11          	shrl	$17, %r12d
ffffffff8195e01c: 4b 8b 04 e7          	movq	(%r15,%r12,8), %rax
ffffffff8195e020: 48 85 c0             	testq	%rax, %rax
ffffffff8195e023: 74 18                	je	24 
<__sanitizer_cov_trace_pc+0x10d>
ffffffff8195e025: 48 83 c0 f8          	addq	$-8, %rax
ffffffff8195e029: 74 12                	je	18 
<__sanitizer_cov_trace_pc+0x10d>
ffffffff8195e02b: 48 39 18             	cmpq	%rbx, (%rax)
ffffffff8195e02e: 0f 84 82 00 00 00    	je	130 
<__sanitizer_cov_trace_pc+0x186>
ffffffff8195e034: 48 8b 40 08          	movq	8(%rax), %rax
ffffffff8195e038: 48 85 c0             	testq	%rax, %rax
ffffffff8195e03b: 75 e8                	jne	-24 
<__sanitizer_cov_trace_pc+0xf5>
ffffffff8195e03d: 49 8b bf 00 00 04 00 	movq	262144(%r15), %rdi
ffffffff8195e044: 48 8b 57 58          	movq	88(%rdi), %rdx
ffffffff8195e048: 48 8b 4f 60          	movq	96(%rdi), %rcx
ffffffff8195e04c: be 20 00 00 00       	movl	$32, %esi
ffffffff8195e051: 45 31 c0             	xorl	%r8d, %r8d
ffffffff8195e054: e8 47 b4 f0 02       	callq	49329223 
<gen_pool_alloc_algo_owner>
ffffffff8195e059: 48 85 c0             	testq	%rax, %rax
ffffffff8195e05c: 74 58                	je	88 
<__sanitizer_cov_trace_pc+0x186>
ffffffff8195e05e: 4b 8d 14 e7          	leaq	(%r15,%r12,8), %rdx
ffffffff8195e062: 48 89 c6             	movq	%rax, %rsi
ffffffff8195e065: 48 89 18             	movq	%rbx, (%rax)
ffffffff8195e068: 48 83 c0 08          	addq	$8, %rax
ffffffff8195e06c: 48 c7 46 08 00 00 00 00      	movq	$0, 8(%rsi)
ffffffff8195e074: 48 c7 46 10 00 00 00 00      	movq	$0, 16(%rsi)
ffffffff8195e07c: 48 8b 0a             	movq	(%rdx), %rcx
ffffffff8195e07f: 48 89 4e 08          	movq	%rcx, 8(%rsi)
ffffffff8195e083: 48 89 56 10          	movq	%rdx, 16(%rsi)
ffffffff8195e087: 48 89 02             	movq	%rax, (%rdx)
ffffffff8195e08a: 48 85 c9             	testq	%rcx, %rcx
ffffffff8195e08d: 74 04                	je	4 
<__sanitizer_cov_trace_pc+0x163>
ffffffff8195e08f: 48 89 41 08          	movq	%rax, 8(%rcx)
ffffffff8195e093: 49 8b 86 00 16 00 00 	movq	5632(%r14), %rax
ffffffff8195e09a: 48 8b 08             	movq	(%rax), %rcx
ffffffff8195e09d: 48 ff c1             	incq	%rcx
ffffffff8195e0a0: 41 8b 96 fc 15 00 00 	movl	5628(%r14), %edx
ffffffff8195e0a7: 48 39 d1             	cmpq	%rdx, %rcx
ffffffff8195e0aa: 73 0a                	jae	10 
<__sanitizer_cov_trace_pc+0x186>
ffffffff8195e0ac: 48 89 08             	movq	%rcx, (%rax)
ffffffff8195e0af: 48 8d 04 c8          	leaq	(%rax,%rcx,8), %rax
ffffffff8195e0b3: 48 89 18             	movq	%rbx, (%rax)
ffffffff8195e0b6: 5b                   	popq	%rbx
ffffffff8195e0b7: 41 5c                	popq	%r12
ffffffff8195e0b9: 41 5e                	popq	%r14
ffffffff8195e0bb: 41 5f                	popq	%r15
ffffffff8195e0bd: 2e e9 9d 3c 8b 09    	jmp	160119965 <__x86_return_thunk>
ffffffff8195e0c3: 66 2e 0f 1f 84 00 00 00 00 00	nopw	%cs:(%rax,%rax)
ffffffff8195e0cd: 0f 1f 00             	nopl	(%rax)


So frame to gen_pool_alloc_algo_owner has been added, and instr needs to be 
disabled for it.

> 
> Also, I have concerns about interrupts and reentrancy. We are still
> getting some reentrant calls from interrupts (not all of them are
> filtered by in_task() check). I am afraid these complex hashmaps will
> corrupt.
Need more investigate and advice on better way to have uniq info stored.

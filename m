Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B28A45948;
	Thu, 16 Jan 2025 01:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736990210; cv=none; b=hGLKlgRF+JICsPCBhCaMAFSPr9WnPUzSb+gMPJazaDdWgmigJKFJHVOVilEYQJoHH6ozCBOqwM8Xc5mI5KoV/DX73IwiYFwcEEsfGYUzGt5DtgQCl6LgRUhgSfr4YfkCi7rvZtS/epTHbPVBBeQGZ6lTtJ05g0tYC0Jqe6G0aco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736990210; c=relaxed/simple;
	bh=ccQY1ziqOeTqcuw1nwRxGyLiLZ4lSa7MhaVJB0pWmok=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8A0MxYgQx+yi0hKmCQifgy4KGZjn8jxk0lSoxW8rM2VXvD1OcPiSvgzx3q8Sjzg/wMuHcpweF36XGSW8IdOyA3RmhUf7n1xJN1GCoCEBAPe0vxZNYn4DTuIz8dbFQ6/YY4RwBsswOCqsoKiEkuOtgncNdbWmwXzuCzeh/sZSqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Oaa9viUd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Oaa9viUd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FGn6R4028621;
	Thu, 16 Jan 2025 01:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cPr0S5mO7P+GKPipZ1nGtlwrnrd/h5OSZtw894A+hbo=; b=Oaa9viUd6NYDjasl
	HdJm5eVhudHWTlHsXMq9J3rzYZ3pyntf47gIVLWTwAhTHXvxEgA1W8Gl+bw4I3R8
	lz8v5qlEPA4LV869qEEkw2HSecb9LlnCiDET1FT0LnWGDTwiHE6VYyJcGqNfTJdN
	1coLOev/VxaA3Rg+6LcSLD5BrFpv3j3CiPXwCGm4xCSsUt7i3K7kjzrOZaOpA4D6
	hZ1oXujsKDDUjOFEOuF5xo3tne7Ta0SUhTcb9KAw/yjC62wFqnNWUIzXImKVsxIQ
	r4ELsey/iiNyYC/EjRS49KRNrPGbSUu5Y0d0zn1tqxaRz+xfo80VBX5j9lUZSGN/
	27zOkA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446fgm17yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 01:16:24 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50G1GNBM017104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 01:16:23 GMT
Received: from hu-jiangenj-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 Jan 2025 17:16:16 -0800
Date: Thu, 16 Jan 2025 06:46:13 +0530
From: Joey Jiao <quic_jiangenj@quicinc.com>
To: Alexander Potapenko <glider@google.com>
CC: Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
        "Andrey Konovalov" <andreyknvl@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        Dennis Zhou <dennis@kernel.org>, "Tejun Heo" <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <kasan-dev@googlegroups.com>,
        <linux-kernel@vger.kernel.org>, <workflows@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@quicinc.com>
Subject: Re: [PATCH 0/7] kcov: Introduce New Unique PC|EDGE|CMP Modes
Message-ID: <Z4hd3bLA0178RxDi@hu-jiangenj-sha.qualcomm.com>
References: <20250114-kcov-v1-0-004294b931a2@quicinc.com>
 <CANpmjNPUFnxvY-dnEAv09-qB5d0LY_vmyxhb3ZPJV-T9V9Q6fg@mail.gmail.com>
 <Z4ZfzoqhrJA0jeQI@hu-jiangenj-sha.qualcomm.com>
 <CAG_fn=XFkNVkT3EmB99SdEBAwkGq3EUdM9xR4rzH_HatrJw8rQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG_fn=XFkNVkT3EmB99SdEBAwkGq3EUdM9xR4rzH_HatrJw8rQ@mail.gmail.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z_olEk4WcSq3hsN4Oww5nUKM69KgZkLL
X-Proofpoint-ORIG-GUID: Z_olEk4WcSq3hsN4Oww5nUKM69KgZkLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_11,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=536 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160007

On Wed, Jan 15, 2025 at 04:16:57PM +0100, Alexander Potapenko wrote:
> On Tue, Jan 14, 2025 at 2:00 PM Joey Jiao <quic_jiangenj@quicinc.com> wrote:
> >
> > On Tue, Jan 14, 2025 at 11:43:08AM +0100, Marco Elver wrote:
> > > On Tue, 14 Jan 2025 at 06:35, Jiao, Joey <quic_jiangenj@quicinc.com> wrote:
> > > >
> > > > Hi,
> > > >
> > > > This patch series introduces new kcov unique modes:
> > > > `KCOV_TRACE_UNIQ_[PC|EDGE|CMP]`, which are used to collect unique PC, EDGE,
> > > > CMP information.
> > > >
> > > > Background
> > > > ----------
> > > >
> > > > In the current kcov implementation, when `__sanitizer_cov_trace_pc` is hit,
> > > > the instruction pointer (IP) is stored sequentially in an area. Userspace
> > > > programs then read this area to record covered PCs and calculate covered
> > > > edges.  However, recent syzkaller runs show that many syscalls likely have
> > > > `pos > t->kcov_size`, leading to kcov overflow. To address this issue, we
> > > > introduce new kcov unique modes.
> 
> Hi Joey,
> 
> Sorry for not responding earlier, I thought I'd come with a working
> proposal, but it is taking a while.
> You are right that kcov is prone to overflows, and we might be missing
> interesting coverage because of that.
> 
> Recently we've been discussing the applicability of
> -fsanitize-coverage=trace-pc-guard to this problem, and it is almost
> working already.
Can you share the patch? I was tried trace-pc-guard but had the same unique 
info problem.
> The idea is as follows:
> - -fsanitize-coverage=trace-pc-guard instruments basic blocks with
> calls to `__sanitizer_cov_trace_pc_guard(u32 *guard)`, each taking a
> unique 32-bit global in the __sancov_guards section;
> - these globals are zero-initialized, but upon the first call to
> __sanitizer_cov_trace_pc_guard() from each callsite, the corresponding
> global will receive a unique consequent number;
> - now we have a mapping of PCs into indices, which can we use to
> deduplicate the coverage:
> -- storing PCs by their index taken from *guard directly in the
> user-supplied buffer (which size will not exceed several megabytes in
> practice);
> -- using a per-task bitmap (at most hundreds of kilobytes) to mark
> visited basic blocks, and appending newly encountered PCs to the
> user-supplied buffer like it's done now.
Why at most hundreds of kilobytes? Still stored in sequence? Assume we have 2GB 
kernel text, then bitmap will have 64MB for unique basic blocks?
> 
> I think this approach is more promising than using hashmaps in kcov:
> - direct mapping should be way faster than a hashmap (and the overhead
> of index allocation is amortized, because they are persistent between
> program runs);
> - there cannot be collisions;
> - no additional complexity from pool allocations, RCU synchronization.
> 
> The above approach will naturally break edge coverage, as there will
> be no notion of a program trace anymore.
I think guard value is equavalent to the effect of edge? We can use the guard 
value in syzkaller as edge info?
> But it is still a question whether edges are helping the fuzzer, and
> correctly deduplicating them may not be worth the effort.
> 
> If you don't object, I would like to finish prototyping coverage
> guards for kcov before proceeding with this review.
> 
> Alex
Thanks Alex, sure, please continue the guards patches.
Also I think we can still store the covered PC inside 
__santizer_cov_trace_pc_guard, right?

+void notrace __sanitizer_cov_trace_pc_guard(unsigned long* guard) {
+	struct task_struct *t;
+	struct kcov *kcov;
+	unsigned long ip = canonicalize_ip(_RET_IP_);
+
+	if (!*guard)
+		return;
> 
> > > > 2. [P 2-3] Introduce `KCOV_TRACE_UNIQ_EDGE` Mode:
> > > >    - Save `prev_pc` to calculate edges with the current IP.
> > > >    - Add unique edges to the hashmap.
> > > >    - Use a lower 12-bit mask to make hash independent of module offsets.
> 
> Note that on ARM64 this will be effectively using bits 11:2, so if I
> am understanding correctly more than a million coverage callbacks will
> be mapped into one of 1024 buckets.

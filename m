Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342DF3D093B
	for <workflows@vger.kernel.org>; Thu,  9 Jul 2026 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783629774; cv=none; b=u/iD2kGilfj1N/fGwNG4aDjOtPboZqbfoS6Bd6rcFBN1CITPdjM5WXxiSlz4Dcq/+cls+jyqx/RvGEDaDCkARiXbTE7IIHV4fOulgnIRQiUnhnVii+k4pXWn3jdKsVzo0JX6W1xku95TShoPRLrXa3hV8m3oVz17Eb1nNJnC3No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783629774; c=relaxed/simple;
	bh=8iAp9tKsoebZFhOxpFJUcIQzZJyVz2vaXsf7UlAGiqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pzcv9dndRFEfFBOqi/oLCg5UhEsKhUZe6HtD2vVnCbGaZfGa1/0ClKALQef3QwYLVYZ1rG532g/c4bDnjr8ARDeSIB+S4TdvDv3LQYUzZeEFKz93j4DAKQiLVmM0dYuoBsbzmqGe7W8PafINZlgQTSF3RHBlH79HxlfzMY3ZbmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iZfqk8hd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqBgppkt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iZfqk8hd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqBgppkt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXEJe2504506
	for <workflows@vger.kernel.org>; Thu, 9 Jul 2026 20:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+qKKUofIOR2kpZPymGicPcc4q15NIsQu8T/BgjTuoao=; b=iZfqk8hdK2q+CCWk
	HV/5dI0FM1C/wPrO3W7/H44muQEjcGhHsvKT7kCw3sRtPkpNTlU03TAkmn1vVk2J
	9/DZlGB0ehBUeDngHx3JrWtkHYLXYGeBrS0VdjCW1+W2UG8r1z2Z7s/ZDmGtjMeT
	1ypwAvg9HrjCQA2MNcVrUt8mEup2ZLFOp+ppAho4vqlBQ+9k+VGyv+MuKSDUe7e9
	6GeiOqM2vvOHIiqI5U9GwnbrEzIcBaYE+Eijs7hOUbaY/2CSeL+fBbJ9lJCSLCDj
	ErPQNw2EHyxqPUordFs4+Xz63tZ+oFNP6ISLqkfzZExwGFvbue3MlwxGTVQZ2jo7
	bWmsLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3uv02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 09 Jul 2026 20:42:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so367057a91.1
        for <workflows@vger.kernel.org>; Thu, 09 Jul 2026 13:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783629771; x=1784234571; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+qKKUofIOR2kpZPymGicPcc4q15NIsQu8T/BgjTuoao=;
        b=VqBgppktidDrg6tFCKtUL+qnxUa2C2o+upoeJqz9UFeqOIC5Ijp4Y5DU7NFupvcAoy
         DypLcLm1/0iexgiqTGON1ZacYmeWudR5zAmbYryP0CJ/6aBXT/E46fl/DtbOSL1FbIYN
         bxMS3+X53pyxHDnqmih5HjKPv2SDYfnR1tEHVbYEpa1pFJDOSVsQENp6+7s/VJu0em4A
         IHiRjjJ4YbQHjmnJ6f0U7lvZJu/fyhTfceLVdIZKmX7QTFJLdYpl6T60yvAPdJu58R2G
         XvH37ToKrelCYdcBPfMxOrHNKcIsy734F/ZUK4AEl/nwjNwmZTsI154O8dCMDVsQW4Re
         Iiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783629771; x=1784234571;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+qKKUofIOR2kpZPymGicPcc4q15NIsQu8T/BgjTuoao=;
        b=H3VL7IXBVW0/AQ+fZKClKNkZM3z7TpZzuto2V+KDyEmvqU2oiF9c7GT1nrqdtPbu96
         udwVL+V98KT5clNhULt/ArU3RbbxspWZONYD0VzAdNI8zWtotiJBzxxF5KXZcdCEJvCD
         iqptJhqWWLuq73HmqxKadhHs7cy8YMM2Kc2a5LdpNWLNKYsllotLYNoWGef6bIrD6jiI
         U4Fw+RUlZ9KYuPDjC2NeC4VTrAT3bngjgrdF5ZH4PGovJqap+pBCV3jbF3hI7WNqPug+
         Bj5K6f1kGkE9+ZmeH4kuTt0vdyqQTGbpt9spxWpAZYHZuzXW8JQWtQ4eSttC5yXAEfZr
         DWLw==
X-Forwarded-Encrypted: i=1; AHgh+RpHPGEldu0l2073qIY+K36Pfv65KQW3ZMpN8luocoDT0rSWikOzwsOL0JwKuCIaufIfpnYcpc08hv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaS4Ta7nqRtaD1lYb5IyaH2IK0b4Gijg17TeHKqZlhb4+i+IIw
	qCc35km8e4TcD11achHmX3i43rDA1FfHkcjH4480sHvSLY2fBT3TTnrlM1Y6l+u3+Yq7BSJhZDQ
	Ah1Ta4ci5fYSC3Ax6SI/d4ja36QoyoZMYdBBebNudUK7zIEgK6z2qxLf5WnUZzks=
X-Gm-Gg: AfdE7ckMmkH3eEiXYPrdqvu/jMAiTSy4xjoNWRqpFkX4rs+0rmw9NUog4QQlRf4u+Ph
	0FNbGnpugUEFtuwsBpYQegR4zewoUec9NlQkoVhCEsrxzDv0X2I+iv4rskUvTliC2PnREbWJzWS
	Yrs148cK2EaNWO9ph496MNcW6FCTZjgih/XA58KhOUyrAvMKFoxWRLmSw/AlYuMUsJD46D8cWw9
	IGr4wGZGsNBX4tymdTLMuGtZnd57RjCTFTDXpSHJbmvVlxFsH6TtDIzDkDWGLfsk+d42JFrS7YV
	CZWzBIJ+XypzpGhWw2N2k3sZ20hkJKqMzVA5g8l1gt11xWhcq4fbBilanBdM+GhwNvfjvffcmmV
	msfmGk8je4S5d+81BsXd3JQ6+AMSkH9t5kyhwbA==
X-Received: by 2002:a17:90b:52c5:b0:380:8b14:d8e6 with SMTP id 98e67ed59e1d1-389415eec1dmr9665498a91.17.1783629770020;
        Thu, 09 Jul 2026 13:42:50 -0700 (PDT)
X-Received: by 2002:a17:90b:52c5:b0:380:8b14:d8e6 with SMTP id 98e67ed59e1d1-389415eec1dmr9665430a91.17.1783629769056;
        Thu, 09 Jul 2026 13:42:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm31832045eec.4.2026.07.09.13.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:42:48 -0700 (PDT)
Date: Fri, 10 Jul 2026 02:12:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        David Hildenbrand <david@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 00/26] Introduce meminspect
Message-ID: <20260709204229.eptufujulxwm7zau@hu-mojha-hyd.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <ak3vMSOcv1E6Smbn@lucifer>
 <ak4FRqV2oOEh0Qlk@lucifer>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ak4FRqV2oOEh0Qlk@lucifer>
X-Proofpoint-ORIG-GUID: uBzNbc1-HBbEIFIEc4VHvMPrN75rzBgc
X-Proofpoint-GUID: uBzNbc1-HBbEIFIEc4VHvMPrN75rzBgc
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a5007cb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OGjWj8McAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=vnREMb7VAAAA:8 a=Oh2cFVv5AAAA:8 a=NEAV23lmAAAA:8 a=1XWaLZrsAAAA:8
 a=aUeHnTZRbSBeKbNDsxsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=UYjydHh6ynBBc6_pBLvz:22 a=cvBusfyB2V15izCimMoJ:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDIwNiBTYWx0ZWRfX/2C0SwDyHCGu
 zGgxB/0sbITg1aUNQD2i+2PWPIzFm/s4F68gX6aYSQLaLXDEQffjahXuS+i6WLmND5bY13z+tEn
 aTb7TFGL17EU4LYvB6g4eXMjnAQhTNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDIwNiBTYWx0ZWRfXyYDLC3bw8XEd
 SpZNBbmE1s7t5713abs5X5pJZ+y7tp25N3rFeyW2EooidNjpdgwDAAEgUhDsQ3L8HxPwLyn4+Dp
 Lryh8Ngsf47tNFmO9tPuRk4DT9AviPJ8ph6Ug7IOEJ8G1fs3M14jbiD03Rdk4AbeNG2x8WBT0VY
 z5fNPxzH/HQyebZFvxGygjl/I59Yr9pmZhWS1rRW80p+A0T4f5hpYJtXcWBV1UfzEVSV2/xk3bC
 HCcgT5Z9FzXVKUh0QzqJQTGDSFEfouNczILRY+d3PHbyh8j8TS14TCb063Lkqb9oa63oHodtt4G
 xHDBYUcy5lEN0UGstqqoeLBTSPVBJRwGx67hcUOdJQ7tsujGnQCh0mIXepvvBV8tz50qN/t9niM
 IGO5Vw7PcXtddWEUPra4qh4kNN/DDlouIEqCKCSiY7crFsI6Eh/Yba63wE4jT80ZXo7kckxz6Bx
 HU01W2Gbbsd+cOOtnbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090206

On Wed, Jul 08, 2026 at 09:18:36AM +0100, Lorenzo Stoakes wrote:
> Having had a look through, thoughts:
> 
> I'm very concerned that this (whether intended or not) is a work around for
> drivers to get access to symbols that are not exported.
> 
> In many cases you are adding meminspect instrumentation for stuff that's already
> exported (fine). In some cases it's stuff that's only GPL-exported (not fine),
> and in some cases you are exporting totally unexpected symbols (very very very
> not fine).
> 
> A driver that hooks on to meminspect then gets the PA and VA for these and can
> access these symbols as far as I can tell.
> 
> On that basis I really question the whole approach. It feels like you want to
> have essentially richer symbol information here, so the approach should perhaps
> be built on the existing mechanism for symbols rather than arbitrarily +
> invasively stuck into core kernel logic?

Lorenzo, thank you for the thorough review. You raise a number of
valid points and I do not disagree.

Quoting the lines from our LPC 2023 presentation of Minidump
which is exact problem we are trying to address.
https://lpc.events/event/17/contributions/1468/

"Devices in engineering mode frequently provide a mechanism for
generating full system DDR dump. However, for end user devices, it is
not feasible to capture the entire DDR content and transfer them
electronically. Now a days, typical size of DDR on a premium tier
phones is 12 GB and growing, so the problem is going to be
worse."

The reason for using a physical address is to get the content
directly from where it is present, and not rely on a pstore kind
of mechanism where data gets streamed or written to a RAM
backend, which may not even get a chance to run for non-kernel
crashes, or in some hung state of the device where a watchdog
bite triggers crash dump collection.

So, if we tell the firmware upfront where some good debug regions
are located — like printk data and its metadata, or even ftrace
and its content — we could retrieve dmesg and ftrace even for
non-kernel crashes or hung states. This could be more helpful for
production devices where existing mechanisms for various reasons
are not feasible.

> 
> I am also concerned that you're not accounting for memory lifecycle or things
> like memory hotplug - you seem to just store PAs/VAs with assumption that the
> ranges remain eternally mapped at the same ranges for both.
> 
> This is a concern because you also track dynamic ranges, and drivers might
> register stuff they allocate this way, and it all seems like an easy way to get
> UAF's.

I agree, it may not be considering memory hotplug scenario.

> 
> I may have missed something here and happy to be corrected, though.
> 
> In general the series is far from being in upstreamable shape - you send a giant
> 1st patch which lumps together a whole bunch of stuff, then you send dozens of
> 2-5 line patches, and finally include some qualcomm driver specific stuff for
> good measure.
> 
> The commit messages are generally awful and give little to no information, the
> cover letter is deeply uncompelling and doesn't make the case for the feature at
> all.

I am very sorry for this. I can really improve the commit
messages and the cover letter. It should discuss the problem
first, why the existing solution does not address it, and why
this approach was chosen, but until now nobody has complained
about it. This series has a very long history from
minidump->kmemdump->meminspect and it may have lost the core
detail along the way, but we can really improve this.

> 
> You make zero comments about key concerns with regards to stability, robustness,
> security. There's no testing logic anywhere, and you even include a plea for
> testing in the cover letter.

We did not see the driver getting PA/VA as a concern, but I see
your point.

The plea for testing was only for the debug_kinfo driver, which
we don't usually own in its downstream. Eugene, in discussion
with others, found there could be another potential users of
meminspect, and hence he converted it to use meminspect and
hence, the plea for testing only the debug_kinfo driver but
Qualcomm minidump driver tested with meminspect.


> This is very much RFC stuff and I continue to not understand why you've taken
> the RFC label off here.

You are right to question it given the volume of your open
concerns; removing the RFC label was premature. Eugene has even
presented this to the MM maintainer at some meeting, which I did
not attend, where he got a nod from David that this should be
taken out of RFC.

> 
> And it all very much smacks of trying to solve an internal problem you've
> encountered downstream by changing the core of the kernel, rather than you
> sending a generally useful feature.

It may look like a downstream problem, but it is a problem to
debug an end user's phone, and it may need more but minimal data
for debugging an end user phone crash. Hence, we needed something
in the core which could be used by others as well.

> 
> You need to address all of this and re-RFC the series. It instinctively feels
> like trying to solve the problem in the wrong place, but in any case it would be
> better to start with a SMALLER version of this first then look to extend it only
> if the community supports it.

Surely, it should be better to start with smaller but useful
information which could be capturing dmesg in any kind of crash,
and for that I need at least the PA/VA for printk data and its
metadata, if it is allowed. Hope this gives an idea of what we
are solving.


-Mukesh
> 
> Thanks, Lorenzo
> 
> On Wed, Jul 08, 2026 at 08:11:52AM +0100, Lorenzo Stoakes wrote:
> > +cc Jason as maybe he has thoughts on this...
> >
> > Overall - for this to be sensibly mainlined, we need to see a. a COMPELLING case
> > made for this feature, b. some buy-in from others, and c. have confidence this
> > will be properly maintained.
> >
> > I don't feel you've demonstrated any of these.
> >
> > And looking through the history of this (you've made it really hard with your
> > changelog):
> >
> >     v2 - https://lore.kernel.org/lkml/20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com/
> >     v1 - https://lore.kernel.org/lkml/20251119154427.1033475-1-eugen.hristev@linaro.org/
> > RFC v3 - (I literally can't find it...?)
> > RFC v2 - https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
> > RFC v1 - https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/
> >
> > I'm struggling to understand why on earth it came out of RFC?
> >
> > You really shouldn't drop the RFC tag unless you've got CLEAR signal that the
> > community wants the feature and that there's buy-in.
> >
> > Instead you've got some specific technical feedback, some trivia, etc. which
> > warrants RFC respins, but nothing to suggest buy-in.
> >
> > So please attach the RFC tag to any future respins. And I suggest you make the
> > case for this a LOT clearer and seek to engage with others to confirm that there
> > is anybody else who wants this.
> >
> > On Wed, Jul 08, 2026 at 11:01:39AM +0530, Mukesh Ojha wrote:
> > > First of all, I want to thank Eugene for his excellent work on this
> > > series. What began as the Qualcomm Minidump driver from me has now
> > > evolved into meminspect. He also presented meminspect at Linux
> > > Plumbers 2025.
> > >
> > > Video of the recording is available here for anyone interested:
> > > https://www.youtube.com/watch?v=aDZv4-kOLSc
> >
> > It's iffy putting links like this in a commit message that'll end up as a commit
> > (in mm we put the cover letter in). Links can die. Companies can change their
> > minds about videos being available.
> >
> > Maybe better as something explicitly after the commit message.
> >
> > >
> > > Introduction: Memory inspection mechanism
> > >
> > > meminspect is a mechanism which allows the kernel to mark specific
> > > memory areas for memory dumping or specific inspection, statistics,
> > > usage.  Once regions are marked, meminspect keeps an internal list with
> > > the regions in a dedicated table.  Further, these regions can be
> > > accessed using specific API by any interested driver.  Regions being
> > > marked beforehand, when the system is up and running, there is no need
> > > nor dependency on a panic handler, or a working kernel that can dump the
> > > debug information.  meminspect can be primarily used for debugging. The
> > > approach is feasible to work when pstore, kdump, or another mechanism do
> > > not. Pstore relies on persistent storage, a dedicated RAM area or
> > > flash, which has the disadvantage of having the memory reserved all the
> > > time, or another specific non volatile memory. Some devices cannot keep
> > > the RAM contents on reboot so ramoops does not work. Some devices do not
> > > allow kexec to run another kernel to debug the crashed one.  For such
> > > devices, that have another mechanism to help debugging, like firmware,
> > > meminspect is a viable solution.
> >
> > Please use paragraphs, this is an unreadable wall of text and it just seems
> > to be noise.
> >
> > Why would we want to mark specific areas a special way? What are the
> > trade-offs, what does that actually do? How do you interact with it? Why
> > can't other approaches be used?
> >
> > You should make it CLEAR what exactly the benefits are and why this is
> > better than alternatives.
> >
> > >
> > > meminspect can create a core image, similar with /proc/vmcore, with only
> > > the registered regions included. This can be loaded into crash tool/gdb
> > > and analyzed. This happens if CRASH_DUMP=y.  To have this working,
> >
> > What is CRASH_DUMP? Where is it defined? You mean CONFIG_CRASH_DUMP?
> >
> > > specific information from the kernel is registered, and this is done at
> > > meminspect init time, no need for the meminspect users to do anything.
> >
> > Again this just doesn't really mean anything to me?
> >
> > >
> > > This version of the meminspect patch series includes two drivers that
> > > make use of it: one is the Qualcomm Minidump, and the other one is the
> > > Debug Kinfo backend for Android devices, reworked from this source here:
> > > https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/android/debug_kinfo.c
> > > written originally by Jone Chou <jonechou@google.com>
> >
> > This feels rather like you've taken a specific use case you have, and
> > worked backwards from it to changes to core, honestly.
> >
> > >
> > > Tested on Qualcomm SA8775P (Lemans EVK) on next-20260707 with the
> > > minidump backend: kernel crash dump regions correctly captured
> > > via firmware.
> >
> > What is a minidump backend? There's no detail about the testing here
> > either. Does anybody outside of Qualcomm care about this?
> >
> > >
> > > This series introduces a new cross-subsystem framework and, to
> > > avoid merge ordering issues, I suggest the entire series be taken
> > > via the mm tree. Subsystem maintainers for touched files have
> > > been CC'd; I request an Acked-by from them if the respective
> > > patches look fine from their side.
> >
> > Don't put stuff about mechanics of merge in the middle of a cover letter
> > that will go into the git log, put this and the stuff about the video in a
> > block of text below the main text, you can tag it 'REVIEWERS NOTES' or
> > similar.
> >
> > Not only A-b for touched files, but as this is ostensibly an mm feature
> > you'll need tags from mm maintainers and acceptance of the feature overall
> > for it to be accepted.
> >
> > >
> > > Alternatively, the qcom backend patches (22-24) can be deferred
> > > to Bjorn's qcom tree in a follow-on series once the core
> > > meminspect framework lands.
> >
> > I think that would be better yes, you shouldn't be adding new driver
> > changes in a core series like this, only touching stuff you have to touch
> > as a result of the core change.
> >
> > Anything else should be saved for later series. You can express ordering
> > requirements in the cover letter...
> >
> > >
> > > *** How to use meminspect with minidump backend on Qualcomm platform guide ***
> >
> > Odd to put a specific qualcomm TODO in a cover letter for a mainline
> > feature...
> >
> > Again this makes it feels like this is something you want for your driver,
> > and the core changes are just a means of getting there, which is not an
> > acceptable justification for core changes.
> >
> > You have to rework this entire cover letter to sell it as a GENERAL
> > feature.
> >
> > I'm really not convinced we want to give drivers (which are great at doing
> > exactly the wrong thing with mm APIs) the ability to do invasive things in
> > mm.
> >
> > >
> > > Prerequisites:
> > > Crash tool compiled with target=ARM64.
> > >
> > > Target kernel must be built with: CONFIG_DEBUG_INFO_REDUCED=n;
> > > this will have vmlinux include all the debugging information
> > > needed for the crash tool and CONFIG_MEMINSPECT,
> > > CONFIG_CRASH_DUMP, and the driver CONFIG_QCOM_MINIDUMP.
> > > Kernel arguments: Kernel firmware must be set to mode 'mini' by kernel
> > > module parameter like this : qcom_scm.download_mode=mini
> > >
> > > After the kernel boots and the minidump module is loaded,
> > > everything is ready for a possible crash. Upon triggering a
> > > forced kernel crash, the target board will wait in download mode,
> > > where QDL (https://github.com/linux-msm/qdl) running on the host
> > > connected to the target (here, Lemans EVK) can be used to collect
> > > minidump.elf from the target device onto the host.
> > >
> > > Currently, --minimal mode is being used to get dmesg log from
> > > crashed device.
> > >
> > > Without --minimal mode, the crash tool needs to be patched to
> > > not crash on missing symbols and needs to be tuned, which I am
> > > currently working on in parallel.
> > >
> > > crash> log
> > > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x514f0014]
> > > [    0.000000] Linux version 7.0.0-rc3-next-20260309-00028-g528b3c656121 (@21e3bca4168f) (aarch64-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, GNU ld (GNU Binutils for Ubuntu) 2.42) #5 SMP PREEMPT Tue Mar 10 18:18:41 UTC 2026
> > >
> > > *** Debug Kinfo backend driver ***
> > > I need help with the testing of this driver, Anyone who actually wants
> >
> > Err you're putting forward a non-RFC series to mainline and also saying
> > essentially it's untested at least in one respect?
> >
> > This is signal that this should _remain_ RFC.
> >
> > > to test this, feel free to reply to the patch. we have also written a
> > > simple DT binding for the driver.
> > >
> > > Thanks in advance for the review, and apologies if I missed addressing any comment.
> > >
> > > -Mukesh
> > >
> > > Changes in v3: https://lore.kernel.org/lkml/20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com/
> >
> > And again, ->v2 but you label it v3...!
> >
> > > - Addressed most of doc. comments and binding and 0-day kernel
> > >   test robot warning.
> > > - Add timekeeping: Register tk_data into meminspect
> > > - fixed some of the bugs identified during testing.
> > > - Fix missing return before dev_err_probe() in qcom_md_probe(); all
> > >   three error paths (SMEM lookup, table validation, table init) now
> > >   correctly abort probe on failure
> > > - Fix meminspect_traverse() kernel-doc: @priv description corrected
> > > - Fix meminspect.rst: replace stale MEMINSPECT_ITERATOR_CB type name
> > >   with the actual meminspect_iter_cb_t typedef
> > > - Add kernel-doc for meminspect_iter_cb_t typedef
> > > - Lot of code formating and style change as per coding standard.
> > >
> > > Changes in v2: https://lore.kernel.org/lkml/20251119154427.1033475-1-eugen.hristev@linaro.org/
> >
> > The link is to v1... what a mess!
> >
> > >  - Fixed doc warnings
> > >  - Fixed kernel-test robot warnings.
> > >  - Took Mike suggestion to remove mark inspect flag for dynamic memory.
> > >  - Added R-b for printk patch.
> > >  - Modified some commit messages for clarity.
> > >  - corrected binding change for debug-kinfo as per Rob suggestion.
> > >
> > > Changelog for meminspect v1:
> >
> > You don't include a link to RFC v3 at all?
> >
> > > - rename to meminspect
> > > - start on top of v2 actually, with the section and all.
> > > - remove the backend thing, change the API to access the table
> > > - move everything to kernel/
> > > - add dependency to CRASH_DUMP instead of a separate knob
> > > - move the minidump driver to soc/qcom
> > > - integrate the meminspect better into memblock by using a new memblock flag
> > > - minor fixes : use dev_err_probe everywhere, rearrange variable declarations,
> > > remove some useless code, etc.
> > >
> > > Changelog for RFC v3:
> > > - V2 available here : https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
> >
> > Same comment as below. Put links for changelogs with the version you're changing
> > it's a total nightmare trying to follow this.
> >
> > And I literally cannot find RFC v3 on list, did you mislabel it?
> >
> > > - Removed the .section as requested by David Hildenbrand.
> > > - Moved all kmemdump registration(when possible) to vmcoreinfo.
> > > - Because of this, some of the variables that I was registering had to be non-static
> > > so I had to modify this as per David Hildenbrand suggestion.
> > > - Fixed minor things in the Kinfo driver: one field was broken, fixed some
> > > compiler warnings, fixed the copyright and remove some useless includes.
> > > - Moved the whole kmemdump from drivers/debug into mm/ and Kconfigs into mm/Kconfig.debug
> > > and it's now available in kernel hacking, as per Randy Dunlap review
> > > - Reworked some of the Documentation as per review from Jon Corbet
> > >
> > > Changelog for RFC v2:
> > > - V1 available here: https://lore.kernel.org/lkml/20250422113156.575971-1-eugen.hristev@linaro.org/
> >
> > Why are you linking the previous version here, it's strange.
> >
> > Just put RFC v1: with the link below, same goes for other cases.
> >
> > > - Reworked the whole minidump implementation based on suggestions from Thomas Gleixner.
> > > This means new API, macros, new way to store the regions inside kmemdump
> > > (ditched the IDR, moved to static allocation, have a static default backend, etc)
> > > - Reworked qcom_minidump driver based on review from Bjorn Andersson
> > > - Reworked printk log buffer registration based on review from Petr Mladek.
> > >
> > > ---
> > > Eugen Hristev (21):
> > >       kernel: Introduce meminspect
> > >       init/version: Annotate static information into meminspect
> > >       mm/percpu: Annotate static information into meminspect
> > >       cpu: Annotate static information into meminspect
> > >       genirq/irqdesc: Annotate static information into meminspect
> > >       timers: Annotate static information into meminspect
> > >       kernel/fork: Annotate static information into meminspect
> > >       mm/page_alloc: Annotate static information into meminspect
> > >       mm/show_mem: Annotate static information into meminspect
> > >       mm/swapfile: Annotate static information into meminspect
> > >       kernel/vmcore_info: Register dynamic information into meminspect
> > >       kernel/configs: Register dynamic information into meminspect
> > >       mm/init-mm: Annotate static information into meminspect
> > >       panic: Annotate static information into meminspect
> > >       kallsyms: Annotate static information into meminspect
> > >       mm/mm_init: Annotate static information into meminspect
> > >       sched/core: Annotate runqueues into meminspect
> > >       remoteproc: qcom: Move minidump data structures into its own header
> > >       soc: qcom: Add minidump backend driver
> > >       soc: qcom: smem: Add minidump platform device
> > >       meminspect: Add debug kinfo compatible driver
> > >
> > > Mukesh Ojha (5):
> > >       timekeeping: Register tk_data into meminspect
> > >       mm/numa: Register node data information into meminspect
> > >       mm/sparse: Register information into meminspect
> > >       printk: Register information into meminspect
> > >       dt-bindings: reserved-memory: Add Google Kinfo Pixel reserved memory
> > >
> > >  Documentation/dev-tools/index.rst                  |   1 +
> > >  Documentation/dev-tools/meminspect.rst             | 144 +++++++
> > >  .../reserved-memory/google,debug-kinfo.yaml        |  48 +++
> > >  MAINTAINERS                                        |  16 +
> > >  drivers/of/platform.c                              |   1 +
> > >  drivers/remoteproc/qcom_common.c                   |  55 +--
> > >  drivers/soc/qcom/Kconfig                           |  13 +
> > >  drivers/soc/qcom/Makefile                          |   1 +
> > >  drivers/soc/qcom/minidump.c                        | 271 ++++++++++++
> > >  drivers/soc/qcom/smem.c                            |  10 +
> >
> > Yeah I hate that you're adding a wholy unrelated driver feature as part of this.
> >
> > Let's not.
> >
> > >  include/asm-generic/vmlinux.lds.h                  |  13 +
> > >  include/linux/meminspect.h                         | 271 ++++++++++++
> > >  include/linux/soc/qcom/minidump.h                  |  70 +++
> > >  init/Kconfig                                       |   1 +
> > >  init/version-timestamp.c                           |   3 +
> > >  init/version.c                                     |   3 +
> > >  kernel/Makefile                                    |   1 +
> > >  kernel/configs.c                                   |   6 +
> > >  kernel/cpu.c                                       |   5 +
> > >  kernel/fork.c                                      |   3 +
> > >  kernel/irq/irqdesc.c                               |   2 +
> > >  kernel/kallsyms.c                                  |   9 +
> > >  kernel/meminspect/Kconfig                          |  29 ++
> > >  kernel/meminspect/Makefile                         |   4 +
> > >  kernel/meminspect/kinfo.c                          | 257 +++++++++++
> > >  kernel/meminspect/meminspect.c                     | 474 +++++++++++++++++++++
> > >  kernel/panic.c                                     |   4 +
> > >  kernel/printk/printk.c                             |  12 +
> > >  kernel/sched/core.c                                |   2 +
> > >  kernel/time/timekeeping.c                          |   2 +
> > >  kernel/time/timer.c                                |   2 +
> > >  kernel/vmcore_info.c                               |   4 +
> > >  mm/init-mm.c                                       |  12 +
> > >  mm/mm_init.c                                       |   2 +
> > >  mm/numa.c                                          |   2 +
> > >  mm/page_alloc.c                                    |   2 +
> > >  mm/percpu.c                                        |   5 +
> > >  mm/show_mem.c                                      |   2 +
> > >  mm/sparse.c                                        |   3 +
> > >  mm/swapfile.c                                      |   2 +
> > >  40 files changed, 1713 insertions(+), 54 deletions(-)
> > > ---
> > > base-commit: 5c73cd9f0819c1c44e373e3dabb68318b1de1a12
> > > change-id: 20260708-meminspect-v3-76dd8166c4f1
> > >
> > > Best regards,
> > > --
> > > -Mukesh Ojha
> > >
> >
> > Thanks, Lorenzo

-- 
-Mukesh Ojha

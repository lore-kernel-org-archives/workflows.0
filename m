Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337883C3453
	for <workflows@vger.kernel.org>; Wed,  8 Jul 2026 19:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783537560; cv=none; b=Hhz9TSo6/Aq6Ivsk+irH0VIChJwiPhmNAlquL+jjqyaUFoyscARt+ZkUuz8eyNKtufV4qLaWLtNqk/IS9V12QMl3YUShEf5Bq5bt8Uz88QcRDlZOPxIM7Y9FNSsgfkouqFpASgfnTAiOsSdVeSDV592BrGNByEKI3PwhwT1b45E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783537560; c=relaxed/simple;
	bh=YItqT8T7it2rqu0Ag40WP8xbh00oL0oNgmOzd217gSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDJUmkq0eqnKhDrD9Bm17wgv1K6WhxS/wweBldDsP4ZYAsy8GmrNAdLkYjyllz3WoYWMnXE406ER78ARtTAUDlSKpd7PXcH/R0waU0NQ8yusEQYCd7z+XxGxqwx/1OvBpELIwt4wfZMi7ThhlYe+q0ginCkK/XKZiA40jHBdP+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C/Z3O8TS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TaVdRaOB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C/Z3O8TS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TaVdRaOB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668IlER03524841
	for <workflows@vger.kernel.org>; Wed, 8 Jul 2026 19:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CeHf8ZnOmdDt8+90mSP4wYI2
	u2NYKjn3Be4iJ272f5Q=; b=C/Z3O8TSU/K6ST7I/5NLvaXUbyaBPKdv0+DgP40l
	nQUMyIiRO9eb0HkYDoQACetPWHg33l4B4SndJBK78czyFY2O72YHuNe0IwlvvEDO
	e3Y5cvI4c3FPt59an/wepDFFpz+Z03T8w+4iB0iNKikofEJk+NSkHJqWjAuBGuDu
	AtCF25xZE9fajt5L8vuDM1kN1dXUr3yeqChMyf4fl6dNiYLugaM5q29YztM8AH9s
	XpjSoOZW0vNUVP2e+nShpv9KxBXbZv+Ku+p0c6/+UfEDrWTF5ZEDyfUzfYbgBzid
	ORzfs/9zn+9EvdTrpupSEOicov9omFUig51PTAzYEyTiVA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u025y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 08 Jul 2026 19:05:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8895156101so1501256a12.1
        for <workflows@vger.kernel.org>; Wed, 08 Jul 2026 12:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783537555; x=1784142355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CeHf8ZnOmdDt8+90mSP4wYI2u2NYKjn3Be4iJ272f5Q=;
        b=TaVdRaOBpzvB3sQFBAEcWmcDx/oLzP0IrwweH/DQly4YNfb7bLluGOkH4f1e0ugFbx
         7D8Oz5PvtAfizYXfXJReHdylvgLKwS/72bPb/+nKhmOxA0rw4RZh8GpHfG1QsyhhAfs0
         LRY4AnHCrtUfwi1tOOk1XN6vt0c7XFjJud2Yn31KcQojtpTOqfewVFEvDjfKdwgm2ln/
         uxUP0AozutmPGMBpF7a/oIcbPJunJuML5IgueBPTHDv566YUWrCCBWQr38wQslEe43Er
         pEoLSczQAXe1n8ZDDpdUD6RSR/djvXl8LL/KFsGpbGm12Wrimwt5mzMxT9L9KzzxQ/cf
         Kxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783537555; x=1784142355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CeHf8ZnOmdDt8+90mSP4wYI2u2NYKjn3Be4iJ272f5Q=;
        b=q10kSUofYXoBqRbIVyxDvYeoE+lAY4TtIE55UGPqsK+byUVDHSJ+0McGp7jNDRNRp3
         1lwNUAudsYYEhu8OPKCUpyt36vSyJ4Clopw/rrvdFTcWb086RZfTomsyLFula6vjMKgk
         egeL0J04ksamXRVcq4FsLPZteyNRN/GeRJFed9fNNVaXDYuC6LjDc+SiAtQ8kn4FTUiD
         BEihrEZLoCSsSh62vQcjxzmDuWCLuP11rKxcPPrKzjBMQ63skdQhaDffhCP2LiSx7K3y
         9aWfsoFeCPpwWEz9U4mS6/CFGSQCTtzbcEtFIyIVaiZEF5cdiAEKSplfD1muWa2TfdIZ
         h/0A==
X-Forwarded-Encrypted: i=1; AHgh+Rpbfd9T5p+Nf4kQ76s4DS+0elfLeNEelvxvsM/1gZUxRXwuH1VBlSj1umeHmL3Bwc4byZ+yuQs/rRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVXo7FPrAQ7ZFr4W+UXrXh5ip3O2LpcHcxso2GfoMQKqRdYVbe
	DMp1z8jwwNvrZd7nneJIpY7Q5Cjm0gcckNWXe0sLNEmpvHo2W8oducg8xVzO8kNwBaTffuZZjRa
	xanL3EXQGtApoMPI0al+l43oDOZhnoEQ6alZalpmncDa4JZdp7ZfcjjxXiCUibFE=
X-Gm-Gg: AfdE7cnevEe1iVWhXIwi9fwuWYbgE47wuLErlp040kQ60gNoIoK6hcI2imW+vkcgd8A
	2WRbi7eDy4fCuhS830HsVf7d93vs+qL02tbnm7c+TkACARKYUOuN9NfHhT8WKbR0vLt3RZvBJRe
	8UmezdNW9OEz+VDOsH3sJ4aopNbfRay4hRX6zGT++T9tuUf9oY7Ek9dbEuulWB+X03Ti2/Q/29p
	L2iU3fWtS30lYodZHy53R5jqlq+CS5R4IjLmyA8YWZpRQS09jSqof0y2K2oPQ2IVKdmDbobEXY2
	BCcwXErbCNDaf6FYU+ygAANfevJqkN5NEVYtmzxaOTvLloujpyBg8yqbgFOVJiYLRDHzBXjX14E
	xYLh9y6xnU8NoVvHkfkvZbo285DTBfMYK7i1qaw==
X-Received: by 2002:a17:90b:4d8d:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38942f7105cmr3621953a91.22.1783537555366;
        Wed, 08 Jul 2026 12:05:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4d8d:b0:37f:db06:229c with SMTP id 98e67ed59e1d1-38942f7105cmr3621916a91.22.1783537554731;
        Wed, 08 Jul 2026 12:05:54 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ae6cd9sm24772373eec.31.2026.07.08.12.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 12:05:54 -0700 (PDT)
Date: Thu, 9 Jul 2026 00:35:35 +0530
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
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 11/26] mm/swapfile: Annotate static information into
 meminspect
Message-ID: <20260708190535.fhqaddicljho44eq@hu-mojha-hyd.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708-meminspect-v3-v3-11-7aa5a0a74d5c@oss.qualcomm.com>
 <ak4AgXqMnkn8rVGE@lucifer>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak4AgXqMnkn8rVGE@lucifer>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4NyBTYWx0ZWRfX/t1UlO9BHHmL
 kAVIVdNnFiIhkos21hGZeUz2xIh8rW6uvm9uubIQuDxTuC7AFeq46sethZgizgFJrUiiLebYryu
 3uSYCLCBEZAIAhIzT0ayIZd57yuAkrY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4NyBTYWx0ZWRfX5Pf834+FftIj
 f7nDR/zHxl5jgUhrhVl7CcZAqMyzOfiP8pU8HGcenacs3AYKEN/jZ7zMLKbJ+8v2OK7/GY1Vx7O
 /E+Q5c8bqnSrObfH3Pz+LUxkC1oXqoEaHaMN4k2rB64RlACh/TAz3UYWJP68WtQEuZfDAo2d1Zq
 q1gIabxdNil4Nu0YiGpAHf8/aXux0tf/RTWYyqR5XET9es6dQwhBZMCECbN13/t4+beC58oPPWX
 IWtgMasRbAGGmLsU7q4gjopp0M4Xj57eDjM1j/EuI6xlSu/vE1p2hwGYk8E7UFX1Mad24dUqcXB
 4fzA1m0HpCRAXscM+jkMW+f8lQF1X1t/bZlItXLo2pLssWRekTcRRT5ZrKwJVoWPglpLGYuxW/z
 m9auXAjA/nPUdHkJMSVBbt44qOw5wTpSB43qxnLGh9ZhzQVuXE9aKbpMyYc5LvKeVHvCeUTk1/t
 vQFDFLdyKLDvX5oj2gA==
X-Proofpoint-GUID: YlUaB7Uk5dsPgUpfyV3KsKxm3HmWIqkh
X-Proofpoint-ORIG-GUID: YlUaB7Uk5dsPgUpfyV3KsKxm3HmWIqkh
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4e9f94 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=cq8IU3OeMPPiwu34qS0A:9
 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080187

On Wed, Jul 08, 2026 at 08:47:51AM +0100, Lorenzo Stoakes wrote:
> On Wed, Jul 08, 2026 at 11:01:50AM +0530, Mukesh Ojha wrote:
> > From: Eugen Hristev <ehristev@kernel.org>
> >
> > Annotate vital static information into inspection table:
> >  - nr_swapfiles
> >
> > Information on these variables is stored in a dedicated meminspect
> > section.
> >
> > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  mm/swapfile.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/mm/swapfile.c b/mm/swapfile.c
> > index a602e5820513..d480727e4987 100644
> > --- a/mm/swapfile.c
> > +++ b/mm/swapfile.c
> > @@ -42,6 +42,7 @@
> >  #include <linux/suspend.h>
> >  #include <linux/zswap.h>
> >  #include <linux/plist.h>
> > +#include <linux/meminspect.h>
> >
> >  #include <asm/tlbflush.h>
> >  #include <linux/leafops.h>
> > @@ -65,6 +66,7 @@ static void move_cluster(struct swap_info_struct *si,
> >   */
> >  static DEFINE_SPINLOCK(swap_lock);
> >  static unsigned int nr_swapfiles;
> > +MEMINSPECT_SIMPLE_ENTRY(nr_swapfiles);
> 
> Now the EXPORT_SYMBOL_GPL() is an EXPORT_SYMBOL() in effect no?

The whole reason we had to tag most of the MM symbols is that
the crash tool looks for this information while launching itself.

e.g.,

./crash --no_modules --no_panic --no_kmem_cache --zero_excluded ./vmlinux  ./minidump.elf


> 
> >  atomic_long_t nr_swap_pages;
> >  /*
> >   * Some modules use swappable objects and may try to swap them out under
> >
> > --
> > 2.53.0
> >

-- 
-Mukesh Ojha

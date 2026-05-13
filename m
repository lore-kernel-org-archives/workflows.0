Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080D1DE3B7;
	Wed, 13 May 2026 05:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651659; cv=none; b=GwQbDlzZ3DoiGRHPndNiye+rziZahWqIPfsLUHQ0phhc7oek55QnLJM2AR3ruDA+e7XinMHFFPGvbFm7gnt0MWjBY4oCZxxh1KYKBoSVn0YtVzR+k5vRdJ/YkQowR8H4imOojw2hIo69Xc4pKO2Fr4GTx50ROVyfGKYtvYejTVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651659; c=relaxed/simple;
	bh=1csDsp318lIzbzvyQ4H6vhO/sPc9KJFEMhl94CMjapc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ui91GExf1RgtI7NWSlRJ3ZfusX/KjN8LWLJt7aC6AC05hdwpuBi+58jZGbnmfHZ1XbPjBnz7UqXuaeGrC9lH2JWscbhJYuSgy+GbGqzD0IKKrdzknv8tQv1o+niMdaZ0bFixkpHCk2aahWDPgb5jcpb2xTerVhEM0QQppifx4+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=atENdrC7; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="atENdrC7"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D3Ec4B3179791;
	Wed, 13 May 2026 05:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=fnuufqYYLtE0fFDfYwC2wP+HbgXlrj
	00l8SFUOeSnOA=; b=atENdrC75nKm/3jmpD5vlyuXXOC+RtAZmoRfgFGQXt0LuD
	KVK3yueUhMbFULBaocjqPGD3c/o6y5aT99Cj8ThSD/k/w2H0OaolTZlEOx1Nth3X
	ladFjKtEU/FqmrRMIgVzXVTrI0v0y50FoDPlwjnPEcHTnQC4KvpEJzmCUQb0f1CJ
	aksJJAisJUNlvpoKmKgEvRES+vNptlcR2XiSwxvFSDH6BqE8rEls4stUgDFDCz+F
	8duh0brQrJfbjcmUsichuytyOxoJ4xIAaKxgEv2CJ8icSIvTtSBzsFzftYTJiD2W
	PiVaQcAY5xwLlOFZwMrVBFPZHhycQdUh7rBLDt6w==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e3nv6nyp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 05:53:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64D5dOmU002130;
	Wed, 13 May 2026 05:53:55 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e3nfgpe10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 May 2026 05:53:55 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64D5rrNt57278854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 May 2026 05:53:53 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27D082004B;
	Wed, 13 May 2026 05:53:53 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E422B20040;
	Wed, 13 May 2026 05:53:52 +0000 (GMT)
Received: from osiris (unknown [9.52.214.206])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 13 May 2026 05:53:52 +0000 (GMT)
Date: Wed, 13 May 2026 07:53:51 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jani Nikula <jani.nikula@intel.com>, andy.shevchenko@gmail.com,
        apw@canonical.com, corbet@lwn.net, dwaipayanray1@gmail.com,
        joe@perches.com, kees@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com,
        skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [PATCH 1/2] Doc: deprecated.rst: add strlcat()
Message-ID: <20260513055351.10375B84-hca@linux.ibm.com>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
 <20260510165451.57674-2-manuelebner@mailbox.org>
 <748c2c3d549740918e14f29aa25dd475b99c1313@intel.com>
 <46d8a5a8c8c77d3de9acfa1c55de2148fb2975c5.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46d8a5a8c8c77d3de9acfa1c55de2148fb2975c5.camel@mailbox.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Us1T8ewB c=1 sm=1 tr=0 ts=6a0411f4 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=b3CbU_ItAAAA:8
 a=grwZSnOX14fL6JIfArEA:9 a=CjuIK1q_8ugA:10 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-GUID: wuipSwtJrVif0VqMFr0IeB0K1BguVDYJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1NCBTYWx0ZWRfX3FD6y17D8btS
 Pd03lTwhZJcOvMQAkOENttTPuZjMEaldPaf6usk0nsZhkS/Oa8ngX6n+sHrBf2zPpqtZ0f4vZYL
 J6wZ/c89LszfuHFwdtZtnrOrpTmteQM3sQs1CTm5KeyFwQ3cQ7pcM1ROzqn2pUOZNNS1R72Wc9R
 21jyEHTlc0bZ1w0XsWnm3FSUUqN/7DzGoBAHq30HnT0DqFt4s3RmIb+OK3NMlAVC34mvfoY2eoP
 R6EbKAOksfwIDvyhcvDoDBw03gD5vwfM1fY/mhTow7goPLUi8KNZcSmi/Wq5HHg263Y8bOaW6Mi
 XOGur0XPamZnfx6XJh/AtS6QCZV+VPgpb8XfFLmKhQ9PzwrI4w29ElQijAXGOMbJ79brGCCxwv1
 xMebotz18EvKbZ6mLKBinQ+VILb07e1FFymunwaSrIwAUmjvjSFlAbuIx73Tqy4e0YrQjxmgpnW
 PekAVURC8Ze42sejY8g==
X-Proofpoint-ORIG-GUID: s-BR4kWFiM2qSDy_DfrtMJIxymWzwus6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130054

On Tue, May 12, 2026 at 12:43:54PM +0200, Manuel Ebner wrote:
> On Tue, 2026-05-12 at 11:52 +0300, Jani Nikula wrote:
> > On Sun, 10 May 2026, Manuel Ebner <manuelebner@mailbox.org> wrote:
> > > add strlcat and alternatives
> > 
> > You'd think it's the strlcat() definition that needs a comment above it
> > saying it's deprecated. I don't think folks really look at
> > deprecated.rst.
> 
> arch/s390/lib/string.c
> lib/string.c
> and
> tools/include/nolibc/string.h
> 
> do not mentions anything about obsolete.
> 
> include/linux/fortify-string.h has 
> 
>  /* Defined after fortified strlen() to reuse it. */
>  extern size_t __real_strlcat(char *p, const char *q, size_t avail) __RENAME(strlcat);
>  /**
>   * strlcat - Append a string to an existing string
>   * [...]
>   * Do not use this function. While FORTIFY_SOURCE tries to avoid
>   * read and write overflows, this is only possible when the sizes
>   * of @p and @q are known to the compiler. Prefer building the
>   * string with formatting, via scnprintf(), seq_buf, or similar.
> 
> should i add this to the former three files?

I'm going to remove s390's implementation of strlcat(), and convert the only
two users of strlcat() in s390 code to something else. No reason to add a
comment there.

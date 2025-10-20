Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0573203AA
	for <workflows@vger.kernel.org>; Mon, 20 Oct 2025 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760968647; cv=none; b=CjP4FlVhY+So7zOHDCqZ+bSdeCdZauOB2RyocJpC2NPndyEcJ1ZRgrAWjM43fk9c9EeEbLIG8NuNvr9n5sGw5ADMQh4GHt8MCDE+nR2xhfRZOiJMpnDillWB3Sp1E6G6ZgllCd8CwFhalXme67EaF8cgGrTIgY+e7SzR/XUmX0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760968647; c=relaxed/simple;
	bh=A8hOd+NyHhmPh2zHInfdGnL3TO16aSzoKbKuuytyv14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPnm5V4Ze4zTRNjuoqL28w4IEBXaFojh2h+bG8FRjK7gZOPXu5DszWb3JHW1tmwEwQbQ2cKxRxIU1M4C+fTdlcCFwHq1mqjE0+m6yjbuTRHSaB4c49rGfXmKaldtchF3S+5dgPDZ/2zUxqDFwmgTTXiIpbzddbl1+fVPaiQ5Sv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jdfWAVpX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jdfWAVpX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBW4I0028857
	for <workflows@vger.kernel.org>; Mon, 20 Oct 2025 13:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qIJKOvCxcYruswbUzq9fr5+Eh0foHybSIq/Oms+hhQU=; b=jdfWAVpX9TExDMuh
	ZK+3mX23sEkMJmAsZUmCsoEJpxSUm4EncpHPNzAias+XnllwWVMgqj2wKteUU+87
	4Pq1osV+X0BK6FFF95HCsHeE69a/aA/UTnobWObFTSOWha0M5mx4i2IoEgEapdBP
	s7c/rsoSiZIXYhZxUGkL/d9HTsUSAYo/FfnV+FHATOU89QKHLEI/Sde/pSFEzT7n
	m4e2ds461LJ1SdSgjZ/AILfkTGbGJBcH9uTPFq5aXeghIX/h6BrHZxr+pOR3pkPa
	u2O36w8IOsaXyyhGx5lqRdCiffKgSYB5zX+w7OKl6R42KdjZ+vxodYMHWx9WXmig
	uk6AsQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfcwhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Mon, 20 Oct 2025 13:57:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33da21394adso1262368a91.1
        for <workflows@vger.kernel.org>; Mon, 20 Oct 2025 06:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760968644; x=1761573444;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qIJKOvCxcYruswbUzq9fr5+Eh0foHybSIq/Oms+hhQU=;
        b=oJc6oZEyLjhP4MtUaXUG51yTpuaNllwiTYnneeQibrtHqt/mE9h8u5WdePxnlfmSyi
         LtDSbtBKmTKpGyZQX5iM+XIjys1TVk1VUnXc79WvyqbVK2ngIVjj3jy1q0MlMH26hyVJ
         Wnk+PY9Efou04GQ+6P3j7G9ubWC2WDlQll+do8a85grOXBVSUMvLkb5JBA+tntErSUi/
         6sA3IrilWzvBY2DuwQq9HCwlmhQ8t97feUwEp9JxrBIH3VNKwV7bDEW1hPije7Vi1UC4
         8MWQu7oriVtYdqN2BWTETVmWs5WWwQfy5Ez9BZ7bg1s2O/+75yvH4wZ2I586OYuofy1t
         6kfA==
X-Gm-Message-State: AOJu0YwOga2IwtnRs5Bjz9FbVDlcGrrb6JbV1C5PJDICxsv6mVIxLQ4p
	tAF+JStjJtEL6l0CJo/+AcCyq3KHDmVubc1xkt7hhbc10m8VmeEROTcPBhyzLYBdWlQxydVSJbS
	lIl5sE4Qw4IORcCBNy3DvboHFBY86PBox8uknQj/21tgKGkP7zMah36VrQzwovHe9coAlnSg=
X-Gm-Gg: ASbGncuWJwVCbWYb/5CGarorqp+YQe3xRMX5krM0kN2xUKlrN2j4uD/2soB72Ryxabl
	z3C1ZegH54eiwUcGkVKoOV1LO6kzk7F1sMO93jvYK1ZCxpuf/fEKjQHZwxTQO5rufKVmbwwdnW/
	L4Odtnts5OWinLljGOA8hEAHbdMtPrnxq/nxTKHV1yTr4+hd+FnFUpzMfXOXp5XVMcf8riYFQJg
	HBWSFrujHMroIlgx6Ib5FbYS9Tx5xQctLFP6KD2Sy1tnZiHm6gsG2lscLqA+bkEMJHQJ73Y0+Ft
	EarHm9dr2x5Q3oBPPuQqG0z8rflTM1dHP8mPHT6nH1jgNOYoBsMuyFfuM9yUfqBADoeGmUOfNy+
	B7qY7rE4JDrdueLqqrHNLNb/i/BCP/Ps989BwO0gsNKyvz/1LOUwJqu7KkAY=
X-Received: by 2002:a17:90b:5386:b0:329:cb75:fef2 with SMTP id 98e67ed59e1d1-33bcf85b45amr14364027a91.3.1760968644485;
        Mon, 20 Oct 2025 06:57:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA4meynf7p6pqVmPtlHOuUrwOJeYLX0JWNpq3bEBdJBjh/Gd1Q075D8zivONKd2PftWkqGwQ==
X-Received: by 2002:a17:90b:5386:b0:329:cb75:fef2 with SMTP id 98e67ed59e1d1-33bcf85b45amr14363995a91.3.1760968643935;
        Mon, 20 Oct 2025 06:57:23 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bcfc12fa0sm4940456a91.13.2025.10.20.06.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 06:57:23 -0700 (PDT)
Message-ID: <e5f7d87a-e170-4cad-98e2-5e492e679c21@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 06:57:21 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ktap: fix minor typos in ktap.rst file
To: Randy Dunlap <rdunlap@infradead.org>,
        Clint George <clintbgeorge@gmail.com>, corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251019202053.285723-1-clintbgeorge@gmail.com>
 <ba148c36-8778-425e-8c94-35ebd708fc80@infradead.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ba148c36-8778-425e-8c94-35ebd708fc80@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2QsUkIl-yN9f0wJZxv1qu2DTH_A7EGGv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfXwQqTB0qTJxnj
 Yg5h1cGdzrofAs6OaPOUTXa0mMFBHXdQr38zb9MirMekal9pndA9BFTnSXe8GdSVnU4ejiPu9cG
 xLSHg0rLzHcKCNbsJY45W3iOvVHwU2wqBSO2iIa80uSPI49+eDbcTJZKThVF0alrTvuFM6/p3T9
 Y55w3lRA8rUChihUVBbfMlnn7LtV0mIqsYruqHF6yUfHoWkqokxbehh1cKuvGQ6zF0kLPj03E0W
 UcKk7jaijK1mCpZGnb8Hmf9GDAZmqLWfMhqvD5+XNlRfMppqefVQaEvO3Ig3ZjGYrECCUbORzoi
 FieQmQRyJHxE694kAVRpVopZUYFiIV/mGxbP/gjYNC4pumyb/jk4R5FLfB0DmNKcE8rrMRkwFZQ
 wdIqUA7jVh13+mHVJJGvgp/8rmIJVw==
X-Proofpoint-GUID: 2QsUkIl-yN9f0wJZxv1qu2DTH_A7EGGv
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f63fc5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EM1FLKRHAAAA:8 a=pm9b69XgcQeHAuKcwUUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

On 10/19/2025 2:30 PM, Randy Dunlap wrote:
> On 10/19/25 1:20 PM, Clint George wrote:
>>  TAP, or the Test Anything Protocol is a format for specifying test results used
>> -by a number of projects. Its website and specification are found at this `link
>> +by a number of projects. It's website and specification are found at this `link
> 
> The '-' original line is correct.

Randy is correct...
https://www.merriam-webster.com/grammar/when-to-use-its-vs-its


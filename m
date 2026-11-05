Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883381;
	b=p0Pso1CFC6ui2yL4dOU44gUs8Y57+BVrp2tpbugLQsS70WwrmDd3IG3cDDiwG7f2EEYQ
	 5LLLKZLlg57RbHajoyoDrXeuwldFmmeyZdnV4uqbyR2dSRr1OtPue27TPejMZ3QfFXrTN
	 bvNSd8NEfFwWtMvfMko/7Sua8R13MD3tYViW8NwlrNh+w4s5aWjbhuE0Q/DQCmWfpTM5O
	 N9XXsRQ5Mwk6wzKwV3JDdsGZ5pKayOGH8+SxymEiegQmF7RH5YFsG6fDnBMXGfT6Z6T2H
	 fuvvTr1+DR43KiGP+50XW+xAgwkBsvE0+atgoZMCEpsR+qm+OgAKK24axlduKLBNcaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mp8LFAjwhhq5Xhmtcgd12xfKJEM5jsLCLg8QXgag6Ms=;
	b=efOH8rhUA0qZVHh8CMNuoyk7uCshQK6zuF5qaQqek71iP1fhHYCSNqVcc9YviVvFVgGQ
	 SsXqePhPmGco1FGwddRhOwTB8mzdgEZajfcnXrQ2P4GCNviYCOxmVWNDurFlyOqANPMBG
	 3LwI2MDPUubWtC/iI3qwGq2MEHsq71Ogs5mHA+mJSODwrJj8ypLhyMbqxR9yqJjxEVZm5
	 UvUcWbYqmkZZyG8AfmVo7Le7bMs07Q2D830GuCsp5Yz7uMlpPUu63yBxIFdleg18CEY1V
	 kS1/ONBojQM7UZrxOy0X4N7ozas3l+u/uJcifdOzZGzRDflU5d2usDqFyVcUEu5aljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPttzf91;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLYz0HRP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4596D606D805
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 12:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4596D606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nPttzf91;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gLYz0HRP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5B3LpI3193490
	for <workflows@vger.kernel.org>; Thu, 5 Nov 2026 12:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mp8LFAjwhhq5Xhmtcgd12xfKJEM5jsLCLg8QXgag6Ms=; b=nPttzf91CBJQARfW
	bkoo/u/KooN77NvzUJcL78Z+5zV9UhBcykZ77b+f2vavvCFZrs8t+NNmFB+Rl7ib
	Lc1n3CWTljpRRf5TZVqOzf9a9vAcFK7zfZNMCRs9Zwa+UVcj7pqiFyphc9+7aUP/
	W2cLcp0FBEwi4xFwCxCXm2qVBK3haVqxiVd4G/rz52RYs5tjxMxvqEYo8pbtyoUY
	Yha1//v56ES1/jcT9yZSeUPhIP4HsB500NBlEhMWBSOvDHFSV1DJJiR9SfW781Yy
	8ZCE6KJ/UBLlmqHsZVg0yz6+m995dMt+mrpqscg9FXEV9e5J97FdEDUMaN8QT3Ti
	l7Q6Mg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdrf3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 12:56:15 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99089f9591aso216163241.0
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 04:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793883374; x=1794488174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mp8LFAjwhhq5Xhmtcgd12xfKJEM5jsLCLg8QXgag6Ms=;
        b=gLYz0HRPCihT9jRPBR0k5DjszsIpORsbv21MwPudWA5rkP1xivSPqwknRV0Fp4ykD9
         saxrgnsDU0tHnd/zReJ7U6hbNvzrN62sBlw0ObCg+F5uWkmK2tgiVSg799lcLIdJHUcn
         8oduvo2tAEqAaCNja/ingtIHhwl8d1kAu6D7len/nlp6bUU5Niq3JzXU8kIlbC90m4o5
         ZsmEkl+0eUqHK1PJtFJk5TNu1++UQWAV/ImlC/oOkZxxwsk7oOJMM+g4Jl4MhGZPXTos
         zOOvS7J+55pSkNoS16CTgZRXAFg1iiRWTSatTXwNJMWflSWCwnHOO7ddd8dOE9hgOCVR
         5RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793883374; x=1794488174;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mp8LFAjwhhq5Xhmtcgd12xfKJEM5jsLCLg8QXgag6Ms=;
        b=tOVIYrR7jTdV1zYDnBvCDGGX/Q9HOXJK93D+eMp2FGvvcGh2yWn//W8DAaXIwdD68Z
         eeEAAae6Mtwx5MZtgxWKBFyRz7Qla4Y+2nafxwbzD9J0sFeYfbCYB5lPEeI0i1PmuDSb
         nsRBMDkHuY7AXr6aNPw8Epf/68hJgNVD/LVzg7zqZAKdo8AxKJVYStjvZjL9Bi2qmN7n
         wSPGsnjMmBSshL5zykYaxWPQkkr/oKijy3psDNgf0c+Bj+/RdffW6+BL0+87jtngyFev
         CLwya3vpj/5+Mk+jOERtEujAFMJgeTeY6YlgPI/CjEJ2oG7Tj6wZjh3gFhXAWVDDFBsI
         HIHA==
X-Forwarded-Encrypted: i=1; AKwUvBzOpEgnOfqZr22XCWl0i4xfc8NQymASlNY4qhKlAHxx7YLsigkzOO36Juabrfy8Zx6+FxbOBOz2kBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cyHCluPwNPiITVUto72HN+ru2WPq20UQm3vzB4y/24sLlQ/fy
	a6hvVClExALdK7kTrixIzlgeQJ5Q74FC7xVgmBI4dPeMmcNPSkz8UD4W2yVwRO/GOCTiJRnRzs4
	e3B+FIUHtJUUv8r9nvqygiknr3UwWU/fCfcwBQnqvJCF3fotv3g6IqVnJsHFep0ERHf2BHVw=
X-Gm-Gg: AYBFou1yGdaRd1Rmz0qrC2JMHKsPxv796HAJ9qTpAlX51IwCY/TRKDo0njNTm7aB+gv
	xRjD7t/YBrUvv3ROpXMjovT6lKgW33bvIlDY4mYVU52raSPWEOEs2ApJEuMp96vVUcPKvHRp2Jb
	R2EVcT6M2i71lp1CU1AnHx5CfATe5KhjWy3PhvpKyWuGgXkFjP8wfJ++rmj80LNM4iMpjzbY63X
	emqr0j5QQbi/dkFo30weJvtUkObC/oVHuyWDDqZUnq8LaV5tLLAeV6gic2HM5U+FeiE6qKI6IYr
	9GI7e+6OGh+vPMyDe/2owAMdNI2R9GEjqGASJCAe+fm1kSYjYBQwJRn7pAJqFJQ3ltawYR0a0t4
	gmp7Uaj+GB7RSmWsk80hrz/9ztS1tCjwEt9NzaFnfBYRe1lyKPNc8BxXQMTLP20IXtiuVxPNfww
	==
X-Received: by 2002:a05:6102:50a5:b0:7c3:9b8d:5124 with SMTP id ada2fe7eead31-7d072c2da67mr7071564137.18.1793883374412;
        Thu, 05 Nov 2026 04:56:14 -0800 (PST)
X-Received: by 2002:a05:6102:50a5:b0:7c3:9b8d:5124 with SMTP id ada2fe7eead31-7d072c2da67mr7071534137.18.1793883373890;
        Thu, 05 Nov 2026 04:56:13 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed45d71dsm9850513f8f.36.2026.11.05.04.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:56:12 -0800 (PST)
Message-ID: <a0a17a91-02d1-4c54-8989-ff483a3300ab@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:56:10 +0100
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
 <auxMOdmFYDYGjqa9@shikoro>
 <8abb2394-5210-495f-8420-a02bd16ff466@oss.qualcomm.com>
 <auxmMrANvWIJi94i@shikoro> <auxuPmopn43wisF9@ashevche-desk.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxuPmopn43wisF9@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec7cef cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=yilv8eCvnXgz7CWaK6cA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: k9_NKpn9d1Ku1-0TorjjUS4RcyLDcELJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfX4lp01i9oNWZK
 ctOQB8LZEZE88TiQo8TIvfJTpZW0r/3GzCVJXA+RMYBg842aE/fhriS13621gwsvExtgPqg67OY
 R4PL3P0QO6YZT327Eh5zO8oSTv5JC80=
X-Proofpoint-GUID: k9_NKpn9d1Ku1-0TorjjUS4RcyLDcELJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MSBTYWx0ZWRfXzYISNmPUeCBq
 TIiLXERi3OxAGztvqJZhh95J6F1EkqH8NGnvdHW9VmQHAIfAZTvmvwPoh5fzCSQJbn0bttlNdgt
 qamQ+0dpEGGKrENlKW1iBdZA8kCmWK47AVggiHsehjPeP4kmNmjdF2f5Y05mU5Ya3xRCzwZ1QsP
 rgzFF9YHDQtL3w+hmgheHNH4eHORRifdxBd9moFIeuSmNtHTYRVuF/IcQPRN+i2GAnWkGZgk05d
 hikyhUl9vD3WXCHZV1CURRcdQEmkJPGPOMMuvYkTEjljfadhhy8ZlUnsrOVmwvvAdVv6rI4FX+7
 zg5mgjons+ACDLJnOa/QcnTvpp/zJTtl8IKpjDOpZK5JBU+EuTAg0yxdN6xClwpyHIYzGjFabN1
 thp8l0muZOZxdcM4Mln751e2E42eGLSY0rQ0wPc3SN5MkCAZMcxDgblk7IS16Mp/m4e+/sixOdQ
 7dCS9I3lEosM+TWJGZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050051

On 05/11/2026 12:53, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 01:19:14PM +0200, Wolfram Sang wrote:
>>
>>>>> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
>>>>> found acceptable according to the Reviewer's Statement:"
>>>>
>>>> So, for the SPI patch: if someone spent time and reviewed the complex
>>>> core changes, but only 2 out of dozens of drivers, this would be an Ack
>>>> according to you. I would, however, understand that this person doesn't
>>>
>>> No, and I explained this in this commit msg. That person reviewed the
>>> MAIN concept of the patch.
>>
>> With that MAIN concept emphasized, I am okay with your reasoning and
>> agree. Before (I cite, upmost paragraph) "*the patch*" could be
>> interpreted as 100% of the patch (including dumb driver conversions).
> 
> ...which may lead to discouragement of reviewing such a patch.
> At least that's how I read the point.

Why Ack instead of Review would discourage? Are you saying people give
Reviewed-by tags for incomplete reviews only because they want the credits?

Best regards,
Krzysztof

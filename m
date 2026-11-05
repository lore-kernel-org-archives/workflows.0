Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869049;
	b=rR+F2RWGG2Zr1KI9NuR1NzlNNojdx0sb6xKuXM5chhnMpA/7Vl0foNSTkDTeHKzxd2zk
	 PysfygRnFgDQr2+n88rCI8WEhdO8CcTrjUg6sWHHahj2JWTODQ+wSudDyXEM1fTXk8CzC
	 iCCw1nfFy2w1mGuE5b/a8LLj2X/M24gWfx5BhoormvpbKp+zTTUOpPdFjKcA2/RvVmOVO
	 qFIzeJq0pKiOg5GQeO6yLv6iS2UGIQ70l7iTxyTgrKrv5MbIQtRwC9y4rtWUzyb8i2BwK
	 s2Elja+zT14RdqAIOxpoLLh2UD0VhlaL/iHlAomS1kibrfHo78HkCuV8MJER5ppqIpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Gn8Oew3AHih7mVIt4H5TB3wQOxpvcVD8ncYOYQaKKug=;
	b=XSGeyxnxqAvmSYPdj4kN2pu6xR5/Etn21UQq2Cjd+K6X2ZZXG6yBw4qjQi2R/HKYB18A
	 PDqvMIP45rBc31/kClUlukod95R/5fFucCckB3LdrylqCV0G1dpsb1MWUKVJQloh9cRXV
	 yzUvgXPv/Y3J+5cRjvw1F1/7pm/B2XlsaRophyWBhpXvEUjVj1r2l0MwkVlWF/RzeZSSG
	 nGpy9IK3Oslx2kVQq888UNm8pWly0YC6kqMn5/Rnsre4zLk9fzsAfZMX2ZGuazExkS5ce
	 gE6wO+JJR146jblxzGQtnYEPADjZRBvxD8rqxFY4aT3KMjTU9DG3r0ePlB9zULhomGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOPmgVes;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke0TpmVH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909B6606A31B
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 08:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 909B6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOPmgVes;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ke0TpmVH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56Tu5o3073301
	for <workflows@vger.kernel.org>; Thu, 5 Nov 2026 08:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gn8Oew3AHih7mVIt4H5TB3wQOxpvcVD8ncYOYQaKKug=; b=kOPmgVes0FT/yCNK
	yULt2a4HiisTgKDYXq1pulg7qM3DKg/K2//R9VSgyLj+lbdCMeiqb0NIWAqCXJ8B
	4bwxYXaAQMbJwqLCb5iRw2q8nB/D6Ffp9LlI4/rB5LhFD/PTeKZ27UR04Q+Y2nW7
	7zIzlNGw1/7DDt9lkmvR7lE9HL4XPbIbHnMBjDVpYcJy6ACBOl2cyKyAe3wFX9xm
	51o+ywJQ2PAJ+T4TI3sqOJJKQfYKdxPQrx4NsqV+wquI4P2/wvbPb2w8IZBlrtk3
	eQX9eENIoLcWPFekGm1HO+EjsCZAL11jwJXPU0oxlzRBSgyJcyWQX7jBbuyEwvrR
	q0RNtQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq8sam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 08:57:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9907de400a6so343412241.0
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 00:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869047; x=1794473847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gn8Oew3AHih7mVIt4H5TB3wQOxpvcVD8ncYOYQaKKug=;
        b=ke0TpmVH4hxD2jxfrrW7rZpPvszl7dTRCWMJppYEdZHMTo7+DoKCRi3nf9Je58ydM8
         oMeGN78ttVjP1Yg2EU5HW51pcZQSrRm3aIcCzbBWWX3Mwn9FFzyMngP1Ntp4gsixaW3K
         yvIV9NybT8ENcaJm4tJNE6QNSC1cx3KHtgW82q/4ynvSG3fuy3+DUkIUySpIY5UKdwhk
         oSIYORD6KHWAvfRNVQVVGrkBIn2Ov0gVRtFydv2uHDPLmoiP7GAmXyg1IKnoBtB/wAuw
         vwqFtMRmmZRM91U0pBrKpaIeduPahxWXTaCjlYT4xcrTrFWu33Xp6Z2Z+PDvnh04Gh16
         SC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869047; x=1794473847;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gn8Oew3AHih7mVIt4H5TB3wQOxpvcVD8ncYOYQaKKug=;
        b=YPdSzMTeatnmMpoYlV1CZWszOasmo+e/CLwTaCjQmVYKrFXaSjIbR18fUwaJ/EG3YF
         50V0lmbPakCvKTDm78oluqO/uAod++ecXUk6CV1wVMJfuASEGpVx3rJ97BSHHDusaTyq
         VQ0z6GqsAUhbyr1kaLRJOtEwJmh9Ivia1Wy2m7RruhLtYphEfd3GxMlJapdu34Acd1UI
         pC4jT7vIm/CDw8yr/vA3bwhaFKl6Q1O0ptYvDk4b99SUJJizL0s/404ULFzxTAbCXKO5
         PCVf4LTTonEHa9NmY5j5WXRpSvmQBzKYlXUgi2Q6d8kKmMBkG0+HtNRFoOZK3Bw7hbb9
         idSA==
X-Forwarded-Encrypted: i=1; AKwUvBxUCYjY8w0/hJKAtZN2l64DB7eUT5hJrbsc91rZZRNJ9GTcKIVCeHyYjqMXAw3dDKdQ3sJU2KSR2tY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LVmYdCsPXo7piEZxh5DAaSfNEGKrPMweiNtBv30IEjnSbFiRN
	1+AFvxFTSo/X9+GLrmRJI5kjhAZiPhbGO3JAw/TpieNb6CUdkRmtz5tuZYH7L6h/TvHAuWwtcBx
	UiyEwTmB7dr0awbRptkOHlRA6dDdwhpnxZ/euASQemzck1MMAvPmwg/xxrjK/6p0=
X-Gm-Gg: AYBFou0EXSQ3lwf9e9F5reuHNL1c5/nar2k283HXueH88ZENZUGaRtjNdmiFg9OK6J9
	JSAe10FwrSzDWcIvSyU4wIyVrFTT4wect+mAYYCJ4mynBmSbZfrjQxxny6EggO5bpiN69lYaJff
	UdClNHroxiMInkUq1zsxX1CsA0PRuCx1fvLnsGJ4ozKQxM0xnk7SpP50Y7c9qXvXEnlPMR58R4S
	wBX5wSHx65vmfeRFvPEtFD5WfY5iBgVMTGsGSic0g8St/NGt/OvGfAa8ELYDWnDHyuMzVGbbLnL
	d4vGwTR1rBS8SsVAeJ/6b5RzP1OjgBjFZFh6gDidQM7gUde3nO3sh1qQF0kjvoyQroBnfmOSwvK
	edZ/Qv8ejvsNwrfWUa70v/2z1/SFlUCEOZaPC08FZXGo6X+VacyLOJqqlUGUAE4V28oLU22R0OQ
	==
X-Received: by 2002:a05:6102:148c:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7d07223f482mr8900185137.2.1793869046788;
        Thu, 05 Nov 2026 00:57:26 -0800 (PST)
X-Received: by 2002:a05:6102:148c:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7d07223f482mr8900171137.2.1793869046198;
        Thu, 05 Nov 2026 00:57:26 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea181079sm9185094f8f.8.2026.11.05.00.57.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:57:25 -0800 (PST)
Message-ID: <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:57:23 +0100
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
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxDTdfMVS3yazCk@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX7LGSahUNh5HC
 zqWbA8w0bHumD2h7RJaC4cDAjNReHUtprRtN2ox+xi6dc6ljnRm4chwMwEWN7k4usLVnu8zei6t
 Pyv/DkYsVxPlc77cB2WoZUYLrvqnw9tVBR7m+FUbyhuMqDOBrBrCYiKXVrjTXqvfn/OqkeJ4aXW
 Y8tbZUhQ/zKJCqxiKSceCV2JBUFjLm0nMMLllbkB+Lr4aSHk+1dkeT+OIiIArX1J3J+VS9fh9AG
 4/VylUmDbcPN/pmSb70UvfgABh+q13OW3m3juh7eJbYbKG09TQgueDpa1xS1xbVyI1+bYvxZzY2
 1KkgJhP6G5Z6E2RCoEylRobW3aMst8YGypB45L6dwoxCmEdLG60dZxDEzDWbSp/E8jNlJcSbuUB
 piyTGYXDzsagtSOQait/L8qNqEJvqxjVnCI13E2R6vATaRTy8Wee0/8d4SdB1ejKGfgWyqOis6w
 FW402MZLD3pUwvonLSg==
X-Proofpoint-ORIG-GUID: RkncP4GVdW8xj_EUu85_Uh5oIK77X5O7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX7iK81jPdzH6Y
 lQwZY4D+fANdRag6wynnHqYJaCiZ6U7G2quRAPrNPKjyeCLSKx6+CUy5otlIF46P/xo57+CLBC4
 UQtDzHXVCkLhyW2Pi0stPH2L3c0l8Tc=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec44f7 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=QIhr-27iAAAA:8 a=6PtPwRdlQZAe1Mv8CAcA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-GUID: RkncP4GVdW8xj_EUu85_Uh5oIK77X5O7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035

On 05/11/2026 09:50, Wolfram Sang wrote:
> 
>> +If the reviewer checks only a piece of the patch, leaving the rest unreviewed,
>> +then more appropriate is Acked-by tag or adding a "# subpart-name" marker
> 
> "... is an Acked-by ..."?

ack

> 
>> +after the Reviewed-by tag:
>> +
>> +	Reviewed-by: I Did Not Read Everything <foo@example.org> # bar, baz
> 
> How about being more specific?
> 
>  +	Reviewed-by: Driver X author <foo@example.org> # for Driver X
> 

ack

> TBH, I think the above is even better than a generic "Acked-by" which is
> basically "Yeah, I didn't look in detail but the general approach looks
> fine". Which is not what the above says. The above says: "I didn't check
> the general approach, but assuming it is okay, the changes to my driver
> are correct". If I get a couple of those, then I know which parts have
> been reviewed and which have not. A list of generic Acked-bys will not
> provide that information. So, actually, I think even the Acked-by should
> have the "# subpart name" once only a part of the patch has been looked
> at. Ack/Rev is then describing the thoroughness of that look.
> 
> Do you get what I mean?

Yes. Part of the Acked-by tag is actually unspecified Acknowledgment and
many maintainers do not trail it with "# subpart" name. It's well
accepted and known in our community that Acked-by can be for everything
or for Maintainer's responsible area, implied by MAINTAINERS file.

Reviewed-by even with the "# subpart" still appears in person's credits
and reviewing entire patch of 700 lines of diff code (like Frank's SPI
patch) is not the same as 10 diff codes for one driver.

I'll send later v3 with the changes from above.

Best regards,
Krzysztof

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C2D3B3C1A
	for <workflows@vger.kernel.org>; Mon, 20 Jul 2026 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578059; cv=none; b=X1SiFpWx2BzLvsmF9YgIL/gO9JDi6rPdd61GUZxiv+apgDEoLFklfVnbwfLGufb2RpjjVYw2NlvqPMehR488zkLgMJ2qGYvxVZWCJlJHkyqBI4x4BLXWqhg5bBSiUieSPadAWvPuv5poSLrvjZUlEohZotplTdYsbHTUvHE4WY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578059; c=relaxed/simple;
	bh=LGrdWEuT7keK94kqeuSq7Las3dkp3HeUocwXD8AFATA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNmhN7A0AwNuM51+nxACATBW4XWSv2cCswrhY4pLPaYQJUWUzjJH0qkIP/Flj83zbCeiDIZeduu/52Pt3BLqUslN8mWty7oVwV7SlECyansijRcIqkzhkP2QyT0a17XdYI//Gx0RhVi3R0+kHzwar6GHDXH3bNjnFYJc1w0d83I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nfiPyBMp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hfaY4TNF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nfiPyBMp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hfaY4TNF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTkms447482
	for <workflows@vger.kernel.org>; Mon, 20 Jul 2026 20:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/gU0Bjcz6gevLpZPMsPuntoWQiycmw1kGtp7ffZLM7s=; b=nfiPyBMp3MeNE0uW
	HisocUGunlVdZo9pHvtKTtLUcBUsjludYPPrnv16PJiZgiSj/zHkIR91+/udzKjF
	VCwYsOBCHNjAOKreHdZVm6Uxtso1q49it60Wc0yvNksBFqyzV/l6JvPgPqLkLd8F
	/S7ciGh9+vDMWrlYBO/XgfqakKjbsUYW6W8MwFNJxee5zfgQxQ+PI8aIPD1STJxt
	cXIPgzSFIpd49S4eFHPPjq8j4luZG1vti7Sh9VuqUd/0sVRQeacVSEcq0tj0vWlA
	by/CGUUAhVmknKMbYw8eXh5wGDj5E00DJAG/kBYzn9CcVjRluEfhXoKuNmSugB4v
	WLiRoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5rpn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Mon, 20 Jul 2026 20:07:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so90918811cf.1
        for <workflows@vger.kernel.org>; Mon, 20 Jul 2026 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784578055; x=1785182855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/gU0Bjcz6gevLpZPMsPuntoWQiycmw1kGtp7ffZLM7s=;
        b=hfaY4TNFLN1kF/qKzeMYtQLgzXbjr67/Sgbw41HpFansNDTXNorUoZ/AVcHqXI485R
         jBcqNaMB5tSPHXiskcvXdtvPY+kqXFnKbgtMmpj+A3+ZZfuQ0BC76ug3qejW5439Vvad
         Q1ROoyx7N/45XOCvQo8+9VJ+zhDDgIx2+nHxJekMwLs3x8DVdVsq2/DYvna1Y8OzpZou
         Iu4wUdoXUKoSbgQQ3Lg329NDTYAC27sG/sfnU6uD2RCB2ipZJs6gxg76UOFeHXrZPDvR
         DwlG/dTIYh14JTVcNfzTJs635pWGfJYDPgJr+j00UyabORC2wIrMlGBxc4FUt7w/b373
         ykcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784578055; x=1785182855;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/gU0Bjcz6gevLpZPMsPuntoWQiycmw1kGtp7ffZLM7s=;
        b=p6Bjh9UoPXAZff+w1hSUHPdb/9I+t9p2FmDsN5xjXl6CcFFN7M+l1wWx4P1Z9UnGnH
         HXOpE4M87TiocT3oQTMKq7dqE6+dn2Vp1pe5iwQ92Md8D6SaaIsO08r510aoaASnuknk
         8rq82b1i3tW09pCimlR7zbB8ZXHZLI4dQvnMZPoAfnW8grX3g25N/Rnr6XvzDGBd/Ooo
         /woU94nCoLskf6XZ9mtQ3K7Y4a31GLPVuB7FOuEoBjJ7jdgv1LpBkM9E0s1m/4NsnCYu
         GJtWTV3muXTDOzzrabCSWyLR5d1+O6Mfu3+2jaxuoANZUbSJs0pbeSXUTGsLZifiIIZD
         Y5VA==
X-Forwarded-Encrypted: i=1; AHgh+RrwzPGvG3JIeF6JzyUnf0wzCS48zDaX5Hazn76zVa8ZaRBxBGCUZLMoDdrPmtmW3GzSIPzuxrAkH8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUfdg9vBmW0Ub1HlXbUJMzfi92sI37nMcHrvrxvYGdwtNtEKPp
	EoM0RCDZbpxwKuHNqXRSqGusJp/2bsx6O6ytjW1oDLHiBC/uUdM89NDbm6woGP81NbmH1D0a1wg
	z0AyPj7Z5pDbg5mLTUkt2+W0JlyyKmSI/2eDJpkfyBg9x5Kuld4e1UQPDfT1xjok=
X-Gm-Gg: AfdE7clMT5SmqHsMmVNXUVjF+3ZCyvcHPUhNHaNRZzragbT9r8NhdCbts2f1b8lxUOc
	MVRimtxcp2N69y9VQjEwvsshz/Bg7L2whQuw/GUyjxlEWrYDeuH2MQBFu3jzgcIrZhtLabSSXaJ
	cYndT5wc8mIe5veOHrHfPXMMhcQxYyIcTiqE7nykHPdzA6O+HZLI9OHskXdwikRbWjBHDLqavmb
	DrXA1ZyMix9yP4dDXUEt63sIllHJwIOfNNpDW7SFxPITWdWspP94a5wkkTJNplpIVelS2TJ3JmZ
	j++YAdOlPoj/zRR3V9Epj7ItqPpqxb67ABth2YDrBzoVTlrmNVfgH1SdIbJPbBcmr3Bgb1JpLUY
	HNFexgewRACwwkBXZgt0UcWmvViF7EA==
X-Received: by 2002:ac8:5a43:0:b0:51c:25da:903f with SMTP id d75a77b69052e-5213eb784bdmr146931801cf.59.1784578055135;
        Mon, 20 Jul 2026 13:07:35 -0700 (PDT)
X-Received: by 2002:ac8:5a43:0:b0:51c:25da:903f with SMTP id d75a77b69052e-5213eb784bdmr146931361cf.59.1784578054627;
        Mon, 20 Jul 2026 13:07:34 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ee0086sm35375670f8f.30.2026.07.20.13.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 13:07:33 -0700 (PDT)
Message-ID: <3e797ffc-8cf6-437c-81f2-9f82d946d042@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 22:07:32 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: dt: maintainer: Add Devicetree and OF maintainer
 profile document
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Saravana Kannan <saravanak@kernel.org>
References: <20260720184040.9870-2-krzysztof.kozlowski@oss.qualcomm.com>
 <87y0f531uz.fsf@trenco.lwn.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87y0f531uz.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f5FbtPCKumFbm6YVZ1iYatLycQeQBCvP
X-Proofpoint-ORIG-GUID: f5FbtPCKumFbm6YVZ1iYatLycQeQBCvP
X-Authority-Analysis: v=2.4 cv=e+U2j6p/ c=1 sm=1 tr=0 ts=6a5e8008 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VHDG6K7AFjjWFEZ5LykA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIxOSBTYWx0ZWRfXwd7mOLKTV6tL
 zBE0xG8VV249wnQt5aVNR5uMKBj+69LVjF3G8VGArm+sztNGfF8emDQ/4+UViSynwARbUxCWuYf
 AZw1TTEIds0V2oDCWZ0uwgN+WFxsryc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIxOSBTYWx0ZWRfX5Lcn9tHJz1zc
 SXhmKeL0CaAyy52/BGISCCU8HJIrzRPyYG1cRbTbBYi3wKySLFd69sFC0bld/tNSnSYk4PopG/o
 t+v67Tqu3Ahh739qdPTC8OrqoWbmNiA3qV8EDdvHhbZxe0/mwTHapI+zqMdAKgtYgTXtVU5GRGF
 MNAwRcPmCJkxHAaHNOcONJVM5CDEhxpm/09Lo5yZLCG1uksgWgav9DFmQSi/wDpBaXYxD9VlWhj
 2BKIQJrPezXnkgzTgqRQgv+Hq8BU6e3hkoZtPFhQEPnfHcveTmGzNHS8gXpPgo+Ss3nArLXt6xk
 N9Dq8z3FasecmdJ5+e0BLsZyu3r0UsH5nQFmQ4SVs/p/SAE4WAHqXXtk1Ln6sfKtxGyVETxdcYa
 4T7DgrcUg3xXuuesf8i4dIHCcE1ScKVGwqetjfEecIv7UR620oRX8csMYqiu/n37+ZRyWFMNORG
 2VPd+gMZBdOy6Glcchg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200219

On 20/07/2026 21:19, Jonathan Corbet wrote:
>> I expect patch to be picked up by Rob, after review.
>>
>> Changes in v3:
>> 1. Add also F: entry
>>
>> Changes in v2:
>> 1. Correct typos and trailing white spaces.
>> 2. Fix order of P: after C: in maintainers.
>> ---
>>  .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
>>  MAINTAINERS                                   |  3 +
>>  2 files changed, 73 insertions(+)
>>  create mode 100644 Documentation/process/maintainer-devicetree.rst
> 
> You'll need to add this new file to index.rst as well.

Hm, where? In docs/process/index.rst? None of the other maintainer
profiles are mentioned there.

Best regards,
Krzysztof

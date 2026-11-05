Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876366;
	b=q+lJjEeaxmn4A8Ch5hxhq7N4f4iNKFjFKCg59iQ0LgdU9dNStyr4ORCGRHM4fxcuWHoO
	 GrKJb4jdrtnlkf1jIQaoGxan3CbBTSW2mv9HnGoj/gy6JB0T4B7QiuXY23sWlt+SgxA6J
	 s4xsuscLvmi9+0ZmRumFbwLOpsgscjicCb6rgwrmg2CEwVrK2DfF2Juv9vxD1E7XSrRbO
	 tyowWnWHhtBMueZChGrcLEGkpHrJ//WhZbZFT1cv9uVp35btjj01Qlx5qbES5jEgGi3BU
	 /E5OMFeu46YYjqC1yrcoCynNp+2DAipnyobJ98ds7pqkcBg5uDQQ0c1MWDT0pYYF3Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GF2rHSAQzy8g6x6FDaTDZtSR+2fPpehxPRCgCv+MWLU=;
	b=x+yqrJxWH+dE/Ohc0GIYHs+invtwtuKzHPiWpx5RBQhySwWdISI2Hzr8MLjPLVOSRvNr
	 6/M0lEpIZhf9UZsc3EtYkyHYKxnXNiUYO9l5d0pvSBr5Ix5kKBj0YX0SCHqb9ZfYxcHOO
	 DO+U0ORgZvIr6j2OtWRVtxDQ77tJLG39GuLy+KA2ttoyIDrKan5DOYGJcchmoqdcgCQi8
	 4diHvxFvpoTX/cBUv1Caod+nMo1FJvOQaTMM6WxCjMZ4dMs4FuDJQoAQ3X4VOffQ7qQBR
	 EIUNl7//iqdhmwdVWd864WBXeS9LErQwFf2CElGCDnNbOnNjQhjMyJnbA3w+xtPvZ7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4GdoMnb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+1AAZFJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4890606A329
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 10:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4890606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4GdoMnb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+1AAZFJ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tdn61028306
	for <workflows@vger.kernel.org>; Thu, 5 Nov 2026 10:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GF2rHSAQzy8g6x6FDaTDZtSR+2fPpehxPRCgCv+MWLU=; b=S4GdoMnb62wxLXSB
	bAOFPC9hrugpFg+RHlDw9JO2vsYxFB1c/Dn5tN5E9Kd88ONF5RZ+fqO9Kg69MB8H
	TUQVjD0wi/YB4jjF04txb+nKxjAphrYffJR8jddWeya2zaTQ9FEa2tVA1G+CVwVP
	JWu4E3pdP0JgE7LFKlX5l9nWG9WflODdIGilAcll3FBx/RiiTiHekbatUzw/Nr7B
	kbZ4fbi2Yy7nW1xCBejKAgAdJ+GgMzhqdc2fbPdxKDhVLorBvpkgMhVyW0SgmtPf
	XnOYLhGH0FYfFmETF8THooXbH+SkM/fK1mtEyQwYz5UQR8obgcv41q3kz7AnqcPP
	ACVGyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9csr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 10:59:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so524330385a.1
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 02:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793876363; x=1794481163; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GF2rHSAQzy8g6x6FDaTDZtSR+2fPpehxPRCgCv+MWLU=;
        b=N+1AAZFJNoACFTzUnpe29S2yAioy8EBUsQp7kZNysQc1OOmLHt1bBIeDE0N1PKM13z
         U7rg724t0zqxKeXfLxBMZukTl0X2mF1nGeXZfn4m2a/xJQgHbTwHUVG7mrWjEiqQ41bb
         M0vYimbtqCBrvO6Gf/nA56Q4ytdSYrysR1g3O5PPBcSm8OEYpCnAYCW1Uvf8YvhJwzax
         27PjT4iXDPN6xu/d8e36wW0O0a/6cQSdUIdAxV48LMSNrr0t/2HoDXTS/lnhe3rwrGRa
         vmtp3k5Ia0FCt1u1lM2VdOhQnraPYiCTrWW2Tpgm1x0lIiz/ZPMNhXUziyouyRFxltI5
         80Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876363; x=1794481163;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GF2rHSAQzy8g6x6FDaTDZtSR+2fPpehxPRCgCv+MWLU=;
        b=mYUeZogoqnY/VPL18mQaqSOXQqbcCu9dbtbfchGc1Hqnfi7ru1kUt41vkRW5/MUBsx
         Stm4htUxkcP9foKkV0zMslwvBPoPZSDpPwjfdCGKawQ0sOwSbTD1EFTFw721yMgFJFWT
         LcoNF/uTX3oZZ1D02gAKlQqJubnXO9N8t4jYTR4XqLv0aSjkWtD7fS43/0KY3654wtj2
         ZNrpDuMbsfiQRv8axaAk6/OMK/tFTzf31wUOEKjsS94q6+k1mlbhEZXW7NXOBVAqVpJK
         n3FnyY3jO577K0DOwkojrFseYeW558UOd2PBVb9VrqebiuaFbcsQKY/Ou4DC202JUQzz
         W1Gg==
X-Forwarded-Encrypted: i=1; AKwUvBwnjMJpxMzRxqTV/Dbb1714L+1cJZazGldwLamItj+2BQ2wsRBSURmvdjpfazPJCIE+7wl5GxCOcbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PT27GRcOxXK2766GnRzxV/IbWh345fOJchKU/gTQheXVBZoaG
	+cHEzPCgxtxI1D+28fS6H0a0q2w3/Pe6aeJqoxrWKAVogZDm8VF42wl/u0DbvFoZX+lKUwJ3bub
	qrp2aLOa/U6j1pYoBN+hyxVOQjflIQBEsMlAsg21+Ck1vYp3w26y3S/r2joeAAKc=
X-Gm-Gg: AYBFou2/xarV/l3qcisHMAEqbBa5YEMWCDANvagu1l2rs/9IaUefzOEgT7PTEfrdr5H
	qQYrwKlNbHsxNrK+eMaekHDHWUaz6SMel74KLs6nPsr4acbhwNM4+/xuizXD5dAW4q3y8e/mEfL
	Tajn6jBzLlvNITmmdta1EsKo+7NXPmbH18rksz2+bSXA+ThRcSMf0sERxnNFT5jR9lobIRIeweA
	skLW6gb9VjA3EaZOImEw4EPYIdSEMWu1GIj8su/oUXewM6yoyaN1bia1HiGjoVNdjR6jVu6ZmRf
	hMh0HjeCqy5ACiAUd1blhlf+o0WMMtBoisVlCe88zItDAKDatGIwwkirA4kMUARvMtWm2nVruQI
	PUa1OWz2FujL6lwtQx1Y2GCYLjy3SOD9HuNbyVGJQXy8wD4FE4ChVeqMjnaiy+5Dbg48osSHC6g
	==
X-Received: by 2002:a05:620a:1a0c:b0:93f:1ca9:f2f6 with SMTP id af79cd13be357-944217439d9mr3169291385a.77.1793876363029;
        Thu, 05 Nov 2026 02:59:23 -0800 (PST)
X-Received: by 2002:a05:620a:1a0c:b0:93f:1ca9:f2f6 with SMTP id af79cd13be357-944217439d9mr3169288885a.77.1793876362488;
        Thu, 05 Nov 2026 02:59:22 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm168704185e9.3.2026.11.05.02.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:59:21 -0800 (PST)
Message-ID: <daa0dd4c-58c4-49a9-ad2e-7823b6ab0863@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:59:19 +0100
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
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
 <auxLyK65Ycr7R9Un@ashevche-desk.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxLyK65Ycr7R9Un@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qS2z2IZ9LhOQs64c4eGL7O3MbGfuZNsw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX2MtZvBdjGPPa
 OZTRjAlp1hK6mkrz4GeI5lPWhnGVwYeZdNmWbBC9ii6NFFcJHRIIxog7mrB3cHFJKOjxLpt8d30
 lz1xHE5nBRWMNEzOw9EJT4itrYL8stY=
X-Proofpoint-ORIG-GUID: qS2z2IZ9LhOQs64c4eGL7O3MbGfuZNsw
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec618b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=_kQXjUI6ka6CN9DD65QA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX+Wi54lVscU8m
 yevcK2vhYN9Jzyq+n2wTQdkhJumJkkkNMKFcmgcvgZvIs2ADUmfv4p4SByoC7y4JLQI0c8VRIgd
 4+QhTgwSovlVZcngRe8gYCycAOCGqOBj+xnPUOPYIBV6y3SLoiEphxrkWPHy7tlLjKU16omXx01
 BhyZ4HKX2BG8dDf9A1lSvm4ReV4GBETt8hOwb1Xx5hrS52Jbw/ipFNfOGJV8WEyoPLhSx3BfF9T
 w2dstd2Z5z3SVepODjVcVSCQHG+/5sIRbAI8SXURM+n1C0P1yrL6k8/713d8mfsbx3iDjXErU9e
 soMNV3BpmKmuBZ1XdLVkj6s7iXFRsPO+iNYJrG3elO9QH9dXq+mAzgvdCLuY7mbpADKJS2Y0g1G
 UD3QxpcBFd9VYknfQDDxBNWaIid4HeyXkSNwwxzS4bHkYHdMsPEXSy2jiKsB7mxlhhtoLw/luze
 ok9UXhDbBNvlCmrKDeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050043

On 05/11/2026 10:26, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 10:12:00AM +0100, Krzysztof Kozlowski wrote:
>> On 05/11/2026 10:06, Wolfram Sang wrote:
>>>
>>>> Reviewed-by even with the "# subpart" still appears in person's credits
>>>> and reviewing entire patch of 700 lines of diff code (like Frank's SPI
>>>> patch) is not the same as 10 diff codes for one driver.
>>>
>>> Yes, if you want to spoil that, you'd need to introduce
>>>
>>> 	Partly-reviewed-by: ...
>>>
>>> or something.
>>
>> Ack is for that, no need for a new tag, quoting:
>>
>> "Acked-by.... user may not have carried out a technical review of the
>> patch, yet they may be satisfied ..."
>>
>> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
>> found acceptable according to the Reviewer's Statement:"
>>
>> Note that there is little sense in reviewing - as in statement of
>> oversight credit review - pieces of patch in context I discuss here,
>> e.g. one big complex rework combined with updates of drivers. Who cares
>> about the drivers? The complex rework is important and should be
>> reviewed, but people skip bigger picture and put their stamp of approval.
> 
> Nice, and what as a particular piece maintainer I should do if somebody
> created some helper somewhere (not Cc'ing me), waited to a cycle and started
> cleaning up or refactor the drivers based on that API? Basically I was stand
> in front of a fact, I may tell NAK to that, but what should we do if half of
> the kernel will use new API, half will use old one due to disagreements on
> implementation, naming, et cetera? Rb in this sense tells that I have reviewed
> the refactoring part that has been done on a piece that I'm in charge for and

Do the review, no one questions that.

Statement of oversight, thus tag, how expressed in the docs applies
though to entire patch.

> it looks good. Breaking the flow or behaviour might have been done on the
> upper layer for a bigger number of users.

Best regards,
Krzysztof

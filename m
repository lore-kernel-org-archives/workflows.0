Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870842;
	b=CTu2qXECKesAo49kgF+3nwrmAb6AvfTdfrHJ2WFzdYqGtYwlYDFoxC2gEtFem9YU4tSZ
	 VDS67g1Eyq6zQrzlKEA2/kGwSKP7wBS1QehXvo5g4rFHkvNaC3wjSjmEXex1RP68flJE0
	 V79O4KtE9SB9zg0i4xeKjPrsMfZrALSXAkd4pb7BT19OW+n/vTvS03v3fBv4Ui823K5dl
	 4AaufssRHMpZgzXosoucVCqWXbj+utBDRKpXG+3j3W02JET5cVyhvfhtzfAOYDem+hpfW
	 pBSoXiJZwkMolaLTdpolf2lLyyf5TXGGN9gk5aTuYzNb6ogvvdGA49ofma8d5dbBctw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ytR0fdJPKit3Kj/kkRqRiCyncHkrktFeKweM07Oge0M=;
	b=sS8MjeRr/DcL+GAsnSVidj3ZAg1588PHPwgHPX4/l9rmOkWQljQV8L7nO40jQpLzn9ay
	 Maaumrm9x+4uBSSsq/LaUd6V7E0+6Bq6rdnyuH57sObuO4UQe4YGBy9rNYSNtyD7O6CWy
	 eSAP5oZC0WujSYjpGk9Bqr9bslFySnRLiMfhhhQaF/xCTSXIzKYk4+d5vh63WDq8OM1DB
	 TUXGSmX6Z+uDvN+ulgQq85tItoRi9fyoSplH4YKfcrhrPKYc5AnzvksUSEYLOGvfi4+zz
	 0XJsidxJoiwXAEQZEGPhQLT5C0xS9rwIidsZnOG54bbOl2QQKV+Y91hfKT55z5XYE+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XQWkIk+O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kpWRrQpd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF14606A326
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 09:27:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FF14606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XQWkIk+O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kpWRrQpd
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UFX73074135
	for <workflows@vger.kernel.org>; Thu, 5 Nov 2026 09:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ytR0fdJPKit3Kj/kkRqRiCyncHkrktFeKweM07Oge0M=; b=XQWkIk+Ok7/eQfi5
	IaDYWuVv2yxFE97D8rHVvTqHT0jWQeZHW3rPFIxlSYJDzInXMpqJhJIkegdHGT2f
	TsJIloo+4iGqv8f4lu8OlyF3QYn//kWLeTXBlyzlql6BuaTkkKuHDXIj5K9myXK7
	A0M6Td045rgUbG1TOFX1D1YH3m/YrvcdGT6tfPvsgERJXwyexNgLfLC6/jbXjSLk
	o39sVMbxbeTOjgIQP3oJ4QqK2jT6mng8CPq28tpYSAAd8oAaSDwi8BcCcDkK5L4H
	inYJ7kZtjv6C7Ig//5ADu9o8MalmfputOOkbGNt2gg1d1ANUl3vGdAIDeYkKsSwQ
	3w2nfg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksq8wju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 09:27:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so419669785a.2
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 01:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793870840; x=1794475640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ytR0fdJPKit3Kj/kkRqRiCyncHkrktFeKweM07Oge0M=;
        b=kpWRrQpdKnw+PwtLSXQ+4apLLYG+UokhufIDlOztnE6IwtDPA8x+xUClCo1hWb/fgD
         Y47xHGhhUq2YG6paGiptAoG9weMdkGgT8roWDy1o71ZyYWfYB6IPVAKUWParmt29t71P
         AzWtEnLPxcBXSdhSpukOPF7DqXvoO6iDFbkYIXA7b0of5O51FOGmJmEJMaGArCCgfYFw
         M2VlT8B3iXWcT38I6GQiQz/hUecsZOoitt1lnfktL46jKo28edRM8TtsZGcy2TcKBrKl
         aKqiIYoEk64iiyEqu5inHhTFIP4TqS6njIb2NBmpU72rgbFDBaAeI5ENnLYy1vk77Ecc
         K9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870840; x=1794475640;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ytR0fdJPKit3Kj/kkRqRiCyncHkrktFeKweM07Oge0M=;
        b=1elh67eB1wnvX7HtKaG+VxvsaF03/ncPqMdQXM4V2jlx1bTew/5/Y43zjKP7mDsEmY
         6wRqZbRQaa+Ntn8Nxk1BEkBmrK0MpmVsMfmVX2JJc1Or6zXa4mLfQRGdi2mrDwm3BAdV
         ErUcfvGJAncbCeOGxMHRX8o2MUvqEg/GSiYemJCKj7W78p6tWqiFJgUCVwN7MSjPWhDo
         Boc7CscbJFG7LdjKUZGj/loiHx9M/pLrk+pBq6qsLM3IvRcnj4tPtg/VJOLEl0ZcwGyH
         +5C+vB4XKWpvgOKC/SvW8PCMRipL/qM5UJN+hHq5UG5LLblg0Ido20X2QayxmKHsB4yb
         1/Lw==
X-Forwarded-Encrypted: i=1; AKwUvBwXvwadR4UkBf3G6WkyQQjGfPNyer8eVaGGBcMIUV3kj0qgqzlfWeisB8xouCARxP3i6rxHeasGOog=@vger.kernel.org
X-Gm-Message-State: APuU4Z/A4XVH7NXbFtG9Bw/wIUQx4Iu6f2lgX7kVR6Cis08TrzGiZqVu
	QBV3989We8PgXY2moF/l9uEaPurKZlcaZbeiwH/jxrmDEMJgy0OZ11psSAr00bE0JaEMTBD6ZAC
	aXEM7RicL04rZD1dNFeqKYD4J6kojXKXass2QTLt3INJa0M46d7uh+gQKfQxxZMTgF1rnwhw=
X-Gm-Gg: AYBFou3cNXrVHPJjnoReLmU1ahzJQOEsP/1nMWJcbtAOrXuWZBzLQjbizEwYdcT8Ewl
	9JCpwCKfCYxj/BtsyBvwNrS4ssFRFF3+/OoBS1xVg9kQQ+CwF7HV/xAlI3CXMqkx0jWU3RzThC6
	sCZRr1cENXRNxoo4d7SfVCLHkKRcJ9kBV2PsN9hQKyrboWE6aKyxaxflsZV22ClPktVtLAtAKUg
	v/XdM+19pOu8m/NRawWcfIY8gpfdXPUJtm2gQ/4dd2l+FQCQQOr766TzLvkTk2ZcjxDVoeny3hx
	KSx6Qj7Ko3YLHJjaXY1LwP5dBHdoNzl1fv+tt8LZxt9/UFKXoTfx+8WRuStVlgARYkAVjYu8e1e
	KX+1QBJQ2CUCN0OI0p1rGtd72yKXjrDGDX57XCuVxCGuXZURUapSnnL3NY215itYzqmOviitUNg
	==
X-Received: by 2002:a05:620a:2994:b0:939:4a44:5f99 with SMTP id af79cd13be357-9442156ab2fmr3139966585a.10.1793870840289;
        Thu, 05 Nov 2026 01:27:20 -0800 (PST)
X-Received: by 2002:a05:620a:2994:b0:939:4a44:5f99 with SMTP id af79cd13be357-9442156ab2fmr3139964185a.10.1793870839833;
        Thu, 05 Nov 2026 01:27:19 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm57928185e9.11.2026.11.05.01.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:27:18 -0800 (PST)
Message-ID: <b4e49e68-306b-41c9-a374-74cf7ea5a7f0@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 10:27:17 +0100
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
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxKHF7U1x_Ozwpm@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNyBTYWx0ZWRfX/cHnG9HuKqY/
 FVRk5Qaj25ykATTgoK8o+tM0aN3MU67UBIhLyCSENxPorwCHI3to+KqgibWV59zbMzGsucmpEwb
 Iz75075XNA9aB8zJ0oOoTfFIj33oEsnN5wCU4HTzr/ytXkGh4umx10d0y3XxzFhLkhHbuXrFfJl
 Se+CNL5WBOjsuyYDDzz7fHGuWDDHSqCZjhSJJxRlEj4cHtxGNOEvUEK6JsJ1sOwC9UJIc403XBD
 9GyILjdA7jfnGeRkFuxT+xjRbBpqauH+LSrDA8tfQ8QwmXATjQX1YUBz88gkS9cdkHfMxKQHp3/
 ASubApH3uzC1Obt1K6Jt19uefT/r+pGead194R1DlAIWjID+U81Oryz3JLKxYBymj/xy0yorKio
 qzxC7wOngRG3BJAaUYdmWzo7ki19NHUnUS8lG6n714s9xcDJfRm1MfbQ4KoP++U8XMKaURG43bK
 1EbijIwWAjGW3Qq5fLw==
X-Proofpoint-ORIG-GUID: 5ZxZkgY4tXtNUntz7WuVfrM9VbR8B8cg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNyBTYWx0ZWRfX9QcXAFrLZJIp
 78978ZtIAIHGu0taB9YjwN5jbG8nT2b/ohmH5R5XQrvSWMWgX1oat07fptaY9ume4XPwnsqm4mN
 vAF+v90XE1BFM0L9OMz3QjMS8bLFaTY=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aec4bf9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=I-sYKaSChvBqotAcINQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5ZxZkgY4tXtNUntz7WuVfrM9VbR8B8cg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050037

On 05/11/2026 10:19, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 09:27:30AM +0100, Krzysztof Kozlowski wrote:
>> Refactoring of driver subsystems or some core driver parts often come
>> with change of the actual drivers.  If that happens within one patch,
>> people giving "Reviewed-by" tag only to piece of the patch, like one
>> driver, and ignoring the rest including the main concept of the patch,
>> are not really reviewing "the patch".
>>
>> As explained in the Submitting Patches document, the "Reviewer's
>> statement of oversight" is for patch as in "entire patch" meaning:
>>
>>   (a) I have carried out a technical review of this patch to
>>       evaluate its appropriateness and readiness for inclusion into
>>       the mainline kernel.
>>
>> The sentence is explicit and complete, meaning it does not allow
>> implicit variations like: "this patch or part of this patch".
>>
>> Reviewing pieces of the patch while ignoring the main part of it, is
>> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
>> not be applicable.
> 
> I strongly disagree. It's all explained in the plenty threads you have started
> on the Subject.

Please provide arguments. You keep responding "No" or "Disagree", yet yo
do not give any technical, discussible data.

You just wrote:
https://lore.kernel.org/all/auxGom0XR-Hax9b3@ashevche-desk.local/

"No, (partial) Rb != Ack."

to which I provided several quotes backing my point of view:
https://lore.kernel.org/all/00390a20-7630-4066-9779-06c8f915a176@kernel.org/


> 
> TL;DR: As a reviewer for the piece in question I have done my part fully. It's
> not my issue that the piece is bundled into a single patch. We have options:
> 1) ask to split (and review as standalone piece);
> 2) add (partial) Rb with the pointers of what exactly has been reviewed;
> 3) ignore (silent agreement with the respective subsystem maintainer's opinion);
> 4) ...something I forgot?..
> 
> (even partial) Rb != Ack.

oh, here you repeat.

There is no partial review tag. Please read arguments I already provided
to you and either respond with counter arguments or just stop repeating
empty statements.

Best regards,
Krzysztof

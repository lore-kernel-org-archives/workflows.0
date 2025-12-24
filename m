Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E533298987
	for <workflows@vger.kernel.org>; Wed, 24 Dec 2025 08:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766565516; cv=none; b=TAXkJiOBZcbgBFQ5kTdL5qFoxPtWP+Xdg4WW+ww1rJVJ/7W9IeFgUvOdTDzBga9xw9is/93JsbsoiXFVh3r2mCcnLxhwqjo1W449VCLuJBsIX2zdfFrCP8dmFNR+FxnlZSgXg7Fxd5/HqiBNACUbo4nCnFpTlA2EXrGvMypBuIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766565516; c=relaxed/simple;
	bh=pk0XS/DyAvk1Kec6re87YzIHBZn/1WBaX/mZ5bHMJ3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OwZvIFtm2NmXxu4Wx6YIAzK7GiRs/JwAQQnDhUxKGNjzzC5yQJlgMalDVs4Tgv2Zj8XGctUlowGnNGvcsPHG2Xs9qF1a/hFaw5nq6n27VYTeCiLOxiBAcuqG8KaGbfAL/34yitGYpDLpJeE/9rczAQqocSDqqjA0n3BZ2WcOVkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qd0k5WqG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZNZ9ZaS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qd0k5WqG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZNZ9ZaS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2YGEr461339
	for <workflows@vger.kernel.org>; Wed, 24 Dec 2025 08:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	glFZCrXoWzuhHKqjW3tJJJ1r2Fv3OKqJtPkBd6Z/kF8=; b=Qd0k5WqGYTqfatFd
	hmzcA1BOY0CE030rbP+rCT+A8nWWyKo22JMj8PZQWk8MjbRP0jqysDcr/wHGaAmk
	szF74k5Ov75vSCVzPrIC+MGYYKz7eur9poKHuL8KVFM+I953GtUoMajurJdIFRYg
	AFPUFKYBEd0vfafV3KcOFpSYdJgoQzpB85XuN2umGCdmEXbFo5MCjgz4JDqH5GMv
	Ts6JG2uydGfFkBIpZUukP8mYvfehKrBxk0F5Gzqe727YoB8aOWbW+sE6VLrywgqo
	9eCtJcye/7Ub5KWnu6eJsWC+ML+GMsjWA2QVavWmmFUA0p7fprCM9EMGCO39Rozi
	YoVtNg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8ftmwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 24 Dec 2025 08:38:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d26abbd8so155868081cf.1
        for <workflows@vger.kernel.org>; Wed, 24 Dec 2025 00:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766565513; x=1767170313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=glFZCrXoWzuhHKqjW3tJJJ1r2Fv3OKqJtPkBd6Z/kF8=;
        b=iZNZ9ZaSgDzIOnC5rhE9G5DoOG4LII7M6KAvPMuQsVHd4x4xSRAQfresbE3sMCssGy
         TFcqC3tHbYKWUOgR+KIdglOaWEeTAYsanxxEPSdTD2Ns508JJ55KzILQF5J093Wc1h4U
         vTpewNCOqd3BfRU+pYeFdJRISmJcFRxOipU5H936/U2t0SXpPK+XTTxZcptDdLjAiWDG
         +IMeLyNfYUTnb+j9MUQkes8hbYtRVm1nuSlj9Ca2A+3lV8Fvsn/x7pcd0GhGQqqr7aEg
         T5SBVURxeWr3D4vnbzMsIvbln7rLrFmO57pU2H66BfJSvMSNVS7chAQ1+ODsMiumW8xb
         wXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766565513; x=1767170313;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glFZCrXoWzuhHKqjW3tJJJ1r2Fv3OKqJtPkBd6Z/kF8=;
        b=Os3ti/fdQus4RsOS+F4izV5l1ka3Z98Qij46HxzHdz6Fk1/wHAPjXVh4IvQxfA2oMt
         447x8lQ2AxSnERNmebFgYeL8dsrKlDE6MUCRo4aZVCPhyp1OO/T3tkIaocczV1vMti0d
         1847Twtnor51KYKaZ/Yr5wEs1O5jixqy+xI3P5QOekq84nxQreLHPR9dVTrU+Aiermw4
         d9yQu5c75jRrcsnoVKxKo2zModGCHnTPGCrwXkXWAh0GZK8n+W60lY60KGxWY3TYhvdM
         asi5/Nom8lupvIAOCpaKOrNrDhv3+2PkBUCjxsrEkmm4pwM9YYfsCzOgNxkncAj+3geB
         ebjA==
X-Forwarded-Encrypted: i=1; AJvYcCUccTaJ0FgPIhlLgkBfCKw+sHRTewAUGZ1ReAon6/stVs8Te8QQwb/D6GDF6TcEbtl9Fh/R3XfLO20=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCszAblKjNr5T5InB7JI96uKH5X8lCHntHNVXuGML24IZflM/L
	BG0mx9U+g2kB8OPvH8qGvGjJziyuTKzfDyhu7eY0D4ZP+yhKlj05MLW9+tzXnfTduc/uLaFesdd
	gFkcRDxl6hNR3R4EPuSWmAgog0dwht1cCuusryTMv83Afrt4+eqdGw2nvAZZcWHc=
X-Gm-Gg: AY/fxX7yJfWJT+66hhntYR/LZsV+OdaAEXj0M5D5+eUBgP4vlf9nZq1hvTpPW/+P+AB
	xmJ17KxaI36bo9rEOoLyJWzD9+1N7CRDUmBfB9E1OED6kNTU3kw1ICz0UqGRgKy6J3wMsNVEsw4
	gbG34u7abpJJ2JBDlL/Z3H7l4t+UwrZNrLGWn8C62nWOAuAitfHeSnjmtHv9wMUN36JvLhuyQPU
	S4KjG0y6STxOehH3oj8OIUTRzKk34Fqdozkuem+Hje01dnKyYpL1aAEkO6L0+RqSLTgwd/7xdai
	OP5Azy31HGoHs9f+INQS4ADuxar0VE0z56cjOS90R95DPLKcOvgpb0SFTGvazfkFcmd5W+mK+or
	zzVaqkvevYUa9CIFgtcKyWyvkk+5meZ51kmeGQzdDA4pJuP2ufdf3qXf811ROwjDIt+VAfUH9bY
	4=
X-Received: by 2002:a05:622a:8:b0:4ed:da3a:c0d4 with SMTP id d75a77b69052e-4f4abde3937mr251257601cf.78.1766565512691;
        Wed, 24 Dec 2025 00:38:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOKhJ1hbaLKHjn4nSfm29Zo5mU4EvJVu2XZpEhp/RRCcKQctHUj6bYiP/qOmkilnCwRxVrlA==
X-Received: by 2002:a05:622a:8:b0:4ed:da3a:c0d4 with SMTP id d75a77b69052e-4f4abde3937mr251257371cf.78.1766565512198;
        Wed, 24 Dec 2025 00:38:32 -0800 (PST)
Received: from [192.168.1.27] (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056731sm16062618a12.8.2025.12.24.00.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 00:38:31 -0800 (PST)
Message-ID: <9a62f4c8-e707-4a0d-a374-4b0f4168f47f@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 09:38:29 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit about defconfig
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223150256.GI9817@pendragon.ideasonboard.com>
 <f858ea0e-24d5-4cdd-ab57-dfeebe67ae7b@oss.qualcomm.com>
 <20251223162756.GA25011@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251223162756.GA25011@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: --VCKwwWuBp1j0k8bg9NQmty2EsfysNq
X-Proofpoint-ORIG-GUID: --VCKwwWuBp1j0k8bg9NQmty2EsfysNq
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694ba689 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DmthBJwFisZfL4ceMzYA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3NCBTYWx0ZWRfX6D3xZaXaagva
 02smF9leacWzf4apg/E+cYppZik3HvLb9UDqKuf8xLGtiBI+LAcGmfAH1GdAaUtIN5GCM+fcAmy
 eVOsM2ylYV4T/8XZf0lRiaAT5hCDsNWzhgaufzySz0D0VA1cTCatG/Kk/CG8o726XB6MGd3Wstj
 llfmw1C8o/VgiiXW62dy446egPY38Ov7+qU15ChNGOKXwOuOFxYuhyRrBJOklVHqQAn7JpQTpDC
 5vN6DfOnE3trtWwggY68GejB6OkOKKPxzAsoTR86WEN5jt8K9GfMsOd4NJCx+z662Ia+IqyBoYg
 GQAuNig+843JdVVwZPIkbe0rY/6ZC6RU22PQMzc+k2w5xx+ufQ/nx0k+0Z/D1mNfzRQ3xvQqdqx
 QRiomJPZywEUEtBDTXjR99pdu4HKYOOM1ZSMI7ugqJASoxjaipJNgvY1MGMfcZxH1P2BDQuvLHU
 +LB2Uca0sF8VFIhusHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240074

On 23/12/2025 17:27, Laurent Pinchart wrote:
> On Tue, Dec 23, 2025 at 04:32:02PM +0100, Krzysztof Kozlowski wrote:
>> On 23/12/2025 16:02, Laurent Pinchart wrote:
>>> On Tue, Dec 23, 2025 at 03:27:27PM +0100, Krzysztof Kozlowski wrote:
>>>> It is already documented but people still send noticeable amount of
>>>> patches ignoring the rule - get_maintainers.pl does not work on
>>>> arm64/configs/defconfig or any other shared ARM defconfig.
>>>>
>>>> Be more explicit, that one must not rely on typical/simple approach
>>>> here for getting To/Cc list.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>
>>>> ---
>>>>
>>>> Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
>>>> ---
>>>>  Documentation/process/maintainer-soc.rst | 6 ++++--
>>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
>>>> index 3ba886f52a51..014c639022b2 100644
>>>> --- a/Documentation/process/maintainer-soc.rst
>>>> +++ b/Documentation/process/maintainer-soc.rst
>>>> @@ -57,8 +57,10 @@ Submitting Patches for Given SoC
>>>>  
>>>>  All typical platform related patches should be sent via SoC submaintainers
>>>>  (platform-specific maintainers).  This includes also changes to per-platform or
>>>> -shared defconfigs (scripts/get_maintainer.pl might not provide correct
>>>> -addresses in such case).
>>>> +shared defconfigs. Note that scripts/get_maintainer.pl might not provide
>>>> +correct addresses for the shared defconfig, so ignore its output and manually
>>>> +create CC-list based on MAINTAINERS file or use something like
>>>> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
>>>
>>> I fear this will be another piece of documentation that people won't
>>> read. It would be more effective to implement custom logic in
>>> get_maintainer.pl (or at least output an informative message).
>>
>> Part of the logic is already there, but I will not grow that - I don't
>> want to touch Perl code. It's pretty obvious the tool should be do it,
>> so feel free to fix it.
> 
> Even if I knew perl, I'd have no time :-)

Same here. I see little incentive for me to spend significant amount of
time on this - considering I barely know Perl and how much I like this
language - to solve not my problem. The best I could do is to clarify
the docs. I agree however that this will be one more ignored doc, so I
don't mind skipping the patch.

Patch 2/2 is independent though, so please still consider it.

Best regards,
Krzysztof

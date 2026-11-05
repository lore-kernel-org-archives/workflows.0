Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876165;
	b=PROsfq7TMVzrlkuZzFJNp0cmDeFi3M5SiLqOT6Dxh7PsOac5PoujPNwRoMuYhH9hK9Vf
	 iPo9Cavrid8y8Pk3DcPoMPXdeuu/g9QrpiC7BTToaOZtZJaBv5RZQSxMyfaf9+V+45jhu
	 uRWZKcQdL1MVsv0nm+lGxNdKnlSl2+Ft4tuv62C4dmIT0vqge2NN2BChdrAfE0Q8+Q+v0
	 slsKYRXfInI0GFiHGs3UxF+uPq5lSJE2JyuSzkAzBZaH0zCcPxQP2BXoPKey16zWniTma
	 uBhiAcUEkbIGLNQ/7r/MLMrhOsHtrds1cHV333WUBq6KnhPy5W1+FRpvT1aBHwsB5cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=q656jYSec5KrfK7vFLzGffTu79NdryJ/KHB2O3s05a0=;
	b=BLfDiIXf7WtxHoDoPDHGCK0rKtQA7oo5Zh+YiZet3U0QNjXhuObXZLmnMF63nTUg43xk
	 uuiIAHZlqUCAmBVdVrgz72n8Cza7c+L1SvRhv8cJLtUweIYltLvvjRgt1qjNHARZytf1Q
	 mp/dnUv2aXdTODHh5cTcFu8OlNhegPT1nbhJUbjiF4Nmq/x49g6qlM3YZolL9Q0z+FSL6
	 YHJyo4Lb5mJCnyJgxroTRYMd0J74YN/CVTE1Lyx9+CJtyOlSmk9LdKn9g0FgMG8FJfwJQ
	 L/F/jIpIxAn4FgbBbEeD3pbwg1lvsXgcsZBPmEPIXQjoLKf5Pc16I2+ifzdDF5ejOkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ogx45S8i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZZBk2eP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB3A606D824
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 10:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB3A606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ogx45S8i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GZZBk2eP
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tcJ61028251
	for <workflows@vger.kernel.org>; Thu, 5 Nov 2026 10:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q656jYSec5KrfK7vFLzGffTu79NdryJ/KHB2O3s05a0=; b=ogx45S8ikpioi48u
	30lK0LgGgBeGGT5RyPpO9J4jhgbzQgQ/3/Ph7Ffg0xyh/0cFJcLgvrAJ7cGekLEA
	N3FRsdORFOkGL6vBwl3Uc9Za+MXCYECkkgpFWOwOQC3UHI0d5IbEcBr7/2rP8AgS
	6HlUxCse8VuWaRlFF+PdomQHna6mrAJ293Y0tmpjRawc/UwCZ5RsGPzp2AV+Aqzu
	P7m3mPneO5erlT6/ZAYsSCqL8yBoZXQiUcEHtL1zBr50Ok02wJDjlIEicI+5d7mG
	5/obDX8pOunpQoQS2UgW3fseCEAJtFqiZ0dJGPdf2n7MyY8ihlg0X/ulC/03hEAK
	tZmO6w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9ce0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 10:56:03 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9905fc56b60so451195241.1
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 02:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793876163; x=1794480963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q656jYSec5KrfK7vFLzGffTu79NdryJ/KHB2O3s05a0=;
        b=GZZBk2eP6x+KEKw5uwViJtmzheDqvOkvIDTHXvsH2fbCCz8gJmAFaxaE48I/ZNAjHk
         12gYx575yDo6IdM8zPlYCr+HvrY1lKHrE35cRSL0D/i2mSJpXFdD4xd9hoDsfxutU8W9
         cFSMh9TmutJ2YQC4cdgYOVD2mjs4/5iJAzkD9MmLZmT0LrAH/Wm32TzI1vkgwZYjPa6L
         WRlSAWHW0N/M7dIr8rdRmwTvZd5hHkhhfAL0Y9AcNFi+hzg6C3ixOgXWgCnxyu4qB5XV
         Fk+qdlyMAcJd/6v8VNkIPGwhQMZMtvUJlDYJ9lbHNZpOHnC2vZ//zu5HAichjW/NYxJn
         F5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876163; x=1794480963;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q656jYSec5KrfK7vFLzGffTu79NdryJ/KHB2O3s05a0=;
        b=FAC3VtJNTZlw8qOldXzyrbsRmH4W/hd+6StWTXUAQ6TteMZm3UwBTNY4XchZnrnuSG
         OxrQqGHYhoHjXsZSEtv+r2axfF0H2JEGF/+IS14E5Qv3qi9HYhjpBVwGv6LME45HzOcl
         XnDNhTagZhZUqPhantPNSgu1kp2g7lyEsOXwAriXrvK5EZItC80nxSKRVSpHGIc4VFA7
         piQhGnOH9aNDmtVVXaX6mgoGitFn+J2xCAhv7wXYTC+UhngMU6S4oMT3+M04lTJZpE2t
         UbJdE28roCLn4wt2ZXYfTU/plvxbIvXnBoMumfgmq96gFGRtcy/qJCwUVUiMecysDS7y
         cSfw==
X-Forwarded-Encrypted: i=1; AKwUvBxkoTz0PytYa+lI/HqofIOKLQahVIXK8uUHSLfuD1s+NHUWwCCnpOerc1tbZWgSRXJkZ5gUXVlKCEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0jDI4S+uiwJwiIF3XGv2C5AjcZzKgEKYxkp10EeR29ThXDdpw
	Z1buVId50JHe/rEycY3pfgT48gHre9HwDOn4QS+A2J79UnW6YxXx2FfkrmfbxCS5eX2/SRTCHot
	gK7WLlrh02dv/KNecKT5kVMT5j6MvzFWn2BDZFYasU5UmrxikP+PM9sFTMCkaeyU=
X-Gm-Gg: AYBFou2kl2HbRSPxszzmfjjYnvCaamGHzP06w9sxpUvuHmkdMUKtYSV0QMRaCUpWtAZ
	Tj2leA9DpXojCRLmYf8w4v7yKJVlaWpB5E+09XrEgA/8YFU84q52vKbfPVv67vEkLSbAOIa1iYg
	JW4iMY9LbgsU2RQh2tsHgeSxBHcNs9u6SfzC9wgOtXM9SmRG48lSk3gNjpOBjVsd0dcpXMWjnrC
	L+Ht38SudDdlatcbNstGME5gtjOIYTLKW8hTbrzvDo70BBEEuX7tA+1/MS4xfmpgqy/cl3ICDlg
	/1fHu6Bx2Wb+Fcxc6Mq6zz3t225bsMGf+VqAvB4+1vSDygqvgyWO5d0KXWV2+HIJBx5U+9RNQwY
	+n8/CbtweBNQwexso2gLyXT+gVPdRbFlA3MmG0U3MQ6epwUe9IK9M6nUcEeNgUWVF+ybE6LrBiw
	==
X-Received: by 2002:a05:6102:6b0b:b0:7cb:be5a:c62b with SMTP id ada2fe7eead31-7d286bdf57bmr1198448137.43.1793876163124;
        Thu, 05 Nov 2026 02:56:03 -0800 (PST)
X-Received: by 2002:a05:6102:6b0b:b0:7cb:be5a:c62b with SMTP id ada2fe7eead31-7d286bdf57bmr1198429137.43.1793876162607;
        Thu, 05 Nov 2026 02:56:02 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1f100sm9483255f8f.46.2026.11.05.02.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:56:01 -0800 (PST)
Message-ID: <179b3509-7002-4437-965e-e0e47e59a444@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:55:59 +0100
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
 <b4e49e68-306b-41c9-a374-74cf7ea5a7f0@oss.qualcomm.com>
 <auxQ_ZYMHYJPStox@ashevche-desk.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxQ_ZYMHYJPStox@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8Jts7xTVRb0W-_AF-HukXhsOFMq_UhSI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfXyFO1awz09qwR
 QJLQiE36HeRcrOpOgrHTcXi5XjcJVMdJori5cMZWnAYeZzeA6qnfROmdir8hFfpBk2imPaxEneP
 BEgLC3yJFrpqxfrR8RUFsgP8jdu2qng=
X-Proofpoint-ORIG-GUID: 8Jts7xTVRb0W-_AF-HukXhsOFMq_UhSI
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec60c3 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=OeTRdiMGzQZ1hgbNYWkA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX1HR0Lour0vD7
 jAdMxTNRJqrEryf3gEMEAQ1KJZDe1oLlAYvDDYOI+Q/2OrXpmlc1H/MEInLJZD0XG7hUO+rmbU2
 wrOlaLxkgWCh7v0BUUMCSeXHRmf4HBB7z2jVKwTDChkNO92MDO8VyNlfFxSEAk+2srDnk5TJRep
 Hz4iWeqjtf0VTrNAptuAT1q/97IqYBPX6HgSvCvPaQJ44AwlA+rGoBVw8bkbNlqLHPpZYfXQgTP
 0fb7pO3mh8M+0NWZ4uOyBbSbD9r7fvI9rM1Mi6SKgKi6m3HgueElua8rwl9oqcGnI3SFSBGunNV
 n8yC3yk8Xp162xqP7ElWflrGWOVAHEQfHxidSkQyLeBuCxxKzuHetr7pRtIElhZYdlypCoYXrMJ
 gFBxOE/ia4kpTLozVWXQIwz37QOxu7PNahEGvOR03ZJTswakj5a58dpAeO5eobootlatgPwUV/5
 yrOvc8mCR/k9CMG3KDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050043

On 05/11/2026 10:48, Andy Shevchenko wrote:
> On Thu, Nov 05, 2026 at 10:27:17AM +0100, Krzysztof Kozlowski wrote:
>> On 05/11/2026 10:19, Andy Shevchenko wrote:
>>> On Thu, Nov 05, 2026 at 09:27:30AM +0100, Krzysztof Kozlowski wrote:
>>>> Refactoring of driver subsystems or some core driver parts often come
>>>> with change of the actual drivers.  If that happens within one patch,
>>>> people giving "Reviewed-by" tag only to piece of the patch, like one
>>>> driver, and ignoring the rest including the main concept of the patch,
>>>> are not really reviewing "the patch".
>>>>
>>>> As explained in the Submitting Patches document, the "Reviewer's
>>>> statement of oversight" is for patch as in "entire patch" meaning:
>>>>
>>>>   (a) I have carried out a technical review of this patch to
>>>>       evaluate its appropriateness and readiness for inclusion into
>>>>       the mainline kernel.
>>>>
>>>> The sentence is explicit and complete, meaning it does not allow
>>>> implicit variations like: "this patch or part of this patch".
>>>>
>>>> Reviewing pieces of the patch while ignoring the main part of it, is
>>>> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
>>>> not be applicable.
>>>
>>> I strongly disagree. It's all explained in the plenty threads you have started
>>> on the Subject.
>>
>> Please provide arguments. You keep responding "No" or "Disagree", yet yo
>> do not give any technical, discussible data.
>>
>> You just wrote:
>> https://lore.kernel.org/all/auxGom0XR-Hax9b3@ashevche-desk.local/
>>
>> "No, (partial) Rb != Ack."
>>
>> to which I provided several quotes backing my point of view:
>> https://lore.kernel.org/all/00390a20-7630-4066-9779-06c8f915a176@kernel.org/
>>
>>> TL;DR: As a reviewer for the piece in question I have done my part fully. It's
>>> not my issue that the piece is bundled into a single patch. We have options:
> 
> ^^^ (1)
> 
>>> 1) ask to split (and review as standalone piece);
>>> 2) add (partial) Rb with the pointers of what exactly has been reviewed;
>>> 3) ignore (silent agreement with the respective subsystem maintainer's opinion);
>>> 4) ...something I forgot?..
>>>
>>> (even partial) Rb != Ack.
>>
>> oh, here you repeat.
>>
>> There is no partial review tag. Please read arguments I already provided
>> to you and either respond with counter arguments or just stop repeating
>> empty statements.
> 
> I already provided you the argument, you seems missed it (see 1 ^^^).

The (1) above does not address that statement of oversight does not
include possibility of partial review.

Best regards,
Krzysztof

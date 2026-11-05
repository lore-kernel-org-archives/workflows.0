Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868858;
	b=qUhxcOf5CSRWZXw/QAOEMPhrNi7q2BJEVTA/YCaJ97bv3ITsTSziCRrJFqu1rPa8xDJ1
	 B65MZRAInnFvnqECu9kOxOqN4JjgmUoWTcSnTcqPKYua2TqnoLFC7V3V94V5+X7p66ZpJ
	 p/ZYfDTjeq5kZkBT0Huu1jYsV8IUMCrf05GpNZZtcPJMp8JeZsHgHxBbdqyMx/OK32/xd
	 eU8mSAkDOyNmZSTW+7gW48nSZs5KgJhVIUwb24uGolp9JA6MoGnKND5jAiwb1QUBrtPig
	 dL011AMgUIIRDkTcQLzDs0vtaerBursxWpGwPkU0Zb+oyvm0L+sqJKdQ92ZsD885jOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m6c0U2kXZv+b92GN9K/VAduIpfZBm5UMGcmej7J4GdQ=;
	b=B869pJ1bqSFDuA+iClk/JUVaHhNb8mO05Sxbt9lXZhCqoWOoPrL+a9jfWi3NSDioiX97
	 TgMgV0pGPEn0u5iuR/+GN+07cMmtmxdLrKQJ0/fMUc2m/TKdeF+4UxM8SKeL2yjNq4fZy
	 nA8IkcWmgj/oyYkiolpgu0KYDMe4DUJQrAFNluSRmgO+KbWaoQDL6XUZGygdn8MPOUPax
	 XeNtIY/XXGajpeaBThJht67/1PhkAALxYsLDbVKmANPEdcIINtef1aFx5uuFzLV1BsFkv
	 zgLQmcufze9y9NFGvYPDEPruq5pydbytwtcCAB8vK91+am1p9kqPvTZjVinfvVhX7rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oI8fiLxr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkZLQlkC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFE3606A31B
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 08:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CFE3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oI8fiLxr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkZLQlkC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UY9i595343
	for <workflows@vger.kernel.org>; Thu, 5 Nov 2026 08:54:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m6c0U2kXZv+b92GN9K/VAduIpfZBm5UMGcmej7J4GdQ=; b=oI8fiLxrX9MVAS2o
	GVojKcZn+LYdt2j0/vq1o3yz1VTl2gEzCu+CWyWWI2RK3zMZ2kz8U7eGRVaVrgBl
	rfiVD2cD36WffmRqnBwzJu3iHwgLxKDskHldqTaVtXOKmLf1tBeNbUfW7u0JnqY2
	p3IrV+CsrmrcIJh1W4r8w7UkIELj7CZYSzlHpCWwMmbBu7NWPTjfiieGMbUK+d/F
	dY9s5YKZyRpwcNRPIc7I7RSGr4uS6yRibEoJ74l7VOs3bjNQ1IhizlROsAE63ASR
	kdeFEaUdv9M7AlKE/uLVm0yVPhORm36lxrQbws411Mjc1XfL20MWQr2pTW6yBWo7
	pCr5ZQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv3jp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 08:54:16 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9984a7eb3ddso1382444241.0
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 00:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868856; x=1794473656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m6c0U2kXZv+b92GN9K/VAduIpfZBm5UMGcmej7J4GdQ=;
        b=WkZLQlkCpcLveevDkD2bv0zsY51xjyRlCN4tzF4sCp7CsrF+2yF84smKlfb5iXZLrm
         McXjy+KAeZm5BEdfeGDVFQZGIh+sRhtmHQVeSBu9+i3FS3ZSIShbNwqqqGg7kHrW8AG7
         gJSXBbSBGp1HXUP7tml/f3687k+4YNHHyjVr7VkQGxPQ4TiCLu1B4D/3i1r37DijhkaW
         4HdsaZdIiFEDTEmdIiHGmtVeOAT9IbHFEKXHjBXJLvkr5Q1XTxyzMpQATvjhSwdn+mI2
         GsckBUfyntcwCWD4yn4NHlz4kXdgJRkaSxEiBXc3sJGxidDiRM+/q7ic/Hi2qtyvhz2r
         Vziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868856; x=1794473656;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m6c0U2kXZv+b92GN9K/VAduIpfZBm5UMGcmej7J4GdQ=;
        b=XC02my5p/HRbdrCJ/LVRYG948JJANtk5m3RE78q3lARmrnzvlMYsScylh6wcSAoaPP
         UGu7LEG0YmNkyNGjPoQOxuqqOZT5RqYBhAVcHUKwsTPJ/g3DxD9X1/XLofB6CNP635c6
         HJx9lZCBoVcezW2X/GFGcAdoWWhdkT1tbpIOkVxTtLVBUerD/9Hh3yiAI+BsuFB+Y1u4
         ku3rrSGjMR1ydV0G7ER4daQZGtM9x84FNP8QNrwMyVOdfJCWJSrnbkrCis7Ji2ednQZb
         q8bhIyASVRUhI35l8dZyBXJyt6vqSEPX2oVUBedxIFYFG6xWggyAhEEp/nVOHDkn34A3
         oeEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQuEjILaNhBcJdJlt63MFovRubi3YlA9t1vrMnvQ3Eq1KpMgJrJ0v9pwNsf4VWGGQkMPMCEJ7uBV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YwettoNYxCig9uK46U0CldACuhHBfTIp3NApVd64XYE1kUGvN
	DwYanCr2Mtq0WVS3w5uSBy0ZQusi32n4X23hFEk1R8oFKgEzjEcXjxNSfy7HPD4YCKee2TsetNw
	dK/oC65YnVYg6e43afY0U8ODkB4IZU4Ut+ehNyS7SpgiB8wW/6G7N4YhItXQ8y8g=
X-Gm-Gg: AYBFou3teAWqz0tmhuc3hLQ5NyqFojOemVAOBvJxXxQXrBSt7yshPuaUzolNOsEp4ca
	DXl8YL2BT4Kt0vANzgL0YUUsj0ZI9gBbSmLacgjbxKRZfy55WECzYf8BZqjd9bABlvp+kyg/6JD
	Q4uoTY7I+SlFuciYa15tScnC/E+ddPcHWWZZQ2aE9rxFb+ytVZRfaKcAaZeZlx9OXe+Fv/3v/U1
	r4Q4h41gjRe0+OvNVpH9GsbOtiyFfnle7vcGYkSGhOpqZBb46LsaLWCMCroZ9BNJSWqfFWGSxlD
	fcUwFOv2xxB5WG4qgedO2aA4YJTgO2x1OUVYIXSKaW6vabVJ1FFdafQs9oHbLlEg7NjCywRQgRw
	z1xRND1RQV7HV5q19zSPg7rF7VEluZsLDrdJIOUE+BesyA3F2aEcnC+wYjPFviqILCJJn0Ga+TQ
	==
X-Received: by 2002:a67:e70e:0:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7d07277c9e4mr9077925137.1.1793868855877;
        Thu, 05 Nov 2026 00:54:15 -0800 (PST)
X-Received: by 2002:a67:e70e:0:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7d07277c9e4mr9077890137.1.1793868855323;
        Thu, 05 Nov 2026 00:54:15 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac1a1csm8603233f8f.12.2026.11.05.00.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:54:14 -0800 (PST)
Message-ID: <70a3eccf-2f4c-4816-a3d7-cd0a6708b5a9@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:54:12 +0100
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
Subject: Re: [PATCH] docs: submitting-patches: Clarify half-baked review tags
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104171744.439209-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auw_egkhHADKXL90@wyuan.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auw_egkhHADKXL90@wyuan.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aec4438 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hQWSXl8fteurQVfxJlYA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX5WtdP2RhXzn9
 Ps/Z9vpPhtMHaw5ZVz1ebx8RSyNdip9kXE0du5gTdE3cIOaqcfhH3jvz/alEPrmQaQTqJiMBvyI
 N0bkm6KzeZwoqTTmZ3Vdq9DnhnFkDbI=
X-Proofpoint-ORIG-GUID: lodWGxW896tVIWRaMCWz9KkHONpwHC82
X-Proofpoint-GUID: lodWGxW896tVIWRaMCWz9KkHONpwHC82
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX7dCbOQ4EyV9J
 5Iyd2H3yDReXPD8nP7gbdXMwfaGn8Md6milASY4Z2sVS/XCKu+plXSfBaKdb2pl50IhiJPONsJA
 80tTvNO1P8tL+PRcUScmmPKaenta7JNIJ6gHxe6uaW79g3pYSueL4QLOWsSHPYHwd41g0YsnsdR
 FH0SLR8uqrBxWpGl8KWrq/AD8ZuxEUumK25K3W3trPZ7tS/R7m/UuVlny2oHIyMcRb/rTTGNjML
 DbOXK4QKn1eASX4MDhwiqOqZAO7ouhObjfN88/QHHlFs4d1T8xs5hd13ueXc9mWUAMfeK43tqHM
 RjLNmPAIAage9Oc4lD9RvaLsyHKh6pvjvFjP5kw1N9qivcMB149xZtb59jUu7rUipUgqZE4Uyky
 PkRKAny5iOnv8LzJ4PyabMmtSoH6XYtvcpMTP99zS033SXC9r6WfyJCtmj+DaRMRqbvleok+8cb
 yMYvEjP/oIKvxoTSwJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035

On 05/11/2026 09:34, Weijie Yuan wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:
> 
>> Refactoring of driver subsystems or some core driver parts often come
>> with change of the actual drivers.  If that happens within one patch,
>> people giving "Reviewed-by" tag only to piece of the patch, like one
>> driver, and ignoring entire rest including the main concept of the
>> patch, are not really reviewing "the patch".
>>
>> As explained in Submitting Patches document, the "Reviewer's statement
>> of oversight" is for patch:
>>
>>   (a) I have carried out a technical review of this patch to
>>       evaluate its appropriateness and readiness for inclusion into
>>       the mainline kernel.
>>
>> The sentence is complete, meaning it does not allow implicit variations
>> "this patch or part of this patch".
> 
> Agreed.
> 
>> Reviewing pieces of patch while ignoring the main part of it, is
>> much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
>> not be applicable.
> 
> But in this case, I suspect that your "Acked-by" trailer will still be
> interpreted as an ack of the entire patch in future git logs, rather
> than a partial ack and/or a partial review.
> 

Which would be fine, Acked-by has that meaning and no one really counts
Acks or tracks Acks for any metrics or patch quality purposes.

Best regards,
Krzysztof

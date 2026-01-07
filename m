Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302AF29BDA0
	for <workflows@vger.kernel.org>; Wed,  7 Jan 2026 21:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767821302; cv=none; b=dP8AEB5oB7feaHNTK6Gq+AvRC/jyGOJQ76Da9TXl/VBIURhN2h5hyYaptaQGh2va4mwSFlfRurjDfvUYkG0Qi3rR/teKt0jSfTFD8Hp+XHCSImbo7Zv5/8WNVjcfXxJAKyw17BzbNq5YjDba7IqLITtzo53I48xJ64VyRecHc0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767821302; c=relaxed/simple;
	bh=QE0TuUd0ZtnFsYMLcc0LCISHHaywTbsKMgtAJ5LeFQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gCh0UEPe4FTvVBNkciP0NJ3JxRWsU9CSNdLm2Um0zu+eEzktrirutIFyjjTSAqWZkPmBgN/w8P5m4fFp9FOdRVxOCU9KOI0G4M/vZITy0H+1aGzKaS1gZ0B0qVtk9YCCAfSb5usI94XMg4P9EKO+1bJsvctD+HxSIKOKjTZwqMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=An4KhGaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDEu2z4e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="An4KhGaK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDEu2z4e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607H3uTS3049808
	for <workflows@vger.kernel.org>; Wed, 7 Jan 2026 21:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBn0nYVbtuh8wufBeWR0pZ21pfC/Ns9D4ekZeoAHe+A=; b=An4KhGaKBKW8dWFo
	6Baozy07xxegetf68aGX7spaEC0q0/gm4cxNrsCE5QhZlJnPWSVZ1iC4+akxJZfM
	3HYemorym0t4iUD3PFBbiNMwC0OLBWGxeq+wBE/fWx47Z9LlQhhKJpcXFvfQOk7l
	KQqG+EI+aH94UZnqugIfWfu3Ye0xw4nMSqCNgFE340zqFtt9OKvFyLi2jPcVAerJ
	HXMSJdUtNYe2Iasr5dS51fHK2OvANsBVrsOXL8cvOxXMrZg+seLrcYWxz4SXWQAz
	vvJ3hX+M1+9dwg45rr8yFepWElQK7A0+/XqzE2G3LzYUkon6cCXKtxVW0Eu35PXl
	B4BOjw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhujegsy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 07 Jan 2026 21:28:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b9fa6f808cso744254885a.1
        for <workflows@vger.kernel.org>; Wed, 07 Jan 2026 13:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767821299; x=1768426099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KBn0nYVbtuh8wufBeWR0pZ21pfC/Ns9D4ekZeoAHe+A=;
        b=NDEu2z4ePasrR1o4S3bxP2j+y9tYQO7xmA5RpthvF218lxlpR2WzFcNv6yctBKCSRI
         z2/TZHQndntCcarVQrxUZGMjOI3Nv0wV6o9Nm2M1S4yZnA2a3UdghGmRcZZEW5vSRZNw
         Enb4N1HnqjR+9CD+lwQ3NbEtkWW+rKBv22ngJ1XAYkFdkr0Cv2kGMwYfjdTh2UeiDk+F
         pJD42xCzNgmcN5k3nQrHp9V9QXKnFLYfJua5lzdXZFBNA0M8RHW35o/+LUDdLVWp3DYM
         fYIMnyEGSkfIWP508bvp9TKUJ/SMShC43CGRrkBNmDkFviS9YmYr+PENyccCes/Xx882
         c+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767821299; x=1768426099;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBn0nYVbtuh8wufBeWR0pZ21pfC/Ns9D4ekZeoAHe+A=;
        b=sGfjtGT/aW2l3+ckYECKtPF823Pv8KfidY6My6ZLhPHRrCa/ShRBq7nJCGaSIsvHJU
         BY4JQ67Tp4toGosCALkJi9jfQ/n0Yu0GZ5LKpoymPJM9enJBwvDEmBlBb05Y1/j+mSLQ
         FPcAdFZHd+0RB/VrujqtZlp9sZYeOfFNZ/UzzV9pBU3Lipn5yB8TZ9a7m+ppDe9vNqdT
         d90PkGR0wd8qMCSTXr/uzCK8DKj0kF74J3WVCLWnFVwlxH0j8GEfLMrHtYvhHDjHKu/O
         i23N5ZjsaZT5HXQf8YIyP5t3l9r0hvpHT+cg6bG8FEkOtvTnNlSF/FEgmohUZDXucC7/
         oH+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYu9CQPiopMqcilcRnkva4iL9wdFS2OwKKndsbFSa38ItDJBjTEHWih7iEM1Ou3zXdjSSVfhPOY2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwinsBbmgE37kimV7QqSpYQSx8GYH6DxxNlIytubb5gvzgOa7Ms
	CQjo64UCAYsTG3w3hV6iBbkpJQ8xLem6yy9JgUd6K0+Eeh5nXFhxgDmS9KMpiP9IiQKO+MwF2Zh
	nQ20tRviUG4zykGD5S4CULt4J1D6ygJ6jXjkz1KqBFwnfKULyvuhB20Z43lRwgTIDAAFOkeM=
X-Gm-Gg: AY/fxX5usiy89PnCQ0MKR/k4ppDMrVhIXlHw3Q5Kk1WlSHuQR/PyxT4ZYPqxdy5+7un
	RXpULkaj9FDJnVYYh1ulNKJV0fNDPa0tA74YA4ek6SHJkToP8eHTFV4yW8TpcKVysTYYpWijgah
	yHIFdnrFukYm2qr361O1/ip4JA9UQhlLs37DPYyBz41AgZplsb+HBJthdPiAobjyaXcFvYmH4qy
	etuLHH/+m/m3aspvYVmRhKxzpQ2ximqhV5OOl+h367r6LifwQb3cL0GMbVFNnfLvlFfZc+bmN4j
	Qh+UsW0u5H23lb/E7ytwI9r4Es/Jtif2/MB26Umzr1wcamseskxSejGLmQgoy86/XkSj4PT/p0n
	MKzRPJs/4ITqVfTnjeXQ9UADMo/b5hwLZLPYbWQ==
X-Received: by 2002:a05:620a:46ab:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8c389406276mr531914685a.74.1767821299073;
        Wed, 07 Jan 2026 13:28:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEs7vmOfk/MRKXOdvX0ksXjWl8U/ducOM0tlNsCZnnSfq/R7R/rY6mUOUVWGr/MBtI3NfPuHw==
X-Received: by 2002:a05:620a:46ab:b0:85c:bb2:ad8c with SMTP id af79cd13be357-8c389406276mr531911985a.74.1767821298642;
        Wed, 07 Jan 2026 13:28:18 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9eb402sm5765916a12.15.2026.01.07.13.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 13:28:18 -0800 (PST)
Message-ID: <2b681eaa-e71b-4c6a-8cea-ba7eb5915220@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 22:28:16 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] LICENSES: Explicitly allow SPDX-FileCopyrightText
To: Joe Perches <joe@perches.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20260107171246.242973-2-krzysztof.kozlowski@oss.qualcomm.com>
 <4702253d918c8edb899a91fbd79b40199a013264.camel@perches.com>
 <2026010726-crusader-recoup-4825@gregkh>
 <dc44dd2c6efb16ace506085922707c70126117e7.camel@perches.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <dc44dd2c6efb16ace506085922707c70126117e7.camel@perches.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=WKNyn3sR c=1 sm=1 tr=0 ts=695ecff4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iQpfymHqp41Ck2fXHbgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: -je_RkHgJGlDDvdL8uaUn518fUL0ZcSp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDE3MCBTYWx0ZWRfX+l5ySiC/K/Wh
 9k/m4TdZ4wP3mx5Zi1mBvDTmHLpFvJ15IqKfNnnsPkIhhrKtQUGISYYt+xhLqJoe0ADJV4q2K7Y
 69NR/qchPtwqDsFM1wYOJhV+z4emAFm7miwGE4GJVr3HHKyC087q0kDN3eJYNwozTk7jCUOfk/t
 +ADD/YzattPN9IxKX62aKgEO9E/BDZuZ+cwvgZ6bSJPtvtru3ZlitG52ibKJ0sDhvf4noXBvppw
 BRHxQZKYp0MnPUHtJw4HLGdoWMzTE5o/B48UwYKdxFODNzFzwNlncwC3Fjb519KecXHHCM+mZQq
 4QC/Bz4Cr39bwjKxq17yLLYIsJaoELDCyauYwcDAM1XUBP+2+vNPCmqCot/epBrombj2OKODdRT
 TER4ZkX3mF+RQmqHNuNEbEJzNEfnYBoWeyzqyN01LN7+B868Z0yt502OGyK7ja4HFmvfsG2jLR+
 18Y4LjiO7vl/ZM1UmLg==
X-Proofpoint-ORIG-GUID: -je_RkHgJGlDDvdL8uaUn518fUL0ZcSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070170

On 07/01/2026 20:38, Joe Perches wrote:
> On Wed, 2026-01-07 at 20:35 +0100, Greg Kroah-Hartman wrote:
>> On Wed, Jan 07, 2026 at 10:40:11AM -0800, Joe Perches wrote:
>>> On Wed, 2026-01-07 at 18:12 +0100, Krzysztof Kozlowski wrote:
>>>> Sources already have SPDX-FileCopyrightText (~40 instances) and more
>>>> appear on the mailing list, so document that it is allowed.  On the
>>>> other hand SPDX defines several other tags like SPDX-FileType, so add
>>>> checkpatch rule to narrow desired tags only to two of them - license and
>>>> copyright.  That way no new tags would sneak in to the kernel unnoticed.
>>>
>>> I find no value in this tag.  I think it should be discouraged.
>>>
>>> How is it different or more useful than a typical Copyright or © symbol ?
>>
>> It's easier to parse automatically and put into other places (like a
>> software bill of materials).
>>
>> I don't like it all that much either, as really, it doesn't mean much
>> (go talk to a lawyer for details), but it's already in our tree so we
>> might as well document it...
> 
> Document it doesn't mean encourage it.


Just like I explained in the changelog --- part, we should either accept
it or mark it as incorrect in the checkpatch. I am fine with both (I
don't have actual preference), but what I do not want is to have it in
limbo/open stage, where everyone has to guess if it is desired/allowed.

Lack of documented policy enforced by checkpatch means every maintainer
upon seeing it will do the same as me - git grep and try to understand
whether this is approved or not. Pretty waste of everyone's time.

Best regards,
Krzysztof

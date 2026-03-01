Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B90329C73
	for <workflows@vger.kernel.org>; Sun,  1 Mar 2026 14:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772375260; cv=none; b=gX5E0tYJGr7WIMGGDkeO525ph1gVGp0UGU5sFhCdolfRsRMU80C9G2P0PIc5a2vCb5asLbABlX24ChLb6jjxph8je0ZtGKi58KQizLnzyyPIKwebgykrqMultaV52F4qyv+L7IJDHKCRm4g/9tZdOThD0Q1rdISx4Qi0UsteDiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772375260; c=relaxed/simple;
	bh=Ekh8p3dm6W20HePKcPwx3DLUt0taPzLgRZRHnGBUsGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oFSMUbjsNEvWztoUXy2rpkFg5TBoqc8yJbweZSAFilYFVc6zDE4at3Mj1JiT+eqM4dK/XCJn4pGx0ZNFZ83sfLQN9YmIGN1/A8lh3j+odJyik+JfMf+WXfXVNqvPzJJMSVZ0/vKQ0vqYmf73I2PgV2ef2eptBt8igWeXh6pEkaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dphYiHkL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVCu8BGr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dphYiHkL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVCu8BGr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621Awa9X3034123
	for <workflows@vger.kernel.org>; Sun, 1 Mar 2026 14:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gv4KnXO4Mz/eyyNBwA0r6xStPI7dRzb9G08XVsbu67I=; b=dphYiHkLNoJ4KQnV
	FanqsTG9EUoT8gb6Of61YsT+TWvBHhF7br/Te1pvyb7/8z7YOWSoBnlo6j/e3Qex
	6SHhNpZmBAvW2FenI1UZ0cyn1/6/WK0tYo9sCaGQystTnTm9twReozsF1cIXvhhK
	SoYj9/sIyOCGJ+2CyKSesfpsFnXxMovaWykOH+QKVuxsEC5p62QVi9QKom54VvR9
	VvyESzQw9/ODm/3dr0RjnQkipfjAItQg31xFZSDCoS7Ze9Q+1WfVnGUefMAnRKI8
	p//m3M8sdGw6y56qDzwEP2XbvC9FvfdyZKCb1HxgrVYYawyeczI7tGqA5XVF/wtK
	tld2yQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8jujq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Sun, 01 Mar 2026 14:27:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so368980585a.1
        for <workflows@vger.kernel.org>; Sun, 01 Mar 2026 06:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772375256; x=1772980056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gv4KnXO4Mz/eyyNBwA0r6xStPI7dRzb9G08XVsbu67I=;
        b=UVCu8BGr+8/54Sl2dKJIsU47Ev0VJph1E4UToAnlm9WauAwkQ3QKF8RhHbliJkoACF
         SOOTZZ/kmnDsG1KQzNJ5ey+cKgj1cmzIumvBavFHkqnWl9DVIyQDnqkKdMM+TAMOJLcg
         zZbD8rf7+9XhJ4JVIvE1ak42oFaofj+9/7u0V6YirKjRhoLjOQp8MLGtAmOiHv6pfjxm
         zwFobz7I8Y1k5aI3esFCopl/ovYYpOVoxYYYDGsB/+gA8ghg/lilQAs6GugVLkcZaew4
         cMZGU9vy03ZE9UZXYHfUZGW/c0JSkqyNo4U5W1d2CXA3TU21QzprbQbkHokh0UWMZ9k2
         5djw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772375256; x=1772980056;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gv4KnXO4Mz/eyyNBwA0r6xStPI7dRzb9G08XVsbu67I=;
        b=G8HFXWqqSFEAAyEJbYXwJLlEUTLYB7S7F0hhZvrDofSi1JTZyWCEdsD2VgC5b3zkoU
         +oSGF9P3PQnBD4a3A3vKKLL0mMPznsbdiV16HNoJ01i/WfOg6/KsPXrdYonabVMuXzKN
         vl1jRd7Oz/zdA8Vaa77SYchkyob/IJkwPNSuB6o9+Q1ZE76sCmaq7kxX9iiP9SPTeR5+
         bBnDc1rYoJDTeBuwqGOIerZxFqLRKZh5B31EAX37tPqhlONlB/5YbyIFIvIK/qG3ivpL
         JX2hpKIj9j5JhAus69wGsXpeWv7I2DB5GR7voo2fVBpb1wqeXCLExiv4pokcskLR+RuK
         obDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR/Ib56GPH+HIkwgl2o8HtmElzDngq9xd1EerYIrV6+TQXMhHJRitm67XwclabSEBqxbUGouDYEz8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo4IyT3oMfGtKovrDB9Gk4Y/VyL0gH4ruO/GQfHnmSnO5qPjQu
	JQ8Aj0c88/EY2oIYiAteYlJMacAGdiqDhEwgpHsjSCX6IDIT7iFDKiGlCBzTgYA1xVM5Jo7DXeQ
	LBcmEo8bwOIp0b5NQsDCzb8lcFt2HpM7UD1wb22QnAV3l1VHEX1bQhBE10j3TNU0=
X-Gm-Gg: ATEYQzypoKMekIqS/2GcnSDQg3H75YqimEU4LTtij35J76kohSvUfRpgmYifSqs/XX9
	5E7E4lit8eJfPFdGjhQHgujdt+S9gZ8uqQRcYW2lon3qI5vTORmS0UAKwRkY4DcjA7M7r6HJE7c
	gLFlqdC/Ft86OXDZjQxhxnR5IZzdqgVYQF+gf4Lf3R9nX+vQ45yPVbYyrV/oKdNHiRBCySvJYgg
	COwLodDE8mLrQxod6fdOhwtfro6HPxAVAjKLgC3sGhtHtOIRCufOV12BI8ipVndDeoffhSQTmby
	xaKarkCiT+vVW+pNAvR1irxn+cFGyW/mJKWDUnTVFbUIIQyNzN7z1ISlTprTsExF0wf4yk7Zwfc
	MFLyZ/qgJUGV24udMZEGDl3+LAf9RjFI/6ankQl9cZbDqXiPt
X-Received: by 2002:a05:620a:318a:b0:8cb:3fb3:7bef with SMTP id af79cd13be357-8cbc8f1565cmr1138841385a.47.1772375256393;
        Sun, 01 Mar 2026 06:27:36 -0800 (PST)
X-Received: by 2002:a05:620a:318a:b0:8cb:3fb3:7bef with SMTP id af79cd13be357-8cbc8f1565cmr1138838285a.47.1772375255860;
        Sun, 01 Mar 2026 06:27:35 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b34b6252sm4798312f8f.10.2026.03.01.06.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 06:27:35 -0800 (PST)
Message-ID: <c1ea6e95-8fb4-4213-824b-a49a1989062e@oss.qualcomm.com>
Date: Sun, 1 Mar 2026 15:27:33 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] LICENSES: Explicitly allow SPDX-FileCopyrightText
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260301134054.44229-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260301134939.GA2879901@killaraus.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260301134939.GA2879901@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDEzMSBTYWx0ZWRfX/qOgXSXkazaG
 bIoW4Vltlgm/r1axYTHbcwBLGetjHPfoyQfuMH5seoxno1YnRwvC5/nzg4CcYZju0MVgJqXnxNk
 YOFfQJKsCOwneaWu1PI+mhcrox+ibDuKMqeeUTCdv2kzFOzUEfdIfC79vintXKBPH0DajKp87BX
 IvKnOc5fSsTCcgC1FoSlXjx9UmJPIOfkalbwqDpIhEBIzU3IG60ViykM+NEcdCMlfgnVd2tZgkd
 i4C3/ZXei1YD/Aqw2ThnmetDo42td+QIFjfSkWAQdrTBDLI7WCjD7MALnoFJhmTG9clixfcY19A
 Vjtq/7PVZryE/5Mjnpzz/pXJyg+bQav+kAD3jOUEITkSM7NQyvuRuRjvBebLwqrme2ZFd0Wsa7M
 oYhU3RY/Sw7lFr2/l6pe1ZtB/lW0jTxJ7HTulJlcSfpryg/cPvNwV/EgmI++r5Ejlq1mWJQZqf5
 GZ9rALxnmuPHiwh36Pg==
X-Proofpoint-ORIG-GUID: vda8l021ICQ1IXCMkXV7t6otZpcD8MYe
X-Proofpoint-GUID: vda8l021ICQ1IXCMkXV7t6otZpcD8MYe
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a44cd9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1Qhj-OTkAAAA:8 a=9sHNobXcs_M4MMPWYAIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010131

On 01/03/2026 14:49, Laurent Pinchart wrote:
>>  
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index bec7930cdd66..e317cf2ffc58 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -3856,6 +3856,14 @@ sub process {
>>  			     "Misplaced SPDX-License-Identifier tag - use line $checklicenseline instead\n" . $herecurr);
>>  		}
>>  
>> +# check for unsupported SPDX file tags
>> +		if ($rawline =~ /\bSPDX-.*:/ &&
>> +		    $rawline !~ /\bSPDX-License-Identifier:/ &&
>> +		    $rawline !~ /\bSPDX-FileCopyrightText:/) {
>> +			WARN("SPDX_LICENSE_TAG",
>> +			     "Unsupported SPDX tag\n" . $herecurr);
> 
> I'd write "nonallowed" instead of "unsupported", possibly because I may
> not be familiar with the usage of "supported" in this acceptation. With
> or without that change,

My two dicts flag "nonallowed" as a mistake while disagreeing with
https://en.wiktionary.org/wiki/nonallowed, thus just in case I will
write "disallowed".

Best regards,
Krzysztof

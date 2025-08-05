Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C856B24E4C3
	for <workflows@vger.kernel.org>; Tue,  5 Aug 2025 22:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754431731; cv=none; b=KQy5vMhihIaPhmutYLDH7KPOG1h/Ho4nuNEMyepWZIKmPHYnfl7YX6pyKhSW+pmCIutMGbWdTbQdvHGe459aMtdOzLFnadTeglgdeMgJ8kELj0fV3f6dzgwotBRC/Uij1OlK9+a7sLEhG1vOB0qoMz1SgD5MNS60+0vnWrp6A+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754431731; c=relaxed/simple;
	bh=C4aF0jhnSDNzgCpC/9MJ35IS2P6qdTHutz5MBfw8VPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOhtzxJP9u3bpb14OhPX73bqIh6A0/3xnjamp+UDc6zpgNd7dMPmb3Gej6CdZyHOrxLrxj4p0gSdSKZxX+Rt9BotsZf5Jtzd2aIxvk+VjJcUBiyt/673kKgBSWM8qSB0H0b5QEHPO/smhMDTCSTj5Qs4DhIPUcV5Sstm3CnCe5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L90XrZQf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L90XrZQf"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575I7kP9017996
	for <workflows@vger.kernel.org>; Tue, 5 Aug 2025 22:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPGNwiXRp88kNPj5T9C7eKWaHt3n1T+xdGhFfZ8qfi8=; b=L90XrZQfg0e/SVV5
	hnJOKrC93kx5V44KikYr3CH8RJsRDp4v9t6jNOV9v6ig0dEbvn/BQhiIHm6Nuqv5
	8B/nWVhfNdJHAL7p6iw5uncWCNh25Oo5KdaloshaBt+u52upFL7Fg1M0+NWwIqWs
	wS6Cdj0usjPaNQdJYeWr7Z/P+f856S2ghV0/OdSAgQ14rtDPGreGLFREZZXmKD3+
	zTxxDAzBRoixo8InXokNVTnS8l/q+EVa5NM+pMe+s20BZu05Q6i+lVC0KQJLUVA5
	m98cd/jZUUyRz99QBiVQ1N4OfyqlQBbdiEMOIJVflcUD9kkRsTuWrZYbEtu6866d
	raJO+w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy88je2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Tue, 05 Aug 2025 22:08:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23824a9bc29so86180035ad.3
        for <workflows@vger.kernel.org>; Tue, 05 Aug 2025 15:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754431728; x=1755036528;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPGNwiXRp88kNPj5T9C7eKWaHt3n1T+xdGhFfZ8qfi8=;
        b=LaXz0e7eA/BKu2gpBOOEDlUST3/aZ+Fz4UhifNfBEWxZ3DOT6TEYsPx5TqUmPbAQpx
         i99zeTPUvolW77mLDCrmWTASDAP169UkxcOp7KkZUKiPOjy62uG8ZbvZgYAV0ui+1SjT
         Ua/vHiHPPKFIec1UOxxaKjRyVc8hBBwMIDh+7PZiNqOwdUCFZvWiY/QnkTgmv09zMeve
         zzc1PXKNl2DHdvjmHHnhaJsRhHOHanPZ4gMUbS0Y1KIVHsBC9T4J0xoHztnAQggzgXQa
         R/HG9bivzTzpr2XOLoqQruPGCrg7S+HEEaPPXqxGRI2abyOjE447688AXVsVeJDXVi4+
         5itw==
X-Forwarded-Encrypted: i=1; AJvYcCUvtc8UmiSUYhD4xtJa70YFktMxhOiq2loMA0Rd6EXHhTlgAQ7uqxOsHudiNO4JwaepcrjfTQ6FpWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz78vvf2QyDUwJY7vyje7F2V/4RwT0+HnaM6iHCjosnBC6UJe8n
	GMdswVMCNrF/S48Vk0Cc/Hxc3QzOFb7wpkeKdpwyEcNxdArHnHGQKERKjiKIOOXRMl2kPmKEPXa
	HvNZuRkbkCeJPVasXbnlR9I8Zm6EXth/YYSjCzbzdbgkrSxp6toi9buIaL6hD5VM=
X-Gm-Gg: ASbGncvPG9x0GhMCGWyVZtTYkiMzXBx1nlykuq0hvb8PMjfSEX1Tv1AhEIOUtd7m6of
	WaP9KFVfx7r5Br8dmVBn/Zn4ixRKA4JpNLzOV3LDd2BXWQMoD5AIfROWBEp+y5NpAtESY/+AWdv
	C8XjO2txjjyJ2ZS4UgFReMPMMO4HPhiCKLMBMT8s2Hnege1sg5kb+YWoSHMifNMjYC3e0i8lugr
	r5ZnnbomYK7VAegTieY9PlttVljJfFce/0+RU0t1m67MViPrn4z5f2yzX5NTfNPc1J13A+iP/5Z
	vr7q6EnA1RX4XqcGfWuaWfstdDsq5qYfzLUrDM4aLhZYoYnGceTVvGonBsx75PpH+fATTHSPFqU
	ApyK+iSXQOdT0sewXpER77vy+DuOMPP0s
X-Received: by 2002:a17:902:ce83:b0:23d:d2d2:b511 with SMTP id d9443c01a7336-242a0ac1ecfmr3280125ad.19.1754431727846;
        Tue, 05 Aug 2025 15:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0Kul0H2qbAtCnTZWaSV2/tYAXzYWabMFDcnnTPF71+z9fGCHROeCrM/g1vJAXwk5dY+X+Wg==
X-Received: by 2002:a17:902:ce83:b0:23d:d2d2:b511 with SMTP id d9443c01a7336-242a0ac1ecfmr3279765ad.19.1754431727402;
        Tue, 05 Aug 2025 15:08:47 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f21c65sm143695185ad.73.2025.08.05.15.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 15:08:46 -0700 (PDT)
Message-ID: <771aef93-df3e-4a9b-b6d9-3a5057f77ddb@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 15:08:45 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] agents: add legal requirements and agent attribution
 guidelines
To: Sasha Levin <sashal@kernel.org>, corbet@lwn.net, linux-doc@vger.kernel.org,
        workflows@vger.kernel.org
Cc: josh@joshtriplett.org, kees@kernel.org, konstantin@linuxfoundation.org,
        linux-kernel@vger.kernel.org, rostedt@goodmis.org
References: <20250727195802.2222764-1-sashal@kernel.org>
 <20250727195802.2222764-5-sashal@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250727195802.2222764-5-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fnwSHURcQpttErd2aeANkTg85vVuqhqo
X-Proofpoint-ORIG-GUID: fnwSHURcQpttErd2aeANkTg85vVuqhqo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDE1NSBTYWx0ZWRfX8B+cOR1l5bFf
 xdzpF8EqnR1cnHxIXzVCol6dUkO46feY9M2Dh+Qopx2VQqUXVyCdtho6IA+Un6qqHqeWBdedCAy
 q0QsqLFww9qsJMyMmaL5PyOUZQ2B1K+duhRdJNJWmqMgV5114r8Pq3oRWT+6M8uAoXxdp8486/m
 fnWbXQ4lb7Z7Fbqa6bzFScQi2HmgDhEmvZdk9FV95I1fx48estrt5Uxk4JaHOIrrLR2odrxow5e
 eNdgJNWIGnizMTXdfHSsGcGAJqoiVXW7pqUtkC/LmdpaVlPVQ7uzUzT/YPIcv4vYYNdz0+8M7sV
 SMizzz/LQC8Gh4iYQwhbRGAXywpPRwL1gR2AWSmJDRasHrDEOCF9CoaQuIVzYidwVeFqyJYwDMm
 YvHWsAPOMM8UmJdfFGaiflJpfxsn3jnCp896NBD4+D/8iCYhXNrubLSTxt1mCCjoqIX42Hlm
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=689280f0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KGwrKJCAF6cQJkUQTlQA:9
 a=QEXdDO2ut3YA:10 a=mLIokOBbMDMA:10 a=W1xJO3YbG5cA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=771 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508050155

On 7/27/2025 12:58 PM, Sasha Levin wrote:
> And below is the first test of this scheme:
> 
> Co-developed-by: Claude claude-opus-4-20250514
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/agents/index.rst |  3 ++-
>  Documentation/agents/legal.rst | 42 ++++++++++++++++++++++++++++++++++
>  Documentation/agents/main.rst  |  5 ++++
>  3 files changed, 49 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/agents/legal.rst
> 
> diff --git a/Documentation/agents/index.rst b/Documentation/agents/index.rst
> index 354af3f025e5..982602db3349 100644
> --- a/Documentation/agents/index.rst
> +++ b/Documentation/agents/index.rst
> @@ -9,4 +9,5 @@ Agents
>  
>     main
>     core
> -   coding-style
> \ No newline at end of file
> +   coding-style
> +   legal
> \ No newline at end of file
> diff --git a/Documentation/agents/legal.rst b/Documentation/agents/legal.rst
> new file mode 100644
> index 000000000000..67e6b2cdff9d
> --- /dev/null
> +++ b/Documentation/agents/legal.rst
> @@ -0,0 +1,42 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===============================
> +Legal Requirements for Agents
> +===============================
> +
> +This document outlines critical legal requirements that coding agents must follow when working with the Linux kernel codebase.
> +
> +Licensing Requirements
> +----------------------
> +
> +**GPL-2.0 License**
> +  The Linux kernel is licensed under GPL-2.0 only with a syscall exception. Coding agents MUST follow this licensing rule with no exceptions. Any code contributed must be compatible with this license.
> +
> +**SPDX License Identifiers**
> +  All files must have proper SPDX license identifiers. For most kernel source files, this should be the first line of the file in the appropriate comment format:
> +
> +  - For C source/header files: ``// SPDX-License-Identifier: GPL-2.0``
> +  - For scripts: ``# SPDX-License-Identifier: GPL-2.0``
> +  - For documentation: ``.. SPDX-License-Identifier: GPL-2.0``

I believe the agent has not processed the following correctly:
https://www.kernel.org/doc/html/latest/process/license-rules.html

1) C header files use /* SPDX-License-Identifier: <expression> */
2) Contributions need not be GPL-2.0, "individual files can be provided under
a dual license, e.g. one of the compatible GPL variants and alternatively
under a permissive license like BSD, MIT etc."

These two issues jumped out at me...

/jeff

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767DE35CB76
	for <workflows@vger.kernel.org>; Fri, 20 Mar 2026 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000080; cv=none; b=BA5+EuZp63gCh59X0X1EF2oyvjwg88Qv4eQJ/eHtNqbsQ6xhQ1FBpczg2ftFi3pySXUe4chknB9M0/pC6m148u/aDezDLwlrVLFyMHpWQui4nA4EKORUMXPChGGjaeRl1Dl1a6wsb6iXpqdTY22ErGPyiSDbe2SBtoj5+cRoCXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000080; c=relaxed/simple;
	bh=UnrE1EYl2UhzK3q0AG8c7jKtom/DRBJh4SsDJNISEvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KY0GIPnebPXeodduqJ613L/V04Iv/lvteCYxYzulxICaKkcCtjlIx747DD60wkFZ8HuLr9AkRnlcBXcBuLWvIBhOwC1hemPMn0D0i5eCpt4q9qd8LJ4YYmbdrCPazgOcpmCcRMlc14VtZUTg1SJ9cpJQ7qcibxiGeJMGyDZhFIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRQjYG3t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fS0UDuTc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRQjYG3t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fS0UDuTc"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K2XkBR1191308
	for <workflows@vger.kernel.org>; Fri, 20 Mar 2026 09:47:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gN+RusSI22KRsuRRKGocsyZ7gd4d20kVuf92TgQBQfw=; b=MRQjYG3thjoLXucI
	6oVn0rgT4rq1Gyw0InqZjbm3xUNT50fNg2IdXUGtkdXO9ByEreMWu3D/jOpCORg8
	bNpKSBWM6v1GMJohSznhRyOcCKXAQTm/5SxDGN5hzha0NWcelx9AYssbnjNSTHD2
	NT0mAWIiuvbMhTPCcu5GrHGO1nZ/eXtGsVU5l5HKKYoRB1p47m60xi7PaGdJmlQx
	mlzXHOkavHOLwEGHKXCvjrweONZ6mvhZ23O3e8oneMbJmcK++cAn6qKb4ayXfsyN
	a09hQeytnUHqe0fQU5526VJlH3ROLTtlehMHSnJi+cUDhvn+rcEc8W2FqGVPUw1i
	6fn8yw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0pvht0kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Fri, 20 Mar 2026 09:47:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50917996cfaso126017521cf.0
        for <workflows@vger.kernel.org>; Fri, 20 Mar 2026 02:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774000077; x=1774604877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gN+RusSI22KRsuRRKGocsyZ7gd4d20kVuf92TgQBQfw=;
        b=fS0UDuTcjUDP1yDagILkXPFGTFd32bGB1eZ3FO+2j3+RFlt0fhEQTrM4KuSxm9w42U
         rsuYZX6tV/IkObGla8XIxCtcBUcF/Rnzh+qPOsk9OlOkGdCS6LqTB4CcfGC3LwGDQ/sp
         zJh0YtOsHbBsWHpqJNDr9jd2I5ln/NKGOW1Wcd2Fm8KpGsirKhuPN+spdS2Xmc3fw2R3
         p4KlXvotSCoVjIHlstVh2tPQF4V30m6adYnZ5zU2r+WpmyH/W1Z8iDJdgdeE1RoYmuS6
         jIA9TMhXa8OSeY8oe6onTfEVAJ3yTVaJSOGNdpOJbqiL/on/6+kK3T0ZAh6AhBxWZu3I
         mZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774000077; x=1774604877;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gN+RusSI22KRsuRRKGocsyZ7gd4d20kVuf92TgQBQfw=;
        b=rnPTdsmo1zX8E7MhXBC3UMj7jF4Nl4Pz6ghSGtZ3WzwafCZ01H0b6rvJGrdUZYszUd
         sl/fE/XrPTLcm8QCpOowe2Rw+du6mii2uBqfJIrJJZOjaJrnIg4S9K+t422OwM7x8o6/
         Wvze9LB3ZpqC0V/e70sApFE21JncgJnJ/2fAmESn+Mwrp8FokDzS8wvscXL+cyc97GD/
         b32+eDyJzl5bpIea1caUCRzAZ8M6ByoV4Jp25iRBZ0IXzutKZl4gsdoT0AqOuP3/u863
         pU2XBFXDZqLr5RjCCssdGjPKjswEzixnJJpYCnJ69nFMHhAYt4kBKoBDLI9b6LQHSkdg
         po9g==
X-Forwarded-Encrypted: i=1; AJvYcCUAgfUq7gdTchCBHXUR3D0yV5D8/S7+OmgmXn6jRQUX5BLhd+TrV2/hfB3zyiy261cNiqmU9doJgqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6K449tMyGYuqlkiZYTxnUlXNJIWNJqK8ZjJ1gnNimaj7GnJP1
	LTo8cHXRv1agx5igAJruwfoFu6suXbpLehcYTQun68veWVmxIoT5Gb33BZA8IevRNFCRXkXrhjk
	tDBmcWj04aV9vXewNI11hiOficg+88vw54zdcVkw6cZG9M6VerGab66aYpif5QzQ=
X-Gm-Gg: ATEYQzzrBLkfnvF1aaeEf41JNNBMonMN89vPTWWD8uyrB5f4zizKskGYC5taGU1dEZD
	Jrqy4lhh+UKwOK1IJJOYJpag0EqZNpcl59oY6Jb3jX30SvSGIOuGSXUioXrB45dsBdcXqUAVl6L
	X37pj6G+kea1kkCAeZ/YNKGk+b3oWQKXUmYQQXhhdq7eFEEQ21yFntue45w7O06lRWQBEB0/kKp
	sOdNPVG2ac2gJGyff9u3z6UkwRVULZ6QkS6Q1oGzMInaR1FovnSOd2uwqpugyZdBI+p5GLMqTbY
	GkdVFIlaoUkn+7JIF8EKB+Bot7vDsfYC8yeE87mAq/kaooVMms/YMH/8RtH3uoqaEXE15RMn6kR
	PKaMxi1bu39zPKEprr+lrHXe0msMKgPu83z5UFxeGo8uPGb7B
X-Received: by 2002:a05:622a:652:b0:509:1795:a7db with SMTP id d75a77b69052e-50b373963bcmr32909561cf.6.1774000077601;
        Fri, 20 Mar 2026 02:47:57 -0700 (PDT)
X-Received: by 2002:a05:622a:652:b0:509:1795:a7db with SMTP id d75a77b69052e-50b373963bcmr32909281cf.6.1774000077148;
        Fri, 20 Mar 2026 02:47:57 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487003ec0d5sm10935365e9.1.2026.03.20.02.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:47:55 -0700 (PDT)
Message-ID: <aab4d11a-9e46-4c6a-9e7f-cb598195b693@oss.qualcomm.com>
Date: Fri, 20 Mar 2026 10:47:52 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] LICENSES: Explicitly allow SPDX-FileCopyrightText
To: Thomas Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-spdx@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20260301143322.92894-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260301143322.92894-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F95at6hN c=1 sm=1 tr=0 ts=69bd17ce cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P1BnusSwAAAA:8 a=ag1SF4gXAAAA:8 a=IJv9LcIfAAAA:8 a=EUspDBNiAAAA:8
 a=bFRN6MMRp203k8b-qj4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=D0XLA9XvdZm18NrgonBM:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=cmr4hm9N53k6aw-X_--Q:22
X-Proofpoint-GUID: 1snZ6uTXx5CoyIzHvkM4SXfmr97R0Ffb
X-Proofpoint-ORIG-GUID: 1snZ6uTXx5CoyIzHvkM4SXfmr97R0Ffb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA3NSBTYWx0ZWRfX0qdjhmcPhao6
 OeGRn90LI6C16GaXGPGDQciEGlNsO7BiWnBYTSwm8+tvOfsTI+dN/9dJJgJJWxTb2t9ekUCXdzC
 XLsvL3vqC+ubxXnEV5rqmxt1NWk1W/g0Rm9u3KeXRDV6+suQAI45TbaLZAY6Rh3f0uBgIdzdkVo
 UKvs02sSXU26CExEao7IpNjTu5drYqKN2asj6aSY1bgiL0/2aYcD67646ho+RmEqgac+9IRfzT4
 q4WjrdD7N1/xf/RTOmTMe4YoPf5n07ioVka+mXNAjE1i50/2VVtmxz+MTdiepVUauttoS1qI7sg
 FxocmQN6JTeAWo8dM9fkeu0Ynoi9lK7gQ52LX/PtUmkrNpx8SSdOO0Gfxv/b6K1XLKccAAJv0RS
 7qNnrEAzmlcPBUI7ZDvUHlY2t2qfkNAQgHBy34Jm5HG1gKXe5l9oTpqsUJMLh3ruXUxYpFGF1YD
 Xx1X2tbnQ898puoQqDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200075

On 01/03/2026 15:33, Krzysztof Kozlowski wrote:
> Sources already have SPDX-FileCopyrightText (~40 instances) and more
> appear on the mailing list, so document that it is allowed.  On the
> other hand SPDX defines several other tags like SPDX-FileType, so add
> checkpatch rule to narrow desired tags only to two of them - license and
> copyright.  That way no new tags would sneak in to the kernel unnoticed.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Joe Perches <joe@perches.com>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> 
> Other way would be to remove SPDX-FileCopyrightText from existing files
> and disallow this, but one way or another we should be explicit about
> it.  Otherwise people will be sending more of these and each maintainer
> would need to make their own call.

Hey folks, any further comments here?

Is there a preference that this tag should be instead removed from the
kernel and checkpatch should not allow it?

Honestly, I don't care about the way but I do care of having it
defined/codified.

Best regards,
Krzysztof

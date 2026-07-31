Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46BA44D696
	for <workflows@vger.kernel.org>; Fri, 31 Jul 2026 18:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521361; cv=none; b=d/3W6O3/WXkG/vVwwcmjTlgChfuYwuhWxThvrVYTf4cRq4osuApM2Yfj77EEsWptVV8sSJUTEBW6KCKjwoJ/UWnUiGwPZtbKWp7BykbolxONmNKQP4/nxs9vokZJ6EglrEKso02vdgYZkA5xO6ju08jeST+h9QTYBpga6FGLGmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521361; c=relaxed/simple;
	bh=v8/ZUm4ukvjja6zhmdBPRnI8b2VSscGWWFRNveMjLUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ICNV4/OXFwfQOwa5RQZzoYR4Dlj/BuCEEDOn0WQgqOHg/tH9o4PDg5dWqNFshbTtuaH/kvI5lj4qE4/j2ughmHdrZrD+JDJmeZYTwQF7Q6dJCZhq0Oqq5K6iGUTNCuFLi9XV3auGDXodw00qw+MWve71UtPdru/B4uDpu8bORYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cx2rykXs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gF7Qc5xH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cx2rykXs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gF7Qc5xH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOi2G020669
	for <workflows@vger.kernel.org>; Fri, 31 Jul 2026 18:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ar+ZIfFn71fVOlogmTWVxCY4mj0bEutG584kMHVtKtI=; b=Cx2rykXsABEKH0aA
	C1JNfSYNqCxiAVa2nUlv6o4pFc/nbKMXXCiVMo4NojTAKMDbyHynnEXUzzQHf8+B
	JxYXPfLBuXifmvwzczGderrQndxCuD+ctZ/cGBB+mUeC3TN1yorATRIwEDQU/V72
	5nINQ6V340ClgM7FCtT6WjHd5qr0FiP7Dd0Eh/vARuNr230Sgb7dfQMk6mHmYDGV
	TIsYZnsAT+WkE8l6aELMMTryO0TVjhljQPfRP+rCyBFsq3SQvumRZf+J1GYa0ch4
	IOQdZFfReln6EYIgLkrPlmCh/glUs3+PA98uOHrpFmALL9uNgFFyDdQkdOXhm0mO
	bgIoTQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frugh1mva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Fri, 31 Jul 2026 18:09:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso980496a12.2
        for <workflows@vger.kernel.org>; Fri, 31 Jul 2026 11:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785521359; x=1786126159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ar+ZIfFn71fVOlogmTWVxCY4mj0bEutG584kMHVtKtI=;
        b=gF7Qc5xHEJDc3T+bwS6jteizEL2z3iCOdmU5ySs21bnasXXmynU+WshcGyc2yUM8v0
         4n2HxMyqrhJKLuBj6ZIetpWOLQToTQ6GJXZOr3ALrsEQcdS6qmPslR8f/tNulj1C3cjq
         oRjl0M478xONREfDITY02pgsus0ATUqfnhUSYCmBzlJHulkYpnD2pE1xC/gkI/ZsuElV
         0gmJvjuuz2f71g6RAHN7XDKAWzUvtoa5ZEiHYmrvtHaz2yrTiIg+ghBLr3Dn0+CLTQzN
         PmU9QLfi8M1MZVvWkXgkVv/rGF4kAOoAmIMjxPVLq6d+ITwuDqOVz/ITvwuG3rmS4KtY
         pPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521359; x=1786126159;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ar+ZIfFn71fVOlogmTWVxCY4mj0bEutG584kMHVtKtI=;
        b=Mb0+aJ9J7v7JbOlSbPNv2NhOlqeDwRVkVsSNVOwVegcYYjH2/XhIAAmJnbLwxxeigC
         09DfCriaI1i21tUHhWv2XDc5GFFXuUmYV2XA7oq5CpoKXpNrCpc/9uOIvsE0cL0VOFR5
         raDRz8Dome0ls0exlVWrjBxBzUoyY2RhqjN5jUHl7PRLaA1TJAxXcyte5d0UeeIP+VKb
         gBadGCkjUwhsCIXOEzeK2sX9RAtfkv60V4QAIapuQMJQhhuEXW0MM0jCE94ubCXtdAS8
         tTyiC5HnltpQJI2WwUmHIF3jCeDj4+E3bJ3ZuzCKKXYlH/iJxTFmNU2vMPh8QyFZlzcJ
         edCw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5z9r356MZxNDghKzb49CVfwYejehYJrui8JzEnlFnrkIDsMMNakUPkwJFwKHWY1P1DV2Z472FYsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwranlpZRiu7a+nuxcVl7dgqLAx2n+urVQbFd4ncCCW36yqbg6L
	dJFcLokE1p9TRZePHVwoyfxWyoWFHL5ADP6G/FAlFq2tzI1/p1yqHBxI2bmdFmaMx2S5mmppMbK
	+VfkddjCkcgxJ6tZ38Pj6PVUla0DgC+cEQt5pA0UMx5zS9ybxWXEz1ziSsHQ27Xc=
X-Gm-Gg: AR+sD10SkJvhiRX2kUx2NwrSArun8poWnnJW9+cBkYa7ruXoj7ZrdRefr/iSPrWIp4M
	LCC3ESpA+TCWvQwK9hLDzHADUG4x7+AljKu20oPH7m+lBTkOiQj2MhxSZJVeJpN5l8oPaTx6Ypw
	hhN09OPU5OU3axm2V/Zg1ArxUqi+bcgLEYKEa6JJ45Fa6UNexHEtYrr+STJvSJgdpey7juOL/vL
	dcYD30p6XzUL3CJa0byEmp/Uncf4JBH8etti/iqP9FFF1+mqxB4P+udmAMX4ffs1gkagAF/z+lH
	RVUQE5NrNJYWY2IuATxK03TLp3D49qC1z93srmX8F+YunKKMNludkxoRDKoiTBBdGM5+hXIckW1
	j2X5JQ2+PyoI5arPRKkZSVU/CpiDDltyVRkgqH/iqa90BnvFz9NlawIERABm+
X-Received: by 2002:a05:6a21:50e:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3c92a89be2cmr694529637.36.1785521359391;
        Fri, 31 Jul 2026 11:09:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:50e:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3c92a89be2cmr694494637.36.1785521358950;
        Fri, 31 Jul 2026 11:09:18 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e29a126sm8699946eec.31.2026.07.31.11.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 11:09:18 -0700 (PDT)
Message-ID: <fc83bfa2-8f29-4295-b8e6-47edcb6e354e@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:09:17 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] checkpatch: warn about possible missing gitignore
 coverage in selftests
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Cihan Karadag <cihan.cihan@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260728052442.626076-1-cihan.cihan@gmail.com>
 <20260728073143.0e665e36@kernel.org>
 <CA+JfJhbda3VbLcAO9KEPgJVH-3WwVvJjdgh0MQUH=Fhnsp28iw@mail.gmail.com>
 <6e7009f3-ed2f-4a84-868b-661b5ac7ab8f@kernel.org>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <6e7009f3-ed2f-4a84-868b-661b5ac7ab8f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzOSBTYWx0ZWRfX5yGJVTLNCsFQ
 RewR0DeYLwkVovbJjKw22SGWA/+APyIIQGzgrZA2jYOZ4DD66lzQf/jWChpgmnMFzmEu1aBRmLn
 cytL1zixXTQVyqqeFraZDjAlnOMy5OXwKIivoeIgAUnEeR+zEWcg/3/1DXBrrGbI4FJifm21Smp
 fvYso9IZa5GT2FZGq6lezidlIj34auVo6oewyuRiyyNPwlna9w1KTaKI1or1A0Ign3cLcOR5F+M
 an/Z5yfW69nVfRddqLKAj45eMP4QYtYFo3StmUb+hIoEz3mtTvhS8fCyN0xzZnsGaRLlQHpl/VP
 nhbeVLq3M68Rji2U2x9GWLXTvDaHcZ2wTHCmxIIOn9dMxGAqZQAgw7gG0BwaBYLpWgOrp5ENjZu
 qEy/NYZekleEGO+PzSc1suPJ3qzFj2zNUQYoGimkJNhYP9N5klwSzKZe8U08jJumhDN3YZmNxuD
 FBHIvTyYYJTPiCFMedA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzOSBTYWx0ZWRfX4ojiiJXSPbxk
 ptWl1ggMVCQyHwHG5X3xSuVhXyQm6AftqWVSQS8/ykkM6Q1Wkebl1kAyu7C2R+xRGFxLbebAQjY
 /tsVOUJzK8bRRr7DvzGAcanjYiz39VE=
X-Authority-Analysis: v=2.4 cv=U+iiy+ru c=1 sm=1 tr=0 ts=6a6ce4d0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=Bs_rlm9j55hZLUUMUG4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: IJUZgycxCLzB41ByAg-qrIchmyP4i7-i
X-Proofpoint-GUID: IJUZgycxCLzB41ByAg-qrIchmyP4i7-i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310139

On 7/30/2026 11:26 PM, Krzysztof Kozlowski wrote:
> On 29/07/2026 10:01, Cihan Karadag wrote:
>> On Tue, Jul 28, 2026 at 8:31 AM Jakub Kicinski <kuba@kernel.org> wrote:
>>>
>>> On Mon, 27 Jul 2026 23:24:41 -0600 Cihan Karadag wrote:
>>>> Per selftests documentation [1], every generated test binary must be
>>>> added to gitignore to prevent leaving untracked files in the kernel
>>>> tree.
>>>>
>>>> This is an easy mistake to make when adding a new test. In fact, a
>>>> search of selftests history turns up dozens of standalone follow-up
>>>> patches with titles like "add missing gitignore for <binary>", each
>>>> needed only because the original patch adding a new test
>>>> didn't also update gitignore.
>>>>
>>>> Add a SELFTESTS_GITIGNORE check that warns about gitignore coverage
>>>> whenever a patch adds a new file under tools/testing/selftests/, the
>>>> same way FILE_PATH_CHANGES warns about MAINTAINERS on any added,
>>>> moved, or deleted file.
>>>
>>> What percentage of changes to selftests from last 2 releases will
>>> false-positive trigger this? Would be good to know, checkpatch has
>>> a tendency of generating false positives which is quite counter
>>> productive.
>>
>> It will trigger whenever a new file is added to selftests, which has
>> a chance of introducing a test artifact into the tree. I checked the
>> last 20 commits touching selftests and only 6 of them were new file
>> additions, so this warning would have fired 6 times. Actually, one of
>> those 6 had a missing gitignore entry that this check is supposed to
>> warn about (fuse_acl_cache_test, 9acb102522b9).
>>
>> Comparing to other WARNINGs that checkpatch generates, such as
>> FILE_PATH_CHANGES which has existed since 2014, this seems like a
>> reasonable and already accepted way for checkpatch to operate.
>>
>> For comparison, I checked the last 20 commits that triggered
>> FILE_PATH_CHANGES in the tree, and none of them actually needed a
>> MAINTAINERS update.
> 
> FILE_PATH_CHANGES causes many false-positives, honestly for my work of
> getting 100-200 commits per release it was screaming like 20% of time
> and never had it right. All of its reports are false positives to me.
> 
> And I saw many times people do weird commits and weird MAINTAINERS
> updates, just because checkpatch asked them.
> 
> So your argument of "reasonable and already accepted way for checkpatch
> to operate" is simply wrong. Don't add more poor tests jut because we
> have one which is IMO terrible.

Concur.
In my tooling I always set:
--ignore COMMIT_LOG_LONG_LINE,FILE_PATH_CHANGES

/jeff


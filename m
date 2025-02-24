Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B45189F36
	for <workflows@vger.kernel.org>; Mon, 24 Feb 2025 19:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740424149; cv=none; b=ecP6L/TpIqHChgqVD6Re0dGWuL74xAW+7gMowBjKNiYV6NhLuRExYlVIzxnKBuYa3iS0ykQxiYHpog3HD73BYo4e4CCleVMDXDm7JisXtXlYaCZOB6LfCPrRhYn0BvKoVRB6ODUmN2Hq86N5+Q9kRrrzAjLvxQtavNWwEscbNDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740424149; c=relaxed/simple;
	bh=bCr8vR9eIpvmjDP2ky0jg3Mz8hl842I/M1iMYHRf9/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lb31Hp1bsyMJl2NoSXT16vqbvEQJyNADEsMCy5lddjlsqtc8uMt4CEPsXMXP1rhQgIUH6GQO8IsAVmHkGoAGYQ+koEBgoCdE8Cgd9Rxoakk2FhoblP4PqMxqThKaftK6VhL4InFCmIMCr/ky3hv9HSw9pWXeT6tC1e24nlj1WzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ie63vOzC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ie63vOzC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OI13dO004412
	for <workflows@vger.kernel.org>; Mon, 24 Feb 2025 19:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zavfbH1zR/1Hpjz69wllzxoWL+BaXWGYetefdcl5eoY=; b=ie63vOzCZ1O5web1
	y34A/gcZOBLTWM7sX+71F1kllAlZ/z9IBPx1gEE0nLWuvnv8vjJH2wrkJAk3SXJY
	vkqLeaCz3/GQQWxWF1WflBTpyX+ajBn/b3R/ihGAKumaf3ANILsmYDFwWmQLYxqc
	TJnu9gMPKHHur543bb/rKNJLGaYLmQGhZgDsiizpcFkGwOdHszHoKBkWMEApGuAw
	23z5lAGZ5J59dC98p/fOdPs0BAmYeQRIxMjQdKnj3uxrcntScJOHS5MXWzYq2HCF
	6xGV5bfp2Z7AzkRjGMXzU6swerVk9rTx6Ax4j6FyZOUmhNTivqSyor/nayogqNLA
	1oKpCA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xnegxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Mon, 24 Feb 2025 19:09:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-220fb031245so81339025ad.3
        for <workflows@vger.kernel.org>; Mon, 24 Feb 2025 11:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740424145; x=1741028945;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zavfbH1zR/1Hpjz69wllzxoWL+BaXWGYetefdcl5eoY=;
        b=gyO+cc8idcAcf9ncdMHSqXYrK7BewOYbhG9+2mCHSo7Rg/MNCXjHsf/375jRbE7m7Q
         J5/BgL6BGd0kh7uc6qApD62r8JW/lXVqXnl/ibsc/SboAj1OhlJjZaer9LajWMEa/Fsg
         G78ejQ7Slu79tD337YQXQr5b43gK2bgq6QmrVaG+sxmW1hBRs5J6UZg3xpyo2m+aDPxR
         odY+sHCM0tqglKS9OujiKkA4Wyg3zt6u/8KStK8X2rXoBhUR+5Hrh71ZS6/5/Fi6EaK3
         MamGVEMQDp2Hc47Fqe918qlmafg9ColCcsPkBJEDwE9jNTr4ru+auznBehMkXc5bZdcV
         Fg0w==
X-Forwarded-Encrypted: i=1; AJvYcCXG13fY2K6sF+bcUBxY9hTL2j2+jVKHBC42tGNIfRmZtFmhFsiYvEp/OVbVwVfqi+R5BYtcZgLpItc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5xOMmU5AbE2cB12apBn6xoPlfxxFE4vSth1ptO4STuz6F+SLb
	VElxiFRpcHQG/MJzPhW6ZTFeVtB+UoEENnKOE13dI/E2w6MkTsU42Y3i50Z6YtDLLA7Cv2cuahw
	AAHN9T3j9pTupdDEock4aohSLqhred1XUOOXK9+6hESn2LcgpsVZ8jWx5Xb8=
X-Gm-Gg: ASbGncty+8MR+tG9Yyeoevq0S6Ax+dhhhPWZ52P3Uw6jiNseJ+RnluS+hE25rs8n9rP
	W9Ne0f/L+IHZLmuboemDDY4Spb4sdjLOAVqZL8s7Q6ruDiaWTcooQE0omKlWUn4NE+5pXMl4vFV
	qmJKP9KOECk8ciz+syn1MmYgj8yH6Ab+XG1g01PkbH7UhgifkN96frxnMPy/L5HUiHrunfLTOxd
	ODplB1xFYSodz5I7DY4Q4tSk0oYLjHx4DvLrOBj74+KFIWw+NuDisj6UD2CzQY+XP8EfWxl5LoM
	gLjXHPSoSPfAvBU1a3YiZfGPhZvVf6K8pXxBTyy2ZwjFIJmXovMvQo6VxYcIkr161RbGlAp8h9I
	v+9J597pj
X-Received: by 2002:a17:902:d485:b0:216:4c88:d939 with SMTP id d9443c01a7336-221a001566bmr251110715ad.38.1740424144823;
        Mon, 24 Feb 2025 11:09:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcdxrqY3Lyk9CkgTZBMPvmDZreZBBgsyz9s8m4CzkH23FajmfKJsLRld5cYoHmaSFvTzGfDw==
X-Received: by 2002:a17:902:d485:b0:216:4c88:d939 with SMTP id d9443c01a7336-221a001566bmr251110365ad.38.1740424144434;
        Mon, 24 Feb 2025 11:09:04 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d6fa9b75sm181348775ad.199.2025.02.24.11.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 11:09:04 -0800 (PST)
Message-ID: <763bd905-6f1a-42a9-9f81-acecd98131a4@oss.qualcomm.com>
Date: Mon, 24 Feb 2025 11:09:02 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] checkpatch: Add support for checkpatch-ignore note
To: Brendan Jackman <jackmanb@google.com>, Andy Whitcroft
 <apw@canonical.com>,
        Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2YebJuReN71148h-ljE7mg1dEvcg91Ms
X-Proofpoint-GUID: 2YebJuReN71148h-ljE7mg1dEvcg91Ms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_09,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240124

On 1/15/2025 7:33 AM, Brendan Jackman wrote:
> Checkpatch sometimes has false positives. This makes it less useful for
> automatic usage: tools like b4 [0] can run checkpatch on all of your
> patches and give you a quick overview. When iterating on a branch, it's
> tiresome to manually re-check that any errors are known false positives.
> 
> This patch adds a feature to record in the patch "graveyard" (after the
> "---" that a patch might produce a certain checkpatch error, and that
> this is an expected false positive.
> 
> Note, for Git users this will require some configuration changes to
> adopt (see documentation patch), and not all tools that wrap Checkpatch
> will automatically be able to take advantage. Changes are required for
> `b4 prep --check` to work [0], I'll send that separately if this patch
> is accepted.
> 
> [0] https://github.com/bjackman/b4/tree/checkpatch-ignore

While this addresses one issue with checkpatch, it doesn't solve what I
consider to be a bigger issue, namely to have a way for checkpatch to ignore
false positives (or deliberate use of non-compliant code) when run with the -f
flag.

I don't know how many times I've seen new kernel contributors try to "fix"
checkpatch issues as their first commit, and contribute broken code in the
process. This is especially true when trying to "fix" macros.

So IMO what would be more useful is to have some way to document these
overrides in the tree so that they could be honored both when processing
patches as well as when processing files.

Note that thanks to Kalle's work, the wireless/ath drivers have their own way
of doing this, but of course that only works if you run the scripts.
checkpatch run normally would still flag the issues.

more surgical:
<https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath12k/ath12k-check>

less surgical:
<https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath11k/ath11k-check>
<https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10k/ath10k-check>

/jeff

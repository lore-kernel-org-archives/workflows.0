Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C51B13AF2
	for <workflows@vger.kernel.org>; Wed, 28 May 2025 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748442000; cv=none; b=tgoG0ocAnNf/DwbbYxdK7MzuLWiuwWXW40PRSke3mDI4T9Z1XNekIbUBAuyM2isbCiUNLBFZDfG6sCHfKQ2hrKESHI3L7D0TOQticrWqUKzkz/WTrEJ3je8JI81HILF5qB5UY8gtzDrYGYOO9v+afBv673joG47MjTy+xf5yt2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748442000; c=relaxed/simple;
	bh=P0JeSfzEU9xKC6cFIXIZiDMfxCBJqTbMvtgiS2FG+qQ=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=eCRl71ofRr913kPWgXCLwV0CzbMgcoHiTF9JMnzjCmsVqVbm5ulneAuNwZvoN+TOxwvddtoEml8ocTapb/XNLB4zQ55+2QjA2g/gXJB5KTTeN3FQCw7JjKzkEUnfSDyM3DJ6wlSl/0Dn3tyW8y3huqFRx/6VJ0ulV5cYid35mbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwCj5mKZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwCj5mKZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SDKSSe029118
	for <workflows@vger.kernel.org>; Wed, 28 May 2025 14:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P0JeSfzEU9xKC6cFIXIZiD
	MfxCBJqTbMvtgiS2FG+qQ=; b=dwCj5mKZDqwlDJSUMZPnULI3DvIyZW9WEb/vqM
	/sG/M8edaGPNLGkClpYFUgZJhV9ljyHyHP1N505PoFECmzz1tg4r450SYYdYK4km
	vVbQWqYn2EvSag6oTKXqGOasuco/mAf2/NLCtiLWFl9XldMWvINx8IzRe5VnxVAn
	9EBTSYalm/eAdEQM9nnq1URwkjOPjGnEt/Om44tmSHr7j0oFQr4+sNTXY1WlBVDF
	AN6OtgyeGyb9HUGeI/R+57QnlIMZEL0NYhZmQcLpYElUFmgkgjULGWgyZN891DhU
	tgWQ+sDVQDnc7X1VlPTdj0mOTjsdvQtIBTCXo2Lyvv8TNH8Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992mgur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 28 May 2025 14:19:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2343c6775c2so32194395ad.2
        for <workflows@vger.kernel.org>; Wed, 28 May 2025 07:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441997; x=1749046797;
        h=content-transfer-encoding:subject:cc:content-language:from:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P0JeSfzEU9xKC6cFIXIZiDMfxCBJqTbMvtgiS2FG+qQ=;
        b=JVS/9lWMvb99xRdxX+toBzzKJwaTzroz13bQx/xS2tvNHEZCLBmqRtYQN3mp9dTy58
         xS7rnpDApSDfXk6s8SxWKSkEcIpN7QWykNuhnWteJhQiTuk2+NOuC/U+af5hwK7la2ir
         obvA/frbQzitw892gEdlb9vYJP3F5yo7ji07MhhiQMe4UzhzZO4zryMTZoAE+CA1Gbqf
         8x7BrkrvIluk7KnyJZk0uNcGT/pzf2ia4z8A/4zwP3W7Shomvqimnaha3gM7p0fx8y+s
         rz5gclRRDhg9bdLR/A2oegI/ow17IXXsk/dlSzOV0iGKp3UD23YMSceLzLG+keajB3eZ
         nbTQ==
X-Gm-Message-State: AOJu0Yy8HoRv24/11NeTcldhZpcKYdheXkdLTOAulhsy6/DE2+2UnRyb
	aldy89RXSd/QS1ghahXN5QF+11qGhXBZHCu8H6gNAyG3oBR2Q1zAbromRnxJGo8KCx8VoWvbuNi
	xi6Z5jKElLKQXr/KnLO9v2Yp2ET8qrYG4rOwST1t17h/Hpx8UqtnHgSCk+oTcd4i2k1QFfmU=
X-Gm-Gg: ASbGncuWhiVc5xrMcorg7CmmDo6/K/xLddQU5S1cjVkwotX3vPlUlfDY+hgfsjSsi6D
	u/ZD/wAJfAMsWufhdD9azr+FC8SeLzS4syeSSXUf1b3kwcFOqa6oFkTMPKa83TC6TGAY0QODxt1
	uhN4QgD3wKYsmaEBhX53aAdljuhoJ5yLZavAXvzM1a0LvanKnQQM/2HpGZYqCgfknEcyo7DZIBm
	neQad5Vs1DMx1TT+KdPyAsJkiQUPBcwVc2BQrtPlsZrIG93VERdBnW1WFvAGJ/s2vjkCIieQZpH
	UsUTL/SqeYX2UVTIBoNw4yJ8HVHRObhN/CGgWqZoT4gNVeP2BUP8xRdAKsC/Jc/i6Yw=
X-Received: by 2002:a17:902:cf03:b0:231:f5a8:174d with SMTP id d9443c01a7336-23414fc0745mr240722665ad.44.1748441997278;
        Wed, 28 May 2025 07:19:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2XMyX6tVl1vltWW6TTLP1aIabGGM+9H0Vi8m7Ho8SdlHP83i6iOAxQ1HoeI5scFH8kpy2Ig==
X-Received: by 2002:a17:902:cf03:b0:231:f5a8:174d with SMTP id d9443c01a7336-23414fc0745mr240722295ad.44.1748441996766;
        Wed, 28 May 2025 07:19:56 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d35ac993sm12306545ad.174.2025.05.28.07.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 07:19:56 -0700 (PDT)
Message-ID: <67f86f2e-d3ac-4fbe-87d6-186487de5721@oss.qualcomm.com>
Date: Wed, 28 May 2025 07:19:55 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: workflows@vger.kernel.org
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
Cc: Johannes Berg <johannes@sipsolutions.net>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: Depends-on tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEyNiBTYWx0ZWRfX/pAJdFLk5ZuB
 wMM/vsTK4csJI8vOj3LCItXtfHV2MQm+grpAeaiRCCZHnYQK2zlm3R+l5AJoi2limlbeTt0BVss
 8Y1UiXi2fRQwvEf2aIOTvroGcuBaBxCB3+WyXkFEFvM60vURUF8EyiOO7VhiYTZ8HRrF7AKkDSO
 5+Y48K6oyLVQFfrI8A2SlsWw0oqDarhIH1C1a9zgK1czg1Rj/vs0Tojzg3rz3ijV1c4SiBLa8F+
 7BAKioXnIhjH9EsGo5BsTAIkxzJB0b0AZ0woTAa5hIQLZ867X1YW6aoVLZ9+4FCDXpoIVvcwia5
 x1TbLYf0rw6qODZGgkTXk/zvclHEALFOdmf9hNtjkYUCPYYpPkRtDx2f7Bd3GIoto9tRFtmeaH+
 acAInsy72MG4cYGFk9Y1W0vx1MfRZsz2smBhzNjg/tBEa7teboxD5cHD7fOoCe78I3gjhACI
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=68371b8e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=voM4FWlXAAAA:8 a=NEAV23lmAAAA:8
 a=4FegaWSuMQT4BHkljiUA:9 a=QEXdDO2ut3YA:10 a=WEDqQ-4R3nIA:10
 a=4b4ywMqCX7kA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-GUID: wMqzkqGAdIuQLyk5a-iX5hPV0kR3U9mu
X-Proofpoint-ORIG-GUID: wMqzkqGAdIuQLyk5a-iX5hPV0kR3U9mu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=723 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280126

patchwork itself very recently formalized the usage of a 'Depends-on:' tag for
flagging patchset dependencies:

https://lists.ozlabs.org/pipermail/patchwork/2025-January/007465.html
https://lists.ozlabs.org/pipermail/patchwork/2025-March/007490.html
https://github.com/getpatchwork/patchwork/commit/bc2d1b1dcf89c619e027ae4dfd3036cba30e5583
https://patchwork.ozlabs.org/project/patchwork/list/?series=442332&state=*

Note that this support is only in mainline and not part of any release yet.

Curious if the Linux Kernel community will adopt this approach for flagging
dependencies.

/jeff

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907ED405EA
	for <workflows@vger.kernel.org>; Mon, 22 Jan 2024 20:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705954244; cv=none; b=kudNQFMBEp1A50gCtgfF/Qwy+pZoOC68gCdBhBUc9hl1VsmudGF9q+DYSzpbmAUKGKrXTLI26XB8gm2TwDUuzYcGEoeSI+rUfR8gyNP+YsW29wVKlxPqUQxqZwC+AHq1VmWTaz13Ppd0M3EOoJPcIyrzqBOMrC8NKB1XNX6U2vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705954244; c=relaxed/simple;
	bh=H/iOMj+r6Vg7BAQd7pMxjbBMH7JYC3aAQSRpyIU9y3Y=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:CC:Content-Type; b=scOg6FjoRXCo5SyTfNXp/SmjaAaAcNKoJQe3GPJohHJzlG3LtRMzFbbFseSNt93iekxgcBVb2Ymzaxc9fISRCdLV5bzkzUI5gWo6N68qWEoQKJWy6GtQEYzCeolqj0gkcSN0ZZLPK4WW693Ycibzx2u1aa9ZSSefjF6ivyoFKwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VYBoBQK0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VYBoBQK0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MK5mNa012705;
	Mon, 22 Jan 2024 20:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:to:from:subject:cc:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=H/iOMj+r6Vg7BAQd7pMx
	jbBMH7JYC3aAQSRpyIU9y3Y=; b=VYBoBQK0qCsNzoLpAiaoH1SjFvcMLUaQQ2kx
	mah5UaOqWKgGUktwp43C6Zlbyvtg/yr5RsDNus6BsODrhKHiN7Zp0t2C1oQ80k7q
	fbzKB+2PgjUHcnQsijXwvftVkgXRPcmmbJADaI7Ga/nygbLZIO8g/vBDpV/lebBM
	PJDSCm9Al1zK+33SMy4vqs5FN2dekomKDY2xCHu8/aIj8nvVq3/DkYt8deomoBxb
	yP4NLJtWYe+cnoSP40Fya3yG4+3mtGLRxlvuG3lz4A93Ehx8HkkyIDqe/HI5FytQ
	3sEpvRlkhcJL2b2vdjGvCLz960ZtKOGdb/T1Ax69Kzu413ZgZA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vstd98rbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 20:10:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40MKAev3027262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 20:10:40 GMT
Received: from [10.110.26.199] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 12:10:39 -0800
Message-ID: <403a40ac-10f1-46d9-bab4-86cd713fe5da@quicinc.com>
Date: Mon, 22 Jan 2024 12:10:39 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <workflows@vger.kernel.org>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Patchwork Acked-by question
CC: Kalle Valo <kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aIyficoj-KwQuJPhp7vhqg-zYD4H4uAs
X-Proofpoint-ORIG-GUID: aIyficoj-KwQuJPhp7vhqg-zYD4H4uAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_09,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 mlxlogscore=588 mlxscore=0
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401220144

I co-maintain the ath1*k wireless drivers with Kalle. Our current
workflow is that I review and give an Acked-by and then Kalle does the
actual patch integration.

My observation is that when I give an Acked-by mailing list comments on
individual patches, the appropriate flag is set in patchwork. However,
this does not seem to work for a series of patches if I tag just the
cover letter. Just curious if I'm doing something wrong, or if I'm
expected to tag each individual patch, or if this is a missing
project-specific configuration?

This is specifically in reference to
<https://patchwork.kernel.org/project/linux-wireless/>

And where I'd hope that the following would tag every patch in the series:
<https://lore.kernel.org/linux-wireless/bbfc4752-0a54-4e8b-b5c3-86005ebaa834@quicinc.com/>

/jeff


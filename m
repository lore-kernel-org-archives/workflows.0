Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969D0749C
	for <workflows@vger.kernel.org>; Wed, 17 Jul 2024 19:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721244643; cv=none; b=fYWD/riJh8qk2l9kIGphEzzWDJ2LGzKMuZTXrNmidjRbvCFnsyaOcB5I++z9mr8gFwwEN4i5eDnQ6LK+0aWDluBRpCIZkqi422Bq5jd8M5LdBFFL6QDOpUiXlk3d1Tke1mlS5oidQJqcehPmdFXSBjaV6nzS0firjlQiZKdo5gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721244643; c=relaxed/simple;
	bh=CXzRmAXmqcameja/Lomnn48tEOl2g3NX9vHg4ntpq6c=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:CC:Content-Type; b=ORNb2OrO0WtfKTnTqk5JMwb8796p1Uii4Olq68/tWaki2zDHRtsB0HfFi4v+iGfIKOF7WiU5PAkS4Wm22Lee8mvz089wH2loggpYoO++bW9LeEGHGr3CHOyzDbdkcoJTAGBUqUYKVrKMMbj06I6YhxFpZpJYAC4bhQPrWFRNMH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EJffZerf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EJffZerf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HFJvau012796;
	Wed, 17 Jul 2024 19:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CXzRmAXmqcameja/Lomnn4
	8tEOl2g3NX9vHg4ntpq6c=; b=EJffZerff8fbsCLx/RJZrOoEKTbjJtWnlT6N8W
	3GPWmZ9+34kWX3UpHTtd1yZdzJfmZh2W2FouH2JBNqwJ5fmtrlRAl01tHJF506ul
	fp24ASusxX1tf37Ma+XiIdwla8Ivr1iaRPoA8eLkV1db82LWYk/AL7HTGau1YGc5
	sv6V2vWaBcD8HGP2BdmsVTRYYxzX9ikMJX3slgN4Viv9oEeFsdb0YwXEFigL/gBx
	6hRMK3Lj7SgY5y/mWS+MLdQTUCjrH5I8xtt6OvWNpW00Jn+oJ5MZb1DtSkn9eVgC
	107wTSpQ4JH/FbxX4z+ow4GEnwzZ72wJj79AoTuDTppEauag==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfwbfq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 19:30:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HJUHiU027162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 19:30:17 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 12:30:16 -0700
Message-ID: <1bcfbc51-18bb-4a5c-8a1e-a2de794ff00f@quicinc.com>
Date: Wed, 17 Jul 2024 12:30:15 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Is there an integrated b4 + patchwork guide for maintainers?
CC: <workflows@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VIQ1uVWqjKSdmVaNt-8C098y1jFBfrjU
X-Proofpoint-ORIG-GUID: VIQ1uVWqjKSdmVaNt-8C098y1jFBfrjU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_14,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=382 impostorscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407170148

I'm in the process of taking over ath.git maintainer activities from Kalle. He
has shared his workflow, but much of it is based upon using Stacked Git (STG)
and a patchwork script he authored. I seems like many (most?) maintainers are
now using b4, and Kalle fully supports me using it, so I just want to see if
there is a guide or sample workflow for using b4 along with patchwork. I'd
like to adopt a proven workflow rather than stumbling around on my own.

/jeff

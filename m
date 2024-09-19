Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349931A0B1D
	for <workflows@vger.kernel.org>; Thu, 19 Sep 2024 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726758518; cv=none; b=Y0E1++SCNT93LvqHHE4Z/cpqj166oyIWd7zEHP5Ixq7DtLiiGRvIOnNeQk2BEDZYDZoaIN4ibk532oz8BN8xVWaUWGTNv3Yoi6i7Zti9gkvt1za70BFRDn7If/V6pgkUw7mNR+3C52iRjuzgJZIwFDXs+0bVPSO/IVz1//4UjTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726758518; c=relaxed/simple;
	bh=51lL/Ui3etWeVNrgCJZTfP6ljtlFeWDa31S/q/5AZmo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=G3fTE8OZ1Ni+OUBtTB+9asuOLE39Pn1H6aHiWSV6qT5MKJdELh1A0GIpLBY1hYXMGnyDRgm49Qxy3xJMna48A5muW4rHGacWufzB/asAhGs1W3Fh5tg35iAFe4O9FhfMq+PLcIi2Asj4+GFmmVoTO9cOYMrzTHMSuyJnQSuXYwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kCzXZ+MI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kCzXZ+MI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J9vBgF027840
	for <workflows@vger.kernel.org>; Thu, 19 Sep 2024 15:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=51lL/Ui3etWeVNrgCJZTfP
	6ljtlFeWDa31S/q/5AZmo=; b=kCzXZ+MIaa78J8Qsv2NbLKSPAYPF+XeZ1CaL9J
	VzfljP6TcbG+HY52qhrw+ymqDZiMFPbUWFcGrCpF7zCB5u1G7jDYdvXEhDUprjw6
	MQLjxWF+VLV8uoqH8qvnXZZxrbm2if2sA+zX+9DGe5ejlSp8t+hkqAPHVPudaX1C
	nEWbx7h8Ck9y8MUdSnYtC3r4CzGuHz1z5+3KDOdyIYkAqVGNJaEbONmqlQFp2Wzr
	6OZrq4I9yatDNaT+JIdfq3fPcBBQu0Xq3ZvPatFWL47vM7nMl46fbIYvU6Jig7HA
	1Ss+QjpthKKHflZ72mptH6TzTSK5WfRPX3G1Yu38Ppfi2UoA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jewt46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 19 Sep 2024 15:07:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48JF7v7Y014784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 19 Sep 2024 15:07:57 GMT
Received: from [10.111.182.77] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 19 Sep
 2024 08:07:57 -0700
Message-ID: <1e86dfd8-8b69-4e51-8e39-524765a7b355@quicinc.com>
Date: Thu, 19 Sep 2024 08:07:56 -0700
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
Subject: Are multiple Fixes Tags OK?
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CemJ04vsmoNOSr0YuGHTHOMGhdCeuznS
X-Proofpoint-GUID: CemJ04vsmoNOSr0YuGHTHOMGhdCeuznS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=539 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409190099

I'm reviewing an internal change that is fixing a memory leak of the same
object in two different error paths. However each of the two error paths were
introduced in separate commits, so there would be two Fixes: tags if both of
these are fixed with the same patch.

So is there any guidance on whether this should be one or two patches?

/jeff

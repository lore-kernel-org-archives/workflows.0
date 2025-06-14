Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531A7199237;
	Sat, 14 Jun 2025 15:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749914988; cv=none; b=rk82xp0b5vd/UxWMqnphP/EyZ1Q8zdsaj4HQdexWQENRKfEYOd+NDP6yHgs2JcYdSFXBbobfo8jqvZmWMJYYg+LlmbF6NQkBXGt4/vZz9HJKfcFxKav0D93JzBKW8EWqmcovGHu59TLc93H90DIc/gJKxLLiXW+FrraX9UnNdBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749914988; c=relaxed/simple;
	bh=sOwMNuJEdfd/K0ZPJ4x0GcUMZcgwNKbSvXW3wTt/x9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xg3ntk8yfcKgEE6sHQUrDKVsKt22mHg1uXo/md9Go+Oyt13PQOmocMUOj2SD4cOrnmilYNvbsdev5YWfhh5JKmXKNyhrIxzCZRr2c1Xvh+em1lPRc8GrGBcTR+8R7lBXNgd5hifIPo03w5y5+3EeQBDp3zn6sZl8IXXAjPpESCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SG/+hmA2; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SG/+hmA2"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55E7Sbgw020426;
	Sat, 14 Jun 2025 15:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=vFZDX8D7J77H7E2WhOp55VohA1juamykVyStQitET
	aw=; b=SG/+hmA2aqDSaF8wqrYSl3+7V9jfGGF+u6Cl17tQ9UashiQQNMf9pXzxP
	LCkrbZ7/tEfsJF79kEA3ADPc6y28mmwaG4oEIxFK5VW2vEsoEpuVAniu4aRBks7v
	YHaTBhOGOSiOXqpw5FYOjDbk7EDfR5QTWL/iryS4ZwjrIzTPlhGs8c3uoSXEUAtg
	BV8ul6CisyPvX8hLm0vgPKpLTfAF42nsDeNbieQh+CrfWbZjXrIG1BV63f0Dc+sd
	Vzvd5gvulQdfOVZMFS424aV2ntffKimawbnlHWaQYXk/BriAzpORL9up1ir6+qVO
	WBUAEmxHIGAE43USjFw5A98fQPTEQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4794qns612-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Jun 2025 15:29:35 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55ED69mM015168;
	Sat, 14 Jun 2025 15:29:34 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 474yrtybcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 14 Jun 2025 15:29:34 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55EFTWFd38535606
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Jun 2025 15:29:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E32F02004E;
	Sat, 14 Jun 2025 15:29:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7BCE20040;
	Sat, 14 Jun 2025 15:29:29 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.102.158])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 14 Jun 2025 15:29:29 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH] Documentation: embargoed-hardware-issues.rst: Add myself for Power
Date: Sat, 14 Jun 2025 20:59:24 +0530
Message-ID: <20250614152925.82831-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XnskIu8cH3CMAgB_0DPHG301G1KlVu3B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDEyOSBTYWx0ZWRfX+2kx+xVqjF8T uTk2t8ys+GVqWgBtqDHabZgH2zfaGpfJe9ozSZc1ra1Q0dZWFXFqTpjUfqLc8/f8ub3YpptZbsH 5JFkn6gig0bkwAIFCxqXcurvbSx31y8V/QaGxingoAuadpmSPexHgR74l55R1z/c5r1P6rFGlI0
 GLI9xnCE1hyVvikGFbt6YDbS4OF9OxcB71E+M7mzUA/X9QHoj2o3j6t/ZIpBFRvdvfo0aEWVkSe qqwFTuGGdbf/NCYiI8Fvp1lovr1xW3yaFs6XhIcyyTvV0pEkZqfHXubCm5tJOZmbf6Eee1qQt2M dFsEmZnp6avmui+1lCG1hSuJ9eFy1cRt2rPyrBHkt+W1XU2t/McABtw+cVZBON/WA6pkxT4e/zM
 vpsnx2NITclk7S+Kyk8HlOcbnf0+l29XN9RTFcE79eHIrLtG93JJm3WwbAUfUmraXE2cIOOP
X-Authority-Analysis: v=2.4 cv=NYfm13D4 c=1 sm=1 tr=0 ts=684d955f cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=zd2uoN0lAAAA:8 a=vzhER2c_AAAA:8 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8 a=COk6AnOGAAAA:8
 a=JFNNFzKWV5WJRw__lZwA:9 a=0YTRHmU2iG2pZC6F1fw2:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XnskIu8cH3CMAgB_0DPHG301G1KlVu3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=703 mlxscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140129

Adding myself as the contact for Power

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 Documentation/process/embargoed-hardware-issues.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
index da6bf0f6d01e..34e00848e0da 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -290,6 +290,7 @@ an involved disclosed party. The current ambassadors list:
   AMD		Tom Lendacky <thomas.lendacky@amd.com>
   Ampere	Darren Hart <darren@os.amperecomputing.com>
   ARM		Catalin Marinas <catalin.marinas@arm.com>
+  IBM Power	Madhavan Srinivasan <maddy@linux.ibm.com>
   IBM Z		Christian Borntraeger <borntraeger@de.ibm.com>
   Intel		Tony Luck <tony.luck@intel.com>
   Qualcomm	Trilok Soni <quic_tsoni@quicinc.com>
-- 
2.49.0


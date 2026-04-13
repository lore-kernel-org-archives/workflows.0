Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6219B397E7E
	for <workflows@vger.kernel.org>; Mon, 13 Apr 2026 07:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066258; cv=none; b=V7aPnfKs9d3trzQQBBFWut3MrtawMJOL+YoKXo3fg/Vj8a9JShNSGzIlnjscb1KvivKqOJU0jmdAoTyjcRKp6Ol9pl5XgPHYCeqM5hrNumh8RBFzL45fQEwo80DXa6RZf9HZ0FwCqdta6rS3/a4lU+BCPJBNPI4gMco+4wTGaPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066258; c=relaxed/simple;
	bh=emAvh6toXGOd5B6fz9M/oSRBGye5L4QrB2xQSA35mQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pqMWHu3Cvk3fIcWeuPxP5slEU5dgEJbv67D2clriDTyO3tBYkZg0XzR86u6npRZO4A7GII2xJHBnQRaXCj8J4rV3WenESa1gTFefCLQJADTrc2ImtEk9ItylQHVK5ykavrEEhUEAt6DTDqDRTe47F+aDxXjr4VRW4gnF3Qgh9x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AyBXHeun; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCcz/ZaX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AyBXHeun";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCcz/ZaX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D7WjdQ3648936
	for <workflows@vger.kernel.org>; Mon, 13 Apr 2026 07:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Y3r+aQYgMBEMT6ku800XCoTGo0hyxDK8cY2
	8YsHhpYU=; b=AyBXHeuncUj2SlqQHimyEvSr0VpXT1UnTu9I57tHajzg+BhsxqB
	VT+gFyGFZ6IAVYuM2rASS0xVuwiB1TwPF6ezaIq083U1qmx3AY6hMxfDD0DNbvuI
	JYF7icxAQ379i5wVBy2uxql/gKmxvbnWroewB6HKTJn1AO4VSc/yaSUm4PIVmloP
	Ly4sGB+gbbmGSRXEu+feMu7hnVOJJ8H/tINfcfzEZcelsmKko831AjK1h/i9Bqi9
	hWSKVAGapE8mDpzb/pv9Ql5UOZprHaHSYbNLFWayjLRn56ZkexKZr+eOwUB8JESZ
	/r9DrowfD9yUIteloRcd7K/mTSNSDzQlZRA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexcv8f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Mon, 13 Apr 2026 07:44:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b44f7b7bbso97943841cf.3
        for <workflows@vger.kernel.org>; Mon, 13 Apr 2026 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776066256; x=1776671056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3r+aQYgMBEMT6ku800XCoTGo0hyxDK8cY28YsHhpYU=;
        b=iCcz/ZaX8T/RjqRcQWNHWtvkV3XbuFp+Fb+9YG0kV2dEX4VqgBW8UwoLzO0j4llNsU
         y4BXPDqeOFmnK4J0kjqAywca2HenZ84uquBTCxV1OwtWf9zSAOi7SoaMI7eOq2vslGUd
         qimu7nJ+fVW/fG1e58bXsG7c6fY4XmON1S0FFxpP4pilvdzTnkk2cCVLaF+TcE6rpAqd
         EK7Kb6/4x5oHLPL3KIPa9yGzQCHeRSK1jcFYIG/sqCaQIoplngaxfojVJFXnKc2X6wLG
         UufXuvaWL8j1KC5mRPI0s/kSaCvTTNQPIgYgDDGpB5pTSTM0oSqv8OoQ9Zgt6wMJ717y
         rFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066256; x=1776671056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3r+aQYgMBEMT6ku800XCoTGo0hyxDK8cY28YsHhpYU=;
        b=ECiHZygT0TOzZUIk7cuPV6jfHG7hJrux1N/THwiAAeP2JKTYtPfcrvq0Pn6djXkjyW
         HudjJL6PJ73vVrnmoDjQnwVG7n3RSofFYlvJtx4zRG2mNls0eV6UlO++wMcRWpiZD7nZ
         RvG2rtqQH4dYkgE1v8s1hK28BF28A4Mypl9WD/WGlYRKeB40BlazEBCqdBsYyVKzjmC2
         SR6rHNsbkLD4oBTSL9txqW5FNyxQmOAPj4Pmo+n2FbMwG+i+5tspFuycwpyLO+uXM3bi
         +5FPtQkDmHBGOUPccA8L1uUMVjEfM7RoniRVR8R8PrT60856HfClLKuLAHdIhbo7x0wM
         8xQg==
X-Forwarded-Encrypted: i=1; AFNElJ/Jfr9lIcII/zNSdjjSPIIkIpsRDEylM+WsZwNI1UZVIZwUla7NkUnfPdHvi2Ors8wvzGv0PDd67hU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4yMbh1x5S63bGTH7SjRXYBu0w1xnfRHQD1JHq5D4c0amwShOk
	XHnM043KTuMoC4BIwg4VAqENZYmZ838JFXv7L3evlKYYGVAmEyZcAVq7JdDHj10wqKhq+1d0CAC
	ygmpBCDRyUJNB2q6HuiLiplID4amSj4gm/SeyqINQ5VzK4VwdohI43UC6nVnSfKY=
X-Gm-Gg: AeBDievDR2M4gLf1o0xcfOCpTJeZrFpkgplFI/FJywx+WnYg4iAsgMaMpObmerCRFk0
	epB5lSLYBcP1tEyBO+J8PzSUO3tvGOBEs1nxYc9fz8cvOPjIy2TAOzv9ASZfSCAeWwHrULUpCgZ
	Oy8udxpzqG+jghhcSMesQ8y9xKCYeqIe4Mgez0c7JUlJ+VnZ11wqd6x1Zs84jO2/Hr4Xy3Qt8Xa
	j8aamDgiwazon+4ogRvc7ArQcULyt8uVhewlg8hQS5bIsZhdlKb8w44+Vc/9RtF6rNDdGdObL7a
	DD63hGBsuiSFFIt67bu+zoUeW+50WXpieeyac+5kmgbnpWr6GId7u+6HdSQRGW2QMZGW0Qf0pYm
	TeLVbRn3oKmf2trFNabzsXEgAa/ehoYppaC0K
X-Received: by 2002:a05:622a:2485:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50dd5adbf6fmr172964121cf.22.1776066255668;
        Mon, 13 Apr 2026 00:44:15 -0700 (PDT)
X-Received: by 2002:a05:622a:2485:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50dd5adbf6fmr172963821cf.22.1776066255250;
        Mon, 13 Apr 2026 00:44:15 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67a46bdsm137465635e9.3.2026.04.13.00.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:44:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] Documentation/process: maintainer-soc: Trim from trivial ask-DT
Date: Mon, 13 Apr 2026 09:44:02 +0200
Message-ID: <20260413074401.27282-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=emAvh6toXGOd5B6fz9M/oSRBGye5L4QrB2xQSA35mQk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp3J7B9CNNwKiSkBiaBvTBEt7nJ0+9KfR4CI6jJ
 ReGlcqSceeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadyewQAKCRDBN2bmhouD
 1/2wD/9L24BCH+anyswyq/Pmf9FjSqqRahmQhA3Etm/mZhIjFMkR7SmeIS94BhUgJ1CTNj5Nzrz
 GulTVM6c0ublpzeEtJJJvQ0IOxUWo1d7U1yaSxWdplLOdXNMTkJNso4LcT7ImlPimc9wIzbJbAz
 QgFHg/4XqpKgRqY2MfWixigQ6K3Qr5VtakXiJ8FX9QN0TnTCWhDtadNIEHwtdgVpDd3cL86VDXO
 5VXHTfuGiY6WhqwU1cDx2apqEciWxE+8EnQ2alx/ndl5+sXsGmnNSG1usVNKAN3kaSxsGdQPUI3
 0yEgACJPWScLQoecEZ+F9E0VQezmfyDO8eGY4Q4wMDWigvvXK4c1a1J/Mrhgt6K2QcNMi4roudX
 E6eLr+JJtZ68hmfkXyFcrjzmYNloQ0Wnh1Z92i6KSxCzRZJLMvCwC/pvdBgpvD/iNDBEk8l/E9J
 IptP1feZNdAcY1jJ7JyoxxTNrKP9qewZYrUvs8DcyGCoyOJ6a3JwQT8EdPcw4cN0UvgIfdNxAQv
 KOclVDo+A7WIc8z3kA+dW8AZzEDyn7kg3lHooWQO1D04bnlqlK+YfrplJJJN2t9ZLBC9BicXvBD
 DCClGh127H4DYZsDyTAgqzbkiwTy7UGVsr08momrz7NrSfZIXKNS5hjgqcd/yjCnUZ71MQaWS4d q6mSGtE0n8TVtrA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA3MyBTYWx0ZWRfX+MhZgrGhpYey
 W+kCOzAn1picqFxBEgbdWdNjEwewLU9xMYhFeVLBtTYJLk1uhn6CMgCucTMVbMeBsXoImsJW3bu
 SEi2Gh38pHuURdlSX0P+Y+sewsuphggCoBXq/yb5wbt1BCh8/rmR08kTIHMzfo5EP1Fj+bT6k3t
 Errt271zrG9bGmGOTeJffNErO/NB+cbKl8ggd0DzscdvUFCO6M8uFuUQ+FrjVfa9ulrpGhXIl9p
 U6iV9iJfFVKbLq2jP+xn07wS9sNPvw4NJnB9S9uPli+XwTI+Kl+aepIThe5e5Okoy3uqnk8kwdU
 k1s9oS5KPBzzN6jA50Vh+dAGpBCEFXFyroUP84eyaH0hhmHvzY6XM/PKkbQNgVq238pLHgB6aBk
 tJQTviyvFr/mNzgP9ty7awk2T53C82KNrzry0ODsXminvUtmT3hYrrw827aYRDJffFbIg+s7G19
 jyZPOPx01b4NS1VntLg==
X-Proofpoint-GUID: cX9BL1zjpvK7Z1M5e1YCLz_Fz9voFZTZ
X-Authority-Analysis: v=2.4 cv=MqliLWae c=1 sm=1 tr=0 ts=69dc9ed0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=gmrGOGr7E6VI24hohNgA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: cX9BL1zjpvK7Z1M5e1YCLz_Fz9voFZTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130073

It is obvious that one can ask DT maintainers of something, just like
one can ask anyone, so just drop the sentence.  Concise documents with
rules have bigger chances of actually being read by people.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 7d6bad989ad8..4029dc6938d8 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -169,8 +169,6 @@ more information on the validation of devicetrees.
 For new platforms, or additions to existing ones, ``make dtbs_check`` should not
 add any new warnings.  For RISC-V and Samsung SoC, ``make dtbs_check W=1`` is
 required to not add any new warnings.
-If in any doubt about a devicetree change, reach out to the devicetree
-maintainers.
 
 Branches and Pull Requests
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.51.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812676;
	b=pQa1+Q67SNgViJ/ThtvX+SW3y5Qdc8Xswsk1Yc28uEXqI9iPHOXr39nK9zU8OEd6pgqS
	 o1upiabWVphqdmtCi78l8uUvhuvRNPYk2fe76q27mom8JGsYIsj1nD8KOaeZEEDX3adVO
	 4LqaonqHIllOTLScLHoQw7iWuk+42FAm5cmlzyr9xcmxl9qFDeFh6OvFtmGuwoX1F5+Xe
	 ILR5QO2EiQLavM211cE28hs4+ZTgS6/2LuaRgFHaKxQaFUMJVo7S17vmD511iOoEQn4Kk
	 +UAvU2Bgdns4V3JugCoz6GVLBiUhuJsSQTsKIcBes8r1iB8mrgTlv44TDcVmZxa/Lrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vDq4jcasy1FzneuDHCPEGX95otXyZHVoDWeWUfLVLyg=;
	b=Yz1X9A1UZfDCFbz/KiurhpiLmlEWAfpTGPJ3L0q3WmLatF7WFlUBWaBgi8VsIAnQ8Tjq
	 7OllZ7YVih1BBwgYwVt7pbU2OEX+GK/Mngb/xEBI65tj5AWJY2rMltdhWi186IWu+1nNs
	 xsgbCP2tvq7aFVQluGQheEn4fbxR6eYjh9aPnMHjkCMP3sxYWlhZc0HXM0Xf0zoe/XAGi
	 ctI6nAAXfoEwwavRN7lyVqI8UfIRtSF/oorzPeEACdzDSaT9ci6t29iLizh1zjLZeBHmi
	 YIQ9AgxBRxXREKWgG5Gw9gWYvz5FvYeiDzH0FM7Zlamf43A3Q+Sb2h9lXgxfDdow0yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eMpkcoXX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SocRZjCG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F6C606A31B
	for <workflows@vger.kernel.org>; Wed,  4 Nov 2026 17:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F6C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eMpkcoXX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SocRZjCG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjCEe2251557
	for <workflows@vger.kernel.org>; Wed, 4 Nov 2026 17:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vDq4jcasy1FzneuDHCPEGX95otXyZHVoDWe
	WUfLVLyg=; b=eMpkcoXXzDEWl3wxSJHK8piqJ4g2QEVSlcz5wztoaXod8HKy3L+
	51ZTsYD4RENgquw+WqA8Kf0iau46QGBIfMkNKto7l33Pz68M9b2aXvDiyykdg5sr
	2SBEZdOpRZnAKUd5mgdjxZ1v+VXOF0bxazIh36VFDgDkj86KC3BfEvMZN/tLjepB
	tVvl3SgWSIcQOiak0qG0Z6sli/O3CYhQxgNz084JOEm67cRdQamoLXvkTZQ09Gke
	uTD+clj7UBGZuPnG02ivJWCm6/W7FGyS4FVTcWLldwIep/933HnYFPGLh5JjyhHG
	TL5ZCADLr3gLkD2tudY7MveN4gZXTq+HuuQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn1au6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 04 Nov 2026 17:17:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf71bbf197so713150137.2
        for <workflows@vger.kernel.org>; Wed, 04 Nov 2026 09:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793812674; x=1794417474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDq4jcasy1FzneuDHCPEGX95otXyZHVoDWeWUfLVLyg=;
        b=SocRZjCGReEg0AvjUHKYuRq1KIuYG2xjNdhJNQWP0m2FoBEmEgDiltANfMHDxzO9zR
         2+GkvTEPBa1sz4osz4S0SpCA8ym83Q8CcIzmUJw/H5wsNWlSh8EUf3H3jlEZoQI0FBeU
         JJgU7OGApfQrBcWEOjrWL4c59/UGdFLBgx1bcT+QG01lkpcvgUt3XsrUEILxRb/tde6I
         qoZcavP1zzje/jskt369U0/C7OO76IHwn7U2MU0oeKmyO/iYZTbUdgXM38cDBzASpDQ/
         FUA52tIy3ApDjakWNF5ZL9T7THBtXrJmSAA2EUfRSQEMQs/TH8TwrC12pVhtCMMuNubz
         LYKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812674; x=1794417474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDq4jcasy1FzneuDHCPEGX95otXyZHVoDWeWUfLVLyg=;
        b=IaaxJ3er86QIZIwKve+XOVOSBbKWUYyruCPskiYzRbCCr3EiXpLBexRIaBgf9nbwnA
         Oz5/heIR4miEuwuAbipMyjWUDWCw0obK93jiQqntcDrPOrl8aFyqM6C/Dj6u9vCdM2Yl
         UC2PYvH/aKUeIi1YHecJNNnPfeVXA5lmbnKRaE8ZOqc6Phrx5va3W24NJG2pdfD7w3bb
         i+GhjTorJU8frecwlnC2daMXvG5kC4GmxxGA22I5LCRVNtizP6uwVGjoGlWWRDJjtecI
         nGh1xY/natkJYlcoK/jTUWYXdPIGVEXFXG7oiNZjuRrkOq+Y9mf36WFRsfeePNRmq4eY
         e33w==
X-Forwarded-Encrypted: i=1; AKwUvBzWfYTQLVoYOstYVfrVRSsczDlpJZeKsTSZueWbfD4pfhqCyY8wwyVR1XR8mjNlAsAYnxphDZH7mtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UuvA60XWns9CwUgTXJor0Oj8dSuyWF/jetbWJ69TVSHuili7j
	TQTvRWavI5NrybHBWwju2E5LJ4KuhOUt77by6Fa+AGYKjuDDZLG/uCyN3QxkXuzJpmMJck+6CM9
	kEPLjwIKF0CrYVLElRck0sjoJpRkvQG+88C1s3DlL/jcof5+qg0ULaYTYSuYIzuk=
X-Gm-Gg: AYBFou3YuViQkZf7NwWWyktbinIMdUAB9XcpxwD9zyx5BCBoaEkajhDjjHdf8PiSsOu
	/9yra5u8PuWo2lfLEKxBiZZfOQQcSeWUHiT97cU2O+rLfehszPZGJwBLoW74vYez5GikS85EHvb
	Ge4ip56AAibPGVESbw7STPKdGGEQyFNUsbt4Wzv3QT3JKVs9dDgdoduzeMzMLLNDED4K2X2GBlN
	eKIETe8NumPoGI4QpNTGJ/OIb0Bf9odDJ02Pg+Dzbbyi92O+b61iiRUyUysy2NJPsFUkTj79Qq2
	SobosDag6e0dGpR89dXA35abInw63A7PTQ1IyjT81n366eUSazUKzdHhA3OdfUIDSpnUO1xI72Y
	NYIYG1LwqwfF04CXU6Ek8+PJTNTvGgQpmBShm0OXLyzov02DXaS+KmEuTKHLUNw==
X-Received: by 2002:a05:6102:fa0:b0:7cc:26a8:e716 with SMTP id ada2fe7eead31-7d072c3bac2mr7340167137.18.1793812673676;
        Wed, 04 Nov 2026 09:17:53 -0800 (PST)
X-Received: by 2002:a05:6102:fa0:b0:7cc:26a8:e716 with SMTP id ada2fe7eead31-7d072c3bac2mr7340143137.18.1793812673218;
        Wed, 04 Nov 2026 09:17:53 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43cff3fcdsm68837495e9.11.2026.11.04.09.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:17:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] docs: submitting-patches: Clarify half-baked review tags
Date: Wed,  4 Nov 2026 18:17:45 +0100
Message-ID: <20261104171744.439209-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2448; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ejtDMhtNy0vfqQL4gCXN771YJIQNVqhh0UeBvMROUkc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq62i4Cb37I7TOu4fOpk3k5OZDZ0G/MkaumRoxd
 IlMq/KUOQaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautouAAKCRDBN2bmhouD
 1+eqEACNdFFzEnUL+ZR2Mrqj1ckYKxDVuIyvcagE1kTtiN1mGmqANzsE3BrTQntNvRj1C9bJEW6
 UEYRUGpnjcVI/0Nkrh3mAnfnGjkAteJJLDuxrC9YecD0vVi/5ykARPxt4FE+jqWmZ2Rcz9F5Tj3
 7vnO05/gXx5RCw7TrkRAR2+nEoyTwTmeqba/GIN5qNnkxRvqbt+tUqQhu13akYR8ho9sxiICCWf
 2t35dxqebDmzfDbslBwuPTCm6Z1bpci7wzFwEbnHcAwiPxnY/OtIZxVbPXuQkBWkgo3rDQIRmli
 uX8j+qdZnL9H571lfu2cjSM3gYG/p1bBwTYrcInH2Ii31pwyRkyi+GOVo/d4/wGVuKT80qOyuW3
 GjyrVQQj5mdYLGdQAAZBd6SrJ+e2DmKyGFs4OjOCQlp1Fj6q25mg6sXHUCa6ISxdGfC9FtchvEm
 B9aD7/Zq0pJWOaSejynmO8OZRyOsp2NDBoIG7O5R0znS6twqNB5J88ityLw+GEPVdc2olGwBPBq
 QzBWfL30BnfLhVmiYaPphN+oIdEY3NRmVVh8RwTz6Kwj4sX5JdUWy1UBYgKNSopaPHQMQHesMQp
 Q0Niuzq4TJLf62RRnyxeKGZ6VKYeaAxCJzMxsd0cTrpPM7D6/eNAucVEzjg4njvSXJ3Dg8KUi5u iJtIcH/MZ/rNLGA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2OCBTYWx0ZWRfXxTDmNUNBfjez
 y81tPTa1B7TU4lvW4ZSaw0pTvTLl/elurICYQJIGpWgG1uERzu8Oqrsxmzzc9M/EgqbrS75ar1u
 aATqnSvu9RGiVNfDAKloN3SBbF3nBoNj6N2/BhP0KfnVTVWRx9QVzwIjKLLh+Ihkg1N8UJVpq25
 UvgWwOEH/i9tdGXFsj/IftmY9Y7i6kuRJEUK2NmzuG6Maf4ZV81EuiTfrA8IFjRfsPVGeu+VY/+
 xXuyvWasWbEXwtR6mUSJsL+EbW7RfkuPhsY77GoDvXFLaFwRo7a+7fDiuo8Pjd/xseyqJxEztx8
 yVILGPBMlJuiex1LWy4UEuwD+pl+IfeRXAeK4Y2ED1eyBLIuBRSUu87M0PMZNlR0YlnYA7qJW3g
 iXFd+7mSDo6A3LelZ5D+mLEg1LM7/DRaXTxhXjgj8yzvTGMcfggxWIEOgGLKxIj3THIaYR9b26n
 EbUT27YCBU4DW26evNw==
X-Proofpoint-GUID: oLy9x4C7klvjtysFoENp-0Gcd0WcgOzu
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb68c2 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Gamr-6wvbtm0q60XBNAA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2OCBTYWx0ZWRfXyYYlz1aheILg
 JbH/p8TH/PTjLHyh4HEcmHgd8IoeirASxSgS6T1eQZMCYn6Agl3lR9CmTBkOIF8ryghFWw3VCUf
 RNl1Ri57AnyR8MuZEUbEdHQ2sZvwTxk=
X-Proofpoint-ORIG-GUID: oLy9x4C7klvjtysFoENp-0Gcd0WcgOzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040068

Refactoring of driver subsystems or some core driver parts often come
with change of the actual drivers.  If that happens within one patch,
people giving "Reviewed-by" tag only to piece of the patch, like one
driver, and ignoring entire rest including the main concept of the
patch, are not really reviewing "the patch".

As explained in Submitting Patches document, the "Reviewer's statement
of oversight" is for patch:

  (a) I have carried out a technical review of this patch to
      evaluate its appropriateness and readiness for inclusion into
      the mainline kernel.

The sentence is complete, meaning it does not allow implicit variations
"this patch or part of this patch".

Reviewing pieces of patch while ignoring the main part of it, is
much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
not be applicable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And let me even bring a better example. Imagine a patch, doing massive
refactoring of core SPI stuff, 1000 lines of code, complex locking and
also simultaneously updates drivers to the new API changed in here.

Reviewing that 1000 lines of code in core SPI with complex locking takes
someone 30 minutes. He gives Rb tag, gets credit.

Now another person comes, looks at a SINGLE line in one driver he is
responsible for and gives Rb tag. For 10 seconds job of looking at one
changed call in one driver.
---
 Documentation/process/submitting-patches.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index f271d7413f72..d2aa31bdee1e 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -585,6 +585,8 @@ serves to give credit to reviewers and to inform maintainers of the degree of
 review which has been done on the patch.  Reviewed-by: tags, when supplied by
 reviewers known to understand the subject area and to perform thorough reviews,
 will normally increase the likelihood of your patch getting into the kernel.
+If the reviewer checks only piece of the patch, leaving the rest unreviewed,
+then more appropriately is Acked-by tag.
 
 Both Tested-by and Reviewed-by tags, once received on mailing list from tester
 or reviewer, should be added by author to the applicable patches when sending
-- 
2.53.0


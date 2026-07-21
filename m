Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B92339733E
	for <workflows@vger.kernel.org>; Tue, 21 Jul 2026 06:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784614167; cv=none; b=qOXG36iYk/VjqNGtU3IcayQwlkvzrigP6oEd41SKZ/ZYf04ewuQRqL19oJRoNs+kAFnbJyvo4WZf/PRxLGnxhYfpvMxZ/MfFlhcElvocgr5/DdN7xVO+ZnM8Y7FXcVrWCLimrzBdnGoX5RzF4QvANU5NhAYdM5FrlzAqDF7j5Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784614167; c=relaxed/simple;
	bh=McUMQGIZDBMY3HDgi/4pLbhIy41U5MUFfJns5COLfWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mn0u0OdWwWvwQQItR97hfgO6qeSTtoiRTzMN5dj7soYEMHTTd6pKEhfF+o2zOwhAbtC6+2rVZ9t103pHRb/LuDvJBG2AvmYIgAHpYSnhOG83M0ldK5h5gHauFACV2WQVhyuLRXhjmjG/75s1SriA4fs8ZfuEur2qs6ihJ71J82I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/lmI9Lj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqozswI1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/lmI9Lj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqozswI1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KND4la046591
	for <workflows@vger.kernel.org>; Tue, 21 Jul 2026 06:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eQDiN+oK7/btljQ9huRs0D
	TiPt9j6OWdrHFpRdeVSSU=; b=S/lmI9LjEDbRkxFYJFeVwFgEUKj1YJwKahsyXQ
	XaxJ2Y5rvgIQbMiVfhnvsHL2oKYHKDxnMQnYCcUf+fWAl3/MEZBhIaobkhnQ/9er
	Z/RyXyIVX3jfcouhAFXV/pJhOIlJWoCO2BcYXNFyCnEuBGZ8fceP5x3iL7NawBmI
	nkm3u7JjuVN6QUMyQ+/DuFpROsyfi1zNlyX7W/Qt09qwcm0rYNpOnmkGHRltBlGG
	HGgHdUfChPbZYTwQrnbZvacnwcli+b8vysQm0L8npBcW8PW5IRhB1Eeu2Ed1XfQm
	79OhRFKOi60OHRGsydNE8uVRAwa9J5rVGyyMjY7qEjXR9pSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5tm1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Tue, 21 Jul 2026 06:09:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c110a3b6aso122491721cf.1
        for <workflows@vger.kernel.org>; Mon, 20 Jul 2026 23:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784614165; x=1785218965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQDiN+oK7/btljQ9huRs0DTiPt9j6OWdrHFpRdeVSSU=;
        b=QqozswI1+r5YlYY4hjOfwT9SeaUOnW0NoijH6WA/KN6v3OrUJV7z+jBegLYUkovO66
         Lr7Se+55apeU6ax01OV4UpQY4b5vbs2fdJs+895vfJ0VbzL+6pQdCDMPjo36GN26tPhN
         9Bhnn7EQEHf1YaERmAkVCC1UrRXa74hPIfZqIkQWlNNjTZFRqsUYU5FopSQguVpsKppk
         eNDdbIs4emU5riAqQaIqXqb+lUpu18u52uDVUvR78YyRIuYf2BQbk9aGQhur3Qq267Zi
         9aBMTEDKh/uUGU6vrIg0ISGp4lxQTztT2LqTAC49BGgx2cpIEqdtzbV6hoOs0Uy134po
         EfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784614165; x=1785218965;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eQDiN+oK7/btljQ9huRs0DTiPt9j6OWdrHFpRdeVSSU=;
        b=gtK9wvJ6m7tsnuciEtOR3LuX19o+IQzx2fla6jprdO18xsZom5WJXUeqXmOVelMQ9Y
         LyEsj4rPIPctpdiaEFEVXalzmUCjqqFlpSvw/hr8Cnz/asKJAJxoolh3bAovvRXU117W
         vZb8SFOxQPtAHlxs6S0oOKJ2f887daeoaEiz5RuW6MSEdaHdwnqURgAFaYgaM2zoKnru
         LMZxevCzsTSvSLBkUA46wmimZD4yvmA3Z64/BpdcLkA9496q+Kgc0OXfbXbYQGs7rUgt
         PetQWclNuAd8rOzpUEZmuFER9oNd212GxLnlLkL+CJSHjHN8dUZCzONMqBvlFUQ0yKOu
         5Y3g==
X-Forwarded-Encrypted: i=1; AHgh+RqKv2V/uuW+hODY3C9noX7roF6FA4KHqR8uv3SXMgA+qvl2LsRYZsIKLj2xeTO9jqlfprhdpcjKowY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxziJ7MCwZesF3cc4HbbIhqczEvcsqlwM7VkYhY6Unr7NccuBx8
	6RrwKyQHM7C2uz2ZSTZy9nn6gzvXNPEVNFm5YzUOMoxw4wStgQgbELVrDSLt3LOy56vEvU9rcpp
	9NnF/Q1iWhEtM2KRkDfvvYei0fBKnaj7m5egZXaWfA7b53WhIFtTSXAYjWCWMTBNsOvzS1Lg=
X-Gm-Gg: AfdE7cmUfO7nmocdRc22ya3FBnLKgfVGQvaWPGZrlk745NPWR+4WZ80rBgEKQRR6gy1
	xS1p/XPormCmUpjrMT4lA+CBdhV7PpxeksbXIr6wsEv25yM/nv5b8A9AWOxPm8HlPywnmy47uFz
	oIM+sm/6x3paSsOvLdrNPRAap1ZE96nGDkE+lUDvkCOmZoNQxxFLf9sInV+YgGJqkeNHslz4Ss1
	/BGih1GDEdR/sI/laJjEVD1soSkq5olJKa/gVzDvmfSk0UhCyPowdmEU+MX9xLpZMC4lgnSjg5E
	3b07rzQa5j4KVO13fVtgaaKdOWjCN2onRyH2VWqTWDlR8sLR7xSj9M25o501Lq7UXIHijEFVGiQ
	4yJLp9g1N/W8gpVou
X-Received: by 2002:a05:622a:e152:20b0:521:8ef0:b4e1 with SMTP id d75a77b69052e-5218ef0b685mr103432091cf.29.1784614164419;
        Mon, 20 Jul 2026 23:09:24 -0700 (PDT)
X-Received: by 2002:a05:622a:e152:20b0:521:8ef0:b4e1 with SMTP id d75a77b69052e-5218ef0b685mr103431881cf.29.1784614163863;
        Mon, 20 Jul 2026 23:09:23 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e0fcdbsm288414315e9.2.2026.07.20.23.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:09:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Saravana Kannan <saravanak@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v4] docs: dt: maintainer: Add Devicetree and OF maintainer profile document
Date: Tue, 21 Jul 2026 08:09:16 +0200
Message-ID: <20260721060916.12465-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5396; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=McUMQGIZDBMY3HDgi/4pLbhIy41U5MUFfJns5COLfWM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqXw0MSva036b3XierNfJ7QJo7u91qaDKcFJVTa
 t12vPhORjeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal8NDAAKCRDBN2bmhouD
 11n7D/9C+t77cVBPRHCQnVFB0NMzSMMC+db1ewD0DYHsEBR5qpU0mNX/gojv0AklFDlH+GWsPBy
 xiWTyZ7nfKexaOg6Pb0d89/kGGeQQD53cQ0kFylHw87+Tudf9ikZ47UmGXoBW/ldTHw6LgqqG8I
 a/XhgmbcZnU8Fm6HWogyGID7D+zdl6Jx1lqlieGBApCn+zLSt8coNJJH7+g53Zt0bFi5lsmp3JM
 uC7CtFazx6oDpuj/3A6aZSZ8yHlazbDaeSyERKVRMzliAciWgBc8Y4ubxe0Mod8cpsms3RACaJD
 vGedNcEeht7VfiDPoL+Y4drG3qRpW+VhHrYqXfSDvq47xoKZtkdpMXp6oiwDcHuEHKoOVRPvx4k
 IaOsXtjq5CvOVfAnnduaLcgaJb3vbSbb/k0u4obRRFbNPYmnluCe1Qp8F6KyxhxosCdQJw4tos8
 0XX7/Ltc/jNLcrO3FLBH2wVjnOKiJdyY2DhPfOFr2KdOk0njo2tb5juxAz3gtZETbPNpoH/0aYN
 6s8FftwwF8cvO8d/pQDUjcSK5AkBYlsnyfaSATqPvb+5+mBVgTKzplMQerH66nhicMCt6ZqJ7JI
 93eXkb2/09C3HKwAJ7eAL9w5cDmtVxKq+G5Y4jDBqnVYGf+z+rwtCBUtgd5lV5VMiaCV7Js0yV9 64uyxHQn4aQjAiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2MiBTYWx0ZWRfX0IQKntp5bnht
 9dsXqhllTXDKW3zjE7XBD/wP+tUwlf1H8cK7XKCWPf+wRJA7+wTxzIPZjdIqUdectk/RQOHKOp7
 nmng/6GGEUB1S/cK13vkzB5pmiJrytKgJipSIw06AJGI0OUbdKhsooIRPWWjsb/p8bmeiROEcYN
 7C5IK3pZkLm1CS06C2J6It+l095ePOFk5xKZDGJqY+s1/KrKn/pq5zgzeGcouhDmwz5ZopqQZQ/
 2nVKQ/oa3Z7bqRNDXEIrHH4Cp5sIs6Fe6ZghIn3OXY9kiHmBohEz/fN0sH4z1q1rq259u+EMtCI
 uX7VK5cWivQjVLH2iHlYuyva2Vfz9Jiui6tAQSAowlhIky7VucIoNsouiquJYHpFULRUX2JH2a4
 dkZNcYfbr1nER8Iqp7pf8KApv7ezlPFAAvUD4GRyyoC+3dBQOF9VlwY87a7wgeAPULMQ0lkGFua
 pNDGhSP8d59dhgfS2FA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2MiBTYWx0ZWRfX7MIkqYlN+sPy
 8HGH3yUy4Xuj1pr7bUKsv0ppNEfdbDFW/efQ9PACKlCEAaTzxKvc9xSw4gm8dUW3BFoZEhXHvPt
 nNwxRdhsiMs7GeQjMQp/QvTyf29XhSo=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5f0d15 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8
 a=sLr6tAuWVrO0SpXXj6sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: a79bp9pRaQSINaTR_iD0ayfXV1_ORcng
X-Proofpoint-ORIG-GUID: a79bp9pRaQSINaTR_iD0ayfXV1_ORcng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210062

Document how Devicetree and Open Firmware maintainers handle their
subsystem, especially focusing on two caveats:

Devicetree subsystem handles patches with a minor difference comparing
to other subsystems: while DT maintainers pick up OF code, they only
provide review of DT bindings without applying these.

All three DT bindings maintainers rely currently on Patchwork and due to
enormous amount of emails per day, regardless how much DT maintainers
try, they cannot read all the emails.

Cc: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I expect patch to be picked up by Rob, after review.

Changes in v4:
1. Add Rb
2. Reword as Rob requested, add DTS passing dtbs_check

Changes in v3:
1. Add also F: entry

Changes in v2:
1. Correct typos and trailing white spaces.
2. Fix order of P: after C: in maintainers.
---
 .../process/maintainer-devicetree.rst         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  3 +
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/process/maintainer-devicetree.rst

diff --git a/Documentation/process/maintainer-devicetree.rst b/Documentation/process/maintainer-devicetree.rst
new file mode 100644
index 000000000000..ecc3ed638725
--- /dev/null
+++ b/Documentation/process/maintainer-devicetree.rst
@@ -0,0 +1,72 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================================
+Devicetree and Open Firmware Subsystem
+======================================
+
+Other Process Documents
+-----------------------
+
+Please see the documents in Documentation/devicetree/bindings/ for information
+on how to write proper Devicetree bindings and how to submit patches.
+
+Patch Review and Handling
+-------------------------
+
+Patches handled by Devicetree maintainers are processed differently depending
+on the patch type:
+
+1. Core OF driver code, e.g. drivers/of/:
+   patches are reviewed and applied by DT maintainers.
+
+2. Devicetree bindings:
+   patches are reviewed by DT maintainers, but should be applied by subsystem
+   maintainers except in certain cases.  See also *For kernel maintainers* in
+   Documentation/devicetree/bindings/submitting-patches.rst.
+
+3. DTS and drivers:
+   DT maintainers might provide comments, but review is generally not expected.
+   DTS must pass schema checks (dtbs_check) or at least do not add any
+   new warnings.
+
+Patchwork
+~~~~~~~~~
+
+Devicetree maintainers review patches using Patchwork, so the current status of
+a patch can be checked there. For typical driver submissions, Patchwork
+receives the entire patch set, but only a few patches are usually Devicetree
+bindings that are reviewed by DT maintainers.
+
+Explanation of Patchwork statuses:
+
+ - **New**: Not yet processed by the automation toolset.
+ - **Needs ACK**: Waiting for review by DT maintainers.
+ - **Handled Elsewhere**: Non-DT patch; not being reviewed here.
+ - **RFC**: Patch was likely ignored because it was an incomplete RFC.
+ - **Changes Requested**: Patch was reviewed and DT maintainers expect changes.
+ - **Accepted**: Patch was reviewed and applied by DT maintainers to their tree.
+ - **Not Applicable**: Patch was reviewed and is likely in good shape, with a
+   *Reviewed-by* or *Acked-by* tag provided, but DT maintainers expect someone
+   else to apply it.
+
+Patch Re-review and Pinging
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Due to the high volume of email traffic, Devicetree maintainers do not read
+every email they receive and instead rely on Patchwork during the review
+process. They also often skip patches that have already been reviewed.
+
+As a result, maintainers might miss:
+
+1. Questions about already reviewed patches.
+2. Pings, for example when a patch has been reviewed by DT maintainers but has
+   not been picked up by subsystem maintainers.
+
+Such cases can be addressed by:
+
+1. Pinging DT maintainers on the IRC channel.
+2. Dropping the DT maintainer’s *Acked-by* or *Reviewed-by* tag when sending a new
+   version of the patch set, together with an explanation in the patch
+   changelog describing why the tag was removed and what is expected from DT
+   maintainers.
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 0b6b9e6b3900..be6aa5d174c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20285,6 +20285,7 @@ S:	Maintained
 Q:	http://patchwork.kernel.org/project/devicetree/list/
 W:	http://www.devicetree.org/
 C:	irc://irc.libera.chat/devicetree
+P:	Documentation/process/maintainer-devicetree.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/ABI/testing/sysfs-firmware-ofw
 F:	drivers/of/
@@ -20306,8 +20307,10 @@ L:	devicetree@vger.kernel.org
 S:	Maintained
 Q:	http://patchwork.kernel.org/project/devicetree/list/
 C:	irc://irc.libera.chat/devicetree
+P:	Documentation/process/maintainer-devicetree.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/devicetree/
+F:	Documentation/process/maintainer-devicetree.rst
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
 
-- 
2.53.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE1C3E3C71
	for <workflows@vger.kernel.org>; Mon, 18 May 2026 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096004; cv=none; b=pTTIP78rQ+gORpnHyhL66IDC125Mnhb9QMz5Ir1hSM8V3X6OjgsdEkJidq2tsqvQV3XA7CWPoCu6xznoJ48M6PJsrUXbHuxIo4E3RkDEgC6+5KKXOSJzXzcdNLnA9fcVE0XnfkFVBdEODwhtCpYd9ZGLE0WiIIZwRf0/FSRpn60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096004; c=relaxed/simple;
	bh=MywEWsbnG8C6ngvsR4dw6Oxcahx3+ItSZfhu87dPrc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZCi4cQiSxudA3Ow5QumYeQ1CZLoBbK2f9e2ILlrrIfSawZeWPvSZ3CwJHwIffs8glilX665DUGuskZ+/q5MEXOfrM8nCic83vYrr1V8rOK4Dwr5wVsD2yYFk1Y+E6MMb1L3KL6JrEvk/IGaxwbvKiSNVxC+Hae7QLjU7LKCf4zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7xPW22w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y7LG9aTO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7xPW22w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y7LG9aTO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I4gg9x3595145
	for <workflows@vger.kernel.org>; Mon, 18 May 2026 09:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I18mqyGP+9h9hQQewvDHdR
	JLfyFJ2fL/hYo7DB9EfNE=; b=X7xPW22wrdHv/qJT1WoxNBi9i4pPo4d7eCtG5f
	OoQPAm8WqjeVdKdn8vlqG85IErxImGX9EnD4ve0fciTehhmp6mqWQg/0vgR7wDeV
	PSioE22RIdZABUPeiZOe6i+OGe2whCPzV+iqrXZ7vRH9+VvX52QZWyx7cWt5WyGB
	nfSd7PHQqbJKtn2ZnyHZ/LgiBHjuzcscXrgzMMWCWTWnKNXn3roBrTBzzHGYALAL
	/0xkPVxrhxP+cxUAd9HjuV/WGdnWTavvKUUJ1bn3QpXm7P/trdc1j+EVxDwyoQgB
	cQqBjffaAfZDPt2ed/ds3B2qBfQnobDazT/OeKjD5nY3BVHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qdq4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Mon, 18 May 2026 09:20:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso57902021cf.1
        for <workflows@vger.kernel.org>; Mon, 18 May 2026 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096002; x=1779700802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I18mqyGP+9h9hQQewvDHdRJLfyFJ2fL/hYo7DB9EfNE=;
        b=Y7LG9aTOzH8eqwJa4O1GdvrpYDCaXWMqaEuyRA7WaGW8en8jbK9G46O16K35X1wjuk
         JWBSsmyDyPvrsGlEzQwaDQoJvDPBvIp1Ey8A+yk/DSd1TQePBr5PkNfqGabEb0LHCdyp
         NKJByLkkMP/Av3fRzI56+uZFG1IimaM/8QcpqhDpKdq6O404hmYYPaHY5f6RNHMg2mvo
         ODoMdf1UNgGDIERZBEEAjOcD9dhcFj1QW9rTlbOTfqjCTX6K/p4R6lA9W9yJij95k2G9
         TCOjon2vXohKfZpfe+uhJFjbxLxnfrZh3k7JZOfVNjRMx0OHMakyWMuisfu+3yYCk4Cv
         uSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096002; x=1779700802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I18mqyGP+9h9hQQewvDHdRJLfyFJ2fL/hYo7DB9EfNE=;
        b=T6EiRCYJ21gBodujbeDG98+9/Z118aR6BHR/ahIWiujsOpKsrjrj9Yb+Unku2Bmg+X
         2+7Q/67Hk5E3UAgAspyTXdhff8IxUMKofxI4NEtom8ga4VZXD/3PdQB4O41N0k3kUuFA
         9spBbK/j7L9pe18XJE840qr5kw4BrVjoINlP0JFAiJ7Ax8sLlfR1MMlBhgS3UTza6Xp4
         xbvY0NB3ZVfs4My0lg91oondZIZj2dshj5AY4K8x1Osxf5HmZiXRFjJ1JW9ja7YuSYiu
         YVBqMOaM3kYYyX69bOe5jO+8Jedmt5MjyEDEELfQ3rGJ7fCcnKU9swx7b5SWy5LINL5E
         kCDw==
X-Forwarded-Encrypted: i=1; AFNElJ/rf+XnoNFdEvR4ScXCDu35pbO5dRqk9sdcAkyWXS5xHemNnNznvyqNiMnloH6VYWmw8rf8whmjYZ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv/8Rwgkx7Rg1JnPSJUrP+8FdqW6ZnHWXNvLK8SpueTBOMjvNY
	+L/0Xz7WneNamiqCJXbWsPM599bMYJbzaZ1GpjCul96dQaah1EFGI9jWk0favM7Qw/QSer0Lsk/
	fWuGjCujxY+KGFmsUlEw1HqpAab4jp+DVAVW867RmM9GIM9XgkiLQmWJpDmUQ1sA=
X-Gm-Gg: Acq92OHIwhlNtJbLUJ9V5uZvXrbzLpZ39jnoLyItzGcgwHpeC/a2CW/T8Ta91KxKHbE
	qMTMS3FBu8kX9BwiY7QKMIoqR0H9AbWNqTIbL2UUFxbuPEDnbYcFUX5fUO3F7INxu+XV/oGvih7
	G95C5wGimnqXsAds4GLmFi6DEB+PE7h9uQP4rbc8/AGmiv5fYqPKs5DAX2KlpqquRRq6OFrSO1J
	a6J3b1A50mAgV/OwrK2oqkB++erlpW113krrU5F3tvPPZU4UOx+vurAx2lwIgPZYieXG8mIZYaL
	ekBKlN76WYYvjI1kcd/BsPodTLZoOjCv0WA3nuYgVvhFd0pX39AW0G7YqqGNL7qexkJRVFzE10g
	iOg7Sc83SbqeAFbBbl3gTNshY6QUJpLJs9Ljv
X-Received: by 2002:ac8:5d14:0:b0:50b:404a:746e with SMTP id d75a77b69052e-5165a22c052mr194216301cf.47.1779096001458;
        Mon, 18 May 2026 02:20:01 -0700 (PDT)
X-Received: by 2002:ac8:5d14:0:b0:50b:404a:746e with SMTP id d75a77b69052e-5165a22c052mr194216131cf.47.1779096001043;
        Mon, 18 May 2026 02:20:01 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm126595765e9.2.2026.05.18.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:20:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH] docs: dt: maintainer: Add Devicetree and OF maintainer profile document
Date: Mon, 18 May 2026 11:19:41 +0200
Message-ID: <20260518091942.29822-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4966; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=MywEWsbnG8C6ngvsR4dw6Oxcahx3+ItSZfhu87dPrc0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqCtmumnqtz2DrrUYmcqtjtL+zj9KSzXza91qhN
 4vD8nd0ScKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagrZrgAKCRDBN2bmhouD
 144JD/92rFjLhf/92xycJGocLdfGFaVBF38rs2t3jyw2nINyTbk3bmFcdJ+qQ15Phpu0nwrjkBS
 kN5TL5zBtS1lWzgth7hPSasnXYt9l2++lAZF4NFrYlCDyJOAidiEUERDRe17D1bubQGN3OoF19R
 1Cyf1d8dmSs/CbTjlcmKrapsiIoOtev6BFfq0QKF7BFcU8IKcTu2Icblo/NjucSLeJqf8cDU4nc
 heI90GMHoADwGCP/r52UdVRXvGFCOAvrJ7ztUJXa9Ob8vqJ8GqTEmIqJh9RZDQfWay3S3Nrnv1f
 yuqkW2/sQFjKfqJGikHL/nMusKn0mNdLcRZwncZLiOXIKOgIcEv5NFSovy5DU2ZRfDmX7Ape2uA
 Bxyw+yfOT5a4GLGMaWKLfQ+4J28x/xnZl0VRhVq1fHvfxw6H1yF9GI7sEOTtK1HA8T0ypoyUCSx
 N9wj6s5lElz1nMJxwsreTkEcxRWzoFY+NZaGOKIJoOcfeNio3tqG3H0Uo2/BPYnKTZNWQbHf0dj
 7rHJctO29PtNxpEf3/L62THABh6WQSpETSgdEipvyonvgXiscVL39z1OlEYN1KS+CvAq3voq1p4
 hG29sIF89P7RxKCuFJEbOl3oJHmrOeV+4/EE4ue5yGsxkDZMy3o2HxyCtIAZm41UPKA37HepIxS WlUVXarRsr8FZOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LJlXpcnecXW9m3TLHt4HdtZSk7yDYnkn
X-Proofpoint-GUID: LJlXpcnecXW9m3TLHt4HdtZSk7yDYnkn
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0ad9c2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=7C85NsCI5bDNKhsY0GcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4OSBTYWx0ZWRfX78Oguk9mGMJI
 OmM8e2y1kagoYutxG4P8GsGtPoW8SBcNKX7R/si7OQwEQTWGi7IZ9sjlF98nbb6WSTUXeAw7tlw
 yaMQmYyiv+HP0HUz7liAsbCVRQNazBa1Z0C6lL6d6DpyvueoPvyKVWAVGKCjpCGsWqIxA5y2dJ2
 zVGaWJtYnATO5+3TlOmhZHxQv4txmNRxtpTCwx26Zeklm6pXSBWZMghq85d8ROjxyqLbCMVbBMY
 LyYWQy0x6mOD8ah5Dd7N+7w2Iz+L9sl5aaGRY7eXOYK8IG9oCnCedF87YWR0xLZsg/cIvJ7gH/T
 HYiSdq77z6zMW+reaZLQcVPjO0piB22gCOCe4yd4pznM5oQqqFpd7bc/9bFoq8+sWzQSDVpw/aV
 ouRVH5H27k+TM9mvjYtRopqx/DhxOQZS9DlHzNpwV5ix8qo8+jMeBj7T7Ofu4iPg8Ayd1yboACz
 PxO7jHdNsRByIadXPcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180089

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
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I expect patch to be picked up by Rob, after review.
---
 .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 2 files changed, 72 insertions(+)
 create mode 100644 Documentation/process/maintainer-devicetree.rst

diff --git a/Documentation/process/maintainer-devicetree.rst b/Documentation/process/maintainer-devicetree.rst
new file mode 100644
index 000000000000..331701bb2282
--- /dev/null
+++ b/Documentation/process/maintainer-devicetree.rst
@@ -0,0 +1,70 @@
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
+   patches are reviewed by DT maintainers but, except in certain cases, should
+   be applied by subsystem maintainers.  See also *For kernel maintainers* in
+   Documentation/devicetree/bindings/submitting-patches.rst.
+   
+3. DTS and drivers:
+   DT maintainers might provide comments, but review is generally not expected.
+
+Pachwork
+~~~~~~~~
+
+Devicetree maintainers review patches using Patchwork, so the current status of
+a patch can be checked there. For typical driver submissions, Patchwork
+receives the entire patch set, but only a few patches are usually Devicetree
+bindings that are reviewed by DT maintainers.
+
+Explanation of Patchwork statutes:
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
index f877e5aaf2c7..c4929de50ab7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20050,6 +20050,7 @@ S:	Maintained
 Q:	http://patchwork.kernel.org/project/devicetree/list/
 W:	http://www.devicetree.org/
 C:	irc://irc.libera.chat/devicetree
+P:	Documentation/process/maintainer-devicetree.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/ABI/testing/sysfs-firmware-ofw
 F:	drivers/of/
@@ -20070,6 +20071,7 @@ M:	Conor Dooley <conor+dt@kernel.org>
 L:	devicetree@vger.kernel.org
 S:	Maintained
 Q:	http://patchwork.kernel.org/project/devicetree/list/
+P:	Documentation/process/maintainer-devicetree.rst
 C:	irc://irc.libera.chat/devicetree
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/devicetree/
-- 
2.51.0


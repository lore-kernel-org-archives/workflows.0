Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ABC42D76E
	for <workflows@vger.kernel.org>; Mon, 20 Jul 2026 18:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784572853; cv=none; b=K7gtV4BKsWQ2cVz/Oxj3jlf8fOQ3NY0C/1eTYDTyTVxl/sGjUPFVbFDE1DBCZrSSG0lGtx5UaN4CcfkDlqHwwxBVR+qetvEAltlNA0URviatww1gGHF5ajDYSDqB8cDzl5z7chjIrV6vcKEBC+rVDoGm8LK6JoulEJd9ZwVaQJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784572853; c=relaxed/simple;
	bh=jb5f5jGGSKMqZNTu9/xrudl4febEVpxMAwYOHW3ZDHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bqZdo8CbSRKrKGJ+wpxIon5rqELkQQWdo3LRB8NM5vqHLhNgxEmqQAMrO10e5VGGFfHBn4lTXF+W8+UIWrNq5F56lOnVjsaGzSE8SL4D3BZJlfqNpQhnvv80ZrNRGkPuuL/XVuE1jikekPbT7zovE+4eau9gNarS/tnFFkTawqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPHqJK7Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iGVtiCk2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPHqJK7Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iGVtiCk2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KH6b0r2785381
	for <workflows@vger.kernel.org>; Mon, 20 Jul 2026 18:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LzzBPLy7PTw92eX+6/W1Mc
	dpFsBt8ydH/z1Z/cN0fks=; b=mPHqJK7Zs8uwrcVrWtU58qDlj8ZtC4+yxQC/Qy
	+m9+xoBByQC/3wYSblMAx8ztUQIQe4uy2B+OjNJhKuKZ622xAIWmVaAkuizY/80U
	b6e2jLuggrom+S7e9gpFhsVk7R7Ht/JrkYhBZR9Kwx6XGPNp0Jeo+GaATw3A+/9J
	Ms32tU5mCJQ9SXnH7+rmkAH6DOA3Yp/VXjnollt6GGvF3QrWKV9KIFG8a7wnK0L9
	/ZnmFViokMpr0iHV8KC9VQK7a5TXcVcwyHV76BlXTO2Ay05G6ruwTsDK2vSL13/a
	abZnshf6LW/CyovjBrZQBzVk3d4fO4KSb3k9gAqn2If9y1aw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgs52j5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Mon, 20 Jul 2026 18:40:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-520a00c7a03so109055411cf.1
        for <workflows@vger.kernel.org>; Mon, 20 Jul 2026 11:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784572849; x=1785177649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzzBPLy7PTw92eX+6/W1McdpFsBt8ydH/z1Z/cN0fks=;
        b=iGVtiCk2qdK8z9LNyBNvYyZdya04ESKTrwL7SywN+da92o3y5Db08sg9LN+XkewnUf
         JfExwl9P2M6o2q08UATMmf5yGoq9dip/5AhX16Ks5rU2mvXhXsl6lhUc2Pq1xTMQL3EN
         xNTe3sPguC9sGxQqBmZHfTWcKC5IkCrLvHXWdRJh/2hL5PwOxgSX2zIMTRnPRg9kVP5a
         6RpRq9YfGhCPa5wrkobQosU/u8EIy8bg1ww8amWTb0R0lV6OrPsU4ai/72yziBPSc+zb
         cRzUWkMupxw0lrMZ39MtcSCQaBmCKuPS4iIfrqIo3ZyDyal0gU9Oq7rqZvkipqMxCeHm
         ktbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784572849; x=1785177649;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LzzBPLy7PTw92eX+6/W1McdpFsBt8ydH/z1Z/cN0fks=;
        b=qBYt0yEX63/xLNIbBhv/7OM62TgVmIampRN2cPq9u0xvgdX/CjNPVLyLYbUtc5VPCp
         IDEZA7BAKvE3I2/Z3My5cDAQBJ/Q9oUG73pQ5h4Ka9hIKe5oJqKN9rtdLMEoKWDBvSFd
         DJlMZ3ehrSH+8Z7zsev8/cIrGVqDneLCDyRWb+5Wlzx2eqEY1ybKQOWayFLfOXC0mOeP
         fh30VRbqggCS85RQdzH2ecGx6dwZ16CY8egITzgyx6gmc6hhFgJZMoNGJjbiKMln0Ch5
         q1Y5rREduG23qEVe9f2L9XuTV7HXPiGtEbwzOn25MXsk+zltIh1dIyioYmkurgoOqgR4
         LXLA==
X-Forwarded-Encrypted: i=1; AHgh+RrZuLDq26pg6splu8I5qzRK6kTzS9kdEXmRqnJiz/gxysHwaggel8sv9LSdNRxkFB2HjSsRrkjbOdg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylrlo9rff4Qq7/9qwVgPGkCYXBtj8odVGj+wsm/5jaUOGnlinL
	CufVeWEfYEeLOy4FuIrFF1ZKOolWbcaVBmafLpX6Y1yIZi04u24cqNjdk2Dj2G5IToWIQs3dwEb
	ZHWixgcq9hNpVpGu/fSEt0I0xBnrxtSttX20cUSsD+VOijV2uEitRReXyp/MhBeY=
X-Gm-Gg: AfdE7cl9Boiah17MDf8L79Ib98T2IIGUJEfdx7sgll59iWReX9YdC7POsLdoFuzzOn7
	ZWILXwGj4DMenidy1sG/k0sI8yKbapOw2H+6CCqqDhoUAWslbr9vygLVO+dF/6kiqCCFjIuBbZs
	M3Hi+F6HRHH83AIzY/AtyjXyy34ATqSwqNDKgtunk+dNklWyyWvdCYtXHbiK6ISnR7J4X7O/gPR
	BZ0j1oC5lK4mAJv5zPEuqr2NaDARZE+A4JZrXAchf8fYVwnd7mMWk7fxgdMO0cC/tNQnHpqpSeK
	6pnEauf40RvEs6Hv/yvEgbNnaO7JKXyDrliQH4y++sOF7F9MTD0aYyNV4O2HbvgBFjUa07PeDHM
	ATIeBNjqcSUxvvhOG
X-Received: by 2002:a05:622a:2c8:b0:517:9570:c1bd with SMTP id d75a77b69052e-5213cec8dd6mr145534811cf.25.1784572848882;
        Mon, 20 Jul 2026 11:40:48 -0700 (PDT)
X-Received: by 2002:a05:622a:2c8:b0:517:9570:c1bd with SMTP id d75a77b69052e-5213cec8dd6mr145534481cf.25.1784572848311;
        Mon, 20 Jul 2026 11:40:48 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565473f76sm6568755e9.6.2026.07.20.11.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 11:40:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Saravana Kannan <saravanak@kernel.org>
Subject: [PATCH v3] docs: dt: maintainer: Add Devicetree and OF maintainer profile document
Date: Mon, 20 Jul 2026 20:40:40 +0200
Message-ID: <20260720184040.9870-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5178; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=jb5f5jGGSKMqZNTu9/xrudl4febEVpxMAwYOHW3ZDHc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqXmupqunCAGybzLowi9lhzcUVHoEwG50WyYtNa
 TccW3QRjmqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal5rqQAKCRDBN2bmhouD
 1zJyD/4oRGmKMjWEHoIeJl1hksX+ibwVYBZ76qnZoBAy106rkcj3/m/7GpXH3HXOKVpWfTCJYBq
 GWZLMFrGfU43MiDqamrAG5K8Ew3ihSaekliBFeZ8SgJuws5JUC8wNc8Z12ozvEAZADXFZ/Bep45
 gSUzB6eLQDWS6gQNCImkJDf8pAKMB+nRqbvAHj7v2TmMrU3gCySb9hVLMhsZB2hBwEuB+wFXurH
 DaMzjJJx23S1Bj0wJcHlTo+VV+3SW4v7mxH4JGAIjjctSUUIxaL1O5sQfMigFy5qxxqbJXweXKj
 y77Z6Zwlqm71lOukxsyOvs4/khMZWG3sOehkcGviNv/IMrvGESyavtxRq+2hC5jHbGKLW1MuGy0
 teyIa+a5DugrZ7gM30Ieul6nLIcTeuElholaQgITYnrxfxNKERcCN0QZINU6jhkQvM9DuMyQohS
 uvY63NQBnWpW2OtA/wP+Uj6CiD65DDGtt6LDDN27mWp4SjQ2uPgmIHwWDdwf38KjIztK48/VN/6
 9fr/u+n2F3ii6roKgFUeLpIKWVKjbOHnPo/DCgcif4Qpj34l4+Z0rJWA4XaiO5/nXPuIs5TxAMR
 Pf97e4lE+/S3TP5utFlHAsUibwBcBX8aVss6pfv75Yx0vp9ekQsK1Ll7kAsG9WZ6RfTeTMq3iln 2Ni7+0BXc5aZcdA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIwMyBTYWx0ZWRfX3RxnehUdRWqb
 po1lH0aDgFreyM/4FVuxNSCemBuTy76A0bwV7vVk7ppDwuNERHecDX7lyEJ0CoEMCgpTWyigBBn
 gB4JXHlIsn5Z1WXf2cEkaeSPyjkTn4k=
X-Proofpoint-GUID: SvcoIFSMO6duUXG2jldjJcvx_8615cWJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIwMyBTYWx0ZWRfX6ylANo4F2Rli
 jbzNODlBCrz7l/DpHLB6sZin9NBZ7oLabo66RGMnZNJjsci9gsO+um6Q45lWwr2gpByGJH/Rifp
 jUvUB63+aVhyl5KRVDxuoHSBtfXAI4lS39erUrSMubcbzN1bJ0EK45GvjVvWGRxsn7chxWUXX9U
 bCOGy6dhfUTHl0BwSj3jHeNMBAR3YcWVWkSCL1PcBcNKyfao/sV4jPp0fkM6S7/Ii+Q1+EsRRC7
 JNLyazec34kEGAWjZWKSk3U40leDeG5jukimsXmOXpAbiNKC7f7z32f66w6wR1kiAWRwmLJ35Zy
 bR5rG5EWUhjjyZNPBGpzrFdDv5YssWLYAur6VHznBTMtsKFo5pBTd0SxJNADdxe3MoBEeaARbgf
 hNwt5nE+O+3hy/xeJA38nlb4rrocKwzxz2oFZrxLIHU1MncB+y4M/dtQ83+/I/i7587NHcwxvx6
 e2uuujKHSlJiFuhSQCA==
X-Authority-Analysis: v=2.4 cv=CpiPtH4D c=1 sm=1 tr=0 ts=6a5e6bb1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=sLr6tAuWVrO0SpXXj6sA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: SvcoIFSMO6duUXG2jldjJcvx_8615cWJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_04,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200203

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

Changes in v3:
1. Add also F: entry

Changes in v2:
1. Correct typos and trailing white spaces.
2. Fix order of P: after C: in maintainers.
---
 .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
 MAINTAINERS                                   |  3 +
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/process/maintainer-devicetree.rst

diff --git a/Documentation/process/maintainer-devicetree.rst b/Documentation/process/maintainer-devicetree.rst
new file mode 100644
index 000000000000..d8ffe752bf5d
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


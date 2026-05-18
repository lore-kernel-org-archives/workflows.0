Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B0F31F9B8
	for <workflows@vger.kernel.org>; Mon, 18 May 2026 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099192; cv=none; b=NizZTgqxh40owJqQhLoabtulYqC/mxkBOu78aNMkc8yM2yurI6ClH5YvO1oH2erEVIIM8Q7CoXALMFwilZ3BWvRWe8xxKflBhboFDCbSlv7+XDQrJTYOiRj8iNMgxvQa42ItQTpMU5BMzow0bC5/897KFbSYyrCuZcz2WubLAV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099192; c=relaxed/simple;
	bh=9E3qq5D4WZQHWgquf7eFFyaxjAiENCppqVM2VoCoy30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GmJqQTFXE5FNWvI4GJRypBQ0PffdFOGdov3sxAhEcED6rZOCtDV1eunxiQPoxXoO9HD3KTwLMV4G0hEUEQPgpClbwSpzDxzmduvfmTncGMg8fdl/jJV44G1SLZ6eIV6iJ3/c9ZmUOm3fLn58MKQwUNsRk0x5egFRMCDDAp6QMEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hi3mAoa/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xnoc4EYW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hi3mAoa/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xnoc4EYW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I7cKIh352983
	for <workflows@vger.kernel.org>; Mon, 18 May 2026 10:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AEl5MQcG4V9U6z1ZgKV9Wf
	SwRgV+hZqvkiSWVAMoQeE=; b=hi3mAoa/6iQqs4Oh+KyqFGRwQ5W7kDyrObXxhY
	tfIVGVIwm+GaF1h5gY9+PODtSGJu4EcnnuFFiWTOV/sc3XgpjgoLREWztwZWbOrm
	eHeI/5+VzhNuKvziAG3HJexYFLaE+igishnrhUxsFYACut9p0LYXZEaVGYJ9DTJ1
	g/6058w7/Cw2iQVvIDwWz403SNEW18f+G0+jfYYRa/BRo4ACW8LzURUJLBlQ6hcd
	tM2QNCqR6N4hzw1v7Pxt9heDArG8dzP03DTxHRf6HW5K25Sma2FcmqSKtAgw0hR0
	WJSdg7KU2iXaBOaNw5CorrsPESaprm701cyC53lIM9omD1MQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xjagn1b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Mon, 18 May 2026 10:13:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514b673c8f1so27700461cf.3
        for <workflows@vger.kernel.org>; Mon, 18 May 2026 03:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779099189; x=1779703989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEl5MQcG4V9U6z1ZgKV9WfSwRgV+hZqvkiSWVAMoQeE=;
        b=Xnoc4EYWVWtzMvOYUfjw6s6l6pWPFD98cUMPAn7nR2HzxTNAP8zzl9vacwP8QkS2uw
         /YQATAcR5TF5TJJ0xR7EQSEtZ+vibUEUoa25DSwU1vSBePG5FD4iKWxEYsREsiBGyN0S
         Id+W45IyYLaal028c+uIDmeLMvIJ8p9uTCSskt98oMzA9+l4l8S/4Jl7WF+atcZuEC79
         LOflxUYHl4QI7Tskh6sUwO0/JNkgZMnlIZgGYPoWkh15dZLd2VzgIBeVZO65K3N7y9rT
         S3ehyJ5dtQ3Kf9LDCwcHm54MhmLY2s4yDoHdA9zkeZByduv2xcYGon9/BDXs9RzJKg+U
         huSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779099189; x=1779703989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEl5MQcG4V9U6z1ZgKV9WfSwRgV+hZqvkiSWVAMoQeE=;
        b=JBd7JlAGeBpjRcwq2ZvpULI/en3me0iFixnoPBcK9fqCNjDxrTTTzGykjnMgf1AbWX
         ZCvvHjcuGQCUXwu04VITXIQEEVQfA4CabLa3AiRLFVOc+Vdxo24mME/tA4bbVb7OPcto
         Y6X1VsErs6sVGgrWfnQ7KR06igERLw1s0cNaGHu2AnCimH4aA0U6nvswimEV2giNKzo+
         eKK7FfoxTrLBkGSf1NwjKUsCBzZXmXjl4RLxwTHNiDVN08WAH/Z0vnJvBQNeLq/OIpFJ
         HCTfLnnzfIYTtxKEoKgXfFCwCzgvt9PYeKdcqSuWhrrQ35D8g8q6JJmwLbwX03nfZyBn
         6kCw==
X-Forwarded-Encrypted: i=1; AFNElJ+srcpsxlmTBHmtV2Iz5WSgCh0x8PfjzQ4k/G7feiIViQd+4ztYB982woQHM8YUvC9QOa4j2WIusYg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7bAkEAzieTXE/6/I65W5byQJq1kbdXVYQmogMDYZvxFBzZdeX
	OSyClcIeuIlLAFSxmZYJYaYLuSt0gPKkINF3p6XJJgl7G1lV4gtuqgVIYCFMmoYpvrMgRKx3BNL
	idaH7yUCkZPQwc9ABWNBwxuI9mZ3Zm2cUITO5ZWLDG1l5JVju0Jo6STPdzoXQk5A=
X-Gm-Gg: Acq92OHZ7N4d7mWXMvSUq7e02RND61RForAOqL8DJpuaYKIsLhFOqRRc4RmibU0Z9Fi
	+cE5XcegqqHDrHVZIbtKPvjD96NksopTVxQtHinbjQ1G2msrGlVru1Gj9sdEBKrUFxXVi2jiXpD
	dk4H9P+9hf82sbELrTqaqK10+IzeKmDJMJ0y88y57m5C698g6Joi1G9QhlPIv3pnh3rfQg5wunQ
	6hr9qZ6nBtAVOl5dJZlp04mQAlwzDc7Gy5OyCvkmGXfcLWBV3JINmwLxmoCKSnURfZFFcZrNaD0
	X/nId8Fke2dC8RU+r17TGqFpcFFcgauJSLWXWYVWJNpSVRTOueTu4mi0ogTmnbgOVXmOR8Juhbp
	VxMfMq2Nbx7CD42s8ZXeu5ziq16rL40yXwGQ8
X-Received: by 2002:a05:622a:2516:b0:50d:2a98:2571 with SMTP id d75a77b69052e-5165a059c4cmr205872801cf.26.1779099188677;
        Mon, 18 May 2026 03:13:08 -0700 (PDT)
X-Received: by 2002:a05:622a:2516:b0:50d:2a98:2571 with SMTP id d75a77b69052e-5165a059c4cmr205872241cf.26.1779099188062;
        Mon, 18 May 2026 03:13:08 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm240548175e9.4.2026.05.18.03.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:13:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2] docs: dt: maintainer: Add Devicetree and OF maintainer profile document
Date: Mon, 18 May 2026 12:12:58 +0200
Message-ID: <20260518101259.34948-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5055; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9E3qq5D4WZQHWgquf7eFFyaxjAiENCppqVM2VoCoy30=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqCuYrlVysAwtLXXMvpEbQvYDr+bq8SSxz/afMQ
 zlLbT4sz/WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagrmKwAKCRDBN2bmhouD
 117uEACK/anmxHIQXXzJEmDqMdAuebkx2c3ITQYiYPVx/gXQnmSsY2lm/CPK1uU6VRVFngJLa10
 EsYD9D9Jh3g7qK8uvNqqf6BZIlJtXFJwfRK25wYRsW8Oc3uFNDj5z1OINWLiOxd4+zCExpY/gzB
 OzG049WyWEH/Oi5j8an7hDvvot+Dbj0GR9aPBZ/pSsePg/qqVAIcldySjgs85ODFCJGrk0ikNLb
 DwLTrdOhQOiMNXA2hp5ON2t+xQ1xPbrQbFnGb5UEMx4fV0wn86IrYChd9W0eBQTus3tYTXzqLCV
 awLgZv7W+Lc6D+kiB+n5d9FKdkPLd1fHCDQkYjsY32vrPni6f/vGJan0ml2T35BTdFOBapLrUmz
 yxQGwJAUtyOC/tXMO7gUjG5yWb7kxUShZ6ToPGcD1E/bsM4htr/LbCR5Nfeu4CiUYN+Ty645bDv
 8Bks3V5hxYyf5e84JoK6l7uo5sbRrhj8J+WPEjt92rQB8kRm3R6En7y/QvNJHcTzt2tDo6MCgwY
 u7HxVSzMkI0UBW7e13WOGxHOtz9nVCquRLTAUey9UiA8EfiNhjvBAMpMBseRZqjc3k1Zt4u+BDl
 YU03l15h8BINUouIfSsYr1f/6EP8RJ/95X5lZ6YmL2tcvOAuMl9uX+lVtG6LGrfo9GcDjx8Vcq5 Em3ZDxBMKmGiigg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5OCBTYWx0ZWRfXwo6f245MQTdQ
 bGqe3VviLdyU6OLsjAKKt3kDsbgVP/ft22eRAhDTatU00hSDunsZQ95o13pYIlm9jJwE48v4HGu
 VqpTkU8zeEJQfIYM4K8kET4sZmlwld3lt+HcGyL3EMaij7W+NLClKbImYXc4JLpy7ScH5lLNdCN
 PoDlFvS13QEGsgnXwIg4lK6AjmJKskeEPAuBRy2+i1dNB3Z4o1anDP7Z6Sn7pFJAfL+u5xAh0/J
 dkubrK5ngKnVzspn/E4hxWinya+2yOWYFhCQY8Wr/uzFJmDYWyKdKJl0zoW+UXxLRiMGL7OlpQS
 rOKsEGInW6XsThdz0TqGLmYOxV1EvGIo0xDjMYlaDrBXw91sm9PTAy3NJB6MU9w2GzzezZzzOOr
 FR9u5xJOFAaOmdUAIGrExVogdizgaYaFInjGA2bbi4/IIJD5CpYsW/DdXXn0YR3lQrbaLc9/rJh
 F/zm3f7eIn8R1/tkBfw==
X-Authority-Analysis: v=2.4 cv=BYHoFLt2 c=1 sm=1 tr=0 ts=6a0ae635 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=7C85NsCI5bDNKhsY0GcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: KcPy2asQfks5uCgaTi-7avbCqURaVgAD
X-Proofpoint-GUID: KcPy2asQfks5uCgaTi-7avbCqURaVgAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180098

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

Changes in v2:
1. Correct typos and trailing white spaces.
2. Fix order of P: after C: in maintainers.
---
 .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 2 files changed, 72 insertions(+)
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
index f877e5aaf2c7..843f1d124446 100644
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
@@ -20071,6 +20072,7 @@ L:	devicetree@vger.kernel.org
 S:	Maintained
 Q:	http://patchwork.kernel.org/project/devicetree/list/
 C:	irc://irc.libera.chat/devicetree
+P:	Documentation/process/maintainer-devicetree.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
 F:	Documentation/devicetree/
 F:	arch/*/boot/dts/
-- 
2.51.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320080;
	b=vSkIofEbJvS9kGOavT02iTRyXFUS/FzJzeKu4G70xf6FcEAUnORAZ0VI0UmBfgrUq99Y
	 IvNCPDpci9aIaslurYM6ZRpYwaDEeh493ovERRV4KPeIjwIT+nxET+L4EWCYDbspH5hD6
	 8BwIxFf2HEljlnvM2LBJByO3l7TC9qfq5heXG2LAw7N6KupxZJzvC/L/syDeMeEGWhIZi
	 DLLiTwDycp2FTxMoIye+ocpLrU7LWUJ7CFYYDAhbvo9HzNWs0So4Kp0v67aILRAlLUM5X
	 mzOZBtu8trFEk7uPp60vuGPkWHoJMZ1S7JI0t7T6rF61zruN2MLbkuvivilSqCBlMKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HlXgeWxFCsYVgmI1LCtDvAKQFHLkVa3Met4qvlNiqkE=;
	b=rg82/ibFybb00DJwq1P2p8WGilW/3Arfnlznhs8Q8vZYkgru5q+VwWHU8I1O6VqdpnXd
	 5if8kOfgU8U4gjmarxggbi8nua3GbBkjB2L8EXAb04jpFgxK05VPDCmSz79NY0fh+HZCv
	 /SPf+AzQmsHkfnrQfcvua/Hz+0vhBgIIf7XiEn4SmmhGDyURw1+tBJGQqDHhYva21xOP3
	 cgtG7aQqJk7pLlffoDvgz6b7NztaNEz/6nVQN0mxPcVXNmX1Jo2Y60mwQ931ubCybM8Xl
	 IvpppGKmqQKfLTxA3ChGZlo0jy8FUhiq9bbsq/GN15JLzfP1ym6wS6z96vgKcW3DHZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gv8VFnF6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSA1ltgi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6879E606A326
	for <workflows@vger.kernel.org>; Tue, 10 Nov 2026 14:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6879E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Gv8VFnF6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PSA1ltgi
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA6PJ3217037
	for <workflows@vger.kernel.org>; Tue, 10 Nov 2026 14:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HlXgeWxFCsYVgmI1LCtDvAKQFHLkVa3Met4
	qvlNiqkE=; b=Gv8VFnF69MbsW9vjFEEIFjHErJrOmXFrnaDY34cdITUuPULs3Er
	YMsWBM99bRUWQqmmrSwvEz0tK+xPGNdLhrK9io3en+EcIEl8StCc8i5+vcxEenIh
	PzDKhkPZPgZB5v3G82Ve3vt7XV7z4WEEIyF44JVKTbP4wz1vju/tImxXTlgwmKYz
	u/2TsomGWP+ngHE0lIUiQCBUwZ5tH6vvOi0iHcunWUETVuuA9xG3Va1d5Y2QjKEI
	b0AclNkqk8sOypWeJyU866qi4ACDkgGeuHS/Mu1TY9sP4+mWXz3vR7oHDGGpzTpG
	702TtTvRm1uVK9EjbEnBKgkDFedquWY9hDg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtda0gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Tue, 10 Nov 2026 14:14:38 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99b8fbf29a9so792694241.1
        for <workflows@vger.kernel.org>; Tue, 10 Nov 2026 06:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794320078; x=1794924878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlXgeWxFCsYVgmI1LCtDvAKQFHLkVa3Met4qvlNiqkE=;
        b=PSA1ltgiG/2ivCu2rZ+huElYfV/dffBYyc+FfNsFa6D5AkvfwgxSxkT55C2R7EoSx3
         pL9j2DsjtUqZY47d+26gCykfvP/BcBH6ccTwj2uMK1I9hVbUkfceskbJ9CI1PrIKxg8i
         gF7ise+xPflj9JRZrQjXBuN0TWj8roQnmm5CDCoViAL13GwTB7qUp1/p2MJ1jHi6SqJ9
         3JkBsOsgvZtrFt+xQ8zSV8Z2uDTQHgBi/atApErXvvg635fKK5FYRt3tsHZ6r2t2N4mr
         Aa3/bcjTx4tLtXvuFeEetXx9MYNcNMgNGsdS4MqxJmr7whIKDFMob7Z4gmMH02On4PCB
         96rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320078; x=1794924878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlXgeWxFCsYVgmI1LCtDvAKQFHLkVa3Met4qvlNiqkE=;
        b=2Yw2DxB2ofOcJoe7vAOMDlZAiIglVK/5KeBNd8uF44tUhoewDnc8SW5z95yfJRkA7Q
         E70t7XA7tWlNQB7d8ySkn2TQ4/te9BnJKUpGZRcZMI3qopI1NiOTwrs4nLKx4bYEpxjp
         JQZk/FLyg1s3g+GjAbf2rFijLXFBHlMB89AZ62i0E3PsYku2R8L663WYeUyWqJiLkYCf
         ViMLoyMyv0AusTymvdmVSdyqO46APwHQq64PLvqde9XMwdagP5T63mGOZYmZFjk+qVac
         onsNbOS4MfsbMvPJqkC/RbqZgEOTtWzImMwiHvK86NcV9OVlf5RIl+Ne9k2XFQ1HHBOj
         4f1g==
X-Forwarded-Encrypted: i=1; AL+hErEzTHb87tub/84KA+XLDK8qxThuIB7rKlNfwnqKBCqvufgbLBlD3BQkBVKZG9aGsVEHh4YUpmujHiY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eT4SwukEU9AsYFwooV/3MyL3ThlWBBTFWjk47uqpxB3623jQS
	hil+yhUI1htdjBj1hxGzchpeamayL3mGHLApETWZmYH30akEYibE90fp2ZmXtr8BkZrKzFtrzdd
	1ISReI/F/hUsXAJ3K1MI2gSleNSaIYxJUfvfHPwI+6TwSAWQZ0Gn13++UUGFD0sM=
X-Gm-Gg: AYBFou3LgvWNDkkjEevk91LJsiBmTKOM4+mAXdq0Qzh+jHN2AbOUdT/uQxxgfWWXFTv
	Hp/ZMePieXvOxroWwbix9YI2SfIOWZjtPULPOsus6TFQbnN1x93oH8TRxjIRuiegqhWj8Jua2N3
	kChxz/tg5IxoDQhcTvPPSDVdo7ZeAAYnOoZFT8zym/NgTf8KlzqSYWtxdei/epSAkm3FSRH4lGT
	Uz7/7vOo8YfFHTvflyRfVn8d1SaL5VzXBzzSmDZC5nbB/KpivdkQ222ySZE1uRYZnaxjYlIdmCO
	mSiOJMjaDpDgkUSX5UIf0IE0P3P95EvZDLf6PMHdr36BPqERjwqymCVitMoiTB+TyP8FEkl68q4
	cjdXdGSpoMwTiTyXAeD+5RqBJ+pSJObY90KGFToSdIYcGHAbe3UFUtcQ8z98N6Q==
X-Received: by 2002:a05:6102:6a91:b0:7d2:cdd6:6c8 with SMTP id ada2fe7eead31-7d301bb97afmr720177137.21.1794320077590;
        Tue, 10 Nov 2026 06:14:37 -0800 (PST)
X-Received: by 2002:a05:6102:6a91:b0:7d2:cdd6:6c8 with SMTP id ada2fe7eead31-7d301bb97afmr720163137.21.1794320076998;
        Tue, 10 Nov 2026 06:14:36 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49884b99869sm4024355f8f.4.2026.11.10.06.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:14:35 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3] docs: submitting-patches: Clarify partial review tags
Date: Tue, 10 Nov 2026 15:14:30 +0100
Message-ID: <20261110141429.149451-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2607; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Zm5ucH3QzyK+131MnhFZbkBIkNzuwWp2O1N8ZiDdMT8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq8ybFMVJitws7oWjWSIEkO9r5Dx825g3GPOQ9R
 aA8n55mkX+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavMmxQAKCRDBN2bmhouD
 10F4D/94N+fw39TgUThBNGBN+e6BIMIw+Im+v1KD4Iqi8iglWXjTO1VZOTudNUW+hTe7X0/JObr
 LT5AZQmur5IWg24i3tmC0lMmOW3NO/cJw5TjLu3oWS9tnQmPxpBV3XeELJBTnsedk3up5CyF3Id
 AFa2mMkZ/gRZgbqvWHeygUBo35+ilZa4kFdJVJ3CNrstlaiN63xDPeB/nAuFoP3fEDty1dSyC4H
 HgUtjRF3PJ0yj0W2dZSsEiMcV0i4l6Trq1vfxVhXjlQb+dA32W2GCadodHN60kbydS+vfuj52ac
 Tuh7j9LySbvNlSPHy00zFvirrwe4jrajT03wkRmz96Cx9F93JResnfEuOMPOjqusyr+IKpLEvBL
 DT6kG5+oOAtAzMEPXoI5vvI10YCvFmmtnp12yqGbybCF4+ZJ1O54hcd69IlBhWjyMvSvUhLtYxJ
 1Gq/AjWWJxSGTYb3dYL4YTCrV+ji53GngJLv4itS7r7vH7UeKSOzbSCSLnt3GWdKQuSVvv54+eA
 ZgSOIQG3XoH/FymnBqHM6k8uWXvpGEOpqlSfpXInUjgRJF0uHudGkI9Ttnv9UZYHUnYnt6x+Lrt
 hNRZsD+5erYMDhN9YRo9iPtB3sZltkKOlBCfTAJwsraTLMMWqUcO5kVwUxqcBlT3dEbJm1Hlnjw KY7ngzQH951TQUw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: w7lHpXK-7Rz0Rlf3cMSd_V0vyoOLoahF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfX7Gbay1nH4LY6
 LIPT+7hE0G8rv6lae26DMzkNW7OPEIbqjnp4zdn43FBmxb31yefbAoimGrdSFvKOLN3VPu3Y6Yu
 2O2ex0s3F6r+NH0MASBJIlD4t/DTOTE=
X-Proofpoint-ORIG-GUID: w7lHpXK-7Rz0Rlf3cMSd_V0vyoOLoahF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NiBTYWx0ZWRfXxzp2KLhkG+XE
 SUypL784fFMC4+7ghaWyeCVF47klmqJEh6Oas1+PTZm1K/aB8qRGNTcMMYIESJW5Bz0BqxOAAqZ
 pXbWpxTnkEoqhhkV3LxLVY4/QO3WgxLr2U+CndFD1CFe/lpj6h+PzG/GUwVTsWz6NTWp4lOSnqg
 7VB+gQzX4uebJOPPq3mz//pJnSWoR9NhJY+xzvMyyzxoINElHlWXF6vEpus2T8U5QnGtjQJP2qb
 cCHuBI3L5Oc1KFO6kSAsdEdEHBfG9dbn5D4OeJTI0WkmcTXxz22ALZmPtekko5s03m+BbkO5M/l
 A4UgVAGyFM7YAsVDduswi2ojB5nHWeugK7tTCH6FaYHRvg6rpjRsrHPV8I5K2YZhtmrgoT4uqNE
 OO/Q3jsgRP7y4WDI8Sc355iVHTZRyxDbglLI0hyrAsXvK0EwduNzwWLD55cr//Ny2kENhc8AoCz
 QEnP1x0aqikG/AeYz3A==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af326ce cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=QIhr-27iAAAA:8 a=LDBv8-xUAAAA:8 a=QtS_tYemhZOPClHeaekA:9
 a=1WsBpfsz9X-RYQiigVTh:22 a=cgaYBWEFosGJW4rWv5Lf:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100056

Refactoring of driver subsystems or some core driver parts often come
with change of the actual drivers.  If that happens within one patch,
people giving "Reviewed-by" tag only to piece of the patch, like one
driver, and ignoring the rest including the main concept of the patch,
are not really reviewing "the patch".

As explained in the Submitting Patches document, the "Reviewer's
statement of oversight" is for patch as in "entire patch" meaning:

  (a) I have carried out a technical review of this patch to
      evaluate its appropriateness and readiness for inclusion into
      the mainline kernel.

The sentence is explicit, exhaustive and complete, meaning it does not
allow implicit variations like: "this patch or part of this patch".

Reviewing pieces of the patch while ignoring the main part of it, is
much closer to Acknowledgment, thus Ack or at least "Reviewed-by" should
be followed by '# subpart' suffix.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
1. Minor commit msg adjustments
2. Use  Driver X author <foo@example.org> # for Driver
3. Tag

Changes in v2:
1. Few grammar fixes in text and commit msg.
2. Mention the "# subpart-name" marker solution.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/process/submitting-patches.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index f271d7413f72..040f81b2bedf 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -585,6 +585,11 @@ serves to give credit to reviewers and to inform maintainers of the degree of
 review which has been done on the patch.  Reviewed-by: tags, when supplied by
 reviewers known to understand the subject area and to perform thorough reviews,
 will normally increase the likelihood of your patch getting into the kernel.
+If the reviewer checks only a piece of the patch, leaving the rest unreviewed,
+especially skipping the main concept of the patch, then more appropriate is
+an Acked-by tag or adding a "# subpart-name" marker after the Reviewed-by tag:
+
+	Reviewed-by: Driver X Reviewer <foo@example.org> # for Driver
 
 Both Tested-by and Reviewed-by tags, once received on mailing list from tester
 or reviewer, should be added by author to the applicable patches when sending
-- 
2.53.0


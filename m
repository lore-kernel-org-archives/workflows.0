Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867274;
	b=vvA4YctwFg62wnmnMXbLF/Mo3OHy8lY6W5ZmB8Y6NoegqZYERy+y4F7tCsZFzyNd33J8
	 MneJVe5JynlJBoy0+Ze9qDD4IF2RJL5ws05HaXUPlpqdHutu5nwMjG6dLlYEFMLWmh74M
	 VxuShsfrV24A3DbGhUJFFZEAbnv/qfIr/yqb4QNK1VklmgpFz2BZNxCJgSU8iUrjq3n+S
	 1ejPZaDLW+ikjT6IqbC0LaL4q1ELwcBmZ/XdXFTEXyCrMFrZI13E41/Cz0ocDY+x+aRBU
	 G+UHG3yzy9nqFB/RLWB0KgvJZN8oC+7IOn3rO4crxTVoP4TnjpZ2p2oGI3+9Dyz37TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/dL3m32KBlVrCFKIpaR1J0keR5+Y54/Kpwzr1w9W58k=;
	b=tzf+KT1uiFR5JWOIA0bJdbFtIXGdgp7+BEOV56MHfytXpDO8HYg65G4tQBQvuL72oFJn
	 G6Cbc1tRjLEvWib15EuiprxMgRe+bovtkfYB9RUm/8m2GxEEoZVkNrMo78b9od3U8ttHP
	 mMTZTBMgJIrvIsMqtx6z6ACkNZgRaTbSdtuezqybGTGFs3xv7iycdjpik6uJwp9rfpUfy
	 AcaAtnqKM4Sm9tTr9baNQ7Q0rXoG52hzTTzdDQd3wIRPZWCnzbS4SY0T1Uv+X1tzR5Hub
	 GiF8qI6WgkQM9W6YLGTDu6YNfwj0F4Wk4bWiup1GtbE2VdwnpsqDpqF83Q/eEBX8pMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bxeaUVyY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F88j+gzf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A6F606A31B
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 08:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A6F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bxeaUVyY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F88j+gzf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UKun1018042
	for <workflows@vger.kernel.org>; Thu, 5 Nov 2026 08:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/dL3m32KBlVrCFKIpaR1J0keR5+Y54/Kpwz
	r1w9W58k=; b=bxeaUVyYEPSaxZtivSEtc/hjrTVxn1ZqvsRqen7mJOXLZfpoM3Y
	3y0x/T55cA0QRclIkodjYUDwsW6vaIrgxrsf2RWEq9RgkI5cZ8r+g4R9sOESWn51
	POeXbGvnj22WU2u2ia6IjSOos8DDdWr7WWrHoIuv8Us3akVwQqOXnIFPXTFZDmD8
	r0cGhO1ycbM8O9Li1qqGlM8Z6V5ip4IhCq091b3cuT0uAF8VIVAlEFEGI9PS8jqj
	hbbXSReuHdWDzsLW7EBkvgolwN66OW43xJxOp7qJN3xMHlaSCJBgaG7cr/HJvJ6a
	T/lnHdDxLDFvdB52XjgE8USWe3MGY+Rk+qg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bnm25p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 08:27:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so438426137.2
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 00:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793867272; x=1794472072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/dL3m32KBlVrCFKIpaR1J0keR5+Y54/Kpwzr1w9W58k=;
        b=F88j+gzf5H14omy/kaIHnXiokwSxgTqQPnPOqdS+fn0GOZXe9hsj3IE7m4ivnyVLAr
         2H42lYgnqTTTC8QsyZWzp4fyjilRkd+ZyR/LFlg6TfbvDhzi2mbZEbHu6pHeiJ5k0JAf
         18RHLHiP4HC6svM/s27zHTFRyuZLDEjZMoWR4gwjAYf4CrPZNLQ/Bh+2/K8yOFO3RjfI
         j6iq2m+F3Y0Epuhq2pJj0pVpFL75YrI3qhjZa035J+eNelOCS5yXc+eU4kFwtNhQ8mu9
         sJ2pcuinu45pU68BOTKc9vZLU23jlkqVAEGtpGxHvsjJzSQZBCWAZj+gK2mvaJ5tI5wq
         49dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867272; x=1794472072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/dL3m32KBlVrCFKIpaR1J0keR5+Y54/Kpwzr1w9W58k=;
        b=ivfkDjDIBBlMDgzlHXbsHrHA9H12kHDOq3KXSfnpCO8/hFalYoFQ5LGO+lza/SukOd
         3mgOjDtqHuymYZX5xhhqtxrkKV4AyBqqFXEDQUB7jblDsaK4r3f9TedoYDL5FjaR2dh5
         Bs7YJOIm4DVLFhIC86u4Wv/EGQqxed96+TISjS3snzHQDdnc6I3vX3LalFC31aLW/Ng0
         P9wLIfSQNL2QWAjcP3IEqARhjXofX3mLZuu0yVUPj0sTkUQHdhmRwGTHttulIjXx43Bm
         IcIBqxQRkENPTLxhO0pwwGxK9712D8/PeY8eag7hwasth3M+n23MnW9fp3flCdKJkws3
         IqLQ==
X-Forwarded-Encrypted: i=1; AKwUvByJd8Qt2I1f8DErAJ3OzVPLZ0j9zXmud/lmsX25621G8sCSwjTn1L7wwuFF8IkRtyIJq5C/9WV3KPw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XwGucSzsfRhtAyIau3F5LnE+6ZFwRgwYbVxpwyzIQz0uUce5o
	UJO+6yXHLBbkNM1FMVtzehU/K/HIIeRj05Jv9By+M4ualsGS0AEDoRwS/ViVaSNRRo7m0dlt8KA
	kKEC9hg/TV+Cmp+TExAmAlhe+Ln84anvFTUgmxPaZGJPItkHXF+yAhQ2KVk6I7MM=
X-Gm-Gg: AYBFou1zgLuk/035d4qNzcmqaqiYogNZ+p4azJUGhRQCAKYbI23XJkbdGLz8cA8oo6A
	cw6It8tyVabm4R0UN9+FZ+uHpLcjF+fZ3P8blrItzgF7TlbZFp5hNq/FlXOrjxpLE3yeTy3FeiM
	Di2nJIW6b+QuzEJzFiTe5k4AjSd0TntTBpgJAh12zptf+eVnNzOJ+gz8KGih0I6BfciUrbb4GFk
	BOwK2JGY36wk9tsThWMcWruM37/Xl+9MiZ1mBUdWDFVU/AZibV6wYfCs4Q78d5buLYjJ91Qjal0
	L15rYK1q+XM5jiKKP2/oglJldSYoytaewgP0YcaJqfY8PaitJdRuL0HhnIJiHRxoLfc61DCWD67
	WtBmdr6uv10amiISqz87M7Ts1P3cA6V+Zv7PFye5IwKu1XuJh/IJmdtKW2LZZFQ==
X-Received: by 2002:a05:6102:358a:b0:7c3:a6f0:99cb with SMTP id ada2fe7eead31-7d072719913mr6912435137.33.1793867272029;
        Thu, 05 Nov 2026 00:27:52 -0800 (PST)
X-Received: by 2002:a05:6102:358a:b0:7c3:a6f0:99cb with SMTP id ada2fe7eead31-7d072719913mr6912424137.33.1793867271527;
        Thu, 05 Nov 2026 00:27:51 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180ee1sm9965456f8f.4.2026.11.05.00.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:27:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] docs: submitting-patches: Clarify half-baked review tags
Date: Thu,  5 Nov 2026 09:27:30 +0100
Message-ID: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2829; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=UlsHK1B0OR+CztY6Oxcs6YmFv820VB/X+GCsa+rlju0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq7D3x8aJgAtxUeaYd/OUVMK0D6aa9xPLQixiZC
 HChFzxNmnaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauw98QAKCRDBN2bmhouD
 16mZD/9CQ/yy0Ti7fVCKtCV3DyEr30iFSjzW8PEJEV8LyP78MMcvW13BVv366bEbZuSYSDDgTG5
 tk9LZFcTW6EHBSOTmZCRyheQSfUZ/mDVo0KhvJcgYdkIfCaK5lj48opRM55dqKJW0O//+lo3uUJ
 Ic6W3SGbYCr/YJIlKPFTUsbhQMvEEGVrk9wP2TPBLcSg53zICm+FaaJ4E0Hba2zrVDp//xKDyT2
 iC/Bjxm8JJEr0eCzdKjYCkC/EPdxmSD/JoXNrDFIev2JPem4FO4uQg1Rp3PlYrYGMlBdYbrmvKR
 GibsJitte6ns6g1G4C+TJeA6G/VuN6rUYx575Ld7XJprlKg4qsUgzL7PXlENyZVjsfap2fJ46U6
 jIsW8JTVQPOnQF1BA76E4kKZwn6SVDaL1jM6rs/m0U1C+FzACWtSE6FPMi4btmyYc7F9UaSVfbg
 mltI/rEZNbOGTu4PjDEXjlwWo3IlaAliZXkwS4TzRJW+2lIyrNVil3qr0e2v3JYmaRxoJ0O4sBL
 wQwf53xRQtKmi1F74Ffh3xg8EBa93d/4pG5+7qeosRlckCZRWW5cu2lMfuY5dTJKuSHQidCTj/x
 sfYLKlgMp2nCUh0HrMA/Yv0o9S9YCsmtH0fXoAYGyCQsnaNz/iALGV3AcI5xkm/VrSOW7UwM7rT x4JmpHswjl9YCIw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX8BYuFZCN7EFK
 5dXZnG3+KwOObebqNtHE602udieHgFwr3rrR7w+1ZQW2yxw/o7lpr6ZW0vZNra69bfyZqnhCLzN
 MD+iElBtH4UoFRTEC2X3C5h8zBeM34r6hrLaQqRVHpyJ+5aDPh4Wy06tshVc+ATRBLfw/T8vsg0
 eRAg8Cxo2eQWqeSvwsk7CzfU7igARztgsaCgLblyW/gdVwNtvURuWpA9aBncDtmDNLOcBPqFnCP
 pHCQ05P+eKsGrHTbRz6P7sayQV+7+Ixhr0mjyo4GrqafZr9ol7c8h8WbCL8O7kBioqO4s7WpoEE
 9cRUNDJcHgkO8opy9ZffgR/0+tmsMMXXnLjkmHy6EY93ETKwjW+BdzKxtSa/T8GgQsseZepQHGw
 A5RitCbunPp0gawL+sMrCOi+6vvWqPrfixFSMApWFLboXDHgazQAj179SPX1UXXLJ/tL3c+6dI+
 UyNnu2ifvbSAZoO08Gg==
X-Authority-Analysis: v=2.4 cv=KLLPn1Fo c=1 sm=1 tr=0 ts=6aec3e09 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=LDBv8-xUAAAA:8 a=QyXUC8HyAAAA:8 a=QIhr-27iAAAA:8 a=nsbvFs4WMv2GQq9SL5QA:9
 a=crWF4MFLhNY0qMRaF8an:22 a=DZeXCJrVpAJBw65Qk4Ds:22 a=cgaYBWEFosGJW4rWv5Lf:22
X-Proofpoint-ORIG-GUID: srakstyMJGLRj3ve0T3gBVX8bNyUQMDc
X-Proofpoint-GUID: srakstyMJGLRj3ve0T3gBVX8bNyUQMDc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMyBTYWx0ZWRfX/JK4h4W17w/Q
 9eDPQCQWOMcn9AHn3fMOrA0CZozMsKdZRVDourEzR5cAnFu18YaEzsP4ZwV1oJtmHBP3H1WtKVI
 9UL2RfM8RGHlKYvH57zkGZs4ZeyGHW4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050033

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

The sentence is explicit and complete, meaning it does not allow
implicit variations like: "this patch or part of this patch".

Reviewing pieces of the patch while ignoring the main part of it, is
much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
not be applicable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Few grammar fixes in text and commit msg.
2. Mention the "# subpart-name" marker solution.

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Imagine a patch, doing massive refactoring of core SPI stuff, 1000 lines
of code, complex locking and also simultaneously updates drivers to the
new API changed in here.

Reviewing that 1000 lines of code in core SPI with complex locking takes
someone 30 minutes. He gives Rb tag, gets credit.

Now another person comes, looks at a SINGLE line in one driver he is
responsible for and gives Rb tag. For 10 seconds job of looking at one
changed call in one driver.
---
 Documentation/process/submitting-patches.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index f271d7413f72..678681b5c9c7 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -585,6 +585,11 @@ serves to give credit to reviewers and to inform maintainers of the degree of
 review which has been done on the patch.  Reviewed-by: tags, when supplied by
 reviewers known to understand the subject area and to perform thorough reviews,
 will normally increase the likelihood of your patch getting into the kernel.
+If the reviewer checks only a piece of the patch, leaving the rest unreviewed,
+then more appropriate is Acked-by tag or adding a "# subpart-name" marker
+after the Reviewed-by tag:
+
+	Reviewed-by: I Did Not Read Everything <foo@example.org> # bar, baz
 
 Both Tested-by and Reviewed-by tags, once received on mailing list from tester
 or reviewer, should be added by author to the applicable patches when sending
-- 
2.53.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D20B3346A1
	for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766500057; cv=none; b=MRt6bQOwYRwuXIJpXTo4AsfwwIdfSM1lFFziqD5+sQD+KeiGM4CFEtyEs6DZP9c3UG8uEJQWLZvgb/kWG/gaaF7jHku5azTt9SG3i0n5TJSNePKkPUU29XxCSWYx/VXGBWihcs9+tX0WdDfJ9a5kJT/MLheVDhlfmjANhquiShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766500057; c=relaxed/simple;
	bh=8d1DDUBn0OgxirOWILF6DGTSvv73dIacjmoQNFthptY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KLEiyTjC9VHyVweoqDVl3F52khK6+SbxgYDVPbZXCccpZBpS+kcowkOwjzj7Qy3YG+EzCuLvUGqhFgo2ucJRzg7gcl7H/8+Qn/acDq0QBgryWOVAzgjffUYA3Bi0t9Iq4Le4pH60zOz/JOfnBVWe2DRzlDQEGUzNMW+o78VIaD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ts1aGRhf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NEyghZXm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ts1aGRhf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NEyghZXm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNChSI31901938
	for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 14:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mnNQYCjDT2I
	KwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=; b=Ts1aGRhfiaAVeQUqMAEzULUH40M
	qty/l6zFIx15nNMAVvQ0BAlJ5rhNpmjTixKsc4Y0Dk8Awjl8sJbtSyK2BwqQ5ZdT
	YxpZTH1sX01ztcOm0Nw4hwrUzs0qzLHftMImAIH5C1PgF+d/aXQVpVajPLo1cRbT
	k57lfTpRN2ekwFs841bfi0ybBb7B+5TiySjajpqr70PPXc4fwFo4Xoen4wqCQmOP
	fkSntDIfJQLTGKmLS02z1suoIEGILpZpjdk08OQCzjnlefSjyAQPBHS93MO3XBy2
	MxXanXI1yXsJux0+/hBEbcE0MZVv4YmU6KzVF9noc4MMUBXStoLJBXE7sbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8kakh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 14:27:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b8738fb141so1496826185a.0
        for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 06:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766500053; x=1767104853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnNQYCjDT2IKwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=;
        b=NEyghZXmugsvE8JI32uneuqyexwyjNnuxvs04eJYrfrlIA8gg1kcQw0st5FEMBYb+O
         aOJiYXTtUhAiNoQZIfSt3Zx+ffsYvXGZvXZ+0zTKAElI3at7YeGHc1ufYoUpYJ6CuzgE
         IRbdN3ebophp0dmNz7kwsabejp4Yt9S4Asm3PE7U5+k/gaDGqshEIHX2T4SOhK2hvSsF
         oY2U9QRoh6dgjmZ4BE3ZfuxAFLwcZUlXrmVcMcNnG95Pa1CC8gSAyPgyvjSUYR2/xBwT
         hh67hk1SCXXOVkP/q1wenN6FhE781Lt+U+YNUc44BlzBUc4pja7GwHpx9PPcoWgHnfig
         lhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766500053; x=1767104853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mnNQYCjDT2IKwdufqcfSj1JgwQtQDYPlSNzciZd9v8I=;
        b=EBgbq2rdZgmpuu0GlhLi+yD60MpfCIWW898hKQhWVZuXAsCLs+cu+EQ5ecf5BAjIsv
         ApTAuADgpmGrM6ugKymmRPYk3NU4bXuE/zgubUEfwhwmLnNlo/bC+7C8RMyUXIS04jmG
         uYYwKqS2QfNGgpCyCL29Z+lT28OfvIpe/hmUxoq1cbAwhul5m1Xw0yy3iEF83WZkbrG6
         6oab0WVeBFUns2NfqVOQqFlbW6m2vt2qSnqMid3yUxd5DgbauyeUPDvAP7GDrRJ9hvdH
         sppfXv1OhL4Z59t9K2Vj05xiQGqoMMLrL1D/nRqp1OrQPcHQZPavK52I2+UCqftJ3BGu
         El+A==
X-Forwarded-Encrypted: i=1; AJvYcCWbbVoSXxSqBCEZY+S+tFw62bULc9Aue+pPrwn4ohFnjj+a2v/GJb8Tc3AWuSWOvWRmL7WSFPaF8uA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDKFClBYnQj85+3C0N0AkyNFsGE0xlKnVSTgo7y1jHF5QC9rcP
	mT5l8wXaj+Vcj1ZHLh0jptIzLvOc4N36D+q4hF7XfB79JAuSeSrWPtgw3zdTK9WyJ0bYrApVL1l
	Nxggz7fyUW1l6/aXT9f6q26+7NQxITqvvBJUBNnBizSi8EB78rZ5+CeuOLpjYXjE=
X-Gm-Gg: AY/fxX4kTD949pm+AHkKQ8LtDDgwwKhuLo2JmIbrbT/nX5jWHgQ1Elv7wU/GzgJA+Bo
	jlTCCCW+x2MYmldswmVJ0VNfIgarnAvjZwJDod5PeFRrwt4ym6AT1QnQ7PctYo2kf/j0lHI1vga
	S4vRKoqkQ3MguzjTpYKHGhGSzVDwAvoZOA4CL8BXhPHMlWXxWyL3ftECoP35NfNcX7gTxHZXs2D
	dGvHqIEs9X9vc8s7Pus2BRGW9+MVxXXt3LWd2eKBGM7ox6++F2uqUtFu5ErrS6u/ApA0fLIAl68
	Acrz/rlDmaNw6XL9YQ0Cw+Ibegs0lhr8hw4Z6Df01HNzTksqpMGh9Z48WF98q+31JKs7YG7FLvo
	sZ54XSh6I0XdhpiQVF3ORMXhJ/3vuCwnt41v2H9jYTGgSP2z8JzqJbzCjJqKhfk1I4d8=
X-Received: by 2002:ac8:7fd6:0:b0:4f3:4b53:a914 with SMTP id d75a77b69052e-4f35f3a051dmr284385881cf.9.1766500053162;
        Tue, 23 Dec 2025 06:27:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEsw8TOhjv6r9nZIguPFmBTZYdBATYu2f7Bi6Z7slZabfblusoMn6hz2QsbZpBdFgJjMJP/g==
X-Received: by 2002:ac8:7fd6:0:b0:4f3:4b53:a914 with SMTP id d75a77b69052e-4f35f3a051dmr284385491cf.9.1766500052737;
        Tue, 23 Dec 2025 06:27:32 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab4f0dsm1436477166b.15.2025.12.23.06.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:27:32 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] Documentation/process: maintainer-soc: Mark 'make' as commands
Date: Tue, 23 Dec 2025 15:27:28 +0100
Message-ID: <20251223142726.73417-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1218; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=8d1DDUBn0OgxirOWILF6DGTSvv73dIacjmoQNFthptY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSqbPfVIHImHavp9Q4pi4X2H2aagN44h5mmn/o
 WUYqpR+7byJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUqmzwAKCRDBN2bmhouD
 15CjD/9zFz8j3C6DgK4c5gqpuqozJOXSLhiVpHrkZwu13cXfBtu687NNnO62sgKoDnmJSgY3jGS
 7TKC1tYhbkXa2y7LlYqwIR9AGqSZYIilY3tQgEm/mNhNNpLjvqlDI2jlM3Dz3RjVcnHhYPB7UmE
 HoH6F9QPAkYYSgKAlVbuO1O5WDuQ71vDzgfAocj/Nblq/wchctMoQYwHqLxQnf2HuhgjhelkVGa
 4QbZr32bHUPLha0Mrvc8blWj0TzC9IQH0lIAFaiHQloC3uBd2WZi6CiiP60R03a/6z4pr1O1Mum
 KW09CGeJWmUBeRJPi5CxXLve+GW74XcABup7kTaA/CehiLucCZ2wDSI+Q1TQBlDNfPH14lex+Gh
 xbyCb5GL2vorCXws3leX07vjVTPmhg5AZUwY7tPDrfSWCmUXqVgDwFkw9+nf1/bsrMlYq8+qQbf
 CJ0erAoMWH3x4mdTe3BkOUM0NArOgSANYZmM8hU/US1BMG/ad0GTixl+miF7Yv3hFcxd7IbSqJN
 Lks7K6Av4LeEyVDddo20QMnTL3ZNUY+zVJcW/xCzVkQhhCmX0tp99b+sC8efuAaCnIUp5irDC1T
 +6e7hPw/o/urn0IscJxfbGpASE0H1uikeIBwotNoyGeghDqqKnr7eCWjEqOk5Iex2ETO+v8Axrg 65fzbZuenE+xZwg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDExOSBTYWx0ZWRfXxpvZmt9+zna5
 RECohWybf2W2/hQyZW2xy69B8qB3EJ/HxZS5Od/5m2xIMUtGrsX8+T+n7uvmS1XQclW7d8kbHc5
 d7jRov+wFXzbg0yFW8Gu+NNbQbCd0Z3/I/nyKokjXgZ6/zeNYcGQinZNgN15oTgV03nFAmqT+NJ
 2y82oz9JYcpaN3qs2hEfzK15jJFUvlMZC9pCwhnKkTqwZJCEx2evtuJX0PEulmlYOBo2iPf4YQs
 c31X3/9dxld6Mb3tibZz2YVQBk2NtW0G1tB0T/U6BEFpgSgVcoK9Fpfudij6ZjjcZmpBPfkuHgT
 iYqcJzALxi58pVdLlU+emWQ3g08UYmKT15FDgT+jkimQ7U6YVS2DUc/mQXNQIQxWO3rbxFkuPJQ
 cohHHypXUvGLBDB87t8Mu/k2GERPq/nMtraZUSZ0VnBMPI5UJUgjWsZO9rYGA+w8SHoEYo5xB1w
 Y4YZwsd7iQhU3WtlBIQ==
X-Proofpoint-GUID: ce4n_n3NQltVE07wZoVa3SugEvPEWsjv
X-Proofpoint-ORIG-GUID: ce4n_n3NQltVE07wZoVa3SugEvPEWsjv
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694aa6d6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hP_y0LdtDFoG4kz1LQIA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230119

Improve readability of the docs by marking 'make dtbs/dtbs_check' as
shell commands.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 014c639022b2..7d6bad989ad8 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -116,9 +116,9 @@ coordinating how the changes get merged through different maintainer trees.
 Usually the branch that includes a driver change will also include the
 corresponding change to the devicetree binding description, to ensure they are
 in fact compatible.  This means that the devicetree branch can end up causing
-warnings in the "make dtbs_check" step.  If a devicetree change depends on
+warnings in the ``make dtbs_check`` step.  If a devicetree change depends on
 missing additions to a header file in include/dt-bindings/, it will fail the
-"make dtbs" step and not get merged.
+``make dtbs`` step and not get merged.
 
 There are multiple ways to deal with this:
 
-- 
2.51.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B2E397E86
	for <workflows@vger.kernel.org>; Mon, 13 Apr 2026 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066260; cv=none; b=utNb96YCfYSsgvcLaLn7uZ+fu9UZ7bMSl+bd8gn4QRCZChZzhtuObBEizwM3MFEYrvkaC2vXbXEkHFRhCqosfOwY12AjG6puGAcD2ch/lU/9uIV1mVuQ2WZnLFV6O0MfObOVVAYcgwVITR7IPDeUq5ORmEyV0uciEfKkFe8bvkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066260; c=relaxed/simple;
	bh=9+/eeTgyYS/yzTO3pnqexv4gWy07zOtf8v7RwgZqnq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0y+kdl4XNoT6jxeYf1VYZ1BXKtm9eXMnO996FCfmP+x2/etQQXZ2Ely84ca1M7YO086z4KGDlXQw7yXyBZf9GIJKtlrQlSpfrx9T436qP36jHNvPSXe6aEVjsy+QDSRs06599+VVBPtbEIQhRVOFe/SrsMRyIXZWvCYT3B2qu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jc2xfMLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcga7KpL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jc2xfMLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcga7KpL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D4jBLe542922
	for <workflows@vger.kernel.org>; Mon, 13 Apr 2026 07:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jMDYT8BNhIA
	8WXSavqLXGIyacO4Fz0LIBJB58ZxpfaY=; b=jc2xfMLXQoJy0Jjx6xJ7MvmVwKY
	RseI8gde1K1ROLTbSHC3ZLQhfw76IQEiHlNh2OnDxNXMzXGtKeXLW18mFxu5OYf7
	85BqqrM+nnNole7Pjxq/TlVwmdbjqd3kNlbJBRyXQtDJPYfZomS6jbh5Aoy3Atwh
	r9h64UgCW+NTXXviuNfzosa9YisKNHedMaKnC1tuh1b4tPlWkQqs0tAIUuIawwgB
	MsQwjcK9HAID8y5Sc+zx864WYAsnC/ll7KmTWPlkRiaQxuZUGJJgYWbnF01aZgQ1
	zfG3iyWmDlY0lWN8FU+MAVcZJ9qpPS7YsPnBTo0/0Y5rD5FEAvUaJhrToMA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfv9uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Mon, 13 Apr 2026 07:44:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso99762721cf.0
        for <workflows@vger.kernel.org>; Mon, 13 Apr 2026 00:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776066258; x=1776671058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMDYT8BNhIA8WXSavqLXGIyacO4Fz0LIBJB58ZxpfaY=;
        b=fcga7KpLzq2TtlH9T/O/Vauh+q0NUgQXxDf1VCQZZqnTjzHhSr6odWItvD48nGjiou
         tkcaHtqo/8xMFtetKWHnPTudILeUfIxauKIN29WC3yX/fTrh3VEbsYE1clADmJz23gmy
         jffd+hOjOoxFsESdjeWxBOjlP1xkltN+lSknrHdDsP92OAabrB7UYiP5ARa1xV31GrvE
         5zFyKlGUzDvd/3UxTq+BsLrVxVANi/KM/4KXYHPk3y/9FrbWv6mmVAp1yRMw9TSp403S
         Cks79urL8i0t5zT9BI74N0rZPTO435PUfDypDGngBxrVwN7LJ6WP6nwAfCxrv3paMlGC
         I1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066258; x=1776671058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jMDYT8BNhIA8WXSavqLXGIyacO4Fz0LIBJB58ZxpfaY=;
        b=lf41PzZXmKcffYtKZvoMi0nmXHTVo9CmoNTO2sVKrKTGOx5kxITiXXJD05tvEeITIN
         v0m/kHJ0264LTWtvR//jwvScPZ6hIHMomHoTB/X7m0bwK5WfvfsbnsrjbPxiJ2wl2/Fa
         ubJEBwPh+9e5aqtuTpB0LEyENYIQGAeTkc2TTn3TJBC7WIvDhPfQ0ayBeOoA3p8EuveA
         mBirLfZXaDRyoUT2S6FfetlUMuVEYZXkA3Yhx9WBH1UOxDxc1ipBcpvxM8aJyU9oUJWV
         FXDnOhgbao3DzSAV4XZXHt6TpR9dGT5JDMldqoIcUs8IWW5+1/o9THtsyXCprOebY/J1
         pMfw==
X-Forwarded-Encrypted: i=1; AFNElJ+F5cuxl/M/LOeouuxQQoP2SN8JlJCQQQVQP3o26K7CzetT2FX7Sz8GqRCUPTOqpVacHM9qc5Eua4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvTjAUJmfyC2x+4Vm73z3bgWuNGQOe37BiJdqX3hF6SSL6H3f6
	7EcQKuiQ/rBQh073vku6KxzvbsoTGjs4KbgkbCpkwBGaucha+USmkcVndJqHsTxTGrzTUWpHbKb
	8aBzixxzb+rn9+IohyUoqCL3f38RaDQl4iTmpNxZp7ZAUFsLCyBI74S5cpXHWGLc=
X-Gm-Gg: AeBDietbNrF+zJ8iZ1WLOfyqkI2d0cGkQV0FjEy8lJoyboEann5zPWn/qohwLab+aAS
	vwD8al3Q9IXkAu/RJZX+vIGB1Fo+ABg5dm62h3YPxnPBnqMBylNj0NhhjCon7A9+uIpiC/JJfBh
	3RSdxc9rSowu1yx4u/juHKguZC/vMGXOiyZapTgfzmwQdybwlVvyEoKqH2jZD+T/FOIy6qeDuDZ
	cHoJEf4ecOzQuER0rrGLQu8e+65AIOtvMXOty7AXF1MpOl/UbUfLNSRtBphVCiFjLraqKKjftnv
	nTRHp5QBMPDBlTBCf6err73S68vMWYPaECcnQLdSFyF7MZr1mFZtUFQ4zfdYMIVkV/u/pzqcCbR
	MRXJCFiVXZkv8dsURPjLQ0EYraC1wcTCunrYN
X-Received: by 2002:a05:622a:11c5:b0:50d:882e:c5ae with SMTP id d75a77b69052e-50dd5bab443mr185499621cf.44.1776066257583;
        Mon, 13 Apr 2026 00:44:17 -0700 (PDT)
X-Received: by 2002:a05:622a:11c5:b0:50d:882e:c5ae with SMTP id d75a77b69052e-50dd5bab443mr185499291cf.44.1776066257139;
        Mon, 13 Apr 2026 00:44:17 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67a46bdsm137465635e9.3.2026.04.13.00.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:44:16 -0700 (PDT)
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
Subject: [PATCH 2/2] Documentation/process: maintainer-soc: Document purpose of defconfigs
Date: Mon, 13 Apr 2026 09:44:03 +0200
Message-ID: <20260413074401.27282-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413074401.27282-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260413074401.27282-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=9+/eeTgyYS/yzTO3pnqexv4gWy07zOtf8v7RwgZqnq0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp3J7EJHjlEZXYb+iPxBermj9EsVFEZq7Qk22P8
 OiDqazIySKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadyexAAKCRDBN2bmhouD
 1y6hD/47MsD0PcTGJM8sGmIHobgom/PdUcdZlLirII1VDDJpyXDTs3PHiezEKdoCNSyztcrMsXT
 4oHcTnD/X77Yp3yiQkK5xSwHdQoR0qGwgi8Hg4xHeWmwAoUeaE6rAt/Uet24wdZpfzfcZCduoc5
 Ys3VpGnXHsY+yUt868aAFzOWdqfuH+LC4JOqNvx4KgBINBjwi0QXoHwYey9MJ/97ayMEcbC38Mq
 f377+k1H/ndRbs9bRJoRFhb3vdG5rPwiUBAYWYmoENwxqLmVjrSqkf0sFnRhoG0SwrGslud0ShE
 t+4E1HkALxOeqLE/obi3Z6TRKz+z0dh3Nv6QWLJnoH3h3h2jraDW+VGHDyL27zWjwPqbgwhjIb8
 zJJj9piSymp8nMPSPUIKt6bMV/g3/NfGVUqnOLBsK0XbJQP2cZKQ7eBVRX1w80uckOcJOle5jop
 BVzvei+HZMU96eld6NiEIlqUUTHwLMh5jszBBNgFakOTnBMJ4qnIsPQluJnbZUenmmbe3/PoAqc
 8O/QpKxKBPAFvPRlPXmh95SlRUPhYrB3nZXhirvnwP6Fbv4juHtZDBNJ2yfuskRA6ed7M5P8SOc
 DvkKDfxfifMUfHlL7Cb2WZJaSzSb8o3mqB4vDn0fC4rW2gHkgLqwkU8kP0xIxapmNKNdTZHQaWt 9QhzkBoVibNtu6A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jBmcLBDQtZDTpFYK6rSPkRuDY56a4YZH
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dc9ed2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Tz5aH96nyyF_Xlqy0V8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: jBmcLBDQtZDTpFYK6rSPkRuDY56a4YZH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA3MyBTYWx0ZWRfX3fl7fRW6lUPz
 ZCNx2oxCR5mAw8PpwMjqjAD4gqzYenGQLgrrVMOMAga7+J51hvlAyr0GDCvtQuQc6Uuscf4nSNd
 rjK5qw3de2S+r9u+KyiXv9DjtmWR4XTCM+tVWjNc7nultgFDQIw2vJj/PV/NDWCfVgax3Ji01IE
 YE0nyhvYmMH0DBtrYlAH6rz7rScsBNdGADXYBw72ZKInykfJ+Ww8OuZVa+OWEAu1Ss1C0ybIzjb
 +ml5FWTQjXvDCWIvp0QlTRn0zgRQ6USs9z7YdK7+/f/oak78GGfvKKG3sMJtXS/v3sguTKCiNAi
 /HtNGqXWjZ/jyEqdYPwTrPHucFpDHg1Z9Vemc8ar9+SCIZEHw30vVxUw0xXPOZvvhNXA4wCJHwi
 wHMz8FfgiPy0tx6GRKhIg0xfuPD5IdukjYIPMDdCzIqaasmTMO6uE5DjrOxHp6oNMQSv7CADVmE
 h2TgPpLzYfKAjiq+jFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130073

Common mistake in commit messages of patches on mailing list adding
CONFIG options to arm/multi_v7 or arm64/defconfig is saying what that
patch is doing, e.g. "Enable driver foo".  That is obvious from the diff
part, thus explaining it does not bring any value.  What brings value is
to understand why "driver foo" should be in a shared, upstream
defconfig, especially considering that distros have their own defconfigs
and we do not care about non-upstream trees.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/process/maintainer-soc.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 4029dc6938d8..a3a90a7d4c68 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -207,3 +207,13 @@ The subject line of a pull request should begin with "[GIT PULL]" and made using
 a signed tag, rather than a branch.  This tag should contain a short description
 summarising the changes in the pull request.  For more detail on sending pull
 requests, please see Documentation/maintainer/pull-requests.rst.
+
+Defconfigs purpose
+~~~~~~~~~~~~~~~~~~
+
+Defconfigs are primarily used by the kernel developers, because distros have
+their own configs.  A change adding new CONFIG options to a defconfig should
+explain why the kernel developers in general would want such option, e.g. by
+providing a name of an upstream-supported machine/board using that new option.
+This implies that enabling options in defconfig for non-upstream machines shall
+not be accepted.
-- 
2.51.0


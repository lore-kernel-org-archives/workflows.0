Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11BC339844
	for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 14:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766500055; cv=none; b=WjjB+n7rBXb9kN1diNKTkbFs9EvM6D4aSCEGwICSQ+eWgTvUHYZwmprge0BhNrf0dEAu2IrdXNtRuoFoLc57RGYK6t0RQi2SzOBPxjeFfMWRYzwRZz0s+jfRPSFhq7/7Wh94SZl4xP+1aE9tIpX8mTWsWjFHGLtHJgyn51os7WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766500055; c=relaxed/simple;
	bh=znQnP7Fd/J5vrSbB2hX4Rw2tMOJPzDja/Y8g2yuXw2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F47/4nISACA6auwSZp8HKdZnytthMN+HfeXhrZlUAvPcEyyocYuu8g3/uXzosPIoSE//oxZ09WsMrd+r2frONqVbGdI39DR5izXQJjnBatCNUL4FHOIyat4Y7z+zkLk4Y6P8UQpS/5YePszMnpH0P0u67KW4kBdbEYot7ugNzEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xh5icLOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdC9JvqA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xh5icLOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DdC9JvqA"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9s97h1569012
	for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 14:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PJ30YGSEauJtFo8hpiRxrvYts8bfPlLpCUG
	F/dKhzzg=; b=Xh5icLOoy8CU/2EzGLuFAqRy0WBYl8KrKW9HXBk3aR6vLYBTiqL
	SOwWsKei1Zf6s83ixUg+C4EvXDD0q1JKfrLj8bBoJAz0ewklu+M5ioIMqKRtrQlK
	Q+rxIqhfn/2anfupmKmhOkevUh1D66rP0wt5vZCFfJZM5FnygtPwPvVrWcTM96v8
	FROCNXybd6PwFJcINQ4EZ2RJwJrgme7Idc4ug06d4IidPz+F9uyPolgaopUuUF+a
	JwORV5TOtDP/3Kk3XBeL5uguqVHtuodRF2l13AZigdERWG82l771/RtWyKArJioy
	uaf6tBYfQC+1YPG9shTQHrOsq+830me6OrQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy3x98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 14:27:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1d7ac8339so166098961cf.2
        for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 06:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766500052; x=1767104852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJ30YGSEauJtFo8hpiRxrvYts8bfPlLpCUGF/dKhzzg=;
        b=DdC9JvqARZKVc6qkByyzAg3R7i8oSuYSBhqNGLe9xhUdqAx6mZLh/TXjSYS/zNKn4o
         A99+LBDZhAws8JnjvmHqrrdE/6/dEPZp6dKDmKttSovgRS021fwceNDA1LgdvT2l3zzg
         /NUS0KnC8v6kJeMvj19fmmCT8bqUfvNG2Bpi4fFoRwwTOI3qnYmkS8LItZ3j/YlhlRu5
         dTAHteyvkWiVjQktU6/JFJ4qCU9/jXmpH5plL4fBvBczw80Yl2Bby15O9a+aYOI7sst9
         RJggtYfTzsvo9NkxZ1j1qXAAtRLDkaf4vu3ugaLKeFdoXWdWt84M3Fm5DPT7uf27fWps
         4+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766500052; x=1767104852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ30YGSEauJtFo8hpiRxrvYts8bfPlLpCUGF/dKhzzg=;
        b=P8dUIcmMCFUiD/1vZRpnpoLjKhkwP6lEixfBT0R/8h9Z8BrTL5HsLbcH40OanLYPtT
         hCyHH1Sq5Z5/NyB8jON66QYZqVUUT40eOenAbtwzVUiMhBlCbgHe9HO077AEnMaYFpQz
         nmi2ErdIXr3fAMXko7+yQzkwR+UyFUdoQNNeH/seUQ8rKqsm0il1VtBStMG8aatLlp+y
         0MWabi+ONQGpwB58mWWWwdtoyWUWhMGrZtJWVf1++9hZGUwxuxZq/GTPwuvlu8uWMGcg
         Frly+bGkJ9jGR7GRWyYYqD0caI9uniYPZjJxEvCiGZuk1bvYIXqM3anOoviGiwm0Zf6U
         oWog==
X-Forwarded-Encrypted: i=1; AJvYcCXbKZK+XwkBP1GZ/LIK0WqLKs4GoMI3m/H1bi+N5InkNbp1xlZ6XDm1S6mk4KKZXFz2BsB+AnO62Ng=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXBgdBOPGy0ImwD2F28Cz+RCFtNAwdXGoOMEWpQPX62mRCO8Nn
	npe31tRSbhWjHRQoz/hfVTKZAuZJKaKsi0BWVOFZcXYLOPLyDTn32WXCjzJ3CHavKEg1S39ZUH6
	6l3rYeUIKCMUo2HOU6MxfhyfwnpI1F54HSW65GFi+DutWJYAUkowdCv5eo+Md09o=
X-Gm-Gg: AY/fxX4/rQg/DH2S/Bj576/A6Sxfg62kGROb63MaMw2teQqg2OS99+rA+COOqD9wjlQ
	mtkg+GDMbmQncEy+tkMwBqmyqRpcQAU8/GUDThWPjhWrh/01ZguCcHb/4twj6wKC0Ri7HlpjAup
	zSAl6o57wB+8dFpQa7fpQPo2I/XlnhN322lJv0F9BmYi7w8eAYFnZYwvQY6zsryMc+OxbmmyQIf
	A1kCdkI6QznKe2RQzMEunQmVAZplJLUDfAoh2Twlg4HgxDoNlbPxCXP2a5WbQHrHtQDj/wBiN2I
	dq5yTOh77NCL2SHnkQwuGNoO17Q0GuwCpr9sBy5VL7J5g76tCotfn0D+bs3ssEQOV7t2XcieRMv
	fSmOW/Nx0aB6N8l2L2cWYA6MMI7w7At4EWCatwOV4ilyEBArBaC2dKhL2LnkTKl3sSWw=
X-Received: by 2002:a05:622a:7502:b0:4f4:df23:ab5d with SMTP id d75a77b69052e-4f4e39243a4mr4210311cf.75.1766500051657;
        Tue, 23 Dec 2025 06:27:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHx+8Q5tBp9PpPU08NqJiNNbyikoFy4Mz31nrV8wUMn6eSen1oEP/1OGcxPp/BnoRTrVnnaNA==
X-Received: by 2002:a05:622a:7502:b0:4f4:df23:ab5d with SMTP id d75a77b69052e-4f4e39243a4mr4209811cf.75.1766500051064;
        Tue, 23 Dec 2025 06:27:31 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab4f0dsm1436477166b.15.2025.12.23.06.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:27:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] Documentation/process: maintainer-soc: Be more explicit about defconfig
Date: Tue, 23 Dec 2025 15:27:27 +0100
Message-ID: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=znQnP7Fd/J5vrSbB2hX4Rw2tMOJPzDja/Y8g2yuXw2w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSqbODFu1+y29Lt26g5cF4++AiVq22ztuhgxKR
 XuzH+B6gZiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUqmzgAKCRDBN2bmhouD
 107MD/wIICO+f4FkJs5tEZJvvejnNMjbjFPpr4VfVOutTg4JZowCjaxlxhvjq0qkhxbKTPIzVCV
 FUpp/a1djgTc6iyN/uiE8gr0To9k3RvG+pyAkiUTB802B04PGsgnSK2He1X+XLLLCpGRwH6rztH
 Xtw+0SZ4lrE0cmXM/Zi0GIL2ZhMDTxmPNJKCsEMIjmKKDsX1uuW25tVwKQHCZwhi8QCRTw8wGQl
 Ent/elBNLhxTHc6NE+UK7Q5eWeH72mW9ViaoXflDomzLeYLiIbEBKxcN76GlXIsPQuWjX3EgVrA
 uTnfsnjwIm0WTNGRzpO5YOi9OgtX7HtazOqB5pevbp1g5BGyAP1A10ZXQY2xkoeF+F0Il/zqVeg
 XFP4AsjCaJiLBjUW7lYMWpAM25ZfifEScWn97r44K8xGd9GDqt7bkSowCQSIqpLQEbzGcDlYT45
 WLXdVGquWZ2GBOX5HlQbM+wCo5f/m4DJ0/Kz2wI669cjlFHb6P5JUcomqUFMUDYCxulnGKAYW9t
 YzAuCTG1oovPFMlgiyAgjcYsBbnG3U/6UHB93ZRQLA9FHeuLiDIKIK2URd8nqRRg2bvAc0RL/dL
 CcufkFpQKoZzDLdfjsddfFV/o4p0Ugl0cg4CJomoMiHE+ZK8Xvji/SBQzqwhF11kxQ6/t3Yu+T7 YwuSYEFw7uf+d5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDExOSBTYWx0ZWRfX9EvlNoS2UZow
 97G0m2E6Zjx5cNcNy5tS1h3OjXxr5SW8h1Eh7ql5j2IVKAn+HuMpOHui7lZwb/a2iQc8NxBmrqc
 7Q6h2yDL7eq31Rk5UD2YQRAn9TRrfI6EElbkhmuJWAjG2rcrs1iaDE67+8zOAz3gyuVC0DDN/uk
 qmogorICTvlJ55QDGTJlrGmwMtHk1evZJJtX4s8N6IREN0ZimPoDnaF5VkDpv1Ai4yQfYT2BDjR
 3Z3rGAd4pACAo/bq2eab54YNRkfbqTXXk7eN1faNKZT0HSX1P2aWXgdYfYllhEdJBED0GoGw4NJ
 fLQe4ABv1W1759IxqjR7xx5A0euExdov348HLttAq6ateXUTkDNC45fbYqbKm6os/7xl4uxr1Yj
 o94hmRgBoFw9nuzmq/mzDF5cKx6zRTeMAcNdTJYacreWIXYrYQF6K6agnuv8eqt46x0MhZJA5lx
 ypKy8HkEyrUIbbIDcOw==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694aa6d4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=u2BcFdJyl2au2J_VFtgA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ZvTrttNshpqwNZvsHKU2EZQ7zv5p3E-W
X-Proofpoint-GUID: ZvTrttNshpqwNZvsHKU2EZQ7zv5p3E-W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230119

It is already documented but people still send noticeable amount of
patches ignoring the rule - get_maintainers.pl does not work on
arm64/configs/defconfig or any other shared ARM defconfig.

Be more explicit, that one must not rely on typical/simple approach
here for getting To/Cc list.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
---
 Documentation/process/maintainer-soc.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 3ba886f52a51..014c639022b2 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -57,8 +57,10 @@ Submitting Patches for Given SoC
 
 All typical platform related patches should be sent via SoC submaintainers
 (platform-specific maintainers).  This includes also changes to per-platform or
-shared defconfigs (scripts/get_maintainer.pl might not provide correct
-addresses in such case).
+shared defconfigs. Note that scripts/get_maintainer.pl might not provide
+correct addresses for the shared defconfig, so ignore its output and manually
+create CC-list based on MAINTAINERS file or use something like
+``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
 
 Submitting Patches to the Main SoC Maintainers
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.51.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5988A33DEDD
	for <workflows@vger.kernel.org>; Mon, 18 May 2026 10:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779100854; cv=none; b=Trg5nrBuFc3oP7pZuD4BJ/ZQTocFMotW+3eTW6aTFa0Y/WoY4Hig2F8sBaCxjrNl9stuVHY4xsyIPrd41ZneM7AaNO7FbyGchQVyG560nSuGdGZ79T0xte0v9UZyic3RJUidrCovUeXE6JJeMc873rngiKvgALcOenRfihFxPkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779100854; c=relaxed/simple;
	bh=f36TM9m/kM8kn4KtZMX/ahZ+rpFYq2S6i1yJCp6/3bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o0qdQnSOhU+QiUlV1RLIXx03nnWJg+sHySRJhKlaxAB9Brx9hftzc0K4CstDtIdO/HNW89713ZXlliHwY+m+NZ2FRTd0WaZzMTuC8esYZp+AMLpvoEzrkkK6Ldi7SrpMiYtjSCtKng9CjTNpaW56rSM2OZy6mdCZ15ap4aNtm0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCREJzTK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JR5+G/MN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCREJzTK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JR5+G/MN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I6SQCT463057
	for <workflows@vger.kernel.org>; Mon, 18 May 2026 10:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=IgBnyP2pKojffPA4QSU1jzOc5PvLyFIiMCF
	jx58a74Y=; b=MCREJzTKzGzVPmqm4h4T0RA42XfiSOGZjUnd2Uzr876cSxDaxIJ
	hRSe6dTpf9wiezUAyScBspg4ke1ECpXqAwwWX8/biQi8QzoXNfcd4ZRbIdxJnY+X
	WZ1zvGHpZj2kLazLJj2CCkxwNdB4hu4j9nXbMRyl5MqIvarBOyj3SH99LEwdMkme
	2jge5vQRqng2dfHN3GhhrzC3Q/Z7Qft3iiCGrWmqmWyKte63SvovARl9tjtnT9Uo
	BUBiwODrqGshfQrK3YBuRZ1RtuiChEBAtSkxDwgk83ZMSf/LppqvNOlNrhM1TlQo
	uDQw947UrcGi0zdj52pT9uZfrDN34H97kHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6x1mk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Mon, 18 May 2026 10:40:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51494d74d4bso43874151cf.1
        for <workflows@vger.kernel.org>; Mon, 18 May 2026 03:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779100841; x=1779705641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IgBnyP2pKojffPA4QSU1jzOc5PvLyFIiMCFjx58a74Y=;
        b=JR5+G/MNE8GD7AHzH3tSqXzl0wUTzrlNR/2gWN9C5J92W7duraTLkPEkCOPG/GqN4S
         OxERS+HnTN4zYYnwZAmXbgWVoMDpXrRbtkOefl1xHtJc5MUnyzRjKOEQ856vKtt9NUpY
         c+k7p+0o3OcYsQvPmkaojmQd0YCRGziJ8/3bDhHfsah9AqfJDEei9zUDIab4lCj4733F
         EG8ayXufHP5LhmaO130bYY+nITFfo+v1ypr33KiWWj2OFMyzi9C3co+1e5UF85LfB4iB
         S+fVNI47R6hWp/SZ9N2AS9JORToxz7rXlIrUjAP42lYKm3/TlM2TwHrj/N8Knm7AOIhd
         CZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779100841; x=1779705641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgBnyP2pKojffPA4QSU1jzOc5PvLyFIiMCFjx58a74Y=;
        b=bfOY9C2gpA/O0zYVHMcRp/xU3noAiwkV9bferiR6yJMiW4ysIhuHqU9DoYxJO8QKd2
         sYD3lEZX2j8gVmMoA6h9BB4Bj+wJsRaZ3HiUC2QB2Qm19KPjSnr4YW40HJ3/lhS5nlbN
         uAgCgQSzl/f/znbq9PYpIU+IcIi5Psfj9WOG2XsIBn+oGRu74BiKDNdp823qBQx7Si+L
         fai5BCqPoEAnQOJLkBc6NbLHCVq74R+8b4uHx8+WIsyInerIvMa8Nu6s20ylRHPhEgMx
         6XJ2npISXZKpH5hyeluKNc9pKkzXW2YEXGxMaFSIC87FFq95V3Kk6svWV0YDbGQF/wJH
         J71Q==
X-Forwarded-Encrypted: i=1; AFNElJ/dApDQO1L5DvjFciDM8X7iYlxgONTr2XycK341WsZMSXje7Lv7yz4qR90tnMvpZqRnIXBgdV1DqAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHjcXsoItzjz5jc14AQY8R0xDZg3LddQQSCCq+XMjIq9tLwwSs
	JMHJyDyXs1W3I3fhsQvZmmkeX+EHhTSQKzwOTVFhroFr3aU7+HhhQ2itoMoOmL6glmWoUidji4n
	281iZWYgGDQEH+hE7/vFgRg4YJaKaIKjgnMlNVznZ7UQTG3vfXO9jZZXN53ijtsQ=
X-Gm-Gg: Acq92OFBlKZO9KZxbg7ayfHYQvC6P1h04kZmsottI+6MufEOdfwx68x4+Q9r91+y87I
	tu9bomkWddANuFkJskwgSH9xmr8pq4EFwBFo4kfPuIqcyR3Gt+btbtEiCrcwbmjh9M0BAgE9//s
	u9oICr66YE6kCqauMaJ2SQzvMz2TwOhhW2HyFeZSZCO3llT/MdGtW9XwGbtP2TGTT//M5tbbeZl
	o/ezbe0zgR5JFuYMs9xxCHCLwxoygYA4bhqODb+4heAclXfUcla0hsYZhWovu7hbBDfzlSabb9m
	2An9Gd0KUMarsI8HjTUE6OMIXUjjMfao95gXTDnqdAQunCMDkW2cgHA9bIFAx0XxCWMLschS9wG
	UzUUR9ARnNKLuAE6PeZd5O5SSTiEmQtjE0/+bY7fOM9m18VY=
X-Received: by 2002:a05:622a:509:b0:50f:c133:2dc6 with SMTP id d75a77b69052e-5164186c224mr243583801cf.19.1779100841175;
        Mon, 18 May 2026 03:40:41 -0700 (PDT)
X-Received: by 2002:a05:622a:509:b0:50f:c133:2dc6 with SMTP id d75a77b69052e-5164186c224mr243583661cf.19.1779100840763;
        Mon, 18 May 2026 03:40:40 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fead15bf3sm81574875e9.6.2026.05.18.03.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 03:40:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: tip: Include maintainer profile
Date: Mon, 18 May 2026 12:40:32 +0200
Message-ID: <20260518104031.38457-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=883; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=f36TM9m/kM8kn4KtZMX/ahZ+rpFYq2S6i1yJCp6/3bk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqCuyf0URT4xep5o5r+N9xm0Vam1NPy6nWoBAZP
 Zh7bchlpPKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagrsnwAKCRDBN2bmhouD
 12laD/9z0hcsE4Lnsm/OOdoJtx455aRkLOy3wlmj2vI8HBRx/kgmo/5Yd8Z3eh2zChAz9ptEyDX
 kFOC3xDrLd1hwFJIzrvw+0rJNTMfTnspyUbuV+hALeTSFAn5NEZsy052/DDfF8KM2FKL8Es3ddd
 kr9momdO1otSSGWjDQO1/wE9MPt2xG27GxqyEfUjsZyOaF5AGQUVe2ku4F5LPJ+hyntCyqjEnad
 T6FZxybRc5/YxQsRYB7meCmCjk0X/NJpGZJ2ARkU+YBY5gpYG9twkJ4NVQfXBwFYNcIC5QMok8T
 4PJAcuOZgnewZcwNYfnrBic7rTKvXJzei27ohV/o5TmrwqJAUK2crkCk4O+xjcre3xZDRdnNJId
 JDtLwM3IlhVT+rpwOXpDwOW3pzCr6lZmuGMsAZ9x7IVlpulRN4PBUUythE0BL1wXl54CWseNwDj
 Mr5/z5b+Y4Xb8tDecPsgbJ5F7Nl6VyTnn3UHiczbfIJRYLBSgEsPbJZUgOghLwpEc0CPgCSi1kX
 M1CfR5RZENjWsb2QDQh/qEHm4A4LRAqVCsCZhs9OP2PGt///2NfA5lU/MUhA5UtiEeqxdWf7o+e
 RoayqaBjlmsxxz7EDNBGz3G44xzw4OmdYRYHvtd5p0+iWlR4P/0Mll/B8WzSlBGBzc5e300Tcyu e3QvMwDiPHWHeGw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: s9T4Fh6a6PlnN-AL9g1kqbC4EkrOHiXn
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a0aecaa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=uSXuay7hLokiUHiS13cA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: s9T4Fh6a6PlnN-AL9g1kqbC4EkrOHiXn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwMiBTYWx0ZWRfX6Lby1gGdoZ2Y
 yDdbS52q5Zs0hEq2D9lWo+PKbjWLFHlcIJAJNmycD46m5QL9Z5CCA8E/2N6onEz/k1dcIcYerY3
 cddfYfVuFL88EBUWTJAnkvFQbRco8Wt2LgbyYbyvdGby+BDXAXzftxHLQsSjHEMArXKIh3O4o43
 ASglX5YHEDthDNaI2Gku/D+EuPKeq6Jv7IjGfi20nQ7HQZ2ZxOTEhIN5O5kDC6xlFTC03kmth8P
 0L2j150fQyE1nptX3EIu3QWZ95fAECR2Gk5qokvYSHfaYf8qIfWWC1xItXisbC7oSoKwgVWziK2
 mFAT/p8iK1BCwUPQ02Tpy9uL2aVFcESW8A+KgF+YoW6EnRfeGkVFN1Y4y2UK55KmuZh4SOmbdTP
 bGqDL/eFKvlv0ItNBn25/ML82hzlzVHn8SvGhF9qGTcCxlZr8TKdZjen3MndxFkCnrVhm50ldWI
 V3BgMz63KXPiNgZjC9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180102

No dedicated TIP maintainers are returned by get_maintainers.pl for the
subsystem maintainer profile, thus patches changing that file miss
the actual owners of the file.

This maintainer profile appears in a few entries, but place it one
matching the most of TIP names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 843f1d124446..a6553271e19a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10658,6 +10658,7 @@ S:	Maintained
 P:	Documentation/process/maintainer-tip.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
 F:	Documentation/locking/*futex*
+F:	Documentation/process/maintainer-tip.rst
 F:	include/asm-generic/futex.h
 F:	include/linux/futex.h
 F:	include/uapi/linux/futex.h
-- 
2.51.0


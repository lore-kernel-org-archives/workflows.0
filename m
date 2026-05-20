Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9941D21ABD7
	for <workflows@vger.kernel.org>; Wed, 20 May 2026 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779292142; cv=none; b=gSXK/KsIy9vFbJL1f2kXcOyEUW1Qymh3Vfs3b38MALV4SvHDkUNqTHsmFMu4Q1MgXEOmGMfL47BTG2Qutksq0L19SjTpGtKpDoy9Z1uFaPaHHiU75ox66gQSOl3a+Fmnn407HJW1jCTOJmwXeNgdYVbqtOPx5HuaIsZ7eA4tcqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779292142; c=relaxed/simple;
	bh=1Ym6Phb7VZgKD4TlysDshHDy0rCtFX7hTVVKpz5qsUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OD/djSuHiiGd7uwBkb55Cgn1OIysbU/0jB2zdx5Gk6rh29+tt6Sy5yUhQtJ5ANfmQIxvNIDYDGnR61EYGxBtWMbPwBu5uHizKRK5cXEqUJX5EKSDlwutY4zwQf/pYQcz3jT7TJAtFm3afmf0POB6DA98lcEbvvH6BpGuH6Qx1zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6JteUOl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H74dTk2h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6JteUOl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H74dTk2h"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCe2A4316427
	for <workflows@vger.kernel.org>; Wed, 20 May 2026 15:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+zOwFsQFJkZvl38pU4tCILlNoFusalJQ0fI
	g/UY8aA0=; b=f6JteUOlhksz26deYEmxt+pY64d/yg7lZZITEy3NRa7RWU47d2p
	DtNCY5koL9UMO4rk8Vt3H2TD4n90Dgk920dvmqb75vAanUmqZ9V97F3S7N7OOUH5
	bhxEt6d2hRrBDrVYK6+5MMWa7GrocfXG34Q9XfMrav2fUJ9pZeJ+y/Xem+2qzNbQ
	294X22xXfy5gneIeFV73Cfa2kPfrj4fTWcCQBUblJtyRwPpAYwaixj51LFzQqpn1
	sgrUV0ghRO6zPCM8qodOkx0P7v0FQ6h0GgY7vSfQALbzL3Xzc3NbWy1KYsM/jZK0
	OMN24uYW5ZS8OtKMdUrQFpJJsOLTalHUSrw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qrrug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 20 May 2026 15:48:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-63230863010so8096527137.1
        for <workflows@vger.kernel.org>; Wed, 20 May 2026 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779292138; x=1779896938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zOwFsQFJkZvl38pU4tCILlNoFusalJQ0fIg/UY8aA0=;
        b=H74dTk2hdPJnwjXJn8KjPQSoWa8yZNW05gtTqhON4cjy5wxVf5nttHCyX3OpZrAHK5
         jz3ANMdUVHFJPits/tamx4fP10t9+sbDwUINThljJKURhr+rXP6yW6ZU2e2ccmGBROW/
         9ul6VfEYnb3zQ8pqHVWRbR9E6gX9MRyomcgVVfReR1HGrV6bbTLi+jhGlSNWf6sWWbjb
         0BbOi6EEkIDhMSaRta9E2hzQEOjMT6kegP1RzjltX6IWESToDw+wgwRfbBnJM8pt3669
         pYNsz0DlCAagjcLGbsXij2J3W0uA+oEWoc0wtj5X4wP44LSADs+z4L9Nt/NQ8DH1ChdK
         c6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292138; x=1779896938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zOwFsQFJkZvl38pU4tCILlNoFusalJQ0fIg/UY8aA0=;
        b=CS/bKdST7nNeYXzpDgRq6UikCVX9Ev3/tZEy9/rawe53grs45t7n10DQHbd0znVoBj
         YLsNrxKBBKZnOpvhRGNn06rTyWrKo5Q/6qmcUtzn2qD3iOMFNt/6SAsh/4VbdhtSwTYc
         hTI+Amv0hj6sWZnjLTwa3XdhHtzoaI6PFYaowaUGXXpZSRuAaYVUa8dQksfVE6pKRi7K
         OvOHUMV/kANPt+ip1Sk/zzkngMJWnwCb2I1aDtjJJJEkwoFjsHhOovaLxnmY3lqYfU1b
         abO5/oA88oRWLyGxrtzeI14rZml43hNJdZ2xfyEGbHpKBvVpY/zdRuMKT2f2kohAdL1d
         ft5g==
X-Forwarded-Encrypted: i=1; AFNElJ+MBhgNIDta8K78NQlKJJo98iB39EdOOMmJtRSyQmb7ntTnJPl6B5DJaViGHizkUxRY604cEQ0P1ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrlHg/11wwEfmZBRcszJd2Tj+qS6vN1OotXaJYlfIjQNv1oah7
	fAkVgp1Muy+IF+A9Oz3N92qgLolDno+ZNakwdLvWloMsaq0xnUbjZrZus0paM9YiB3eFLBt+lb1
	1+958UzXuLlOva/JsBUMVMmdkH8APv2CQKRVbh0AQ/P4XczFwa1Uha8o0PVg0ghw=
X-Gm-Gg: Acq92OGZ58ngm+QQcDlOVFejeAi941ZkSGZ80je5/mvNFF+kqTtjXYtMOBr27pITpUS
	31kVS7ialFzuvGt6DfdLlgROErRx0u9xL7ab/Iiq3y4zepMLPBkCidol0QmQUQHM+Tmkwb0uK2t
	R6JdPaAwtUHOwreE9ealTjYSSiHvlFewYFEWY1qBkdd3alU6MVbP+l8S1tIIlEPC7mKRJo9jWu6
	ahosATzUi1O85GmzjlDtIMNjtKzJwTSeHDmFm62uVBG/Q7RRo7eZUTYfl1pkrp3uF7d/5giYyDe
	j8xjy9iJyAplsK3oNHIz9JYnijTDaFysfUE5qEEH5cKIvujA5y0SCJUdx62SINLNDSubpVj2Sec
	FQgKvKhLnQyiE4NJ9NLColtyYu/2JMRtVoCzT
X-Received: by 2002:a05:6102:511f:b0:632:137d:3ab with SMTP id ada2fe7eead31-63a403ad984mr13312407137.31.1779292137746;
        Wed, 20 May 2026 08:48:57 -0700 (PDT)
X-Received: by 2002:a05:6102:511f:b0:632:137d:3ab with SMTP id ada2fe7eead31-63a403ad984mr13312350137.31.1779292137241;
        Wed, 20 May 2026 08:48:57 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d9edcbsm278925e9.13.2026.05.20.08.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:48:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vlastimil Babka <vbabka@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] docs: submitting-patches: Clarify that "reviewer" is a person
Date: Wed, 20 May 2026 17:48:47 +0200
Message-ID: <20260520154846.162170-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3565; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=1Ym6Phb7VZgKD4TlysDshHDy0rCtFX7hTVVKpz5qsUc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDdfe6Y2/7ymkS8IyjJ/1S0XdWRCRD7le81vcn
 2/v9b57HoCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCag3X3gAKCRDBN2bmhouD
 1+DpD/91pB/48RQkRicwRHEsffe4vHuZNr1gqa++XDA3H7D6jQAgnPYDJWCnbVEH/FeborJlW9b
 HNLR8+IrTYtyy+C0oBcxuWaydROY+0n6GMVgfpzitE3OnwJr/lQvblrvWTRV/JJFva6W7K064iL
 0uqrSANoYMhsn6r+bc0R9Lid0oB2WvxPbocOww1IVrCzw5xGdnBaAuIrUwdjNq8OrBYRrgK0VEJ
 6911CrqvDsQv9hIOJdWNboLLhrnk6tA9e/21RV4cLANmZWvd9xJZmlWn6iBoO95Ox9LvdZ9oGmN
 4IMZO4MiRqb9lRmO8Q+1Gq6mXjCO1OoWp+qUwbkGadSAlCdKOt5zcXFtu0nM+dT4VLE43FgG8Ij
 lQVhewhKomKR7oSFmdsnJ60nYKZTG4hcO7kO8sgVIkwzJMC7aJ7RDjtgnjj/jRKp1Mojg4WdNsg
 cDeNRXYoyxveQ4LN9naaJf3IkkHk6TALrDlf6rMD6d1EfxoSTy18CsIuBvw4wgUrHDHWLmXwCML
 b857hqTIBTfU1Cn0H491/dt2FdUBJ1tg4N+O2SdF0kAXEWFs7UdKdF8zYJH/Z04t61tmISlZpf6
 OrT61xt6X5KDH3yuR2Pyzd2W9ZXL+2VYX+T8Srjjd/SOQgN6P15ft450Pzfm5HRE26vvOBw2lFW 0Z/mQ+w9coNP3Yg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MyBTYWx0ZWRfX9AZSXNwoL4EC
 aIdh5puixuIZgM1W59QyzOgH21gW/aHcwOOfnZ05TdbYV6ermuriHZWpu8ClT5XrZJ6n7/t9ped
 U/ueGPLqwoNDGk2nbwWhnwZKMLDFR93gLVX6a+Vt8Xy9oLVHKPA7nrH+F/U9YdHA5cnmMdr9B33
 ci07+mhzaV2K04pJu5KBmsrZkVy6O00jUDwJ7GMxyM2teVExuVRAexTaCxXr1xr4YYnLmREDh/2
 1FQ3mD0rNNniLooqwoGZw6BrU7Xkpy5W6U83CG0vVWaunDj1OalI4PPetMo922DABD8qFMBfPg8
 U7Ic5f2Epodwk5lsbAtRMigmGWclEObuhryYYzzsSMyjwCw9LseUmLiwtaaongq+i+9vhQp1CPL
 6S8+B+bf/CItbuRZnHYwBXgBGkUxp/r7G5zWdbK9ji121WRoZFdlORzO3G39LSiuMTIKAiz9HAE
 EYMofF7+824vtd/BPdQ==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0dd7ea cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=1Qhj-OTkAAAA:8
 a=ag1SF4gXAAAA:8 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=hY2az1HaepqEPmBYQe8A:9 a=gYDTvv6II1OnSo0itH1n:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=HkZW87K1Qel5hWWM3VKY:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: NlTSFgqdEc0-gi989sj-5Rb_elNCnoX8
X-Proofpoint-ORIG-GUID: NlTSFgqdEc0-gi989sj-5Rb_elNCnoX8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200153

Common understanding of word "Reviewer" is: a person performing a review
work [1]. Tools are not persons, thus cannot be reviewers in this term.
Also tools cannot make statements and cannot take responsibility for the
review.

Our docs already clearly mark that "Reviewed-by" must come from a
person:

 - "By offering my Reviewed-by: tag, I state that:"

   Usage of first person "I" and word "state"

 - "A Reviewed-by tag is *a statement of opinion* that the patch is an
    appropriate modification of the kernel without any remaining serious"

   Only a person can make a statement of opinion.

 - "Any interested reviewer (who has done the work) can offer a
   Reviewed-by"

   A person can offer a tag thus above does not grant the tool
   permission to offer a tag.

However this might not be enough, so let's clarify that only a person
with a known identity can state the "Reviewer's statement of oversight".

Link: https://en.wiktionary.org/wiki/reviewer [1]
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Changes in v2:
1. Add tags
2. Rephrase/simplify a bit commit msg. Rephrase title - drop "in
   English".
3. Add "with known identity", suggested by David Hildenbrand. I retained
   previous tags, assuming this change is within spirit of previous
   version and there were no objections on the list.
---
 Documentation/process/submitting-patches.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index d7290e208e72..cc6a1f73d7f2 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -581,12 +581,12 @@ By offering my Reviewed-by: tag, I state that:
 
 A Reviewed-by tag is a statement of opinion that the patch is an
 appropriate modification of the kernel without any remaining serious
-technical issues.  Any interested reviewer (who has done the work) can
-offer a Reviewed-by tag for a patch.  This tag serves to give credit to
-reviewers and to inform maintainers of the degree of review which has been
-done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
-understand the subject area and to perform thorough reviews, will normally
-increase the likelihood of your patch getting into the kernel.
+technical issues.  Any interested reviewer (who has done the work and is a
+person with known identity) can offer a Reviewed-by tag for a patch.  This tag
+serves to give credit to reviewers and to inform maintainers of the degree of
+review which has been done on the patch.  Reviewed-by: tags, when supplied by
+reviewers known to understand the subject area and to perform thorough reviews,
+will normally increase the likelihood of your patch getting into the kernel.
 
 Both Tested-by and Reviewed-by tags, once received on mailing list from tester
 or reviewer, should be added by author to the applicable patches when sending
-- 
2.53.0


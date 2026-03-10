Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B520B3E92A8
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173867; cv=none; b=uoMJOrM9IyWB+yui3nwXxhuMQaErpNXnJW20FxD6wTxw4Oe54oFWS+Vu4VBpRCNYSz29cWX6qcuxLrjooMHTWSNMrJmawKMDi/O9+W7bbcglvaLKXIgsCsYQfVF3VFoEyZ5UXSK0zba8BNisMo9euebrXDCnSPZn0DGg+j7EGlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173867; c=relaxed/simple;
	bh=8VXIeBDwmsaziXHiuo61/TESvB9yXc1SvwNc8S4i4Jw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qjAHHqfrn+fHJ3rZldH/TszSTjEwQ3ESmZ91Zal/6hApu1adsP6DSGGe1AftWWYX2xlvY4ggKD3il9SCjs2w+Z6amHiVc6saF6HUgC7+HWAsnNx6YPuX+6tyVPjS0WK6YMNVn9xBaWwTiAJBm0tVcDaquyEOGYperjcOIRA2Kf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0NzaIEi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eGDq9KYt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0NzaIEi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eGDq9KYt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AHD6FY1573310
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w7+E6tcC7Zn3D/FOetfIObIGYaQ1VPmcpoDua1SoidQ=; b=o0NzaIEixTPEJiWg
	f6i2mY2sd1H7AlygHakRZ7oGEADz2/Jp9nZlqbyUBcshQS3v7WrjyAMmWKidrH9c
	dhQWPWDnPUsmSPbFbHtaz1+77QKuX8/tN/pY/1LJgzKjtQ8nhp9N0cD+c4pH0LwY
	Dt7JR4xY/m0ao3cLPl+t6ztu82HEy4GhMm3xg5gtHeqpEROzR8nDGPdwBheou/6l
	41A6ZSo9LfwWC1cXz7EYqgUnDjflhENTKrxRwuE403DVexMEQodj4xrE781T3uHw
	wxp9R0QNnViNnZMof3ge7i4AWRc1IncqnRCa5/M9QpCEL9ThZPTlSvz10WvSoncl
	hjf0gg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgk8nnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 20:17:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829a535ad7fso12892148b3a.1
        for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 13:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773173864; x=1773778664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7+E6tcC7Zn3D/FOetfIObIGYaQ1VPmcpoDua1SoidQ=;
        b=eGDq9KYtRl802CR87NB7WguJFUmebFRaq5zDmfscitdrowleKpE0bxHwH/uM1I6I4n
         O3caCJNHrqrvjjz2lBqQYzvbc0LD35sz1Bgzntqc2ZvlVjFtLe5DILhKjU/YBq1mr+Ux
         VzKM8/kIqhkC2Rr6CeU8E+S8ypf4bExUCTWV23KGKdwiupGQhMfhJbqdxZduGPtMbY+Q
         tk/OjjSDctcsdseu+mc2V7O2WifEVrDp8w4YxBFtAX/TVulOtyZaA3lYZfyUQjxGIg+q
         cSDkSMEQjEq6x+vur6C9uCwkz7Q3oBGbvm4uF4ZXGOliytXs9O8/+t7vxAB0FPD1m3A4
         jUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173864; x=1773778664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w7+E6tcC7Zn3D/FOetfIObIGYaQ1VPmcpoDua1SoidQ=;
        b=i/AyIEp8kcl5fde3ZYRZkpWQgxEFNl+X8V6HNJqWtkehnHUcWpVna8Z+lJ/GTEDgrV
         o4kmvyoV7DxtSnznWDVEeBcW7nI+S0euCDlkKrMUR2qClSuR56Kf9S/Bf6jXSPRyFANG
         C8YUKa1cXdL6j3KYYSWumpjggsnj/GNZjX5ZYLXDhYCOk8fCxW7wtCeARQ4NeIH0T4Bd
         /8u0YUvutqgMFSPecsORjzSYAN7B+Q5oVS1yF960Tn0Ioi9vNchw9RTehoSAjJiiFJ0f
         F/mJWPsPcDcB3SdJN5K6SkuKD/l5poAL13RxbSq3k6cFU5R2BLUexa2TJmahdoeTcAbz
         6Q3w==
X-Gm-Message-State: AOJu0Yyxz2l2jbI5XLNVkC4pO4TjlX0xZueYaiuCUDQ34RSkgTO1C418
	P8S2znC9J20Nv9krlfIIsz0tVVhv5wOGoPx1wE/xo2UGYBDOJu8hFb0VAuvrMjDc5ZM8WWogPjl
	aPP3d+9UEamA8Fh3iifBFG8ywWnF0+bQQzAElce6MeOsXdhZAUjXCbrb3AnvDq/k=
X-Gm-Gg: ATEYQzx98PDUAaWlqtxotOAppFyWTLA7tNRLUoLcLydxz15XYV0zqu5x/1lscqwhU2c
	nv7jYXLqBLzEhR7rIi4UOpqAnqOREhdymhJTPjrvKFZL/VSpO1df9H4QojdlZugG5zIe4OmctOO
	b8DTvKbSAQxAsYRdXml5BV7C+WBKAdsOorkrFsuWlyWlY1kpI5cKRFid36vy+i0QMi543fUmTQg
	nIfuWhL093X3Kdl0ZjlnpiRsp59WCV3OlPBT/40iQRDEjh+ztfFayW67VSR1en1AisJqqySWLgO
	SrQAgCOV6eMVdhVl1mOkyNtsHD2b9mLT5ceIBVeBwhdjZI6I3qAfHckF5EHIeAo//MQ+Ug/5bUu
	Ty7k8ZPVHspCs/LxnuHWwnT9SZ1Gfmp+a8I9uvp5TuqS3r2su
X-Received: by 2002:a05:6a00:92a7:b0:829:6f37:158a with SMTP id d2e1a72fcca58-829f6ee7dc6mr163690b3a.18.1773173863663;
        Tue, 10 Mar 2026 13:17:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:92a7:b0:829:6f37:158a with SMTP id d2e1a72fcca58-829f6ee7dc6mr163660b3a.18.1773173862976;
        Tue, 10 Mar 2026 13:17:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm115262b3a.13.2026.03.10.13.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:17:42 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 01:45:50 +0530
Subject: [PATCH v2 06/25] timers: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-minidump-v2-v2-6-f91cedc6f99e@oss.qualcomm.com>
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
In-Reply-To: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <eugen.hristev@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773173756; l=952;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=RRdQeUZhXK8oMvnjfZr+NslKrJ0dwYGiMqLubz+98F4=;
 b=672vJ0CFnnKoQ49ty46SFM2zWdDu9NewajIDyLG+c9snNCv85PGMNaorgu5yAClaDe90mDCT7
 1A/cz9yzCb4Bg0lYVsxjwR3A6k52kB0mgUgypaY38fPEcU3A75TbROH
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: mR9dDYF5fnCaksvhIvVJbKVyccXioRcj
X-Proofpoint-ORIG-GUID: mR9dDYF5fnCaksvhIvVJbKVyccXioRcj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDE3NyBTYWx0ZWRfX/wZ9+ltJUFMP
 jfVNalgTEFQn+NMsaMCGio/O+DZ20gG8VCbqKwqd82UpRFA0W04lq3rbslWrxz+QnA1X+pnJdoh
 OqDDIEqj9ctjMdxH8OhEa98vGqxBjwwAo7owFh8p0gUzpiIhIXpxHw9Ho2Khy9u3WNljW1owBiv
 lSQghee4I8n8fs6aMJ7SMr2cb/9OUu2gZ1dXcjd8Q+3RYsM0Kc0Xg//KV7kM5UtaT7dXbEPua6g
 BDgzlhMfsgvl5p39gPM/TfK9Pq6jPdJnGynphfStq2qBNf2N2uu+1vsC1CH2qP83ikY6lAm0dIG
 5OjAB69qGaxPDOU56DN0rKPzKXzh1N/3wefmYkvbgFtttN4fyGLR2IW7wMg9mlTz2oiJcWCqYtP
 5nHwqKv7bBfAIyo+BGtBYJ2qqngDx4V2FAFUDoW0lO8fIXsOOgjkWoxgaJzYokWKW6hdr6MOf0a
 KTgjTIH8ZgLaZFHdNyQ==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b07c68 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WZmkKkIAQcJSthQVk9EA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100177

From: Eugen Hristev <eugen.hristev@linaro.org>

Annotate vital static information into inspection table:
 - jiffies_64

Information on these variables is stored in a dedicated meminspect
section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/time/timer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 7e1e3bde6b8b..ba86a5a7ebbf 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -44,6 +44,7 @@
 #include <linux/compat.h>
 #include <linux/random.h>
 #include <linux/sysctl.h>
+#include <linux/meminspect.h>
 
 #include <linux/uaccess.h>
 #include <asm/unistd.h>
@@ -60,6 +61,7 @@
 __visible u64 jiffies_64 __cacheline_aligned_in_smp = INITIAL_JIFFIES;
 
 EXPORT_SYMBOL(jiffies_64);
+MEMINSPECT_SIMPLE_ENTRY(jiffies_64);
 
 /*
  * The timer wheel has LVL_DEPTH array levels. Each level provides an array of

-- 
2.50.1


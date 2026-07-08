Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CC3363C75
	for <workflows@vger.kernel.org>; Wed,  8 Jul 2026 05:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488845; cv=none; b=haUeVVLkJ8pH2x2hR/ZswhOhRysG+n/pGo4uYIWklpKxfdVlTyVSzFN+M33rf7Str+UYnOu0GakxrJAuSSKkLuA84AbSIPlVlrPYoXv1qXt6wWOrlxvZWzXUzlxvzd5SQL3t+p3mhtBFmCZzeVf+4NzJqJLoZx6jLmqe+yeqEBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488845; c=relaxed/simple;
	bh=/537SqZjhoVd4pyQoK/eRmCVxxyWSUJ6mvHhf7gAvZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ql21av0eSeCKMKyRbBGBCWf4Bv+2jLWhBwYjEyZQx5d81FGfqTs06372gZLlm0tn4dWqs+OqarHUSsxsT93uAUzEx0OPKkN5x83PrU4fY+Flj8v2QbSkBSfWTj280If5Xcn+GOYsRiFZqUyvRiWDdO0YbeVu9op9DCzPVw/L5ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLEn2vC9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WoUBA2mx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLEn2vC9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WoUBA2mx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842klE1645072
	for <workflows@vger.kernel.org>; Wed, 8 Jul 2026 05:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HpBuqrozdeTyOtYEWu93SJI5zpFDQRgHZKn95naWN0=; b=ZLEn2vC9NxxlEGc4
	1NncPtbQ68ubHxWs4R7OVEJkvFYOJ8VJLWeaJKwtIWrm/Kjz1b8FL+bkRIscEhBa
	RHIhgaMkGvVeB5gzoG8Z9KilGd0oPTeNqemM2c5nhLpwefyLULCtJ3FGm1IRSGA4
	HOKs6PhZRS3AcIwR0u/aPAOb/46ChHOniWeCtWmsWQ8wIbIADMJkv9hvkDTcQ4sC
	j/4/TUTzyHxbVPTBZFTsuv2R1R7/4Dp+UBTLePYTFf5KCZLwuomCk1/DUqKOMJqi
	ZotjZSvlcje0VhjwIQA0CIjCu2yZ2Fxs3Hh+fC+L4XlZw7WlicRNQNdo4jwfDSum
	Bc7CAw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0maew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 08 Jul 2026 05:34:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848415e9e8eso545954b3a.2
        for <workflows@vger.kernel.org>; Tue, 07 Jul 2026 22:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488842; x=1784093642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4HpBuqrozdeTyOtYEWu93SJI5zpFDQRgHZKn95naWN0=;
        b=WoUBA2mxGoUIN5FkE2BJzwUT5+yZEOliPP52ATy1/+ou5jm4Hfy2OgklPRTOYStGFP
         +t56tV2nR2vaO+GO2+OVZlPP1E2aKwTgMlVrEMU5zvurgMWsGBHjJQ5tUsQa4snVt8qP
         5A4ggDXLJWyapj8U3xU6PcLevnpCjD5h4CGxEUAdLKBMErH6w2VL5/UxWyesKsKsmo8x
         biSHgxw6+/vx4FVqyIFzNw51Gnd0XvM7S9Vs2CiEi5pX4qqtL02gWfDBFGJ0aPVCKpwK
         9Tt8fA4E/nF4vdnI/Pp46WL+ijvyQybVOItoMtQN/mxZBLMuDz+JgK9qJGxF4hBjGJ24
         vWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488842; x=1784093642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HpBuqrozdeTyOtYEWu93SJI5zpFDQRgHZKn95naWN0=;
        b=BkVbn16UB33yHBcfBKOX683iW/HWASqwT7CfZVq+ZgHOHj5hlGwRmIYBYtFDhj0J/k
         NY+qLvSxS7QX9uX/y5AevFVS4m2S1U2URNULdu6JLjmZXEXbFH+Fq6hev4Hr5m4DxTkQ
         s+ojpZpXoipJzOaU0GhvVTUlvpjDbcw615hTy0zqUFQK2PW7nffBd+d/pZi4uD0hXrde
         noW4k2SkRulBTWvaKCPhirsmffG60HWylREiergYSiYYlvxUr9Z3LsLOrZ8aE2/1B03S
         JL2JH1YsbKiBhzxOt4QRjbzigUBF8XyP+8OnaZhMyfCiIh1CVU0TPJH8SFCYnt67rQbz
         l0iw==
X-Gm-Message-State: AOJu0YxWZtgXlbYbkbdtF8BbmYPJfk4mMQxDFj9q1UPFJau8yjIusYa/
	KNRaLUtFZoWG1zpiHWn6oGiD3M+lh2Ml6baF8187nqB7Np9OKIIfQ8UHQACOBBXs8MMUDgsr5at
	WzTBckpEf95k3tONFQS/T8foShfybXcg0PijhhE2RsJPAfKxbY01JHMCSy3dutLU=
X-Gm-Gg: AfdE7ck/l5SHxOHHXmXDoKIvsa5jF/33kKoz51X5Tq75DHlwJ8p0IXvpnWTLULrq8HW
	32m3FC1sKzrdrJPkEFu333jiQKdAaQdgEdchQRiZITFnYogIwOqj4AEsWBgTXzdMluz2zbjLCo5
	fTdRvBylXBxaVTZ1YgqLVdMi+q0cDI1hUSA1Zc9N3UMwE/1je+tkLyk16OM4LxKtlnTGTwa3QO8
	Y4nEgTDrDeM4AMHzpUb90uVVn2LBHNnFDW0gfbgjjrr7X4yw9uPIMoxRwEr6UBuWKZ4KGgJsf8k
	ocNaqLP9omy0ahpGmQti4GWQyE3qN8VOy2f65OMi1GfIyUXN3ucPdTOhc6O7bIC6bs+G4aTznam
	G1y+fvMpfrDSeGLWDQDGTZuDzej9VO0ERHAD7MQ==
X-Received: by 2002:a05:6a00:4fd4:b0:847:9745:2f8f with SMTP id d2e1a72fcca58-84842ef9336mr1249216b3a.18.1783488842150;
        Tue, 07 Jul 2026 22:34:02 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fd4:b0:847:9745:2f8f with SMTP id d2e1a72fcca58-84842ef9336mr1249126b3a.18.1783488841342;
        Tue, 07 Jul 2026 22:34:01 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:34:00 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:46 +0530
Subject: [PATCH v3 07/26] timekeeping: Register tk_data into meminspect
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-7-7aa5a0a74d5c@oss.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
In-Reply-To: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Eugen Hristev <ehristev@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
        Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
        Kees Cook <kees@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Brendan Jackman <jackmanb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1559;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=/537SqZjhoVd4pyQoK/eRmCVxxyWSUJ6mvHhf7gAvZY=;
 b=Fve9cp8pIk0fRrev0JiMgnk9tJtf1Nbcov5h2qnSMWvoYTJmuNKoh/yGQ3zv9wJ8+PXmUs4Ad
 m5Vo/TUy3rKD3XGNX5Tr3o3s7jZt5hvgFYrL80gNWyboimv945juho6
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: GH59qxRNFQz9LJdJ8qwTcC-llSBk347O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX5IhIZw3wU7DY
 C0xBeZlp1neBFaywxc1O7guBPw9RInMpPZbkmnJ5MfkzGQv2EogKyJEwWEObrO3gXeJKB1OqvD0
 hTqjkBrS1oCHgNP9K2jw+2MRYMuxWU8=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4de14b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PWZB-clRUh0r-kCehmkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: GH59qxRNFQz9LJdJ8qwTcC-llSBk347O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX7gL0mCooIdX/
 +Wnl+HtwP/mkXljFP9fsdg0PFVpKM0E6GYQ3uypQqp1zsPgOJ4lSUt7Nd+iOr3PUKHnyrA1TmmR
 siUIjROharPs+14VVjAZ1ZsbNBmwa7jTrr1fHkp73FGxhb0ubPjC989iSfhfmQvTM4fVFMzOYM8
 r7Z1PlpmQhFjcTM9oLfxj1mgT7ePzrEcIu9lIMTWlA9cuApq4ktiQyVek5X24VCv388qJ8vKduI
 1UYxzxG6xZT2rHh+dHOuSANgwoGkARHGXij2QjK7UtiV63x/IxosRm24nTlx/lGklvR/gu6k0HW
 ZnOZl4/v+hgXO0fE8aYJ4W5qiL/k93y3w0UvDhvJs3HXe+aPovA5ST5/KyIwzMIRqmb50iMdHGi
 FmpIUDO05JJzdeGGocNj//hvR5c3cod9PnUreJb91ObJN5+vcrUNC69lCyhOaOn15x/V3wDkaUF
 sLWQ6b4pc+4JrdYOCig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

Annotate timekeeper_data into meminspect for debugging:
 - tk_data (timekeeper_data array)

Register the timekeeper_data array using MEMINSPECT_NAMED_ENTRY
with the "tk_data" identifier. Update the meminspect ID enum and
the minidump backend string table accordingly.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/meminspect.h | 1 +
 kernel/time/timekeeping.c  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/linux/meminspect.h b/include/linux/meminspect.h
index a9eb93c6ea2f..b64ca614b243 100644
--- a/include/linux/meminspect.h
+++ b/include/linux/meminspect.h
@@ -49,6 +49,7 @@ enum meminspect_uid {
 	MEMINSPECT_ID_kallsyms_markers,
 	MEMINSPECT_ID_kallsyms_seqs_of_names,
 	MEMINSPECT_ID_swapper_pg_dir,
+	MEMINSPECT_ID_tk_data,
 	MEMINSPECT_ID_DYNAMIC,
 	MEMINSPECT_ID_MAX = 201,
 };
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 5985d6652c1d..8a5da24d8678 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -14,6 +14,7 @@
 #include <linux/random.h>
 #include <linux/sched/clock.h>
 #include <linux/sched/loadavg.h>
+#include <linux/meminspect.h>
 #include <linux/static_key.h>
 #include <linux/stop_machine.h>
 #include <linux/syscore_ops.h>
@@ -53,6 +54,7 @@ struct tk_data {
 } ____cacheline_aligned;
 
 static struct tk_data timekeeper_data[TIMEKEEPERS_MAX];
+MEMINSPECT_NAMED_ENTRY(tk_data, timekeeper_data);
 
 /* The core timekeeper */
 #define tk_core		(timekeeper_data[TIMEKEEPER_CORE])

-- 
2.53.0


Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699983BA237
	for <workflows@vger.kernel.org>; Wed,  8 Jul 2026 05:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488813; cv=none; b=uVrLv5PuUR0MBL0vRLfW9rD38odt0+azsk3PI+sSVH4QtMYCZADV6DDISsrSm04TPzmw/tMXUPYFxhFhZPUJOVxZZiFjkpZdmkiVy5JClpYjT5pVBCQiQ8cfuubTQEgp8ZLMtvL1l4SSNM0UVZg6hSsv81+kAITSv4i9V6Kt/W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488813; c=relaxed/simple;
	bh=/6h3tT/lVyKdJ7Awq4ViT6MVLM2gza4iwC931wR4Q9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V9q7b9IoegFe+M6FPu4kUxIY3uyEQwM9WtTOO0FAGTvx94EbNM2rL6SiSRwRWIdLHFCcFn1Fb6LykOOunAAR92eCQ/2qhtDirY1CZu69yvWQ7u+3aYIVE7AzZVTRBvnZZiKmQwERfLwf/Cix6By6/tZSQnuR3+5qIIGmt0P10MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIJ+OVUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOO5QBB8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIJ+OVUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOO5QBB8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66842iYe1625089
	for <workflows@vger.kernel.org>; Wed, 8 Jul 2026 05:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tw0fKvrBBEA5FX4luROpIV1tavP8899q2m1fKdILPtY=; b=aIJ+OVUnjOReaFIJ
	gofT2IG7kN05yyO6OHhRtExveYz2PuaQ799uaLO3FtSZhmKD1Nyb+xCKZ91fRTJ1
	IbTs/p29TaH6QeAppdwHG7Aqa+hO3ouwWFp5ZhITk+HN0qiwvqug5C6D1B2HiCM0
	vlj/LtfuoT6CkzD4QwEzimGz4gLd3Z4qvHosvA8yh1R7OjUDtUu/pXC7iIgQWDXR
	LvunRPbvLIG5hyUJCIk+lCPWFfk6bZn8eSbzShWBfsTclu95eNt0VEAaWmZAgdL1
	HjObNtYklBRkRBI6WYeqm+QoZ6naZtcfmWLcKJfhJk76NFZhH7jNaqkVnArreON3
	ohhKrA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd2tbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 08 Jul 2026 05:33:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so562824a12.2
        for <workflows@vger.kernel.org>; Tue, 07 Jul 2026 22:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488810; x=1784093610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tw0fKvrBBEA5FX4luROpIV1tavP8899q2m1fKdILPtY=;
        b=dOO5QBB8L/2VxvPfb20T3obS7JCW5aZpYJXbaCrw9su1jSt8wW4b5a15c/gST/fAtn
         ch5mwIuXAGxgW4RzcuJeFY7gqjzdrU+FZz9CE3fDY8bCJraFnr+EcmDdeoRc37P86BmG
         9NqMqbcPY31+BOb5h3eRgEFze4zZuCGjClKkRj1WdsDni261UJdNOmPbhBWQMaey453f
         iEyRof8PC+wZlfmOmlcPvOZj1AC3S+xGbUjre2aiaSLY/engPuBnp7RmlmK4pKsBn6Lo
         gcZU/o3Jj3qWDpdd4X57D4+Oz2zjJuPJ2fC7noDegiW9mpiO1ymzC9blONK9aH0Qu6rP
         UEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488810; x=1784093610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tw0fKvrBBEA5FX4luROpIV1tavP8899q2m1fKdILPtY=;
        b=GspUKb6I4CA3/WaqtOsnlsHXvpr7yh4b9KfjGlfM30q89We4kuPyknIQtu4Dh9hVdb
         dWD5GTfQlUVOuzWXnhrcXnXwihyZiY3jQsoY1QJQHGG6Zj+GkZR6uz+DPba2ESfguY4r
         +BZv2zpqQieCdXVuq0NjqdLeBX9ZkqZiRRzxi3PEbxO3PPc3TeDzXQdjaKF3LEGh/2F5
         VlFZjgXXIUxDhcSCbqfWhYuCgQYgNw6N7GqPKAyaXrT1+r7lpMCkFjMb/e5aqodw2Fhb
         YHFFD20o+EOU0P8GBfM7an+wURfaM4rB8Dw+7N5f3GFCcxTuwLmiaJaUpO/Gdg7P7U09
         7mfA==
X-Gm-Message-State: AOJu0YzVU6t2Z9kTDP2UT+ZA0mVKF7oymDcfRsJthjR/vuGvMAu21U84
	kyoQyBU7oLffrbQ7gP7PF90OmBXReM2lSyxejEoQVJ4Jla5m1EE74So09HSnk7LswjdhXai6jxT
	KSEWYYm9xXW8alad3wTrL9Tz7956BRrQEEgXHEuJG6oSwA219jAGAk1CMD+ut5k0=
X-Gm-Gg: AfdE7ckOElenuNBTGmp9dC2OnkXLs8nRl/ypAMEByz0dM6LOOeyVpMz5OEp+Q1P1+uQ
	57QL74cm4O21WgjlsjqqAWe0MnGqTTcCQmI1PbQIzaKh8BvTTMKXVXBwYOSmU+a0GKljy/zZzII
	aQoOhWvfKiT/o+mAyWlbm41ftNAR0jiVu7pObB4UOpyScZBMNA7Y91EWDmWGoffbbsJRdFXydy+
	JFaJ2xHDLp0btDXtlJk0Vqqhv3IoJJPLcjfRjid01b585Dtp/ThF9T3+GbP9eylaRvEPX9K1cLo
	GLYm2XDqsbPH9qBRfm1TmlCdxsBl949E8hO9ZEbpsDlj5+YoCjNoxjyb+0iSbiUgzNXvqu7alqW
	Wqu2p9sC/hsJO7Am/UM8JuH+h7Yi9x8taTMWbzw==
X-Received: by 2002:a05:6a00:1992:b0:847:871a:94ca with SMTP id d2e1a72fcca58-84842fd4953mr1063875b3a.41.1783488810304;
        Tue, 07 Jul 2026 22:33:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1992:b0:847:871a:94ca with SMTP id d2e1a72fcca58-84842fd4953mr1063828b3a.41.1783488809721;
        Tue, 07 Jul 2026 22:33:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:33:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:44 +0530
Subject: [PATCH v3 05/26] genirq/irqdesc: Annotate static information into
 meminspect
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-5-7aa5a0a74d5c@oss.qualcomm.com>
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
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=986;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=V0hkQm6fvvdwmLWbmnwABstbPfO8t7+liV20uf7x678=;
 b=B6bivnR7Bg4sl7bXAEOPvh5EHC7DFSJQHDd2jJMSLy/o2W0KYPGcZeOKz7zeQrcRQv7F9NTaX
 XpS7VFBMTebDkPpnbFKurlA2nLFIU7MLF0pBWpFuobcTjDgJMXosqKZ
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX+IOE34m7oux2
 lm7f1/NpOgV/Qz3NJkmLET8IQ4UsHNwKLJHiMh0kHlRchr/tWTXZ5JTh6iANYt38f1jntgf9iAH
 iAGmr7TCNhZ6OqAHhDiKIm8UVwwnMYz9qm4meMGdSVbU3nzWBN8QNJd5EJjoNzUIgHOGYkrlxfR
 LTKs+Y4vQ11UdCqV13fxrrWOA3VJ5JsIE0s52JmYGg0di7BsN7pu4T8BwGNARDXlQq0xKOkNU3X
 xkLjOS+58/ugx3cy7ZejDXkaF2a3FFCV1SXjjlirrmqrli0T3f6AB/U3LQQFKlL2+YquxDKyJPL
 1fQy4/l3kAiuplcujsbWEYjIkD+tr5MdLo/w3SBR9mVbafJrU/Gd2TFhAfReHyxfZykSSyvzqrv
 hkcdBJfq/HHruZ+m83FcI6saP+FaKnn4+QXZ0gL62meW5xV72uxZ705lQ9rRqG8NjXljXqM8ezE
 S+fMI/E2+lMYKXBUDzg==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4de12b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=W0BCv_TwhUmk0ohr3HAA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 9Ua4gl3fhoX522pP0xhmV1HqkitU7EI8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX4bd47Zrym9Wp
 Iuxmrl/nRDQzfGBtx6EH8ExCgg4BQJFMP0a43rBATnOpTXHDo8onsRvlN12zQpMM/tUsHP25dNX
 ob3/dITEibbT3MHgp4KOsn/b9TtOzJs=
X-Proofpoint-GUID: 9Ua4gl3fhoX522pP0xhmV1HqkitU7EI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into inspection table:
 - total_nr_irqs

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/irq/irqdesc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 80ef4e27dcf4..4e58e7f5fc6c 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -16,6 +16,7 @@
 #include <linux/irqdomain.h>
 #include <linux/sysfs.h>
 #include <linux/string_choices.h>
+#include <linux/meminspect.h>
 
 #include "internals.h"
 
@@ -142,6 +143,7 @@ static void desc_set_defaults(unsigned int irq, struct irq_desc *desc, int node,
 }
 
 unsigned int total_nr_irqs __read_mostly = NR_IRQS;
+MEMINSPECT_SIMPLE_ENTRY(total_nr_irqs);
 
 /**
  * irq_get_nr_irqs() - Number of interrupts supported by the system.

-- 
2.53.0


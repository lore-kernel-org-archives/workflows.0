Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5FB305E19
	for <workflows@vger.kernel.org>; Wed,  8 Jul 2026 05:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488797; cv=none; b=EUIWDDpPx2kCkXKrvgf/EjSnRV0vqbN9X/wrtnAOeM0SVfkH5D0GDo/Iab2aKJgMUeTmVDHwza9kUqbL+VyPEH2FgZrMMhEXSxczfZPWR0C/T7Hk/2b7SJZ8M80mSmzud46flgf+viyB6sy+gyjj0FesQrRr/18qYmcxY2AMWi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488797; c=relaxed/simple;
	bh=271DJ9jgC45m5gX4TZNLlhbT+pwRoJn+F1VDPJD1wOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZyEPhBqVs8exiL2lSQJMEWs61TcvIEd92KgzpJHMXFmYjBmLm9uBtW0FCdFhcxh6kHnl8cNA4KMk45I0BdY0cXWGRDkPqRKbpWy+N1GXaBDm1EIBCIbC/+kBqBdj7Gf1ll+MULdCQVoWGjVKSTgHL26oWhGNXYeCrJUslLJFzv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A7BSBhmn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xg7cziYx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A7BSBhmn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xg7cziYx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66843Mmq1527620
	for <workflows@vger.kernel.org>; Wed, 8 Jul 2026 05:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KS6KjK1VRA0E19Ye/3uABUACVvGYCQVpFSdxjmPI/eE=; b=A7BSBhmnYL9DWL2C
	l5JDHhwJ7GrYQHhPPKjA404myQsOdZd2oyRn+UsW04vWmNE7TR6RTv4dXk+7gp/W
	3y7LDxyAXAauz6Eua/VvYIpk4vTPWLT1P+6f3kJrlN3vryFcLA2EkxxJBRVZeR0C
	XIW76Mbl7R7fNY2naLO2rYODQ3AAMHozxgt2IhBGFH2mQJf4H4S2sxqSH6zxuT1O
	XfaZ3LN+qpSMwaexOrXBNB5vW0FoS88oVDIKRiNzYTuIz+vgY9Hj3jeupq4y/6BC
	q3ZS3yRSpez49f7J/yMTrYGBbGA9hrUu1U9DFw4X+jZKtpgjgo5fTKGdSYV7oNtf
	oRNmsg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun502f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Wed, 08 Jul 2026 05:33:15 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so395045a12.0
        for <workflows@vger.kernel.org>; Tue, 07 Jul 2026 22:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783488795; x=1784093595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KS6KjK1VRA0E19Ye/3uABUACVvGYCQVpFSdxjmPI/eE=;
        b=Xg7cziYxD0IHZZulvIyRyTn46JYdUSTlh/dx5kz/xyxhTHrYpqFAqL/+z0iGAYWVbC
         9FrTyTkk/N8aXeGGBvsympoNp11m2E/pXkBza3hhZmtHL4m+ACFr9KPDLurcEBavRhvt
         Qj68fCaVn+peYONZ11iepNkWEjAURQtE04DGp6wE/ZL3QhdUzAMoiA7kMHVDIxOEVa4n
         0871jR/+ELA6yXSCQVphdVBG52zT7lW27OogVcfo1dkdOXbWaw4druNVyE+8/G/TzGwJ
         utkeIeDKMx7UWvZraB1F5nNA2FoQv3iE4d1vVkVIFDe9dU6zYUfemsqBP36YmGZbtWrW
         eVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783488795; x=1784093595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KS6KjK1VRA0E19Ye/3uABUACVvGYCQVpFSdxjmPI/eE=;
        b=lz6e6eZ3eSx9w6fvDKLIou32bJWklPW/Y37eB5g69Hw/BGksS7DFkELJdKMEUM5EEh
         BB1/8sD7XA5QTSuhhhHpQmD5F8FCicdwszX2H2Payby9Xe9OBnKb3ZcjgKagb+bMNFf/
         3i85gzVQjfCYH4EfUEBrT+GuAkDeVMXURWOxiQLxFBGlhpclZoiLlGwZ9jP9Js/bZ2gb
         JmCPIsjU87Rel7lVyns2NJoFdWlqlNJRFlTUEOOFaOSlTMcQh+bg8IUaB4W9X18/+kcl
         uAiqq83bGSlsXJNXXUD0BAz74WujRGoBvlzlxcOyymfcwyPg/wwZrDbMsvPqMteG7IC8
         YR1A==
X-Gm-Message-State: AOJu0Yw2S8ju+8DU5t/VXrZSIooBaYD3Qy5y1DwszAEz8b67jankqWb6
	W6Y2N0/KrCV24vy5CHwkbl4yv7HqbWhvQFKlGw6pLvGZHUDWyLo8vZyOS5iHhe+hMaBI8TZ57hC
	HirAIj0x/EgzAi3zpHtYlzOePD7YBUOdcDVpieP+vVGnLH2uczkz6UAh61/XhWcs=
X-Gm-Gg: AfdE7ckQszd35p8MXWystZCoQC+9eVMMy8963FmNFmD918IcUWWM36Q9Cakv8iDpIx8
	DfigsGPkfm6elRC05wL47JF2G4lRZyf38AJYFnz8v2xaSvaotlbRcU8QDgUAWwUIqxfnx8Tq27s
	g+ef0qDBjSe6Qjzeh/pZv2IqzuAZr4PQirxAcXz89KAfRx3DbT8Vv9NfjEN+YckXLFCHt3voz6o
	THzJMBjKawsJCSTwfNLDJOvz8Jt9YwtyHUqKAiUz1wJ9sjA9AsjiRaynDwTlGzmR/As4x3b++Qa
	gqnhD02Awadj9MbmNe0Ju3vVqgCWJDCgvh7DIofZ/h8ZVJA4WV4fnW4+xDiL7Ev3XJcCb5N/FL1
	CYBcfFmRci2RkQiEnXhk3H/pVVISJzqxkx0NUAw==
X-Received: by 2002:a05:6a00:9510:b0:848:2d1d:836f with SMTP id d2e1a72fcca58-84842f090c1mr1174808b3a.28.1783488794558;
        Tue, 07 Jul 2026 22:33:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:9510:b0:848:2d1d:836f with SMTP id d2e1a72fcca58-84842f090c1mr1174746b3a.28.1783488793925;
        Tue, 07 Jul 2026 22:33:13 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm6484592b3a.53.2026.07.07.22.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 22:33:13 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:01:43 +0530
Subject: [PATCH v3 04/26] cpu: Annotate static information into meminspect
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-meminspect-v3-v3-4-7aa5a0a74d5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783488714; l=1623;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=7tcV3EojDUJDYXtqUmecbHdHj5TxMJCFkfbTBXEPzZE=;
 b=uPlnXmsDJ/5XV/qNRqQUBd29GoRnPLMg69Q8kK5yzcp43jc/cas0ETVH8wiJJdiYqnzbfi3s9
 zEovQovAgGzBkEvohecMwfP1GUVvyzxtLtHFt9S/LksPawXMLNMVZUu
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfX6Kc6bxVu5P5B
 zUc2WEcTprlwtZXJjApE6/sc+Sv3EBRoi2D9nhAOjhnKBRAmcsT+sHPi+lbUe0PnCu+vhyxc/gx
 SwMqVVfAKdOD8qFGSpbqr75T0sjgzHw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA1MCBTYWx0ZWRfXwUAitKCiabeM
 z7Igo2WS72OQPBHmIPCABJmvgRnJg5wx/Ku0m3JvwrgEdp8H8WuFXLsvNP44hBN8zR3TKwVtqyG
 Y/LnALjLCiWO89YRK2wHIC6sQggc4T76cZ0+vMEq4seNUB78FwOxpR1VNsGqu8hqxGxw9gvjJMy
 MEcn14R6T+Py3CejVdfrtO8Os7wlwfMa4E5KbivcQAMwXI48RykmPIJRk+55dZOmUojXfj7/+ey
 uXs8XRS02rQqOiA6fgr7GzMywepjmjdV4AtjcF2X1E/QQx3Jq2eGfQb+sVD7L39b94j/dzt9n9E
 iNN8zV57RTqqZw1pEpfvBPR9bIF+y9OqRlmhlx+NUaRw7eoTIJXi+4ALw4wA+lDxaH64Ikx0KAL
 3A87yXVoVbdFThlzq4nIuYbHjspAZmdf6TzE4w3HMhoVxv9uS7ibd+plGZF/xWrkYSDMasw71/c
 iLs6FWePwfTQ5A54/+w==
X-Proofpoint-GUID: gIojAXXozFMpztImsEfrUHlZPom1W5in
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4de11b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3A8An4GuCW952TOlvi4A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: gIojAXXozFMpztImsEfrUHlZPom1W5in
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080050

From: Eugen Hristev <ehristev@kernel.org>

Annotate vital static information into memory inspection table:
 - __cpu_present_mask
 - __cpu_online_mask
 - __cpu_possible_mask
 - __cpu_active_mask

Information on these annotated variables is stored in a dedicated
meminspect section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 kernel/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..01c86510124f 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -37,6 +37,7 @@
 #include <linux/random.h>
 #include <linux/cc_platform.h>
 #include <linux/parser.h>
+#include <linux/meminspect.h>
 
 #include <trace/events/power.h>
 #define CREATE_TRACE_POINTS
@@ -3083,19 +3084,23 @@ struct cpumask __cpu_possible_mask __ro_after_init;
 unsigned int __num_possible_cpus __ro_after_init;
 #endif
 EXPORT_SYMBOL(__cpu_possible_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_possible_mask);
 EXPORT_SYMBOL(__num_possible_cpus);
 
 struct cpumask __cpu_online_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_online_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_online_mask);
 
 struct cpumask __cpu_enabled_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_enabled_mask);
 
 struct cpumask __cpu_present_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_present_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_present_mask);
 
 struct cpumask __cpu_active_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_active_mask);
+MEMINSPECT_SIMPLE_ENTRY(__cpu_active_mask);
 
 struct cpumask __cpu_dying_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_dying_mask);

-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236448;
	b=X/7VfDGJrN6DRwXnOirmcAdc6zrIaecUNvBuP+wr3ChPGsD1kOv/7OG9BnN4mdRXl3Gy
	 5jpQIxosb1zGuHLr9ojwCU/bWwKpL9jxI1BIp6HB9UPGW0gDE7oo7CL0tBLRTSb3ev9jy
	 IZUi8vh6nAGDcaEDnyZlEu6MGDEuBBQhIUbiDSBk1IyjXFDWmqlbncbefi1nT/HzU+oOp
	 T5CL+BvrI2PV58KaQPo6LaBkqW8o7Eq78iz5LHTM4S44NBZYRm/uhRN9MNDI/ub7ljQ2D
	 kKmsY338nRpr5ksA8cxaJIsgzCOXNkwEDTkJa0NT+Gru6xwM+GZQ/oG90/gQQVGlcpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=;
	b=uJM1Mu4fkbfIA9jTDKVvfut3XblLO4gzhfKI55KWLrPU6nVVu8VZDHwgGnz2lAoFh+jm
	 bd6+gFTzxsotyNbsrvGP+QU9ei7BgF/InZrKLf4i4FD1svbd5AAJ0LeOrmLGqQdSPqJj0
	 57Bf+6DJijRXlpugzKCrDEic7qbdHiWTcPo8VD+bUfF4HfarpwN+qKZ5vEgZ4MprKhDYl
	 c4h9naHV/buhpDVkBslMOuGx+xHl6PFvh9JbZeDJtgKwofelSf8OKHPisKIQrcN4huruu
	 vXtejltcsRuXX/tkSLtmr2xqT/PNacAFtiijkjEGnVmcyQqsPU04pQsGSv+w7qXXuNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NctNdtZc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c98CKxoL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CF0606A339
	for <workflows@vger.kernel.org>; Mon,  9 Nov 2026 15:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6CF0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NctNdtZc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c98CKxoL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFK713588625
	for <workflows@vger.kernel.org>; Mon, 9 Nov 2026 15:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=; b=NctNdtZcMYdvTKdT
	/9OUZD/qmpDdrtC/gm7Dhj1O5TpiNZw9NlN9CRpWh3eB7qlyBIIHgLN+sV1rX8zV
	MJzpTe48JkfeUiRyNCyeteqMHnGAAmhCVGAcYKVhen+Of+oCYTinBibwY2M9FPft
	ijncgMxHX//+t5JRbYO0jkXtW0w5IsTGj1KhEDkQyuqaI7dZquDM/lOU1itfcVsw
	T/GB8ImYwPcIAiES1xdoHvcwF3faS24kVpURJinjg2emlZdk91+COykXUDXO7vQk
	r26J9x2Xpz+2YLx+kpeEdVFQy01oaWh95rIFUMdp3VLt8BJaS/mbouLk2o8GnBXT
	B1y2FA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8pmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Mon, 09 Nov 2026 15:00:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed08b07232so8752505ad.3
        for <workflows@vger.kernel.org>; Mon, 09 Nov 2026 07:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236432; x=1794841232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=;
        b=c98CKxoLkCt4TQW0a1TvqNltR0SzOTF2DbIuoKQkpX2Lkt26Ff3qp0pWgu2yJI8x58
         H83WsT4c/BMNVKsle5HKCSAP6kfthGCHYo+doc30miEVk86h46/oFrHNvo+79kN/AgLO
         6Wgplneash2uaxZDvXS/oxkWRWRt6gCQnVNcM6ZRU4wxIBbOy6LmL+YiVMOrjIdXPlME
         HToBD4d8TpUK8XPfyiUkbWl+c60DmuYaUMmOiBRGEg3apcWW6/rADrCJzAUYx1V+E+Au
         xe68ZOtqpPkocFqCtluCXZQ0woW34A+1FPXRfxzsFo9qeBUrgGwo8fHGdMWStaJA46Eb
         zLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236432; x=1794841232;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yk/7s1DGK2LaMZgRPwzZnMgeWvDZ0DPNeBQ+fDXOGmo=;
        b=vEyMOj1MUdsMOP0hQXJ/sOtQn3jRQZ/WrMsndJlffOTjchFA53pVemDWeXB+uY/712
         9if3Gox3MNpBOlg+Rc2+xuYcV7MqN3UqhOEdJ33T7ku0wCnivMlMmWvHVZ1NAXmUGEPY
         Y1HQ9anD1sYOcOEfDKvJgFC+eF3a0YBv+U6JLH2R7efhP0BYr8aPDbEvcTLr4l/QQu/e
         sMy4F6VDQ1kBtHOG5FeJ0YPSOmcbPaLhbAd2DN7RoujdufinRTL+H7Is7zRZpzpd1y/V
         qoRqkJ74fBnN2WwTEgZS9os/fDAVFGGdCo5UXFRmO/QgPZhBDnFzS9wvozIslgVMmljU
         l1lA==
X-Forwarded-Encrypted: i=1; AL+hErFCZ2jlIaT5/ex3sL0yEWtN6ou1SnsKUgbEDVqy9k9UcdNPcPS0p2YCL5OIkxBIXH/6xCK/DfL1uxc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mHGGO1ZB5az1q7KbEmqwoJZN4fAVfXFejQk6o15hcmrBHE74D
	6k/Lkvarky2PV34dfZRAxECz3j6UxPwWwfXR1+oiif0oC/of8D3ss2jfQcQR8dEvCkF053cMaqd
	nmUune0RwA2asUh5n2TrjSU62JL0GQy+K5F7wpGyi2ZO867WNU40ZN8xMCUfsZsA=
X-Gm-Gg: AYBFou3iE3HthmEVUG/iM2fwmHLazL7qpbnbjYrZBIZqqH5Bvtv6XCRL1xwz8w7rBfa
	Jgl4hF3/DMWr7R8TMwWNssEncGaSYFIEc1aCsur7xRoEKwaIugEzOa6RD9JLWLi+Ks0z3cQcaSA
	xOIFhlyK0bPB3rBpMVyrD2ygsJXjSgyQ5UKzO3eQdZEZlFVam/tlb9VpiCkpCbqI07WxnJHkNgm
	MSCXo6BqNDkz95sqhuhnoAsGv+3OMG+80jeOh3eCMjpfSVxFolGf5jGuaCD0vTu1MwNy7T8g3be
	woHZrRkV/5mPyQs27Pli57OQQ2RJ+Vtf7Jhyi5b7keFUATumEbMShut8yyun0ehH5yN70hkGHzv
	6hYGjoSNTw9yZsupGsDgDCsonIl1sh2wvH+sfJJVBMn4cXMlXQoo0LBJ21vwP5jFydTJnvwrUB5
	wP2bK1M0G4SM2y1r4heL3LLW1drPonDrg=
X-Received: by 2002:a17:903:19ec:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2ed8378c6cfmr48200755ad.42.1794236427764;
        Mon, 09 Nov 2026 07:00:27 -0800 (PST)
X-Received: by 2002:a17:903:19ec:b0:2ed:3f47:9691 with SMTP id d9443c01a7336-2ed8378c6cfmr48197085ad.42.1794236424114;
        Mon, 09 Nov 2026 07:00:24 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed8173a8b2sm12837335ad.67.2026.11.09.07.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:00:23 -0800 (PST)
Message-ID: <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 07:00:21 -0800
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on
 teardown
To: Wentao Liang <vulab@iscas.ac.cn>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        workflows@vger.kernel.org
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261103102915.1341148-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hvIkl6XwViU-Qvxdi5p5UyY9nxSpmh2-
X-Proofpoint-ORIG-GUID: hvIkl6XwViU-Qvxdi5p5UyY9nxSpmh2-
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1e010 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=mvyCH3EIRwqJGMeifaAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfXwyYKBvzK3tt8
 hl8KKsmYj08nnsr+nLcArAQd3A/VjxXgA9veuDHpyOvZYOoQMYqZZBhEkdARa5vvyDoCrZ3q+xb
 U6UWg3xVde6HwdaVnfAeiiwPS2fWtEA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfXyZYA+WGTA67K
 AQA/UArC7cvDzJAhQtYbleFjO5K5fHh9ySSCJw6FuCj8zhK+I8pR3Swxy28V09kF6HLdXZv2eXM
 6XymZuUD2KpsKyKKtmY4h+eJMyzyvDieuLqwbKymg906UsX0m2VMOB5XfShMoAJ1anRVd1XhnSw
 h417omYVp4ECx4SI8o2Nztpg443CwKWjLX0nYwIfzb2c+EZErxkiz5FhwMK1PJnywKQreCZk004
 TxOIY6YBU4VcWmPv+9arcNYY83UEVQLs543lnDXDfETDGixZS+JJ49Vzgg01j0sTkHYswtETxOv
 mMl/Gms58TvVBjDd7WEu7wu2Tnfpoh9gudi2WZpRRaxKOfhDbUEgUIuJ8tDTvlAmEBn/QkFG5gH
 jOZHREZT+RITHYYB/42m46Mfa9R5lTemPapBHizoWyLAnsDEvAtlJnvP4XLaC7sVhyekGzmMxWq
 YtE9r48vs4eVDQsSacQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090059

On 11/3/2026 2:29 AM, Wentao Liang wrote:
> ath11k_core_get_rproc() looks up the target remoteproc with
> rproc_get_by_phandle(), which takes a device reference and a reference on
> the remoteproc driver's module.  The resulting pointer is stored in
> ab_ahb->tgt_rproc and never released: ath11k_ahb_free_resources() only
> tears down the firmware resources, and the probe error paths after the
> lookup jump to err_core_free without dropping the reference either.
> rproc_shutdown() does not release it, it only drops the power reference.
> 
> Release the reference when the AHB resources are freed and on the probe
> error path, so that repeated bind/unbind cycles no longer accumulate
> remoteproc references and the remoteproc module can be unloaded again.
> 
> Fixes: ba929d6fe31a ("ath11k: Remove rproc references from common core layer")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

+workflows

I am no longer accepting patches from this e-mail address.

Go away or use a separate e-mail address per person working on this project,
with that person actually responding to review feedback and adhering to the
Linux kernel etiquette.

/jeff


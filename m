Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA263B1ED1
	for <workflows@vger.kernel.org>; Fri, 31 Jul 2026 17:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519408; cv=none; b=Xj19KNrtLIbjhE5W4Pg2Cu3+NL0v6LSEvJvD2Ydg+lqHOERiEC+Vb/cPfwEj6oi6/oU7kbUbs9VABihMz0bgKaXm2OYFmr3BpzWd9dW+zFZzYQTSomOOl70kMUka8auy71R/nx7/OmA7+W0j6dLxoP+FhWkm0GKyIPH3Ea0/6rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519408; c=relaxed/simple;
	bh=5rMAalagN56/weROSlL6wJbFGqOBGeThRNRcu4xHlZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMDigwkFoJOOkYpzQLHITyFhMJFX2Za1wV8U70/Db4k2HCCGtlJgL29tR0LSs2kC2XbRYYIiF16keNWt1kyrgZmJziRU5QtZYCyMvETcaiILtuegsiz8IIWENQ3BMAyOX+gAaFSPA2tF9MMB/kmLjrVLxxOJ82ZCos6SJCpiaMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+YaYwMt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1ncW/s4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+YaYwMt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1ncW/s4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFONg5489212
	for <workflows@vger.kernel.org>; Fri, 31 Jul 2026 17:36:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0gEn7xw74OTgVFYsNjZCPpjdx5PO6g9E5jzZSDfnuIg=; b=e+YaYwMtjJZQJ1rn
	5tP7le+ir/4lsZo2BN2rMfNaQGS1YLtY7VhVM2bOmKR8ci2W3EAh3YLI0BtZGVRJ
	1sXLGkWMWP3vXsw75BlddZ8RFxOgUAEdy83K/I6jjlibYSSMDMAZ2mJSesDCYOjN
	bXTjZxBe0tJ15y5a8zkPQvTD9VJngy/NOa/x1zNVC4sNCmOK1X+tLkd7SBybT27B
	mhlrfh6Qgca3aOB51/87X1pjcRvZDqs6Xvwq1OjiLr+3cjyn6k2z4etuU8Odu4vK
	gyAUyYZ0ncb0KHyogjQrm5Inszia+Qf2xwPft4xiAo8xFISo6LE/AfCscW6HW/Bk
	6jjhwA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fruk8sj6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Fri, 31 Jul 2026 17:36:45 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso1676323a12.0
        for <workflows@vger.kernel.org>; Fri, 31 Jul 2026 10:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785519405; x=1786124205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gEn7xw74OTgVFYsNjZCPpjdx5PO6g9E5jzZSDfnuIg=;
        b=B1ncW/s4EpKLA0vDn+8ZmolzHwvKBOOHw8DcLelDiwDBdYjLsyQHn71nhVd3mopX+r
         +ofhETzTKWmrtQglFuH42LklCCXb14XyeqPV1F2lGsHPBn0aAhMMFbJ5a5taZju77y+Q
         6dF0o3oXHAM9tI2mferKVu1iu5pfRcl47l5o5Uv9lQEYRXF2WcIrxEUT6sTWZvmgmk83
         NV1/t0Fm51IDbLfgbNfeHc5sbq2i1Dz820hMz9+4hJYp+txvYnQpstq/p9piGeaqLhNz
         mXZPXVG5xU0rDyvDjjmvgpeVQBHUcu5QXKIGjPggcl/cbf2CQaLy6VtfLBIIeCi0DtZ1
         9yYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785519405; x=1786124205;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gEn7xw74OTgVFYsNjZCPpjdx5PO6g9E5jzZSDfnuIg=;
        b=lzLsul93xeSppSgm7ZnXs2qyy9616NoLLjeoxr0dhNuWdpUCRDwKQFRy96ZuCCi48G
         VtEMpayhZEedb9SkuaP/pfYLe9kxDiyTFTdLeutADdfN9K8IMaTDa1iDIiK3KWwrCNkn
         qpfyCyDjyyKR/sevavAHmi+BAHWy9/5c/JzKvvf/SATgihf0x5vKI4cpVIzIGGmN9Gjx
         2BE9N1dlQXYwATAQAwoGHjGvXDO67UW/EH7+5EgmasXj6ev0Aw+zaTDpLPfo/jzn02So
         scj9QxD5ujzUYxW6RgfW8br7Xo/U1t3doEa/XVe0DXEN40d/zu4HFZy/lidqUd4Vc6Us
         Xv9A==
X-Forwarded-Encrypted: i=1; AHgh+RpEtDYUi7Y5yfkOAC9cTZ9FcprV8H7Llf9s7u3qkIiTyoggP7T+mzS59AiaodR+dXxe84YQrDiS7lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLMUSkJH3c8EsmjU0DYqAn27KnTdCAQHx3TqUS4s8htmV4OL85
	sqEbEEO/0iPt2eWWJvArlTG0PJRibfD1F5Gl1C12mTuzIKSAfiEnTpTDG+MYbdapkpq4etTxdML
	UQVK0KEytkKPpe7ZgWOHNMDlnqhFQa3YnC5sq6cXQgFf0LGx6O2KcySgVxQKN1aY=
X-Gm-Gg: AR+sD10Z16FGQFaYYKQbfpR+bFpv2SMfiM+zUEcmffD1xyAqJExPEj70GPCGIr0cWxn
	WNzsWEZ5G3v2ea7Gqt4zqGcOIXgZsDSvvaTM6bvPR0np57SLA2rqdMHzXBbwWOUwuHDjz141fli
	Lmw7/8NFHYXqPMbnkkcKp8frhCHus1ic5k9XfcYDRCobo5dv6IZicdc9g8MKeDXqr3je23WLt60
	Lq78zW19sVRdsHSSr9kGH4vM23VmCG9QNqYytpaeqTQ/iErSWCRXLT05NV8ofJgNZgHAq3cD9/E
	Igrtby8ro4Jlt+lw0E14Tt5UlS/nLWP9UzydAfXR0IrRgFvP+lmMdHV7KMGEv6iu79pVlwUI/4s
	GYgvz502lMlp39b//KkI4rlak+4ZQc4uex4rtwyVb+ie3PpuNgtQvJveL2O2L
X-Received: by 2002:a05:6a20:4387:b0:3ba:e5e2:73bf with SMTP id adf61e73a8af0-3c92a8139b0mr653027637.43.1785519404694;
        Fri, 31 Jul 2026 10:36:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:4387:b0:3ba:e5e2:73bf with SMTP id adf61e73a8af0-3c92a8139b0mr652994637.43.1785519404267;
        Fri, 31 Jul 2026 10:36:44 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f8dbsm8202554eec.22.2026.07.31.10.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 10:36:43 -0700 (PDT)
Message-ID: <dbe5b96e-c95c-474e-aca0-8227fee4682a@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:36:42 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: zd1211rw: reject secondary interfaces to prevent
 conflicts
To: syzbot <syzbot@kernel.org>, syzkaller-bugs@googlegroups.com,
        Slawomir Stepien <sst@poczta.fm>, linux-wireless@vger.kernel.org,
        Daniel Drake <dsd@gentoo.org>
Cc: johannes.berg@intel.com, kees@kernel.org, linux-kernel@vger.kernel.org,
        nihaal@cse.iitm.ac.in, syzbot@lists.linux.dev,
        workflows@vger.kernel.org
References: <0720e3ad-d98e-47d7-89af-4d22416b0fbc@mail.kernel.org>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <0720e3ad-d98e-47d7-89af-4d22416b0fbc@mail.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W8sIkxWk c=1 sm=1 tr=0 ts=6a6cdd2d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=edf1wS77AAAA:8 a=VwQbUJbxAAAA:8 a=hSkVLCK3AAAA:8 a=I3P1pAe5SESMdPKYoDcA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=DcSpbTIhAlouE1Uv7lRv:22
 a=cQPPKAXgyycSBL8etih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEzNSBTYWx0ZWRfX08TtR6gvQcu7
 bcbXlz3mtHeUsc5I7rWMRmapjYfMf2B+6QisQ2r5UdmvJzzdcY4118GFB2ViQISic6GHYWwyS+m
 +Yvv/JryzNQcJLvyJCrG4j4xHhpdlzY=
X-Proofpoint-ORIG-GUID: pZMECNYtNXStcZvc3Wfzf4zGDNAMc-C5
X-Proofpoint-GUID: pZMECNYtNXStcZvc3Wfzf4zGDNAMc-C5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEzNSBTYWx0ZWRfX6buQQZMjKULw
 zBq3qsWsbFPNp47HI2/SoIOV0YWRAvC47ixRJlFrJC+6Q/orUHzk6vZsOYc/CK43TGdN+Huwwtn
 Hl7yp4A5Aw6szV5JbMosoNCvu3HjvGdZuDvcl4XzQ+tI7nRQEXH898R/O69EVDDvHnycDM/g6KJ
 Oz9Gi333UW6x2j1rmtuq2M0bOeKvmfeTBPd1wy+9X7F0elO+pj9k+9W7FNoVJ2wqB6IvxXUXiIS
 EOvxNVO/zniNgf75jcRTh2nwmyV9DbUVZFSTM8EZcAkZgMjBw7j8Yg+w9piwvJkZqGPG/YlZU+4
 WfrNdl2B5x9kOqNRKHWzr8n/hXQ8/S9Tw36xgI2KRgqhrhdY6qmiDvOCN/KCBqiMtJgzbTtgjcM
 ZqUc2+LhbgtaYZseDPeVdKM+7jEVgvXq5yvnzIDJ35o/ZeCtR1RjZQHaDr9YEviZ6FLxmIfec7c
 cKgB1NEB29xkSlI+YxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310135

On 7/29/2026 1:04 AM, syzbot wrote:
> From: Slawomir Stepien <sst@poczta.fm>
> 
> The zd1211rw driver is designed for single-function Wi-Fi dongles and
> hardcodes its USB endpoints. When a malformed USB device exposes multiple
> interfaces that match the driver's device ID, the driver blindly binds to
> all of them.
> 
> During probe(), the driver calls usb_reset_device(), which iterates over
> all interfaces and invokes the pre_reset() callback for each bound
> interface. Since multiple interfaces are bound to zd1211rw, pre_reset() is
> called sequentially for each instance, acquiring their respective
> &mac->chip.mutex. Because all instances initialize their mutexes with the
> same lock class, lockdep detects a task acquiring a lock of the same class
> it already holds and flags it as a possible recursive deadlock:
> 
> WARNING: possible recursive locking detected
> kworker/0:1/11 is trying to acquire lock:
> ffff88810371dde0 (&chip->mutex){+.+.}-{4:4}, at:
> zd_chip_disable_rxtx+0x20/0x50
> drivers/net/wireless/zydas/zd1211rw/zd_chip.c:1465
> 
> but task is already holding lock:
> ffff8881138ddde0 (&chip->mutex){+.+.}-{4:4}, at: pre_reset+0x28c/0x380
> drivers/net/wireless/zydas/zd1211rw/zd_usb.c:1505
> 
> Fix this by explicitly rejecting secondary interfaces (bInterfaceNumber !=
> 0) during probe(). This ensures that only a single instance of the driver
> binds to the device, eliminating the recursive locking scenario.
> 
> Fixes: e85d0918b54f ("[PATCH] ZyDAS ZD1211 USB-WLAN driver")
> Assisted-by: Gemini:gemini-3.5-flash Gemini:gemini-3.1-pro-preview syzbot
> Reported-by: syzbot+0ec3d1a6cf1fbe79c153@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=0ec3d1a6cf1fbe79c153
> Link: https://syzkaller.appspot.com/ai_job?id=00724ef7-fd77-4cde-9779-895b8f63c2f6
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>

E-mail from syzbot but SOB from a human?

I read the trailer, but this seems to violate:
https://docs.kernel.org/process/coding-assistants.html

Namely:
AI agents MUST NOT add Signed-off-by tags. Only humans can legally certify the
Developer Certificate of Origin (DCO).

+workflows list

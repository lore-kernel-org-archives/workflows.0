Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F068F2DC77F
	for <workflows@vger.kernel.org>; Thu, 11 Sep 2025 23:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757634883; cv=none; b=H4k9vZfos4xOq3qsJ8crHO4VbKphZX0AdIRpKTmfw+1C5LQ6htWdsJvQ1tlMxJKFKggP1vqq7YMDkmL+BfiuiQrR4N534Z7JTCOXMy2EGav26yaLHjWiP8GL8vQgIql4T19NHLrQxCI3RNhbfyOLyL7Cv1T2IZr4oYcaHPdCr3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757634883; c=relaxed/simple;
	bh=yfu9AjyF3kpMZ3VESiY7Rp64uYWSkQ/eU2r9UTeqg2A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LQOTcXMnBz6z+z9mIBx+Zeuz3ECMyYexmAxiDFRN1FA1g4QfE8WhqWol4A26DlnKLVjkatApogx/agrdHV98qmWHcnAYqed1xzAL4TKuVHqD8qYVHZuGv8coXXx/EmaHtKDEtBsSbG5YIvSShN27T+ouIjuSSkaeLz7kVUxnibw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LodQozj1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LodQozj1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BJuS0Q008175
	for <workflows@vger.kernel.org>; Thu, 11 Sep 2025 23:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yfu9AjyF3kpMZ3VESiY7Rp64uYWSkQ/eU2r9UTeqg2A=; b=LodQozj19I3+8sZy
	T42X38DSMEQPGF4iOOnv2PQ8TOwgSOiLXQXM89DPKasAK3YPFjFezBa9CPqM3Wds
	Y1DSleb+kmwAFNBDK9t9XXqQptuRCc568W/l/d5Fb0ImXREYjCRTOyqCEmFQztD0
	jkwcuGWZXWUzeJvj+B7dOjL2fGgqJOL5J7Kd4ZSqBtBhWVJaqPd4Z/A0xaRA9Lu5
	favh97y2ln7Sh0/9gX3CHokCiYxvRiWUUsA/8Gm8awqIzBco0bQxbdUo/vHi4Mgc
	FFYOXwkOmrholWxiBG+uEG4WCH2twlmPzS1oDpdv0tlwiZXTbf93Z+Kfuf6UX1tN
	VFAp/Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapsw6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 11 Sep 2025 23:54:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24c9304b7bcso14056305ad.3
        for <workflows@vger.kernel.org>; Thu, 11 Sep 2025 16:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757634874; x=1758239674;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yfu9AjyF3kpMZ3VESiY7Rp64uYWSkQ/eU2r9UTeqg2A=;
        b=q0+iegB3XpgPsxUiaxinyls3ulAHDN8RZfHK8hrnomVDwpA2W9fiGWxwA6mmh99yaY
         7fj5P6RVtyIVE3zlTAIO6pslqtCaAkokt8un6lWXzO7Et4+Y9Da49M/vKo9ZTp2Z1uqm
         sVt/4QG/lW+8mEMPvXbhodrN999W5VYiE2BNghY5vkRTLx7EmFtycjOzOHrAiS2creFo
         Ah+KbWPrPz/tdE9FE3ppFjp+8CsY2g7CHgJMw+iGz/nxfGIlxGzkGH6UKw7nBl9LRjzR
         JP/VZdze7zQkGEraTNgcrvRQA6Kxk5v8D6VXvvuMpEp6uH5mKoKTDyp0pGfOCVZm/lp0
         k81w==
X-Gm-Message-State: AOJu0YzLMjhPURAwBd3H1nOFof2jCVk7jhoEtYODen+3/ixYGx6Gjasx
	4rD1WSsPTtRsKiBzuaio9rQzTHqwLQXKvVsi+BBhnECNRlIQlhyW71jIKf/Npn5OVJrpE0mPvdu
	IDTKKPUlhvs3wlEYk3yQ497BJef1KVwRX3/4Xm0eOsGA0GacuNGLl4nLttOfeZ02AW+YIsjI=
X-Gm-Gg: ASbGncsZTmXLkj0msJMHyLNbZA/LTmfrFNXvdgcawKpxG3jMwkPVUtKnV8A/SKfShpQ
	ypNmZZuelnKAWXQa5EON8Emh6bv02Dq0OnhRem6WyPkY1l8edI3HgRUoSG6Pw3Zet92eiK0DjeQ
	cS4isnPMZ+Od3JZAiu0BdDlRgAW6Ok5ZfHoOhI37fbdoPjGhjoWxrgI5ooaHLIQ4z5W8zpC+pf8
	rl1QAJHcr0DLxk/eo0Qw/45k+pvYPqVEWSwrg+W7RG38vJ9HS1Du2VZOIIKEUJw4iHncIWCGsDI
	YaSdfwykSlvr5dJ8SuDislSYL5c0Ji1yPY2VMK5eFMJTnptDknSYKgcPBE7rSORZZv4bK+qL8nd
	JEU0RB44sk/qivvnQdDgF2AXfwjYRQ1+QmDKi
X-Received: by 2002:a17:903:4b0c:b0:24c:965a:f97e with SMTP id d9443c01a7336-25d23e10c8dmr13568365ad.2.1757634873898;
        Thu, 11 Sep 2025 16:54:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtHN413CdCaCV5YVswGGLnN2TZdSU2uYdPde4XyahcKs7ZViiqksZHWuZ9Moo1Jnjchyn+wA==
X-Received: by 2002:a17:903:4b0c:b0:24c:965a:f97e with SMTP id d9443c01a7336-25d23e10c8dmr13568105ad.2.1757634873447;
        Thu, 11 Sep 2025 16:54:33 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37866d35sm30670815ad.64.2025.09.11.16.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 16:54:33 -0700 (PDT)
Message-ID: <972dd368-282a-4255-9b88-6324c1924512@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 16:54:32 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Is there an integrated b4 + patchwork guide for maintainers?
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: workflows@vger.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <1bcfbc51-18bb-4a5c-8a1e-a2de794ff00f@quicinc.com>
Content-Language: en-US
In-Reply-To: <1bcfbc51-18bb-4a5c-8a1e-a2de794ff00f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c3613b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=iTTFQhbCPPGBbdo2:21 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=TTKAEUA3lk1aMVfFPN4A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: c1_PQ07-nggACNCnCDUE0FuwFMsLa8pe
X-Proofpoint-ORIG-GUID: c1_PQ07-nggACNCnCDUE0FuwFMsLa8pe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXzhwr/R6d5S4z
 m24PnHDkRxSGW0pOllJ71uwk4yuhV3fy2ogXTS19eEijFxfmn1lLJYD5VAwwT9vYAO20I2LyNYe
 bscFYn71CuvpHq4au0r39zhafSR5Nz1S/n8MihNoZWHZ6/mUB+leu5zAVDlgGyGdV1VNiiZiZIE
 9dCciSlBMf8KrTIdiDRJAUd7oXcqhA/s9oIffAXwjmoNknT6LRohAED9ArVdF5/Kecusawh5fel
 9x+ZM66uYwk2mNFVlLBsKrf+KO4c0Ev6HdBszx+2NmFRIbYh1vqa8aRJiBkZusqwzTJhJyghjEQ
 FnmJnjfk6f7tWtY5vcsFS04jFWdrs/LB7a+EB2w+2XoTZzKjdnBaVVKSxZCnVadn94Ym8jhysZ3
 6KrxEI+O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

On 7/17/2024 12:30 PM, Jeff Johnson wrote:
> I'm in the process of taking over ath.git maintainer activities from Kalle. He
> has shared his workflow, but much of it is based upon using Stacked Git (STG)
> and a patchwork script he authored. I seems like many (most?) maintainers are
> now using b4, and Kalle fully supports me using it, so I just want to see if
> there is a guide or sample workflow for using b4 along with patchwork. I'd
> like to adopt a proven workflow rather than stumbling around on my own.

I sent this over a year ago (using my former credentials). I did not receive
any responses at that time, so I just cobbled things together.

In light of current discussion about using Link: tags, and related discussion
about how multi-commit series should be treated (applied linearly or merged
from a dev branch), it seems timely to re-ask the question. Is there a guide
or recommended sample workflow for using b4 along with patchwork?

/jeff

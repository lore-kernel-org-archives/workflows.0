Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3E8253352
	for <workflows@vger.kernel.org>; Mon, 12 May 2025 16:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068196; cv=none; b=hFnv868GFDqoTAoDME1JI+mqdVPeOUzzfsMjCX5F57jcPFMv50TnV0Z8m3u5iz+Nr7kntAbxa7xw5bDTzF7kKV7fX8dpArxXvv2mcQj/PdNLV0TQdTS7kArOr4mGqKkkNXyHphrA5WLmEVKTl6pO9dB9lsF1pbVYh3FIvrFySEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068196; c=relaxed/simple;
	bh=UHmcMn2rDutZ9zovLB7kDC/1L+cADKDjKAVwTLzKdGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xv6STYyzPwVXjD58f8vlD6KDSoR2gymkTG+ctQPq2etBVrTxoNvm2/JT4h0mzm/65lXjN9NkmE8+QRaakiHb1BWBy80MX2mUnwhcJqOLygLzrB7lHxczEGs+frgRxvPhi3qVZicIp27ie6SprR5RkGCWpHefuWMS7qDUZWYRLTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkyTVIL2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkyTVIL2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C8lrcH022676
	for <workflows@vger.kernel.org>; Mon, 12 May 2025 16:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nxel/jbRossn9GkISDGNrXtVJDHleFN7s/7NAEibyfc=; b=GkyTVIL2HViKvdBh
	Xd7AgtsdxoUuQVJXfuRqdzZX1/MaWsFXeYE7UdLdqAaV8Hdyo7Phqi7G55o+5DHs
	QiIXfC/b7f8JRECoFnJ0Ol4qQN/pM9Z86211B1BycyjfT7UWG5ApygLtnXoI+H/B
	DnJEF5QKXqha/qYepPZX207TdZpSUB407PvDvRVlt0Dl0emTeBjH+NzxGJcZ69mN
	Q4ESC3GWtcJA1/1Ls5gUzBSQLPyfEsnStq9B9EfttRKxRrAX2Ji+bobwse+0iQdb
	hXTh28OULF71Pt4eWQ7dsZLqo5G6s4qjbOhS/pj8D7dln1AoRM3YJmc5dnJx6Ymo
	5N7oNA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kdsp18rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Mon, 12 May 2025 16:43:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30c1c4a8274so4473345a91.2
        for <workflows@vger.kernel.org>; Mon, 12 May 2025 09:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068192; x=1747672992;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxel/jbRossn9GkISDGNrXtVJDHleFN7s/7NAEibyfc=;
        b=u1RzaIYlMN1QtSFeCUa4NhPbBj0kYa3cOTOoKKZvIxnV34gAfMgiHV12FBt62ba9HP
         mw/wYPiv9BEKkmypbV62Pcx8UTDw0HKQrwSf6Twq+2M55iH+P6Pr1rx3f7Rj95VSXg1a
         5pRwvRp3h7SU2sV04xYkTxH6GoyEVQouFTcW/OxXxVG5YxebIUAjzmJqQRCDtJLEE720
         jAAYrwljf1CZNqd3o1zYAHTOIBYHzc1Wtu4zo9fG1GHKidKWybKq+2ZBlPFULy3eDAf4
         kiXNrUyqB6ItzXN3d0ChN9ss2q4t+A3GRqNfq7B5xvBxLbl3v9PDt7iJN9gTTWE9or9I
         BsjA==
X-Forwarded-Encrypted: i=1; AJvYcCUiG7Xgan//PTTiCjOJrhOSAAfhG+JLlrMl7w04x810PAZ+nVBAOsvrlanMPDSDFKSUd7uohY+mSRM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4aIRavyScBdeZiPSQ+Fb2DbkrApjUTPqiV3ODQlNGicVmol5a
	Ali/ypSl6E7sLr+2qBctS2yM2VOSbcKjZHijsK6prS8UAbaZJ2jGkStdpoOnOnZfXRWRnlAJZot
	mUx7jbaQg8SE5gRdoJqNgwSP1Zh+BPMF02aZInS93ALFyvpwRxJKHBDNzHq+9maIX2Zk=
X-Gm-Gg: ASbGncsWF9xRBpxmpbDlf1q+3IowmcYyn/P3mh8WYy9OVCbloAj2ueIQlgvCAo1L5Qu
	FaQK5lgtt+B7nzKZ4XoPTG5zx0ec5ZHV2/YudRJOv8VSpt1LS8+RbeEMfsT5+fn9vIQ8VwxZgbd
	R+0jx0yDyiiZDv/kl5IbcmOAtYILkkDK1ghgrGawXNQd1wBgLMn8taVgL1/5/wOuaoUURuD8kd4
	+eUV06Z7a6SUDLVGGe1Jg48hdIbI1i6GEMfg9MQB7MFAue/bew3N8fSv7WpweyQYnqNMRZRENeo
	ezjhTJ+Ti05lE/MGdl7IUeZdiOwh3eW24SGOpjoZWhFwxk2X1HENuLyUxUS75w+z36GqDhrbqCv
	qDKye
X-Received: by 2002:a17:90b:278d:b0:2fe:afa7:eaf8 with SMTP id 98e67ed59e1d1-30c3cff3e4bmr23529278a91.13.1747068192613;
        Mon, 12 May 2025 09:43:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgbdweM2CF6nIrd3b1pn2d7bVcz7M9vjQtIJLX1bht9VCuwBchC75KEpw5DHvZpY2APUtCzQ==
X-Received: by 2002:a17:90b:278d:b0:2fe:afa7:eaf8 with SMTP id 98e67ed59e1d1-30c3cff3e4bmr23529248a91.13.1747068192210;
        Mon, 12 May 2025 09:43:12 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e757d2sm6927597a91.40.2025.05.12.09.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 09:43:11 -0700 (PDT)
Message-ID: <433d5f82-3ca9-40b8-82e8-acd647f55d67@oss.qualcomm.com>
Date: Mon, 12 May 2025 09:43:10 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] CodingStyle: flip the rule about curlies
To: Greg KH <gregkh@linuxfoundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-9-adobriyan@gmail.com>
 <2025051001-undertow-unsolved-3aee@gregkh>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2025051001-undertow-unsolved-3aee@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Fbp4Ry8xHFUINy0RctJzE2YpigPYobQj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE3MiBTYWx0ZWRfX9bB5JaEOhmtT
 GLn4n6KuWrKpr4HOn+e1MsVBNwf/pzZSazxSfv5sXdWJvJpgPDj2brJl4e6sjn23khnuHYKDOeO
 Lcw5q8tjpWL6Zl7yRRwV16AdVM54xbXf3lw8+kV3VhV3CstIeszyYTBx5C0V42IGrWVnzMybVul
 b/rqwu/qTBUNRL5DZrI9+CocyRVFQHjNzr9okYgAOmVWqVbWX9LIcaoteCGaR7zUb0kOvPjsRRS
 C+YyU97+Ns1RFUFZZWCHE0gcaf/go55Rfc2RgoONc7EIsUOtfWguZDZO8sI1lWDLR7i51v+7nop
 4ATuzGSUsyMHsf2R21N9krzpNo5xxniBhLaxln8XwnfgWZ7vU1cXypWj9oTJU74tpKHPIjiB0iv
 aU0RtXqX6+DZo9ePyUlW9Q4tsGvcyAN18rplE/jxxT0+aoPpNeP78OdUKqpK123d95mUfobl
X-Authority-Analysis: v=2.4 cv=TrfmhCXh c=1 sm=1 tr=0 ts=68222522 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=wyiu5mwFrgxmc5q3E3sA:9
 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Fbp4Ry8xHFUINy0RctJzE2YpigPYobQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_05,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 spamscore=0 malwarescore=0 mlxlogscore=768
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120172

On 5/9/2025 11:18 PM, Greg KH wrote:
> On Fri, May 09, 2025 at 11:34:30PM +0300, Alexey Dobriyan wrote:
>> Require set of curlies {} in all if/else branches and all loops
>> not matter how simple.
> 
> Sorry, but no, we are not going to change this long-term coding style
> rule for no real reason at this point in time.

Is the infamous Apple SSL bug (CVE-2014-1266) a good reason?

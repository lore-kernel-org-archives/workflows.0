Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869926;
	b=ARncaTKFGrWz2nrML+/vLioeot3rCD8KtGR0ld00qp4Ci7tlmWGG3FoLV14M9tIfq9g4
	 LX8Au2Cq6zEbDoKVhXWTIQaQdbpvRq8DQwNvFZt7fvpoKSnq3lGd4NPn0vn4R5Vgsy9T5
	 2n3O7rxtaw8N6NP2gS34cUK2OAQ1yyZdmz1xOLX2ppUClf9AGlbleIqY+6vUb010GniUY
	 GCvASD6VqP1kJcAnfuqDiocg7Qtd9v1aMnBpkxFufZNsX19/bRkORyMj09BaAO9RtbNFt
	 kgzmFLpUEGR1L4KRtr55LtLi+y5+HSHhhVsFhuknQ0osxWlwtXvuqKMNyd7un4YZL6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7F1vEtwRqRlzZY1ScHWyVwWITpsdI7I1gLtxsYOhBsE=;
	b=kNX6/BSkUfxBkP6fcjVBrdCpkeATarvxEGMVAcQeLE5c4/+eSw3GaTqHyB8NWL+Oj74N
	 ZBEfF69bRgQuguMf0fcwFR+APxYPxd813xWpIUIG9oRQ/y6tTuSIsrVpyX5ttN4DBRPuK
	 yf/xmn0y6//Tnih5YqXe86XgDVrJBUYBGCmjSefcZ+F+LV+m+HDh+WM5U8tkTP2FKoFzu
	 kPkHjTcYuIdQu9P05ZHlQr21UgbG5Sc9RN40pXMfMic0kZKPHCtM5SlD58LFKmvjcY6Qz
	 uNi78VuW3Uk8gJcTh/SqscCZYoy0+kOdkmDL6nMUXTSowlEpkhhocay9WbvL++60Fdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fIx4+4IT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKIRSO33;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C85606A330
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 09:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C85606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fIx4+4IT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HKIRSO33
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UYbb3624811
	for <workflows@vger.kernel.org>; Thu, 5 Nov 2026 09:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7F1vEtwRqRlzZY1ScHWyVwWITpsdI7I1gLtxsYOhBsE=; b=fIx4+4IT8vfCVOMS
	wFTAUxAFjntUZ4EDlNDMSJshBqljGvDk3Vykz10S0+BVAQ5BGSMkfGn4w18ThBTg
	rgf1RcNRTdwEAltLPGrE9N9Fspi0VOK7kwldm/Yrj73vzC02JqLHKEMlv0APM2Ew
	Rpq1uOmzssUc51/n4qJCQaB0PLYjRzrInzalDWMkmpUHkWTKJXgAXHfTBP+0g8Qv
	E0TvXYUSBtqTYvqeSCFa0Y8gjJnbSBmcgsp9cdklTFT6c2GWLbcMm5U+Ze5j+MOZ
	oMimtsYGO4czlaOjf38FyrFFtU3F34F24G2jRw4TV8FTIqFbGLio5X2+3I3c6KEK
	6JPzGA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br46gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 09:12:04 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9905fc56b60so391618241.1
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 01:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869923; x=1794474723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7F1vEtwRqRlzZY1ScHWyVwWITpsdI7I1gLtxsYOhBsE=;
        b=HKIRSO334idm03DlMkgz+K/rlJDZePElkq+FsBQLYlR/uS0omyX7ESW/+vHLbX8kod
         whwX9yHbRL60cW+nLGxoqRLQpSvgggheE9Rhh/HyX6rA/zjm3/UXjgcDvqehn/2Qr7DO
         9ujGbi8Pur+qP1Suvemkf7BbwmLyEB5YSs7OokixzmDPb+a6/u3Dg7QCp4uLcVJu0P8T
         +qXhdUdGZEZGuL3neADxiqMcxMjXh/iMo/l/Vu2P+6sHDLIMlyGjz3TooNxJ3a97dNqd
         rrUVdz6rK7yX7peblnhjY98OUtUH90V1S5xm+cjndUcd8x8yZFGtfocdDyYylTTVdNp6
         X+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869923; x=1794474723;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7F1vEtwRqRlzZY1ScHWyVwWITpsdI7I1gLtxsYOhBsE=;
        b=Wy2oGQePCOsydZRpBGutCrb68rPMUahMMQaFXEgaaixgt36ZHhuGqePi5CRPQkoz2+
         8hSSA71hmRwqrPI6vyxDeOnicokObGeyulecOP1XkUZrf/RWE5L3UsG0OMhdTGeGtzfP
         yaoxMhpQaE4AISnLRGz7jMYJHwQTeGmNE66guvZ7cBYET/P6g0Sl3+AkrjsHE6N/uL0h
         B1L9u1+gypxPSA19YoUlH6ACr5eoj7+k3L9BPZthzR4XcAtrSUHy7nz/b5p0AINHTTgc
         vdJzkPye0DCbC+pwR7USfCPkOVaXXsSeSOHUi/ndIe5y+xfWZN4lhn1qO/gsx09tfgM/
         vYoA==
X-Forwarded-Encrypted: i=1; AKwUvBxxSACkDlLSDGEr1tgX8QO1Txr3KWgBU0cpz9slXKoMCjreVDo00a7P+4GMJ8ql2H0jMLGxS5o4esc=@vger.kernel.org
X-Gm-Message-State: APuU4Z946cIPU8TXhpXnjgMTZHDyxiLUkJJvY2TlNFDOYhS8gWZMZOk6
	gG/xs2Fmxc1eMKBwjMzTucn61b8ZHxKM5LWwhM5IKZTMcGWIkc08HNfOX01V2mMUKV311kNED9Z
	h4RWnSqIhT3vf6bFnDKgj5jogZjunUcRliJnaETGgg5cGzSGrEHz7Y0GbCYen3eA=
X-Gm-Gg: AYBFou35bzMgiMynPSUu6+A264g4/+9E9yQwh4t5p+9KV+XcxujDXCs9H4BQJwI8P97
	zoby1M3TRa4saxZ3LQFm78GlhqYJdsDvrFuC0kD6jSna/PEtfIIHIh9rsJC3QMvvHwTE/yg651D
	7f1WWDjjEMFpbW+kqy7UIXwP7yx0QNYRsQlg7Cs+fiFb1KdRddosZLY7wKzW+XeT10gu3Q21iEx
	8q0k9lVOeNIx+CtrT+WnBrH+oyvGVq30ag//03W1xDUV/C0P816pbWWyEbpsJTW/gVLiDDZwt9x
	ERIJZRLNGrR29h3tAD0aQ6F1CfAHHs4ynuEOyddOnJuS+j3SH3f0Jx7SLmG3SrCYXgq7mkmLLsK
	kYRfmmoC/+UgSTp2FE3GqysrG5A04DM5+W8+eDm+71wngmfZrhRtkT85c2Oxif3jVVnj031+w4Q
	==
X-Received: by 2002:a05:6102:2c81:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d286744eddmr1262928137.3.1793869923414;
        Thu, 05 Nov 2026 01:12:03 -0800 (PST)
X-Received: by 2002:a05:6102:2c81:b0:7b9:5abb:eb17 with SMTP id ada2fe7eead31-7d286744eddmr1262909137.3.1793869922991;
        Thu, 05 Nov 2026 01:12:02 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm8705164f8f.21.2026.11.05.01.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:12:02 -0800 (PST)
Message-ID: <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 10:12:00 +0100
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
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxHASG78dTviSz8@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX7bTRwnbDXFG6
 N/CGQq7apQqBdhX+IZl+ibukIjjwNaeR+X3vorftzoQHt6Pz59O3n6qk9MWcO8vGI8LX8vD6crY
 Z9LpjAUT0ohFYxzH5J2NE//CBYlyKuiy+HmPMFjsoC+NIOFvT/+bTGf5gY2d2TrwW9QwDVmxgRN
 n+0XQ1mwKLKFKh3koxrdd4xN/lyFc+yUpvv6N0cMpzeTv/3raxPGqvbdsmEZIJv2Um/wE3OTI22
 KnYG1tYMHSPq3OQtkMwIAu5OdzeXdaQbHOLuz1IxT/RpSQe29wGIiuOLEMTDrz2xoM1usb3KPsB
 G29bmyElLhhPpww1kd/MXaleV93+IlsSUAC1Uty/BQQAdHadEXwII2A8Pq2D4hJOT7ZahCuftBu
 9lWxw8/r1XeMnxyDaZjLAyQJqy7q9e2LvbIw3P/Rm9S6mRXQHY4o5GS1Y3dfMqPXj9bKi+Xx/8q
 bNyBszJBTQqu67Yv96w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX4jIE73RyV7Zm
 6EifhA3SnKpfkvAp7DkBSEeR0VM1kxgregETTDVcQUXrEtUFOklEW67XDBVOXE74zldRuZqZtIb
 MHD4Ml6tiiGdC34xhY7gqoZdp/u4HHg=
X-Proofpoint-GUID: JOQhgSHhh1HZ7xa_ovY76rcGZWSoMzDh
X-Proofpoint-ORIG-GUID: JOQhgSHhh1HZ7xa_ovY76rcGZWSoMzDh
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aec4864 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=AWKtBJF-UzVMBMTKnHQA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050036

On 05/11/2026 10:06, Wolfram Sang wrote:
> 
>> Reviewed-by even with the "# subpart" still appears in person's credits
>> and reviewing entire patch of 700 lines of diff code (like Frank's SPI
>> patch) is not the same as 10 diff codes for one driver.
> 
> Yes, if you want to spoil that, you'd need to introduce
> 
> 	Partly-reviewed-by: ...
> 
> or something.

Ack is for that, no need for a new tag, quoting:

"Acked-by.... user may not have carried out a technical review of the
patch, yet they may be satisfied ..."

"Reviewed-by:, instead, indicates that *the patch* has been reviewed and
found acceptable according to the Reviewer's Statement:"

Note that there is little sense in reviewing - as in statement of
oversight credit review - pieces of patch in context I discuss here,
e.g. one big complex rework combined with updates of drivers. Who cares
about the drivers? The complex rework is important and should be
reviewed, but people skip bigger picture and put their stamp of approval.

Stamp of approval is Ack, no need to mix it with reviewer's statement of
oversight.

Best regards,
Krzysztof

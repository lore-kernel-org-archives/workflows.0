Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876603;
	b=PcaTko+xpu50WmObUMq5VCVOK1G1fzS9prBdiVc81UiHvdJVVU0CrUz5/SPATaeEqV4H
	 9+wwncYKjrHdMlgjB92GF2MB2eNH+aMC0kBI2AmOzoji0EYGnb+s7vX+02drusA8mK43/
	 Oun0smWarf1KgrhobIbppl+itPFrUjPgXunekSpsDnwXGWs4ssoTr/0TI0Mhv0VM6KvnI
	 Isb8amrXaJzq4Oeasogq5T4b+B5Grq0KsJdcXv5HKGFzaNDiye4/igtbP/vLLNK9ZZDZs
	 6DHptPMH5AU8E8Y+V07aJn08b73ApR40dyVVgdCAUQTAIoCp9uFl8KKFTLMrG9jLlMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876603;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MNZcSYKGNFF9ooUBo5T69bdazyG3b5sb50t0n2nEr54=;
	b=AlkfpGeOK3aRQbEX7mHWBqltLrbaVxD43e/Wdf/JeOTL716+mXO++OFcMiuD3UTtG/w2
	 hYcbNKJHHXYyeNG/eIY+gCBnA0NBQDMuJwH3RIrHaraLnzPEGLDixxXRm3S/8/1sZ6WGa
	 wFqI5URRKeT8hholXGHEh282mRSfY1ZYT4XIJLBAAHDY/0H2fjnbiAh0d6p86HhfEQWZh
	 pchdu4/g4rowlfK87zQBIOP3eRKRKTQPL+QAaE+yV1XHoMwHQj//Ojo79bcofjmdRiRtg
	 /b7yzgISzLM9xEmrZzD5aVYqVPgV4b9ZyrPqIp4h2ztEH1wM7pxV+SIc9QekVGTWZgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jF0ExUx0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LoRAp9mw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FE1606A31B
	for <workflows@vger.kernel.org>; Thu,  5 Nov 2026 11:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81FE1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jF0ExUx0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LoRAp9mw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tern4084686
	for <workflows@vger.kernel.org>; Thu, 5 Nov 2026 11:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MNZcSYKGNFF9ooUBo5T69bdazyG3b5sb50t0n2nEr54=; b=jF0ExUx03ACGKakR
	whAEaqh9BwuKo10HtQ+tUkaOK/yWNcsbbUwYIejCKHU/sWDMFoKP14hxo5X5ARrI
	vaYmZbSaJNLvXWzi/LGpkpkPEt8lxh/JvVO2wPCZke47HLdJNTrdAVMd3gj1BVTG
	lf2N8tjDNdX94tOIA1P1+gGSvq2JququWDBgTfObfqmOYim6kSamkQUV6qkyL6dZ
	5iISF22ADRBIF8FgnAIecr3jPeUXQqMczkA3ia/baiuTSVElwXCA1tuel6NfPe4c
	uXHeDvj0OkD+AVz2Owr+nN8nV9MNCnaNnSuQN1/xBNsODe1spFL/AglbcsCLzhFZ
	DdLahA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkr8ya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 11:03:17 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9907539aff7so1213931241.2
        for <workflows@vger.kernel.org>; Thu, 05 Nov 2026 03:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793876596; x=1794481396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MNZcSYKGNFF9ooUBo5T69bdazyG3b5sb50t0n2nEr54=;
        b=LoRAp9mwoNFjBdJ4ze9RUrjq13li63LpHKvJa4q901Qkxbv/Prt8p0NBerjaBQf+et
         fF0gQXV5t6BOWMJstpktBGjo4EIfZ443/BCJpnJI5n3TEWFuowSkkvj1nfB4w45gkD8D
         PuelOMPtvfm89Q2Qj1wSjtTEzy128xrzyP031/BVnLk+PZ3sYQeHWjKBIDJ68t2CRjD6
         ZCi4UoGUIen0KmghVZFXOK4RrnNuewhZNkWCv5d5sIL28DJRypsxV6A4EXFbtsWUl/+E
         lGGNHwOlm/dGUSN0KS7WnNlv+uBi7Ce302ESVrsr7snEGuXAMgIH/3+ki2DevhLFcbUf
         I4Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876596; x=1794481396;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MNZcSYKGNFF9ooUBo5T69bdazyG3b5sb50t0n2nEr54=;
        b=GG9HonnILSGZrgQv2fNd5pG498s6yWj7pwOLrmn4VEeQ9mNFZWGPICc7hCTrbKupay
         G9x7O78eSwOvCiRcv7dQetVmtsHj6//jbBg+K3imFW7SfroNwXbJFd8EdOmALhyVYkwy
         FPBRRXP9dyPshnU7FLRq+J0V9n96/0If3U/ED8F97L9STh9CHQCnQ4kbv/F2X+MpC6P5
         nobDhTuu1bwLqwWKiz2stO/b0koW/zwTECqFRKU/cmHp+OC14IlST9JP6WNP1xioYsO9
         fQ4JYzIIjg4JjLgBp6otktvTX7TCZeaq1RXajgrFqZi5I3pDGhkojc0oi04CADGNWSrv
         ufcw==
X-Forwarded-Encrypted: i=1; AKwUvBwGZPR8HkHG41Bci1scAp97bb9x0k/MSDtHfWBN1rZE/FymFZejTxOzYvsA4ULU67MXQvdvOrFsdd8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PGclmqVM/niRgWsE4nxxHE7mYRVje6Xz8LeMB+wFXwLb0vDlO
	D7s1bmogW/z0ICvTIz6UQDtIsdc3CfEXUMdVQ6PWN6Dql5i8gqShj1hZ3qncxiM+At63qr35iwt
	KxoA+W/I57XXdJ6CVVLHkIJHGNETShtVSZIRjhXo79TEcw3Pj5DK/6COUlRAq9KY=
X-Gm-Gg: AYBFou1V8s5sZ/dDhrqTnekT4VKkqIRXgCKimSl1lsRdmk3MqzDW16VpYMAIawzoPU8
	Wiq+GGf5Gjm/PfNWotInGnj7Z+yjfoWOFXlZZZZ75/K4bNlBV+squ/Vtwg5S6oIyC9reEDNOGTn
	hSrpXjVqEk/5JF5EwyFhUVBmIR6q4YImhlMousNoKJK7di9BiUIfgfob8WnMg446R7cBrL0JLCm
	PjfxBlpLTDpqbhe1jqoRpoTXybM+N1MHrw8PShWDfaOziNMjLNVxPTRPmfTTqxC4beZIT0vbrvW
	rK3RNjsSvi0LOjpze+N9jw+Qd/7c44oTqTak0eOyvrWk3NmAJpOoImhdylK+sseCeOzc5ptiiII
	TQjmiGHS3DEHWfDq+v3Nh4lIJldQCT3BvoYvEQDM6ydRV4c8mjp4qSO3jMEVMiSywi6JZ1aKNwQ
	==
X-Received: by 2002:a05:6102:3707:b0:7cc:115:ddf1 with SMTP id ada2fe7eead31-7d072ca6eebmr7950973137.23.1793876595933;
        Thu, 05 Nov 2026 03:03:15 -0800 (PST)
X-Received: by 2002:a05:6102:3707:b0:7cc:115:ddf1 with SMTP id ada2fe7eead31-7d072ca6eebmr7950951137.23.1793876595418;
        Thu, 05 Nov 2026 03:03:15 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea180eaesm10978778f8f.2.2026.11.05.03.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:03:14 -0800 (PST)
Message-ID: <8abb2394-5210-495f-8420-a02bd16ff466@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 12:03:12 +0100
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
 <e1c7e287-ccc9-4705-bd72-e801ba203668@oss.qualcomm.com>
 <auxMOdmFYDYGjqa9@shikoro>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auxMOdmFYDYGjqa9@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfXxThEzni+sQOb
 rRMmjiL0crh8ITxRYw+B+otU4LJh0qVcZ+8FCI4OGa+dtyxjNP75ronxKfT2l0Wc5SpTw8EbsZm
 TBLnEVP5xeoQ9N4BcKntOSOmrXuutj8n75YP6ylj2r41ODBlKdFNwM7SMk0kXyFicxot81iH+LG
 eabAbxcR2p1H3lbBQ39xAt34rZrF4yJkKWpImBaJgk7tYp9ARFjmt1AZvDVf8Za3vjgj1E0l2+X
 USe2QGo+ncAXFMu1dkRwr1k85aVLSeLW/DtBsgwJhM4XuYVdhCab7WxttszVCT4lyy9phpm4Enw
 dudbCGoVboGmGnLAbvkuzomlW+8h2+MUjYktKRoHYeqnksA+G37WxdWY7y3fp+FKmWuI1SOps6W
 K2n/us6T992aXLuINlA4tNr6aEww0ATXf8o2bRklK+BDGQxInb330i3Q1T5hIhHZ212ylxSkH6P
 znwsdrUgqhrEUUJeIYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX2uv1PKAptwj2
 wtGxtY0fkp0+d9O9ZEwZBiDHoyp+M9EatuxU1c9Gssy4/d93KWZZQDDIEHNZ3gqvnnqAD54yVM7
 VlUjYwNB7zljsVxqkH8fKRvW62DQ0xY=
X-Proofpoint-ORIG-GUID: kQyNr5v19gAWO6rg4TpRGPjW-YpRWjCB
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec6275 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=iee88rELAAAA:8 a=7vjvkMWgNjT-vtUVTPQA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=dabF0gHGKZk2vt9j88Rf:22
X-Proofpoint-GUID: kQyNr5v19gAWO6rg4TpRGPjW-YpRWjCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050043

On 05/11/2026 10:28, Wolfram Sang wrote:
> 
>>> Yes, if you want to spoil that, you'd need to introduce
>>>
>>> 	Partly-reviewed-by: ...
>>>
>>> or something.
>>
>> Ack is for that, no need for a new tag, quoting:
>>
>> "Acked-by.... user may not have carried out a technical review of the
>> patch, yet they may be satisfied ..."
> 
> It seems you are mainly aiming about the "Ack/Rev"-distinction problem.
> I don't care so much about this. I care more about the "# subpart"
> problem. A list of 10 Acks without subpart is to me as useless as 10
> Revs without subpart. The subparts give me the idea which parts of the
> patch have been looked at in some way, at least.

Sure, let's encourage that. I do not oppose "# subpart" usage as you can
see in this version of patch. So far it was simply implied. We know many
names of maintainers so when Mark acks patch under regulator part of
files, we know he looked and acked at regulator part.

> 
>> "Reviewed-by:, instead, indicates that *the patch* has been reviewed and
>> found acceptable according to the Reviewer's Statement:"
> 
> So, for the SPI patch: if someone spent time and reviewed the complex
> core changes, but only 2 out of dozens of drivers, this would be an Ack
> according to you. I would, however, understand that this person doesn't

No, and I explained this in this commit msg. That person reviewed the
MAIN concept of the patch.

"Reviewing pieces of the patch while ignoring the main part of it, is
much closer to Acknowledgment, thus Ack, and "Reviewed-by" credit should
not be applicable."


> want to repeat the boring driver review a number of times. I'd happily
> accept an:
> 
> 	Reviewed-by: <hero@reviwers.org> # for the core parts
> 
> But still, the driver parts need review. We got a similar patch for I2C
> and 4 drivers out of those needed some cosmetic improvements. I reviewed
> that. But I did not review the changes in the dmaengine core which lead
> to the driver-fixes patch.

Nowhere in my patch here I said you CANNOT review part of the patch or
cannot even leave Rb tag for such case, right? What are we discussing
now, exactly?

Do you agree that if person skips the main point of the patch, the hard
part, and reviews only less important part, that looks more as an Ack,
than Rb, considering how "Reviewer's statement of oversight" is worded?


Best regards,
Krzysztof

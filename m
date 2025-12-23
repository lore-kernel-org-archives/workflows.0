Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B447347BCC
	for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503928; cv=none; b=I5nwiY80ktiPI/AOi7dPvoFIOi9NEubkftMAO27PpNXb6XbiHNP9glz9vZ+JBfVEuAS92iop+oNQI271skM8ObhoyfzHPjT60p5mPf2eOOYtxUITdymgmE1efAOPH+ZjjQ7U6xXN1HR6IzVmCckCDuOFt3CbKkl4NqEwz1Db0ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503928; c=relaxed/simple;
	bh=hDdsD+EMb6jzMXSuu8QMBr3lF51amuXAN5Tzs7CjfsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulP/B0JrAzJSsl4Vv/ULy0A4+BJJ9uNPcT4bo+nym7DFR0mwuO1ohUkPGD39AFaMWcrWV/3LSvZRudwcHwT0UVlhJ5AmI6mu4ZDjNA5sGp7a9KMvxN9neqwK/9MdCQiD/EIFPU6cyPc/tMc54ENskj7Hw1X/vBP+sJDg8wSLgMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQTK9+nE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSSK0ru8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQTK9+nE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSSK0ru8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNAxMSK1357457
	for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 15:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KSVbJrdgyguD5+Hmeq5/lnidxnoPgfsMNYX2Wb59VA8=; b=UQTK9+nEi9Oy41IL
	zGIhjxrMKeX0hq+nM5ddsuIoDvLdfwqh7UtJ+ieyrc3uwCiSAQfojeI3v9smLdjS
	e6yQctwq+8Dz2mZ8bXufCymwAxmivICHfTocn/0Z77I7IXoXY4aw8N0T9VGn+Y/9
	kByYDWETi7uSPnDpH4QrwWZlArWkkIVIk37S7UyH9xHbFO7oVBETFrD1sresKdQ+
	EY7OJQzhiMQQaFJBIpnaQvKfzRtkkkz26mflCfkKTho4tzZ3fjo0s1G18eXJiCin
	5eBoOOFteJyZ6PhNc7FYiZLSjyC93WordQ6eQWS+n92j2N9oda3cfB4oN813+kwQ
	akCyhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b78xc3p8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 15:32:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso55435491cf.3
        for <workflows@vger.kernel.org>; Tue, 23 Dec 2025 07:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766503925; x=1767108725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KSVbJrdgyguD5+Hmeq5/lnidxnoPgfsMNYX2Wb59VA8=;
        b=RSSK0ru8rSr5kCTXES6ybuNtC5MvWH6uZ1soZ5LwMAN8kEsl2G9NKpKWhBmrJtGU7W
         6/z7hWLHajKSaPR7HtkFMrfTvwslzA8tRTAYEq/X/pny0QaasORUWv+G/hWc1mFL5TJc
         N+BwLgzABymL35XR5tWBaEtxQuz+NeWoK5fgB1ayJT8hXfcCH1Kj8TzsZvCst4o8RT1/
         qfsnHAbTGOUCfE1xTTffORj+msiqQAdUuYob23FNj3VLMwQ0W+da+P8VDkZ6oOgFkMyI
         0Go4LKxvIvEe+rowLJjGOUj4QjXNpFI9K4Mz8If+95u0nIdQHOirSfCzqP4SId5+Xdub
         LxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766503925; x=1767108725;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSVbJrdgyguD5+Hmeq5/lnidxnoPgfsMNYX2Wb59VA8=;
        b=d+Tq/HQ9QcHEwBIkJYoo22VbXNM0NOvP0eUeV+OHr6kXozxohmoL2OwXqj+sTVaZhK
         w4du7wehvdoxhRBslimiZfjIiM3zREo1bicX34CjvQ77uG8NxX9N/AL+W3yNxlRRV1t5
         eVSIcuegNEZXxmdFQZu8B3WV55QseiB030454LZ8BrNsH349hVZ9jeIEWL2LaGGcO1b/
         4gNqK2BKbnmEOxIyDbgRRk1ntFSXIpNBhgIrb1UDq0QowcxehGqdNj7qopKCpET03H4v
         fbE9iMEVn7GoQqfJoSAVq88TzKj1wckX1MWObzfGLYpHHwTx+BFjlfsMx9fY+8BB6S9p
         +nuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqxWTRsIh43NWu0Qf+9/H9MN515IrQv0NhTotmBH1ZcEB62JKl3mkQB+RCk7MyQrRrC0sZXCHLXPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZl51cHBC19CwpGMwnGM5O/DWFPG9mc3FuACGPb2ABFtI+kuO
	rMjTzCRVTiwU0dG2H7+//nCR4Dbj/SYAoXXgSsPxwgtA98uCpRmpk89mhgIY+lstzhxDpaYqdrB
	IvY29Tpiiw7onzobcREiuc+eYyRiDD/1dyIkP6kGz2PzJQ5nBDWBD3MpXtQ4wVnA=
X-Gm-Gg: AY/fxX5cIqcFXHj9A83rW7yF0czgH5iCEYIOwyiZ7O1xLfh1JqFBGYGE2ki5k8sz8ia
	gXdBcKlw3XEpc1vaMJlQlO/mHys8WRLdl0pAKTb6LHQCzddcBfgw1m0t35SSQQItyarEeQ4IOCx
	tcSI83Z+9lYOvF7vUmBWRjxojZL3iWUC5RBi4rJ4ukP4QfTK8N7p9wU742TGjfn0ovJHjJj2hMC
	AzBWTFC51i+4CmfKf2XxCYYO6E6O7rYM2R//yHU41W668LZER1FqzEiomG2vNd+oQp9pTmDuogj
	gKrArPcp3BQYzg/k8QgteCEBrBkaPZCFTMNbiCG5h5fRRfHJ/XCzOIuP0AEunpcVODZ3oSrykZ7
	4PpUvwZ0Tfeffihb/5wfgfDYML+/nJ0Z/xR8jUm6w+STf8K0m8YVx5BPjMz6HpOagcIRDY6Op
X-Received: by 2002:a05:622a:5a09:b0:4ed:5ed:2527 with SMTP id d75a77b69052e-4f4abcb5fd0mr249603681cf.3.1766503925492;
        Tue, 23 Dec 2025 07:32:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHod4HXSgSLTvIVjGk5APCt5zB+ut9QFHLoarx1zOShGL7dW1do7ikWwGzBadtd5p3cXxJ8Ew==
X-Received: by 2002:a05:622a:5a09:b0:4ed:5ed:2527 with SMTP id d75a77b69052e-4f4abcb5fd0mr249603221cf.3.1766503925089;
        Tue, 23 Dec 2025 07:32:05 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80426fc164sm1296719866b.30.2025.12.23.07.32.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 07:32:04 -0800 (PST)
Message-ID: <f858ea0e-24d5-4cdd-ab57-dfeebe67ae7b@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 16:32:02 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit about defconfig
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20251223150256.GI9817@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251223150256.GI9817@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jzODMiumohKIRzlohER4iTfey9kxR0Yi
X-Proofpoint-ORIG-GUID: jzODMiumohKIRzlohER4iTfey9kxR0Yi
X-Authority-Analysis: v=2.4 cv=cuKWUl4i c=1 sm=1 tr=0 ts=694ab5f6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=NA6n-xKotOlSH5BGWq0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEyOCBTYWx0ZWRfX4LmolaYWrnKa
 vL7fa7zN1yxtewH/Rt0NaXL3nrHoFsqCzVdQcpKGvf19kL0Q56DNIrfcljQ93Og27J6tYZpx5zN
 r5oQ12unAyWyXsjejgj9eD/BxmARKn9a845okUZv/xecYEaWhccknyUyOJdtviLQF/52OrV2Gmt
 g7g7eMpZlhw+XqMkBE3pShQB/THh0/3L2LyvHFoUY/j31DAR6AcylM9Ta8Lu4uzL0iBcq9SkJa3
 GSEEDbS1HObQVGVauPtyZNTwsthnv+q3VW+36ZNLFf05m4PE7AkMO0aradYwJhFd2gCdGRxM0iO
 n9h7wOdcMpu2t78GnpH9IO+t6N/kER75CPo2N9aLbxLio8CVq/lUgWIRjBChISl/2mBSHTy375L
 8TpBFZuKRkh+CDVmrKmiL4MV+qGeHS2oLHYyi8GHXLlz+W89Nf1rkBH0GDxJw8yn33wNiW59W/E
 yj/4n+ocnwug8xv3gCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230128

On 23/12/2025 16:02, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> On Tue, Dec 23, 2025 at 03:27:27PM +0100, Krzysztof Kozlowski wrote:
>> It is already documented but people still send noticeable amount of
>> patches ignoring the rule - get_maintainers.pl does not work on
>> arm64/configs/defconfig or any other shared ARM defconfig.
>>
>> Be more explicit, that one must not rely on typical/simple approach
>> here for getting To/Cc list.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
>> ---
>>  Documentation/process/maintainer-soc.rst | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
>> index 3ba886f52a51..014c639022b2 100644
>> --- a/Documentation/process/maintainer-soc.rst
>> +++ b/Documentation/process/maintainer-soc.rst
>> @@ -57,8 +57,10 @@ Submitting Patches for Given SoC
>>  
>>  All typical platform related patches should be sent via SoC submaintainers
>>  (platform-specific maintainers).  This includes also changes to per-platform or
>> -shared defconfigs (scripts/get_maintainer.pl might not provide correct
>> -addresses in such case).
>> +shared defconfigs. Note that scripts/get_maintainer.pl might not provide
>> +correct addresses for the shared defconfig, so ignore its output and manually
>> +create CC-list based on MAINTAINERS file or use something like
>> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
> 
> I fear this will be another piece of documentation that people won't
> read. It would be more effective to implement custom logic in
> get_maintainer.pl (or at least output an informative message).

Part of the logic is already there, but I will not grow that - I don't
want to touch Perl code. It's pretty obvious the tool should be do it,
so feel free to fix it. No point however to stop proper documentation.

Best regards,
Krzysztof

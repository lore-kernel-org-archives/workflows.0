Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02685215764
	for <workflows@vger.kernel.org>; Tue, 29 Apr 2025 23:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969590; cv=none; b=QkobT65ltfu6DwVkddXcvFPTo5kZN7WyQ+flfV4V2Yf9V1VLJn+3p1SgvqlOjUEw7Ew/3W8d70wRXvf/2EpkD3rc7+nkiBAjYRpXmxnkDCBAIuiYej2kYUvIypK8Vr4J+GnQWLp4VPtFAaRHXDiCLNk1NMfC0ZD48OAytBKvNlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969590; c=relaxed/simple;
	bh=91lQyvhQ0vUeR2C5rjMPbLayVwhJTn0+N8ztV6/O+FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=syNUTtVSreZNPQWM/w5zqvhOkl9UXqPRkroSSaefmkZWm++Q2n62hR6c/MT5V2o+3sUufzQTps4In+0mt+Piw5kbkOgaMNXI8sbj9+gGJlXyloORbATXHCDuhWMxo+14thzinYxr+38pCuJH9E9OWGTmpkXDIS0Kh6FwID8t3Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XvOjz2Z6; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XvOjz2Z6"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d93deba52fso17480685ab.0
        for <workflows@vger.kernel.org>; Tue, 29 Apr 2025 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745969587; x=1746574387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=57VBGGVBY85MK2UKVXxeo+EoMCdb9fTe1GaMwG8NQ00=;
        b=XvOjz2Z62vKzRHJ1GfxUhlkG3jS/VRjAY2VIOgqSyZilWjplmYeE53Db7viuRjL6c6
         eOrcu5fM+5unfQ4ty9Dm6OYlI7J3C/eej/8cKvYjx4CF9TIB/OlO1S5/mg5bQYdPLW8h
         UZZ9khG30C3crwfmvY8SunPMacIi1jDIV+TA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745969587; x=1746574387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57VBGGVBY85MK2UKVXxeo+EoMCdb9fTe1GaMwG8NQ00=;
        b=u7GFqqiETMzy86b6FCVeISzsESWpac1Y+M8p/scyef1Us2t8hnF2KakK3+YOO7FWr2
         Qv7832tJFGSlS/t02ofbzaF2nbDcv3qqFBXtUB30rjY6t6Ju+kCt2Y1hI09itKQaUjTl
         RFXkSNuXFCkGF8Np56UUy/fyT3iccb8+X7yunPwD1k+OcgxHz8AmO0X/pU1tZoK7wltM
         UFX0n6/wmPzvVlGKcM1Y3RVQ9uQvrRhcSc3Njwa4gL+tMZzbvgcKm7eS+Ge/iZJC+Hu5
         j+CSk4CUdA5+WfXpeDw57VDnONjdofe8H8Nz40N+KuWp9x5hQKyDDnCkpxZg255dfbyq
         B28Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxBcykao/InUQR5AIzCDmGzxdbcr9dJYSX4NUiimHG1NBWNyLRf7PAfc9819U8nrwWZGRiO68Y75k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcIWtEYXdb9b/OKSRKsYKfOJ0lR3YMBqPp/LXh/5PKUTh3J0ei
	1n5AFTlSWbxMvkv73xf4bVfwDD+hoIyrnFkRiMPb7G6Pho6WbBMKglSXJGhTT6g=
X-Gm-Gg: ASbGncvMXSOSSmyL/gkpTYM3HPYRcuuoN/epfmjMGbxXQ+Dn/TPc7+QY4mlnoKtfOhZ
	niZH4RGAhLhrY7W7s/EKAQsXPdFS5ujR/ia79V26MCzW8tWRmb3RzB4SXRg5yva0MVJUB3tHj8I
	LnfcIp6DAi6mukwq4JhPLS5+1pjEkZwvEmzZkNLt93VpxtnHCaQ9lbFCF2MVbCBhIZZYGNVPQ25
	WAOon4bosQg/0z+ElGtQLpFxhSlsbaif67Acp6WvVVQydl+lEQKU7gYY/n5QkUtS6KHzgcohGEe
	IvcTTSaQuoOzC58gHJqq2eGrugYI5hR8n0f+yvtUMqO1R8SGjG4=
X-Google-Smtp-Source: AGHT+IGmi1rtml3AlLb1Q65Dbn3WTPaIc0r44Elktf5kpSPRnHKwm8fFiAMDfsyaGULJj9rb9LE01w==
X-Received: by 2002:a05:6e02:2502:b0:3d6:d145:3006 with SMTP id e9e14a558f8ab-3d968009f6amr4296895ab.20.1745969587055;
        Tue, 29 Apr 2025 16:33:07 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f476892sm5211075ab.65.2025.04.29.16.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 16:33:06 -0700 (PDT)
Message-ID: <589336a3-4df5-4f58-a627-2b75716f7b61@linuxfoundation.org>
Date: Tue, 29 Apr 2025 17:33:05 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] doc: kunit: add information about cleaning source
 trees
To: Randy Dunlap <rdunlap@infradead.org>, brendan.higgins@linux.dev,
 davidgow@google.com, rmoar@google.com, corbet@lwn.net
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1745965121.git.skhan@linuxfoundation.org>
 <7104475f60568f6a580b03d84e61abe311d63e46.1745965121.git.skhan@linuxfoundation.org>
 <c3333ef9-f266-4260-8f75-0da65bcff1da@infradead.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <c3333ef9-f266-4260-8f75-0da65bcff1da@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 16:29, Randy Dunlap wrote:
> 
> 
> On 4/29/25 3:27 PM, Shuah Khan wrote:
>> If kunit run happens in a tree in which a x86_64 kernel was built,
>> the source tree could be dirty.
>>
>> "make ARCH=um mrproper" will not clean the x86_64 build artifacts.
>> Running "make ARCH=x86_64 mrproper" is necessary to clean them.
>>
>> Add this information to the documentation.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   Documentation/dev-tools/kunit/start.rst | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
>> index a98235326bab..568e29aebd6e 100644
>> --- a/Documentation/dev-tools/kunit/start.rst
>> +++ b/Documentation/dev-tools/kunit/start.rst
>> @@ -39,6 +39,18 @@ can run kunit_tool:
>>   	``make ARCH=um mrproper``, just be aware that this will delete the
>>   	current configuration and all generated files.
>>   
>> +	You may see the following error if a prior build leaves behind
>> +	header files which 'make ARCH=um mrproper' fails to clean:
>> +
>> +	"undefined symbol sev_es_trampoline_start referenced ..."
>> +
>> +	This is special case scenario when a prior x86_64 build populates
>> +	the source tree with arch/x86/realmode/rm/pasyms.h. This header
>> +	will not be cleaned by 'make ARCH=um mrproper'
>> +
>> +	If you encouter this problem, run 'make ARCH=x86_64 mrproper' to
> 
> 	       encounter

Thank you. Will fix it.

thanks,
-- Shuah

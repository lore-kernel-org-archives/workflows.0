Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD97821FF24
	for <workflows@vger.kernel.org>; Thu, 18 Sep 2025 14:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758206893; cv=none; b=BJLQk8MH54FhvlIxRTY/b9e1QB4AmbAoTcH30f9NwiYaYvNN3AXiEsQJTSF9cLU3Pdl5dEpMsJDDU9uoAdHvYP+Vof/Azvq7msIjHuVFa8EJzyW+7aLvDL3U82CiiCX6P/drY3Cx+bVdyXJhukzAveRyIwUTueJ40ZRZCj/CfFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758206893; c=relaxed/simple;
	bh=+6Pm7oe860827VjuzLws11HsAxMWZ3KkG/LCw0TwnQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RIWvpGuSn+Sw74KMWrUur6ps1ERIMwmiiQnP8TjJfuW/eVAZzEuu/dNW/RnrXPh5JZ+CNxjtFEevWmpJxDeRYK4c1dEDN+KjwR5r3vZfuwwdpK2hNh2GSNXYBAAPwwWuB5Ko6nbL3ZsNrtggveIXaL6jFRwXpvlkGzrPo6yLIKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=De9Oh+La; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="De9Oh+La"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5776e7fcd15so227947e87.1
        for <workflows@vger.kernel.org>; Thu, 18 Sep 2025 07:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758206889; x=1758811689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iAxT3fVcqeuUfVjtRTsWYQE3cdG0LYpzTMO+2TQXp/o=;
        b=De9Oh+LaCTXV0rIHvODfatPxtQcXzKgovpQp58geWHtEpE9JdD3hgB59dsRCUoizBo
         2S0W73jXkVl9E4poR5bBI8Gh8KBCI87W92cS0pOv3GPF0Tvf7g++EscyLpcptHH7vYdm
         1NqjMkS8YYKQ884xJom+tvzgNHoiELqWsmZXZDpMOQBzb4VgjiAeVORrApQs+pYC0ghR
         uCiw61jExlnb99GG3dpCUjLPxG/QMqpwWzK39SnloLB4oBnEILHHJVYXCga+ISKSY66v
         PB6MuXFJsjJuADbvdQNU2kB4R6UpDvFNRsyzTdwK/Hqq1aZuENtrZOMgI9fLxyXGTQQY
         m+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758206889; x=1758811689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAxT3fVcqeuUfVjtRTsWYQE3cdG0LYpzTMO+2TQXp/o=;
        b=MAJyQPOjbp7+m5+8pxpwf2kglWLJanr21luJOCxJSHAF6o4o44CFyAgHbVxb54eGTs
         wu3V8git9t2Md5bNPbLceraDzQAbRkh2jqeQZWUoeexG3OTNYjtm9Herui7u8dB2DKYQ
         fBoFOz23iz02D6XngUtlb85GZIHQPyINo6xIOjnWA9W4su+F6Ea3//PeKnbXGuQRE8S0
         XvzcGS+TidXifZHEphZkm3qby7GVp5G5sKbZYch+8EaFZzBwFioZGjo4w+PBI6TdFKcb
         Wfz9ds1+vku598tfQ+t+BdyR37XR9S8S3BpfS/WQHUeAx1ICR/H6ehqOp5C+4AdzePnn
         NyvA==
X-Forwarded-Encrypted: i=1; AJvYcCW0aB7YqkI+jrJ22eVYuE8beuGrkiNLqDD18vLWyeP+Yy7HHlD2dnZXUFOZWitVWo92MyPcr/EneHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLN3XVtBRk2Y2K9zxMZUeuuNAPTJQjhsd2pHw8mFrSHz8YNHcC
	XKyOAo8USO9edyoRGijVWj09nWgJModvgU8XM6yMQNhj5a+aRP+pA827
X-Gm-Gg: ASbGnctpG3KRfbH6CXVKmKuw6h182UtFzFA6fOWORr4368HGpmAMQElDnv/smwUMDTq
	LyE+DLU3s2Etsn4OBZNzXRrpck0qMwkjY3aZcos/izJTXHvs/PUUlHnpKVsipUssKXtdDL1Qoa5
	VYcUdt0Kj28Eaxz9C4GeUNdRaiU5qZ3llSUzBMLvsF11Muin/QmaUjutW0ODaRe7rwPGgJcDJS8
	TXkLjRCS63EgDmzxDwiPjGjNwqmSoQO8kbHSFtMaVRmWt1sBiAq3cgX+ZlKP21qsO1tZmLEUK1T
	BH5OhP4a+I2TWQTxkqrwr01IFNeZQ5SdLf1D8miJHl/a/H60V19a8p2hUmIeRD/3yrfWoEhD8CB
	JK7zdTiBg1rWoUf/in9OLc3ToCPTwm+cL50D+L41Fs6usNTEBRswkrj0Aqg==
X-Google-Smtp-Source: AGHT+IGHEzqw59r0e8igL1+CPPVfjvLXVyO+/F/7yKLyQTtxPDFzXxzv7jI8gfftK+xRhHpq+exTSA==
X-Received: by 2002:a2e:b8c5:0:b0:356:25da:89eb with SMTP id 38308e7fff4ca-35f64fef9cfmr8254611fa.4.1758206888768;
        Thu, 18 Sep 2025 07:48:08 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a1e07947sm6404731fa.12.2025.09.18.07.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:48:08 -0700 (PDT)
Message-ID: <9f332ea7-4210-42f8-b640-3135cdd808be@gmail.com>
Date: Thu, 18 Sep 2025 16:48:05 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] kasan: apply write-only mode in kasan kunit
 testcases
To: Yeoreum Yun <yeoreum.yun@arm.com>, glider@google.com,
 andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
 corbet@lwn.net, catalin.marinas@arm.com, will@kernel.org,
 akpm@linux-foundation.org, scott@os.amperecomputing.com,
 jhubbard@nvidia.com, pankaj.gupta@amd.com, leitao@debian.org,
 kaleshsingh@google.com, maz@kernel.org, broonie@kernel.org,
 oliver.upton@linux.dev, james.morse@arm.com, ardb@kernel.org,
 hardevsinh.palaniya@siliconsignals.io, david@redhat.com,
 yang@os.amperecomputing.com
Cc: kasan-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
References: <20250916222755.466009-1-yeoreum.yun@arm.com>
 <20250916222755.466009-3-yeoreum.yun@arm.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250916222755.466009-3-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/17/25 12:27 AM, Yeoreum Yun wrote:
> When KASAN is configured in write-only mode,
> fetch/load operations do not trigger tag check faults.
> 
> As a result, the outcome of some test cases may differ
> compared to when KASAN is configured without write-only mode.
> 
> Therefore, by modifying pre-exist testcases
> check the write only makes tag check fault (TCF) where
> writing is perform in "allocated memory" but tag is invalid
> (i.e) redzone write in atomic_set() testcases.
> Otherwise check the invalid fetch/read doesn't generate TCF.
> 
> Also, skip some testcases affected by initial value
> (i.e) atomic_cmpxchg() testcase maybe successd if
> it passes valid atomic_t address and invalid oldaval address.
> In this case, if invalid atomic_t doesn't have the same oldval,
> it won't trigger write operation so the test will pass.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
> ---

Reviewed-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>


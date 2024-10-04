Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B0C157492
	for <workflows@vger.kernel.org>; Fri,  4 Oct 2024 17:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728062581; cv=none; b=fhj82g8daCsloTHOl2DvSBQxStab+t4mkX0GlTzlAyGmjP8d1V0aKQYsahDzHe7t8ind2fyxSCNFgKAj29TJWfafMTmy2ZYMa+mmbTGNVCSKLu2oib9XKN9fY2GRIBILMLfzd75IlaxqbbfhW5Jnq+oCDqi4MJy2qfpgoaT1rzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728062581; c=relaxed/simple;
	bh=vkXradS47TZRsD+Tw9Obi8t9ec/M35OKeWU2WxNXipU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLpfArbTNNOMMH2aftOgBbkLqD4+4cYyRzovB3oMqtMRywu0c2M++t7x1zpOq5pxIgbLBQ3rNoxL3T8QYe2knd0R/RRso6A/czpBeDl6dMaMkqCXD3EpXc9qw4k15OdpbIOwkPcCMsDziiFhVoux4d2U4Pjkgc2NXIqTk4UuxCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=av8EjpW3; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="av8EjpW3"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-82aef2c1e5fso104100839f.1
        for <workflows@vger.kernel.org>; Fri, 04 Oct 2024 10:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1728062578; x=1728667378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UjxtETvebgPu96nn5gAk9Ijr0Fw8D2drEbjhjiJbq5Y=;
        b=av8EjpW3Pu0NyRzwyQZX+el+1L4NmBSVlqC4pjlQn6qSNho9LaojS26Wqs1mPlmpNa
         Cc7443uBpe2kfdCA3NX4mj9ImZShSi3UDQ6khAcVKgichQkGpAS/dimEVDaAJA2vxQmm
         sZABGKLCrCytF43hD7pbIAiwScz0ZtIvpIZ/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728062578; x=1728667378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UjxtETvebgPu96nn5gAk9Ijr0Fw8D2drEbjhjiJbq5Y=;
        b=Y7T7I5Z8+8uMe+hKpciYAhQpfyyaCUffrJgqCUHMpk228Lxl/PbvUCC7C5kGNhPeDK
         lpZAbgWuuvZCCsXSHsYS2xOYG0hXYnvOxNPvptIG9mJMGlOu6f1+5CiqCyEBxdxqtOPx
         kgclOPgq5Wh1JEQtyaojvXNxuTjap1e/ck61YiQ6H0MCQpq/bUh7JoL9PjY0qMkyq9jX
         2lF5MxXextcs4rLAh1jg2yAqw/y70gNnZ/zHcLnVQdMCio5+YF3gszQHZYs3ckwQNX9M
         VWIEGWqKs3Dlo12mS4OfHRKbbFdNlO9r/azMVCVpLQSdOvknUnJm1ZGzunEg49ffrg6Z
         q7iA==
X-Forwarded-Encrypted: i=1; AJvYcCV7yFqSr+xJReOFTSWYmJKJXPr0MyuVWz/RuKuvb+nR0Q7FaLtjpzaRXQ2sN4ofo9RFJKnTkhRDdYM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv3LiFM4r0bFcUFTuEPw+l3lGn+d9MGJFvzk3f/QwRhPN/PBPA
	CNHH8glerDIj/B8ScI+PVJ+jKFB0yRBCrlQTgurICymu+f70GtWJ6OFGsKzU1M8=
X-Google-Smtp-Source: AGHT+IEng1VQK79hPV945GkxjWJmm7jzrP9Wu7f2kokbpX4AGNwAmboL7kqahAU8iEa3xBWgrBpQ0g==
X-Received: by 2002:a05:6602:6c1c:b0:82d:d07:daaa with SMTP id ca18e2360f4ac-834f7c741d9mr304525239f.4.1728062577959;
        Fri, 04 Oct 2024 10:22:57 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83503a92f7bsm4195939f.18.2024.10.04.10.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 10:22:57 -0700 (PDT)
Message-ID: <e3602786-d656-40ae-9e22-0e8195d33f0f@linuxfoundation.org>
Date: Fri, 4 Oct 2024 11:22:55 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: dev-tools: Add documentation for the device focused
 kselftests
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel@collabora.com, linux-kselftest@vger.kernel.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernelci@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241001-kselftest-device-docs-v1-1-be28b70dd855@collabora.com>
 <0040a842-de9c-4f9c-9d61-c1bfbd010470@linuxfoundation.org>
 <ef428a44-783c-43c3-81c6-9abf88ae8949@notapiano>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ef428a44-783c-43c3-81c6-9abf88ae8949@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/3/24 08:41, Nícolas F. R. A. Prado wrote:
> On Wed, Oct 02, 2024 at 12:00:10PM -0600, Shuah Khan wrote:
>> On 10/1/24 09:43, Nícolas F. R. A. Prado wrote:
>>> Add documentation for the kselftests focused on testing devices and
>>> point to it from the kselftest documentation. There are multiple tests
>>> in this category so the aim of this page is to make it clear when to run
>>> each test.
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>> This patch depends on patch "kselftest: devices: Add test to detect
>>> missing devices" [1], since this patch documents that test.
>>>
>>> [1] https://lore.kernel.org/all/20240928-kselftest-dev-exist-v2-1-fab07de6b80b@collabora.com
>>> ---
>>>    Documentation/dev-tools/kselftest.rst       |  9 ++++++
>>>    Documentation/dev-tools/testing-devices.rst | 47 +++++++++++++++++++++++++++++
>>
>> The new file needs to be added to Documentation/dev-tools/index.rst
>>
>> Docs make should have warned about this?
> 
> There is no warning. I have added this new document in a new toctree in the
> kselftest.rst, as you can see in the hunk below.
> 

I missed that.

> Since this new page is specific to kselftest, I think listing it on the
> kselftest page makes the most sense and will make it easier to find.
> 

Yes - including it from kselftest makes sense to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Jon, Let me know if you would like me to take this through kselftest
tree.

thanks,
-- Shuah


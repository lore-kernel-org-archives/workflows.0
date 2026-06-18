Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F01D2D738F
	for <workflows@vger.kernel.org>; Thu, 18 Jun 2026 17:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781802126; cv=none; b=SU8gUPOMhsykVp6B27rMscYzCKvz8p2Kv91+YetGkAiyDoLHW20wecfMWOZd5UFEqouiDT/6vDCLxdWnw7Ujcv79X7qFHFRLZsuV4AySoMvt7GAeVhd6z/9T7ewiC+gsJ0OYNashGYZu0rMCDZ3m3uBOuXxxUMEEfmPYS7mf8eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781802126; c=relaxed/simple;
	bh=XaV8a3UQtqcjTbDhXEAibebtLvTrsKHIKVmJnslIQyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULTLceQTHrSNuXY3mqlEg6LYJV+oTWwNaFY4G+yLivo4W/JRb+JTK3hjOAV5cDgE8AYPWOAK9WVVHIQUSEWzEWp4l5oXVHi5xPuo7FB9Pp2gjep3N1OI0DNM0BjnxrMp8hmoY8CRilDkOqLFoMHwMYl5ZCsJqDqQyzyV0WO17FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XY3qaOTL; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XY3qaOTL"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7e8f690f53aso732135a34.1
        for <workflows@vger.kernel.org>; Thu, 18 Jun 2026 10:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781802123; x=1782406923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Dshu88ZuhYuScihy4XNQcAaIDZZApNzfPKmeuN1s3E=;
        b=XY3qaOTL5nHAtTctQHjFSPN+I2t5UXwPxuyY43GODQNT/s8LfGp4wkkTMPCiW6vOB6
         M3u8bdy3hkKGuJlnWOSKVj9+GzlaGfiZ/Npd5QLIhj8colHGASNrm6vfdYUR2qhpU01V
         6HXzh0oYkR4sIOB2IXt9U/pYewbCNAPj2e3ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781802123; x=1782406923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Dshu88ZuhYuScihy4XNQcAaIDZZApNzfPKmeuN1s3E=;
        b=iUgGSONgOELPzYCs7glpXjHXwA7t83KHyHHUKeAut+EUJUN34CVpqY+aC3NV4d0u0o
         GTTGnxprzQRHhKKI7Xbz2igBhnT4O3rgdJnLNEEexA/H/MoCFHkBx9QfFPVhRH3HhXRG
         fNJw55t44ECFpvuHWoLGdOcyFd5I/yXVJ4Nm4YhMSvW38nlqbJN087yMj9C921fl8XpQ
         /jVRWvsrk5sl1f1zpuu2Rgny4LYi0BnSuZ1GP+n/nwyPSSB2sA1p9mbkrUTb3jk4VAvX
         rmLOuNLvVWPIYnYRFoqAk3Of8O3U2qct3WyE7uYkHk1DXKHLub8x3z94F7jVNEdB9p5P
         Wyfw==
X-Forwarded-Encrypted: i=1; AFNElJ9W1HUzQNcy0mFfjEiXd3QVt7s+d1g4xSUvUz5fRC/21JNaWULSdU5Ib3QJItn+fejVnyEM3J+9YBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3N7KMBhjW/UAvUN1w2Vew1R8YrpYb96d6BrONGPN/oU04+aGM
	AJ0kwWBsj0hB9CPKqxfpnnl/c5aOv8D7tov4IMMhhDaX47QU6cA03NgRzHQ65r3NaGc=
X-Gm-Gg: AfdE7cn7JeNdXrg9fn5BxbDNT+gXcBkaq23HKGIoP9vLUUGR0kM74uqGPnvyVey73nI
	yaMcs/aYvdKZde3B5H7JgPixWX5xFr8i/NGyyR9lcpCW+ZuW9Hjzezduvw0oPTuSZiNAxItG46l
	W6WbzJbfNdwjgkxeVsYlUVXc9Z8ykB4xNf6ZbZIHeELSYpJJd63dVLFx+zOfZMKe4YHa+bDWQ/K
	4VwjXq8lnKNdVLETtfxcbmu04y3x4T/Gj2TDh8DSeoJkvqve8N5sDpQI25K/YNjcJ/iG5u54Xnb
	8FXdp7DkNsOBc0KBtr3wsKgx6yTaSJQPcxjqMPw4W/U99FZdAPqCcvObF4sxsmEpfZ0+Yvpk1B6
	/12nc4939FAEOrUxNzrl+zNhNPcOnwHNc2T1EDZ0+pk823zYa2Rcxh/HUO9cCkRZlZx9J/i9KuR
	spIISwJ/OG52Y3yplYHEYb
X-Received: by 2002:a05:6830:6b04:b0:7dc:dd19:7f53 with SMTP id 46e09a7af769-7e90c8f263dmr7321421a34.14.1781802123216;
        Thu, 18 Jun 2026 10:02:03 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f5a1b22sm12489190a34.2.2026.06.18.10.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 10:02:02 -0700 (PDT)
Message-ID: <1306d609-3375-4f52-8239-b4c2fffb7bec@linuxfoundation.org>
Date: Thu, 18 Jun 2026 11:02:00 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest docs: remove reference to obsolete/archived
 wiki
To: Brett Sheffield <bacs@librecast.net>, Rafael Passos <rafael@rcpassos.me>,
 shuah@kernel.org, corbet@lwn.net
Cc: linux-kselftest@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <ajOvQKne74gN-7Y2@karahi.librecast.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ajOvQKne74gN-7Y2@karahi.librecast.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/26 02:41, Brett Sheffield wrote:
>> On 6/17/26 19:03, Shuah Khan wrote:
>>> On 6/17/26 17:57, Rafael Passos wrote:
>>>> This link in the docs point to a wiki that is no longer active.
>>>>
>>>> The wiki was moved to archive.kernel.org, and there is a warning:
>>>> "OBSOLETE CONTENT This wiki has been archived and the content is
>>>> no longer updated."
>>>>
>>>> Signed-off-by: Rafael Passos <rafael@rcpassos.me>
>>>> ---
>>>>
>>>>    Documentation/dev-tools/kselftest.rst | 5 -----
>>>>    1 file changed, 5 deletions(-)
>>>>
>>>> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
>>>> index d7bfe320338c..64c0ec7428a2 100644
>>>> --- a/Documentation/dev-tools/kselftest.rst
>>>> +++ b/Documentation/dev-tools/kselftest.rst
>>>> @@ -15,11 +15,6 @@ able to run that test on an older kernel. Hence, it is important to keep
>>>>    code that can still test an older kernel and make sure it skips the test
>>>>    gracefully on newer releases.
>>>> -You can find additional information on Kselftest framework, how to
>>>> -write new tests using the framework on Kselftest wiki:
>>>> -
>>>> -https://kselftest.wiki.kernel.org/
>>>> -
>>>>    On some systems, hot-plug tests could hang forever waiting for cpu and
>>>>    memory to be ready to be offlined. A special hot-plug target is created
>>>>    to run the full range of hot-plug tests. In default mode, hot-plug tests run
>>>
>>>
>>> Looks good to me.
>>>
>>> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
>>
>> Jon,
>>
>> I can take this through kselftest tree as I usually do.
>>
>> thanks,
>> -- Shuah
> 
> Hi Shuah, Jon et al,
> 
> I've been trying to get the same change merged since August 2025:
> 
> https://lore.kernel.org/linux-doc/20250824075007.13901-2-bacs@librecast.net/
> 
> resent in January:
> 
> https://lore.kernel.org/linux-doc/20260115172817.7120-1-bacs@librecast.net/
> 
> It's great that this trivial fix is finally getting merged, but can someone
> explain why this patch was accepted in preference to the one I sent in August?
> 

Brett,

My apologies  for not taking your patch earlier. Considering the effort
you put in with a re-sending the patch and following up here, it is
only fair for me to take yours instead. Hope it will apply cleanly on
top of kselftest-next

Rafael, I am going to take Brett;s patch instead of yours.

Apologies to both of you for the mix up.

thanks,
-- Shuah



Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BA426158B
	for <workflows@vger.kernel.org>; Sat, 16 May 2026 12:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778934220; cv=none; b=HsKl3jbdq0J34gwlOIbTkwYc+ghabS7oRasQ4oshZ0IBi5yNzMRettwpxswLuyAp07A0EIAhnT1HY49x8Ei5umnChOObc/LwkGlXVCMof/4zgGZkIqKy0jSZwJaXhRt58s/3drMrHpkRD7Y4MCWyecdG0iCQNv2QQhSj5/krj9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778934220; c=relaxed/simple;
	bh=ReEjk4xHX3hMoo+7a5sYsPeeGszqBwPk9e3UoSjvLjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=saWxnXPzublvJ+5XcvbE17o79h5t+U8FY6UfKsPZqaLWkALHhcDCCn3Qj4uMJL614TQQJ0UxR4ejWGgKURqhUbNMJlP22YZb7C/3znM7ULBZUSAxghIU0mq1K98zWELTFAxwf65toY9OSinRrYci6/DLhpkghVpHpb1pgXSFQdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkyKAXXO; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkyKAXXO"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b4520f6b32so988481eec.0
        for <workflows@vger.kernel.org>; Sat, 16 May 2026 05:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778934218; x=1779539018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=X3UiNKjAwLMwtHH5p37mYEgL5WG6qIehB81espefyCM=;
        b=mkyKAXXOomaYknMCqNpSDoAiYzr+nDC3UHEve3dehuN8yXIau19h1gYYC1QXX5dmCQ
         sAmCjt4zOsExRAYr+ZCqkQI4zCNQHWOK6M0Ue4ysaSGT4j+nNuv/2tRI7lankOUqW9cg
         5/xb6qGKFuYEjaoF16aTp4pJyvuZI+/nZ6iXzasbQqi4R478D6b8V/QKvy6OFmkXKt70
         4mPYKBniAr9va/7paif5vM+UxUiILJ2DGwDxTXZPquHzl0Qn6L0TAALIQVwxr82XzQey
         8zMpSss+Ro1XqZ3pzdJI5EMuP0hbsS5J1pOY/s1mo5lfKIxrSV89sYNl+HQQG0YAnXWV
         UdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934218; x=1779539018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3UiNKjAwLMwtHH5p37mYEgL5WG6qIehB81espefyCM=;
        b=XINz+QmGyvoBCEo7PeqtcKvrM/i+jB8qYKMoclh3vqbYbZk7E/Yk1tjYO/Epm8GodU
         2sm+tFpexGbIM6/Gpsbv8nnKIFXiOfzDD9ekEan/6xjRj6lgvfAbY7dpSSICjYyHMuNh
         1hVw5u3oMyXEfhlq4Gz3BEsNS1C2y1B662jXl8VZyTm2o6aVe71fuNsXA4ExidvWYv2g
         gXvfhvEG471eRYm/EEsjXKnjBLphG5Zswlxaa2kpHlo8F1CTPvhXHIz5H5hMme3h6WUG
         HMZ/gRuBPeXNa4qdk6y/cSjrMG10ieOewlpr6ITjgm2GqIXGGxvvgU0A7fEt7NPHOoKh
         ADeQ==
X-Forwarded-Encrypted: i=1; AFNElJ80tvcWAhSXMR1rg7Ucf0JCmPnAHL5WhJHDkY9dvlzfcCKj1XcsvFTYAPvOt7fq94AvleZbdbvX/cM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFIWd0aSrVYBVwYFZZ2hg0USyDgmNWc41mB5JFZ55TuKAI3BBJ
	/ziWcGYAgPRjP+P6j7FnuXN8FyLu1/oiSxEx0n4LhpYYi79cJ54/V9az
X-Gm-Gg: Acq92OHzu6O92e9YZmSbZHJEWB+PJsDpVbiEgjvW31T6GL4LAxPAGkGfOV9ekpC0r9p
	QPp4cBp08gNAL9Zc2VgNc1tnYk8PPRKh6DLWbU4uZ11sw93Q5ab8wEWtBMU7+n+UUTGlqqEyykU
	a2yxfIoHWzVmg3KylYuo03qDcgOU1ONnK+0xRUiKVe/iRggpZpuMpLl2vbcyBz5LCQsnzsAHqRX
	OwQ3241KuhWdG/6h4r+mOKGgSn8sb+EO4tq7FsNTEf8Y3ISBxjmK5rt6XuW0q3f3c1Jph1bpPAb
	x2aOCnFeXUg6ikPC41mxPfUQ3HSZQrtuZ42bozl16pU/Fz7CK5FRdZUCR0X1uXKkPJsAX4p1JsI
	8bNK25bSm4bXHHCpdzaBT2v3mdVr/wWk6HOmQl2ywyz8TYC9xp2HpuuvATVL6LilBtjBGFIS9OX
	aauxL9z7isrvO7FsyCiBd25twu8SnxbESncnBWHsrwoyX8fpGbZ5mGYp7ugz7rdEUukpJ2CDbH
X-Received: by 2002:a05:7300:ec18:b0:2da:1874:f3bd with SMTP id 5a478bee46e88-30398618bccmr3483462eec.16.1778934218129;
        Sat, 16 May 2026 05:23:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bc8ddsm9268637eec.21.2026.05.16.05.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 05:23:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net>
Date: Sat, 16 May 2026 05:23:35 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stop false review statements
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 sashiko@lists.linux.dev, Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, kfree@google.com
References: <ad139e54-a7f0-4d09-832c-6b2bf2e93e03@kernel.org>
 <fcc4b719-2696-4f31-bac4-6c07f8ddec47@roeck-us.net>
 <221cc52e-9918-43ea-b196-622a8cc6db05@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <221cc52e-9918-43ea-b196-622a8cc6db05@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/26 05:16, Krzysztof Kozlowski wrote:
> On 16/05/2026 14:11, Guenter Roeck wrote:
>> On Sat, May 16, 2026 at 10:05:02AM +0200, Krzysztof Kozlowski wrote:
>>> What the hell is that:
>>>
>>> https://lore.kernel.org/all/20260515190707.033BDC2BCB0@smtp.kernel.org/
>>>
>>> As a bot you CANNOT MAKE a Reviewer's statement of oversight. You are
>>> not a damn human do be able to make such statement. You are a bot, a tool.
>>>
>>
>> Where exactly do the rules say that ? I seem to miss that.
>>
>> There is a policy document about _contributions_ made by AI, but I don't
>> see the one that says that AI agents must not provide Reviewed-by: tags.
> 
> Quotes from the existing policy:
> 
> 1. "By offering my Reviewed-by: tag, I state that:"
> 
> Tool cannot use first person "I". Tool cannot "state that".
> 
> 2. "A Reviewed-by tag is *a statement of opinion* that the patch is an
>   appropriate modification of the kernel without any remaining serious"
> 
> Tool cannot make a statement of opinion.
> 
> 3. "Any interested reviewer (who has done the work) can offer a
> Reviewed-by".
> 
> Tool is not a reviewer as a person, thus above does not grant the tool
> permission to offer a tag.
> 

I'd like to see that explicitly spelled out. Until then it is your opinion.

>>
>>> Stop faking tags.
>>>
>>> And really, considering how many false positives Sashiko produces, how
>>> poor review comments it gives, how many misleading comments, it's
>>> unacceptable to me to consider that a review.
>>>
>>> Amount of useless noise Sashiko produces already changed my mind how
>>> useful that tool is.
>>
>> We seem to have completely different experiences. Yes, it does produce
>> false positives, just like humans do. However, I have seen it find many
>> real bugs, including many in patches which already had Reviewed-by: tags
>> from (presumably) human reviewers.
> 
> Of course it finds bugs. But it also produces - roughly - 80-90% false
> positives, completely useless.
> 

Really ? The ones I have seen are - roughly, to use the same term - 80-90%
true positives. Maybe you should explicitly ask for no Sashiko reviews in
your scope of responsibility.

Thanks,
Guenter


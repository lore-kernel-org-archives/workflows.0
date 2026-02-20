Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706AE31771B
	for <workflows@vger.kernel.org>; Fri, 20 Feb 2026 17:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771607687; cv=none; b=Fd/p3iB9CdQQtZC7QVjZoze8fSRRCpo2AJJjpqIhsnCnAm4XO5A/aJpfm1HaWHb9h0Jz0OciX8vyTcl07/7uxh1Z/puj6ZRcC+/PgRd36tXcK6SFuAa6ZpH++JBxt4Bs1du6f9PrT5V9oGaY7alAy6C4kAAqhJ0W18RlDseo2RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771607687; c=relaxed/simple;
	bh=DvzLmmTmGIEXJipqMkyrOyMSJNYmtbbGvkQZzkrbQLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ibUBcIPXNCJd2p7lK+2yQQgtkAT6wVIJP7dTAvuNLTp+c9lcETscg1uzp1+4ACr53MJ8YFO5cqwevl3j1DjfneLUMonut2bFxiZ2fpt/8znjk2R5/sZ0T1wDaK076B0iQoUnluXjWJlfMJ/ze31C2XvuIikPz0suTWz/Of6Kxc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RwvMdCQz; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RwvMdCQz"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d4bc6a8021so1741220a34.3
        for <workflows@vger.kernel.org>; Fri, 20 Feb 2026 09:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771607682; x=1772212482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vsnV0KnS1YOp7VZb6auwm2tmyLKlmybBeSxb+5S1qS8=;
        b=RwvMdCQzusXt9GMuIO8Ahz71wgOSyNvILu5gDnhzjO8Gk+5jpZhHmDi5MX5E5rYEvZ
         /Uj9nnAkQPeL/Jarg7nQxReruWb4sop8znHko28FOvGoL680TfETdbliuobKXfQLWtFR
         OP4l8YjzAyAoY+oAwFItmEdO/ceLK/iG1PBmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771607682; x=1772212482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsnV0KnS1YOp7VZb6auwm2tmyLKlmybBeSxb+5S1qS8=;
        b=Zl3tL6HEl4JU9CFX7w9btMk/V7mwEV7bAAKJqoyeuoI/zeiwWbZiYvP/PL9//O6X57
         KYWzLGEWW0lwFSqdZAak41vikKur8M1QkTlyLeynjOaxPogde3DJwSnRJl0inOaTd/4x
         nqMlWh0J4f7BBdQ5DdUrBA61Eeo559YSnqpys6Hm73HVVkcL5/4NqO/gh/eGw80BfrSz
         lcF1flNuKehcBEbCsEkqOtq55LzPU8aOIyQDB2V9fR9TIZAZHKvECKTsAiLY9JNlsW+B
         BpdfXvQ6RfBDok7Hvzr4vssBQAwjl4FD6SHCkApbuhNNZtSZsld9lOrl29N8hZditZW0
         xMww==
X-Forwarded-Encrypted: i=1; AJvYcCXflI5xZKMilfJp+r161tTZwiWqJo+RPKUkUepi35a8TUi4XOYK2PHG1j065MLxkOkqIjQnVkfyf54=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaT+7EL9o4Q2DMDtYVASUgNgiHRbiuk1ARnS1Ev+7MWH5X0P3I
	YrrFDGBB297bQX2ykhBiCgUi1lcPQpA1LagxdZmITi6erNUI8xLv+hYLEiObPflRpVOv1enqa1D
	kWcU32hk=
X-Gm-Gg: AZuq6aJafxx2a+6cFvjxmns595X6IL4XkyCZ7ujKGyYb0FQid9tmjHVEzL9/B5e1TTG
	+/yMFWjTE+zFQcEgKfl4R15zG7Zki9rNf7Lk2CykD8M276oBVYyqNGEd94LEGZ+ZC/4ySkNWyER
	J2q9HjDGA/KCZPQwQaaouXDSPE9bAL0jF8HGZsncgIdGTJmvwK1f1II88wTODGfHra3oWoaWP85
	s/3ijf4WFHuSmdDiiY9ov8/FXBtg83e756VdyWjuf1y48jPFUY/Jo+dYmh6Fym9gWSXTbfsImTd
	5k1mnIApdiQgcx6AyCSCTQxfoZqUI30QLID/nST2WOmuNgzqGNaVxWvsc7yLr/2/59TVkmhHgLY
	AwqcP7Y2BNUnMdZw2zp4fuu/TQmqUrF2onCqI35GDbYvrPYr6KNCwPQWy1MpgFdT8eIrroaaN+C
	+Ky91AGzXS/fzudcHYxxIzE3tLq/XHT96gMQnwkZpRR2gkVw==
X-Received: by 2002:a05:6830:4407:b0:7d1:8e7c:c54 with SMTP id 46e09a7af769-7d52bf21ae0mr304350a34.21.1771607682225;
        Fri, 20 Feb 2026 09:14:42 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d0725dbsm23545a34.29.2026.02.20.09.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 09:14:41 -0800 (PST)
Message-ID: <20f492c5-4857-4d4a-95dc-3c694cd332fb@linuxfoundation.org>
Date: Fri, 20 Feb 2026 10:14:40 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-next: update maintainer info.
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260216060739.2791462-1-rdunlap@infradead.org>
 <20260216091648.7a6a0e3a@canb.auug.org.au>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260216091648.7a6a0e3a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/26 02:16, Stephen Rothwell wrote:
> Hi Randy,
> 
> On Sun, 15 Feb 2026 22:07:39 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Update the MAINTAINERS file and Documentation/process/2.Process.rst
>> with the current linux-next maintainer information.
>>
>> Translations of 2.Process.rst should also be updated.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>> Cc: workflows@vger.kernel.org
>> Cc: linux-doc@vger.kernel.org
>>
>>   Documentation/process/2.Process.rst |    2 +-
>>   MAINTAINERS                         |    1 -
>>   2 files changed, 1 insertion(+), 2 deletions(-)
>>
>> --- linux-next-20260213.orig/Documentation/process/2.Process.rst
>> +++ linux-next-20260213/Documentation/process/2.Process.rst
>> @@ -291,7 +291,7 @@ Use of the MMOTM tree is likely to be a
>>   there is a definite chance that it will not even compile.
>>   
>>   The primary tree for next-cycle patch merging is linux-next, maintained by
>> -Stephen Rothwell.  The linux-next tree is, by design, a snapshot of what
>> +Mark Brown.  The linux-next tree is, by design, a snapshot of what
>>   the mainline is expected to look like after the next merge window closes.
>>   Linux-next trees are announced on the linux-kernel and linux-next mailing
>>   lists when they are assembled; they can be downloaded from:
>> --- linux-next-20260213.orig/MAINTAINERS
>> +++ linux-next-20260213/MAINTAINERS
>> @@ -14749,7 +14749,6 @@ F:	Documentation/memory-barriers.txt
>>   F:	tools/memory-model/
>>   
>>   LINUX-NEXT TREE
>> -M:	Stephen Rothwell <sfr@canb.auug.org.au>
>>   M:	Mark Brown <broonie@kernel.org>
>>   L:	linux-next@vger.kernel.org
>>   S:	Supported
> 
> Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> Maybe update the CREDITS file?  ;-)

Thank you Stephen for shepherding linux-next all these years and
keeping us all sane. You will be missed. Good luck with your next
adventure.

thanks,
-- Shuah


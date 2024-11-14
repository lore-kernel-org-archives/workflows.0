Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B8CA95C
	for <workflows@vger.kernel.org>; Thu, 14 Nov 2024 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731596499; cv=none; b=PIIQMXsFKMTzC8TcFwaJbN4F0cF8ABwYr+SjpnUptPjjD7UfhNkKWE/gs3TgV/6sJ5VkqDKT6mGBDI4bpX0DnsS+akydromBINUca97kwIL3inqZiqlNhEDV4Ro14iyKOVtOr8M/mUkvlzk3GQLK10MVgyXFsYZZbtX9HswQzac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731596499; c=relaxed/simple;
	bh=4UUkiKmzly0OeVpf0QiuK3sDrCQWBp1r1pQik5CtFf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q38DU/JUOJeRAsDOZWSPruLh0IMxv53T3OYV5xgx27DFVaGeFs9jPxvLeMPBleyok/tMUgLS5P8C/RSFHGrL8fSDw2GpT6Ouf/LDbumSJqtNcWESFpIcT8nGCECarKvVuGKx+Vev25h0P+2Gnb4/6A7Ry+mYOP1Yo6BKfuwXO2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Zhei37XM; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Zhei37XM"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-83e2d80ad51so27375439f.3
        for <workflows@vger.kernel.org>; Thu, 14 Nov 2024 07:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731596496; x=1732201296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAlff9bmpTU+UEhgxHo5EEloRRnZ7M6S5z4oitiZMxo=;
        b=Zhei37XMYiGo+m9TsM2q1qBh1hrASgf/ZBvZvWNNx+xMM72FxlqF4ta1WLUBp+hiC5
         dqv/h3sO/6REkEbahCh9VFawILJsBHyw9EVIpN5ueRZzMIwEsAM/I5X5R8ysStspgvn1
         5AX1c08n9eMgXsUcU5oOafsLlbWA1rEgIVHSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731596496; x=1732201296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAlff9bmpTU+UEhgxHo5EEloRRnZ7M6S5z4oitiZMxo=;
        b=iiNbgqf5RQEWXPUIpKkk+4Xa8hSQiAm7uMdSOOoesKfUSJ56L/sAxRPKEdauEXSlAw
         1CKhiE5EY5QFVNqwySp0pcfKJPpjIdt3+LQS55D43aZEG/B0Y/H0SgrclUS/hfTZQaN8
         zycWRKyFpB44XDl6Ko8s/dSPopDIavsIoZhtCMZUkoQctpmcxvqWLmo1Vru2xG5dnMcT
         +w6kXLeZ5+70TQShKVOI/Mw3qdH9rCaqQ5aMl2mtt7HaLEJmTq5EId1KROw/iNSAiVHJ
         sNnTRk004b8bnwV9svWcwnyhNcnW8bfWrPllCHakoUxstistJ7zO5gKF9M4fRcCUc8sB
         9sfA==
X-Forwarded-Encrypted: i=1; AJvYcCU3p/gg650snY+c9Is8j1snUn9XBrSax2pLtW3B2qtUk/lzIkB4is17z3Y4vLAeOei5JO9R5bqXVv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxferBKIq3iJEaKV16da9TzfXwuLcG9+WXLM1ZcNWj3n6sqBJlp
	IwUdxJuEh5eI84SNemz3pQHvzrcKvtgR/KHDVJ6k7eDsv3syIz9HyIjL5F/MIWM=
X-Google-Smtp-Source: AGHT+IF6veRv5ZTb4rF/6xullZcNRh/vz8AAUc5kClqwB0uhF1UaGwjqPrPpEBqCto1g6VtSb44D0w==
X-Received: by 2002:a05:6602:641d:b0:83a:931a:13a0 with SMTP id ca18e2360f4ac-83e032e0050mr2695903639f.8.1731596496579;
        Thu, 14 Nov 2024 07:01:36 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e02fc667fcsm302006173.62.2024.11.14.07.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 07:01:35 -0800 (PST)
Message-ID: <2dafc0bb-4dee-4c7e-91b0-01fa66a822aa@linuxfoundation.org>
Date: Thu, 14 Nov 2024 08:01:34 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation/CoC: spell out enforcement for
 unacceptable behaviors
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, daniel@ffwll.ch, laurent.pinchart@ideasonboard.com,
 broonie@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Dan Williams
 <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241113232557.29854-1-skhan@linuxfoundation.org>
 <5rkn65qu2i3kz72hxbmcg25mrq5ehmb4y6xia2p3k4naiogi44@rcaoz3xnqlcf>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <5rkn65qu2i3kz72hxbmcg25mrq5ehmb4y6xia2p3k4naiogi44@rcaoz3xnqlcf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/24 07:38, Konstantin Ryabitsev wrote:
> On Wed, Nov 13, 2024 at 04:25:57PM -0700, Shuah Khan wrote:
>> +The scope of the ban for a period of time could include:
>> +
>> +    a. denying patch contributions and pull requests
>> +    b. pausing collaboration with the violator by ignoring their
>> +       contributions and/or blocking their email account(s)
>> +    c. blocking their access to kernel.org accounts and mailing lists
> 
> Can we change this to:
> 
>      c. restricting their ability to communicate via kernel.org platforms,
>         such as mailing lists and social media sites
> 
> It makes more sense to phrase it this way, because it's really the
> communication that is the focus of this policy, not general access like git,
> patchwork, etc.
> 

Thank you Konstantin. Correct. The intent is to restrict communication.
The way you phrased it makes perfect sense. I will make the change.

thanks,
-- Shuah


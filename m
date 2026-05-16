Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0753364042
	for <workflows@vger.kernel.org>; Sat, 16 May 2026 19:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778959532; cv=none; b=koudv2RVIz7kS8eClEwYvzSwPaEePPZJlPNwqrOe8fk1IwUhFVw3KdTpd59m1ZQylg8I97LsI+AamuEGu54/0Rl3GhlH1urLS2ydRhZy/steZwXSCBFOSr5JLGIhPcwl4sx8R7hx7BYw4EJp8j4cYqRTSPQQded9C6ou2nKDsAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778959532; c=relaxed/simple;
	bh=egB9c96iQ8I2rADNx2KgerAOYNhDFlCBqRnjnpDJJts=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GRgaVD4qqKEiWsdKMkV++HaXQeinlfLuFNQEyFH0bn4u932wN6o4xaw3XqHkklOXZkpfpuRFfT7ze15YFyHOKq+vGfUfsoXiflBXnTfuqkNCx0td5SaeWX+9cHicKRZigrx+HMTz4mB5UiZX/ayfiVi9cC6Y3IyPE9F61Ve1+Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVo5+seD; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVo5+seD"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so423689b3a.1
        for <workflows@vger.kernel.org>; Sat, 16 May 2026 12:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778959530; x=1779564330; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qDDCo4VLFxe+GYF4Abu/TOXNjEfOWoKqyK6dTWXD39E=;
        b=XVo5+seDMWDgp6b/C8X8lLHQ7/oSBAAKBK9ZGQ2xCv5bJIjcVdddToPmi3BUWdzG5k
         4F9DK9oeAKy/gYmfVd1OxRP/MA3TWEM4WTI4rJ80GoklUanIfYKvQjwKpaJt5g+hjRIE
         yyk/kYrRVHTKmsC7jCZoptq5BoRNdjXCD0e0t7wTd4cdXNLbEPt2tWNdvB3YdyJ4wR3/
         LO2X/dKZMUuoEuusrYPgTEdyeq0niuZlhRXxi7zSdRttYDUBqiaNnHY3f+sAVqNmWb+l
         9tc1uB/vSTxb9Fo1cc4RJ4W0E5l/N09XotuPTp+vNklC/K2HbXgRxJDXdHHHqjl5x705
         MZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778959530; x=1779564330;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qDDCo4VLFxe+GYF4Abu/TOXNjEfOWoKqyK6dTWXD39E=;
        b=Le5jPvgAHg0qk5akC6Fim+7KS4LSXvkpIpo0SMTC5qcwN2finfr6ojzX9BbepBfUYQ
         KiAGmaaMleK6s/BblWOcANNYmIu5fQhhDX6KxzTuUZm6FMWiKoRtvuBqmR7tEDr81hTj
         S8Kh2Mko6027MZ5iojslF5RVZjUwRrnk8RJUjzzb110Xv9TtDen+oAopG8y+eje+Ez7e
         SuMsd81U61OiNnAZUDyhTeI+JkkWfEYJ3w8vwY+I5u7OQw5j3L1eUZw6J7npp/9DXmYT
         rGoaU1fOThFp/7v5og3I3vPwkzwEU/add+rga3YMglVlxHZjbn3EioOol3oiXZlEQ2H4
         JRsw==
X-Forwarded-Encrypted: i=1; AFNElJ8YP1LOz7sWK9f+r/jDkYp9b/uGHDQ9gjJ3c8DCGTHFsHCjJpPKnRtFpcWTKIvNVUARqMQ8wQUrgD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeZJw1wntkU3rEYWNA6rmJPfDjlcn2wKT0Vx6rTg6lL53MmdGF
	wHylfB1lsXcdrsbvDVCG08vN2gd1TEYfsyV+HI7JlIfMwHcaNb8Fin1K
X-Gm-Gg: Acq92OHNlRcdzsXEAXZpvoKfoljD7IL7aocrdTLY8w7Ey0iiB7xuampdMBHGzBfTSrI
	yM/3b8/ipfdYV0s7LV5MfA+BdKZd31+NCTl+qJZ2TLwvd8WBbJAOO+vXYD57W6vMr1lqUiAwSlM
	Ojv4EiOiaw8YZVrWDMinY07Ec74nrupLwrnjd505KXfbLu9imlkd+UURE52Q3PyhTMcORW2TITL
	Bkl8ZojlTXXmxc9O38LuB6LvBz8BnjfNt55TFR3+ZC+2k5NM+O5g+U2kWoHEn1x6Z6SG0ugZiOX
	BiGGd3pPX1MAOW4v73FdWdd2hy08129g/52EEAe3ryy3oMIA24Q/wtCdvXl5uojBJ+lLRhdXE07
	oKpYVRsUKrZXp0fQVLhr9/eQ0ISo4cLjZPUJU2exzW6lNzV/tGNj714/6E62rdrUkbWT9n6Fm+S
	axDRWjrMHf6qOv8R/Y1Wii9D39jQddxCXe1S0oml4a9S8MPrM7v020ms9o6SDNzB55pFDRBLsnl
	CAm9RDHR8g=
X-Received: by 2002:a05:6a00:17a9:b0:835:4291:6975 with SMTP id d2e1a72fcca58-83f33d82ffcmr9836058b3a.39.1778959529890;
        Sat, 16 May 2026 12:25:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664712sm9872455b3a.12.2026.05.16.12.25.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 12:25:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <35412149-282f-4272-ba47-136caeeb5c1b@roeck-us.net>
Date: Sat, 16 May 2026 12:25:28 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stop false review statements
From: Guenter Roeck <linux@roeck-us.net>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <mricon@kernel.org>, sashiko-bot@kernel.org,
 sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev,
 Linux Kernel Workflows <workflows@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 devicetree@vger.kernel.org, kfree@google.com
References: <efc4d394-b328-4ccf-8c05-b6470ee4b88d@kernel.org>
 <70C5331E-06F1-48D5-A6BA-0CD130B69A45@linux.dev>
 <b5989c0f-90da-42cc-a623-3b60df077848@kernel.org>
 <dd37929b-ff90-4567-930a-26db01d85950@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <dd37929b-ff90-4567-930a-26db01d85950@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/16/26 12:13, Guenter Roeck wrote:
> On 5/16/26 12:00, Krzysztof Kozlowski wrote:
> ...
> 
>>> It’s opt-in on per-subsystem basis, as well as all other email-related features.
>>> I do rely on corresponding maintainers to decide if they want it or not.
>>
>> The trouble is that subsystem is mailing list, thus I still got all of
>> them via b4, which is used to get the discussion.
>>
>> Send them only to the maintainer, for example. Or maintainer + authors.
>>
> 
> For hwmon and watchdog I most definitely want the response sent to the
> mailing list and to the patch author. That was the original configuration
> for hwmon. Roman took it out because people who were copied on the
> original patch complained that they did _not_ get Sashiko's reply.

Actually, turns out he didn't, he just moved it.

However, it turns out that Rob added krzk+dt@kernel.org as explicit
Cc: target for the devicetree subsystem. I would suggest to drop that.

Thanks,
Guenter


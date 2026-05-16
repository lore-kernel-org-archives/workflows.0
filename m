Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257B22DFF3F
	for <workflows@vger.kernel.org>; Sat, 16 May 2026 19:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958792; cv=none; b=H6HIV0JhJBkxeaPVI626I+mGIdIPRhFd26XHIjs/nhApVtRHEe4FJGPIq8U+kBkyxQSd8BEV5wOk8M9tUkbJNEGjj+Mk7xSkSzayHYb5molcKFyz3C+uoYbtgnb2nm6CpjRUNlat7nByqPxF1xOt4UCcICo+vqVHnsvKjHryf0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958792; c=relaxed/simple;
	bh=N9yPufDLoIJwHY1WRwsBi6vcmRB93huWJb5OKBZaQDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ePlIgtp7q9szuuypLrXBKUdLsELFMEB6hqQvGVjB0HWBhvKqX643cWEQcGsIQx95xnZ5as/nHzrzzw4vDOTVdqF54iG1HQiSXn2JQkiGyirFz3P35V4yQVP7lxYov1d4nMFLmxABAEYcUVPEE43187HDHAozRjCQETUIszKYjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MifuR9Sn; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MifuR9Sn"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8367df48711so387597b3a.1
        for <workflows@vger.kernel.org>; Sat, 16 May 2026 12:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778958790; x=1779563590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lh2VGoVOeoYSqwg877eUtdLNDz3Sgarf8cnJ8gkLPRY=;
        b=MifuR9SnBmnfUX5dpLX+SijRj1f4VSe1dIcshlJnsRwmXNrQ4pa2Vz2R3hUFqDDDOq
         Pvrt2D72W8Py7BLpoO8eGs8TlnP+62oQlHq98d27bA7h802/lCSeIC7toYs8qzCSH6pA
         bYK7fS6A3X2WU+xDLhXdfp0BDhZa0m+n/qf6vv9UkarEHEYwAITZnEifRlMoVKO6R5NI
         ox3CLMK7nD6HJEM6/p3BZCeq53RVIN/xGdusDFIE1vlcIZ0Zh0Wta0E4sZJN20ZfqvV6
         1zccRmdFiWKeplFYh/XXEQoWPsI4pK+qksV+Go1lQslo2e6V/xEJqeSJV31phAP3jwEZ
         XLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778958790; x=1779563590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lh2VGoVOeoYSqwg877eUtdLNDz3Sgarf8cnJ8gkLPRY=;
        b=EF1joqnzM842WwidCmGKtxJAXp2RHXQNzQQc6QYwMz9yam8Cy7pbeHOyLMKta25vOl
         3jlOWlQLL0htLxDS150nM5A2PBB/VnOIQGWuFmEg9CeDQdYdxozhFdHaNydkRZZ1L7wL
         wPsu0Jj+Wk3kS9wHD15hglHrL1b+hzYULa0YaGH/SZ0T4zMw+7nHYSlm7joQ7YqRhcSL
         lv9TMLGYyWdHABSPIL2aA/beoEAJuWiOPq1I+oZt2EiLgFEXDGHlDZql6A/hsiAZH7YN
         +WfgrtAaryB4MFefMtYlMXVFFNXFfv3Acj1efreecaFR1EIGrt3IL4JbSF8VhwNEdT/5
         Vw5g==
X-Forwarded-Encrypted: i=1; AFNElJ/gT6pZoPM/cN+DbGac1eBOf34GNlwtDRbXq/BIbggNq+3kIoJavFl2PFtqNvsP+O5khFwA9IgfeQs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx99irNnajtvC+z+c3NXCZbDHqKTlV/SX6f8x8picjZHryr272/
	AonBX4SMAyp9OnY9VYeasJSkjg4XE9m1zqZh227XfwwjqL53pkg4ZbQd
X-Gm-Gg: Acq92OEzshFe6eFEFpDcTaScJn33PEUf/lKcwFGVBRBEvxnqLQv908JPI7G2XuTJ75V
	oydb5+d2VljTxQi4bqmls+qmDFK+5/x3OAY/5hrrUlDXlsY4BizNNn9WVmFvePkKvzAKgmLAeIk
	9cps67RQ7UkE0cglq+QKVLvOHLtFa6+6Hojepyt389t8/rNPiJkPretZJOcNRQ+Z2bKvcABuR4W
	5/sAbl9EkrOMp0YV0d3nx26e9ftZbf7MOZCjPaoAlbO4VCuCvsBsX5VtjoC5nJLiEgoevSSlfP1
	HfGeyuc4s/JzdJqS9/XR2+9/QnfHwonFjBcjNaYXMDb5aOQuxzEBuHQBOAupJ7vV7PgiSdYRHZO
	HfzOXz65C1die/izGqDXEiqY/ofZkzA749vNfxCVPymQwdes1if6oOFLne4jSspds0Ci5oi8cc4
	Nv8MR6ZiS30omvrNDeR60K4Xi0sCJEayRN7+Preg2WTI0slfKi3C/79NKIQB8oK78UWtfXg/02
X-Received: by 2002:a05:6a00:ad87:b0:837:d746:8e1a with SMTP id d2e1a72fcca58-83f33ce695amr9482154b3a.22.1778958790321;
        Sat, 16 May 2026 12:13:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b296sm8904946b3a.32.2026.05.16.12.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 12:13:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dd37929b-ff90-4567-930a-26db01d85950@roeck-us.net>
Date: Sat, 16 May 2026 12:13:08 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stop false review statements
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <b5989c0f-90da-42cc-a623-3b60df077848@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/16/26 12:00, Krzysztof Kozlowski wrote:
...

>> It’s opt-in on per-subsystem basis, as well as all other email-related features.
>> I do rely on corresponding maintainers to decide if they want it or not.
> 
> The trouble is that subsystem is mailing list, thus I still got all of
> them via b4, which is used to get the discussion.
> 
> Send them only to the maintainer, for example. Or maintainer + authors.
> 

For hwmon and watchdog I most definitely want the response sent to the
mailing list and to the patch author. That was the original configuration
for hwmon. Roman took it out because people who were copied on the
original patch complained that they did _not_ get Sashiko's reply.
That is a perfect lose-lose situation.

Guenter


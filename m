Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0CF221F1A
	for <workflows@vger.kernel.org>; Thu, 18 Sep 2025 03:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758166630; cv=none; b=So3LehlYEWzooNc9Nmorj+ehVsiryDe3fO9pHzD7jqlgzaqCLYAao5I/ZupZbVQW6uvcwqnYVZIfEnhjPZN+Sp2ldUr3LfCF72KvSe//ltJWdeFb1KKeTVLKXov1jgoOAU43g6M4EN1Uk1Q6yiUxbEK4jz8WXohgEMunMiVol2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758166630; c=relaxed/simple;
	bh=9C03DLqVam0PMQ5zQvKRtpPgWSCbOXBvesI9otPqIac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYtwlZjf8fIXz/unM5KXWGBmRuV9Nzi+kx9B7LdcT/S9XDRBPmgrBu+lJPdaNbT8owuj+qM6uA8UD2A2+1P/wEmfZHTI+n2JLy+z7s8+HwBND8rh1rzAP8kxLgagDP2yMaygT4lAWItebhTiw1AzpgA/c0edRegV/x0LT6zV9pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyjaCCFM; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyjaCCFM"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7761e1fc3faso530682b3a.1
        for <workflows@vger.kernel.org>; Wed, 17 Sep 2025 20:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758166629; x=1758771429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TF674HGcYaIoheg5UicmzGQj1rC1+tAHApzvaBkmnHM=;
        b=CyjaCCFMsSJQmxy/dvAow5LCxNX0QHDQWHwnhas9bpGq0V7QLitd4KUuYcRhMNBciD
         1Yu6ZKVsRHbORzRWl4hpJ0y23ZhC80kG1w3t32EAZ+023KjvoiCyarOpjGDdq9q98mCt
         hrxQN+DmlbXmIm3LAu3e+IilSgCi2jJQEPNgSOaWLLYR5w7F113r0Rryfu2TOwWv5oTO
         3eUQp7e0GqD3GxEdj6vRxulMbYFZrEpUxwyw92uwZ6+JmUjceFzfXrcW6L85y3z/qmSU
         EshjnhiCr7vPjEpsYwwcb5R7syTMVDMjqWPYcxK7lXCmfe24J64jlfCaGpRoovMMQVXi
         Hcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758166629; x=1758771429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TF674HGcYaIoheg5UicmzGQj1rC1+tAHApzvaBkmnHM=;
        b=wTHcc5uoqwV88aZVkoSbq+R0YkR8t7120CFCV+rsFcxeka1gkCPIh2EW8Ttdm6tOwd
         AJccoifDwjREHvTvn1KBZgXP/SyNVZ8HqXlxS99XSP09dpxztmPJZ+5EsAksMC3PCKPP
         UDW+ITlY+PQVceYpVuqzkZpInMvlhQSJnOKe0EgxXwiuI4hWHS4wHxGa+BtczKApRmTf
         Oz9mZqf3ytL+WS7Sgrzu+oVc7SaajYdrLwQ5MsfxOqheK6mcbZouI+xRmGpnvfBDBYrI
         /B1LX4aIP2KiBLegdLJH1ehUm+APeiQfCn1mtsM8XPW+L91GtnOiq+TufonQp2J2gUOo
         3Jtw==
X-Forwarded-Encrypted: i=1; AJvYcCUB5Juunhq1nwBcXBR2ghwFJFD4zq+b1xh6JruFOVHUUlbWXj3Jd6SjUPknT1FTtnTECqoUcxkLKAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyokMzOKt4caHisffriqr8HueOLTFhTrRS4BOc48iTjBTiPF5aF
	jH/PFHeItEpG+sj4bFd+aJ7gVxR+xa0IFp4Dazfl7Toq8q563xLkB/sl
X-Gm-Gg: ASbGncshkLjS5Q9ePzgGiCqwdErr2bAXdP8LVh8yIgkKOde3VYKBgUJQz5R2Mkjd9YK
	7NREdCkw/5eCqpHxD5zdVGm26moMWV9d4si/5eQwn4+05DBMEoAPWJU9H4e7Glw1jywOTmrrCW0
	wVm0EKFQzjfj2i0T5zyl5USbUhSfsBgHN3FfhdPsG7FqaM0oiyhUjUoQGTRH4MpbC+ezjep9a5T
	k2ychwx8XDhUDHG7IULUBsDoUyExbEwhf9hBl4KhW0imvQE28IL1R2PD+IOdcyM/VMfVW6+ZMk7
	cL9IUUAmaOzO0jWqqXxMfR7i/JdNZcJ+6EgW/Pmz9IjuF2BI4/yGbIpSeU1e30bzkgVmzz9DLDx
	bfVhW2ulyz/Qs6GrC5CxAw1/5akjZyTcCGDwiwtpVBJDC3JxE
X-Google-Smtp-Source: AGHT+IFwCt9Dk2w/Kc41woD7GbmfS0MNDCknMwgPCNYn1sxPeLrZNLvTpZDQKV7/BLybgiTCHSJJ1g==
X-Received: by 2002:a05:6a00:2d9b:b0:772:6493:7e67 with SMTP id d2e1a72fcca58-77bf75ba331mr4842784b3a.3.1758166628542;
        Wed, 17 Sep 2025 20:37:08 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfe75ef24sm873845b3a.55.2025.09.17.20.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 20:37:07 -0700 (PDT)
Message-ID: <2b00ff29-fd35-42fe-83d9-73811356b73e@gmail.com>
Date: Thu, 18 Sep 2025 10:37:05 +0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: process: Do not hardcode kernel major
 version number
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
Cc: Dante Strock <dantestrock@hotmail.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20250913015147.9544-1-bagasdotme@gmail.com>
 <87tt12e5zf.fsf@trenco.lwn.net>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <87tt12e5zf.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/25 23:07, Jonathan Corbet wrote:
> I have to admit that I'm not at all convinced that this change brings
> clarity to the document; using real numbers grounds the text in a way
> that "a.x" does not.
> 
> If we really think it's embarrassing to still say "5.whatever" here,
> perhaps we should just change it to "9.whatever" and be good for a long
> time?
> 

I think that's a good alternative idea.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

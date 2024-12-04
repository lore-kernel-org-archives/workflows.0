Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A53E746E
	for <workflows@vger.kernel.org>; Wed,  4 Dec 2024 01:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733274420; cv=none; b=YzRP765KRwDVXUPJ/BqgMqOE+4mjCLcfj/4vaDEoI9DviX71rUpv5k6D/5iNFO6AdL5VF+au1Y4o/feBJOIJkr6eKLW287CncwcEqLmk6lO5Ez6Xt8l/u4Z4Cs2FnX+m/JfzKRlzvExjQ/RxIICrBBeYfOzlm4U6KuRLNNci5cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733274420; c=relaxed/simple;
	bh=MC7AljCRogbPP7nv98cOsHc26oZBN/K1ecZLTmoeVsw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dODCCeOej9WFV03yPyEd+A5XsiQcRUN0rGrPEWv562QlITGjOiYYnTHh90ks9WEbsH75cc603B3I+JY4YBuiEYuGoggrwaCgj9KhvUWlAWp+jW2uSlJyc070Wj2aICxKx7vda69Kmm6/AAhnPzPhf2tgZ13KGQWRDfqygjCPVFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B05DU6Hq; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B05DU6Hq"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a777c67c45so1413285ab.1
        for <workflows@vger.kernel.org>; Tue, 03 Dec 2024 17:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733274418; x=1733879218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B+Jz/Q6nlrwZViX03mS36dj9lZ7L1D6LvW4jUlY+Okc=;
        b=B05DU6HqnqBBJLf6glsXGpUEC92uhrH7rTNlFwJfRapv3NrWeod43g/BUjrNg84P8a
         UwKM2humEP6TCRRRxAvyhDzeVMAApYgs4PWYps3vEjcATqARIqJEZgKYMw40wMz9IRqC
         0NX4n20/MnnErBNMyKCu01gLZag2vVDpdF/xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733274418; x=1733879218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B+Jz/Q6nlrwZViX03mS36dj9lZ7L1D6LvW4jUlY+Okc=;
        b=HJfwg0MQKETTICJrh9fqlJS/2WGscwLmXz49VMpmJ+nk8MMxHUfYma2r7GXWgZDD7t
         +cyEnNRS6JBAhUFW/YkzNd2yaIJkJJVkYcWyDm51BL5+lc4D6GxXE/HVyJN98e6GNaB/
         eygxAj07x/u8zcjfY46UspdglUx1fWJkbMmYHFAPiIMsCsT1DviZiiCA5elDZ7ulyAPG
         hlKwm8FnCOwB2x78HU3/loouDaqSQoqECeJWF7I1j39Hj1P8LtuVBcfvoCpI/GkgVEJU
         U5vFk0om0WJe0F1XbHmFauFtmCd24NCfzB37FlI0i9fULPISYD8OJ5OpKZvetXN+MmvT
         eSKQ==
X-Gm-Message-State: AOJu0YwSKYDGYhTrNoqaKuvBYB0cse1phLuC/MiuA0rqA3cRMkssdWsy
	7URS73fv3eibv2gudGq7mgvBjvTw3ZhlXKqjucfl3R/3x7l8vSZzetrJ0o2oMik=
X-Gm-Gg: ASbGncueC/+XbeqhbwUL2d+/7IpbmuehszaXqh3DtMhJ+KZjPzl59uC7AixRyZ0N4eF
	4q/BilMcsxNNRtz10YGRq06ND3jGvY/h74faSFbjgK8Lzbb2K8IwNBAsS3xG3R5HKbF82FSr/Lr
	3Yvn8wKwISiK5BnOVAfzZUvELAObkdSax0mGRcG5+M6HW26gp7UsN+OqITNfa9PtqzPq7o0AXEf
	z/4yqOPhoe9X/APyjObrC+z1C2CoppmHIeabY5HEL5TiGiPw8PF7LYPcjmUMA==
X-Google-Smtp-Source: AGHT+IFF+W8l62dy02x+rstW26StonwY7Oe2+iYejLd+cAhPUZAboveR614K5+yughF75bXFV6i5tQ==
X-Received: by 2002:a05:6e02:1c2a:b0:3a7:ea2e:3992 with SMTP id e9e14a558f8ab-3a7ea2e3b09mr117670445ab.3.1733274417755;
        Tue, 03 Dec 2024 17:06:57 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e230da8ea7sm2809030173.32.2024.12.03.17.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 17:06:56 -0800 (PST)
Message-ID: <e6b160f0-88f8-415a-9734-2ba659619688@linuxfoundation.org>
Date: Tue, 3 Dec 2024 18:06:55 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 DONOTMERGE] docs: clarify rules wrt tagging other
 people
To: Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <c29ef5fa12e37c3a289e46d4442b069af94e5b05.1733127212.git.linux@leemhuis.info>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <c29ef5fa12e37c3a289e46d4442b069af94e5b05.1733127212.git.linux@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/24 01:14, Thorsten Leemhuis wrote:
> Point out that explicit permission is usually needed to tag other people
> in changes, but mention that implicit permission can be sufficient in
> certain cases. This fixes slight inconsistencies between Reported-by:
> and Suggested-by: and makes the usage more intuitive.
> 
> While at it, explicitly mention the dangers of our bugzilla instance, as
> it makes it easy to forget that email addresses visible there are only
> shown to logged-in users.
> 
> The latter is not a theoretical issue, as one maintainer mentioned that
> his employer received a EU GDPR (general data protection regulation)

Thank you for taking care of this.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah




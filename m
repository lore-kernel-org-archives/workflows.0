Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9A833A9C6
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 10:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773139316; cv=none; b=YPjfRJ4tYmlSewoxdrAiWcvEWnVlf7rO0h7gHUJCAWhewHbNymeH2YaRWtHEom2uoQDO7RWKft9UKLjmqMi5nvDNDwGlQwTF/O2bFc/2bKXSnsWL2nCDliNoO1abMuH5JfqmqAFmu0bli2dAzPAhbBSb/R0ddLHSIwFUujI2WrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773139316; c=relaxed/simple;
	bh=QA1KxxMMSDcF1osqCY7OifS10a0/MyqaHCxWf/Q2srg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=q229sRwJWqYPPlF63/VApb/rhSwWrwEz7Im5nTgZH2i18NQDKaHJCWCAh9EyGk9QdhAJKDjNa98qG5601ZMwANAaC0yjM+XYamuhqmwZZHnjKEc5sTRa2R1sD1efdYLNPrMrw04MN0WfXu4HV7ChTkZHN5zW0BsRT62XMTf5glc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbi97rGZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbi97rGZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2adff872068so60859245ad.1
        for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 03:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773139315; x=1773744115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frBGuYI2ZRQ70uJZPkAOGdR6b+Ml9G7t7E4rd2AiaK4=;
        b=nbi97rGZ8xGr9oDZAFKH8CAwptGH0DwNIjnF/Pv6pVDdv1HHBQDfQUT9zOTuicFx+E
         8wqKRk7tjcoUDPsN9eyA6VCZQZrZNSaATRnoG96r1IJKW9jnta5S6z+8/BVxiNQ75FmQ
         iSY1PSXNNoQwS2r7r1YzZJFb11BCZ2Mo8eKe+rdWUp5rHnlKt5CI2bB+/uhNyvBVL2eZ
         /GJPkHPx79oRYGl/SYj3QdvU+WP36oAO21iHPJIKm0YGEoQl7yeTAYGYNLHO8g/MOphS
         +wk3TUXoPGBA+0aOkSkAC63FoLOR3ij0QGFYB506HfPPKXAaDgxvSGl1tef7Nm74HJ7e
         KrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773139315; x=1773744115;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frBGuYI2ZRQ70uJZPkAOGdR6b+Ml9G7t7E4rd2AiaK4=;
        b=B1/dC6PNjHGJYu7gS0XGD3dcz0/Jlojsg4+fiA78hoeTOebuePr5ldlvysInjkp9OL
         nbVW1yig+jg8ge8U2xb9QaOPrYw+0yqeyO2R6Z27qYi5+arB9Jnp1W+TGJIVZ7/QlPmZ
         KG2eRCQOHC9u+RrhXMboq2RWBq47n3tOZKtnsFssAh9Tzm3AYg/Ec11YE7qWqWt9E2I8
         yfuk8aIpWYgBDtXs9ZLW5So3xKCG42tYZhAYF5G0kseNyrot8mJ6n8Mf5tZyYBr+Cr7s
         sF4H8FbffErylGsWoVxm0XmfnovY2fsrLe3eb5pppyJw2GoYeVDSmIxAA28QpsrbCJqP
         pkKg==
X-Forwarded-Encrypted: i=1; AJvYcCVsvv8GOjSjo6rrfwNkxYQOA3zHw/tUy3sW0SW8oxtwkQHg/mPS3+QLZoBv0d2SQJi6DKgJLJvWzi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuURZpSDgynGa1DT6MATdxUJPKPlmpocEQvsGXZjhdTnW1XTi3
	ISgjj5Rlu/2hY+R5r5HSz1n7I8ETq6l6r7O4idl0nulpiElFyYuXSj8v
X-Gm-Gg: ATEYQzx/q93hNCz4vIXmeymxRbZpO4QBL0iV72MDRt8Nbg6wD/W5der3PKdVI+3DVKB
	LcAfzPIa4crqCT+yfqygCCG0+04YJ/rmG8tLd2qOvtZu24VzP8qTzzJIKxr9e4AwBSeXTJB5qJO
	dsLeFN2kUCxLgsDLrN6oBocxQ2XqMcwoUT1oUFQF88E5j6+PK/fo4c81E6/NiRzB8RYgllXV1AY
	d/YYl/RCv4A2d/ep5auIAhf18lanX2orjUVMnHbPWC87QafIWFQmYLsnwgShguFwmPpmHkcnitm
	MuNsWcI0fVXuieaTraUXkb+Y5bkkpdq4heHJRLqJXx3wdsM75JrLrm6hl5T87FbB1wime8Thg1R
	0m1GEdrCjITYvGLu593XFrC6M2qQKxCYWw04vOFeg4z7x7ksru4OsyuCuh+pOLz2IjiPfVckZB+
	LK6x2T5jB+qbt9Fv/huF9Z+T4snkkwCm4bPCKBxjrvUoDJ9AWudCCqi+Cw+qiQYjeBU920
X-Received: by 2002:a17:903:2ece:b0:2ae:481a:360c with SMTP id d9443c01a7336-2ae8249d900mr133332465ad.54.1773139314873;
        Tue, 10 Mar 2026 03:41:54 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840adb42sm196676345ad.81.2026.03.10.03.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:41:54 -0700 (PDT)
Message-ID: <793c8771-83ab-4e6b-811d-41fd54b78e3a@gmail.com>
Date: Tue, 10 Mar 2026 19:41:53 +0900
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: julia.lawall@inria.fr
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org
References: <7db99952-d1ef-7148-4c8f-1e6ae8f0d875@inria.fr>
Subject: Re: [cocci] [PATCH] coccinelle: update Coccinelle URL
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <7db99952-d1ef-7148-4c8f-1e6ae8f0d875@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[removed most CCs]

Hi Julia,

> On Tue, 10 Mar 2026, Julia Lawall wrote:
> 
>> The LIP6 URL no longer functions.
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>>
>> ---
>>
>> I used the UTF-8 encoding for the email.
>> Let me know if this was not the right choice.
> 
> OK, this doesn't look good.  Sorry for the noise.  What is the proper
> encoding?

Encoding itself looks good, but your patch has this in its header:

    MIME-Version: 1.0
    Content-Type: text/plain; charset=y
    Content-Transfer-Encoding: 8bit

, which should look like:

    MIME-Version: 1.0
    Content-Type: text/plain; charset=UTF-8
    Content-Transfer-Encoding: 8bit

Didn't you say "y" to git-send-email's prompt of ...[UTF-8] ?

Thanks, Akira

> 
> thanks,
> julia

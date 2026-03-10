Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23AE3B27C4
	for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 12:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773144736; cv=none; b=I/Yodj0Z1uJJm+nsnGt1zy9Ul0gXasA/I2NTZgopI2QmzmT7Soo++AyF5esPUzd2/60nOVpD2cx6lxH6nxczxOrICx4KQiSSd/DPkfJBPSFi4OujVbt3j3ruEYWnhdLBNlyIW89GHtoXeMp0FBp9BZOslRSSVUyOcwRHYrDRfqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773144736; c=relaxed/simple;
	bh=0ftKGsefno8hkyECfDZZdBh2ORhyT6Actio3coB+55w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dsG7g3N6BzM81pHYQA2bKMQxEHC9ODI4eKMcNesX4osiVSWOavJQhhlERDuzush5UYxUmnpidSAsmbyhnE1R0NJv+wTAuUisXPiondYD+FzxpTInvJr6RQRfAX6Gxp1zHFUG+l1gyBX1Cb+q6YEqDop+eiCrZxdEveajxpZOXMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFTjnA7P; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFTjnA7P"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad617d5b80so86081755ad.1
        for <workflows@vger.kernel.org>; Tue, 10 Mar 2026 05:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773144734; x=1773749534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9XX8ddarU3vfGaDSorcd4YuuArxCsCdoexFVSxb2qr0=;
        b=hFTjnA7P9hnRyLwt0gwggbN/iSxNB780ABj9R7UnbMG3JBCgZpIDJ8G/zHAGx1M8i3
         leMTB5ibEs1v146kksJzAyWan3GTM3jPS4Z/0B8CcsYmTcd0+KDpNlfO5MeCyTUkqhNG
         jZEzXsdBJhMuP3f42ZFsD+Ytd9sqG5GzBoIgUGrWNSydy/vYolvhKuwq6tIl2ohKm5KT
         jdg3my5X7csEwy3XQ+oeai5iBWV7Vb73qwlvj1XpXwb8yCV8vOYrnG3Tr/tIgKu1CgTd
         DklGJgWaCzUllNYphlycyYluUthRSCXvFG5zGTZtkg+rv/24eWqLRktwXnPYiP8OWaS7
         LGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773144734; x=1773749534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XX8ddarU3vfGaDSorcd4YuuArxCsCdoexFVSxb2qr0=;
        b=h1La7gGXtXpVqqqOMcbGdd9avhvGxI6EQB0taAvrpSchcRwiekUqXAAxMmlfpXs7ED
         n4CAgyuFBc227JrbdhU6UIjPJi5mTTVJCjEWC//iA8DMyJXtPQQwSf8WLsgttjSwh1s9
         I0QnsdBvcAuJeFe4fAEoeevsJuVnGh+wzYkC1DGMzS4RIaGFQKRDMSY9e6+igDE7fCNo
         E7eRA94Eis4wj5by9lukzmstKeoDfZzmuxVSv8Fhl/1b0/+0JYzDqyCeB+SiFWciU7LU
         X9H3DWrZMFlqdtR8/9xknubflWZhRwnHoOoKZ/R13twY7upAYxmF/b7+22fjwJkq4ZWB
         1xOA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Ryu6IYp6gjDjd637OyYdK+ADm+LAtsTK+vCT37Dyd3H6nSrNtGKLDGv7QE5WDPQ3glD5BNywBCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGJ7lzPSbNy6DRDcthhCLDtx0eq2yDmaAtY4rv5UpHAECidVA
	+RTzTdT2v6CMuzSIpi9g7hcjVcjW0Mod8tfooEPD+d0xUZKaJ2WbBUYw
X-Gm-Gg: ATEYQzzPKGRWE7nxGNAGIVDUj6uf1myKvFl7bPZky0itkKxiUG5ToAueMGYX89IsNDu
	KZW013zlKRQnZ3VOpZLkhX3GrJEn1wW8h4LtTrr8L8OYWHO+aIwcG2aU/v7im7QaoQq4aq2gHpp
	7i78pCKkSLEkHzBXHR4IReVgEhePnBoo4MUeE8w8uMVjPkXuB8e/LmaSZAPtVkKs9RBQp4wp3/F
	iJohl/xIc0fGC4ePZZ150jpHEOAt73chw7/9ibmm1VNBRIhD8mR7qJZRL2q15OwsTGKc83U+oCH
	HZmO6vKfwtcoXc75Sl+j+bAunKJ7xhegRrOwGTfucUEK018TrTzA6y/HArCH+iEx2ltP/PYw82N
	yclgorlQFM8b/V94/hIm+7KfEOUqoqQVSiyMbAfK0n41U/iCcF4Tsmhqa7hIJnAbtdFiTUoVzZW
	Tfjr9/VQFCbXIvCwGzSqcpeuP62VkDbz/NzSTUcKjb4fiOu/Dwuw4P7V2x3DSLXhilIjI1
X-Received: by 2002:a17:902:dac1:b0:2ae:a95e:fe58 with SMTP id d9443c01a7336-2aea95f0223mr7820585ad.8.1773144734219;
        Tue, 10 Mar 2026 05:12:14 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840ccb6csm195828045ad.92.2026.03.10.05.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:12:13 -0700 (PDT)
Message-ID: <da719e3c-dd4d-4666-9d71-d02238a30482@gmail.com>
Date: Tue, 10 Mar 2026 21:12:12 +0900
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH] coccinelle: update Coccinelle URL
To: Julia Lawall <julia.lawall@inria.fr>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org
References: <7db99952-d1ef-7148-4c8f-1e6ae8f0d875@inria.fr>
 <793c8771-83ab-4e6b-811d-41fd54b78e3a@gmail.com>
 <c94cd15-2052-f746-ae38-304b4d838486@inria.fr>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <c94cd15-2052-f746-ae38-304b4d838486@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Tue, 10 Mar 2026 12:46:46 +0100 (CET), Julia Lawall wrote:
> On Tue, 10 Mar 2026, Akira Yokosawa wrote:
> 
>> [removed most CCs]
>>
>> Hi Julia,
>>
>>> On Tue, 10 Mar 2026, Julia Lawall wrote:
>>>
>>>> The LIP6 URL no longer functions.
>>>>
>>>> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>>>>
>>>> ---
>>>>
>>>> I used the UTF-8 encoding for the email.
>>>> Let me know if this was not the right choice.
>>>
>>> OK, this doesn't look good.  Sorry for the noise.  What is the proper
>>> encoding?
>>
>> Encoding itself looks good, but your patch has this in its header:
>>
>>     MIME-Version: 1.0
>>     Content-Type: text/plain; charset=y
>>     Content-Transfer-Encoding: 8bit
>>
>> , which should look like:
>>
>>     MIME-Version: 1.0
>>     Content-Type: text/plain; charset=UTF-8
>>     Content-Transfer-Encoding: 8bit
>>
>> Didn't you say "y" to git-send-email's prompt of ...[UTF-8] ?
> 
> Yes, I did.  I thought that would select the default...  Thanks for
> letting me know.  Should I send it again, or is it ok as is?

I'd just resend with a proper charset.

    Content-Type: text/plain; charset=y

would look confusing at best.

Thanks, Akira

> 
> thanks,
> julia
> 
>>
>> Thanks, Akira
>>
>>>
>>> thanks,
>>> julia
>>


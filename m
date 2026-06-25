Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577C83CE481
	for <workflows@vger.kernel.org>; Thu, 25 Jun 2026 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782381956; cv=none; b=ge47nhADRwvNglBoWL8lxV7fvFrnMAjjDFAvkR5zQmjk8t550bvG/bVR0I8liEsnNCajZYmgHglvJvHiaSx2xZF9iBbmdal5yOLft8Mx7emrXPI+G7Ert5GVQs8cz3HC8/RhX0JLjr9KUe0oQEyXtC2/NmCTujRZn1Myn31GzUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782381956; c=relaxed/simple;
	bh=bCzLf4a12m0+P4xvPF6Kf7T8wGTy2t8U1zmJTmo1qUs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvfJs7WS7y/3UyFMFRcNEHXWQyZNHP08kDTQiV2BBX2wOLVZ9g3OG68WYMYK1/DnGBDyHz+ahQnN0lbmxZdlO8Mkmkm6/xgSiVRKr53BPe6++QP3Yeq2FoHvFprBSKcPiU/ByYOR2Ex97d8VYnoUe3C+sptPeR2EBhBb+4SgzX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnnEqXIL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnnEqXIL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c7f385883cso4946865ad.2
        for <workflows@vger.kernel.org>; Thu, 25 Jun 2026 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782381954; x=1782986754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yuqp0KNKTBgh4MzJ+duwi9A+WSjJ1uqkPtcQvGtxNIc=;
        b=KnnEqXILtRRtgTtODm/1rhV2Rnv+tttPQM6kZFVseUopZJ/Zr3kgAtVtJrfrS5sHJ7
         rg2Bl1qEP2VXSDqYyPiCvS+RkREkSg3JEkhUjmpkRcjMD5eNOutWW1fAJyeBYtIM/FTq
         tnErvisUyiRlUhcKoDMpRZamx/OFsPeIf6ZonS2ASOXJdVa/qCCo1JvJkG4LimyeHh7f
         KOkIEYZMhf/r4GGbG1jhU45dGdlVouQodaxFVIwRswLEtTZlQBIs33eoouFV+tlZc4WW
         zqpWCa1PqX5ag8o69Me7VQgV+WgPZAFDcGW9f12JQHu5rTw6HS5sLWnZL1bjzA0dXy0D
         DRmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782381954; x=1782986754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuqp0KNKTBgh4MzJ+duwi9A+WSjJ1uqkPtcQvGtxNIc=;
        b=cIk9fTMHKxcUOPBmcxWogBazKUg6CLFvCOLp8VZ6qvjpibNSspvfb9XXh2oOXVRmBs
         69ZhQOnmvXtfUR/f3A+3UkrL5gtg5qKpE0pHQoq5MesdCveqbXZu2Di7wk85TJPA5mMw
         uiJY8rlAawwi9S+BiaLBc113maoaAXepAXo66EacMOzPZ26bCnjPQ9ApsGmzxVhGS/PA
         aOy7Ljuui5dIqESeerzV9jEWXnXeF5H9sDQQZUpjuAdFYiakTFbR2KBcy9vMFFuyBDHA
         hP8bfyViygNCtW5ZT+B3Kfs4ojUrm1Yzvi8x9a7jWOOiYRn1qR6xrFKwwzfhKK+W+JFt
         umLQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+hjW11VoqDNf9AvJI0x0rU6Ir/zkAGotCuPg4LUkrf2uLhKQO5ekJ3FLfMb3dXbzA0mBUSTZXfgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZR5CDbdQGWt9v+fawOi0rj7VQrtEHU+ysdMJCCvKf4rn/5zOG
	Zv6h6jo70ujqKAhQc71NYykj4/l47NbvduGIZ297Vy2kPMQNKcfZAOqS
X-Gm-Gg: AfdE7clMTH0qXlOqpfjluHcPFeyOI8fRDD9ae9S6690Z61Hdb65TY1xnbGyCtLhZN9B
	+7UtOiLkxQeVF12yZDjqb9Q6vAw8+lSii8OHet9KoWUJ8UdOIW++XO8Z+owUquKXvwxvUqLayfK
	spn7smtvAQdXUo1LEzQ59TmsCfu21z9PzQsQ90q7ru+Olc8oYdYMrdIZZrlsmpi0q2tkGONM/9c
	eUK49ps6C+U9d5TbOm3KPqYZWVL+kXpIT8A0NYvfRtEFRZ8uGSfcnxxq5UTQMmV7O4YlSmpufty
	UaFF7K1KxLqOCl0EvSUwYP7A0M5oXx7ToyaKZN79/21x/NFlHcoa/6SD61IaDQjC6DkWco6wDaw
	7ILOvybseAxLUogk1PxoQB0eSNx5lql7b0Ku1xg9DBORLxedUjrxIUfWQrHsTRZ8goxh2/g==
X-Received: by 2002:a17:902:ce87:b0:2ae:450c:951e with SMTP id d9443c01a7336-2c7fc73bb04mr20774235ad.17.1782381954493;
        Thu, 25 Jun 2026 03:05:54 -0700 (PDT)
Received: from localhost ([2a09:bac5:55fe:30c8::4dc:c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63b2e18sm16974275ad.41.2026.06.25.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 03:05:53 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Thu, 25 Jun 2026 18:05:32 +0800
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: dev-tools: scripts/container prefers
 Podman
Message-ID: <ajz8qtGkafGZnCPv@Rk>
References: <20260624013850.1853171-1-coiby.xu@gmail.com>
 <df2fd6ae-69bd-42e6-bf28-ad8103b4189f@gtucker.io>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <df2fd6ae-69bd-42e6-bf28-ad8103b4189f@gtucker.io>

On Wed, Jun 24, 2026 at 11:02:49PM +0200, Guillaume Tucker wrote:
>Hi Coiby,

Hi Guillaume,

>
>On 24/06/2026 03:38, Coiby Xu wrote:
>> Obviously scripts/container prefers Podman over Docker. Putting podman
>> before docker also makes it consistent with following parts of the doc
>> and the help text of the tool.
>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  Documentation/dev-tools/container.rst | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
>> index 452415b64662..9e23f79d5ae1 100644
>> --- a/Documentation/dev-tools/container.rst
>> +++ b/Documentation/dev-tools/container.rst
>> @@ -40,7 +40,7 @@ Available options:
>>
>>  ``-r, --runtime RUNTIME``
>>
>> -    Container runtime name.  Supported runtimes: ``docker``, ``podman``.
>> +    Container runtime name.  Supported runtimes: ``podman``, ``docker``.
>>
>>      If not specified, the first one found on the system will be used
>>      i.e. Podman if present, otherwise Docker.
>> @@ -75,8 +75,8 @@ working directory and adjust the user and group id as needed.
>>
>>  The container image which would typically include a compiler toolchain is
>>  provided by the user and selected via the ``-i`` option.  The container runtime
>> -can be selected with the ``-r`` option, which can be either ``docker`` or
>> -``podman``.  If none is specified, the first one found on the system will be
>> +can be selected with the ``-r`` option, which can be either ``podman`` or
>> +``docker``.  If none is specified, the first one found on the system will be
>>  used while giving priority to Podman.  Support for other runtimes may be added
>>  later depending on their popularity among users.
>>
>
>It's a very subtle tweak but it does help avoid some confusion.
>
>Reviewed-by: Guillaume Tucker <gtucker@gtucker.io>

Thanks for taking time to reviewing the patch!

>
>Thanks,
>Guillaume
>

-- 
Best regards,
Coiby

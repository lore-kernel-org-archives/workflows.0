Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB4271EC2
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 18:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709146339; cv=none; b=EGoN4efVgSVxyMX+vceCAwz3nNg7/knLZgX8ha9IgCg0JNeF+MDXJb32NdlUUjtYDPorh1Jen2gQyaJOyroaRI0lagYIQF7tbkSsW4yNlcXUE0S/8dobKwKT5LbNXvNETMlVk7smHPSRmm7BGVRIBN3u0wjX3WBELdc2aEfben0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709146339; c=relaxed/simple;
	bh=G/XWLtlrXjTaY1Jcyu5g1XD4GZhnReFAVXlyEk9/JvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jRp7kz9IYQKeb7KKtNCBIEAzy+3XvqhemQe5iCKzhmJyiU1KIpU3D2csaJKQOTd7sblujckrLI6YOYZJf/uC83s779iXB0QeqxPPunVZoIDLRVzaSqnBpab7xmOoMEDTiQ0Gjuu+VOz4gkEmvsmQIaZtqVV+SCtuZGhwHtv+cts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=CVv80HD4; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="CVv80HD4"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-787edfea5adso3799485a.2
        for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 10:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709146337; x=1709751137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXdRShsVl2Yr3VUAeDAmdz/jvSTyMBSjYhDRGKzBZXE=;
        b=CVv80HD4F7h1G8uCIbMTKZKUO0jYyob+JMH2rxHYNuMHiXNWlg48geptVvGFoaJtHQ
         hns0FLqf/0uzAr17P0O8wbn4JEBMRZJPKLDDCLsFu9S5FLeNVbXHSCnSIIyUqg3/z28a
         xWnrPfAxucE7yIlBK452LV1a96wAxVcqdH7aI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709146337; x=1709751137;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXdRShsVl2Yr3VUAeDAmdz/jvSTyMBSjYhDRGKzBZXE=;
        b=K5ZYMaqNFt5H21Xfgdk+BcxQn2opkdrUsXWR4Mr2NUm7PFK9W/26MBPP/+Vv1hk6Xd
         zh7PYSyLNoQeSGn1DmozXL7rnoNjSTy06w46+U0IIxOLLO4OaIbBlBRN2L6saR+w91TX
         F8uzLiN6RXy6uEHKPQSTxC8t+ehj3uLfGM2WFy0MVAk+cQbacF7840CnHf94ewLLuKr+
         KklVnyx+WIfkiIh6v3PEpUn9buJpzZCgh65nCMz7TivwUIaDoARpBN4JjmZibavcnzR9
         S7SEhxnP4gaC94+J0oXs8U72IGojs+TtdPlCMKQNvW/cZC2Ltf8vFPkO9Zrc4F5qO1bH
         0LeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4fDlpo4YwU5PTAqp7uZRH2GRhUP6ZZ2GSjqO9PCzau/Um2z4e6ZTAexCCI7MXF/3ZOcJFQaImo862bmoMaJa4kY1qnITnSSNy
X-Gm-Message-State: AOJu0YwifIksDYpgk+FC3ukAYMCkpxSfe3GC+3+t+GPzeMBlceJqEHCz
	kg566JP7EcwsJdujaiGLTOXxAarqIrujOwRenmbSHaYtnKzRV+gxRMjTDTBJfw==
X-Google-Smtp-Source: AGHT+IFxTlH3wUsU1v/631yjABFsdLnt8s4kuo9pW7ZFcf8pN8c3NG3UkhD4t6Mz0TKBW90bXwwBwQ==
X-Received: by 2002:a05:620a:1192:b0:787:3f04:acbb with SMTP id b18-20020a05620a119200b007873f04acbbmr6060684qkk.12.1709146336985;
        Wed, 28 Feb 2024 10:52:16 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id w17-20020a05620a445100b00787debfc66bsm51587qkp.97.2024.02.28.10.52.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 10:52:16 -0800 (PST)
Message-ID: <c694fad4-dfee-4ece-b931-597b85b37f28@ieee.org>
Date: Wed, 28 Feb 2024 12:52:15 -0600
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Hannes Reinecke <hare@suse.de>,
 Willy Tarreau <w@1wt.eu>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <20240228050007.GB18047@1wt.eu>
 <4fa1cbc7-0f9d-47bf-8ff7-a9b17456431e@suse.de> <87msrktrft.fsf@meer.lwn.net>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <87msrktrft.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/24 11:43 AM, Jonathan Corbet wrote:
> Meanwhile, in the short term I suspect LWN can find a place for itself.

I am certain that ChatGPT and the like will *not* replace LWN
any time soon--not at *all*.  The human analysis and ownership
provides enormous value.

> After that I hope to be retired.

Nooo!!!  But yeah, we're all getting older.

					-Alex

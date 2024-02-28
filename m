Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDD40843
	for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 18:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709146515; cv=none; b=ktVTwk2PHaSE/DeNoMuzBsmYVKiMQYJ0p0JoCoDCnD5m0FWGMR2k8JTdaX3+U6SolvKZSum32tGJx6i4zp0rRutemQBPLeut2Sri3YIe6GF6TfkVmZWllnZs8zlYRFkDXxu9FZ02IYpd3xryBic4aZ2/6oRCXjakRrAhfwz5Y98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709146515; c=relaxed/simple;
	bh=+mkgSiiOQtuji52EhhJHzY8eVcwXsinFC3RfY2Zvw/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=p7IZ9XIorgE91Mo4Q66vkn1GF1s9RhxsYHtr3H/XaDAzmXjnARt2VvYHF8TQPyur5H+O54aS9A9nTglBkWnmKWMc6rLnqVzNnTf4zGb/abS5BHfsXHwGPyMfeMPgHoA+ccrlgq0meUNSHcg5AF22TOaSFpsi10SmiO0Vcvj+zyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dcb3e6ff3fso1010645ad.2
        for <workflows@vger.kernel.org>; Wed, 28 Feb 2024 10:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709146514; x=1709751314;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M+3aVO7wLF/SKR35W8QemLDHRCVEQW+lzsTciVGLpqM=;
        b=xRvfqCRjI9moh0K0WFZCXuF5dSiLIxMfAiS6I4sbCvDNuqwYjHt+5dY8JWHytJxkpC
         dqMBFwDoT9CDeYsadFlyAjo/2gnMyRt7YryNLGjuS8BmVfe5WzFmoHUC2NyBXikz+Qv4
         66vDDqWMW7CK51ihCKkRQYCnbIFdzhaGM56uy/9/ZxIe10A+VMTG24hxlprlxfiAieXA
         Com38XLF/5vZdjV66bP0iXcV+XpRChX1rnZpIVLY/nrY7drTPZx5XLqNQ+EW6apFV8p2
         5JTHYGR9DKqUZcilM5t0PPjG0tph5gvSeAhLIWvec1cRZA/13pxF0A9bWdAa/I1kPk/9
         yrmg==
X-Forwarded-Encrypted: i=1; AJvYcCXsnL0EWN1j+9rpe0DfXSNGOWY5DXmsjbaxXma8vPWV9juxYWa198aDJUbTgiu76pHXEodahy7zVqLnj5DQRXeioDFPlrUhMMyS
X-Gm-Message-State: AOJu0Yx0Y4EZqPPgxYIybShLuH+tydY9AClqwu66eY4KMxz/JXMGK4XE
	/LUdFvV5HhVwW4A51Nh1ZeskUh5Wt/kila/iDpAYaBA/Fds30oHN
X-Google-Smtp-Source: AGHT+IG33ZEcUrAxqFHUUmF18QT4eH3jjCvIupU1alf086fDBu3CDaW7HjQV79JOBMqbqfvDS5Emxg==
X-Received: by 2002:a17:902:d50b:b0:1dc:6775:a350 with SMTP id b11-20020a170902d50b00b001dc6775a350mr340902plg.58.1709146513603;
        Wed, 28 Feb 2024 10:55:13 -0800 (PST)
Received: from ?IPV6:2620:0:1000:8411:3174:8fc0:11f9:afc8? ([2620:0:1000:8411:3174:8fc0:11f9:afc8])
        by smtp.gmail.com with ESMTPSA id ml11-20020a17090334cb00b001dc391cc28fsm3605573plb.121.2024.02.28.10.55.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 10:55:13 -0800 (PST)
Message-ID: <964843ca-891b-4039-94b3-ed1046df2d69@acm.org>
Date: Wed, 28 Feb 2024 10:55:12 -0800
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
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@kernel.org, workflows@vger.kernel.org
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240227-flawless-capybara-of-drama-e09653@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/27/24 14:32, Konstantin Ryabitsev wrote:
> I was playing with shell-gpt and wrote a quickie integration that would allow
> retrieving (slimmed-down) threads from lore, feeding them to ChatGPT, and
> asking it to provide some basic analysis of the thread contents. Here's a
> recorded demo session:
> 
> https://asciinema.org/a/643435
> 
> A few notes:
> 
> 1. This is obviously not a replacement for actually reading email, but can
>     potentially be a useful asset for a busy maintainer who just wants a quick
>     summary of a lengthy thread before they look at it in detail.
> 2. This is not free or cheap! To digest a lengthy thread, you can expect
>     ChatGPT to generate enough tokens to cost you $1 or more in API usage fees.
>     I know it's nothing compared to how expensive some of y'all's time is, and
>     you can probably easily get that expensed by your employers, but for many
>     others it's a pretty expensive toy. I managed to make it a bit cheaper by
>     doing some surgery on the threads before feeding them to chatgpt (like
>     removing most of the message headers and throwing out some of the quoted
>     content), but there's a limit to how much we can throw out before the
>     analysis becomes dramatically less useful.
> 3. This only works with ChatGPT-4, as most threads are too long for
>     ChatGPT-3.5 to even process.
> 
> So, the question is -- is this useful at all? Am I wasting time poking in this
> direction, or is this something that would be of benefit to any of you? If the
> latter, I will document how to set this up and commit the thread minimization
> code I hacked together to make it cheaper.

Please do not publish the summaries generated by ChatGPT on the web. If
these summaries would be published on the world wide web, ChatGPT or
other LLMs probably would use these summaries as input data. If there
would be any mistakes in these summaries, then these mistakes would end
up being used as input data by multiple LLMs.

Thanks,

Bart.


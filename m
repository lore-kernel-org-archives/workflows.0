Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9F6EEAE
	for <workflows@vger.kernel.org>; Fri,  1 Mar 2024 01:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709255600; cv=none; b=k28U6YDv7D6ZCQuJJUgRK9M7Iz2bSF7ldosVwkF3jVhUYV0yaN1SB9/nBW9rXiybEVEww4FOlXJPb6uuTESt6ifsqDQlyA4E9m3kVF5//83v4N6+Tw6vOSE0EKicNKkHKzPldBPE+w/dHNdIEqHQqkEr9EAT412Aw27DsNAvORA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709255600; c=relaxed/simple;
	bh=ZuvjqH3HIFy12XQQHy4pBaqVidAhTDkX4wpKeIhtGms=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jb0HAMrL4tcguUdAiD+DEXaXNuKzTuAHNjrML0wwhGC/ayZU8H8VSzEDyjxMB3O7EEITYVF7KNLkyWAH8dwbWSGtxMp+BZqbrtuQSaObA9D+gipERws3XkS5nTV/JhA4OJXTMXv+AI0PaONPqMFFSVuRwq+qA/VYq1eA38LvUls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5d3907ff128so1450532a12.3
        for <workflows@vger.kernel.org>; Thu, 29 Feb 2024 17:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709255599; x=1709860399;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JUmSc9gRpxsRRwEZsMBIvA5Xuuwgz+nXXOF7b7dCCgE=;
        b=nro393Llh08zkNLkLPoriZWL61LgLpuCv6qXqUojZcEekA0JBQW5JsMQzHXzqPVRe5
         1Mw8Do5iRzIiEMo0JoB5TdYihhfQOOgXvZqTNbse0wmHo+KY8Swccy4/mpans/A2txNb
         NdxLvcfYCLg5rxZ5cGe8eVWJBRXC43wKOgljcmb47lItFqmi481h3DrsInkSkXzLC5EY
         k8X07aQtKCDzZe1H/VNeV7K/LKywhtl1BeEo9lo6QwppSzaKMdHFcToU94jC3rTti1zM
         hoOyeowIrJ65PGROzhIT9yt805BKNdrB0Dq2SNeEoXPRQKfdec5kL6XN5n4UGx4H9tUO
         gPBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPRRAhczEAJSC10KYPpYMniKx29BtR38K6wojllhcgcX+0gQ9xSFnknukeAkG+Pvm9VCc2OpDxRz5xajBZI5yw3LT8LNdV4SGs
X-Gm-Message-State: AOJu0YzVMoESUxnuQ6XWp/OB8V9r/1tqfEWwPoR5jcQjrqqtg+aAXbp1
	sJpi867to9ErhrO+/z0GA7V5Suq7731cmVNMv32DN3RiUYybeGMS
X-Google-Smtp-Source: AGHT+IFt0qFrm7keCtP7YEwddle58URI8bgB2yxoxq5IX80T9wgjzBezyN63oCCiyPW5VoRuLtqmbA==
X-Received: by 2002:a05:6a20:244a:b0:1a1:34be:24b5 with SMTP id t10-20020a056a20244a00b001a134be24b5mr157813pzc.24.1709255598567;
        Thu, 29 Feb 2024 17:13:18 -0800 (PST)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net. [73.231.117.72])
        by smtp.gmail.com with ESMTPSA id ju16-20020a170903429000b001db5ecd115bsm2155836plb.276.2024.02.29.17.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 17:13:18 -0800 (PST)
Message-ID: <23f843e8-2eb6-4b25-b515-44c6cf5e49d5@acm.org>
Date: Thu, 29 Feb 2024 17:13:16 -0800
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
To: Hannes Reinecke <hare@suse.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@kernel.org, workflows@vger.kernel.org
References: <20240227-flawless-capybara-of-drama-e09653@lemur>
 <964843ca-891b-4039-94b3-ed1046df2d69@acm.org>
 <5758922f-a11a-4bbe-88a4-b724f53b2e6f@suse.de>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <5758922f-a11a-4bbe-88a4-b724f53b2e6f@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/24 23:18, Hannes Reinecke wrote:
> Now there's a thought. Maybe we should do exactly the opposite, and 
> posting _more_ ChatGPT generated content on the web? Sending them
> into a deadly self-enforcing feedback loop?

That's a rather negative view. Besides concerns about the energy spent
on training LLMs, in my opinion LLMs can be very useful. If I need to
look up information about a kernel subsystem that I'm not very familiar
with, I type in the question in the user interface of an LLM. While it
can be very hard to look up information in mailing list archives with
a traditional web search engine, LLMs can give accurate answers quickly.
Here is an example of such a question: "Why does the Linux kernel cgroup
implementation propagate statistics to parent cgroups periodically
instead of immediately?" Both ChatGPT and Gemini produce reasonable
answers to this question but the web search engines that I tried did not.

Bart.

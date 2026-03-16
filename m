Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6C38E13E
	for <workflows@vger.kernel.org>; Mon, 16 Mar 2026 10:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656703; cv=none; b=Gg214A4Qdg6q4PQ1J003DLzs9k6BIOmVBRaf3Vh1cO6t9E6ydpgCrfOBxYLhhv1zYpmtVZ+Yj8OUfiffN+MS+XeiN57T5WJip0S9d4P5ypcMn4odRGNa7a32h3+njABhfDnUgQL15kCZYP7+Hv1VLBXQef4OOBcgFzrEorESlQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656703; c=relaxed/simple;
	bh=g7i0+Pp9mjDM23vWtwKGrmc2BsZHLrC1Qpwe0Pg4HnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JdC7G4pVePZK4pbEtWBthIwK2J+/fjDBjBA5cMgolJkegh6b8Wnuj5oVZxJxgc3PryS55Zi7TrMwzBVEimaDBLR7AjRRJf5YKJPAYyzY7/DMdi8N2tkPbj69Wkei3qEU4Rf+Ug1Zh0iBBifF8lKVa/m2HQ2zrlQe3MqwEPxhg74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwuFiIoJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwuFiIoJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4853aec185aso36167005e9.1
        for <workflows@vger.kernel.org>; Mon, 16 Mar 2026 03:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773656700; x=1774261500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=76TTQfOSNM1rz7a9CKO2GjO22jbs8CcvWq2eCabFfvY=;
        b=JwuFiIoJJxGpULgpCQclsszbgrE+zMiEpg6IP3hqEL2AkRSWqDuttvEEtcerWb5fW0
         ayJRehUybKL3TjT6tXKwoT1MJZp+uVN6FQw90Vj1zXbPmBOsywnP7cBmSOUgzFhFvvrj
         YSPVs7h4tU4m+Tyy7jw4QsiV14+9xgSzSuoURpkMyin/2a0VW+zLUbaS9XMsY8NEN4T3
         77aDIHJCdpeTaiZDXHzMF9revugRYAfF4SSaWXhYv0Thx7urS4/keQ7rVX6H1O7mtG4M
         XSzd2jzrGeVRGmc/khhGRaDASXVvtX9PBnW/Di7IDAsofy4Ea8lnQd4TD+JfEzUV8fhp
         HhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656700; x=1774261500;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76TTQfOSNM1rz7a9CKO2GjO22jbs8CcvWq2eCabFfvY=;
        b=WUN7qce48FzjjYkSwBODTj/3G6Z4KyYtBK9LMOMQDPPCAidpvB6p2GuT62umeohvHm
         owxyhc7SvvKE8xDov31Ok97PSRCa1Qj0VMfsiVmjvZO1tfzcf9FTXbAjKHKj6EydPZDF
         B5Z0i9RsamQdiBht6dMSlElQriP5sECSmc71RzGgYJUfboucigMyENlxkkOfft8ARkM8
         HR0J82sAN7kEvZ4JYsCUz/A9mLZMOHKCE+uEz0ihKPhYdcfZ7Clho6pZ3M9xKvzh2GNV
         hoBNBmPi9GQWfA8+GezzlPkUl03EDIlcSPoPLB8Z8fyOm7nsG1X9lJBSerQs27ts2VZO
         InyQ==
X-Gm-Message-State: AOJu0Yz3BmPnwUYfao2mMjb308St34hMQPVn7T0KC4GQzdxv2UIRvUu7
	YfhlloxgBm6gCMn1/fnvwl/pmE44ua+Hr98HUxbWcz0H7hkC/50z/5TaqMS6DKZCwao=
X-Gm-Gg: ATEYQzw1cXok/8JMp2wquRcjWWKr8pULDDTKSRciaGn2NI25en8evKrXfjTfyHERKLL
	iAqAsFVjqE9DxWU5Lg6sr+KfaubzC6WvlBFkKoLB8buljbVYZ8oxMU9QPN+9aE1VWs/PBpOyk5D
	Wzv0HS0N7UIfqcE/jsreXFh7pI3e8+GxmTRO+uCzJLWkY1Bo/nWfVnfTW+SBkIU3RJ0jt4WBp3B
	VYTq8oLR87bSRGoQUiUDdXkP94SABnx+wwvehR1rH1IrbWKS4dB3Me3hRV/IQJ1dDBxfzu3DsQr
	TYBpFX5zfR2Rjb8JR6NLOnucB3iBYQcJlJHa1jzGj2vBro9A5Rj+X0zvZDPqEhvMBPnAIVw9a9+
	ocNX66HPLS+AmTWWrJ8WUxXW2fjmic5UDrUFm2bKy8AWgYIifwQWaevrQjo8hz8tpdUiyb/yvpU
	ksZSkrNLMQncC+SlcQiUmnOx9Q5envLj8=
X-Received: by 2002:a05:600c:4e4a:b0:485:4135:5c92 with SMTP id 5b1f17b1804b1-4855649360amr208565725e9.0.1773656699914;
        Mon, 16 Mar 2026 03:24:59 -0700 (PDT)
Received: from [192.168.0.34] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557777105sm149727875e9.4.2026.03.16.03.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:24:59 -0700 (PDT)
Message-ID: <3af521bd-e03b-4e8c-a972-6b0b1c54e2d9@linaro.org>
Date: Mon, 16 Mar 2026 12:24:55 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/25] printk: Register information into meminspect
To: John Ogness <john.ogness@linutronix.de>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner
 <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Kees Cook <kees@kernel.org>, Brendan Jackman <jackmanb@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
 Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>,
 Youngjun Park <youngjun.park@lge.com>, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20260311-minidump-v2-v2-0-f91cedc6f99e@oss.qualcomm.com>
 <20260311-minidump-v2-v2-20-f91cedc6f99e@oss.qualcomm.com>
 <87pl54f70l.fsf@jogness.linutronix.de>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <87pl54f70l.fsf@jogness.linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/16/26 11:39, John Ogness wrote:
> On 2026-03-11, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> wrote:
>> Annotate vital static, dynamic information into meminspect for debugging
>>
>> Static:
>>  - prb_descs
>>  - prb_infos
>>  - prb
>>  - prb_data
>>  - printk_rb_static
>>  - printk_rb_dynamic
> 
> FYI: vmcore also exports the symbol "clear_seq". It is not required if
> you are interested in reading _everything_ in the buffer. But it may be
> interesting if you want to mirror vmcore tool features.

Thank you for your review and suggestion. One of the key points of
meminspect is to be easy to use by the kernel developer. E.g. to be easy
to add another symbol, like `clear_seq` for a particular use case.
So, someone wanting to make use of it, can easily add it.
The purpose of the initial submission would be to have a basic use case
working, and show it as an example for everyone.
If you would like to detail about the features you mention, it could be
interesting to try them and see if it would work with a meminspect dump.

Eugen
> 
>> Dynamic:
>>  - new_descs
>>  - new_infos
>>  - new_log_buf
>>
>> meminspect uses a different API to annotate variables for inspection,
>> and information about these variables is stored in the inspection table.
>>
>> Reviewed-by: Petr Mladek <pmladek@suse.com>
>> Co-developed-by: Eugen Hristev <eugen.hristev@linaro.org>
>> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Reviewed-by: John Ogness <john.ogness@linutronix.de>


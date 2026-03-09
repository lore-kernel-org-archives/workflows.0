Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3C93BD629
	for <workflows@vger.kernel.org>; Mon,  9 Mar 2026 16:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773073711; cv=none; b=c81a5d2rKocxLRwCHO6XKDcfPYEpOJLQyq9n/6lNYvf2IxRDrM7RPj9lJ4JjFEK1QYudb/VhpQbwGzeuk5AqseyFKA+CTQfXPzmU4/BI9YYuOwBXmCgrh9UWGpzskGdTd5D4sBl4sAuxOjVNlNqngHgtnwle6+UJoN9VhhHCkUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773073711; c=relaxed/simple;
	bh=WIk5ijmLnNs2NTjHaGHzRzb4sCI0btF2mTmcjtwNl+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YOSI9CLEhzeO57CSNCUxEb3UWu7MRykhL7c68If7qEtUTjy2UmQ4vcfr/7Jnw98AVeZ1YznhavoGZZiIQUBs17fTy9q0bvxpdZQyYn84Ha9sbAri1On/6p79yajyFhX5l0aVrcr/Z3IleiRK7WhTAHUzEpkJrbM5yIIBQ+CmyhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sa9q+1BT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sa9q+1BT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a871daa98fso88723375ad.1
        for <workflows@vger.kernel.org>; Mon, 09 Mar 2026 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773073707; x=1773678507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBQuohd/vt2LAF3I4JQSmNdjevqrT6nbat4LeA+5Cz4=;
        b=Sa9q+1BTaR+crY/Ycy/WkFApc6lk6kV6XReseop1+RhGk/HAYrbGg3jzxK8+tXhb86
         8PL2joid5wjGjmf/gMyOgB0lqEij6d84gMrRhbxap4BQ2GAdvCHYG2fhRfp5bXQPZdqd
         Pm6v0l0SQd8lW1ycr55p/jRI/MluWdByWZOsduyBoD2QecdANVhDEBHFtG/WN2YBXyaD
         BoL59xD+HoQFOeUxXm+4zjBXlhunHn+RpwpeVqyVK8gKOr7pW2nR2Xn2YCKklQK6dVhD
         1+kUvXBvFYw6Qy0zENNLAQkihkbmmJ0pFM+iYRP1ufAGBWJcb89QsUxr4G0NGhpz2TrX
         HvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773073707; x=1773678507;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rBQuohd/vt2LAF3I4JQSmNdjevqrT6nbat4LeA+5Cz4=;
        b=gRXX0YgNdmjErvdVgAk9pH526cSVrn/WKhs/jx3GlTHVs+I3J30oClGo2jebMh4vbP
         AUwdJnPzzMA/fUBeC56GQN2L7REi2AdggCBBIANC+sQBLsnJ3+ivhsIjOgodHwTFiMRn
         QNFooNIEZP44jJDrMecC/diBPpERaidPcSJnhZFRz3w+++FvhqKE9T1M+1kLVSZrn47m
         GGlyVkB0TjBZUzROb0gQjhBn003pjPyJ7LS+neIApBhcHSPKhFqvndpc3K33oYKurwdH
         CiYRWFpVyuHt583yppyjgVqPI8neEWfNukN8RdG4g8cjxw7lY/8xHn7fWh+QNy3q2QEv
         Wqjg==
X-Forwarded-Encrypted: i=1; AJvYcCWQa92nECgUzfmJJRtxytgMrM/sMCL4FjZHnZcUTUdVm50UZAOolMu+2zuSRGdAnJzJfdPD82Nx36c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmc06uFXhgCBdz2jDA6UXQ/6w9crRq1ndLJOnereKmsbsIRlvj
	UhLdsO7qKIkmPY7Ge+/P6vkDGcJkWciYNsv6D5ZMtVvohEoBvadhkrh/
X-Gm-Gg: ATEYQzx3zqrOrLG7DyjT6YgLnYmuOyediiavvnUEh6tJkzqMzix0c8K6RafmLHaVHNM
	cB7Iz/mGjoSTU942PLESC5P3WwmzVPPumbOa0SkASZTQbVqVriZql4zualnHcmim5O0SW1Fueo+
	vj2jJfQY0GPRl1VAVYwDDb6WNfOcSNExdlR3WFnlOlcLUfB7C6XSsFsaXcgTSJGhmyw7kHIxImK
	LnESAeBBEDoLxE16UDIHc1KiPU6Y83XAzLv8POvHl5D4K3YI+c/s8q4+4sOD6i3Mu8Enva52mXU
	Qx4ZGF+iKra54uQXaRrpGPiH7TRiLskAYrxsZvTaPIiGdnZB7IvET612MSMrdWw607c8fqGQVAV
	G2Xn862/ClZykRWA5s9m51J8r3iKueyRM0wfE9jPwO7mVjDLxF5HYxrU9ilJ/AGDj0fKAE3JFeX
	v/oMcWEOAAicKsDTCPcuIZNlgariUzUMef1Hm8/ZfQ0yb3ImtA/b749TcpmUyC74YJq2+s
X-Received: by 2002:a17:903:2441:b0:2ae:4fdb:d596 with SMTP id d9443c01a7336-2ae82367db1mr122450805ad.11.1773073707067;
        Mon, 09 Mar 2026 09:28:27 -0700 (PDT)
Received: from [10.79.58.83] (wf121-083.ust.hk. [175.159.121.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57cb1sm116837325ad.9.2026.03.09.09.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 09:28:25 -0700 (PDT)
Message-ID: <ae8dda71-9e25-4f3b-ab95-1b00809ade37@gmail.com>
Date: Tue, 10 Mar 2026 00:28:23 +0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/dev-tools: fix a broken URL in
 dev-tools/coccinelle.rst
To: Jonathan Corbet <corbet@lwn.net>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Shuah Khan <skhan@linuxfoundation.org>
Cc: cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260308100851.341-1-tttturtleruss@gmail.com>
 <87v7f5vv9x.fsf@trenco.lwn.net>
From: Haoyang Liu <tttturtleruss@gmail.com>
In-Reply-To: <87v7f5vv9x.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/10/2026 12:10 AM, Jonathan Corbet wrote:
> LIU Haoyang <tttturtleruss@gmail.com> writes:
>
>> The original supplemental documentation for coccicheck is
>> https://bottest.wiki.kernel.org/coccicheck, which redirects to a not found page,
>> thus change it to https://bottest.wiki.kernel.org/coccicheck.html,
>> which adds a suffix to original URL to make it direct to the right page.
>>
>> Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
>> ---
>>   Documentation/dev-tools/coccinelle.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
>> index 2b942e3c8049..f73ccf5397f3 100644
>> --- a/Documentation/dev-tools/coccinelle.rst
>> +++ b/Documentation/dev-tools/coccinelle.rst
>> @@ -61,7 +61,7 @@ Supplemental documentation
>>   
>>   For supplemental documentation refer to the wiki:
>>   
>> -https://bottest.wiki.kernel.org/coccicheck
>> +https://bottest.wiki.kernel.org/coccicheck.html
>>   
>>   The wiki documentation always refers to the linux-next version of the script.
> I'll apply this - a working URL is better than a broken one.  But is
> there really nothing better to link to than a page that warns "OBSOLETE
> CONTENT" at the top?

Dear Jon,

Unfortunately, I do not find any other documents about this script, so I 
have to use it even though it's obsolete.

Sincerely,
Haoyang

>
> Thanks,
>
> jon

Received: from zm-mta-out-3.u-ga.fr (zm-mta-out-3.u-ga.fr [152.77.200.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629A972618;
	Tue, 10 Mar 2026 00:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.77.200.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773101824; cv=none; b=UkL7xs5W9J5+cRzDXXfxUk83Bz3gI0EeiVkQLwcVP+4TmEq0G3+RGQm8go+BBIAk8cJ7CFVKr3IwxBgbcv7VqXPPSd+azVEtCFyRFrz7PH8aEM/rXmMao4D+6k0Ol1jkg7F35EklhyA+CVOg34Cgh5DiulUtwldx4Gw8dcYRuVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773101824; c=relaxed/simple;
	bh=K6KOjirwWu6hxLyRAT0WLc1dq0LGNWS7j6XYIxLCRp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2EYQ8J5JLZi3sgojN4fdYpNmnpd4s28g46RVjCY+qW15JU5CJO4C+E5z1rf4KqWFFw1iTZ2jUJpjpSLPtGUjMo7W1m/h8EkLD+vhvprN7B1z6Gg/SCalQh2RaPLq/7kuXCFvZIIKShCSw3dSoMOOulZ9Sf8xu0+CJd1TQ6Fdvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=imag.fr; spf=pass smtp.mailfrom=imag.fr; dkim=pass (2048-bit key) header.d=imag.fr header.i=@imag.fr header.b=NIc6lULV; arc=none smtp.client-ip=152.77.200.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=imag.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imag.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imag.fr header.i=@imag.fr header.b="NIc6lULV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=imag.fr; s=2022;
	t=1773101453; bh=K6KOjirwWu6hxLyRAT0WLc1dq0LGNWS7j6XYIxLCRp4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NIc6lULVwjAeqp6WE0ElnY6ST1AgwRGFDZN3mHE63R7YP1YqhLRUx0bLLRm46Limv
	 zpB+Vivjr7sDT9k2lwjDVt8OqFXXyjTSQVwjMPm49GyQapxMYgYs+ZRN55yTswbPAc
	 KkufhVOXj/EGmukFqwx+3duBr9LXWy5Vu002kli7aDgQD9iuriXE21sYy2QW/gmR+P
	 sgAh1X8wAFswrU3bXR+ohxFn06z4pv26IKZXuS6xaidS/GP1Qd0NsUEpoZZKPBx8I9
	 VqPyEBe0nawTfCRfHIAWuUh29cHvlhL4bL+G8FiJBXpyK7iweA4/nQEzLnWnk40ZSn
	 2Vwg/3QOFoEjg==
Received: from mailhub-2.u-ga.fr (mailhub-2.u-ga.fr [129.88.178.102])
	by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id D5E6B40277;
	Tue, 10 Mar 2026 01:10:53 +0100 (CET)
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
	by mailhub-2.u-ga.fr (Postfix) with ESMTP id D20ACFF853;
	Tue, 10 Mar 2026 01:10:53 +0100 (CET)
Received: from [192.168.1.87] (unknown [87.89.124.250])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: palixn@univ-grenoble-alpes.fr)
	by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id 5CBD8400E6;
	Tue, 10 Mar 2026 01:10:53 +0100 (CET)
Message-ID: <1c546ad7-14f8-4695-9754-32a020f8a082@imag.fr>
Date: Tue, 10 Mar 2026 01:10:52 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/dev-tools: fix a broken URL in
 dev-tools/coccinelle.rst
To: Haoyang Liu <tttturtleruss@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Julia Lawall <Julia.Lawall@inria.fr>, Shuah Khan <skhan@linuxfoundation.org>
Cc: cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260308100851.341-1-tttturtleruss@gmail.com>
 <87v7f5vv9x.fsf@trenco.lwn.net>
 <ae8dda71-9e25-4f3b-ab95-1b00809ade37@gmail.com>
Content-Language: en-US, fr
From: Nicolas Palix <nicolas.palix@imag.fr>
Organization: LIG
In-Reply-To: <ae8dda71-9e25-4f3b-ab95-1b00809ade37@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (palixn@univ-grenoble-alpes.fr) via submission-587 ACL (41)

Hi,

Maybe we can just throw away that section of "Supplemental 
documentation" and its link ?

Nowadays, there is much more SmPL provided, and the rst file
describes better and up-to-date information.

Would a link to
https://www.kernel.org/doc/html/latest/dev-tools/coccinelle.html
be useful to point to latest version ?

Sincerely,

Le 09/03/2026 à 17:28, Haoyang Liu a écrit :
> 
> On 3/10/2026 12:10 AM, Jonathan Corbet wrote:
>> LIU Haoyang <tttturtleruss@gmail.com> writes:
>>
>>> The original supplemental documentation for coccicheck is
>>> https://bottest.wiki.kernel.org/coccicheck, which redirects to a not 
>>> found page,
>>> thus change it to https://bottest.wiki.kernel.org/coccicheck.html,
>>> which adds a suffix to original URL to make it direct to the right page.
>>>
>>> Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
>>> ---
>>>   Documentation/dev-tools/coccinelle.rst | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/ 
>>> dev-tools/coccinelle.rst
>>> index 2b942e3c8049..f73ccf5397f3 100644
>>> --- a/Documentation/dev-tools/coccinelle.rst
>>> +++ b/Documentation/dev-tools/coccinelle.rst
>>> @@ -61,7 +61,7 @@ Supplemental documentation
>>>   For supplemental documentation refer to the wiki:
>>> -https://bottest.wiki.kernel.org/coccicheck
>>> +https://bottest.wiki.kernel.org/coccicheck.html
>>>   The wiki documentation always refers to the linux-next version of 
>>> the script.
>> I'll apply this - a working URL is better than a broken one.  But is
>> there really nothing better to link to than a page that warns "OBSOLETE
>> CONTENT" at the top?
> 
> Dear Jon,
> 
> Unfortunately, I do not find any other documents about this script, so I 
> have to use it even though it's obsolete.
> 
> Sincerely,
> Haoyang
> 
>>
>> Thanks,
>>
>> jon
> 
> 
> 
> 


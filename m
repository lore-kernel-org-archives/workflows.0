Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08626224B1B
	for <workflows@vger.kernel.org>; Thu,  6 Feb 2025 08:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830117; cv=none; b=KAXQ7shHdymt2CL4jNsm3bvAQCfa+9mwF4L4Y2wFMR9tJPPSQAzyzqScWj9g/Kh/B0LQAnCueco1SPYwtCkg5hPMndB5XAzUBHmDP/oXJfJrTpmHWRKRC00Ue8CubHx7DKZWlweAmolJkGY6xfmzQULEXX8MD4RUpacN3nHIaho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830117; c=relaxed/simple;
	bh=D7ocIBVm3Vh+NWU+uqfVknsfVUORThdKT392ZTVe+Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=kv/rBQQ30sOPkbIPkX7AP25eZUXpqwzb9psak/6E0YXirWbKWTqbi2qdqZczXFguRk9Yyr+KDoFYox5gjQUeLHsQmc8+/H75fZZ3pQJFE3ahd/JDGGWxkC37gtoaWP9rCmUgvPniTVJ7P3ubOXMyuuhXyHiV+FSbpxYZ1WozD5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BJVI8ttc; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BJVI8ttc"
Message-ID: <7bcc5cd8-dd19-46a5-9f27-b81c14eefe3f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738830113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9uGFZgtcxOdnMiNqjQSuJLSwBbw65wJx+/OE0TA5hzc=;
	b=BJVI8ttcZeZnYJ3tU+6JBJmgaeN9CGsW8IQh1HbqrU89fpOGGev1GNq8MC9Say8PTvcv9x
	zwbZeo/8ug8kZU3SYeIEek0cePbp2otX785Z+kfYFjfpdGcSS5Sh01K/gYxnwIb4qxOIdo
	27PeuVxpkDsgRuOBeFYgxlBJvuDR/Hs=
Date: Thu, 6 Feb 2025 16:21:47 +0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20250203174626.1131225-1-kuba@kernel.org>
 <0b68e534-df14-4496-802a-bc0437469720@linux.dev>
 <d3cdc752-fd61-41cc-a76c-7848d27a6802@kernel.org>
 <64202cd3-fe83-41af-a9de-ec6eef5f4c21@linux.dev>
 <65c2c9d3-e173-4475-a58e-168aa087b889@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
Cc: linux-doc@vger.kernel.org, workflows@vger.kernel.org
In-Reply-To: <65c2c9d3-e173-4475-a58e-168aa087b889@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Sorry, I accidentally sent an HTML email because I just

reset my production environment. I'm resending it to

the mailing list now. If the recipients of the previous

email have subscribed to the mailing list, they may

receive two emails. Apologies for the inconvenience.

>>>>>
>>>>> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>>>>> index 8fdc0ef3e604..12ed28b3d113 100644
>>>>> --- a/Documentation/process/submitting-patches.rst
>>>>> +++ b/Documentation/process/submitting-patches.rst
>>>>> @@ -717,6 +717,12 @@ patch in the permanent changelog.  If the ``from`` line is missing,
>>>>>     then the ``From:`` line from the email header will be used to determine
>>>>>     the patch author in the changelog.
>>>>>     
>>>>> +The author may indicate their affiliation or the sponsor of the work
>>>>> +by adding the name of an organization to the ``from`` and ``SoB`` lines,
>>>>> +e.g.:
>>>>> +
>>>>> +	From: Patch Author (Company) <author@example.com>
>>>>> +
>>>> It looks great, but I'm a bit worried that it could be misused,
>>>> which might cause trouble for some companies. Even without
>>>> this patch, there's no way to prevent the misuse.
>>>> Consider the following situation:
>>>>
>>>> From: Yanteng Si (linux foundation) <si.yanteng@linux.dev>
>>>>
>>>> Obviously, I'm not a member of the Linux Foundation.
>>> Nothing stops you from doing this now, because mentioned format is
>>> already accepted.
>>>
>>>> This might seem a bit absurd, but I think it could actually happen,
>>>> especially with some driver code. Hardware manufacturers would
>>>> prefer to upstream their code under the guidance of their companies,
>>>> considering subsequent hardware iterations. However, if some
>>>> enthusiasts pretend to be company employees, and the maintainer,
>>>> trusting the tag, actively applies the patches, it could disrupt the
>>>> rhythm of the hardware manufacturers and is not conducive to code
>>>> maintenance in the long run.
>>> We trust people, not companies, so I think it does not matter for the
>>> trust what is written in ().
>>>
>>>
>>>> How about we add one more part: The organization name in
>>>> the parentheses doesn't necessarily represent the developer's
>>>> relationship with that organization, especially when it doesn't
>>>> match the email domain name. Maintainers should be cautious
>>>> and verify carefully before applying patches.
>>> Sorry, but how? First, maintainers have already a lot on their plate and
>>> you want to ask them to do some more checks? And how would these checks
>>> look like? Shall I ask people to give me certificates of employement or
>>> their contracts?
>> That's not necessary. Just ignore the content inside the parentheses
>>
>> during the review. This will instead reduce the workload of the maintainers.
> Hm? You said submitting patches document should instruct maintainers to
> "verify carefully". Verify what?
If the maintainer ignores the content in the brackets,
there is no need for verification. If the maintainer unavoidably
takes into account the content in the brackets while reviewing
the code, then the maintainer can ask the developer to contact
the organization mentioned in the brackets to help review the patch.
>
> We all ignore the content inside the parentheses, because it is not
> relevant to the code. I don't understand what sort of problem you want
> to solve with proposed text.

My original intention was to clarify this matter in the form of a document.


Thanks,

Yanteng



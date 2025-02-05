Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1220418A6DE
	for <workflows@vger.kernel.org>; Wed,  5 Feb 2025 14:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767194; cv=none; b=pOShX2ZG0P3O6sliYgIbtTo0TiGDknkHcXzYZ8q1EYXC5iNENw+q0ROPK4Ti6PWstRI3v6/SNuQskIRGJnveYaauNy92AXIpyC4CVJJmAeK5o1H1FWJzNF6n4yiWKaqO76qpXedHWyKV7iVUOFVR09Nj1LNWXx8t8VIoPsg48VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767194; c=relaxed/simple;
	bh=bVGwLDTZ2M0LdR+NL+4lFo9zVM9qqDiysDN17wLe3cY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+AXljKyou5qmsUgyaL7xdB/cBgTMtzlvPjFs41cYYbmStq3S2OdMsFo74pi8gdcwIW/aJ0JOyR8tZISlqVLsCpZiL0PRgIvlC2qmo+xS6Ik7i+lckwnanho64Lq25RoHIcKyv2qlckIhkA7wzL10k0gtMuX/ICY1gt9PMClwYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nH3gzyac; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nH3gzyac"
Message-ID: <64202cd3-fe83-41af-a9de-ec6eef5f4c21@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738767175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cqQdBLPMwbyw+5prAx/LdVM6tJtwE3l2vtWcsSV4VM0=;
	b=nH3gzyacR5Qwkn1NCmv7z6m/YoP9STa9B2/A0Y1YRWPj7SRb2zPDZFOkA1cDcETvihfLNp
	+XoCg3lSc2XK85nhkqXPnN9tvygnmuwp+opX0EfjGZ9bJ/x5gtE28y5S3wiQJCreVD2Nki
	rTRsd+Ss+wCNcvepanLvsbfJjz3Bx4k=
Date: Wed, 5 Feb 2025 22:52:06 +0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
To: Krzysztof Kozlowski <krzk@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250203174626.1131225-1-kuba@kernel.org>
 <0b68e534-df14-4496-802a-bc0437469720@linux.dev>
 <d3cdc752-fd61-41cc-a76c-7848d27a6802@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <d3cdc752-fd61-41cc-a76c-7848d27a6802@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2/5/25 22:23, Krzysztof Kozlowski 写道:
> On 05/02/2025 08:37, Yanteng Si wrote:
>>
>>
>> 在 2025/2/4 01:46, Jakub Kicinski 写道:
>>> Adding company name in round brackets to From/SoB lines
>>> is fairly common, but I don't see it documented anywhere.
>>> Every now and then people try to add the sponsorship lines
>>> to the commit message, fun example from this merge window:
>>>
>>>     Sponsored by:   The FreeBSD Foundation
>>>
>>> from commit 2ce67f8bf1ce ("wifi: iwlwifi: mvm: fix iwl_ssid_exist()
>>> check"). Better format would be:
>>>
>>>     Author: Miri Korenblit (FreeBSD Foundation) <...
>>>
>>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>>> ---
>>> CC: corbet@lwn.net
>>> CC: workflows@vger.kernel.org
>>> CC: linux-doc@vger.kernel.org
>>> ---
>>>    Documentation/process/submitting-patches.rst | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>>> index 8fdc0ef3e604..12ed28b3d113 100644
>>> --- a/Documentation/process/submitting-patches.rst
>>> +++ b/Documentation/process/submitting-patches.rst
>>> @@ -717,6 +717,12 @@ patch in the permanent changelog.  If the ``from`` line is missing,
>>>    then the ``From:`` line from the email header will be used to determine
>>>    the patch author in the changelog.
>>>    
>>> +The author may indicate their affiliation or the sponsor of the work
>>> +by adding the name of an organization to the ``from`` and ``SoB`` lines,
>>> +e.g.:
>>> +
>>> +	From: Patch Author (Company) <author@example.com>
>>> +
>> It looks great, but I'm a bit worried that it could be misused,
>> which might cause trouble for some companies. Even without
>> this patch, there's no way to prevent the misuse.
>> Consider the following situation:
>>
>> From: Yanteng Si (linux foundation) <si.yanteng@linux.dev>
>>
>> Obviously, I'm not a member of the Linux Foundation.
>
> Nothing stops you from doing this now, because mentioned format is
> already accepted.
>
>> This might seem a bit absurd, but I think it could actually happen,
>> especially with some driver code. Hardware manufacturers would
>> prefer to upstream their code under the guidance of their companies,
>> considering subsequent hardware iterations. However, if some
>> enthusiasts pretend to be company employees, and the maintainer,
>> trusting the tag, actively applies the patches, it could disrupt the
>> rhythm of the hardware manufacturers and is not conducive to code
>> maintenance in the long run.
>
> We trust people, not companies, so I think it does not matter for the
> trust what is written in ().
>
>
>> How about we add one more part: The organization name in
>> the parentheses doesn't necessarily represent the developer's
>> relationship with that organization, especially when it doesn't
>> match the email domain name. Maintainers should be cautious
>> and verify carefully before applying patches.
> Sorry, but how? First, maintainers have already a lot on their plate and
> you want to ask them to do some more checks? And how would these checks
> look like? Shall I ask people to give me certificates of employement or
> their contracts?

That's not necessary. Just ignore the content inside the parentheses

during the review. This will instead reduce the workload of the maintainers.


Thanks,

Yanteng


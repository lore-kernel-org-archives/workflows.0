Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77321459F6;
	Wed,  5 Feb 2025 14:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738765429; cv=none; b=qEN28F4j3Ffb2aQfkq6PTrREzhzXDt41qvIXLzS18IH6HN68rr3y96xPj6s5yDzzvUgs15fimYqJp751AH9GeyFNLS65uSroEm4+9i+K1MO30CtKhesMPqPIh7t4G5ow78G7PpHT07XkzsVLHZogE6ghBSTSQWJpRAk1NNjC2yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738765429; c=relaxed/simple;
	bh=pPAmot/mH+KDxF3xegHCQK+GMKX4OUi9mminojjFKuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dGbn85BfA/BGSAaNSv81B7mVMlf93CSA4o1ZzCk53KDbixv0cHSd2UmyjdmwUalJ4/vS96i6VafxH7obVp3IR+VvOdwZloP4ipaN1X7ZF+jx+MfVka2PGa2/ouLsxJeaXMkwgocrG1hzRbZvYjU77MNGLFA18/uoIuMS+l+rBlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RwU8q5VF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RwU8q5VF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03C1C4CEDD;
	Wed,  5 Feb 2025 14:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738765429;
	bh=pPAmot/mH+KDxF3xegHCQK+GMKX4OUi9mminojjFKuw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RwU8q5VFMZkgnHdisZmCZFK5WNzHoxBph58MJLU6qkP+aRy3rHHh6DtJfDt/zwWS0
	 0oc7++EVYbzgylylGDTjoqjXz3cCkCSuJYldE2RJ6xi5ADN3BN+vFs4b8cV7CU+sd4
	 hyPhXmcz2vmkG6wBHA41nb6vwOK5NnlQm/qSXMyNGBiX9e7pdCdo0s057zsIymohTH
	 Vm93V11coHRFRXe3UrDYNPThOfGHfK+GyBDMZT/UbtVFR/aLl1YjyEsCpFPbpn4Kz2
	 LVtzICxpyPrFxYMXXQI7lQVUORkKUyBmNQUrqO2FGMcmcn5KaoG2MZtPi/h0/8gziI
	 hP4MRam/iV/Kg==
Message-ID: <d3cdc752-fd61-41cc-a76c-7848d27a6802@kernel.org>
Date: Wed, 5 Feb 2025 15:23:45 +0100
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
To: Yanteng Si <si.yanteng@linux.dev>, Jakub Kicinski <kuba@kernel.org>,
 corbet@lwn.net
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250203174626.1131225-1-kuba@kernel.org>
 <0b68e534-df14-4496-802a-bc0437469720@linux.dev>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <0b68e534-df14-4496-802a-bc0437469720@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/02/2025 08:37, Yanteng Si wrote:
> 
> 
> 
> 在 2025/2/4 01:46, Jakub Kicinski 写道:
>> Adding company name in round brackets to From/SoB lines
>> is fairly common, but I don't see it documented anywhere.
>> Every now and then people try to add the sponsorship lines
>> to the commit message, fun example from this merge window:
>>
>>    Sponsored by:   The FreeBSD Foundation
>>
>> from commit 2ce67f8bf1ce ("wifi: iwlwifi: mvm: fix iwl_ssid_exist()
>> check"). Better format would be:
>>
>>    Author: Miri Korenblit (FreeBSD Foundation) <...
>>
>> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
>> ---
>> CC: corbet@lwn.net
>> CC: workflows@vger.kernel.org
>> CC: linux-doc@vger.kernel.org
>> ---
>>   Documentation/process/submitting-patches.rst | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>> index 8fdc0ef3e604..12ed28b3d113 100644
>> --- a/Documentation/process/submitting-patches.rst
>> +++ b/Documentation/process/submitting-patches.rst
>> @@ -717,6 +717,12 @@ patch in the permanent changelog.  If the ``from`` line is missing,
>>   then the ``From:`` line from the email header will be used to determine
>>   the patch author in the changelog.
>>   
>> +The author may indicate their affiliation or the sponsor of the work
>> +by adding the name of an organization to the ``from`` and ``SoB`` lines,
>> +e.g.:
>> +
>> +	From: Patch Author (Company) <author@example.com>
>> +
> It looks great, but I'm a bit worried that it could be misused,
> which might cause trouble for some companies. Even without
> this patch, there's no way to prevent the misuse.
> Consider the following situation:
> 
> From: Yanteng Si (linux foundation) <si.yanteng@linux.dev>
> 
> Obviously, I'm not a member of the Linux Foundation.


Nothing stops you from doing this now, because mentioned format is
already accepted.

> 
> This might seem a bit absurd, but I think it could actually happen,
> especially with some driver code. Hardware manufacturers would
> prefer to upstream their code under the guidance of their companies,
> considering subsequent hardware iterations. However, if some
> enthusiasts pretend to be company employees, and the maintainer,
> trusting the tag, actively applies the patches, it could disrupt the
> rhythm of the hardware manufacturers and is not conducive to code
> maintenance in the long run.


We trust people, not companies, so I think it does not matter for the
trust what is written in ().


> 
> How about we add one more part: The organization name in
> the parentheses doesn't necessarily represent the developer's
> relationship with that organization, especially when it doesn't
> match the email domain name. Maintainers should be cautious
> and verify carefully before applying patches.

Sorry, but how? First, maintainers have already a lot on their plate and
you want to ask them to do some more checks? And how would these checks
look like? Shall I ask people to give me certificates of employement or
their contracts?

The original Jakub's text is quite clear and does not mean AT ALL that
developer represents organisation.


Best regards,
Krzysztof

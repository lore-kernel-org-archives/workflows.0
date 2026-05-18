Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02578279DCC;
	Mon, 18 May 2026 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779121521; cv=none; b=VVMSY/DqRqbOOaFrBc+RUbiSMO4eV4BXxN2qvi4cyBFn2xcIwsfo2Jl0rQa/v7oBFad4BLhapjS9U9oUg1Ns3eNHMVGp3+hwcvTveg8mc0d8maE5mCscdOTj6RoPMxxbXAbynZz/ehnkhJ0SAq2u+23I4HLai9JH57p9ObedKxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779121521; c=relaxed/simple;
	bh=Yvug/rkJy3x/DTVDt7pixegJguZz6nZS2ADuwX1DSXw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Z2aDxcsPRrKUfJcrXsNTw7um5pXHKntsj50JztniLDxXnTBxwsE0zZbe4EvEHYIMms45GNZUsZas5plnLY+ln/gW4BS2uS2lnPFibQLpfU/7PsIZr3IVRPfRSLeK78XdJ3BILtYd3z4J7k3gVwObHMRx093xsQUqFDZUb3T3vJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ghMySlr3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ghMySlr3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=F0k8h0P8yeIbJ9N9KuaQ7GKHxxzGm6CK/9Y9921ojuQ=; b=ghMySlr3y4a0XPq95p4/cifORm
	GJt+qWjJj5HEnrH6x7HZHtIB/cnVbwNQtuJjFWYNYWz22LxXMz6eavNI0CdPQGO0M4d96RZXPa5yX
	p6zOXA92EV3plLubl5UA5qWiMLfxEscN6C7wn6EqrbLJ3hgE5nTMfpwVdQAW1yYDgtfXDFtc/sWOu
	avDyHxfRFf4lyNVO0YHyksLusQ5E8nZHce/8+q9MtLBNNB7mGiciI4AQHIR11zEvwlE6/eKh4EvR1
	Ylfe4a3mr61SmvpkVA28xm4L5ILm/6NjzA5MG6PBFfZ6NrZWJ5WLJu7LQyr/OsGDROWFNKVing5LV
	vSjk7I7w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0mJ-0000000GIE3-3vb9;
	Mon, 18 May 2026 16:25:15 +0000
Message-ID: <47b4f655-1a89-47a6-a3fb-9e82184c5fe4@infradead.org>
Date: Mon, 18 May 2026 09:25:15 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] docs: submitting-patches: Clarify that in English
 "reviewer" is a person
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>
References: <20260516123846.63413-2-krzysztof.kozlowski@oss.qualcomm.com>
 <ce1e5e9b-83d0-4971-aee3-dc5a8f85ce22@kernel.org>
Content-Language: en-US
In-Reply-To: <ce1e5e9b-83d0-4971-aee3-dc5a8f85ce22@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/16/26 7:39 AM, Vlastimil Babka (SUSE) wrote:
> On 5/16/26 14:38, Krzysztof Kozlowski wrote:
>> Common understanding of word "Reviewer" is: a person performing a review
>> work [1]. Tools are not persons, thus cannot be reviewers in this term.
>> Also tools cannot make statements ("A Reviewed-by tag is a statement of
>> opinion"), since making a statement needs some sort of conscious mind.
>>
>> Our docs already clearly mark that "Reviewed-by" must come from a
>> person:
>>
>>  - "By offering my Reviewed-by: tag, I state that:"
>>
>>    Usage of first person "I" and word "state"
>>
>>  - "A Reviewed-by tag is *a statement of opinion* that the patch is an
>>     appropriate modification of the kernel without any remaining serious"
>>
>>    Only a person can make a statement of opinion.
>>
>>  - "Any interested reviewer (who has done the work) can offer a
>>    Reviewed-by"
>>
>>    A person can offer a tag thus above does not grant the tool
>>    permission to offer a tag.
>>
>> However this is not enough and apparently English is not that precise,
>> so let's clarify that only a person can state the "Reviewer's statement
>> of oversight".
>>
>> Link: https://en.wiktionary.org/wiki/reviewer [1]
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Vlastimil Babka <vbabka@kernel.org>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Linus Torvalds <torvalds@linux-foundation.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> I agree with the intent that the tag is for people (whether they use a tool
> or not to help them). We also don't put "Tested-by: kernel test robot" or
> syzkaller on every commit that they test and find no bugs. Review is also
> not just about absence of bugs, but agreeing with the larger design and
> whether the change makes sense to do in the first place.

Ack that also.

> So whether that's achieved with this particular wording or differently,
> 
> Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> 
>>
>> ---
>>
>> I find it silly to need to describe English, but it seems it is needed.
>>
>> https://lore.kernel.org/all/fd3b2ca7-4d64-4c4b-98a3-7d3285fa6826@roeck-us.net/
>> ---
>>  Documentation/process/submitting-patches.rst | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>> index d7290e208e72..a989de43f3db 100644
>> --- a/Documentation/process/submitting-patches.rst
>> +++ b/Documentation/process/submitting-patches.rst
>> @@ -581,10 +581,10 @@ By offering my Reviewed-by: tag, I state that:
>>  
>>  A Reviewed-by tag is a statement of opinion that the patch is an
>>  appropriate modification of the kernel without any remaining serious
>> -technical issues.  Any interested reviewer (who has done the work) can
>> -offer a Reviewed-by tag for a patch.  This tag serves to give credit to
>> -reviewers and to inform maintainers of the degree of review which has been
>> -done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
>> +technical issues.  Any interested reviewer (who has done the work and is a
>> +person) can offer a Reviewed-by tag for a patch.  This tag serves to give
>> +credit to reviewers and to inform maintainers of the degree of review which has
>> +been done on the patch.  Reviewed-by: tags, when supplied by reviewers known to
>>  understand the subject area and to perform thorough reviews, will normally
>>  increase the likelihood of your patch getting into the kernel.
>>  
> 
> 

-- 
~Randy

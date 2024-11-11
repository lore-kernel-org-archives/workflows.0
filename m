Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277151A76DD
	for <workflows@vger.kernel.org>; Mon, 11 Nov 2024 21:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731361850; cv=none; b=Vdcbg9EVqp/KSVUkGtthwf3L51tY+hmiBMyUlBotHd/3yi26DthmHDZYoB2IW2FiqoawZ5Glp3fz/BQZ4li0LgkO0vy6WmTcaJ9Wso0TJ8hMXZOFgtG5PdmDXN2TtYrWix+LBBOW4KjkrJTTXAfqtkQs309A4wAakvqI0hb/FUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731361850; c=relaxed/simple;
	bh=MPQeKnaWTF2BtKp7h3B6PyRLtxT35Y+RYfzvu8/8URg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZSXp8xKlGKisAjUKSv62w6cLQgXkyUjoaSyXGN/AMGG6H0bRCyyTYahJsCdnW2bVH40FgZynSS9zc9AfdETWTC5I5GLqyTUSj48HPzKm51pWAtJ+r6s9tZ0PJeIN2ZnDH4QsO1ZLTrFwXQDzlFiS+bbtPmi4TjDixTrxKaCqaCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TDOSenGF; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TDOSenGF"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-83e190085d7so94369439f.2
        for <workflows@vger.kernel.org>; Mon, 11 Nov 2024 13:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731361847; x=1731966647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9AxjVA5/HgV5DZ//XN7GFMRAQHn3w235k86G9IFoLpA=;
        b=TDOSenGF/166OwOaPW6TV1RpQZGyQA//EW9J84vqS9uus7ZezLhVo7PrBIGFlfx5Fs
         DPbMvCHcSSr0jE6qydBJzfkquGQ02U5EwjIUNcVqbiZfqIk4QffTwbmjnfzf+5NKPQ5Y
         Ge+z2Klng0nEGzMuPT2iFDrRTYouICERwq7Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731361847; x=1731966647;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9AxjVA5/HgV5DZ//XN7GFMRAQHn3w235k86G9IFoLpA=;
        b=IUiUCTXmfe+7g5Rq65xSRx4mmsjSqnkmtDPJoJB3Y444nKFQ1js34eiNOIgHHdxz6a
         QkmaxNVwU30pid9d1sgsU2BaL4xcQukCelTTnOF5FRIaJzm08kg2XtmjWW5enATGP3nq
         3DlbLoOwa7I0LvGcCAm/SS9KlrBO6bmtd7M77Rc5YXuyWxLg/NLIuX8jYX8P9mRBGvNh
         MMSWPAofkTqwSZvJeEcnMYywG6d2OaC36qBFmfFv+oyeG50SYvVSDYHlEem/T7kJhsyY
         MAxfZZIc4/4EQp8fdZdJHbdSgCcQYsatUbhbkXFWW+DSE5UfErjtNoFF9WJnRBOidIJP
         rU0g==
X-Forwarded-Encrypted: i=1; AJvYcCV9Li7DtdZFRJB8wF2Zh8gIIWqOX+vuFbllaxeJEbISU3JGe2PR8hB2tkEU9n9zy40WkaYzhB4kKTY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0uIYc2XILJ7BT361/3N5t+34r+aq8OD5Ojq3o0uMQG/xTqzFj
	07doR6XJKo6dynoiJYErMEPi7OmM8T1wYqNf8dG3cij8SBzL5I2IiAtK8iF0bkA=
X-Google-Smtp-Source: AGHT+IE1QV7CkuUH/P2kWeh1vj6LXaXnLm1KrQKWtXb3F8T6ourahKgGnWEedhu3RrNmqOT4/lnwig==
X-Received: by 2002:a05:6602:1408:b0:835:4d27:edf6 with SMTP id ca18e2360f4ac-83e032b8401mr1734349739f.7.1731361847001;
        Mon, 11 Nov 2024 13:50:47 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de787efaa9sm1519306173.115.2024.11.11.13.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 13:50:46 -0800 (PST)
Message-ID: <ba3d5492-e774-452f-9fe0-e68b743c6b0d@linuxfoundation.org>
Date: Mon, 11 Nov 2024 14:50:45 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation/CoC: spell out enforcement for unacceptable
 behaviors
To: gregkh@linuxfoundation.org, corbet@lwn.net, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, Dan Williams
 <dan.j.williams@intel.com>, Dave Airlie <airlied@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241108161853.12325-1-skhan@linuxfoundation.org>
 <ZzJkAJEjKidV8Fiz@phenom.ffwll.local>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZzJkAJEjKidV8Fiz@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/24 13:07, Simona Vetter wrote:
> On Fri, Nov 08, 2024 at 09:18:53AM -0700, Shuah Khan wrote:
>> The Code of Conduct committee's goal first and foremost is to bring about
>> change to ensure our community continues to foster respectful discussions.
>>
>> In the interest of transparency, the CoC enforcement policy is formalized
>> for unacceptable behaviors.
>>
>> Update the Code of Conduct Interpretation document with the enforcement
>> information.
>>
>> Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
>> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
>> Acked-by: Jonathan Corbet <corbet@lwn.net>
>> Acked-by: Steven Rostedt <rostedt@goodmis.org>
>> Acked-by: Dan Williams <dan.j.williams@intel.com>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> I think it's really good to document these details. The freedesktop coc
> team is going through the same process, we've also done a talk at XDC
> about all these changes, and I think this helps a lot in transparency and
> accountability in practice. With that, some thoughts below.
> 

Thank you Simona for your review and feedback.

>> ---
>>   .../code-of-conduct-interpretation.rst        | 52 +++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>
>> diff --git a/Documentation/process/code-of-conduct-interpretation.rst b/Documentation/process/code-of-conduct-interpretation.rst
>> index 66b07f14714c..21dd1cd871d2 100644
>> --- a/Documentation/process/code-of-conduct-interpretation.rst
>> +++ b/Documentation/process/code-of-conduct-interpretation.rst
>> @@ -156,3 +156,55 @@ overridden decisions including complete and identifiable voting details.
>>   Because how we interpret and enforce the Code of Conduct will evolve over
>>   time, this document will be updated when necessary to reflect any
>>   changes.
>> +
>> +Enforcement for Unacceptable Behavior Code of Conduct Violations
>> +----------------------------------------------------------------
>> +
>> +The Code of Conduct committee works to ensure that our community continues
>> +to be inclusive and fosters diverse discussions and viewpoints, and works
>> +to improve those characteristics over time. The Code of Conduct committee
>> +takes measures to restore productive and respectful collaboration when an
>> +unacceptable behavior has negatively impacted that relationship.
>> +
>> +Seek public apology for the violation
>> +*************************************
>> +
>> +The Code of Conduct Committee publicly calls out the behavior in the
>> +setting in which the violation has taken place, seeking public apology
>> +for the violation.
>> +
>> +A public apology for the violation is the first step towards rebuilding
>> +the trust. Trust is essential for the continued success and health of the
>> +community which operates on trust and respect.
> 
> Personal take, but I think a forced public apology as the primary or at
> least initial coc enforcement approach is one of the worst.

Seeking public apology is in response to unacceptable behaviors which are
serious in nature. These incidents are exceedingly rare. When these incidents
happen, they usually resolve when another developer/community member points
out the behavior. The individual responds with a voluntary apology to
mend fences and repair harm.

The CoC  gets involved only when it receives a report which is the case
when normal paths such as peers pointing out the behavior to repair the
harm haven't been successful.

This document isn't intended to be a complete summary of all actions the
CoC takes in response to reports. There is a lot of back and forth with
the individuals to bring about change before the CoC asks for an apology.

The CoC seeks public apology only when it is essential to repair the harm.

> 
> First, a ban or temporary suspension seems too mechanical and not in
> proportion with the offence of failing to apologize. In my enforcement
> thus far as maintainer and now also freedesktop.org CoC member we only use
> punishment if behavior has failed to change _and_ we need to protect the
> community from further harm. Usually it takes years to get to that point,
> unless in extremely severe cases (like public harrassment campaigns) or
> when the person stated that they refuse to even consider changing behavior
> at all.
> 
Please see above. Public apology is necessary to repair and restore the
health of the community in these rare cases when an individual doesn't
understand that their behavior could cause harm. The CoC tries to get
the individual to realize that offering a public apology is necessary
to repair the harm and resume respectful and productive discussions.

> Public means you're amping up the stakes and massively increase the odds
> of people being afraid of their reputation and losing face. In my
> experience people are a lot more reasonable when you discuss their
> behavior and what needs to change in private. This even includes the case
> where a temporary suspension had to be put in place already first, to
> protect others.

Please see above. The CoC works with the individual prior to taking the step
of asking for an apology. It is a balancing act between repairing
the harm caused to the individuals at the receiving end of the public
unacceptable behavior and working with the individual to understand the
harm done by such a behavior.

The CoC is mindful of the negative impact of seeking public apology and
instituting ban could have on individuals.

It is a tough balancing act because not taking such actions would lead to
longer term harm to the health of the community. These actions aren't taken
lightly.

> 
> Lastly, a forced apology puts any victim into the awkward position that
> they're forced to decide whether they want to accept the apology, or
> reject it. This essentially offloads part of the CoC enforcement work onto
> victims, which often are not the ones with the power to actually stand up
> to problematic behavior.
> 

This scenario seems to be based on the assumption that the CoC's first
go to action is seeking public apology. This is not the case. The CoC works
towards reaching an understanding between the parties behind the scenes.

As mentioned earlier public apologies and bans are actions taken when
the CoC deems they are absolutely necessary. Bans are instituted only
when the TAB agrees with 2/3 vote.

> Note that I don't see this as a nack, just a heads up that there's a
> potential conflict. I'm not worried though since Dave and me know pretty
> much everyone involved in both CoC teams. I'm sure if this ever becomes a
> real issue we can bridge things and figure out a solution.
> 

Thank you for you feedback and input. The CoC relies on the trust and respect
from the community to the work it needs to do to ensure kernel community stays
healthy as it continues its development work.

thanks,
-- Shuah


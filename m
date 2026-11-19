Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795089878;
	b=x4obz3AvJ3spgq/Tily1jO5Cxn4dnC25OFc53Hr8xpGYzIWy2jmTz2bDGwTID1tgJ6C4
	 v9XPDnoP4WEAHKSV9te81uXa906Ox3NKoZGvVgZUgPLImHnhnK0WrK9gTHJJPxefGRqej
	 JPRpTZy2t9wVGOKI6UxouEdxG7uHl9DP4nZTvfK9YCYoMJXZGOIlEWJo3gNQiL1YBqP/y
	 ptNJwBdk+CaV0QliX24So1OERU7w+0tZKuo+23YxNMtGaAruhbFW2luMOnCEqmIe3GK4X
	 Dh1pOH/gwnWvrcPpyMObp/yfRtouAQVvg8pAE8c67HdVIptWhZByh/1nbzuqDT8xlAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089878;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=GOA/J5I9rv5yu70ULErbreyfKmQjDBAfhvcoTjeNzBg=;
	b=D/2VakVl7yWv+XLeGFibVqCHdHCiehZxYr5nS4lnqJDo0hglbjqmMm914/1qteX7ASYk
	 DliOM0dj5y4e09DvEhCGAmaZyaA9QHZs7O2MA0fpYW/I1DdKpx03bopT4hCYXYaesZxo/
	 QdlTcx2aTDF5oBVXzfaaz6Qy9wskqVtJ1EfJN6RmwPMuPhQ1VNOSeNUIlhPpz4qkd4+Im
	 spzjW8Y9WaiZjMtysW0E5WRS6ap8f22hHWGWoGhQvJNyLF33A1X2FInKG8bZZzJzejb8F
	 xh4c3wg/nb98kuAJpmKiwk1IdmhE6nBNL01HFp9tueKsaQWR8O9Iy80cpYITbJPz5EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f0gdXj1z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AB8606A320;
	Thu, 19 Nov 2026 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f0gdXj1z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BCD1F000C5;
	Thu, 19 Nov 2026 12:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795089878;
	bh=GOA/J5I9rv5yu70ULErbreyfKmQjDBAfhvcoTjeNzBg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=f0gdXj1zGX2PWbe2LcL561e2/v0+FF+y0FImDUvRGBH7r7LbhsBTMt32sj3tzbyJk
	 JCTE2rliShI/dO10ApGKdzRQbe1UTso4Phaeel3BTBdC9kbooD58tn30wpV4Ag2c5I
	 ennwdUNUP1cu/QO7ehHQu4BMXA0qyiRLKXaB1EEdGqLl3UQVIEGExBKsPjnE+Ly954
	 C2zMsueiQD0sMWX+oHBwSfigYYbt89OFdZ4nMkLfBnyHeqeNatjN/1G5TicV79YGHL
	 prGsbncuw8UzL4HXV63PrXxp3a7VRBzI53XX/+p5CGmVK1ldWm3FotnaWDqn0geOhV
	 5kNL5NHbrakpw==
Message-ID: <04ff90ba-296a-4618-9d25-390f84f856ae@kernel.org>
Date: Thu, 19 Nov 2026 13:04:32 +0100
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
To: Leon Romanovsky <leon@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
 <20261119111902.GH162713@unreal>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261119111902.GH162713@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2026 12:19, Leon Romanovsky wrote:
> On Thu, Nov 19, 2026 at 11:13:57AM +0100, Krzysztof Kozlowski wrote:
>>>> v1: https://lore.kernel.org/r/20261116191436.188098-1-sashal@kernel.org
>>>>
>>>>  Documentation/process/coding-assistants.rst  |  6 +++--
>>>>  Documentation/process/submitting-patches.rst | 23 ++++++++++++++++++++
>>>>  2 files changed, 27 insertions(+), 2 deletions(-)
>>>
>>> Sasha,
>>>
>>> Since you're already making changes in that area, could you add a sentence
>>> asking reporters to provide the full dmesg stack trace?
>>
>> If so, then trimmed. We do not need all addresses and registers and the
>> [time markers], but rather the calltrace from decode_stacktrace.sh.
> 
> Regarding time markers, I agree. However, addresses are an important part of
> debugging information. These bugs are rare, but addresses are still useful for
> identifying incorrect pointer arithmetic or pointer assignments.

Depending on the case, e.g. some driver lockdep reports don't need them.
NULL ptr usually as well. The point is that dmesg should be trimmed to
relevant and useful information. If that includes addresses for that
particular case, then of course these should stay. But 75% of data here
in commit like 5b4bd13e0552926648a46c2c9a12a24dfaee3715 is not really
helping. In the same time undecoded call trace is useless, because these
addresses depends on the build. The dmesg should simply be the decoded
stacktrace ONLY for this case.

Best regards,
Krzysztof

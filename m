Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772708;
	b=lj8pSslylxzgBVJAVPQG/EpWigJBzBPPIx5AVqDTpMxiCepU/qL9K5F50F5r9kMg3V8p
	 4Gd8NSw2/h12CAlk5QTCOaVspSqjGOkNfraseYHzmp4iqpbQudyD82UhKGtb7SAJOe3Xg
	 M8nNjE9p71bkDcg90CLDTbcUidNdLI9oI+2C6u1wUZ8o4S94M97FokOuyx6NaprwRaiGz
	 El0AnriurtVFiEwTg8IVPZhCMGNvSq5A3o035x6s2PNfDcj+/QHQqCBEORAn/QEUjUvg5
	 m2jDRuMA/1OkUi2b6R5divKVdjkejDOQPmKr+gKwF20iV4guiFRWjGXPMmbu0NDJ6FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772708;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=HQ1nMzCOqC/SeVNQTHyDhpzPVd30R97igUGXV2V0Dig=;
	b=q/Hw8W9eT2BtuaytrBfenwTtV9sqz+ASvaHSUzu0SK7yKMkPD3NqgSNps0Jfz4122B+c
	 CEMSvUUopKOJPB3a9tRff1coUz0DUz8AulYPH1xl3SJY6wCxRxNk53VihrGa+FVMDfAAT
	 rbQkzOHcxRZc0Z9HOCaGDwvj3US5rSZyqCYHIRrWfBqMWszcBKXHpTVloEH1Atyt9FEtR
	 pY1ov3fUKEl5gJ4GMDkeMmayyGmArN+z3fe9CInwLb0phEpbuUjLwY7AcZpiVugPBFSOL
	 1np3YHTD0qIq6VDz+k3o93sgM/QWoJrpyRY23ufPVJJmUkCNW87bdNjDp4Y3myO1h5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L5EsrOEC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D109606A32C;
	Fri, 27 Nov 2026 09:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L5EsrOEC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9009F1F00899;
	Fri, 27 Nov 2026 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772707;
	bh=HQ1nMzCOqC/SeVNQTHyDhpzPVd30R97igUGXV2V0Dig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=L5EsrOEC/ehZOk1IJY+xiTLoVIi8GDXcu5JX7TJy/bhH73p8K5fDTSc6NudcYvemd
	 rts7eeZ8OqPAzYdSmvalt25VlSJHurrt2vQ69v+/UorRuBhugqiXIjimdLvhGR9wZ+
	 wGetCbust4OWi/9Zn3R7oaKWNDcvNxNqtpI7A5CEdN1Rfll5KPza68/UahZZS0EXoV
	 lBZHKwWfWH9738kE+yklZbyznN5vjlLHi88RNBwqFwR0uBCmoE69PvIj2inuZ4tbbW
	 u0hvZ/rIcTRxFle+QFExBYHgO2a4nH1JQILlyxyXCyr0woXD2pPrYOAh75mm9rerAA
	 a1QwulQmK3BXg==
Message-ID: <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org>
Date: Fri, 27 Nov 2026 10:44:56 +0100
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
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs and
 a cover letter
To: Willy Tarreau <w@1wt.eu>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Marc Zyngier <maz@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Hans de Goede <hansg@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Jonathan Cameron <jic23@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Theodore Ts'o <tytso@mit.edu>, Security Officers <security@kernel.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-2-sashal@kernel.org>
 <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
 <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local> <awjopqoCJqwChwnF@laps>
 <awlCy3vDs0fKx1ku@gremlin> <awlNYsu1y8EhYgor@1wt.eu>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <awlNYsu1y8EhYgor@1wt.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/27/26 10:29, Willy Tarreau wrote:
> On Fri, Nov 27, 2026 at 09:18:34AM +0000, Lorenzo Stoakes (ARM) wrote:
>> +cc Laurent who is probably interested in this and AI policy stuff in general.
>>
>> On Thu, Nov 26, 2026 at 09:19:18PM -0500, Sasha Levin wrote:
>>> 2. I'd argue that LLMs these days have the capability to write better
>>> changelogs and most of our human authors. We just need to be better about
>>> laying out our expectations of them.
>>
>> Strongly disagree with this, it doesn't match what I see in practice at all.
>>
>> I'd say that >50% of my review work is of AI-generated patches now, and the
>> commit messages and comments are consistently appalling + seriously painful to
>> deal with.
> 
> Note that every word in Sasha's message counts. *capability* doesn't mean
> that it is commonly exploited. Commit messages are horrible most of the
> time but when properly explained over long sessions they can get amazingly
> better. The other word was *most* of our humans authors. The Linux kernel
> community isn't the largest set of commit message authors and is already
> doing very good at this. Look at many other projects to see absolute
> horrors like "update" or "rebase" for the most verbose ones, when it's
> not just "-".
> 
> Whenever I was given commit messages by an LLM, I had to reword them,
> but some were very close to what I could have written. And I must admit
> that a few times when I only reworded a part of the message first and
> came back to it later, I was no longer very sure where I stopped. *This*
> is a good indication that they can get better than what you usually face
> (or that mine are terrible as well, in which case we're back to first
> point and I'm part of "most").

I'm not even sure what we are discussing here and why. I work through crappy LLM
generated commit messages all day. Yes, I also use AI to clean them up and it's
exhausting.

So as usual: in the right hand it is very useful, In the wrong hands it's not.

Why are we so focused on generalizing things here? Don't we have better things
to do?

-- 
Cheers,

David

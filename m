Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094195;
	b=H9JsP+btuAM3pzWA/uQRKxIhmzsqTTxZh/aLPNSij96LIFyr+TQkNvIwhB31zagxaKxu
	 ZUHtz9m3u8YTovZ+9tXIBltzO2dpt5wQ1Y3zCLGFGqntcmk/D+JKERuP5JGxnrK2xhHUj
	 zzDq/JdjdUtoMA4ypIkae5LR+kdL//1uzFKq791P9LsHmmzUAs2p4kwl/WBYV5YN2A/fW
	 dk3QdGox8EErt88hxBtSXzfFoDN4kKjBs20Ug3C7rx2rIFuOdYB0bxYUCuF+r5VKyLO6/
	 IsTzNK4IvmeRBgJU8UROfH+3IX5/ho2EZORmXiAGD2/sFCjqAkXNyIVRP/anxDjKN/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094195;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jB4ECimn8JE8m8qf9GYzHtviAJa7n1bNNMlxq3iHHKw=;
	b=B1HAaGfmIea1zJEhi1SeCn/zlhfbp1HoWmddwPT0x4NVYdMRC4PTWf/7lpokgQjeB2vO
	 dIqmWN7d5zdwPUXR20ju+hYQjscwsNVy7MoppKNkUACUGC73DonirAkt6fZVPmpKTInzG
	 4tlFtLFlpyBbqNx2e3FsUUxI8sFXwCmMgGT+Lg8hJUAnwV2yt8506Y/sQpWaeN3I2zcP1
	 cQWBei9FiwL8yBOZw9SW/VbA+xbZ3VHZDNhaUbiB8CAibjbJ0Kf5jy7tqiwDDN5UzgS5b
	 0ozWAJ9EnigiYhtfDVwOkzYfX86Gox/4EYl2Ys9pbhBJoCv3AiSj8RyBSQpxcIuerBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b62NzgId;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9D3606A320;
	Thu, 19 Nov 2026 13:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b62NzgId
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB741F000C5;
	Thu, 19 Nov 2026 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795094194;
	bh=jB4ECimn8JE8m8qf9GYzHtviAJa7n1bNNMlxq3iHHKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=b62NzgIdWJhU0od5NiSdYnd9x9V1Sy4jb65uEK/kYo64to2KJ+ca9x8d2EH3M2NS8
	 GZdRc1HiLgV7cjRk5z6ziImGDIKEmF2s525ftfBZ58qE9W9ldZsfiywhChLoqKWKjI
	 yKvNaCGSLqx7z8fPdHbihacsCmF8ok/Y8bKRvOejXkSRYPM0meLxolGkW1PW4ioag/
	 6BsndYsUdHlQljB6gfiiWrZ+aRFR2S5P7FIFnf1+WruOrdlBr7FYpur0lo4GmhFRPE
	 V9fQATH8FHMtllBkOny4jPb2BBYO40mA2YI4Pr4grXidzfvGnO4G0yI2KxLRJtNszs
	 dDShcsJ1C7wdA==
Message-ID: <6baae2d0-f0d5-4528-b885-220605350349@kernel.org>
Date: Thu, 19 Nov 2026 14:16:30 +0100
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
To: Leon Romanovsky <leon@kernel.org>, Willy Tarreau <w@1wt.eu>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
 <20261119111902.GH162713@unreal>
 <04ff90ba-296a-4618-9d25-390f84f856ae@kernel.org> <av7tY64O34gbJvH_@1wt.eu>
 <20261119125450.GJ162713@unreal>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261119125450.GJ162713@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2026 13:54, Leon Romanovsky wrote:
> On Thu, Nov 19, 2026 at 01:36:51PM +0100, Willy Tarreau wrote:
>> On Thu, Nov 19, 2026 at 01:04:32PM +0100, Krzysztof Kozlowski wrote:
>>> On 19/11/2026 12:19, Leon Romanovsky wrote:
>>>> On Thu, Nov 19, 2026 at 11:13:57AM +0100, Krzysztof Kozlowski wrote:
>>>>>>> v1: https://lore.kernel.org/r/20261116191436.188098-1-sashal@kernel.org
>>>>>>>
>>>>>>>  Documentation/process/coding-assistants.rst  |  6 +++--
>>>>>>>  Documentation/process/submitting-patches.rst | 23 ++++++++++++++++++++
>>>>>>>  2 files changed, 27 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> Sasha,
>>>>>>
>>>>>> Since you're already making changes in that area, could you add a sentence
>>>>>> asking reporters to provide the full dmesg stack trace?
>>>>>
>>>>> If so, then trimmed. We do not need all addresses and registers and the
>>>>> [time markers], but rather the calltrace from decode_stacktrace.sh.
>>>>
>>>> Regarding time markers, I agree. However, addresses are an important part of
>>>> debugging information. These bugs are rare, but addresses are still useful for
>>>> identifying incorrect pointer arithmetic or pointer assignments.
>>>
>>> Depending on the case, e.g. some driver lockdep reports don't need them.
>>> NULL ptr usually as well. The point is that dmesg should be trimmed to
>>> relevant and useful information. If that includes addresses for that
>>> particular case, then of course these should stay. But 75% of data here
>>> in commit like 5b4bd13e0552926648a46c2c9a12a24dfaee3715 is not really
>>> helping. In the same time undecoded call trace is useless, because these
>>> addresses depends on the build. The dmesg should simply be the decoded
>>> stacktrace ONLY for this case.
>>
>> Then just the 2-3 lines capture inline, and the full log attached could
>> please everyone ?
> 
> I don't think so, because this information is also important to preserve in the
> Git history. I received offline feedback that the full stack is useful for
> backporting and customer support, too. Sometimes the dmesg output is similar

Just like we do not mark commits as fixing CVEs/security issues, which
plenty of downstream distros would like us to do, we do not write commit
msgs for backporting or customer support. Just look at that commit I
pointed out - 5b4bd13e0552926648a46c2c9a12a24dfaee3715 - the addresses
are making things less readable and the readability is important.

If you need something for customers, then that is what Link tag is for.
It can point to your bugzilla or email report with everything.



Best regards,
Krzysztof

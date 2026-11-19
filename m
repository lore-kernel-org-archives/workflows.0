Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083242;
	b=mllknsZ4C4R6xw2OJt7vwqHdtxkknkXC6G3ooj8oHE84DJ2vFqBTJ07gfbka1PT6w4Ur
	 7iZ8GPLzTt7fFC76R/QnX55El8ipeHTMaNhRoy85vEM+cJ5KOrxFIfvCYwmIJmqyIyDwl
	 yPqFFT/j8KzIgLDTrb4H842eeZtdwqX7UaGMGzb+UCDhIKCRQyMx3CVHO2ZBr1OEsG9Mm
	 NliH4w/h4ZopMHZZtPutiinGee5XXV43ifApKqzw0u2ifvr1e3o6pjbEFX4+iFXLNy4QH
	 5fayTKXoOW+ufCewsEwSPUtWEReSIgZ2WQCJpd73/552POH2Ymxk7ngLvQ5bINWnR6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083242;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DWt3CLOh3ZYbzS8NVJmfBMxyc/YHy7CMAqMHtrI2Wqc=;
	b=GLwrYGwRL06muHJOSvHFqvIm084wEd9FJL82BH807vcIfyITA03XyCQc5VJo6IsgSmvV
	 17RHaZKDx/ysn2zq0f58U6HMocq4j02g1oTLQ+/0LBT1BF6+2JZ5npiVimsga1uzt8/B/
	 ouRF2WKaEyb43kSMDk1nZg6nUsJx8nnPkQmHXmDpNzo7yyBS4scecBhWNxSCgj+MCD3C8
	 DfUnxcK5GeqeunVWSothBkQ4iKcTrmUqSoTjvBMucNTr/72p0LRCtfkdWXM8sjZE703nT
	 OhD0MccPc4/hwFja9f3dmWiJrnqfeardJOMH7604+ie/tP2C4q+MMaFuvGUVrYRcehg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E3qLMLfb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACEB606A320;
	Thu, 19 Nov 2026 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E3qLMLfb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3AD1F000C4;
	Thu, 19 Nov 2026 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083242;
	bh=DWt3CLOh3ZYbzS8NVJmfBMxyc/YHy7CMAqMHtrI2Wqc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=E3qLMLfbJneDL0wnoBI3JVlT+y02b12RXX9KG3nngkyZuspQNMY43k/AiZemdFgmY
	 rYh9VcIGD3M0dA5CoyIcXfW0WR7+3Yyc0LhYIjjTs3zfwmu2Mj0jK/gRa/K5VgL03p
	 6zSEYuyMK7NxoTLs6W3x+ntuZe7z+0WygXGiB3gGHZAdvg/iICGjxCUPMocFZmNgGN
	 mcdqTXeTycylpSpfPZcn9DBEh2eF+Le4SKJIQyptHicLmuXLOQO8fZqbAzyup6vTCm
	 JVHH1ZhKnxQjcksZR7AqVXIGG4qFzpUbs4CUZt2q+qCDjMGJR6OyXqyRhn4b46MxKT
	 8IrRgq1MHiheg==
Message-ID: <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
Date: Thu, 19 Nov 2026 11:13:57 +0100
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
To: Leon Romanovsky <leon@kernel.org>, Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261117092723.GA124972@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2026 10:27, Leon Romanovsky wrote:
> On Mon, Nov 16, 2026 at 03:05:15PM -0500, Sasha Levin wrote:
>> "Describe your changes" already asks for the user-visible impact of a
>> change, but changelogs for fixes still tend to say what the code does,
>> why that's wrong and what the patch changes, and stop there. Whoever
>> has to decide if the fix needs backporting is left to work out what
>> the bug does to a running system.
>>
>> Say what that means for a bug fix, in two parts. For users who aren't
>> looking for the bug: what a normal workload is likely to run into, and
>> separately the worst case and what it takes to get there. For someone
>> triggering it on purpose: whether an unprivileged user could do it and
>> what that would take, since a race that no real workload loses can
>> still be won by a program written to win it. Give the paragraph a
>> label so people can be pointed at it.
>>
>> Coding assistants are told to commit a fix with a message that
>> describes the problem and the solution. Add the user-visible impact to
>> that list and point them at the section.
>>
>> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
>> Link: https://lore.kernel.org/r/20261111171055.527b4bf3da705367bc78a64c@linux-foundation.org
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> Acked-by: Andrew Morton <akpm@linux-foundation.org>
>> Reviewed-by: Willy Tarreau <w@1wt.eu>
>> ---
>> Changes since v1:
>> - Split the bug-fix paragraph into users who aren't looking for the bug
>>   and someone triggering it on purpose (Andrew, Willy).
>>
>> v1: https://lore.kernel.org/r/20261116191436.188098-1-sashal@kernel.org
>>
>>  Documentation/process/coding-assistants.rst  |  6 +++--
>>  Documentation/process/submitting-patches.rst | 23 ++++++++++++++++++++
>>  2 files changed, 27 insertions(+), 2 deletions(-)
> 
> Sasha,
> 
> Since you're already making changes in that area, could you add a sentence
> asking reporters to provide the full dmesg stack trace?

If so, then trimmed. We do not need all addresses and registers and the
[time markers], but rather the calltrace from decode_stacktrace.sh.
That's often review feedback, btw, people just paste huge bunch of dmesg
without thinking what is useful there.

Best regards,
Krzysztof

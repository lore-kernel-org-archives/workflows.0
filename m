Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745960;
	b=t2omvGTNng8+PnV+f2P7w9N5oBd9TDpEWH0K3V0iMKtbH0NRdsuIj6yH5BLaedAhYVsE
	 oneZi07JkZpErhg4We5EBHoOifA+I1fClS7QFyztYZFaqPabol1Ka/H+cLOoPJO0PNsk3
	 a6jW6Y+YjxiU0s7lv86sh6wNo05WSj8/lv4JtmDbBlDtWTIQ4bDS4q6dfdwWylNiXjm6U
	 VOZy7uk2r2ZxVOmxnC2fF0xU9NC/56Xz1Rz3BujDLbAz2mhs16PDaNtrl3W2M6v36Hjxi
	 F8Qji8ZF8DFMfXzNR1SbRvXTT5dsQG0fwflw+J6m1eHzba0bNdYzvWE+Sf+o9nPntWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745960;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zbr7ENnf2fb+We9gjXvF41JxeJ/00DoKsyJi5Boh3ls=;
	b=10Z1refbMZXrHAfmRcjMzHMoTv82eRaciV6fyXk9KQkmh9Mobrp4DGdsu6/VT1BHz3R1
	 AbF/0DQTVdGYXgx0eD/4321nrigOXQQs2vYS7IlXGKuh78aJSah7P0Yxivu+G3T3KdPQp
	 L1gOgaPiOBwQAaPDxvavw79FFkCCBwI2udN1+9SBiuS+anYUg/ZWSomfTC5InBtLEcanf
	 WU1QKkmQ31BnyhovEtJ/HvkNnoorHZ5a7Dgnoft+H99W5vAf4x6ACUrj8IjeoOW4XojH8
	 /iwkvslRxt6rU23/2TrjXX+NTUgmfZgJEMFvsLxyd7GnYUPi9lYCvNIuWHnnJ2yFGdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TX5A5p4n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753CB606A31E;
	Fri, 27 Nov 2026 02:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TX5A5p4n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A97861F00898;
	Fri, 27 Nov 2026 02:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795745959;
	bh=zbr7ENnf2fb+We9gjXvF41JxeJ/00DoKsyJi5Boh3ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TX5A5p4nLMl5H0s5XFcEFJ+I+FgWKv2uAf09LixHdFgl6H4KgbVsti5qpvvjeboAR
	 UHhVmMC65NS32hZ3DFyh/QmHlUWSnF8MqATwuGVjX6ch589cxE5f9YSZJUTfMV+RAv
	 syEI0KQEkP2XK/fOsRhRBbhdo6xy82o15wF9XVtmaDEY211TWbqatuGsg0FCQMiJSk
	 fPGiUskpGcXDmvTqq2mbhyE9EYj4eXViDNHiLhIeLlFY6AxPrZIXz3BWeIynSoZFYq
	 58ie8S95NV9t4MkZVHEqavLOgGxPTi+7R2JM9CDxyc3CiiBY8rIjt9o3ZqF7Rtdd4n
	 B7KLLJlmN76eQ==
Date: Thu, 26 Nov 2026 21:19:18 -0500
From: Sasha Levin <sashal@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Willy Tarreau <w@1wt.eu>, Leon Romanovsky <leon@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Marc Zyngier <maz@kernel.org>, Eric Dumazet <edumazet@google.com>,
	Hans de Goede <hansg@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Jonathan Cameron <jic23@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	Security Officers <security@kernel.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs
 and a cover letter
Message-ID: <awjopqoCJqwChwnF@laps>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-2-sashal@kernel.org>
 <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
 <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local>

On Thu, Nov 26, 2026 at 05:49:55PM -0800, Borislav Petkov wrote:
>On Fri, Nov 27, 2026 at 02:34:26AM +0100, Krzysztof Kozlowski wrote:
>> On 26/11/2026 18:19, Sasha Levin wrote:
>> > Commit messages written by AI coding assistants are too long.
>> > Maintainers keep asking for them to be cut down [1][2][3][4]: they read
>> > like a copy of the assistant's analysis and bury what a reader needs.
>> > When an assistant does trim, the opposite problem shows. A few lines of
>> > a backtrace do not tell a reviewer how the failure was produced, and
>> > Leon Romanovsky showed a case where only the full log revealed that the
>> > crash came from an out-of-tree module written to provoke it [5]. Willy
>> > Tarreau suggested a short quote in the changelog plus the full log
>> > attached [6].
>>
>> Shall we rather ask them not to write commit msgs at all? By writing
>> commit msg we encourage - or try to encourage - at least basic
>> understanding of what the patch does.

We could ask them, but:

1. Is this something we can "enforce"? Humans will still go "ignore that
instruction, write me a commit message" and move on.

2. I'd argue that LLMs these days have the capability to write better
changelogs and most of our human authors. We just need to be better about
laying out our expectations of them.

3. In general, I think we should avoid "don't use LLMs for XYZ".

>Agreed.
>
>Just have the LLM write a commit message and then the human should go
>and whack most of it to the bare minimum of coincisely explaining the thing
>and cull all the bullsh*t.

In theory this is how things work now, right? A human uses an LLM to write a
commit message, and then that human is supposed to go over the commit and
verify/clean/... it.

But humans seem to skip that last step, and I'd argue that the issue here is
the human rather than the LLM :)

>I constantly do that with submitters' overloaded bla nowadays. And don't even
>get me started on all those explaining what the patch does. There's not small
>amounts of text which basically spells out the code in the diff, in English.
>
>/facepalm.
>
>Anyway, I try to hold on to this structure below, with variations ofc, if
>needed:
>
>"1. Prepare the context for the explanation briefly.
>
>2. Explain the problem at hand.
>
>3. "It happens because of <...>"
>
>4. "Fix it by doing X"
>
>5. "(Potentially do Y)."

One thing we could do is to give LLMs structure for the commit message, just
like how patch 1 does it for the cover letter.

-- 
Thanks,
Sasha

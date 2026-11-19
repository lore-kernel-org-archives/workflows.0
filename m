Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087147;
	b=ffoU/b7wjLPVW+3Q6l5yhIG5+ERcXXNpSLwuyOeNXh9XiKTNNeeB0UT/PzZnKAtTekG0
	 2u3laXuP6FVm/xj7CVpTs1Wo1r61/V108+pru3AA3S5/LjbnXk3JmeomRnIdwj0/OFEIS
	 sv/V3SykJ7EcKVwASZlJq/8TLMNTX6El8NPi0zoEdG9TUtGj7UH1PbNJ7XymcOWl9Xu+z
	 mvfuV/JmK8AO946Pb0wA8t50EHGnbM/5viaDqW5mb0RA7LdqwZ2OglmgNnq1gy9yHRigr
	 ZUnYGrmfUo4PkXdeu3w0PumQ155LN8qhZt1mlRQ+RGW/Du6Bd6h8EGbzX3CqDjgNA4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087147;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=3VUSKnIl+LJq3BnCaXAcoNm4riQqtVLxTQHK2cEkWZo=;
	b=DQwaH4fKeRCgfjT6MhHu14ob/pNErNB1Vt/GWVPHqW+40OXLfu0D36Xwi21GPpv+iOje
	 GOtJnUIJV7VBGvjylf0TmzQhnQ8Rml8FnFQ59nQzh26rVmSbe5FCBAmJ/uEWWNaV4kZN2
	 CfxBuRftTQ0CXIxn7GEJWgUFfpuenRYDPm1NvrxzsoSF3d29qWjRd1cWPa3HxpN783YAI
	 tcaG+thIaZJZ6oSblzU2bYJ1ytCzmSPT2Sn+vMCNyKR9CaufjL9caa8drWOZyb1yif1jQ
	 qqxkVjwCCPun0ksOFkh6b40x9UbIp/AE2bOx+MD+cfafBPuwoGw1RdmlZCfWJKVlJtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JfPVzl0n;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776B0606A335;
	Thu, 19 Nov 2026 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JfPVzl0n
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2251F000C8;
	Thu, 19 Nov 2026 11:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795087147;
	bh=3VUSKnIl+LJq3BnCaXAcoNm4riQqtVLxTQHK2cEkWZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JfPVzl0n3Bk+/Pyol7bjpKMTTZ7WFP02Ccy77RO8O5jLfm7Y+fmSCrfsP/jwFoCYe
	 Q/OUZcczMJAAiNCXbG/4GRlH4kohv3K7BHBDQYwQUHjoi9d9XOTcbVPaUXzui1BmRK
	 mpRuKpOWx9AKKVd30I/I18E4mh7+4JSm+Zfl2errrdBKNwvnaPfr7MhsDxGCRFdcOG
	 PSwtywLl/5nYA8HfXqy5VWx7CDQWgbBmilEUmqlqHj+US5sImX7PtacpS8hEE+AN5m
	 IYRlFKdCxF2vwCZQ/Uy1HaYcGNBY1ZZuEv4P1zl4VQEBu12RwldwcHIvxJA7l4QU27
	 wP/0yoaVfaWlQ==
Date: Thu, 19 Nov 2026 13:19:02 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <20261119111902.GH162713@unreal>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>

On Thu, Nov 19, 2026 at 11:13:57AM +0100, Krzysztof Kozlowski wrote:
> On 17/11/2026 10:27, Leon Romanovsky wrote:
> > On Mon, Nov 16, 2026 at 03:05:15PM -0500, Sasha Levin wrote:
> >> "Describe your changes" already asks for the user-visible impact of a
> >> change, but changelogs for fixes still tend to say what the code does,
> >> why that's wrong and what the patch changes, and stop there. Whoever
> >> has to decide if the fix needs backporting is left to work out what
> >> the bug does to a running system.
> >>
> >> Say what that means for a bug fix, in two parts. For users who aren't
> >> looking for the bug: what a normal workload is likely to run into, and
> >> separately the worst case and what it takes to get there. For someone
> >> triggering it on purpose: whether an unprivileged user could do it and
> >> what that would take, since a race that no real workload loses can
> >> still be won by a program written to win it. Give the paragraph a
> >> label so people can be pointed at it.
> >>
> >> Coding assistants are told to commit a fix with a message that
> >> describes the problem and the solution. Add the user-visible impact to
> >> that list and point them at the section.
> >>
> >> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> >> Link: https://lore.kernel.org/r/20261111171055.527b4bf3da705367bc78a64c@linux-foundation.org
> >> Signed-off-by: Sasha Levin <sashal@kernel.org>
> >> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> >> Reviewed-by: Willy Tarreau <w@1wt.eu>
> >> ---
> >> Changes since v1:
> >> - Split the bug-fix paragraph into users who aren't looking for the bug
> >>   and someone triggering it on purpose (Andrew, Willy).
> >>
> >> v1: https://lore.kernel.org/r/20261116191436.188098-1-sashal@kernel.org
> >>
> >>  Documentation/process/coding-assistants.rst  |  6 +++--
> >>  Documentation/process/submitting-patches.rst | 23 ++++++++++++++++++++
> >>  2 files changed, 27 insertions(+), 2 deletions(-)
> > 
> > Sasha,
> > 
> > Since you're already making changes in that area, could you add a sentence
> > asking reporters to provide the full dmesg stack trace?
> 
> If so, then trimmed. We do not need all addresses and registers and the
> [time markers], but rather the calltrace from decode_stacktrace.sh.

Regarding time markers, I agree. However, addresses are an important part of
debugging information. These bugs are rare, but addresses are still useful for
identifying incorrect pointer arithmetic or pointer assignments.

> That's often review feedback, btw, people just paste huge bunch of dmesg
> without thinking what is useful there.

It’s still better than AI-generated prose peppered with short, two- or
three-line stack traces intended to trick me into merging a patch. I’d
rather trim the description myself than rely on random submitters to
provide exactly the right amount of information—no more, no less.

Thanks

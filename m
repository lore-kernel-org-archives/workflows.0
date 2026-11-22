Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795337427;
	b=hlAkFhPSIFvFmebFa8WRZgvswX9ipJe7HteV3BfDp4QUsK2Fp3yxXmRadhNauKDt7DXj
	 QcIO1kk40zZRK7fIazJIkGoZRQHrPxIOjBBu6ySWUkAZ1Fwewhk3UPsXQIs7jQY+exrGl
	 0HlFyqUNwsQVcQoqLZ0dIgQpyib98+/3lTA+JCXLkxqoQwPR7P44BtaVdgJ0rrk5/HKo9
	 w/zXMmwb4wjDTYyG+ogNnfRGmHZhzNfOFRf6G9QJUa6idrInU24NGkWmPjxdAYOb0p0yO
	 GdDJcB69vY1b8z61iwnGc3xahtzNCjb2ai8NXYFFarz8IDDAEXo/dheAZj5QIHLMvUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795337427;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=1zCgrqGMERKRx3wFipmnFpOXfxQMJHLUrbXmxg8+a/4=;
	b=zXQ4HlZLskY0A0TCMSsZLVQgjxWaMU9lUKXmwXg00tdnbWFHdx6PJcwDMK6iGpujY+aS
	 m7G0dUkuKfQP6ugbGUa21C24d9ldFhrpD6l5N7oZuku6hWyWhDti48JE0HR07MYCWoCeQ
	 evMlbLMUy7MNAI9E0scHHHbs9RzDgO+/OqLU6S+HbV7HDaEhhw2RJyjGNme8aMq8FZHeU
	 yascraBzd4SZtgAGZBEcCBUS4z7A7qSbpyXAKEmnEeQCjOhrMm+YBcyXZB5yU63Oi+yRI
	 iu4yZzYVZ3/q2GNnnmPrYK6h9WIolTe7CAXHBG4DSJEPUZtDAg210q4jy6iizVdaKhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hUrRuN0V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C36B606A320;
	Sun, 22 Nov 2026 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hUrRuN0V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CA41F000C0;
	Sun, 22 Nov 2026 08:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795337426;
	bh=1zCgrqGMERKRx3wFipmnFpOXfxQMJHLUrbXmxg8+a/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hUrRuN0Vgu3NVUWZ+KNrsAQhIDrMKZ/Cxj5dALSNfLzFoDxr9TMJ+KBLpnRq5lYtB
	 69BTFYJMx50ENAFgkTBwqCFDmNpY5U1uu6ZnA7c1W78SgZp55iZn87cKPWJ9rIBaGk
	 ULqZELtG3TSXrfVJOJUQTFHABQhdIwNEI5vSpjwDgXqbAk7AnIDUqiUuGUh2X1sbth
	 PYbdOazsQFqPilpNU99vsmiml76Fhf536otZjcmxC/r5LjMXVNv92XjIBJcwCGZsot
	 6BLg6JoPKuF0OssV8Am1SfRg/hH1nGu6FYSfJ5FuyI029e65T9tR/lVcAbTQj9UmDt
	 tZVoF50gcirdA==
Date: Sun, 22 Nov 2026 10:50:22 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <20261122085022.GB14811@unreal>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <avxtxScVa9KvUH_K@laps>
 <20261117152721.GC162713@unreal>
 <av7s5eV7Ws9Io3cE@1wt.eu>
 <20261119125947.GK162713@unreal>
 <av7zGbqXizmXY4R-@1wt.eu>
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
In-Reply-To: <av7zGbqXizmXY4R-@1wt.eu>

On Thu, Nov 19, 2026 at 02:01:13PM +0100, Willy Tarreau wrote:
> On Thu, Nov 19, 2026 at 02:59:47PM +0200, Leon Romanovsky wrote:
> > On Thu, Nov 19, 2026 at 01:34:45PM +0100, Willy Tarreau wrote:
> > > On Tue, Nov 17, 2026 at 05:27:21PM +0200, Leon Romanovsky wrote:
> > > > > > Since you're already making changes in that area, could you add a sentence
> > > > > > asking reporters to provide the full dmesg stack trace?
> > > > > 
> > > > > In this doc, we already ask them not to [1] :)
> > > > 
> > > > This is really bad. You assumed they would trim the logs correctly, and I,
> > > > as the recipient was expected to trust that they were accurate. They are not.
> > > > 
> > > > They trim everything, which makes these logs useless to me. As I said, they
> > > > include AI-generated reports, cases with reproductions that are impossible
> > > > with upstream code, and reports for completely out-of-tree code. Everything
> > > > like that was visible in original dump stack and it is lost now.
> > > > 
> > > > > 
> > > > > > Many AI-generated patches reduce it to one or two lines, which gives no
> > > > > > indication of whether the report is genuine or fabricated. Early in the AI
> > > > > > era, I saw some completely fabricated stack traces.
> > > > > 
> > > > > Is it still an issue?
> > > > 
> > > > I don't know about faked, but useless yes, especially in the cases where
> > > > in-kernel API is involved.
> > > 
> > > The situation completely changed over the last year. LLMs that would
> > > hallucinate bugs and dmesg in single-turn conversations have been
> > > replaced with agents/harnesses calling shell commands and able to
> > > capture contents without inventing them. I agree that we should ask
> > > them to capture such dmesg which nowadays have no reason to be faked
> > > anymore.
> > 
> > The meaning of "faked" has shifted. As you said, it previously referred to a
> > completely imaginary call stack, now it refers to a custom module that abuses
> > the in-kernel API. The latter is still "faked" because it cannot be done with
> > the current code and unlikely will be possible in the future.
> 
> Ah OK we were indeed not speaking about the same cases.

Over the weekend, I realized that after this wave of incorrect and deliberate
misuse of kernel APIs, we’ll see the next level - misuse of internal driver
APIs as well.

I’m referring to the various EXPORT_SYMBOL()s in large, complex drivers
such as mlx5, bnxt, and Intel’s drivers.

The idea that “let’s trim the dmesg stack” is going to be a disaster for
everyone involved.

Thanks

> 
> Willy

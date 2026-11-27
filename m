Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789529;
	b=hXuZib9SpD3bxI7cLUkydJ+wJeYF77/K/4fdJjnpBxVbZgVNNUJKNRMCzhMvPvhfbAa8
	 klg4Bv9EgqztcHSjnDGwuf5zTQSAWhNYpyYpivEOXULFMT0J+PioC/hKfM1gQ63BeEVrr
	 wqzcwc4iBDUvvd3HbuyEkfEqnHJ60WKeS2mSHK15n8e0DFMHzcRVIizlF/x0yK1GFxOoc
	 50Eg5l3sbF6NM6bNozn1Nhq/OOtj7exOlLg6j0RA6GKPv/ONcvNlYEvJTqs+76fG4+6yE
	 7ZDiuehFyMyIRrbyAw7hoqvrkMY58kG1teYy1w5EeJXx/LFbCX7MLIsJ3/IeKlRihFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789529;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sAEolzOIM70FIe+DF+g867O9e0VeOd2C7o08IvmfF2U=;
	b=pJj95fzzgYQIHAkjRYKMs3cJNPlhEiBPrM5hB8W5a9hTeTcDkxNUMgHl+ARQ4Fle/BOG
	 IeqO/IgNt9ABnyRtud61TY4cDE5/j81yX0fSNXdctXqLYika5rgCGHeFNuiqhMdoFDQDK
	 s9QHhbrdfn+84YjAEjCmWaJPf1PpqKQBU5xG8NuG6lLtRiID58P+7cRu5BXcV23/v9Z4U
	 gUr8k3JSFjxV+o/gAu++i/XflZAix0Ec8UYwdUJ32RP/kmfcZCFPyNm7DvTxgmKZSemw0
	 QQLUsFstUJnkxt3UQQ19QXbVe2QH13giuaNgiGlvqkVre4Rif8IWh38WdcrHDYgGbiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AsSx/jvm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6807D606A32F;
	Fri, 27 Nov 2026 14:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AsSx/jvm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53E71F00932;
	Fri, 27 Nov 2026 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789528;
	bh=sAEolzOIM70FIe+DF+g867O9e0VeOd2C7o08IvmfF2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AsSx/jvmEOmakOVIGaiv5Dxim8kLRkesooQ5KkZ/bix8+BYuaS+coqN4/Rjzrz6ar
	 WlhA1Y0Sd7BzN6Rf7gyucUsBk9kc+/7D4nf/86DQo6HA2Y0b8o+L5uWmdDftZEY5YB
	 4LjPBmIp6dH64upinzO9uLFx3HTSORYF/JD614Ehs2DuyHwoqb/mUjxizPbdH/8O8w
	 qIWAPHffrH9XJSelP8OcJoc5q78MTYeIt+2GhAZPPO7iZpfjLsfYiXUUNlFeomYbfN
	 IwqJNImafJsRvwRDmpzMe51C1qphHWj6+Mq9t2MYCcXaXYUpGakxL2KcBEJhOo4tLY
	 vyZgZv5eWx30A==
Date: Fri, 27 Nov 2026 14:25:20 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Sasha Levin <sashal@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Leon Romanovsky <leon@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Marc Zyngier <maz@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Hans de Goede <hansg@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Jonathan Cameron <jic23@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Theodore Ts'o <tytso@mit.edu>, 
	David Hildenbrand <david@kernel.org>, Security Officers <security@kernel.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs
 and a cover letter
Message-ID: <awmRvPlPoyMMzHsB@gremlin>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-2-sashal@kernel.org>
 <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
 <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local>
 <awjopqoCJqwChwnF@laps>
 <awlCy3vDs0fKx1ku@gremlin>
 <awlNYsu1y8EhYgor@1wt.eu>
 <awlOYxw29ANZOA1X@gremlin>
 <1b630619-4388-454b-b295-6ebd0d912a32@sirena.org.uk>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b630619-4388-454b-b295-6ebd0d912a32@sirena.org.uk>

On Fri, Nov 27, 2026 at 02:11:27PM +0000, Mark Brown wrote:
> On Fri, Nov 27, 2026 at 09:38:43AM +0000, Lorenzo Stoakes (ARM) wrote:
>
> > > time but when properly explained over long sessions they can get amazingly
> > > better. The other word was *most* of our humans authors. The Linux kernel
>
> > Completely disagree based on fairly extensive review experience. Commit messages
> > from humans are orders-of-magnitude better, it's not even close.
>
> IME it depends a bit on the complexity of the change and the area, for
> simpler stuff I'm seeing some obviously LLM generated changelogs that
> are at least as good as some of the worse human written ones.  For
> complicated or core stuff where you really need the changelog that never
> happens but for things more in the "get audio working on my laptop"
> realm it's plausible that you'd get something useful.  For those simpler
> areas the tradeoff with the submitter fully understanding their change
> is a bit different to that with core code.

I agree it does better with more trivial changes, but I've found the -> entropy
happens with even modest complexity, and it's always the same kind of patterns -
code-as-prose, ludicrious compexity, word salad, etc.

>
> > They can get better, yes, but in my experience consistently remain
> > appalling. Perhaps excluding rather mechanical changes.
>
> Yes, I think it depends a lot on the scope and nature of the change.
>
> > Of course I am happy to be proven wrong in future, but for a policy going
> > forwards, that policy should reflect reality.
>
> > And I think you missed a key point I made - that this is _crucial_ stuff as it
> > is the commit message(s) that give you an overview for review.
>
> > This stuff alone contributes to maintainer burnout. Let's try and take action
> > that pushes back on that.
>
> TBH I think the issue you're seeing here is the changes themselves and
> the changelogs are a symptom, it's difficult.

They're both a problem, but the commit messages and comments are consistently
awful and a major cause of change because the commit msg is where I get the gist
of the problem and if it's word salad, their ain't no gist there's just pain :)

I really feel the fundamental rule here is 'only submit what you understand'
(90+% of AI stuff I see breaks this rule, maybe more).

So writing your own commit message feels like a very sensible thing to expect of
somebody.

If we even have expectations at all any more :)

--
Cheers, Lorenzo

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798028;
	b=x6977NhKMfpuKJDf0BN/ttpcX/lr/nof+mMCaPNUvCZCeJ28lhkkwjvnR1Ykl23XxYEO
	 S+9M+18cXH6QJPP1adpuzEhM0K2uyFnNe6vR6bvQf3+EuNzG+ycvWlshsAJQrN9Pf4SNG
	 TNe6YaoRpkIEjD1ErQiJ5Pm05C9wuhubtoXt7gOqSgck9sS6dYG5wNQqEOjs+Askpe1gH
	 2zt897fxP63pAM3IZ3lmNAhMJ8ZHVyG7yNbdVqoIjNl/BKP1J2WLYZfoK17VeTBwxvmik
	 NLWe5U+Tz8K2qVnmmpEJu7Ax9RFVmKyKS4W8semEi9Yd7xpkUNsJRCpNOWIGTpX39Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798028;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zx3AnSzZZBDI5AJfT34gcNM62do8VpPC/Q9qG67J7oY=;
	b=26AGQ1jgxQLGfaFWveW7fUUHt2lTuMg5Ga7r9ly1rbKpU8bCtEQ6q1ioxdyJut4ypogu
	 IQ1Hvo0LDvE2AmFqCQbSyrUjZXfZWFslnDKlOSs5e9Devyk20Qor7wZ8G9Lx4yKdCA2Np
	 pumgHG+WE8PC56yS4u66Oc8tnJEAOxr5YgWdcrAAJxhhu5Dcj8X2S7Cvf4XmRvcR5vEBe
	 GGNMYDcHyP/mS4MJD1Pgop0v5Glwjk3Y7EAXXeqy1tVvygAI4AgTdLUGjpddJKmraetcd
	 kK55+yxHNeEgf4RIQf7bo5Ovzjrkk9UPdgBApvwDuB7wkwjqKaoA6vKJ9BqnneI3SWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DaPO+bzJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92D8606A31C;
	Fri, 27 Nov 2026 16:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DaPO+bzJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B1B1F00893;
	Fri, 27 Nov 2026 16:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798027;
	bh=zx3AnSzZZBDI5AJfT34gcNM62do8VpPC/Q9qG67J7oY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DaPO+bzJsE5GLOz7Ck9rQcpq5b6CRDRJXTWvW8cxGodR/PrXA/qV1eTni370++3c5
	 ceKpTcS4Nkdr/+OUUYUFmXhh/tMMylUUVijoNPnkfbkvmWT0B7x4g47mhK48CTZQSP
	 2KNnCFR58/WCJajArfTe7XSa059425rIN5wTaU/T7PZzIrmaynN0j+/f85x22vA+UA
	 nt2VejMTitX65N6aiUr0I2/+DCe0fTblsZqcXQfLTJtucVGqXD2RaFr3ROWqAgBpfZ
	 WHsY1+XtBlo3rVXSyZ4IPRYEw401Zx8NgiB2o5SPSZB6j8ohCeai7lZ+6ji1Hjip9x
	 iX/OH6gkPupUA==
Date: Fri, 27 Nov 2026 16:46:58 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Willy Tarreau <w@1wt.eu>, 
	Borislav Petkov <bp@alien8.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Leon Romanovsky <leon@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Marc Zyngier <maz@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Hans de Goede <hansg@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Jonathan Cameron <jic23@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Theodore Ts'o <tytso@mit.edu>, 
	Security Officers <security@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs
 and a cover letter
Message-ID: <awmrvCPm6ZI7Yd7_@gremlin>
References: <awjopqoCJqwChwnF@laps>
 <awlCy3vDs0fKx1ku@gremlin>
 <awlNYsu1y8EhYgor@1wt.eu>
 <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org>
 <awlR9pQUjodcLjZK@gremlin>
 <20261127133756.455469-1-sashal@kernel.org>
 <awmJ2c87NSDjtSwp@gremlin>
 <20261127143124.1039470-1-sashal@kernel.org>
 <awmU4L01OH9kWEVv@gremlin>
 <20261127153902.1320179-1-sashal@kernel.org>
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
In-Reply-To: <20261127153902.1320179-1-sashal@kernel.org>

On Fri, Nov 27, 2026 at 10:39:02AM -0500, Sasha Levin wrote:
> The series calls for *less* text in the commit message. The extra text goes
> into the cover letter, which humans can ignore if they don't want it.

You're just shifting the slop around and encouraging more of it, ultimately
no?

>
> >Where was this floated? I didn't hear anything about it? Was it another
> >decision made by a cabal behind closed doors? :)
>
> Hallway track during LPC mostly :) There's no "decision" here. Folks were
> raising both concerns: "the changelogs are too long, they suck for humans" and
> "the changelogs are too short, we don't get enough information / the AI fakes
> stuff".
>

I haven't a clue why anybody would say they were too short, I have never seen a
slopped patch where that was the case?

Why would adding more text address faking? That seems orthogonal really?

> >Anyway, let me rephrase I guess - please don't ask LLMs to add more slopped
> >text for me to deal with?
> >
> >I really dislike the idea of a cover letter for a single patch in general,
> >but from an LLM you literally just made my life twice as bad.
> >
> >Please, don't?
>
> I suspect we won't find something here that works for everyone, so subsystems
> could tune it in their maintainer handbook docs if they need to.

This is just 'shut up' in more words no? (did you use an LLM? ;)?

Am we in the community permitted to debate the defaults? Or are they already
decided upon?

>
> One question though: what stops you from ignoring the cover letter altogether
> and looking only at the commit message? We can have AI explicitly tag a
> "slopped" cover letter if it'll make it easier...

Now "Shut up" + "ignore the spam" :)

I've got the distinct impression my views are not welcome on this topic,
rather had that feeling from the start (my changes to
docs/process/generated-content required me to -shout- to be heard).

I've engaged regardless because this impacts my + other's day-to-day
experience of the kernel majorly, and I feel this stuff is a survival-level
issue for the kernel.

But I'm not sure there's really great RoI for me any more, given it seems
one can only have minimal impact on this as a community-member.

So I think I'll disengage from the thread at this point.

Thanks, Lorenzo

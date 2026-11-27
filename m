Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789224;
	b=M4ZwsbQ5NueFLN7Ggc0FdvGZGuMbabzSXAQkNHgPQW2VkdN6Jj6epLqgfk3mRPsXmNjO
	 EzQaKHxOUaYFg0KSyU/ZcHitnMtsg57hXlZfpbDMdQyvxmyXyTY4QDh4yJWdhFrwq+ZwN
	 EyLZHjEyO4Ov/G/TMrq2FKnRLbAk2ua7Idz5WsrU7/MRbfqMhFf5Ybf2x6FzGgE3gR9yl
	 hwz023YF84XFSSI/5h0dFz3byhLcWMMJlf6p1vM0ahjra4NIibadXzk9UBro4ijgEIN0N
	 as2AouWobeTThUbmZnxnOvippx1jEMpzEVpqOdasz0KNUj6CaQ1I3BRziw1hpyXvWvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789224;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zDonTA+XVrq9djSM+x9RFri3pyjLvkL3UWrZ6Scv8Fo=;
	b=uQvxS8ioqSjdYsDRBPBoSPeLV+KCV/IJ204+29ABrYe9Be+Tqe1zBVdMdMppDQhQPFHL
	 vDTJAZnnOqNsfpyzN5nwO0nMMJ/itTVzCfhhNHSlRAl+2ZRmvGUyicqrdphqWuSbNPUyD
	 2irA0XaJbseJTFt5lftK1giDEQhX3sv9fY1wNbZvSBqQ84AtD9OZ6UqkT3+Y7xE4lMYP/
	 lidxKE5QNxIFA7axxGmnlimfB2YWiwRbpfpqJILxJjLeLmoj2zCOgpHOuvD06S58P2Bct
	 py/yCF0jUx/msHCTmIBWfAK4iMiLeE/KwMqm7ljmfQJL5mPmi5SPzkS/6zHH+VbwMpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fqg8W2bQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A39606A31F;
	Fri, 27 Nov 2026 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fqg8W2bQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B420F1F00893;
	Fri, 27 Nov 2026 14:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789224;
	bh=zDonTA+XVrq9djSM+x9RFri3pyjLvkL3UWrZ6Scv8Fo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fqg8W2bQnCb4g/G62o/AAh71qlxsZk3hvzMJWrzH6Tz1IxUcIPT3pZi6xTJ4xnU7v
	 t4ofOgK9rNlSsHucac2mdAStP3LAQ4pPIuWj4sBQeykTRUGohwnZuztsEBNhAr14YA
	 0ly83HMdX93YXXqQ/76mcFlPH/7KJIGHbMP/C60T8r49tvjtH1/fEsZkke8UOZkA2B
	 U1jfAEaR7mZZgM6RyuyejDQnI6YodUcvV8XVk27bG0U+vw91JjXu8E0rkwYY04NTOr
	 E9z5bYPNKVUQdz3hgmV7SjF9MInboZd2socpoClgDHFa2hZNyLVpkpwp53PwOhp6Mm
	 0SNgiK9PZ0qcA==
Date: Fri, 27 Nov 2026 14:20:15 +0000
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
Message-ID: <awmJ2c87NSDjtSwp@gremlin>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-2-sashal@kernel.org>
 <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
 <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local>
 <awjopqoCJqwChwnF@laps>
 <awlCy3vDs0fKx1ku@gremlin>
 <awlNYsu1y8EhYgor@1wt.eu>
 <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org>
 <awlR9pQUjodcLjZK@gremlin>
 <20261127133756.455469-1-sashal@kernel.org>
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
In-Reply-To: <20261127133756.455469-1-sashal@kernel.org>

On Fri, Nov 27, 2026 at 08:37:56AM -0500, Sasha Levin wrote:
> On Fri, Nov 27, 2026 at 09:54:07AM +0000, Lorenzo Stoakes (ARM) wrote:
> >On Fri, Nov 27, 2026 at 10:44:56AM +0100, David Hildenbrand (Arm) wrote:
> >> So as usual: in the right hand it is very useful, In the wrong hands it's not.
>
> Very much the case. But we can't stop the "wrong hands" from using it, so we
> need guardrails around them that make it produce what we, as a community, think
> is the right thing.

These aren't guardrails, you are just trying to modify the output of
something that's broken here IMO.

>
> >I've dropped a bunch of reviewerships because if this keeps going, I'm going to
> >burnout completely.
> >
> >And to me the TL;DR is 'this bad thing you are dealing with on a daily basis -
> >is not bad, it's good, and we should have more of it, but only if you hold it
> >right'.
>
> I think we're actually agreeing here: LLMs write crappy commit messages today.
> My point was that they have the capability to do this really well (the "and" in
> that line should have been "than"), we're just not getting that out of them
> right now. These things just helped prove the Riemann hypothesis, I have a hard
> time believing that a good kernel commit message is where they hit their limit.

Allegedly proven [ as I gather the Stoakes-Navier proof was not in fact that ]
:) and as I recall that proof is a GiB of text ;) so y'know, kinda going the
other way... :P

But I have yet to see an LLM capable of being able to write a good commit
message, even when effort is expended to help...

And people aren't going to be using the latest model with unlimited
resources to do this, they'll use whatever-they-have.

>
> And it's not just you or me. That's exactly why the cover letter quotes a whole
> list of maintainers: pretty much everyone is hitting this. The series is there
> to push back on what you're dealing with, not to ask for more of it.

It's based on a presumption that the instruction will make things any better.

If anything, I've found that an LLM attempting a more succinct output often
simply outputs the same trash with missing steps, making our lives even
harder.

I think a placeholder works better, personally.

But I don't think this, as-is, is really going to help anything.

+10. Write the cover letter described in "Cover letter" above from what the
+    previous steps produced. This part is not optional, not even for a single
+    patch or a one-line fix.

BTW this seems to be instructing LLMs to generate cover letters for single
patches which I don't personally love to see.

And it therefore gives the LLM double the chance to post awful word
salad. So I'd prefer not to have that clause ideally.

--
Cheers, Lorenzo

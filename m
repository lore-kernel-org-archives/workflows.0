Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772332;
	b=R6t93gB0XXCsQG394AgUubuVt2XFuHX63kCbkb1qMnxvKS8ocKhteAZ8BT75l1TW7IhS
	 L0n4cuEtQyzEe71k4dGctLgJWkij973DiV/+dKOntFiOP7eydKSk1xYocs80Ueaa/DaRi
	 WNemY1yej+LZv/Uw91/1Eg0iFlrymV7lY9/l/kh3F6X4f0PXhqo+9573JkDBx8QcyA/hf
	 YIH8X5RVilPfNCF6ZjFl4FE/6iY/cmDA2Fe4CNgyWaZcasVeBm2vWmzYDJ6E4+5NCV+MZ
	 ME2hGCJ2pz+11Y+UtZXy+x1rxj3bjjhmRQB4XNVxMdBalHbipUqovhPr5twHiFICaWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772332;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=af07nmAT2WSeLQ3r8HG4fx8NCBpnVFPXtLomeeFOOx0=;
	b=rI9HqBRweQyAlWJ/pQHqquEfy1ljuzHNUPDPrh5p/BOzfouOyxiYOEmFt0aXNxDgxpnq
	 L3SnwcGKNLq+Z5EIGKOXcOu8bYI1UEY8i+0Gtx4wUU8W02+brjH+d94R/XWDKJ3qaL5au
	 Ym1Uvgg0VatMo5q5ytwEFQMSkl+dQTw7rt/9EFo9WklZ4dfftgJp3coXmVRYf78uNaos3
	 alDw1+XQUqRCih/ovFJOSwjXxMB6Z2v9CV6nCfJhIvg8KsM96IoKaVrt0wrd7jdEUbWpI
	 4UpJMWZf4QJr54NEIaFJidyd0TDMyCJHTnQx3uZGpKAx/SxwDl5+L65KnnraEY4FHNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cWVclR63;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D3F606A31C;
	Fri, 27 Nov 2026 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cWVclR63
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F241F00893;
	Fri, 27 Nov 2026 09:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795772331;
	bh=af07nmAT2WSeLQ3r8HG4fx8NCBpnVFPXtLomeeFOOx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cWVclR636p/2K+YGUB2W5gV8J7QwvbdUU3viSXljAXhzwcn4L4LHTV8BTqb8q9N4o
	 lazqnwsJamhj3bTqgh40aP+oNJh9XKiB4uiwv5U0OTwqS25N7uATauO2PO17AR5XHG
	 5bONlfA2nj6uy5ErTPZubyDLwVRPOpltuP9x31nwaSpqk6Nd4L3IdBe99iZEw8gNaK
	 mzo3IUGTRDkPAZlEa3x0LJMbt1dmE/I77DaEumph0uBC3YscMjQTlH9nQdFd82jTjv
	 N+NsOIcwxT38RNB2mpctX6l6tlp/xx+saGoYOs7U1OPRTPZ+BJ2uuK1M3uGlxhD3YU
	 S1ouDaX5VQBCw==
Date: Fri, 27 Nov 2026 09:38:43 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Sasha Levin <sashal@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
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
Message-ID: <awlOYxw29ANZOA1X@gremlin>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-2-sashal@kernel.org>
 <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
 <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local>
 <awjopqoCJqwChwnF@laps>
 <awlCy3vDs0fKx1ku@gremlin>
 <awlNYsu1y8EhYgor@1wt.eu>
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
In-Reply-To: <awlNYsu1y8EhYgor@1wt.eu>

(for some reason this didn't get to my inbox, not sure if filtering broken or
something?)

On Fri, Nov 27, 2026 at 10:29:06AM +0100, Willy Tarreau wrote:
> On Fri, Nov 27, 2026 at 09:18:34AM +0000, Lorenzo Stoakes (ARM) wrote:
> > +cc Laurent who is probably interested in this and AI policy stuff in general.
> >
> > On Thu, Nov 26, 2026 at 09:19:18PM -0500, Sasha Levin wrote:
> > > 2. I'd argue that LLMs these days have the capability to write better
> > > changelogs and most of our human authors. We just need to be better about
> > > laying out our expectations of them.
> >
> > Strongly disagree with this, it doesn't match what I see in practice at all.
> >
> > I'd say that >50% of my review work is of AI-generated patches now, and the
> > commit messages and comments are consistently appalling + seriously painful to
> > deal with.
>
> Note that every word in Sasha's message counts. *capability* doesn't mean
> that it is commonly exploited. Commit messages are horrible most of the

I addressed that in my reply. I have explored this with frontier models, and in
fact seen people dedicate serious resource to adding skills explicitly for this,
with no meaningful improvement in either case.

> time but when properly explained over long sessions they can get amazingly
> better. The other word was *most* of our humans authors. The Linux kernel

Completely disagree based on fairly extensive review experience. Commit messages
from humans are orders-of-magnitude better, it's not even close.

Pre-2026 worst patches commit messages were incomparably better vs. 2026-onward
AI-patches-of-any-quality.

I continue to believe this is a fundamental consequence of how LLMs work.

> community isn't the largest set of commit message authors and is already
> doing very good at this. Look at many other projects to see absolute
> horrors like "update" or "rebase" for the most verbose ones, when it's
> not just "-".

Yup, we established a great culture for commit messages. I fear that we are
destroying that with slop.

>
> Whenever I was given commit messages by an LLM, I had to reword them,
> but some were very close to what I could have written. And I must admit

I'm happy you've had that experience :) but it runs so counter to my own and
other's I have spoken to that I have to reflect that in the discussion.

> that a few times when I only reworded a part of the message first and
> came back to it later, I was no longer very sure where I stopped. *This*
> is a good indication that they can get better than what you usually face
> (or that mine are terrible as well, in which case we're back to first
> point and I'm part of "most").

They can get better, yes, but in my experience consistently remain
appalling. Perhaps excluding rather mechanical changes.

Of course I am happy to be proven wrong in future, but for a policy going
forwards, that policy should reflect reality.

And I think you missed a key point I made - that this is _crucial_ stuff as it
is the commit message(s) that give you an overview for review.

This stuff alone contributes to maintainer burnout. Let's try and take action
that pushes back on that.

--
Cheers, Lorenzo

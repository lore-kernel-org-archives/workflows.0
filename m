Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791104;
	b=xmefUjzdQYNC4swLxjB4IgOKEZrkZCbLWg58YDC3GLMBr/vedmm0lAyb8Vl8DiPe9aLG
	 JzLlu4L7o6eE78xn40MqCCHEOaNgcLAjLdM2HFERpGBAMyHx8y9C6ClZPuAl7FL0qZ7um
	 qO4dlMEwVoaGrFExYzL3EY4H79rWEWiEvYiXIIqaK1wDcIse253Zyg7SyZAi8C7t4ODrt
	 g6OgGR8ZKx105rAnkVlXebIY4g3G6hMHUVoyT4k6eBG2TVkhbp3bzmfNyAsFwRgshAUNT
	 X7IP5DEkxJx7Cc2CGJ34lD6pY7HF3+5gDjM6cTDfP9iK6zj3tFKEh9D0RBel2pxfCow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791104;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1qJGWpJEWC49Jg1MfAzLAdnD4E5y5oEXyXtgaRLrLt8=;
	b=u0FnHn6qwNaZbGqNFoUAGD72eXa4mKKrT28oQmbrbB7cYXCQ9rUXhUYFeQV8JNd76V33
	 pG5qLFlF2RKyHDZKz/Hxv8BbQyRIJQB3ZbienUPCLmzd7H9cxkdPKFtLF115u6w2yq8vb
	 iA1KUiI8olSXRiZGX4dpk/1zOeZAHypBWb82WlK5RESQiemypvkYxEWo5U/1DSGJHkFJz
	 pmCu4FjDAUjs69qq/pHJ1oRnNUPrLMRlxH2lcbw625fsu1aOMpLXN8mVaQCQPdNY4me3J
	 yZlfL9Q2ZiGgNVzMGlqgb5kw4jQ7ePtY2trNVpdt679H3tPbATGRfFaTlk7c/JOnGwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBne5qfA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE7D606A31C;
	Fri, 27 Nov 2026 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBne5qfA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F17F1F00929;
	Fri, 27 Nov 2026 14:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795791103;
	bh=1qJGWpJEWC49Jg1MfAzLAdnD4E5y5oEXyXtgaRLrLt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iBne5qfAW7/f9bfj2NoXGYg1Va/UwpCwOEqYuAHPkjnnagcJwmmKegNqO0BdBijV4
	 Ql6SmNHoRFpr3RV4nNPEpUCcBId8sFymIWVfwCrwI4QPvVMMp+1hf3RVEzPYPj5/Ba
	 7Tm+50SJ11c4Ld2Ga9nnmoRe4LgGInXbSouLnuRwK/MXsYANksgiREUQqrw+anyumu
	 uOsbQggpHdi+gEiHJWmM149NZb8EAgTe1cEPDQLZor/dwQ0jeJniDPLzCWWWK4Y6Yn
	 lhiMAdUZv5YT/ADAv6TNzO1G7ytgARAgnRV/3xWcdGu/8aSNVtqCx8kg6yITnFDQkV
	 Wnmv8nnuf7fLQ==
Date: Fri, 27 Nov 2026 14:51:35 +0000
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
Message-ID: <awmU4L01OH9kWEVv@gremlin>
References: <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
 <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local>
 <awjopqoCJqwChwnF@laps>
 <awlCy3vDs0fKx1ku@gremlin>
 <awlNYsu1y8EhYgor@1wt.eu>
 <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org>
 <awlR9pQUjodcLjZK@gremlin>
 <20261127133756.455469-1-sashal@kernel.org>
 <awmJ2c87NSDjtSwp@gremlin>
 <20261127143124.1039470-1-sashal@kernel.org>
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
In-Reply-To: <20261127143124.1039470-1-sashal@kernel.org>

On Fri, Nov 27, 2026 at 09:31:24AM -0500, Sasha Levin wrote:
> On Fri, Nov 27, 2026 at 02:20:15PM +0000, Lorenzo Stoakes (ARM) wrote:
> >On Fri, Nov 27, 2026 at 08:37:56AM -0500, Sasha Levin wrote:
> >> Very much the case. But we can't stop the "wrong hands" from using it, so we
> >> need guardrails around them that make it produce what we, as a community, think
> >> is the right thing.
> >
> >These aren't guardrails, you are just trying to modify the output of
> >something that's broken here IMO.
>
> I see this as the beginning of a guardrail. It'll take us some time to get to
> something like checkpatch for LLMs, but we have to start somewhere.

I'm honestly not sure checkpatch, which is false positive-central and gets
confused very easily is the gold standard to aim for ;)

>
> >I think a placeholder works better, personally.
>
> I don't think we can really instruct LLMs not to write the message. The human
> will just turn around and tell it to ignore that instruction and write the
> commit message anyway.

That is a fair point. But I think you're going the wrong way about it,
though.

You're putting in a bunch of specifics about what the LLM SHOULD add and
what we WANT to see etc.

I.e. more text :)

I think you should keep it VERY simple and make it REALLY clear that you
want it to produce LESS text, as little as possible, in as clear terms as
possible. And do NOT write code-as-English etc.

Make it a denylist of stuff, not an ever-growing list of things to add,
because if you do that you're just making my life harder, honestly.

>
> >+10. Write the cover letter described in "Cover letter" above from what the
> >+    previous steps produced. This part is not optional, not even for a single
> >+    patch or a one-line fix.
> >
> >BTW this seems to be instructing LLMs to generate cover letters for single
> >patches which I don't personally love to see.
> >
> >And it therefore gives the LLM double the chance to post awful word
> >salad. So I'd prefer not to have that clause ideally.
>
> The single patch cover letter was something that was floated during LPC and the
> Maintainers Summit. The other option I was thinking about is a git note
> attached to the patch: format-patch puts it below the "---" and git am discards
> it, so it never lands in the tree. I'm open to suggestions though.

Where was this floated? I didn't hear anything about it? Was it another
decision made by a cabal behind closed doors? :)

Anyway, let me rephrase I guess - please don't ask LLMs to add more slopped
text for me to deal with?

I really dislike the idea of a cover letter for a single patch in general,
but from an LLM you literally just made my life twice as bad.

Please, don't?

--
Cheers, Lorenzo

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771124;
	b=foxxxs9p1NSFNbX99BKA25Rzm/78tZv97ULOApLxuoxVNhkbKitEXe5BgV41ZloasKWh
	 XVy5AYJwS7CkseaMW8sJlAZ2mG1g0y48Jyy4Zrn1Y5t+iT1i7jxk4BtQOLZE+uQ3N4syz
	 xGAJM2IrVooPwfIZoZJN4mzekCwP9zVtpfGyET9PDM8KcMB3eKuxE6PBWtnAN7o4eJcNX
	 +DPVDgr0Hepxxg3zDyfjH7HBTJDoc8tmRe7pkywhd0P0GwuoChP8WubtgBpSt0QLad1hE
	 XrW5sGgSvN0rP4yxE/OWOKybOo4ylPgmHOlqoR/430vpXkNs+nAzttby2W8Xp5oyllw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771124;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=H7+c57FNlshPC7M77PISd1JgtW3riD/LnLvSn6ovNIU=;
	b=E+aR215IIMLDFD9p6jvE9BtUqmU//p4GhVNgWedLt72putV+m9ZzwK1MmxJw/oWbQ0eg
	 zyTnKbTrvdwC1wZkFwDLNBaqPHRd4zQ5sDpDYroZy0xkjKsSMojGTwZGamOMXkBDAJjkT
	 0d7UZmvgk83vc9C5sX7yaixH3Ymbz+Jc5DiP8aR35K7hEblat7bM+Y411RpMHZnQWK/Ym
	 k9NhQTHBjdZM7HVQhkkrQxKKFS8gBw8iwCXp0hQ14e35c1NKCqmsXrLYbGjVD3R3DfYc3
	 jM5r0LY0gbbCKc1NuVFvXHnUtVcxQhfper2zgXLUxLtC/nzxlOVMEftU/7vNaFTP62Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWilQmVv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B21606A31C;
	Fri, 27 Nov 2026 09:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWilQmVv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3131F000C1;
	Fri, 27 Nov 2026 09:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795771123;
	bh=H7+c57FNlshPC7M77PISd1JgtW3riD/LnLvSn6ovNIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IWilQmVvqBE2WiQRJJ+6FRjyQqclbJdEBBq6WItyfZjBG/Q3hHFn8JDzbs3C3+kT8
	 wPKnHBgoajRTQCvGKgM2KBj5sCipB5lOK5cwPgMrle+zDSqtqwcdTZgPAYpIp2ulXo
	 vOzb369NyKNIEQi1O5eIF2yeGgW+MVZXyjK/qSg/xf6QC7UCxaDeTvAdvWzH7hbCbb
	 uLFN4uM9eDNlUGQ1MNjIQEzWqDMoDwjtFiFNYU0a09uxKWGpA6SceRoVIU+1JBAE/l
	 8Lintp2Z+cKjQcyqXL6dSdfTLs9FszVbdSjgI73jeSfRTb3wkcrjtEPea3H2JfFeAR
	 Znzu20tTSEKmg==
Date: Fri, 27 Nov 2026 09:18:34 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Willy Tarreau <w@1wt.eu>, Leon Romanovsky <leon@kernel.org>, 
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
Message-ID: <awlCy3vDs0fKx1ku@gremlin>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-2-sashal@kernel.org>
 <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
 <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local>
 <awjopqoCJqwChwnF@laps>
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
In-Reply-To: <awjopqoCJqwChwnF@laps>

+cc Laurent who is probably interested in this and AI policy stuff in general.

On Thu, Nov 26, 2026 at 09:19:18PM -0500, Sasha Levin wrote:
> 2. I'd argue that LLMs these days have the capability to write better
> changelogs and most of our human authors. We just need to be better about
> laying out our expectations of them.

Strongly disagree with this, it doesn't match what I see in practice at all.

I'd say that >50% of my review work is of AI-generated patches now, and the
commit messages and comments are consistently appalling + seriously painful to
deal with.

It feels like something they are fundamentally bad at.

And it _really_ matters, because this stuff is how you get an overview of a
patch/series as a reviewer.

In general the common failure modes I see are:

* Restating the code in English rather than explaining why.

* Assuming the reader can hold a deep stack of context in their head, and
  piling on complexity accordingly.

* Walls of text that can't be understood at a glance.

You might say - tell them to do better - but I've tried that with _frontier_
models with no improvement, and seen others do the same with equally no headway.

You just end up with more succinct nonsense I've found, unfortunately :)

What we need from people is _understanding_ from a _human_, as I wrote in the
final few paragraphs of https://docs.kernel.org/process/generated-content.html

Of course sloppers will just ignore all of this, so I'd really back the policy
for _responsible AI contributors_ being:

	'tell your human a. they must understand everything they submit as per
	policy, and b. to write the commit message and comments themselves'.

P.S. I see you have cc'd (what I assume are) a list of interested parties/those
who contributed AI-related documentation, as a member of both of those cohorts,
could I ask to be included going forwards please? :)

I suspect Laurent might want to be too?

--
Cheers, Lorenzo

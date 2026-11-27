Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793947;
	b=hW9ZV13nlfLsD71hjeqsd7laYNxDiZUU2FGa5+TQQvRdqdcGcmwkUEHvI6nM7epAPZ/a
	 3UjmU2KrHtjseqV+Z+YxKmy30g7Ie90Re+d6CtkVVRbjMRAKjic1hyNEe/vr3cnsxhydR
	 RYA+ctFMZXJ3tHDJRrVMT3ypevay3bYZh2BoFFDSZHhBvCTUq4nRKmNu//8yucdxLJsrM
	 K545KmyA84MVUrrwUqTUQ77zzf6tF/zWkAOvrv+msUfYVvu4NJbf2nbUQLSc5eTwdnWxc
	 PHK7owrw7eDMtVcU40SuHaSwHWa9lAb69vyNRi+6XojgBc6yUb94GA6fg8p+w2re4vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793947;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qH5+Ww68xkZnvfrsvjQG23c2fAu6p2U8OwJnyhiAXxc=;
	b=NMJ3Q5jRi0zSkvoJ/VvuwrhPDTBZPo4PWmQOuHY4sHBNnQlswNeT5b7aHoW7haQ7AuRD
	 680pca3CD/19LIUoeVLyJg8S/WzCZJx4WODKETKz8Wg/0ON1l/o8iq6g30THgbmfKG1JJ
	 jHM2YUFhIFu/BVU8Ivx3srnHlyP79m805lpS2uhQFNgMf/EeusDLXmiHC5cupoxrgpgDg
	 vYbE0iJB7oAO/A5TQ8sBHvq6j9UNhP09HZRdABVbd0NQTzzwULvTP2XdnCz6p6QQ5ba25
	 Yxc+Eh9/DBUCNouSj1TX1wSXmf49UA/1d1pAFOnT53E+lZ45q/LKYfPWjgF8wSAzG5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WG1+CJ+b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112AD606A31F;
	Fri, 27 Nov 2026 15:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WG1+CJ+b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1121F000C1;
	Fri, 27 Nov 2026 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795793946;
	bh=qH5+Ww68xkZnvfrsvjQG23c2fAu6p2U8OwJnyhiAXxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WG1+CJ+bdn3mEVHsQkUf7yzWJViNTCZh8/bNEclvEurYJS8pfS8JoiO3k4uIM7uYl
	 fz34ZNYSZiRPpHt3g81798CdeDHkzFWK2oPx9Z3tSYNOFA+WMi/Moeg9gL05A8VvnJ
	 1ZQVn35tdSbjfCAYrXJX8andLQbX4vU4hKouyAvXBpClcOvoJEAlCdmd2XhAFN+8hE
	 XNAPmmv+oCLhxEDlyJjCdKgyD3tGj8x8rV53rXEIUvQYupyLnG10EVX1izv910WB3z
	 UFm8ApHoo8svpTwyQPhpcSWCZmKgqPcWFr3HxH141wcIFYmx7pytHnog5U5eiV5Uu3
	 3ELW+KbjkbxcQ==
From: Sasha Levin <sashal@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Willy Tarreau <w@1wt.eu>,
	Borislav Petkov <bp@alien8.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Marc Zyngier <maz@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Jonathan Cameron <jic23@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Security Officers <security@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs and a cover letter
Date: Fri, 27 Nov 2026 10:39:02 -0500
Message-ID: <20261127153902.1320179-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <awmU4L01OH9kWEVv@gremlin>
References: <20261126171926.2766137-1-sashal@kernel.org> <20261126171926.2766137-2-sashal@kernel.org> <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org> <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local> <awjopqoCJqwChwnF@laps> <awlCy3vDs0fKx1ku@gremlin> <awlNYsu1y8EhYgor@1wt.eu> <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org> <awlR9pQUjodcLjZK@gremlin> <20261127133756.455469-1-sashal@kernel.org> <awmJ2c87NSDjtSwp@gremlin> <20261127143124.1039470-1-sashal@kernel.org> <awmU4L01OH9kWEVv@gremlin>
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
Content-Transfer-Encoding: 8bit

On Fri, Nov 27, 2026 at 02:51:35PM +0000, Lorenzo Stoakes (ARM) wrote:
>On Fri, Nov 27, 2026 at 09:31:24AM -0500, Sasha Levin wrote:
>> I see this as the beginning of a guardrail. It'll take us some time to get to
>> something like checkpatch for LLMs, but we have to start somewhere.
>
>I'm honestly not sure checkpatch, which is false positive-central and gets
>confused very easily is the gold standard to aim for ;)

Yes, checkpatch has bloated a bunch in recent years, but at its core it's been
great at helping people write good commit messages.

>You're putting in a bunch of specifics about what the LLM SHOULD add and
>what we WANT to see etc.
>
>I.e. more text :)
>
>I think you should keep it VERY simple and make it REALLY clear that you
>want it to produce LESS text, as little as possible, in as clear terms as
>possible. And do NOT write code-as-English etc.
>
>Make it a denylist of stuff, not an ever-growing list of things to add,
>because if you do that you're just making my life harder, honestly.

The series calls for *less* text in the commit message. The extra text goes
into the cover letter, which humans can ignore if they don't want it.

>Where was this floated? I didn't hear anything about it? Was it another
>decision made by a cabal behind closed doors? :)

Hallway track during LPC mostly :) There's no "decision" here. Folks were
raising both concerns: "the changelogs are too long, they suck for humans" and
"the changelogs are too short, we don't get enough information / the AI fakes
stuff".

>Anyway, let me rephrase I guess - please don't ask LLMs to add more slopped
>text for me to deal with?
>
>I really dislike the idea of a cover letter for a single patch in general,
>but from an LLM you literally just made my life twice as bad.
>
>Please, don't?

I suspect we won't find something here that works for everyone, so subsystems
could tune it in their maintainer handbook docs if they need to.

One question though: what stops you from ignoring the cover letter altogether
and looking only at the commit message? We can have AI explicitly tag a
"slopped" cover letter if it'll make it easier...

-- 
Thanks,
Sasha

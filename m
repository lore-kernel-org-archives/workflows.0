Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773256;
	b=m/Iy6YeLJLmfBPF4pFfPki6JKswACkBjzdnJHQv2HzdSd50SivqVFduyUGfLTnkBWDlM
	 ocd8G39j0mxI0LhAgkps2w4ti6Uff9hTfN0kkCSFy84428FC77XQC2kEHa4JKllEC0J+l
	 X0J74E5QY6S5Fo4HpWRNbiH43DLaisFUZ9iPEkSt+Nxo0hF1SO3ewLdjpdwxOGvIktQS2
	 ay1J30cLbaw01h6qMJ+tMhf21sDXTLdgnKydq2F+IQbtonCE66cjlOovRxjSVlunwpgNU
	 QwYFaUYJlYkcu6pX5hGOfGzJ3S8twwrLtk/jlrbdkFSljpE1FPH8ZaGlycyGEhsomxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773256;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yxFBnFdCaHevvOVTv0wLuGOLSxnn8rj9jL0cPT6weB8=;
	b=1gPWq+PfTo65RPnu+Qjf6Q/gHlDJdW4RkWvIidxKncp4Urz0m6FeHC0TfZ/+sqNm59/N
	 kM84hQCYLyub7Tbb/+h2L8Pps+CgziJHUlyAX0VdbGZO7wZ6r6msR/HNMKvhJuxvsoHtM
	 UDhiHMbsx6EQt2PLGILyD+09li2UEgLJtU1i9ZVZfYYNK9Gddb4tEh+5jmBWirR1kecUP
	 8B3zslHK9aXPu38Iyr9Qq+X9CCGOVdzfOcsS9wu0DD/xC/5DCpmrmP3cK8/Cg3naNZajI
	 5vpvt9kIsQ8R0zcVHaRO7O4XpWeNtbekFjMqIbsiiCenKHUNYQtN/nrMVne0KNO2mzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbfQDkco;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C930606A333;
	Fri, 27 Nov 2026 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbfQDkco
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B1F1F0089A;
	Fri, 27 Nov 2026 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795773255;
	bh=yxFBnFdCaHevvOVTv0wLuGOLSxnn8rj9jL0cPT6weB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZbfQDkco2Uodyxv/BRjJOPNFLb7WhqACLqAmAzPYRsTkjfcxuT1+OVu4oBDiudi9A
	 DxcOrhcadM3v7vySdCCD7fcWBl/Lz0/KraoSkfw5WRXVpBQGS3tfxfX01cHwkJ+kgU
	 iNyxSP92dc81tKP8HXJMkTbQ7vvKaWTQfBLRzsoyzU576RwcuYqmaKGCVqFE2weWRM
	 hgwasrgHbY1e/GB4b7gQm7dZdDKCexdrMHtGI08siakS41/RyVRHlDbfb3qPLph19U
	 ancjFFveDm06fTHdAagvg8CzLbnS/tPBD3yBBWRM2yRwCCjzgQB0iGaENQp/mYXhwh
	 3MaSrSfRuEbIw==
Date: Fri, 27 Nov 2026 09:54:07 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Willy Tarreau <w@1wt.eu>, Sasha Levin <sashal@kernel.org>, 
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
Message-ID: <awlR9pQUjodcLjZK@gremlin>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-2-sashal@kernel.org>
 <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
 <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local>
 <awjopqoCJqwChwnF@laps>
 <awlCy3vDs0fKx1ku@gremlin>
 <awlNYsu1y8EhYgor@1wt.eu>
 <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org>
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
In-Reply-To: <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org>

On Fri, Nov 27, 2026 at 10:44:56AM +0100, David Hildenbrand (Arm) wrote:
> I'm not even sure what we are discussing here and why. I work through crappy LLM
> generated commit messages all day. Yes, I also use AI to clean them up and it's
> exhausting.
>
> So as usual: in the right hand it is very useful, In the wrong hands it's not.
>
> Why are we so focused on generalizing things here? Don't we have better things
> to do?

Yup exactly. I'm exhausted from the review and filtering of AI company fixes
I've done this cycle, and you've done about 10x as much as me so heaven knows
how tired you are.

I've dropped a bunch of reviewerships because if this keeps going, I'm going to
burnout completely.

And to me the TL;DR is 'this bad thing you are dealing with on a daily basis -
is not bad, it's good, and we should have more of it, but only if you hold it
right'.

For fairness's sake, here's what Sasha said word-for-word:

	'I'd argue that LLMs these days have the capability to write better
	changelogs and most of our human authors. We just need to be better about
	laying out our expectations of them.'

Which I think is fair to say runs rather counter to our experience, certainly
mine, at least.

--
Cheers, Lorenzo

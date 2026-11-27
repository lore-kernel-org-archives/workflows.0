Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771751;
	b=FVU1WSd4Ev4bb+jcyIX2R1menAhvHiR9ZUAIt1jwVwUkrUQKE/FPJNee7qcyLGJPH9M2
	 DbepakUufNd2xRK2Du9OJad/uQTOz2EfFxN5eoG1zy3ZbQJJ3C4J60mWRSYZ5V3lWqTXa
	 VEpmWw3LJHJO67E8SyTV03AnoxUYhrR7Tsxo2RaaJp/PDa11/3rNBktVlNUIHEkyLlZvO
	 VJuJk/9XkKXnv5W9NhtUbBqysB4Cx+LqH2YjO4MIKylJ4E31Oh4SwjcBnDQ8YXBIMigft
	 OcuT2cTOBmpH8HY3F6KPh+wHgLAIJPxfWsSS6d381hYiRmbRMsG0lijBUCavUMGgzSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771751;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=OX368Eg4KtV1PPGO1H9XOYA5FgVsuvC3JtGRi1RdJBU=;
	b=XwtA5ljFNY+/nRiHlsmppa+twUvir6a4tPZlCMMBVNWeVNhttq1ZKyfaEPL0dWo9QU5h
	 1PjOb/VDDT4QdlUkp+qRAdpm2o0vgPfiHYSD6qgxldslHjHi1nUIJw9GLn6VzAAB8laVD
	 22wEGDlKfcGD/NnJElcRY5u3nPkU4ZX9UOVKJQF4lgAOmw2Cr613YXTkcZtKhRs5zjbHq
	 l8PTJ6oFIEJdKqAHwxI8zAQ0jGxcUHmdRvibDnsNXEASHqwi6e/MPdPz6SrJFC1i6hUfi
	 lAtG990tjp0ivCpmN6KdvF4jDCgBSByFVX1tpUxqF2ToyBx0sUeN+hZsEAfzsIxj+/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=Z00DYon0;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F6F606A31C;
	Fri, 27 Nov 2026 09:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78F6F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=Z00DYon0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1795771747; bh=OX368Eg4KtV1PPGO1H9XOYA5FgVsuvC3JtGRi1RdJBU=;
	h=From:Message-ID:From;
	b=Z00DYon0yhZcBFMUXmH1Uxo7qKMaMJCL6ZNXSF7cZ2638N/Bl5Pt6kP3ExZyCI/vz
	 jMP3oakvif2netB9N/9II7zXnWMB7sSkKXHHo5cn2wz9iOL4MupjTUGpNWz6jOdIAA
	 +aqGNDYL3Y2RFYZrh2ZleSoOCxQ3ZHpg4THgaebU=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 380B3C0716;
	Fri, 27 Nov 2026 10:29:07 +0100 (CET)
Date: Fri, 27 Nov 2026 10:29:06 +0100
From: Willy Tarreau <w@1wt.eu>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Borislav Petkov <bp@alien8.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Leon Romanovsky <leon@kernel.org>, Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Marc Zyngier <maz@kernel.org>, Eric Dumazet <edumazet@google.com>,
        Hans de Goede <hansg@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Jonathan Cameron <jic23@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
        Security Officers <security@kernel.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs
 and a cover letter
Message-ID: <awlNYsu1y8EhYgor@1wt.eu>
References: <20261126171926.2766137-1-sashal@kernel.org>
 <20261126171926.2766137-2-sashal@kernel.org>
 <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org>
 <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local>
 <awjopqoCJqwChwnF@laps>
 <awlCy3vDs0fKx1ku@gremlin>
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
In-Reply-To: <awlCy3vDs0fKx1ku@gremlin>

On Fri, Nov 27, 2026 at 09:18:34AM +0000, Lorenzo Stoakes (ARM) wrote:
> +cc Laurent who is probably interested in this and AI policy stuff in general.
> 
> On Thu, Nov 26, 2026 at 09:19:18PM -0500, Sasha Levin wrote:
> > 2. I'd argue that LLMs these days have the capability to write better
> > changelogs and most of our human authors. We just need to be better about
> > laying out our expectations of them.
> 
> Strongly disagree with this, it doesn't match what I see in practice at all.
> 
> I'd say that >50% of my review work is of AI-generated patches now, and the
> commit messages and comments are consistently appalling + seriously painful to
> deal with.

Note that every word in Sasha's message counts. *capability* doesn't mean
that it is commonly exploited. Commit messages are horrible most of the
time but when properly explained over long sessions they can get amazingly
better. The other word was *most* of our humans authors. The Linux kernel
community isn't the largest set of commit message authors and is already
doing very good at this. Look at many other projects to see absolute
horrors like "update" or "rebase" for the most verbose ones, when it's
not just "-".

Whenever I was given commit messages by an LLM, I had to reword them,
but some were very close to what I could have written. And I must admit
that a few times when I only reworded a part of the message first and
came back to it later, I was no longer very sure where I stopped. *This*
is a good indication that they can get better than what you usually face
(or that mine are terrible as well, in which case we're back to first
point and I'm part of "most").

Willy

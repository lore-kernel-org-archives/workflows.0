Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786680;
	b=yhJAE9uS4+1cFigcAOxXuRC7gBSPM7r/J2FBmv9ERDXYainutLZf89yB1za7fm22EvcS
	 guua8FM2l8rVXTy5YRJhOaq5N+1N7jGAJwxoFhr5Y1OZRlCxFyM51gbI6eH/3etfUHozi
	 jg4PQnLmUeuBHuJpzxHQsk2ySSKIE1l1pBIWjTZN0xaZOEWCqrV26YdV/ic/au5+abCrf
	 eORJXR/X4huyXBJsvqxp/F2/BFG2w/yaok6xUK8HwZukLeqn42KAG/lQsbEGJYTmzV+zG
	 F3/uDx3Jm6MRPLo6dyjfJwCeiC8RchTlGkRVhQJK6dHfnXdpE9X2QZzwSYYjn6uvSXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786680;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hOmInT4jFxNNTLRMB6mT54ZJFyBDVDe8HB3fBANc73I=;
	b=X7DBJKVZ04saIcmQP+ZVJn5kqizitf/lsUcYuGOi7wewpSqHEexu7c5VNx0dpgfWaWWF
	 VXPTW7VAePY7N6nl0BGFohNsbE0IRIREqDePUWkBuT6tNUHGdXSZ8G7ysiAcunpDBbvfR
	 wnB0SojUaXrNE4rx5eJpFESDBe/1rC1DHi4Fz8tdxTs8U3sOchc+J5MXQPSa6YQno+6eW
	 GH64nA146GT3CyrczfLoFiw26Gx4N75zuwt70ixUNxGf1WGl4TykkBT0XjuKIWyqPEwvb
	 q0C6vas4kx7VLqAhOfo0LK5PnAiTeUU+TCdlo2lVrh9XPws4DUNas3dSNGKd6Ki/fvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZNeT+yF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF9E606A321;
	Fri, 27 Nov 2026 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JZNeT+yF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF5A1F00897;
	Fri, 27 Nov 2026 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795786680;
	bh=hOmInT4jFxNNTLRMB6mT54ZJFyBDVDe8HB3fBANc73I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JZNeT+yFaTizJ8RzpDmmM53KUynY6lcHmUCqcwmsTmRwP5WkTAdySOPsOa22PcXBs
	 6OLcRserRnUJ/k0xOyBfBqE4qTeblAy2fR16JBiGFh4l3UIcibPEKkK0xRPj8PhME3
	 1AuWNpYTarLToisfXVDa1nzkbfkp0TDYyYYZXLW8c+JuhCXIZL0RhQL2mZ3p0k0yo+
	 ZCxdp2VQCIkXVz64G5OV4ETceNqER43dAH4GADMi9Frle55oxdRfuL0jZps8mguFkM
	 dcNQDLAKMLygUmKbabqdrPXhpmZstMBOubFlm2CK6Dv/J4wKxlvfRqwig4hP0hcDD/
	 8Mf+UESJpLVyg==
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
Date: Fri, 27 Nov 2026 08:37:56 -0500
Message-ID: <20261127133756.455469-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <awlR9pQUjodcLjZK@gremlin>
References: <20261126171926.2766137-1-sashal@kernel.org> <20261126171926.2766137-2-sashal@kernel.org> <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org> <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local> <awjopqoCJqwChwnF@laps> <awlCy3vDs0fKx1ku@gremlin> <awlNYsu1y8EhYgor@1wt.eu> <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org> <awlR9pQUjodcLjZK@gremlin>
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

On Fri, Nov 27, 2026 at 09:54:07AM +0000, Lorenzo Stoakes (ARM) wrote:
>On Fri, Nov 27, 2026 at 10:44:56AM +0100, David Hildenbrand (Arm) wrote:
>> So as usual: in the right hand it is very useful, In the wrong hands it's not.

Very much the case. But we can't stop the "wrong hands" from using it, so we
need guardrails around them that make it produce what we, as a community, think
is the right thing.

>I've dropped a bunch of reviewerships because if this keeps going, I'm going to
>burnout completely.
>
>And to me the TL;DR is 'this bad thing you are dealing with on a daily basis -
>is not bad, it's good, and we should have more of it, but only if you hold it
>right'.

I think we're actually agreeing here: LLMs write crappy commit messages today.
My point was that they have the capability to do this really well (the "and" in
that line should have been "than"), we're just not getting that out of them
right now. These things just helped prove the Riemann hypothesis, I have a hard
time believing that a good kernel commit message is where they hit their limit.

And it's not just you or me. That's exactly why the cover letter quotes a whole
list of maintainers: pretty much everyone is hitting this. The series is there
to push back on what you're dealing with, not to ask for more of it.

-- 
Thanks,
Sasha

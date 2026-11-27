Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798796;
	b=pl/cwvEe9ivfC6mkILRzPqcIWlgzuKmQcyaTznz0lcNX8a+q+mYUdiBGaLVbij6qHDrL
	 h2DjGNZV8k543ewpKze7pFO/p0meqUsGhseLkVeXveFYbt15X5wtgc2nLEet305dTcvDz
	 HYrwEU2Br/CSebftlWXZUd95wQH7zRE/+V7HdpGr7mcpNH0BSZNjhYNBmhlrmwt942vKv
	 Y/ANONpuSb4tCJLDeiy0fTYEDl+LF68lmjIfboDRFNmafUBypyaVBk+DXtrcdrzNV7Hrq
	 K/6FLg7g13bUIl+/BNA49uXM3H6X/1mQU5z6Zzj5VoKJw3CbXWXrHdqmEDeDHL/abNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798796;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jiXMNWIkdtVPXqHC5MUe+oLwMosxgFO2osh73bcebPQ=;
	b=uhqmz8ANto0XXDTrUc2XYOXViQ8d4VPgVHjs738LxgfTDTV5eFkqcuRG4fNgER5m3QJc
	 XgyIA1V55XxOs9wwo1faezOhr9hexncoLV/zk2xmqCpKQT+m33lp2I4PA6oByCqBjNSBk
	 2QI7BmbtGYkkFoSp2i9Fc/PISQavKUnItPwZk8R5//ivArJJZZXLQlh3VO6xQrKxHHDZo
	 NQAcjK22Juso0pRvqcoxE0jGxjoMOCtGDkK9VSb1RZksnB/4lVILF8MG3o0v769WW7STa
	 cHae82asJtDZiwPrTxBAOb6HEPwTjuXlUJzN4YBVvchw2pYgdsgWkHdqdURbQUlD1GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AzHwSHuT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C3E606A321;
	Fri, 27 Nov 2026 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AzHwSHuT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498FB1F00897;
	Fri, 27 Nov 2026 16:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795798795;
	bh=jiXMNWIkdtVPXqHC5MUe+oLwMosxgFO2osh73bcebPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AzHwSHuTCpOVppw0HCuG3Qr/80ptl8Gcdnj64EN0foyGmPw4GIcraGp9dUiW1/whj
	 rl38a3xC2b1atPzUCZnX3BL4gEYr5mv9IkUw5AA2UXF2XF0PHzEKx00YDVPRhoNGt5
	 9ozFJ8C+1xCFWd06Po3n2/nChwcbdsJZKuaA0Cgcj4VZ/B68gI8asaBHJOFHljHOM4
	 qfI6X0Hqv4swHS9FV5yDmCw81mDCO3Oq5VQmZe3Rvt9F61AOxKrQFh1DmW/j4X+PL/
	 wfNgGiB2FjdaPvCdLqXL6PCxfBdNLr1gSAJJnH7fLLZFMzOnUwPeLpQ2p3lVr1y1Cw
	 6JMns+h/+RrSA==
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
Date: Fri, 27 Nov 2026 11:59:51 -0500
Message-ID: <20261127165951.1741013-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <awmrvCPm6ZI7Yd7_@gremlin>
References: <20261126171926.2766137-1-sashal@kernel.org> <20261126171926.2766137-2-sashal@kernel.org> <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org> <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local> <awjopqoCJqwChwnF@laps> <awlCy3vDs0fKx1ku@gremlin> <awlNYsu1y8EhYgor@1wt.eu> <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org> <awlR9pQUjodcLjZK@gremlin> <20261127133756.455469-1-sashal@kernel.org> <awmJ2c87NSDjtSwp@gremlin> <20261127143124.1039470-1-sashal@kernel.org> <awmU4L01OH9kWEVv@gremlin> <20261127153902.1320179-1-sashal@kernel.org> <awmrvCPm6ZI7Yd7_@gremlin>
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

On Fri, Nov 27, 2026 at 04:46:58PM +0000, Lorenzo Stoakes (ARM) wrote:
>I haven't a clue why anybody would say they were too short, I have never seen a
>slopped patch where that was the case?
>
>Why would adding more text address faking? That seems orthogonal really?

Leon gave an example in the thread on the user-visible impact patch [1]. The
patch came with a trimmed, three line KASAN report, and only the full log
showed that the crash came from an out-of-tree module written to provoke it.

>Am we in the community permitted to debate the defaults? Or are they already
>decided upon?

Of course, nothing is decided. I'm sorry if it came across as "shut up", I'm
honestly not trying to avoid the debate here, I'm just trying to find a middle
ground.

If we just tell the AI to keep it very short and concise we end up upsetting
half of the community, and if we ask it to provide more complete explanations
and logs we upset the other half...

How do we find a happy default here?

>So I think I'll disengage from the thread at this point.

The main reason this series came up is to address your concerns, and other
maintainers', about crappy commit messages. You said at the start that you've
had to drop reviewerships and that you're burning out, so clearly something has
to be done. I'm more than happy to drop this suggestion if you have something
better to propose. I'm also happy to leave things as-is, but it doesn't sound
like ANYONE is happy with it.

Again, I'm sorry if I made it sound that way, but I'm not trying to shut this
conversation up. I might have been trying to play the devil's advocate too
strongly.

I figured that for you it'd be "cheap" to automatically drop the cover letters,
and you'd get better commit messages.

[1] https://lore.kernel.org/all/20261125125739.GA14811@unreal/

-- 
Thanks,
Sasha

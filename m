Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789893;
	b=y1qXbZgE3G8BbEUHZEO5wU+CLyh/DuvRQHXdz090bsnyYu4Bj1vp47zPWEr9Ki84szsP
	 KZ2KQDh/wQjMVdLBD2IlsYzA6DLPw6Ubo0QdwjgUjla/W1Ihezdhj57nAi4khX3/cDb1N
	 DGlkGhOqj2WiBm1jFgVEKeST29En49L5zKWa4aO2rTHFKU0BwuFavALC1zABhXqHBYjRf
	 l7wTnPdaoSLxTEYxpyppxwqsToTCFCobTEhutAIJuLcx9M6z+CNxzGXBAnKpVER9PNjO6
	 48ZoqYxPjElEaplOUl3y+Ix1DYx+5xITtZJiC92YGGT5P/5rs2qeA1k6xbx62AKx5wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789893;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=C2vvCbTNo3pbRV+JGS5YLG9rXsuaGH2HRohqGh3x1YI=;
	b=sTLg8wFpUJz7X9w9SDQGYU6Wz4P3Sa0iRyqb/iYkZMfjCvGj1RHI1qvtASnRxvTQdjJS
	 6PNYKUfamZOkP7ykzRSESeYrf2gh4o/JtrzmzLZM4wxFSZeVJtukJGExDUjy+qnzcImV/
	 KR3btZfI3IsRJ/JfssxcekU3JA1X+Gps/zyR7w5IJ6fyWOASAMl3HF/Urzo71Y4MhbdlO
	 h9w1yqBPbijKIL9WkGc5ZjypO83f7eu0dj2patmtWRQ5KfFh0uTPoU6Cj3ef11dC0bSKf
	 tNu2aFtLv/XbKb98T1PlYzc3cAqzvgznghSeIOUUqtrVa2xWi8RJYjbEMHWRurhJikg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fg5Mk1nY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC33606A332;
	Fri, 27 Nov 2026 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fg5Mk1nY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B411F000C1;
	Fri, 27 Nov 2026 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789892;
	bh=C2vvCbTNo3pbRV+JGS5YLG9rXsuaGH2HRohqGh3x1YI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fg5Mk1nY2ZetJs7K5/wO2sYQUY+ULzD9PeBycOYgjdYDapCvyWajHL8aA1yGGOXHV
	 7bcIzHCQa4EAr6G1SpdKRIRDzUxRTuH3xyghnTXwUb4h6CPWXOY/ofwFc2bUfhLrXT
	 ooco3mpgsQWw336GN1/HIwTX0GDBuqo30rMgpKjd/oqcWdJBe3US278FxqBLuhEPZm
	 UJjONistFv+Mv9jpbxbzZ8cbNktaXlxydIZ6jZz+KiphMQ0cGcI7FerF1Io2HetlUr
	 xUt7BQFycYJkMImrmlJWbIxhdCbzVlMl1jPmgXmRjU8rWeAzSD6aI2PPJMU9slBRgq
	 UAjLiNbKogSOQ==
From: Sasha Levin <sashal@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Willy Tarreau <w@1wt.eu>,
	Borislav Petkov <bp@alien8.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Leon Romanovsky <leon@kernel.org>,
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
	David Hildenbrand <david@kernel.org>,
	Security Officers <security@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs and a cover letter
Date: Fri, 27 Nov 2026 09:31:29 -0500
Message-ID: <20261127143129.1039582-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <awmRvPlPoyMMzHsB@gremlin>
References: <20261126171926.2766137-1-sashal@kernel.org> <20261126171926.2766137-2-sashal@kernel.org> <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org> <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local> <awjopqoCJqwChwnF@laps> <awlCy3vDs0fKx1ku@gremlin> <awlNYsu1y8EhYgor@1wt.eu> <awlOYxw29ANZOA1X@gremlin> <1b630619-4388-454b-b295-6ebd0d912a32@sirena.org.uk> <awmRvPlPoyMMzHsB@gremlin>
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

On Fri, Nov 27, 2026 at 02:25:20PM +0000, Lorenzo Stoakes (ARM) wrote:
>I really feel the fundamental rule here is 'only submit what you understand'
>(90+% of AI stuff I see breaks this rule, maybe more).

Our problem is that it's not the AI that breaks this rule, it's the human who
sends a patch they don't understand. And that's hard to fight with
documentation changes.

We can try telling it not to, but I think the better path is to tell it how to
do what it needs to do correctly.

-- 
Thanks,
Sasha

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803966;
	b=0WgnjVGfpS6R3SHEliJzqVFIv2vMv5KUW8KYFjxFHUUuYDzoIPB8pZI0JcJI+iKcI4kX
	 21qLqJ+GG+ewo5EOMIiIDpBwIil8aRPWsJsL/kTw8//kKvfM1w9R/8AmWR72N5Xv+xGGD
	 CpbH1v6sVpAEw+OgmfdYZsD30AAED5Ktrwczfuw0aTrq9sTIon3kvz5mIWA49enuVzges
	 tYUyAgGVuA7Dvvny+XxdjL8niY7xJUuEf5vs4rocHki6J9zz9aCN7g1cNyNDjzwod5OCG
	 cSFoEZ0s4lIv2vn7jaYVP+NFAMZOtegyzCGb/9yOrRVv/BJp22Ud2vUGpyHRc3LR39Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803966;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cAqKaSrO/Kb2u0gwNYd7UWkwvGMH5VVIq7G0v+SnKjM=;
	b=l4O2o432ZhirQGyFcz49LVk8ttoR9YIOUgyRl7Xg1de7vWi4aTRJ5V7QPzbCimNGJ6xf
	 7/uurV97E4/tnnajYopS5/stlO615EXD30DqHm0XtTjs+p/owK8zs4DRkxIKxQa6lcOo2
	 Tpen2M/tGTqZe0J82QTZkcahQxrr5i6DkVWaZWYKtk2IND9zdifTrVf9vjgO04WxzPJvY
	 bbBqg6cupS4j65E0PmJfiIcKyujMWTGcdnvwiX5t1GS/QIiryGbHlGxQJjshnsrdWia4A
	 3tCLc2lUK1a1mab6+ntnKeGJJEzFAX0/RHTjeEbKfaJz4djtojHMKLyPYO1dFT+geXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPyJ94k1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53998606A31E;
	Fri, 27 Nov 2026 18:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPyJ94k1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF021F00893;
	Fri, 27 Nov 2026 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795803966;
	bh=cAqKaSrO/Kb2u0gwNYd7UWkwvGMH5VVIq7G0v+SnKjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lPyJ94k1zDfziOpPTrCracfJ2DIIRLEHBf/q+GiawX6fJzC2TPi2bGyeR4yU/p/P6
	 6o/RV5Xa0oId2SbjipIoAU3NiafapI2YRXB4cEk0K/xDTd6//LUfrjyEZ3UMN26JZ9
	 bjO66V4Ji+Tx3hr9pGgx3YzFuv0TmaY5aFEz8aSOu2OIiMAkrvaiCcCCAG3+3SUIlX
	 VWFwbtMJPiS8B31AYBJgKHH8JuyzCID6th7FKP9xLHBvg3rDzwycYR+cOgPYty7C4B
	 6NYuaDI1Ry7IEdUO79Xqr5qc4CFNU88tj0MweKw3vbrWd45u2UQ06lUM4nACNbswud
	 Nb1f/5wyI6Zkw==
From: Sasha Levin <sashal@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
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
Date: Fri, 27 Nov 2026 13:26:02 -0500
Message-ID: <20261127182602.2521454-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <61b33977-7c05-4d30-9a78-8fc711bd95ef@kernel.org>
References: <20261126171926.2766137-1-sashal@kernel.org> <20261126171926.2766137-2-sashal@kernel.org> <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org> <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local> <awjopqoCJqwChwnF@laps> <awlCy3vDs0fKx1ku@gremlin> <awlNYsu1y8EhYgor@1wt.eu> <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org> <awlR9pQUjodcLjZK@gremlin> <20261127133756.455469-1-sashal@kernel.org> <awmJ2c87NSDjtSwp@gremlin> <20261127143124.1039470-1-sashal@kernel.org> <33de19df-1729-4d1c-a6ce-e10e240e0c57@kernel.org> <20261127180325.2304501-1-sashal@kernel.org> <61b33977-7c05-4d30-9a78-8fc711bd95ef@kernel.org>
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

On Fri, Nov 27, 2026 at 07:14:03PM +0100, Vlastimil Babka (SUSE) wrote:
>Ugh I'm not sure about inventing a new placement. Rather focus on that not
>being a wall of text in the first place? Because it really shouldn't be.

The part that's hard to keep short is the logs. Leon had an example in the
other thread [1]: the patch came with a three line KASAN snippet, and only the
full dmesg the submitter ended up sending [2] showed that the crash came from
an out-of-tree module written to provoke it. That dmesg was 904 lines.

It sounds like a bit much for something under the scissor line.

[1] https://lore.kernel.org/all/20261125125739.GA14811@unreal/
[2] https://lore.kernel.org/all/20261122103855.51859-1-lee@jaeyeong.cc/

-- 
Thanks,
Sasha

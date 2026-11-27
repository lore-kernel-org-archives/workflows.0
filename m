Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789889;
	b=E7viB8reVKcLf9YfYZtyAlfUDkM+v+oT/MyvF4oVDteiUmz1D0KLWTX03eo4xBmowETH
	 qfTwqPUJYwGDdIu6GFLFFVs4KxHaXUKsLsdRpWrPlRT5gT9OWxjcQ8VTeN6G0sfMlN3Di
	 kK8t2DCu9rh10jlhufJ4znKKOQVMPP1xoIlhfsHNkQ/d8LS4cbbJduEuDOwDrh7lcwv6g
	 0lyd+zvA/fv1kPwKHjA1pVPSLPDBCBMrazUp0eiFF5fPjBZEVrSkNIF8BAYO1EADScorE
	 avLKfHI87/+VIMkIuVB4B7dOv0oiPOxbwJ5VNOxgaY2dt/hNlq/l3EMiyS7yGujTJgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789889;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=A+uCVE2PpdgjhOXoHLNfle7gUf46golrIpGcOCuv45w=;
	b=UceNdR8mTHLJb00y3obecMsTUjY2WhVPizv7zSi9eWZVOsovFRjBm4bzdSxyuK7h3lX7
	 j13Bbk3DBx97pWHLZPeDqrxTwY8XYiTGcDP1kzX5GlCYRQtXhvhNhIYq1ctesX/hGdLU6
	 DzVrPxGbfY0vdILAFBOFahMRKZL4pLyLSc600Onz7xI72om/AIJ8OeQKjAX+dUcTXJcGD
	 PKy5j+BPkdwQQfG2GB4FhpZ3KH4mkGEZNocuBuoQ5uHBYHulw5BDNi0mp7apceKAjC+Xm
	 jAcpVPaCS4PrfCwjcNt/dFxPtHM2PExLsHIaX+C8bkKYFXwXH6TAm5KzSimhaBisJPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="R6t/6vwq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E8606A332;
	Fri, 27 Nov 2026 14:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R6t/6vwq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03461F0089B;
	Fri, 27 Nov 2026 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795789888;
	bh=A+uCVE2PpdgjhOXoHLNfle7gUf46golrIpGcOCuv45w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R6t/6vwqg8UIuyDjib7SpJyQixy5FnxVlaGchrfNO+q5muHKQFn7oULyktSyFAc9A
	 95PkQF7UMsb8cZLiVU6i55oIdGoc94WG8S9eGD0T++8hpDsdEX0S7I65iURwNpek2a
	 FZdVHGSTEbD7yF/yN9cmJXQRxwF3XwdMJRlAgZqC72uln/ohIr2kbRLEsZ9SeLnb+F
	 Is5M1CpbxVkcGgZoDp4V4LKIxIdXVRL5Es3/98X08ZeKNHi0cgkO18T4jcK02AD5BH
	 HqXx1yObqZsUkcoGDaIvhgwT9miiIud2FAWIVkBQ6P5DYuTceK8rg9+2bB2aqcFrKr
	 9mTS552PlYjdw==
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
Date: Fri, 27 Nov 2026 09:31:24 -0500
Message-ID: <20261127143124.1039470-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <awmJ2c87NSDjtSwp@gremlin>
References: <20261126171926.2766137-1-sashal@kernel.org> <20261126171926.2766137-2-sashal@kernel.org> <cf3596c6-742e-49c1-a90b-941d300d0b4a@kernel.org> <20261127014955.GBawjhw2j2YEUeiG1G@fat_crate.local> <awjopqoCJqwChwnF@laps> <awlCy3vDs0fKx1ku@gremlin> <awlNYsu1y8EhYgor@1wt.eu> <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org> <awlR9pQUjodcLjZK@gremlin> <20261127133756.455469-1-sashal@kernel.org> <awmJ2c87NSDjtSwp@gremlin>
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

On Fri, Nov 27, 2026 at 02:20:15PM +0000, Lorenzo Stoakes (ARM) wrote:
>On Fri, Nov 27, 2026 at 08:37:56AM -0500, Sasha Levin wrote:
>> Very much the case. But we can't stop the "wrong hands" from using it, so we
>> need guardrails around them that make it produce what we, as a community, think
>> is the right thing.
>
>These aren't guardrails, you are just trying to modify the output of
>something that's broken here IMO.

I see this as the beginning of a guardrail. It'll take us some time to get to
something like checkpatch for LLMs, but we have to start somewhere.

>I think a placeholder works better, personally.

I don't think we can really instruct LLMs not to write the message. The human
will just turn around and tell it to ignore that instruction and write the
commit message anyway.

>+10. Write the cover letter described in "Cover letter" above from what the
>+    previous steps produced. This part is not optional, not even for a single
>+    patch or a one-line fix.
>
>BTW this seems to be instructing LLMs to generate cover letters for single
>patches which I don't personally love to see.
>
>And it therefore gives the LLM double the chance to post awful word
>salad. So I'd prefer not to have that clause ideally.

The single patch cover letter was something that was floated during LPC and the
Maintainers Summit. The other option I was thinking about is a git note
attached to the patch: format-patch puts it below the "---" and git am discards
it, so it never lands in the tree. I'm open to suggestions though.

-- 
Thanks,
Sasha

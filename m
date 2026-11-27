Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757018;
	b=q5998Va3qkBENeS63zBSEiZhD3Z3yMkBNfyY/9xzncGkgQSzOS92d9ZF3SHXY0RnfK92
	 zjIN3iKbo9AI0dHkRXt+Jj0U8iGlan43lcmtqjfn4Em/koRxHWmFrxwVPb6usz+OT+RoU
	 IOm/0Y0q3rkQIVRZ3iehIwB4emAGJVFOfQa3FTcwMFaE2ZyOk5Zbe3a713Z48tlwzd9qy
	 EJRdHp5Qm59uaYSiubbagc1KL7NZMHisAoXXewPjv/Ua77pGdX+T/gqW4Q5nRtcIJUCyB
	 S7OrLMQbpsYK5l/yjSiwSJNl9QF0b/OXmXa3HnLZvtbxBsMsR5CYvzRyytng60Lk6+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757018;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=rDWIYXMsMfmYcFYwt5fy9hfJnNOHzHHsKNfkNKGIDnA=;
	b=nlQqlNKFk0RaWUKzXgWpNA7IBfbBn/idxQhdqsL6S54l/C9ItZmMlhOLmM9eVkH7cVbf
	 n5m4LTbHBu57WFEnMwJtzS2SGIkEywZs5Q6jZHnHsDN3mcgUnb1Y5cAtt1hpB/lXO1Ii3
	 0sSlVCHx1kT/yv26c8ZOpEo3Nt/tVOozfucYvZ1/GMUfNofGWkhnaUuNNxAmEAkec7SIm
	 ovdF2ArTCE4YR0oY+sRGth0Cw5hXYw8PBYNsXr4ufO+F1L2Ef415YyVFfIHoTlMuv5DFS
	 yCyeR7tjFuQXJaGLzSnne0m3N/FGAdHcbpsFDwGlGz4q5wmlD0Ttm3XGtZG4anZgV8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=AbYtufrD;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3C2606A31C;
	Fri, 27 Nov 2026 05:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB3C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=AbYtufrD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1795757007; bh=rDWIYXMsMfmYcFYwt5fy9hfJnNOHzHHsKNfkNKGIDnA=;
	h=From:Message-ID:From;
	b=AbYtufrD1zZrrrznwcnPFlVn8Fp5CaAeY7jJUndMo5Cjdq0bnRu1VhcrXRrH+R674
	 zu37OP547ZWiaAYpsUn4+AenQDoOcHHQuutqOr1nLV75RCsOt81sd+1dbisHdQ1Pj8
	 YZ3KjmH6LcnLSTrV81H3//X5qp0cKjkIGMGesxcs=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id A4930C0716;
	Fri, 27 Nov 2026 06:23:27 +0100 (CET)
Date: Fri, 27 Nov 2026 06:23:26 +0100
From: Willy Tarreau <w@1wt.eu>
To: Sasha Levin <sashal@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Krzysztof Kozlowski <krzk@kernel.org>,
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
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs
 and a cover letter
Message-ID: <awkTziee3tt1joOZ@1wt.eu>
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

On Thu, Nov 26, 2026 at 09:19:18PM -0500, Sasha Levin wrote:
> On Thu, Nov 26, 2026 at 05:49:55PM -0800, Borislav Petkov wrote:
> > On Fri, Nov 27, 2026 at 02:34:26AM +0100, Krzysztof Kozlowski wrote:
> > > On 26/11/2026 18:19, Sasha Levin wrote:
> > > > Commit messages written by AI coding assistants are too long.
> > > > Maintainers keep asking for them to be cut down [1][2][3][4]: they read
> > > > like a copy of the assistant's analysis and bury what a reader needs.
> > > > When an assistant does trim, the opposite problem shows. A few lines of
> > > > a backtrace do not tell a reviewer how the failure was produced, and
> > > > Leon Romanovsky showed a case where only the full log revealed that the
> > > > crash came from an out-of-tree module written to provoke it [5]. Willy
> > > > Tarreau suggested a short quote in the changelog plus the full log
> > > > attached [6].
> > > 
> > > Shall we rather ask them not to write commit msgs at all? By writing
> > > commit msg we encourage - or try to encourage - at least basic
> > > understanding of what the patch does.
> 
> We could ask them, but:
> 
> 1. Is this something we can "enforce"? Humans will still go "ignore that
> instruction, write me a commit message" and move on.
> 
> 2. I'd argue that LLMs these days have the capability to write better
> changelogs and most of our human authors. We just need to be better about
> laying out our expectations of them.
> 
> 3. In general, I think we should avoid "don't use LLMs for XYZ".

Agreed, and given how bad many commit messages are, if at least humans
can learn from the LLMs, they'll progressively get better at changing
these messages they don't like. At least rules are easier to enforce
on LLMs than humans so let's just ask for what's needed like Boris did
and hope for better.

> 
> > Agreed.
> > 
> > Just have the LLM write a commit message and then the human should go
> > and whack most of it to the bare minimum of coincisely explaining the thing
> > and cull all the bullsh*t.
> 
> In theory this is how things work now, right? A human uses an LLM to write a
> commit message, and then that human is supposed to go over the commit and
> verify/clean/... it.
> 
> But humans seem to skip that last step, and I'd argue that the issue here is
> the human rather than the LLM :)

Most often that's the problem, because only one of them tries to do the job
correctly, the other one only tries to get that patch merged. What matters
in the end isn't who wrote the commit message but whether or not it contains
sufficient info to be scrutinized and understood later by a developer falling
on it during a "git blame" without wasting their time.

Willy

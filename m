Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6309F33C183;
	Mon,  3 Aug 2026 16:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774052; cv=none; b=Cw5m5DbPnrHR+Z4AWDWF7rL5XGYRjcbgSpq3TmptkvhyrBPYrTF/ZWaR7fmfKLBvgIrwQaSeOybGMMc2dD08HUTTSueR4W8rB0bbc7PnZqVIoJyG1gGzYYSxh0cnStWc53BE0EsXWAoXToDuSHFm0youBYHjlH3N5dDGSkR0a7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774052; c=relaxed/simple;
	bh=gySO1djDGM+pj55LCWzdY6nFe3C5AqIbB6OiQGw2esA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jhavY2oZ7eRhNbsXsKqIvd9mE+ilrOdc67olyZ1OgZ7YzOzEr0Rc3T0fb33Cje35fvGrNmEYIgfPCndoQBcvhMcG6+3HtPOg/uksuRRrPPYZvNQ8e52JqjfKY2PG3KH9qysnbcWxNr1DoH6TaWTjPsaMt0fBTJBEs6822V6yrgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eaqi5wcb; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eaqi5wcb"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8797F408CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785774044; bh=3VOYFijnPG+Nebkc/3zWZ5LBYdV94otsJME1O501aKA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eaqi5wcbpx2QvtWHREBgJH69/1DxqVUjAy1PfCm1KH5aY22Z476CsEoDcJW3rSw2l
	 AinbH68FZxRmEwOh2IA60495xZapQvZlZEzRfyGB5LPw57g7Yik3SIpab7bIWAHVD0
	 q6b7iboOdA9R3FQzegXVHQMA+nFpO4ermwwW25cQ8SEJ4ou4F2oYnde9cEw4dZajq1
	 al4gWgdqgvt5CnUX7gZbBTYiB5/O2eOF+qlrQ0nqXOE6ueNqrwUaSshKftgKdd7pMt
	 TlCSHxWHnD1ub2k/vwNLFoWboAp70+5fdHyZaASqHop24Q/5JU71kiNRA6TAtSno3o
	 YMPcj4v4Ek1eQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8797F408CE;
	Mon,  3 Aug 2026 16:20:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>
Cc: greg@kroah.com, security@kernel.org, skhan@linuxfoundation.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: Re: [PATCH 0/5] docs: improve guidance for AI-assisted bug reports
In-Reply-To: <20260802203540.3453-1-w@1wt.eu>
References: <20260802203540.3453-1-w@1wt.eu>
Date: Mon, 03 Aug 2026 10:20:43 -0600
Message-ID: <87a4r318h0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Willy Tarreau <w@1wt.eu> writes:

> While vulnerability reporters have now started CCing maintainers,
> showing they read the docs, the security team still spends a lot of
> time repeating the same comments about tested version, incomplete
> fixes, poor email client setup causing formatting issues making
> patches unusable, unverified reports and missing Assisted-By tags,
> each time for AI-assisted reports.
>
> This series adds small updates to security-bugs.rst, threat-model.rst
> and coding-assistant.rst to better deal with this and provide minimal
> instructions helping the LLM follow our expectations.
>
> The updates were iteratively and carefully tested with 3 models,
> Opus-5, Qwen3.6-27B-Architect-Polaris2-Fable-B-F451, and Gemini,
> until all of them strictly followed the rules.
>
> It is expected to further improve the situation.

Just FWIW I've read through these and can't really find anything to
complain about.  It looks like Greg is planning to pick them up, so I'll
not do anything with them unless instructed otherwise.

Thanks,

jon

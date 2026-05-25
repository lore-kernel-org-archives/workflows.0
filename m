Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7E30C62D;
	Mon, 25 May 2026 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779739530; cv=none; b=sAuKUgpZeyVLlooWgTzScwKddi954jDPvhzCk5PJk7jP+pC1cNLYLDTIwSiTqQRFH4IzngUsTZOyW9kXgT6FeZinDy4112xDCtxrqpkuG20BOXVCOKtaaECP/h4S0mMe9qNd5fDDJ0uQFAmmrSPPzqalBJpFi5JkbpUoyZcq/Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779739530; c=relaxed/simple;
	bh=VbUTfalfPYcfjkHEUJz/jgYmgho0xjeIYWWPOUCmg/k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y+y5heluHb/d1ORga5GORxkDs/f1EC0Lj4MUTnIXeKHnUsejsbcJMQ0tdteFaDvFxT5SM0V8kPP4mTzbiAUKM0lHfvVGQnQI7TzrvDB9hOnSbiqTTB9NnEcyPLZehtcTzVDDVa7thjtCH/V4SV0858o/zf/2E1VZH0mjjIDUwFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pvJKjLy6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pvJKjLy6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DBE3640B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779739528; bh=ywFD8cmQrTevGwz39LffIs6+4IEnqKCcvBIq8cHR5mI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pvJKjLy6YiGj/nGT0xjyA4T6lfeqdSfF9Oo5d1Y+E9pYWxwyCfN7mMAyb55M0RRoz
	 gZ9UopePW51v2VhT3Q1BfhjgqVGdfvUcMa1jgu4upjqN3J/XH20McLjpHn5DUgDb5h
	 KBe/W4AsWz9NuGaUTooMjkUakqJ/4gDduK53R3cRQOz+yGBqRWFDKYEVHY2E7RFWHi
	 8kPiGCYn17WjAuhOeWXbED5zkRDaLP7g6+5cYkCQZp4s5YEG5p956sg+5e9NlTUZVp
	 S69huupTcIxwysI6hbu4iGGXwnWywl4fVt2376HHfJr59qhYkMm1pDZS4/5nNqm/je
	 cJ654FWXTd18A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DBE3640B0C;
	Mon, 25 May 2026 20:05:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Shuah Khan
 <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Vlastimil Babka
 <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify that "reviewer" is
 a person
In-Reply-To: <20260520154846.162170-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260520154846.162170-2-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:05:27 -0600
Message-ID: <87ldd71chk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Common understanding of word "Reviewer" is: a person performing a review
> work [1]. Tools are not persons, thus cannot be reviewers in this term.
> Also tools cannot make statements and cannot take responsibility for the
> review.
>
> Our docs already clearly mark that "Reviewed-by" must come from a
> person:
>
>  - "By offering my Reviewed-by: tag, I state that:"
>
>    Usage of first person "I" and word "state"
>
>  - "A Reviewed-by tag is *a statement of opinion* that the patch is an
>     appropriate modification of the kernel without any remaining serious"
>
>    Only a person can make a statement of opinion.
>
>  - "Any interested reviewer (who has done the work) can offer a
>    Reviewed-by"
>
>    A person can offer a tag thus above does not grant the tool
>    permission to offer a tag.
>
> However this might not be enough, so let's clarify that only a person
> with a known identity can state the "Reviewer's statement of oversight".
>
> Link: https://en.wiktionary.org/wiki/reviewer [1]
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>
> Changes in v2:
> 1. Add tags
> 2. Rephrase/simplify a bit commit msg. Rephrase title - drop "in
>    English".
> 3. Add "with known identity", suggested by David Hildenbrand. I retained
>    previous tags, assuming this change is within spirit of previous
>    version and there were no objections on the list.
> ---
>  Documentation/process/submitting-patches.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon

Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2143D5661;
	Wed,  5 Aug 2026 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785956063; cv=none; b=sgx0akyZmTGw4nI6uLgqBxWDxp/GUjzzMNECseA9pJDTR+k/2U7dFvx1fnMZBM3HsVRDwpvyJ2q3PofC3EGOwxnYz1tHHKbfvWYZjIeI+NAgWtqZIjyh6iZtsI0intq+h9ukQGBwytNFj3x0O2DL2Awx1fm03WTHfLcs75DgxlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785956063; c=relaxed/simple;
	bh=ZB2nBcZCB5z69uI3v7iIP9H5v3s0m44qc6Z71XUE3N8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EJ9gFf/9iDSdPBT6JX6SRHwuXLUTvSfN9+SRHnIqJJp/nHbS/BK3+e2xj+fgYsqnZdMmhSsAQz8hG2uAXnnmPHdw9JLAr9iMnnBH36eFYgSQcBxhvYIRGpG5MdivHa7gVSvgi/vwgewCkQ3x0HmRB6LRtQSqwZ4v4s30POLM3C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=bGu5IZ4x; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="bGu5IZ4x"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9B948408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785956057; bh=rCuSwOkGjR2qZv/wgZ7snftyF+l2uKbjbrggzkTDoE0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bGu5IZ4x9ylUeFCl1iCgg6AZXb8yvh3xr/gLOjBTkM8tbKJg0Sr+Zd5Y4WwnnyXp1
	 UbgWuE3OlxTxtVc2+aL9czxImYDNxFJRi15dXEnC3U4v6/AzJe8QsWnTm2Uv7cQUPC
	 1kjumJtLCqPxA8EHjNQEJ8YUXF/YelzdoIq29NPO91NSoeiRppwFpJ9IE268jtkTuq
	 3SO3wc7mMMO/zufKh6rgXz0/OTIiZe7RxeD+7sp/tkYHn71vB4mrB9ZqKYNJHT2IL+
	 pCY7dNeu6XF8QOwkImW0yAbgTWYXfK+TAZq8CDyfqiOrVdR2Hnj9TJIcH+osnK+VlZ
	 lcR9vsoxBa2OQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9B948408B2;
	Wed,  5 Aug 2026 18:54:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jeff Layton <jlayton@kernel.org>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>
Cc: Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH] checkpatch.pl: adapt to new Assisted-by: format
In-Reply-To: <20260804-checkpatch-v1-1-27f29c79a46f@kernel.org>
References: <20260804-checkpatch-v1-1-27f29c79a46f@kernel.org>
Date: Wed, 05 Aug 2026 12:54:16 -0600
Message-ID: <87y0eko0tj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jeff Layton <jlayton@kernel.org> writes:

> There is a new format for the 'Assisted-by:' tag. Change checkpatch.pl
> to just check that it has a value rather than testing for a specific
> format.
>
> Assisted-by: LLM
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
> This is a companion patch to the one to change the format in
> Documentation/. See:
>
>     https://lore.kernel.org/workflows/87qzkuahlr.fsf@trenco.lwn.net/
> ---
>  scripts/checkpatch.pl | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Applied... we don't have a Sure-whatever-by tag, so I didn't add
Joe's...

Thanks,

jon

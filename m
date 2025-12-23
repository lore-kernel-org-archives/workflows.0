Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF322868A9;
	Tue, 23 Dec 2025 15:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503428; cv=none; b=OH1mjmYEiK3KR+gzxGPurD4Co1f8Fev24TBEa0Bb7RtdaT2x/uGirBaex4LPnrzKiNJOHCTx+PFvqqGGJ6OyOTuJJfoB2tcmSSER2CZ0JiuIwsaAP9M823DtsgGSOsqMlO1I5b3ZX1MfocLhk6iO4ic0HTjBUk5dQ5Z8SH0EzfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503428; c=relaxed/simple;
	bh=x0CMqlBSaoGhoVxFQwkV00hebP/cnZHny9/xIWZQY58=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CaISZVPhKz/xIlB1GSjBNtLvmHDKzU3jDtyC4NohsrTDZXpvFxgsc0fuM1rGBa8tLrjpntU/jVaCX2pRi7RfKs9e9bIk4JXpol9G5dJ9iNhQPqZs11zB3JXlg5Roq4rw0WvMWmSsfJJrdQVNSC3LaDvm9p0qoTZKaEJgshV77Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=s31WIABB; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="s31WIABB"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 88E0540AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766503424; bh=LOL+AU7kVQyOpYQ+Kf5A4ON6XtLBAZC/C5kIrkAAMMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s31WIABBnz/69IfOXguM2PScYz+zPgmqMyTUH2dALC9zZjJY+BFPgwQ7PyfdvaNzO
	 NJRjODp9ayy/VWT+6oaXylLbHZ2PpJikFFmlpYfwBjtA6ySoH74QV5lUE6THGrpA/l
	 EqTdgINL1rfaX40xJ2IofEGLYuqfPwxB3ZefCl9mJI0U32nUUiLbT0gQtasT1p4J8b
	 nrX7ZWWmUS8wDOgAACWolgwoudFUCzOWzFU8ZxpCKskQ/fxROYtykjoH86ywLvHZdW
	 uWr3CKMEr+za8eyKGhfE8DWfUkSmPavYm2RjoylGL69N8Wr+bfYJ2vgSwZgtagWYi1
	 ixFP/hLDsg0fg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 88E0540AFF;
	Tue, 23 Dec 2025 15:23:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Arnd
 Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Linus Walleij
 <linus.walleij@linaro.org>, Drew Fustini <fustini@kernel.org>,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit about defconfig
In-Reply-To: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 08:23:43 -0700
Message-ID: <87ecolxlvk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> It is already documented but people still send noticeable amount of
> patches ignoring the rule - get_maintainers.pl does not work on
> arm64/configs/defconfig or any other shared ARM defconfig.
>
> Be more explicit, that one must not rely on typical/simple approach
> here for getting To/Cc list.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
> ---
>  Documentation/process/maintainer-soc.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
> index 3ba886f52a51..014c639022b2 100644
> --- a/Documentation/process/maintainer-soc.rst
> +++ b/Documentation/process/maintainer-soc.rst
> @@ -57,8 +57,10 @@ Submitting Patches for Given SoC
>  
>  All typical platform related patches should be sent via SoC submaintainers
>  (platform-specific maintainers).  This includes also changes to per-platform or
> -shared defconfigs (scripts/get_maintainer.pl might not provide correct
> -addresses in such case).
> +shared defconfigs. Note that scripts/get_maintainer.pl might not provide
> +correct addresses for the shared defconfig, so ignore its output and manually
> +create CC-list based on MAINTAINERS file or use something like
> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
>  

Like Laurent, I don't see this as being effective.  Why is it that
get_maintainer.pl fails here?  It seems far better to fix that, if at
all possible, rather than expect random contributors to notice this text
and work around the problem...?

Thanks,

jon

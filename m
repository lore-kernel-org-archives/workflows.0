Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C941328CF5F;
	Tue,  6 Jan 2026 21:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767736402; cv=none; b=lu+edrmQl/tlnb+kPS2k457KW7Bd1gV/LVwdYomVl0ymJEL0bb+G2P6I4T68yt7P5N5ypNON7UxQyw8lhWRM9eh0ZQ/yVWlwRu9YY0sEAip3a322BpxukOmPP4y71Gv9Q53MkaKjN1T/Xj1flf3UBW4WXJ77DKE1vEdO+RRjwI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767736402; c=relaxed/simple;
	bh=0nlyAW2ZlhbqgrjHGM8aXS+XJiWawXUNAG6fCCZM90M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JXReuAJi7VfEYsnROjS/MjZw7feX7XChTNkzIvUltNv1lCBgO6Gp6rCns+I6U9047bsFrdzUL/AjtRwyi4LXhM7pXoz6tvE2nQtQgrra/BeBzC90GD4k1LlxOzSq3lGf5w2s+JpPqKYiiGdmSvXALSuKdRdtaUAzlhXZPok06Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=eqtYFVFm; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="eqtYFVFm"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0785F40C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767736400; bh=ZCO9egIThwvunYNMXpT89JSXjLteBlCFQ4JXOA94/pY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eqtYFVFmAyR2XvSzBkui1N91RFZ/55w/nWh2TyVIKHp50Za+HnxSpebpLNdqI7fh4
	 tRsKCAzGJRmpYoBoqPgylfmPNZn06wTu6FtpXPp+VBymFWJ4xGOFNzjGZ+FG63PPND
	 hnoFA/SvOOX0IwZTimaxIMJ6rR2xjWiPYAjGFikRdrPhnN/U8QQY0jx2/pw+WGT33y
	 BpOEhKq3szIhmFwnKhYP5L7cd9p7NVvLAzHM4NY/BF4dc1jtxXQ+snZn1pwM2f3fNl
	 V0Fp2p3Pok/t2OPJMx5lGa1Z1rxS0KqWX/nQfu9jtsoO8jGD+5WGm5D42rrs1aHihx
	 nB3Issmty/NLQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0785F40C7D;
	Tue,  6 Jan 2026 21:53:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: SeongJae Park <sj@kernel.org>
Cc: SeongJae Park <sj@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: suggest adding previous
 version links
In-Reply-To: <20251225015447.16387-1-sj@kernel.org>
References: <20251225015447.16387-1-sj@kernel.org>
Date: Tue, 06 Jan 2026 14:53:19 -0700
Message-ID: <87v7hecss0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

SeongJae Park <sj@kernel.org> writes:

> For review of patches that revisioned multiple times, patch changelogs
> are very useful.  Adding actual links to the previous versions can
> further help the review.  Using such links, reviewers can double check
> the changelog by themselves, and find previous discussions.  Nowadays
> having such links (e.g., lore.kernel.org archive links) is easy and
> reliable.  Suggest adding such links if available.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  Documentation/process/submitting-patches.rst | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 9a509f1a6873..e69d19ad658f 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -805,7 +805,8 @@ not part of the changelog which gets committed to the git tree. It is
>  additional information for the reviewers. If it's placed above the
>  commit tags, it needs manual interaction to remove it. If it is below
>  the separator line, it gets automatically stripped off when applying the
> -patch::
> +patch.  If available, adding links to previous versions of the patch (e.g.,
> +lore.kernel.org archive link) is recommended to help reviewers::
>  
>    <commit message>
>    ...
> @@ -814,6 +815,9 @@ patch::
>    V2 -> V3: Removed redundant helper function
>    V1 -> V2: Cleaned up coding style and addressed review comments
>  
> +  v2: https://lore.kernel.org/bar
> +  v1: https://lore.kernel.org/foo
> +

Applied, thanks.

jon

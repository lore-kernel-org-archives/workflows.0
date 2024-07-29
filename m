Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3102B18D4A4;
	Mon, 29 Jul 2024 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722288590; cv=none; b=PIDIvHKM/5iKjHGT1a0E4t7dr8XUmEmpLEVFHj/WJBZQ0rMG5uCpXX5CEg2EFaFZmrNSB1p0jXwRvUcxpA6rcZI8au9gMGCgV/auv5JeqRuU8MgnBaRGaVm99MN8bRbxkzmw/Id75Q9mMMy8vOzCMa0ulB/7UpUefI2j15S5Lg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722288590; c=relaxed/simple;
	bh=2iMagjZ8kd5wc6bgYk4OUvAHwq0LMmGJR8udnTpRzX0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QY2leT3sM0BRhGZYdUVAoB/BYjvJSdyuNc9oHhJ3mGTFfa9I8EDMsb6w1UMEeu3+BGPFfotygojG7wmbFIK2XXxiDthgjJjF6+qfstKEWnGyvSeGfIvchYlj2NRQFDUClXPAZJ9sIv9K9S11DBmP5eVTmeKhxoGLBxYOPyiPXJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=D+TE6+ak; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="D+TE6+ak"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 653F8418A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1722288588; bh=B0v130neJyBEkQ0tb0/n3A4kTf3KPRdmFCY6jKivjuo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D+TE6+akk2jZYeZ5eF8zNiTpF0Xsb5pkWlA5gWG9kzLKQPoOiK5TpHE+yE4USK9+z
	 4G1UrA3QN//qLsExvNfyL/MfuE+usrPtdWwTAMwbXlh0ndV/y8dsBhU2lkcO350nbc
	 i1UyOaxG4ZlJPMLFO90WrDn/mkxh+9doi9SgW0KFHrzHNFQXK6TIFUUU66ZTKgMMMQ
	 BYdFYTBGr9wF8OSHW90HQb32gkBhVA7tgTGC56qbIql19e+kUibga378966Zvgyvuv
	 mTb3lBn765XHAi5h+QwMfVrkRVySoxJSvKnpGX+k8rDf3QzQwlgg45ZMisqwGJqZn2
	 NW1LdHg63XFKw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 653F8418A0;
	Mon, 29 Jul 2024 21:29:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, Jakub Kicinski
 <kuba@kernel.org>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v2] MAINTAINERS: add Documentation/dev-tools/ to workflows@
In-Reply-To: <20240723223258.2197852-1-kuba@kernel.org>
References: <20240723223258.2197852-1-kuba@kernel.org>
Date: Mon, 29 Jul 2024 15:29:47 -0600
Message-ID: <87ttg7999w.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> The goal of the workflows@ mailing list was to make it easier for
> maintainers who don't use lore+lei to subscribe to topics related
> to process changes. In other words it should cover changes to Documentation
> files which most maintainers should know about. Recent changes from Kees [1]
> to provide guidelines on naming KUnit files did not fall under workflows@
> since Documentation/dev-tools/ isn't covered. The patch volume for
> dev-tools isn't huge and most of the changes are interesting. Add it.
>
> Link: https://lore.kernel.org/20240720165441.it.320-kees@kernel.org/ # [1]
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> ---
> v2:
>  - s/workloads/workflows/
> v1: https://lore.kernel.org/all/20240722142913.1709594-1-kuba@kernel.org/
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ec6904cbfd1f..a85234de4fd0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6680,6 +6680,7 @@ DOCUMENTATION PROCESS
>  M:	Jonathan Corbet <corbet@lwn.net>
>  L:	workflows@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/dev-tools/
>  F:	Documentation/maintainer/

Applied, thanks.

jon

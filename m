Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552642;
	b=0xpdsZSCMwfW8O9vPsB3JUruJkeK8UbTVox/hN0zUwTyGmSLcNftt/trRxlq3nZ4rKnl
	 jdjy3o2DYc9s6rj3MURs58+f27xlYe5szmWtvagnV91FoK1qmnCSt9w4Kr8BvrCOW0bKG
	 gZeCbSzS1sUzi7xoY5hjZGdEgAt6/ssPaycF/vmYLLIxJ+LDAQ8KaAnFcW5NYi8xBk6XL
	 zvvuM2QMCDYoUMONUdi9S7x+9cKaK26cEDXoz0qHbGLckifvNPnortCrk/R5xZBEXsUhn
	 TFehe+1Uo05kH0xqaHGFjnhR3ndOYm21pp0CQITihOgSeA7/wTO3jrsfA9+jUfwbZfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552642;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0c9YSXQ8qs6FkTZSs/aCWtzNkPquzUM7JFakPCdb6XU=;
	b=YMpRtz3zQxXkZ6ynzkHUxbLT9sOlRY6idbNy91LBKBp5/0tJHz67ru5szFzmmsVSe/LI
	 b9hvZDt35WCsHwYDw8ktBkh/SfbDF3NPKt5TCwciNTWrW+nZ534Zzqu7sAoQsUCzgS/ER
	 hYLvCnCZJptb2qMj2pbE5fjPQS/xQYNTV4Pgd5RBuGuGlQ69tCOR10Wx1VCwCYUtLBFsi
	 s1sjuf9MSO3mdSDdED0Sl8oc4sgDpTfJR3a/8JkGYMvGyKMZDouNlDOc1Kans/IphUksq
	 ESky6i1m5/CJwXLMrKWtU4zAeXCizcMj8ElkxMpSAfb8c99CgOYP1/MPb2jtRy33HsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OIsvx6O8;
	arc=none smtp.remote-ip=95.215.58.211
Received: from mta1.migadu.com (out-211.mta1.migadu.com [95.215.58.211])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF11560A3839
	for <workflows@vger.kernel.org>; Wed, 21 Oct 2026 03:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF11560A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OIsvx6O8
X-Envelope-To: workflows@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Edw2hBrIlneBEdBFCqM6xrgbmwDc3urwnrYB4hLMOFM=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792552638; v=1; x=1793157438;
 b=OIsvx6O8Wcd9l7WwD7Lla2iS9XGjctV/FYvNwfkgT39jrcTEvE4eWX7KcfzQYmH9jL4Q3vad
 4gq8fKJj1rWfDA/n7YOy3IgMsxcbOnc/uBkIi/0duYztBw8So9T/qIIyx1MtVivK1wybnwHD2Nw
 MgxCd/O5hu/4pSoWoIKDpGDnFtpjl9rNKvpaTCi8AlabLIV8uv9pxo28s1Ijm1tkzkcy9qUjpOd
 O8e9J2orNfLyewPDLxFxEdIR37yxAxmQuKgbbDSyQLk2ygdZ7hszmBYOxKzSV7yRlXQoNDr7Jmo
 3shsMpAV49gjbMeUac/cRSgB5aZ1xLOkiFUQXiBMlaTTg==
X-Envelope-To: workflows@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 12c96e374fc691f1;
	Wed, 21 Oct 2026 03:17:18 +0000
X-Mizu-Trace-ID: 12c96e374fc691f1
X-Migadu-Flow: FLOW_OUT
Date: Wed, 21 Oct 2026 11:17:14 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-doc@vger.kernel.org, workflows@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <atguukYG6qCfLHMv@wyuan.org>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
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
In-Reply-To: <20261020212235.1143086-1-ebiggers@kernel.org>


Eric Biggers <ebiggers@kernel.org> writes:

> Many patches still don't include base tree information and can't be
> applied.  Such patches can't be properly reviewed or tested, nor can
> they be accepted.  submitting-patches.rst already describes how to
> include base tree information, but it's characterized as optional,
> appears only towards the end of the document, and is missing details.
> 
> Make some tweaks to hopefully increase the number of patches that
> include base tree information:
> 
> - Characterize base tree information as required, not optional.
> 
> - Mention it in the "The canonical patch format" section too.
> 
> - Clarify what commits are acceptable to use as base commits.  Also use
>   origin/master instead of master in the example.
> 
> - Mention how to handle prerequisite patches.
> 
> - Suggest setting the format.useAutoBase=true git configuration option.
> 
> - Mention falling back to free-form text as a last resort.
> 
> - Don't say base-commit can go "below the '---' line", since that
>   implied it could go before the diff, which is an unnecessary
>   alternative that differs from what 'git format-patch' produces.
> 
> - Free up some space for the new information by dropping the mention of
>   needing at least git v2.9.0 (since that's quite old by now) and the
>   example of 'git am' (since that isn't directly relevant to submitting
>   patches, which is the topic of submitting-patches.rst).
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

LGTM!

Reviewed-by: Weijie Yuan <wy@wyuan.org>

Thanks.


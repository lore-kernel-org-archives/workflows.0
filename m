Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2F82594B9;
	Mon,  1 Jun 2026 20:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780344486; cv=none; b=j9pT0DT2GfaI6HhuBEPXEbckJWDPFVCtraYB4RFHtMhzHl5NPkiBYAOHqZoj+rSctuR1YwDBtrV0hFpW9s0wD5xrw0K04JzZiUrkWhcsU7IuypP8vaKW0A7M+KY8bbJYl3nQXQkQj76gTgwTdzB29vAKzxReBQRjGE5obZaTnqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780344486; c=relaxed/simple;
	bh=jTcUFusjcMhFQPGvCvKw0eseElH9ueCs3ERk5tdR3kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uf1eZ8GtXP8cFGMJbwguqdP48IUyVz3liKjn9keI7/O9MXnHxMTFSsfepamRgCAmx9AAUl5pQvfXdt9H7Xln44ouoHdRhDW+iMksI6iAxTEcip9aekHpZBQexBfQuwfX5oA/xtuKUMeoXvp4/W3DOUS5p0w1LEMv29crGp7Dh10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzK5aDWk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzK5aDWk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E580B1F00893;
	Mon,  1 Jun 2026 20:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780344484;
	bh=agfeoVKywtwIFMpKuMk6gDQGcUu0P3E6Kv9h3i8akvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gzK5aDWkiuPHYu+96iYiNgbglIpA27VFrRVb1++MuKk7ORLbjTwaguxPNfT4b78f/
	 MNJUEBRdAGrth92QFTB1JWAuTi3liQ6EVB2zyEZyDa7l6LbhcodVxCvjJf5iwY3c1X
	 QTPpnvnXk/47XGtRRaNj88MZs1JxRl6bMmBsL0jjBxGgtQqu2LrSdMFaycM4W4OMpW
	 P3mxzvM+Cex2tmMdCn2mIyNHzqE5PJ2b/6kJWg+xhtdPUxJjzydiqkg1T4odIeLFve
	 pwXIuag64/SZeJRuxwEp7ixMn5vtFyc77zaj6YUVgdcLK3ckIF3xdrm/GXkWqBHKBy
	 liFWLDGFWdDIw==
Date: Mon, 1 Jun 2026 13:08:04 -0700
From: Kees Cook <kees@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Manuel Ebner <manuelebner@mailbox.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	SeongJae Park <sj@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: Fix syntax of kmalloc_objs example in
 coding style doc
Message-ID: <202606011307.531C9CF878@keescook>
References: <20260529081006.2019687-2-ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529081006.2019687-2-ukleinek@kernel.org>

On Fri, May 29, 2026 at 10:10:05AM +0200, Uwe Kleine-König wrote:
> The first parameter should match the variable that the allocated memory
> is assigned to. Fix the example accordingly, the one for kmalloc_obj got
> it right already.
> 
> Fixes: 7c6d969d5349 ("Documentation: adopt new coding style of type-aware kmalloc-family")
> Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>

oops, thank you!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

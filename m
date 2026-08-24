Received: from mta0.migadu.com (out-41.mta0.migadu.com [91.218.175.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80CD430CE5
	for <workflows@vger.kernel.org>; Mon, 24 Aug 2026 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580103; cv=none; b=KRC43T3nYAjRETnpkH8mU8hoO8UEtVrMdtiPO4hTqPN+galx1BoshaYUV56N8rvcpWzckrjkZJLW7jvNCzUa513hWtW/cHQB5cty0s090yjNCR1B65LIkIdf40Quc40qQnK5x+S80ycJn6jurRtbG2aOn88GexcBd8FGXGMzsEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580103; c=relaxed/simple;
	bh=aM6vxUmbd6dpBiDwVuo7sX7ZW58krp/3y2GI+G8i7Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6RBPkApWa73TorI7pI+cjH8Kl0vDqnzpdSTTWHjP1IqLe305wP0mdpV999Xet9xr5W4soO7MQ+SNNDztTWBEn+US/zhsn8JzNNuxpe36CwHEU2oRGEXyKWtvVk9xdP9vzZNcyIc1LRXvTN/R3RdpseDL+kV+u3SBt/zkvgATKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=RiMDDj/z; arc=none smtp.client-ip=91.218.175.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="RiMDDj/z"
X-Envelope-To: workflows@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=aM6vxUmbd6dpBiDwVuo7sX7ZW58krp/3y2GI+G8i7Q0=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787580098; v=1; x=1788184898;
 b=RiMDDj/z/fh9mV/hiD49Je4ekQE6Dj8mQr4yALvJJri5dOJeq+OsBsLsi7FkdPfHNTbCOeZG
 x3j3Gt9FrTmCial1c8RsyZ4jaZ0HcqfcjN/AuiykFvKWWgnGHnsPEEJGoGAiF7L+hjz5g7sWyil
 P9iyINK48zYc1Xm0o1OMTz9leBUK/mq2YqDHXk85j/hs4hZ3pOPtlri3CqDSzG0wAGqI6t6xYV5
 gksaGWWwo3jNAAXdJPjPSaad3W3qKFOT/cu5TlNkGYBkKR/57QUdJ34FaB6uLtFFtFym+M/agn1
 lRU7LCMg9RIhRwRPPVJzL7mu7c0XjaKzFzKeyUrUK9b0Q==
X-Envelope-To: workflows@vger.kernel.org
Received: from localhost (117.176.242.187)
	by smtp.migadu.com with ESMTPS id e431fa3162a10859;
	Mon, 24 Aug 2026 14:01:28 +0000
X-Mizu-Trace-ID: e431fa3162a10859
X-Migadu-Flow: FLOW_OUT
Date: Mon, 24 Aug 2026 22:01:16 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Nguyen Duc Thinh <ducthinh100812@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Documentation: process: Capitalize Git, Quilt, and
 Mercurial consistently
Message-ID: <aoxOrN89v1meHAlQ@wyuan.org>
References: <20260824133826.13934-1-ducthinh100812@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824133826.13934-1-ducthinh100812@gmail.com>

On Mon, Aug 24, 2026 at 08:38:26PM +0700, Nguyen Duc Thinh wrote:
> Update various process documentation files to properly capitalize "Git",
> "Quilt", and "Mercurial" as proper nouns when referring to the source
> management tools themselves.
> 
> Instances explicitly referring to literal command-line invocations
> (such as "git log" or "git bisect") have been left lowercase.
> 
> Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
> ---
> v3:
>   - Fixed the un-staged git commit state; the 'git switch' changes are now officially gone from the diff.

Thanks.

>   - Disclosure regarding tools: I DID NOT USE ANY KIND OF AI AS AN ASSISTANT IN THIS CONTRIBUTION, the mistake occured because I don't frequently use Git to send patches, I use it to open pull requests so sometimes it feels unfamiliar to migrate.

Okay, that's fine, whether you used or not. I don't have any opinion
towards it. I didn't say that you are using any kind of AI tools.

>   - Is there any mistakes that I'm still having in this patch because everyone make mistakes.

Okay, I didn't say that you cannot make mistakes, instead, I said
welcome. And true, everyone make mistakes. Please don't get mad.

So please wrap your text to ~72 columns next time. You didn't wrap your
changelog, as Luca pointed out in:

https://lore.kernel.org/all/DHQFTM1FG7B7.18GOSSZDHD5JM@linux.dev/

Thanks.

Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927463816F3;
	Mon,  2 Feb 2026 17:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051755; cv=none; b=aqpv0rJOqYo7/vdbjj8H2a3kcCG09eWu2P+cBw8kRzqTgeOK1am652rTjbejZpIQuh+rEIqkFJGcuaUzjkOa4BiJzxiEfR3CChK9nVdn6bvVkyBLWsTsuITDFzD3EoJDOqF3UXK+kJ11hLuOC0dAG8CtmrM6nwNKBzhx2kQ0DRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051755; c=relaxed/simple;
	bh=fvrOZFPZpzE9NAAYfdPujLd/dDEkMiGlpqY4FGmguAE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=djPNsgUNgf7pt8wtDafjyn+c64ZwqnGFTejJVUupaI5MjEIk3NLiKLrOQvgJRkrAtWGv043rGrmWfESYz1xvQ0IuIkEUfJ6ItgBCZ4qwNJOyLpYPaKx0WhNAktUqsF0lM11bDL98+SwWB5xp8GNFwYXUUkn6JNEyAUCU2m/Ft4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=oLsXofkh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="oLsXofkh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BF33440422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770051753; bh=8Wkko+hun6kWZIGoHnOSvREA9wsbHpb0frmHhZqoyc8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oLsXofkhF+2OT3wwi03Pyn171gRhnCFn3zSGd15jCGMWgiqqJiKVznxxXXKAo2eKI
	 KXBBWK+mFKoz1mt8JemsNY7veISW7CWcCZCOV1W1islWb3c66uvIFhTDjS5xHFLN/a
	 jT76YtKvP2Spq68iYxvBG0pm5wbio/1HiHi/pOouZTAUGWWrGAeiym2nLYMVIc7Ov4
	 H9og3ZxIIN8ZLBvpPb/x/6o5bUgR5uEtajDfNgd49g77dhGp4EQ8jeOdQcrzDhXrr7
	 AgIO+fhT5B76lh3Kzzw3Kek9sO1t4o/GVnJny30E/HJeQkcK9pnrVaEKQAmlLaHIhq
	 24qNMCqs23VvQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BF33440422;
	Mon,  2 Feb 2026 17:02:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dmitry Antipov <dmantipov@yandex.ru>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, Dmitry Antipov
 <dmantipov@yandex.ru>
Subject: Re: [PATCH v2] doc: development-process: add notice on testing
In-Reply-To: <20260123071523.1392729-1-dmantipov@yandex.ru>
References: <658caf3b-aeb6-49c7-9e5a-1eab175dd1b3@infradead.org>
 <20260123071523.1392729-1-dmantipov@yandex.ru>
Date: Mon, 02 Feb 2026 10:02:33 -0700
Message-ID: <877bsvrsd2.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Antipov <dmantipov@yandex.ru> writes:

> Add testing notice to "Before creating patches" section.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
> v2: adjust spelling and wording according to Randy
> ---
>  Documentation/process/5.Posting.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied, thanks.

jon

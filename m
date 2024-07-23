Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1314F13DDD3;
	Tue, 23 Jul 2024 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721765308; cv=none; b=Lu+QIPXEYbuGSMVLuJhEQbePZdnB8cj5gv9q+6XBW+ttlw3KOrO/WB+wM7fnpSmBBy9CtVEOEpWGZksa1y3hPnUCWWxg0HKKi0tFm8xVDyEugi+jhL0zvZRD32ghmImDI/YwnASUnBCBBSB6mKn54O3b1zWlwkkq6tibTCHP+j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721765308; c=relaxed/simple;
	bh=hdkA52IefuUTmqCt28fIf2HDiZTurWkBqdAi8Yecj5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqD9I9SAA8dGBaVzxeQItwaYjXMjq2BLHf8SIb44eAKKlXlCmnx0yR6dQ5lMo8Jz0SxrkM2EkXcXG6aawdkHd6brNBQn6JRuIfetTDaqo1jzKFkr/WVox4McU9x7b6pGi9pBN1n1oSjrCBrxBCSq6i63lBzQNMc/BSFWcLP1lrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBGVHq5R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBGVHq5R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2843C4AF0A;
	Tue, 23 Jul 2024 20:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721765307;
	bh=hdkA52IefuUTmqCt28fIf2HDiZTurWkBqdAi8Yecj5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBGVHq5RhBrz1/9OrslbqfFrCEOrj+fHP0oUJiHY90KjV12X0/FDbB3FSsVZ4ztN0
	 Zcsb2kgRX+lrVFeRBX53NEgbSV3hNof0h2vbfabTbzWWrR96YF/TWRElZ8UHc/j0D/
	 8TuKMQ+O58F3LRb16z1tVhG8OQBp6EU8rYcLgl5MElSjS11265c7XVSUyRpdiE31l9
	 in36DDbs6T2aUhgv/U+Cxpla1HuJQEvoAls6/G00WgCt6UFab5kskUatKBRspnfIQg
	 Jey5b2eLMO3zDSRw4rOcix/Ygts44562D7CKeLKwBHRh6tAxtMKVDbLnhPVwAwf+k2
	 2/kz/xgZrSqSQ==
Date: Tue, 23 Jul 2024 13:08:27 -0700
From: Kees Cook <kees@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add Documentation/dev-tools/ to workflows@
Message-ID: <202407231308.90B5E1A1F9@keescook>
References: <20240722142913.1709594-1-kuba@kernel.org>
 <6f1f7e37-c5a3-4da8-9c03-6ef469ad90ac@infradead.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1f7e37-c5a3-4da8-9c03-6ef469ad90ac@infradead.org>

On Mon, Jul 22, 2024 at 08:24:57AM -0700, Randy Dunlap wrote:
> 
> 
> On 7/22/24 7:29 AM, Jakub Kicinski wrote:
> > The goal of the workloads@ mailing list was to make it easier for
> 
>                   workflows@
> as in $Subject.

With the typo fixed, yeah, good idea:

Reviewed-by: Kees Cook <kees@kernel.org>

-Kees

> 
> > maintainers who don't use lore+lei to subscribe to topics related
> > to process changes. In other words it should cover changes to Documentation
> > files which most maintainers should know about. Recent changes from Kees [1]
> > to provide guidelines on naming KUnit files did not fall under workflows@
> > since Documentation/dev-tools/ isn't covered. The patch volume for
> > dev-tools isn't huge and most of the changes are interesting. Add it.
> > 
> > Link: https://lore.kernel.org/20240720165441.it.320-kees@kernel.org/ # [1]
> > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ec6904cbfd1f..a85234de4fd0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6680,6 +6680,7 @@ DOCUMENTATION PROCESS
> >  M:	Jonathan Corbet <corbet@lwn.net>
> >  L:	workflows@vger.kernel.org
> >  S:	Maintained
> > +F:	Documentation/dev-tools/
> >  F:	Documentation/maintainer/
> >  F:	Documentation/process/
> >  
> 
> -- 
> ~Randy
> 

-- 
Kees Cook

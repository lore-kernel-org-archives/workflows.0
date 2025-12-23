Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7D026C3A2;
	Tue, 23 Dec 2025 21:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766525673; cv=none; b=esXBckZzk85WxNEvLi/NODnSjKUqXy+bJtfn5zRMytQY5h0+vRDRJRuZzYw0f/a2R7Li1gr2JsA6BbaukpKjyVQV8AwfNIyGeH90pHBLiHx34k3c49hLBv+qLRD3+l7a5098b51pQ4xByF1sYEf1Wdxr2qi9yI/vTUu5cgp+dRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766525673; c=relaxed/simple;
	bh=VMCITwgdnFsXPw/Q4wDBum0A5HEttwklkJEQR3AC+hs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eN9kw6J/9zuXqZsZabH2vb64EosdXXZ1NTUTVSgpBFV2I+8ga2ou5S0mZ8xlZxwGiTgZBp0Jpk9pSg5d7REH1PQLTCkFf9wxvor6fYRaQPTY8PX0QHn/u+jNnRTMHFtkrsDx0oGiKz+ylE0m126hyimil9lU2uE/EoT4b9CirTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lTqkDbwz; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lTqkDbwz"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 290A840C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766525670; bh=BOgG2hcBm3X8xc0N1eM3d8lWUZ1nn2uZwnjGy/bnMSI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lTqkDbwzyREiqr1OHOr7T7Gw0KvIZn0KnOsnXebZZ3nIjKf8CXvtzHfUC7iWryx2Z
	 4CaBTpj76lIPm3taA3oxRjdcdxU5Uvz9AsaMlyNMTP/2FCJnRIsQzNpXzDt8u1dYPY
	 XA8N8gBvuAFXuvKoPVMLk6Vdmp4nFUQvMVhWI/yS0+B5TrR6O5uKNNM3abuDHEt66S
	 IH6jmo1hY3RkMrgR5tYyM+zwAb8lpUa0XQBa9EWphrkk+EBrGGRyI5+VFJ2KdXumbA
	 twcLXyWRWZ8GEIZvyfua0Mkb4RK5LVy/KnkHoOCuTugBRMh8b5aoVuRQF5lQjeIiG9
	 IVaI8R+k2cHWg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 290A840C61;
	Tue, 23 Dec 2025 21:34:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] Doc:it_IT: Do not reference kernel.h anymore
In-Reply-To: <b5niunhlqabuekgmsf4xrhqntx6qwi44mh7smntocomfjhoadk@fazjt4uqiv4w>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
 <20251205111559.3089219-1-andi.shyti@kernel.org>
 <zylu4ulxeyni5diwnp7o7evcajqyylhzzd4d2skyi2ul2ayb3b@2kojo3dyp2vi>
 <klzag46p6mlqqdrogqofancqyjpvs5lmwa4m3tjszcgavdwa6s@nay2uuwpsvlt>
 <87bjjq18h6.fsf@trenco.lwn.net>
 <b5niunhlqabuekgmsf4xrhqntx6qwi44mh7smntocomfjhoadk@fazjt4uqiv4w>
Date: Tue, 23 Dec 2025 14:34:29 -0700
Message-ID: <87h5tgubkq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Federico Vaga <federico.vaga@vaga.pv.it> writes:

>>I'm unconvinced about "file di intestazione" based on my own
>>understanding of the language... but, in a case like this, I will defer
>>to the creator and maintainer of the translation.
>
> Due to my explanation in the previous message, and after your answer,
> I have the feeling it may sounds like I'm making up words needing
> persuasion. Probably I'm misunderstanding. Just in case, please allow
> me a clarification.

No, that was not my intent at all.  It's a term I haven't encountered
before, but that doesn't mean you made it up :)

Thanks,

jon

Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4E423BD02;
	Mon, 24 Aug 2026 13:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577991; cv=none; b=J+PTiiNF3S5QyacuJJsfcVuquEt+JpzkxNwnI2M/tCWoqi1k07t9S4lYdVN6tycFKb7M+jfJxLgNruMrmcet0Rf9fk1Jnb232VUY4piMqnmL5gQhWuB2UCoy+Xn+5WRcMoZ2alLCBeeQb1fXplrETjWFxQdgvr78KImacRfcImg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577991; c=relaxed/simple;
	bh=8Yda665AhtZeqAckdS2pWXx71zwKt7Ri9/WOHQSmWFM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ICqU/njywWAeNbRYIDOpgeQMzMG8y/7Fn8o0cNeetA1SaYUu0KrY1OvFGqh65YNQtxaYuUlQffFcF1IeuaN9UpKRfqdab9tmgNwl8rP5qj0P58O1Tt+OTlonD1Qo/LnbfwvHMAxqJxUXrOr1fQk+7AH3CjxBYz4kxooimmfVUfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KE5hdcNh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KE5hdcNh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1DFBF408E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787577989; bh=kFXzMLEeTGekgR0VbxwX/2l61M0dy8rWdEsWhMm6xIA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KE5hdcNhaiTJf/YnrSa/3zVi9eD9f2m4xFTIv7LY1FdxVtDx7Vyj1yBjPRj0EpW33
	 5YPsfzWDjgeFo+D66L7YlJKD20HeAnpxTu2MMgZBzqdMzZSBBUYobKZDgg60XAyOrE
	 cRZQFerLnRqGvCQfEgx9fmFQvtikrfeRdM/uBveJFNbaIW9qGZ2K6JPzL9QGaD6mLi
	 mlZbqpTIRsZ+yAWUmIKN07kiVT3Ni8e5fnH7jeTy55RmDEm8000lLB0FrAD7NZLxyF
	 vZAfxiE7yujImX20ozdTCinKifqcGI9kPDSUmf5vbOqtktm27g9gt1eB57Xhen9qJo
	 zI4z/upiITcag==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1DFBF408E5;
	Mon, 24 Aug 2026 13:26:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Weijie Yuan <wy@wyuan.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, "open
 list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [Issue] sphinx: incorrect high-lighting
In-Reply-To: <c7a3db22f56c598ef35676288d10303af21098bf.camel@mailbox.org>
References: <bba57d51c72d9387ccef2b5979fa618e980c3ebf.camel@mailbox.org>
 <aosYfdfH6Z7ai5M2@wyuan.org>
 <c7a3db22f56c598ef35676288d10303af21098bf.camel@mailbox.org>
Date: Mon, 24 Aug 2026 07:26:28 -0600
Message-ID: <87mrub1wfv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> It would be this list:
> Skipidentifiers = [ 'and', 'are', 'as', 'containing', 'element', 'in',
>                     'including', 'is', 'name', 'needs', 'of', 'or',  'page',
>                     'pages', 'passed', 'randomization', 'request', 'that',
>                     'to', 'where', 'which', 'whose', 'will' ]

So this is an error-prone game of whac-a-mole...as Randy pointed out,
"struct page" is a rather important one in the kernel.

I can apply your updated version of this as a short-term fix, I guess,
but a better solution is probably to only apply markup to "struct foo"
if we have documentation for that type.  I can look into that later.

jon

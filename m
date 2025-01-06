Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43B14A0C;
	Mon,  6 Jan 2025 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736175486; cv=none; b=tbsOLkAeQlcnFlwv7e0YHLxrxqZnprrwMf+cJp4+mknG/zRFZ7kG4uao0l5igr13ucT1389QRsZDadfGE2Awox5L9QGGEFNMIfBdPQGE/yeqoZQCus1brtaej8AH3+CjUl0nZ7Nxwv5lJKES8UsF4ILUamk3VwCkRgnqTjsxDBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736175486; c=relaxed/simple;
	bh=iuar2lwNP7F+S5TUTf5iPO62vW8rHSyekdO7E1E/xUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dwzJ6EnboumIAcBPIy1nztCSNXFiX0Ba3DHebciHuStUWF7y6XK9Th/KgGTSvIGhoG2/5Ik+q9SRxZp+6pDLgVsf/fZEsj+TZ3/I9bVdxLqtCYYnSgjVWFJyGNbBZsGln5k4lSmcnwHaBehCz0BbPxUeQJoHJwpHDDiqrToUcrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=JCpuyNiJ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="JCpuyNiJ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2E9964040A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736175478; bh=51AlZKJwDjZ6MC152Em9G//ejCX96RiWcNo1acPaZfE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JCpuyNiJR4qqKh3Nqf4RnEz9XEh+VeaXckCBv+VKNu0QETXxfgZYdcdm/EMYzY+8n
	 LpUuqISRXi0jv+xVjHonqBNbEMygrNy6X9EEGRwq2tgtuSBEWxlz9IizCbSZva2HwZ
	 XUcTdGGZmp3RqNLhsQWdw5eHEDNdNUAQXsOo1AQDmQ2bS7g/MhH5n9Oer+Z3PQYmfy
	 MmNrqF4e0GNXMY80tTBXEWb6AIl1UgOEK3ZcMprFXm9kpDbkQqx0ZNGf3E6giKXTlv
	 Qz8Fqk1KWoFLT/b6YDou81/mt6FWaM4zKWBFSDnbOHdHEwrpDVrReXhCq+vBTHOgez
	 aF0TnCWg50lVw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2E9964040A;
	Mon,  6 Jan 2025 14:57:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Frank Li
 <Frank.li@nxp.com>, kernel@pengutronix.de
Subject: Re: [PATCH RFC 2/2] docs: process: submitting-patches: clarify
 imperative mood suggestion
In-Reply-To: <adf12374-30e1-48bd-9f73-fabc5a8c2357@pengutronix.de>
References: <20241220-submitting-patches-imperative-v1-0-ee874c1859b3@pengutronix.de>
 <20241220-submitting-patches-imperative-v1-2-ee874c1859b3@pengutronix.de>
 <87r05p10bt.fsf@trenco.lwn.net>
 <adf12374-30e1-48bd-9f73-fabc5a8c2357@pengutronix.de>
Date: Mon, 06 Jan 2025 07:57:57 -0700
Message-ID: <87sepwt2fe.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ahmad Fatoum <a.fatoum@pengutronix.de> writes:

> Hello Jon,
>
> On 30.12.24 19:40, Jonathan Corbet wrote:
>> Ahmad Fatoum <a.fatoum@pengutronix.de> writes:
>> 
>>> While we expect commit message titles to use the imperative mood,
>>> it's ok for commit message bodies to first include a blurb describing
>>> the background of the patch, before delving into what's being done
>>> to address the situation.
>>>
>>> Make this clearer by adding a clarification after the imperative mood
>>> suggestion as well as listing Rob Herring's commit 52bb69be6790
>>> ("dt-bindings: ata: pata-common: Add missing additionalProperties on
>>> child nodes") as a good example commit message.
>>>
>>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> 
>> I'm rather less convinced about this one.  We already have a whole
>> section on describing changes.  Given that this crucial document is
>> already long and hard enough to get through, I don't really think that
>> adding some duplicate information - and the noise of more labels - is
>> going to improve things.
>
> Do you agree with the content of the patch in principle?
>
> My changes were motivated by a disagreement about the necessity of having
> to use the imperative mood throughout as I described in my cover letter,
> so I still think think that a clarification is appropriate.
>
> Would a v2 without the example at the end be acceptable?

I will always consider a patch, but the example isn't the concern,
really.  The information you are trying to add to an already too-long
document is already present there; I think that repeating it, and making
this crucial document that much more unapproachable, would actively make
things worse.

Thanks,

jon

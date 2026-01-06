Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BC2230BE9;
	Tue,  6 Jan 2026 21:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767735635; cv=none; b=ue8m7G6yytdLvKSThfDc6uz4+jSDKAQno0Mi+Laxybmo5gtIJwJdVWK/b2lWG/A/Sxm/f+DtNXToBFM24uEy6JU6LbizFeAFWm95TIFVxTqVZVir3yEV7WD7cVY3JL53XmjTkrbkuI4pUdsJvZV4efKjQuix0EQg5p63nSr/Yt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767735635; c=relaxed/simple;
	bh=UjrpbH0DFfDZT155hUiuW/+yvXIwrHmmhNlqV/73tHE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Lq5+HtW99d/jc7WO2XGwtQKkozGsffUI/1ibPHoSFFOGey/ibJnsJ+35Dozc05sXlqwQ+GH+ruvuaIBKQV9Nf03zh3JrZcCni5H24kaSvQbrEWu0RTViJzX/QZdIfRvB1OguNFlTNhHG1P6bYcSMWHDYZWtjm1fkSJBqMs1e6y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mgD85ZAs; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mgD85ZAs"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B10CC40C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767735633; bh=Kf1sPY2GaWKjZFRJUksNjvtd6s25+Q5yplmqeqDG1jQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mgD85ZAsI77H9Nqb7wa3HEkHD20N738E59GJ/5LXNUcgZWUTBFp2WXCVFWc9q3eMJ
	 7a2OPchqOkY6nxye02QHmfQXQuOV2aAxq4m9E9Gt6gwkmMtrfV409NbcLq8HcCIanF
	 LoSue1hOpJK/YJ2TqIhcZJml9fBbArw6ZnLWehtGJWMQq04A1An2nKxVJspMqh1D3O
	 AZfs+bhKA+WnsAh089FGcx4isB2BgS8WKYLwf4ma9BfjGlXlhRLvGFSV5RF/qVhSEi
	 7QXg9w7NZSngsxe5aSbXP94b5kL2wv8XrxbNbmiB/PTqm97M/3v3wjYV6xZXARB2Qh
	 IN7EDSHIRCADw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B10CC40C7D;
	Tue,  6 Jan 2026 21:40:33 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Volodymyr Kot <volodymyr.kot.ua@gmail.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Volodymyr Kot <volodymyr.kot.ua@gmail.com>
Subject: Re: [PATCH] Doc: correct spelling and wording mistakes
In-Reply-To: <20251225133911.87512-1-volodymyr.kot.ua@gmail.com>
References: <20251225133911.87512-1-volodymyr.kot.ua@gmail.com>
Date: Tue, 06 Jan 2026 14:40:32 -0700
Message-ID: <878qeae7xr.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Volodymyr Kot <volodymyr.kot.ua@gmail.com> writes:

> Fixed capitalization and punctuation in process documentation.
>
> Signed-off-by: Volodymyr Kot <volodymyr.kot.ua@gmail.com>
> ---
>  Documentation/process/1.Intro.rst          | 2 +-
>  Documentation/process/2.Process.rst        | 2 +-
>  Documentation/process/4.Coding.rst         | 6 +++---
>  Documentation/process/7.AdvancedTopics.rst | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon

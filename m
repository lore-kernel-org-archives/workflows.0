Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC72361654;
	Mon, 23 Feb 2026 21:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771882591; cv=none; b=EOtKyyBSqbJ3lN30Z7qKuwt3qrBwOia7dCpChkuUwm3whWC8lT/xbjoHYgNASKTW5N3PRu/MyNIWI5ZI7CnjGFUq7jvlRn4jCeFmmVLTfF6NwJvVoy7g8qLo5JbuwbhPb88q5BSBukitTNe0ogpJBdfplFyVnm0oIB9HkYrpEKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771882591; c=relaxed/simple;
	bh=j8paZt80GpEAz/EWAewYm2BlU2bgEJF+ua+TytbSHCQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tk6okiZyIh4g0/V5lkA3hJVscWjVM7iPAqGaFgWLL2bCcxPlYtqydflPWKZh0l/5TBavWXcvlh9r5PLIanEZJS1ii/ORFoe1VT8VHqwBbPuU8MDdaXdwxGEdytzBWpEkeqDJ1uSrHHOEpSN48trMvCZuZ+9OIa1HPWFz/4stg8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jsC31i7g; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jsC31i7g"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1081B40C6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771882589; bh=7PBuhnNCMsNNr2mxhiGfK28ZuYw2r/55zdYUCc1zbkU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jsC31i7gzGJAQYwWpzFj41qIo8TYN0ZGtmxD0pGsFRW1x09lGCesK0a4lmE3y+/Fi
	 02xZC4nqG+ExBFugWM6LZijpLTFxLvp3+vQFWurgxqpnY1EFBfuhuQ3T3DJeUQoVYV
	 OT8QjbcEi34G58hzmgaAuhGZkw5F1E9Z2CXaH98Jz5cfgYzoNYDnRtKFe+tRtxGvfk
	 28QvAl3xuV912w36fmWSYVeaTgpg3FufWJCv5UoHbcr/ycb3Ax4p4iV5oOdPW3OlN8
	 xZM+AD4vsv+3ST09dlv8cZeJE+glKGCy3AaUyURYKhpLaAcJOhO6fWhkKq/8liYuBa
	 x3FhmjTCyANZA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1081B40C6E;
	Mon, 23 Feb 2026 21:36:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] linux-next: update maintainer info.
In-Reply-To: <20260216060739.2791462-1-rdunlap@infradead.org>
References: <20260216060739.2791462-1-rdunlap@infradead.org>
Date: Mon, 23 Feb 2026 14:36:28 -0700
Message-ID: <87qzqb3zxf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Update the MAINTAINERS file and Documentation/process/2.Process.rst
> with the current linux-next maintainer information.
>
> Translations of 2.Process.rst should also be updated.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: workflows@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
>
>  Documentation/process/2.Process.rst |    2 +-
>  MAINTAINERS                         |    1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)

Applied, thanks.

jon

Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CBE3C4154;
	Tue, 30 Jun 2026 19:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849158; cv=none; b=eGXtUoy4HuYEr3X9Y/0c1FkyjkKiov+Inj08ree8FIj3AmQ0GfqZ2ncy4KM7CqtXylsYR5BZjzLEfZvQ0U9BQIXY0T3wPCcUIOYc/e6JiAlEhBUd4Qlm8XJVOGNcw8z4docMZWToMSgcMFQ//AOi0JrXJzivAUPOKThYFcJ5pZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849158; c=relaxed/simple;
	bh=wnVBEttC5F7Qj63t4+Um9QjeuRxxDK0Ghtz8TLXHbaE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ehmXRV0tR7JEufHgCSOWw78F8/ykamkB6mk2Y/Tc+qGFyS51xVdI1cShitSJ4zBzBp61A1IRtk1eIl2XXPNn+xDYRAyEaTfVVDeOKYmOFy3jU/KPQQYeYEh43wFMdBDzK5pkdH0gpoWX5uI7rcy8HCX7jqz3697c1Z+7LZ2yFrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GR4mBt/y; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GR4mBt/y"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2903740E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782849157; bh=xbAhagwIJNmVctUIt9es8CqoFvgyOAsV4i4sFH5SqU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GR4mBt/yE0TjEDbCsyw11G/tWI32lpILWe6zN5Qj5PulreOX7XxjXm3Wgum5uLoGF
	 /Bkx8PIiREHG1x/8r6e0pmyR8UubsG6yKmkhWteOX4OzX3i+zsekTohKoHMFBdGwLN
	 hbSiE35dWFTuCPJEOzfEGL5FuAdWxV+A8AQivyBvZX+PxPi51p06H1Nd8TnC9rKPbW
	 9g6vYRQGcQsgZW68ejMKUzQy7bEgmu0mUA9PnpRPpWBedhwBBAfGq5sVlZDvAqNo7A
	 BJ6ofTmI0EOglRXXGSK9aQopT+eurGDaIWMy6brfPRX1UAKYfdQJA5q37fJBoSBevs
	 FTujblyscOk6Q==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2903740E27;
	Tue, 30 Jun 2026 19:52:37 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Coiby Xu <coiby.xu@gmail.com>, linux-doc@vger.kernel.org
Cc: Guillaume Tucker <gtucker@gtucker.io>, Shuah Khan
 <skhan@linuxfoundation.org>, "open list:DOCUMENTATION PROCESS"
 <workflows@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: dev-tools: scripts/container prefers Podman
In-Reply-To: <20260624013850.1853171-1-coiby.xu@gmail.com>
References: <20260624013850.1853171-1-coiby.xu@gmail.com>
Date: Tue, 30 Jun 2026 13:52:36 -0600
Message-ID: <87jyrfrekb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Coiby Xu <coiby.xu@gmail.com> writes:

> Obviously scripts/container prefers Podman over Docker. Putting podman
> before docker also makes it consistent with following parts of the doc
> and the help text of the tool.
>
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  Documentation/dev-tools/container.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon

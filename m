Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47F142C513;
	Mon,  3 Aug 2026 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783394; cv=none; b=QqNAEn+cWK0HCOgFw7VPMLd3k+CWbDRfTqfxXtRl5KHm7MoGa8ebmIodbhQRzqTdNlPxt/fUJEmx+wV3vVJAbbaqynY4c9DUSBGR3Ts5XJvkGNvzQfLjIkvZXESe2A9xMPdQK9wOiURvPyM9M6xiXyaFYP7BLWweBVEXDN0ZLSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783394; c=relaxed/simple;
	bh=gdyLQFsY8HVyDIsY29RVfWQkR8t/g5TdBtA/ZtNuNGU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uxe3lox5OzekXkGY5BoH9fp5R1t6JtAmig+pVm7eo1LUtxR3rNBqz5sxpqBjnLw71MUXAyho62KmVT19iJncynOnP44Z3u3s5MyC7qmPk2Y+jqJX8z//tEgYqI48uddWmeP43jHoSvuwdFXfhkKS3t/K+3Gp+sENXuxFzVZHgMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=TRosX6kS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="TRosX6kS"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CD544408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785783392; bh=qZi9oE0fSHLmHLs+EYrv+EIBKWg2PCNeADFW28Jm+Rc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TRosX6kSu2wcwclJUM6SZTVnOlWbQElZJ5bOLvnm3Y/zvc6ClcAjH9oo/Z7NenQYo
	 Zy21xn1/RsfqmfOACgneKOf//p/qXq8unjB8G+0a2K/IHF0PEXqtO5AqVzy5kYmACW
	 7OdrxGj4WIAeOtaEYeNle6xc/em9hU22NALHtMmRxuUV+MO2ujVbS01E0I7MRVsFvQ
	 JSbpMBTfWp6MvMiFOIWEq4gVBFqvm5YpSdYMyQPteBLiznOngfC+BuvvXQvkDSpFgN
	 PDU2GhXjHXyjVeCf3HsSsBzobItQLO/0jqwXA8h+lT0XiUkfkRFLKHlOkLl6yv22j9
	 fIGIvCUOcABQQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CD544408B2;
	Mon,  3 Aug 2026 18:56:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jori
 Koolstra <jkoolstra@xs4all.nl>, Sasha Levin <sashal@kernel.org>,
 tech-board@groups.linuxfoundation.org, Jakub Kicinski <kuba@kernel.org>,
 workflows@vger.kernel.org
Subject: Re: [PATCH] coding-assistants: simplify attribution
In-Reply-To: <87qzkuahlr.fsf@trenco.lwn.net>
References: <87qzkuahlr.fsf@trenco.lwn.net>
Date: Mon, 03 Aug 2026 12:56:31 -0600
Message-ID: <87ldanxcbk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> As suggested by Christian, I have applied his patch to a branch and
> simplified the changelog, see below.
>
> I'm nervous about applying it still because I don't think it's my role
> to set this sort of policy; I really want to feel that there is a
> consensus behind it.  So there's some additional CCs here because I
> would like to hear from some folks:
>
> - This policy document originally came out of the TAB; is the TAB (on
>   CC) OK with this change?
>
> - At least one maintainer (on CC) have said that they currently strip
>   Assisted-by tags out of patches before applying them, a practice that
>   would seem to undermine the whole policy.  Would this change be
>   sufficient to end that practice?
>

So I was not overwhelmed by responses :)  I'm going to take silence for
assent in this case and send the patch through.

Thanks,

jon

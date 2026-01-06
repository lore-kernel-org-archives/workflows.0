Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBC830B510;
	Tue,  6 Jan 2026 21:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767735535; cv=none; b=Wre/q8AizLbskKaJZt+QyZozsCykvZq5rYRqSMLqfU5iWMrw/Hwz4NoUyTgcHDTO8rabLC9QtvkzuQb/uU8fAm7F5B0CH08gwQlIKzT6p9VRf5a/qf+TX1mO7N2ZMjnm98fftaepTBBwITr0MjiUITikwr58HClUdhveAIKS99M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767735535; c=relaxed/simple;
	bh=PoQxkNYEkWq7Ldkbag7uFnftD/t5Ki5K+nVyw3mwFOM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OlDCWqaLNkyC/XDVd6GJJC7LdcQ1U8DdZtp1Gg4NbwkdwE49yt0mt7hVtAYhwoCvNLidt5BDO6NAVcHZOllFwmXmSugZVN12uIENCxO/URLK/+0Swo3NN+o/OC4ofvN9NKyFyooPCUZWXPC81Oc24IFuHAQ2Tm2vrNaxqglDBP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NGyfNegJ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NGyfNegJ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B9BF040C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767735533; bh=OdPOXsWn2BMO/qu2af/5aXV4JP5ALnJh3JKWck6n2Ws=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NGyfNegJZZu4G+QzaBVyiPowi7p31N9eRlfnavQ9u3jLWfdih/OCXb+Zu4ZgLrEqw
	 nYA4mI7aAhXJKAsI/qcbddxQ31ykyC2QKcQrOIPQ9cPqfS23HhGlQWTy3jqJeGkgX/
	 qhM0qGMMIwTGjwyA+qY1ZbqH9BCW8lJ50ZOjC0oA58aoGpRJvUvM6gbSZvu/ikmtuA
	 /qL/PAzExafFHk5CP6bvumL9IMRAuLoi9mTSic9nO+f3C4AvcjgKHva6ynIbi360Kh
	 n7Vdk9lqepELF56wLo2elQGfH0KMvYFL6B0EKYTXt+syj6ea6Diy/rrI+e1rP6h89P
	 CXzi0mqvB6Zyw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B9BF040C7D;
	Tue,  6 Jan 2026 21:38:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sotir Danailov <sndanailov@gmail.com>,
 Giedrius =?utf-8?Q?Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>,
 Paul McQuade
 <paulmcquad@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, Randy Dunlap
 <rdunlap@infradead.org>, Vincent Mailhol <mailhol@kernel.org>
Subject: Re: [PATCH v2] docs: process: email-client: add Thunderbird "Toggle
 Line Wrap" extension
In-Reply-To: <20251226-docs_thunderbird-toggle-line-wrap-v2-1-aebb8c60025d@kernel.org>
References: <20251226-docs_thunderbird-toggle-line-wrap-v2-1-aebb8c60025d@kernel.org>
Date: Tue, 06 Jan 2026 14:38:52 -0700
Message-ID: <87cy3me80j.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Vincent Mailhol <mailhol@kernel.org> writes:

> While reading the git-format-patch manpages [1], I discovered the existen=
ce
> of the "Toggle Line Wrap" extension for Thunderbird which I found rather
> convenient.
>
> Looking at the history, the ancestor of this extension was added to the
> documentation in commit e0e34e977a7c ("Documentation/email-clients.txt:
> update Thunderbird docs with wordwrap plugin") but then removed in commit
> f9a0974d3f70 ("Documentation: update thunderbird email client settings").
>
> Extend the paragraph on Thunderbird's mailnews.wraplength register to
> mention the existence of the "Toggle Line Wrap" extension. The goal is not
> to create a war on what is the best option so make it clear that this is
> just an alternative.
>
> [1] man git-format-patch -- =C2=A7Thunderbird
> Link: https://git-scm.com/docs/git-format-patch#_thunderbird
>
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> Changes in v2:
>
>   - Use the international URL (remove "fr/")
>
> Link to v1: https://lore.kernel.org/r/20251225-docs_thunderbird-toggle-li=
ne-wrap-v1-1-24794afa4abf@kernel.org
> ---
>  Documentation/process/email-clients.rst | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Applied, thanks.

jon

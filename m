Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14481D681
	for <workflows@vger.kernel.org>; Wed,  3 Jan 2024 20:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="YQ/5QmAw"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B6B2C1E55;
	Wed,  3 Jan 2024 20:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B6B2C1E55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1704313934; bh=p8ggNqqxO2fqdbLGRfMhN8tNn/Cchn8QP2z1QTgTY4c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YQ/5QmAwmrCHmI+CUbBRytQHoIa5J/J4Pm7g9DZrUlki1NzbrIs2dN0p+gSU/20NA
	 Vs5uxw9legDiMv3jvQb7nu/RDF6Zh3k0+a+OD/4kENNQYhWprQsxTqX44CEOBHe+k7
	 87GBvshTkX+6OBYn6+RmaX2LBPK0txf241E5UouHuFWX98MH7g4+iG4Fv8DwgzQ3ou
	 P11P+pRQnHZtKhU5vQhuMjKOozQRM4bHuhTBdPzoxAwH4jQFSaOdU8yFGdp2WgFg0r
	 zEbJVm1FP8t9mYY9Ng3r8v3cyVJSxLD8OMsf6DK+FV2orLT5u1LZWUZvIzUjg/2fnI
	 M79ka39bFVTAg==
From: Jonathan Corbet <corbet@lwn.net>
To: Alejandro Colomar <alx@kernel.org>, workflows@vger.kernel.org
Cc: Alejandro Colomar <alx@kernel.org>, Ahelenia =?utf-8?Q?Ziemia=C5=84ska?=
 <nabijaczleweli@nabijaczleweli.xyz>, Randy Dunlap <rdunlap@infradead.org>,
 Michael Kerrisk <mtk.manpages@gmail.com>, Michael Kerrisk <mtk@man7.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] CREDITS, MAINTAINERS, docs/process/howto: Update
 man-pages' maintainer
In-Reply-To: <20240101124242.8059-2-alx@kernel.org>
References: <CAMuHMdXO58KyZF2TuUaS-HrK6ry2ARHtDntbGT86YQTwieXs4Q@mail.gmail.com>
 <20240101124242.8059-2-alx@kernel.org>
Date: Wed, 03 Jan 2024 13:32:14 -0700
Message-ID: <87edey9n01.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Alejandro Colomar <alx@kernel.org> writes:

> Michael retired from maintaining the Linux man-pages project in 2021.
> See commit 06e72cb19c74d3b1d661609c698ee26d7b6e4d7e ("CONTRIBUTING,
> README, lsm: Remove mtk as maintainer") in the Linux man-pages
> repository.
>
> Add him to CREDITS.
>
> Reported-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
> Link: <https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit=
/?id=3D06e72cb19c74d3b1d661609c698ee26d7b6e4d7e>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> Cc: Michael Kerrisk <mtk@man7.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>
> ---
>  CREDITS                         | 7 +++++++
>  Documentation/process/howto.rst | 3 +--
>  MAINTAINERS                     | 2 +-
>  3 files changed, 9 insertions(+), 3 deletions(-)

Applied, thanks.

jon

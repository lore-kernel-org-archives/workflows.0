Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014383C198D;
	Thu, 18 Jun 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781774397; cv=none; b=T/dTIvScbE0QB2QNXm1kIX2N6ca+Ija0yOLbTqTOOKq4mq5nWAUVqCGQ49hxKXn+3C7AEW3IxuZxVI0chgtEBY50rxbrJNX3oswZ4nVZPefoltOCgHupZsCVAWFSVnofOQAgkL430n0QX/HYfL5dGr+e0vpl8q8JOomB0Lwah7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781774397; c=relaxed/simple;
	bh=PzlHY59gDu8zPA95kF4nhv8Z9MThzz7VlvawtsFr9vs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cdvko1Exft7IVcs0UobJq3MakOaBGK1n3fu9gerqrlQO/DYQnHYeHqFz+NGDLKpBy9/Bbn4t5EpJHwKAkRgp9F9DlrHEE22PqB1Uq19b+kzFmutzHrgfWlOZADVBBmo4ZzUkGUSnn2mDWnIFrcNDCJoee7V7bu7QhoLFP7/144c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YZto/hBN; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YZto/hBN"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ggwD80g1Sz9tRh;
	Thu, 18 Jun 2026 11:19:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781774392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2aCEFE7lNq2ds/sOD1Qs84pRe6YLOpYbNpJqBmvJ6i8=;
	b=YZto/hBNfzU45FEr5+3PobxNafoL8DywDJIOkwdIgDhYldzj9uhQ4b647jacZMfdLnP6Xt
	hLn/O7GM4mwaw3vgDY1mpMKu6sgQGLh4lzuoiLp/Rr3LxftvBHehrOMCQLRGkXuGF6bOy5
	PENPOfcSsA43WOPB3XxsGFmRGcBvbC5cmFPEI/fv7HXJ+7OWOIfA2efDe5WECTs2D9Lrk8
	PkWUQG1Z1Kh/bkgk1rz4g2kkiH8JJi8xG9hkz7f9f24BQBLlMOC3N/AayU4Yt40YqOVG5v
	2HVzCfKUlGu0K8cNcMQ5+krD1OSTKWn+gFnzB3PCJfyxil3QPMt7RmfVW7pIvw==
Message-ID: <adefff2087cb6fa78229bf7e12123a2b21066ede.camel@mailbox.org>
Subject: Re: [PATCH] Documentation: Fix syntax of kmalloc_objs example in
 coding style doc
From: Manuel Ebner <manuelebner@mailbox.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 SeongJae Park	 <sj@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 18 Jun 2026 11:19:47 +0200
In-Reply-To: <20260529081006.2019687-2-ukleinek@kernel.org>
References: <20260529081006.2019687-2-ukleinek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: d4c4b37ead3479051bd
X-MBO-RS-META: 7jtikodabp7s715e1rg6ntimutgqzbz1

Thanks, I realized just now that I introduced this.
 Manuel

On Fri, 2026-05-29 at 10:10 +0200, Uwe Kleine-K=C3=B6nig wrote:
> The first parameter should match the variable that the allocated memory
> is assigned to. Fix the example accordingly, the one for kmalloc_obj got
> it right already.
>=20
> Fixes: 7c6d969d5349 ("Documentation: adopt new coding style of type-aware=
 kmalloc-
> family")
> Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> ---
> =C2=A0Documentation/process/coding-style.rst | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/process/coding-style.rst b/Documentation/proce=
ss/coding-
> style.rst
> index a3bf75dc7c88..a8336582f60b 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -959,13 +959,13 @@ The preferred form for allocating an array is the f=
ollowing:
> =C2=A0
> =C2=A0.. code-block:: c
> =C2=A0
> -	p =3D kmalloc_objs(*ptr, n, ...);
> +	p =3D kmalloc_objs(*p, n, ...);
> =C2=A0
> =C2=A0The preferred form for allocating a zeroed array is the following:
> =C2=A0
> =C2=A0.. code-block:: c
> =C2=A0
> -	p =3D kzalloc_objs(*ptr, n, ...);
> +	p =3D kzalloc_objs(*p, n, ...);
> =C2=A0
> =C2=A0Both forms check for overflow on the allocation size n * sizeof(...=
),
> =C2=A0and return NULL if that occurred.
>=20
> base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad

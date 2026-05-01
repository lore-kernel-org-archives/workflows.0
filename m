Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4745C36A01E;
	Fri,  1 May 2026 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627205; cv=none; b=AePLQhbQwda07o5W8/CxdSNOEbTv1baqsbmtuDUBPpqZJ+aWpPtWyIEGnAYqLhFvOop7132p5D/hGfzwujs4L50kE+CihKFRSZs2jeuAjcWJKyF2RAgMlMonEtTovJbzhReqR+1+aMyN+4IVd5x6gV+buvW4pLlwFhuni1gQqIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627205; c=relaxed/simple;
	bh=98mS0nw7qTbEdZ248R/rzv0YbcWMpZ6KsN/jHWGzsTU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mdh4vl1CW5Yd0hHph0NcE19D5LbA2LwCdgnvHIDqgOcnhhDxw3sVgQtLiqkAF44SmV9TkDBqvYLMbJV9/DVpwb+Dj3QZF99uXzjq3gHwvbAibdTrrD18Hd11aRQNF94Q2vut5Vbe2mZUy7FeQga8pZwhqb5e61egivMyVCcnqgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fS7D8iO5; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fS7D8iO5"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g6QVR5415z9tsd;
	Fri,  1 May 2026 11:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777627199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hEYgiDjAKezNWVxNMvApZjPS0+ufCBOIBbHBQD3nrlg=;
	b=fS7D8iO5YcqQFd0SM0FgJaDRFkgd1xAPVpaf4zb2GvVLxl7C/IRu86pyG2iL1M9iWwM4qy
	nsalyYEAvE0+zdPm4mW8qd+5UNZe2exR1l5U2YxhLtT3tYuteQvlj/7Q/hTIxVP6r8hXex
	Qfzcykco1GywiG/yb4TlGa0iGn8WokO67oWjYqRYOrdNCs0pp0BYl1uzsyrjIYlOQ35c0L
	90fqbb87TrWH95U0+jV4o2eQRgRtlsZqERGFrjfthbuXu2UTYv4+xV2er+7qfK7namG3tY
	2Ugn2LAHJ63RUo/N04UnLpfOsfdk+7c64+OtOr/F8y7I1RhTGy+VY4uvpR6W1Q==
Message-ID: <26197926621ca847b7b0337139ec7f90dc8a3703.camel@mailbox.org>
Subject: Re: [PATCH v4 3/3] Documentation: deprecated.rst: kmalloc-family:
 mark argument as optional
From: Manuel Ebner <manuelebner@mailbox.org>
To: SeongJae Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  linux-doc@vger.kernel.org, Kees Cook
 <kees@kernel.org>,  linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, linux-mm@kvack.org,  Geert Uytterhoeven
 <geert@linux-m68k.org>
Date: Fri, 01 May 2026 11:19:55 +0200
In-Reply-To: <20260430010332.114100-1-sj@kernel.org>
References: <20260430010332.114100-1-sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: fdgbr8urtrrweww5c9sz6cgypuu6d3g5
X-MBO-RS-ID: 235f6216a464e3d66b8

On Wed, 2026-04-29 at 18:03 -0700, SeongJae Park wrote:
> On Wed, 29 Apr 2026 09:27:04 +0200 Manuel Ebner <manuelebner@mailbox.org>
> wrote:
>=20
> > put the optional argument (gfp) in square brackets
> > add default value =3D GFP_KERNEL
> >=20
> > eg. ptr =3D kmalloc_obj(*ptr, gfp);
> > =C2=A0-> ptr =3D kmalloc_obj(*ptr [, gfp] );
> >=20
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
>=20
> I have a trivial question below, but because it is trivial,
>=20
> Acked-by: SeongJae Park <sj@kernel.org>
>=20
> > ---
> > =C2=A0Documentation/process/deprecated.rst | 15 ++++++++-------
> > =C2=A01 file changed, 8 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/Documentation/process/deprecated.rst
> > b/Documentation/process/deprecated.rst
> > index fed56864d036..ac75b7ecac47 100644
> > --- a/Documentation/process/deprecated.rst
> > +++ b/Documentation/process/deprecated.rst
> > @@ -392,13 +392,14 @@ allocations. For example, these open coded
> > assignments::
> > =C2=A0
> > =C2=A0become, respectively::
> > =C2=A0
> > -	ptr =3D kmalloc_obj(*ptr, gfp);
> > -	ptr =3D kzalloc_obj(*ptr, gfp);
> > -	ptr =3D kmalloc_objs(*ptr, count, gfp);
> > -	ptr =3D kzalloc_objs(*ptr, count, gfp);
> > -	ptr =3D kmalloc_flex(*ptr, flex_member, count, gfp);
> > -	__auto_type ptr =3D kmalloc_obj(struct foo, gfp);
> > -
> > +	ptr =3D kmalloc_obj(*ptr [, gfp] );
> > +	ptr =3D kzalloc_obj(*ptr [, gfp] );
> > +	ptr =3D kmalloc_objs(*ptr, count [, gfp] );
> > +	ptr =3D kzalloc_objs(*ptr, count [, gfp] );
> > +	ptr =3D kmalloc_flex(*ptr, flex_member, count [, gfp] );
> > +	__auto_type ptr =3D kmalloc_obj(struct foo [, gfp] );
> > +
> > +The argument gfp is optional, the default value is GFP_KERNEL.
> > =C2=A0If `ptr->flex_member` is annotated with __counted_by(), the alloc=
ation
> > =C2=A0will automatically fail if `count` is larger than the maximum
> > =C2=A0representable value that can be stored in the counter member asso=
ciated
>=20
> Like 'ptr->flex_member' and 'count', why don't you enclose 'gfp' and
> 'GFP_KERNEL' with backticks ('`')?

I didn't know what ` is doing, so didn't consider it. It makes sense to
enclose these two.
should __counted_by() be enclosed aswell?

> Thanks,
> SJ

Thanks
 Manuel
---
The possibility of getting blamed has to be earned.


Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C2D390600
	for <workflows@vger.kernel.org>; Tue, 12 May 2026 13:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594258; cv=none; b=jXgQ7XK+n+ZXXMNPuDEI1RW415fIcJzyNgN884kEWCk2c+qLAEfC4T4nkKrhueJXyfXEZeqtjr/NOa0BJZj0/KFNuQr1YboAt6wvlFB0b+yRn7wnhd3XlRhZZJdSULPkEAj0181H5S+DsdyKxdR57DZSqzFnFfS8kgA/bXGs948=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594258; c=relaxed/simple;
	bh=QhqNiNx0nAYxUJW5pLIDGxQUge2MtVuhGc+aHl9E/QU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AIE2w0Ka5BUZEPvj91mKxfTU9xvcpo2v+3GDQ8i2oQRHWDmSDYw9QNbdYY/YZ8lZH69p3bKTdy+nvBww08FxXp3zNMdid7wmEuLVPC5EBQOa7AUqHRVmMV6X9LeHFWmckyKTrZA200rRzzZhVV8DgbCEzDVP4DTFkoPbdJAhMbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bbYe1lGJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bbYe1lGJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so50378345e9.2
        for <workflows@vger.kernel.org>; Tue, 12 May 2026 06:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778594255; x=1779199055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzwQXL37XaAqn+iPqE1nX2tix7mVBICKQADxuQHuFrw=;
        b=bbYe1lGJE4n0kP46zyKNIM3w6zQW+hT2oo0N7E4Ogs+Z5tsw+3KhdGaYiESbtpgm+G
         BhZ/a9PXqyVzncBYbPTUOb3iyZcJ0JyaQdb4Ejf8zFKKU/Gq+GawmLEc5rTCyX4UYPNo
         +czmpQLKYpuIPIjVWLMzMHqN+TOQHHgEu6cUz5cwouWeSPbpAThYos/pG+Z+CnArsMxr
         LOmN+kRcgkD3jDJqx6dy++jEkfVraioVc400XyLDcX4uav2rgeVc5AXXg4ZGrXKKkAY1
         z4BUrAzUALGWOn37v6Wmkpt+nGCLcifRtFpDhrNDdrHyL7aDXlbvvUXGj/Ii8QDn8o8P
         jnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778594255; x=1779199055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wzwQXL37XaAqn+iPqE1nX2tix7mVBICKQADxuQHuFrw=;
        b=Q0+RK+SF3pNC0CmpmDKugizUer1e0jU8cwKoGdVHumn4iZ2p1iSGRds+9jXvotzFCi
         A0VRccT0T1+/gEloJ7x0jQzH3twlWs02/y+nQS2Wf/Lz2sYslN6BRpn7KCHO8WNi3som
         V565I2Plsachnnwcp7wwZnmQsKyWU6QpzdYiijdr6/OIEo3CL6BTaXPV+ze+lSMBvYu8
         p5zIcx4KJUPfz0QxoPhmKnbAL/ajLB0Dr+eC5IuJ+WM754ARvu+R//iMXX1yl3epmY5z
         93YqWZ2vQUXYul0Tpy1/eQP47kk1PNercALyflp9qWppA8bEFzoXNuRZaqYkA9vi17n9
         KPXg==
X-Forwarded-Encrypted: i=1; AFNElJ9iMKQOjJhK6v8uFzM3BzuqsHAQjX4rhqPHlPSzSHwoS/g1XuhI+ams6bHXKEy+5S1brj74ySRp370=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6fVJ1K6a+4fRLsOtNs0JyNKDM9+1C/2yb/IydvhZnWk8Tr/tF
	/HjiKc5kYke2wOUwWLixEBPLc2UpFmJtzNWMRmXbXW1fHn0q4TsnI9dE
X-Gm-Gg: Acq92OF/soXJwEuPh29BadfFA4p7JCpbj3AR8R4JsODPyZ/bow1WIXs/K5n+4sAIWxp
	lxKWA77u8qfekUu4jkNu4G0Rk7q0+RI8WAlfOrJ1OncgK9g3ubxLwIkV+ulINglzmKXyVmKQLXk
	h0Hv/Lb3qWWSMFUAlciWm8vWtNI2tO6IBuBIwn2Jz5jUw8TU86+E36HyRJ6zak0GfBByoz82ERe
	qretSiJFdXcD+3I09sFusTbregLHFZMbqii3NZM93TwL1Jw/TFVJBfXbImQzNsF+tLEECGhW74V
	vi9FANfcpHV0z5JTNwZUYoYF1e3H0Uqjmh6b7JAtZvRohxLjOIVGLf+X0d9sQgZiAjwc/lrW3JG
	i0IN8X7VgxG+HAZjYKDHycKbh4ixlh4za6ZPQubKA9Up6RjA4OeEHSQvdZYzMskG7A4SY3n3Q9x
	06iSzL9jwbgjYEN7OdqRNJCOUg/y4TAMo7iu9l0Xrw731qSenOTLs3qea3vx+O
X-Received: by 2002:a05:600c:4194:b0:48a:7965:b92a with SMTP id 5b1f17b1804b1-48e51f53980mr305784955e9.26.1778594255062;
        Tue, 12 May 2026 06:57:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548bb51d40sm31965523f8f.0.2026.05.12.06.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:57:34 -0700 (PDT)
Date: Tue, 12 May 2026 14:57:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jani Nikula <jani.nikula@intel.com>, andy.shevchenko@gmail.com,
 apw@canonical.com, corbet@lwn.net, dwaipayanray1@gmail.com,
 joe@perches.com, kees@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com,
 skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [PATCH 1/2] Doc: deprecated.rst: add strlcat()
Message-ID: <20260512145733.0b561c7a@pumpkin>
In-Reply-To: <46d8a5a8c8c77d3de9acfa1c55de2148fb2975c5.camel@mailbox.org>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
	<20260510165451.57674-2-manuelebner@mailbox.org>
	<748c2c3d549740918e14f29aa25dd475b99c1313@intel.com>
	<46d8a5a8c8c77d3de9acfa1c55de2148fb2975c5.camel@mailbox.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 12 May 2026 12:43:54 +0200
Manuel Ebner <manuelebner@mailbox.org> wrote:

> On Tue, 2026-05-12 at 11:52 +0300, Jani Nikula wrote:
> > On Sun, 10 May 2026, Manuel Ebner <manuelebner@mailbox.org> wrote: =20
> > > add strlcat and alternatives =20
> >=20
> > You'd think it's the strlcat() definition that needs a comment above it
> > saying it's deprecated. I don't think folks really look at
> > deprecated.rst. =20
>=20
> arch/s390/lib/string.c
> lib/string.c
> and
> tools/include/nolibc/string.h
>=20
> do not mentions anything about obsolete.
>=20
> include/linux/fortify-string.h has=20
>=20
>  /* Defined after fortified strlen() to reuse it. */
>  extern size_t __real_strlcat(char *p, const char *q, size_t avail) __REN=
AME(strlcat);
>  /**
>   * strlcat - Append a string to an existing string
>   * [...]
>   * Do not use this function. While FORTIFY_SOURCE tries to avoid
>   * read and write overflows, this is only possible when the sizes
>   * of @p and @q are known to the compiler. Prefer building the
>   * string with formatting, via scnprintf(), seq_buf, or similar.

I'm not that advice is really that good.
The other schemes (esp scnprintf) are just as dangerous.
If the code has just done 'buf =3D kmalloc(size)' then strlcat(,,size)
is fine - from an overflow point of view.

strlcat() isn't really any worse than memcpy().
(unlike strncat() which was just an accident waiting to happen)

-- David

>=20
> should i add this to the former three files?
>=20
> Manuel
>=20
> >=20
> > BR,
> > Jani.
> >  =20
> > >=20
> > > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > > ---
> > > =C2=A0Documentation/process/deprecated.rst | 6 ++++++
> > > =C2=A01 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/Documentation/process/deprecated.rst b/Documentation/pro=
cess/deprecated.rst
> > > index fed56864d036..b8a65c19796c 100644
> > > --- a/Documentation/process/deprecated.rst
> > > +++ b/Documentation/process/deprecated.rst
> > > @@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The sa=
fe replacement is
> > > strscpy(),
> > > =C2=A0though care must be given to any cases where the return value o=
f strlcpy()
> > > =C2=A0is used, since strscpy() will return negative errno values when=
 it truncates.
> > > =C2=A0
> > > +strlcat()
> > > +---------
> > > +strlcat() must re-scan the destination string from the beginning on =
each
> > > +call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_pri=
ntf(),
> > > +snprintf() and scnprintf()
> > > +
> > > =C2=A0%p format specifier
> > > =C2=A0-------------------
> > > =C2=A0Traditionally, using "%p" in format strings would lead to regul=
ar address =20
> >  =20
>=20
>=20


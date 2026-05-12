Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E1C385516;
	Tue, 12 May 2026 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778582647; cv=none; b=uzBo28WnCjvNfNd2GtPJke3r/ln4OTvoaRo4RP0ZePvMW5ltuCnuQhrPPfVfq4g6LTBTpYn2K0tMRL5srntsw4/LGFNr2zsg0NFxorcWITlx3EiBZaLk4yQMvrmZhok8EPvwFa4ODEWwIxPg2JER2wBz/ZYNx6Sa7DXrx1ypIAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778582647; c=relaxed/simple;
	bh=HJU+wquNZZmfybCX/g3N7u13e5or//Qt35CyPaGuq6E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bZlUV1oqNU6BdDOhZi584GqVNyi/lT1ZlOTqcsIgjCmu3vMJ3ynfo3ZI5M7S7+66UB+ABgNi8mRa5T8wAx1++An7ANrKkIUT77eJasecDZM7lra3IYlZLq+Jc9U5J+ElyCrkz2QD7M0AEPrEeqEAjG74z2VeCPYG19EIKQek8hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MeojXbMK; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MeojXbMK"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gFCrJ4WHHz9sZZ;
	Tue, 12 May 2026 12:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778582640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5+S2z17Ta0ChD7oo2sNSFDY0KUoUaTB5LxyZIH6WuPg=;
	b=MeojXbMKQcBlBLN3I+MhSIB0zLgGOyiq32AonADp/xagV6YsGxXH1sypIOpPWjUr4DzVnk
	NXrhe+82F0s4kBWvn00e1QCUVrVsAEqEQwOCUhx6dUpfMu21BF8IW4f8l8m5J3S4zVQ9bl
	c80M8qDO3SRMRtqgJVQA67XP0op1MhErSoz/WknqgWQMdK8UEJm2lGVJlyF/vO/1bE1/71
	FVoMLt7IeNNBGBr7aUxj6EDY/YUMyG43Ls82EBpC6umNnDtkz8pIPT0mCdFFK29pSxYOI1
	iKzs01DKiz8NvVmiA6aXuMIjJCTHCpYacy0u0R3Z6aMtawsE/cEs6RD3puw57g==
Message-ID: <46d8a5a8c8c77d3de9acfa1c55de2148fb2975c5.camel@mailbox.org>
Subject: Re: [PATCH 1/2] Doc: deprecated.rst: add strlcat()
From: Manuel Ebner <manuelebner@mailbox.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: andy.shevchenko@gmail.com, apw@canonical.com, corbet@lwn.net, 
 dwaipayanray1@gmail.com, joe@perches.com, kees@kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 lukas.bulwahn@gmail.com,  skhan@linuxfoundation.org,
 workflows@vger.kernel.org
Date: Tue, 12 May 2026 12:43:54 +0200
In-Reply-To: <748c2c3d549740918e14f29aa25dd475b99c1313@intel.com>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
	 <20260510165451.57674-2-manuelebner@mailbox.org>
	 <748c2c3d549740918e14f29aa25dd475b99c1313@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: p7boa6zmq5it3uzemwu86gwxfmuosnou
X-MBO-RS-ID: 31e777d85cd5f3c3a16

On Tue, 2026-05-12 at 11:52 +0300, Jani Nikula wrote:
> On Sun, 10 May 2026, Manuel Ebner <manuelebner@mailbox.org> wrote:
> > add strlcat and alternatives
>=20
> You'd think it's the strlcat() definition that needs a comment above it
> saying it's deprecated. I don't think folks really look at
> deprecated.rst.

arch/s390/lib/string.c
lib/string.c
and
tools/include/nolibc/string.h

do not mentions anything about obsolete.

include/linux/fortify-string.h has=20

 /* Defined after fortified strlen() to reuse it. */
 extern size_t __real_strlcat(char *p, const char *q, size_t avail) __RENAM=
E(strlcat);
 /**
  * strlcat - Append a string to an existing string
  * [...]
  * Do not use this function. While FORTIFY_SOURCE tries to avoid
  * read and write overflows, this is only possible when the sizes
  * of @p and @q are known to the compiler. Prefer building the
  * string with formatting, via scnprintf(), seq_buf, or similar.

should i add this to the former three files?

Manuel

>=20
> BR,
> Jani.
>=20
> >=20
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > ---
> > =C2=A0Documentation/process/deprecated.rst | 6 ++++++
> > =C2=A01 file changed, 6 insertions(+)
> >=20
> > diff --git a/Documentation/process/deprecated.rst b/Documentation/proce=
ss/deprecated.rst
> > index fed56864d036..b8a65c19796c 100644
> > --- a/Documentation/process/deprecated.rst
> > +++ b/Documentation/process/deprecated.rst
> > @@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The safe=
 replacement is
> > strscpy(),
> > =C2=A0though care must be given to any cases where the return value of =
strlcpy()
> > =C2=A0is used, since strscpy() will return negative errno values when i=
t truncates.
> > =C2=A0
> > +strlcat()
> > +---------
> > +strlcat() must re-scan the destination string from the beginning on ea=
ch
> > +call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_print=
f(),
> > +snprintf() and scnprintf()
> > +
> > =C2=A0%p format specifier
> > =C2=A0-------------------
> > =C2=A0Traditionally, using "%p" in format strings would lead to regular=
 address
>=20


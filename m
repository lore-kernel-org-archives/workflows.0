Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B523B3D170B;
	Wed, 22 Apr 2026 12:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859807; cv=none; b=CKQgKjzobSGCSGCg5g8Sn6EMNzSRGF0zLbL2YXBR2Vzec31Rg+xNRzqf30gryeJHH9gPPjW4xW+YKzmCSqIwDmq+s/H6UGLD5aEv++NSQ/rG/OQL3DiaYSQqXGfBsLKaRm1J9M3CtFyy/d/o6YjyRhjOKOmKh1naIPJG7WcacqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859807; c=relaxed/simple;
	bh=Ss5XMrLO5bcqxDFZy4nLiLMppu0weACKlMtBJzihP6U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lzHvlyGiWCIbSRuYFxi7SAaqW5fkM0aBeGcLwoYbXh67RQNAXNNk1Qo4aN7amvjoRdhR3ciGi45WR1WCnoorNapsC/eMAGbC7lceg2Qjb8KAZejeCgLBjhA8F+EywlcycaYLjuTwfNbUpMpsJWmqLUZCQv/cXgXTIj56ZfI+qRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dLV/JpfX; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dLV/JpfX"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g0yhk5Q9tz9v0f;
	Wed, 22 Apr 2026 14:09:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776859798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOu53PsZqO+WLlevMe+FI3tCYubHhJGtQDXj02ESkZI=;
	b=dLV/JpfXwAz4RNMIDDWg6+tb2g0MQGHS14yUWnmjAIysH6hPr0kObrmrdd2tUTP/pFVPdZ
	79F/ljp1POmc4XZJUXMTIH86OBLcf9rrLXyxSoHZFj9UMegTPvv4F5+iTlc8VBUdjIcbW0
	RUgI7V8lLtE8QtLiWsx4fdQ6GrSZA6UBD4ztg4vgcnIaIPOIfeR7r4QX1cHzaWTjE+45y2
	Z3c8vVpoA1gedOPyojcBq5X/wWgz7akRKf/W4kTMpBcj/3WCRhojjtpvevAUbN0bywouOX
	jF2eglgK7Br4Q9/jKCCfG4UPb2mkhfxRMOqVkYU05eIkLg5TNUEaN9tgCSMHGw==
Message-ID: <a5522bdaf37c7f1d2fdf03e1755061a4d803efb2.camel@mailbox.org>
Subject: Re: [PATCH v2 3/3] Documentation: deprecated.rst: kmalloc-family:
 mark argument as optional
From: Manuel Ebner <manuelebner@mailbox.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, 	linux-doc@vger.kernel.org, Kees Cook
 <kees@kernel.org>, 	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Date: Wed, 22 Apr 2026 14:09:53 +0200
In-Reply-To: <CAMuHMdV70GhNsxPiuhY92seZRMkr6jk9eFCke7shc08GYerLpg@mail.gmail.com>
References: <20260421175516.224960-2-manuelebner@mailbox.org>
	 <20260421180902.225560-2-manuelebner@mailbox.org>
	 <CAMuHMdV70GhNsxPiuhY92seZRMkr6jk9eFCke7shc08GYerLpg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: afec5a9cc17df0819c6
X-MBO-RS-META: 93qgfkjrx8gcxh9o1dc7pr18s8zwxccg

On Wed, 2026-04-22 at 09:14 +0200, Geert Uytterhoeven wrote:
> Hi Manuel,
>=20
> Thanks for your patch!

That's good to read.

> On Tue, 21 Apr 2026 at 20:09, Manuel Ebner <manuelebner@mailbox.org> wrot=
e:
> > put the optional argument (gfp) in square brackets
> >=20
> > eg. ptr =3D kmalloc_obj(*ptr, gfp);
> > =C2=A0-> ptr =3D kmalloc_obj(*ptr, [gfp]);
>=20
> Shouldn't that be "[, gfp]", e.g.
>=20
> =C2=A0=C2=A0=C2=A0 kmalloc_obj(*ptr [, gfp]);

I think technically it should be=20

    kmalloc_obj(*ptr[, gfp]);

but that's difficult to grasp, so i went for my notation. Yours
is a good tradeoff. I'll think about it and choose the right one.

>=20
> everywhere?
>=20
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
>=20
> Gr{oetje,eeting}s,
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Geert

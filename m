Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5D33672BA;
	Tue, 12 May 2026 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778571398; cv=none; b=CxznrlxIpgu9hxjaLApfS6EnIV3sW7HJtIdgNjGTEy4o0C1jIxZx1gZpFuv36lSxJapyg/wTvoE1496kKjfO3r9OkSZIKF6Xadz+4ibrXrFvV4ZsoAt19qa/OJisTYrw4iBXkxT6YILnSugfTsbpAai+zcH4veCYnXYi95kXaE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778571398; c=relaxed/simple;
	bh=CvYyLVRDtNWqapEuk5G/yUdRpl33QDrwEo55o2Fib94=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IfsuCP3m2WbXSx4xSX7AwUxyyncLWJXiKBXJjwBbZPP3adX/LxFgY97DMSh65L3xqHm4y3flW4oPqnYmgpnPaUhxpUidQxoTSNifVZBmcb4NIuffZvx9qY6aN4yx5ZEuJBhQK/dymThXJUbSD7etKyhkSGhiJ/SXjS23CG76a1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lKJzUJ8I; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lKJzUJ8I"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gF7gy4SRHz9v1Y;
	Tue, 12 May 2026 09:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778571390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ILtWzAVG0wzuJTcdC2P9wTQH/+3Lo5mb3OqQe2/M7n8=;
	b=lKJzUJ8IMBEB/OCZZNW3eISCfwDUY9sgAmBaBnJ35Kw2hG1IPL0R+Zsb1Vs1BpQJXAtID/
	CgOq2BjXdG97bXawJ0yioTBG8cJHg7yqzuuLbvgkRXVgg2IK2wFkvAC02jKTYm+WWLUO+L
	moE5WBMWWLSxnIXXvPs6376+7A+ETbfxCrBXOTYPHPw1LQBC1LhhKr0An4pJQJPUemag/a
	txxAbjMRpKva6do4jX5zLxgpFRoZg/oIk8YkHyeItgq+enRDjVVmx3Z7RURASTTx5AYrO0
	68i2GUKYYKlHvi7qswnIL8BORbK/chvOT4FqUwRKJ0jmlqQ/h7l7fY7U0CMd3w==
Message-ID: <9bb5070ee87059ee37e7f7fa8606052cc9c1156e.camel@mailbox.org>
Subject: Re: [PATCH 2/2] scripts: checkpatch.pl: add warning for strlcat()
From: Manuel Ebner <manuelebner@mailbox.org>
To: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet
	 <corbet@lwn.net>
Cc: andy.shevchenko@gmail.com, apw@canonical.com, dwaipayanray1@gmail.com, 
	joe@perches.com, kees@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com,
 skhan@linuxfoundation.org, 	workflows@vger.kernel.org
Date: Tue, 12 May 2026 09:36:11 +0200
In-Reply-To: <20260511142745.7757b1b2@pumpkin>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
		<20260510165649.57880-2-manuelebner@mailbox.org>
		<87a4u6w3ez.fsf@trenco.lwn.net> <20260511142745.7757b1b2@pumpkin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: 17mqq179bfmpkk6gfx5nxh6i4q3nx7q4
X-MBO-RS-ID: 6cb893ba62096fba82b

On Mon, 2026-05-11 at 14:27 +0100, David Laight wrote:
> On Mon, 11 May 2026 06:12:36 -0600
> Jonathan Corbet <corbet@lwn.net> wrote:
>=20
> > Manuel Ebner <manuelebner@mailbox.org> writes:
> >=20
> > > add a warning for strlcat()
> > >=20
> > > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > > ---
> > > =C2=A0scripts/checkpatch.pl | 6 ++++++
> > > =C2=A01 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > index 0492d6afc9a1..ca1a8e67d529 100755
> > > --- a/scripts/checkpatch.pl
> > > +++ b/scripts/checkpatch.pl
> > > @@ -7085,6 +7085,12 @@ sub process {
> > > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 "Prefer strscpy over strlcpy - see:
> > > https://github.com/KSPP/linux/issues/89\n" . $herecurr);

Here you can see the external urls already deployed. there are two more in=
=C2=A0
the code blocks above.

> > > =C2=A0		}
> > > =C2=A0
> > > +# strlcat uses that should likely be
> > > +		if ($line =3D~ /\bstrlcat\s*\(/ && !is_userspace($realfile)) {
> > > +			WARN("STRLCAT",
> > > +			=C2=A0=C2=A0=C2=A0=C2=A0 "Prefer seq_buf_printf() over strlcat - =
see:
> > > https://github.com/KSPP/linux/issues/370\n" . $herecurr);
> > > +		}=C2=A0=20
> >=20
> > Using seq_buf_printf() requires switching over to the seq_buf API in
> > general, it is not just a simple substitution, so this advice may prove
> > unhelpful to many.
>=20
> And I'm not sure the external url is a good idea.

It wasn't my idea originally. but I'm open to suggestions.

Manuel

> >=20
> > jon
> >=20

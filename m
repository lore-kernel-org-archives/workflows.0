Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDB8325495;
	Fri,  1 May 2026 09:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777626758; cv=none; b=qLCu/hcNmdvFx0fyr+RZVJfVAcn9gt54B/p/IKYpE1lGOZ4JvWPLrNpvkPH/7a2UM13IKESNOGF/7iYxUAXs8ZCfAkCO+xvdYCpS9MC8gwR8peoggaNpuzr/5ZzgY5YEATPSke0AxwcXtFkg1M9uS/LnMUxcoO5X0O8TduOqWdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777626758; c=relaxed/simple;
	bh=nzcV1M+T8FfAi4DN2fJXrFtPXcwkXnprEF+h9z3CYic=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NZxFtO3CmStDyxNShedVGSv/p2M8MP9RGAqu/OulKGn5K7nFPZ/dbwevkARUVFGxebjIfUpEJ89x2grL3+MERM+/YYYk4Qa0mwUohQI10jWhmPazrrr117leNDiqa5Moanl0g3KgzRuN+/U43G8QD5szXk6Lz0Mg17zPyKEEBwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=d6mfZaEz; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="d6mfZaEz"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g6QKk5fV9z9tZv;
	Fri,  1 May 2026 11:12:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777626746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nzcV1M+T8FfAi4DN2fJXrFtPXcwkXnprEF+h9z3CYic=;
	b=d6mfZaEzzOCM3NS1kzxxqsUjUjR+v4/Hln7mczKvYRdqiHkeUBLQqikdnP51UodlkpYl02
	Fjt+94cV97IR1snj76vWJ3VBrqUimKwe0r89jetTL3NmH9PjEskVCasfFsq9AX+VdW62qj
	5/vn/eTrNj+3ocpIXzkJSVKHSlj1J32Ru6j2bwwUx2eBdZRfK+7FjnMePEqV+k4Cw2jukq
	uviIKZlM3pLETwFsfkWqkTHTC6OiPzDg1081dax4Rxw2Z75pfVK127mJtXu2VoIZ+/9EXi
	uSxnBlKrjHKZgTfc8nrkNZWhri76a7TeJ+TA/QH50fYPGAexBmsSBaSZ5g6Muw==
Message-ID: <755c37fa985eb3112322ac77be661d6e3614ba44.camel@mailbox.org>
Subject: Re: [PATCH v4 1/3] Documentation: adopt new coding style of
 type-aware kmalloc-family
From: Manuel Ebner <manuelebner@mailbox.org>
To: SeongJae Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  linux-doc@vger.kernel.org, Kees Cook
 <kees@kernel.org>,  linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org,  linux-sound@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org
Date: Fri, 01 May 2026 11:12:22 +0200
In-Reply-To: <20260430010013.113971-1-sj@kernel.org>
References: <20260430010013.113971-1-sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ud4ynx1w8xxoao3kkt6yo7rw19de15cu
X-MBO-RS-ID: 634a2d56e1f2b8232cd

On Wed, 2026-04-29 at 18:00 -0700, SeongJae Park wrote:
> On Wed, 29 Apr 2026 17:53:36 -0700 SeongJae Park <sj@kernel.org> wrote:
>=20
> > On Wed, 29 Apr 2026 09:14:44 +0200 Manuel Ebner <manuelebner@mailbox.or=
g>
> > wrote:
> >=20
> > > Update the documentation to reflect new type-aware kmalloc-family as
> > > suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
> > > and family")
> > >=20
> > > ptr =3D kmalloc(sizeof(*ptr), gfp);
> > > =C2=A0-> ptr =3D kmalloc_obj(*ptr);
> > > ptr =3D kmalloc(sizeof(struct some_obj_name), gfp);
> > > =C2=A0-> ptr =3D kmalloc_obj(*ptr);
> > > ptr =3D kzalloc(sizeof(*ptr), gfp);
> > > =C2=A0-> ptr =3D kzalloc_obj(*ptr);
> > > ptr =3D kmalloc_array(count, sizeof(*ptr), gfp);
> > > =C2=A0-> ptr =3D kmalloc_objs(*ptr, count);
> > > ptr =3D kcalloc(count, sizeof(*ptr), gfp);
> > > =C2=A0-> ptr =3D kzalloc_objs(*ptr, count);
>=20
> Forgot asking this, sorry.=C2=A0 Shouldn't 'gfp' parameters be kept?

Yes, i should have kept it, like so:

eg. ptr =3D kmalloc_obj(*ptr, gfp);
 -> ptr =3D kmalloc_obj(*ptr [, gfp] );

same in [Patch 2/3]

> >=20

> > > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> >=20
> > Acked-by: SeongJae Park <sj@kernel.org>
>=20
> My Acked-by: is still valid regardless of your answer to my trivial quest=
ion.

Thanks
 Manuel

>=20
> Thanks,
> SJ
>=20
> [...]


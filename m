Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B23B2D1F40;
	Sun, 23 Aug 2026 18:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787508522; cv=none; b=dKGT2OFqm/vkTa3tGUZL8xcn9kTUOgCHrIi8VeF1AFY0wADkgwa1Flj0hr2cz4H/Cz/0RrACHAqg1IBzVkMS4OQv0EVYNpqLlEa+JcgSWXBCYDmrbqP1lsOcyKQdAJGtzYtqGeK1rXdVs8LzfCsTls/RDGarC4q1GHO6FYrBnDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787508522; c=relaxed/simple;
	bh=ky7SUIbZAyiQYWSAhMhDpHJkHvPUnjpTMtydqiER4p4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WNoqAui04EnJRQhooaELRIO3bREibUYBsMbvP4a+ITe4ML4DwA/AxJ7cdWuY/Js6HbhECMGPZjeoP+RgHRlH6Ew/FhgIOWy4beV+7Z01rWHqHXqh4/dtpe/3m4CTIWJMqkJPULWXuYI+Ik0ahn0ipXQJTcv+VK/O1qqCfRWm9t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JqFP+hxc; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JqFP+hxc"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hShqf3gNDzMlCM;
	Sun, 23 Aug 2026 20:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787508510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VU+xqJRWmZ/xxY8XurbKkfTBA3VxjPU04iwkIUadVF0=;
	b=JqFP+hxciiXp8QDoPgGIpwUx+LgAWDo/I/Y+Q/EZLDcZW1bMwiwJPg/ujVCizkRXlYYiZO
	a983rlASpC14A9z+BZYqATQgFUuSVkJY31ymYoA/Le1cCZSSyzrNWwBD4MPRZIBjogmvG3
	PT3aDTVvRIPkH16OGrbqz7k9Lz69Smw9YMIVlCg4WYZsScfqBKhzSkkmpFIxUj0VwklrYu
	DAj2eXxcpJolmZ1UNpuytQYPSTRruXQ0v2gNgGmCBITyMEBgM42H1YJm+pMwC0KXveYuyI
	TfYP08CXkPXBMI0g6waZ9mVJXuGvk5Y0SpBA4ZNPwGW7PbLvpHD9TpcxG1UdHg==
Message-ID: <c7a3db22f56c598ef35676288d10303af21098bf.camel@mailbox.org>
Subject: Re: [Issue] sphinx: incorrect high-lighting
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Weijie Yuan <wy@wyuan.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>,  Shuah Khan <skhan@linuxfoundation.org>, "open
 list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,  "open
 list:DOCUMENTATION"	 <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Date: Sun, 23 Aug 2026 20:08:25 +0200
In-Reply-To: <aosYfdfH6Z7ai5M2@wyuan.org>
References: <bba57d51c72d9387ccef2b5979fa618e980c3ebf.camel@mailbox.org>
	 <aosYfdfH6Z7ai5M2@wyuan.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 5de3e1c066931fa53c4
X-MBO-RS-META: uojbxydot3c3qq86wic8dw5w5xfs5ash

On Sun, 2026-08-23 at 23:57 +0800, Weijie Yuan wrote:
> On Sun, Aug 23, 2026 at 05:14:20PM +0200, Manuel Ebner wrote:
> > I think in the documentation is some incorrect auto high-lighting.
> >=20
> > https://docs.kernel.org/process/deprecated.html
> >=20
> > Line 272:
> > > when such a struct was in unions, structs of structs, etc).
> > with 'struct was' bold.
> >=20
> > Line 358:
> > > alone in a struct or is part of a union. These are disallowed by the =
C99
> > with 'struct or' bold as well.
> >=20
> > Other files have the same issue:
> > E.g.: https://docs.kernel.org/process/adding-syscalls.html
> >=20
> > Unfortunately I don't know how to fix this.
>=20
> Hi Manuel,
>=20
> I think we can just add "or" and "was" to Skipidentifiers, so that it
> won't be treated as C identifiers.
>=20
> --- a/Documentation/sphinx/automarkup.py
> +++ b/Documentation/sphinx/automarkup.py
> @@ -51,7 +51,7 @@ Skipnames =3D [ 'for', 'if', 'register', 'sizeof', 'str=
uct', 'unsigned' ]
> =C2=A0# when following struct/union/enum/typedef keywords.
> =C2=A0# Example: "a simple struct that" in workqueue.rst should not be ma=
rked as code.
> =C2=A0#
> -Skipidentifiers =3D [ 'that', 'which', 'where', 'whose' ]
> +Skipidentifiers =3D [ 'or', 'that', 'was', 'which', 'where', 'whose' ]
> =C2=A0
> =C2=A0#
> =C2=A0# Many places in the docs refer to common system calls.=C2=A0 It is
>=20
> But I find more words needs to be added when looking at
> process/adding-syscalls.rst.=C2=A0

It would be this list:
Skipidentifiers =3D [ 'and', 'are', 'as', 'containing', 'element', 'in',
                    'including', 'is', 'name', 'needs', 'of', 'or',  'page'=
,
                    'pages', 'passed', 'randomization', 'request', 'that',
                    'to', 'where', 'which', 'whose', 'will' ]

> Adding the falsely highlighted words one by
> one may not be a perfect solution, since it could potentially affect
> other places where those words should actually be highlighted. So I'm
> not quite sure what the best approach is either now.

Me neither.

Thanks
 Manuel

> Thanks.

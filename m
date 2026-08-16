Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0A0301486;
	Sun, 16 Aug 2026 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786868683; cv=none; b=SC26NfpOjCMISYl3j1icKT6ns8UFCwld0jIMy2ckYrB2RDedUrJBoZXY+buMUe5adHjvg+E6bcla84474L8Y2FqenT+JokCUJNc40mW16noc07WJdZ6bLOpuSeN2lzGKdrKy5XzWm2wT99+1fR+umkEGsRHNuZ0sCiGvikxpmZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786868683; c=relaxed/simple;
	bh=6I/RdOC/YOczsezq6vaQpD2KYs/o63DzKBFDys2p64Y=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EGRjsqUIiQ2NB7wzeUQ2OYAz5B8eAo03KEkp89m0zIRizJSDYQVOjzd5NnnqvgzkHo7YqaWu0avjZnkHWENFd9X9Nr7xdzSSfbprJwC13yxSU/1tytHOUDQp99S9Opu1nBUorjTvPaHzFBHzvXBETFsAtV9c8fo7meRKCAS9Wfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ut7DqVzW; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ut7DqVzW"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hN8C36fd7zMlFj;
	Sun, 16 Aug 2026 10:24:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786868671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TtQcLNQnghSoQoPbIK3jV73MK7xk+6PjxoLLNklMqWc=;
	b=ut7DqVzW/KqhGlKUv96jIGn3peZvPPPFOJUQGipoho2glg8K8V00UriSCnKFRpl2A8PThY
	pKZLPlsoY4NGdSqALBSqc4lcaMv4PUxieSI2AAo++AwWPh9rJyZDn4Y5NPNPSbwbBmyu/r
	YkJUIHS1z0b5FB8VR4aDWWxbAULGctikcZcGpZDL4ZSTvuOdIPxttSAXNiPX00fceD81tj
	LuZz94gY6QU74rolbaVxdBjq9AXkbu9nj56iuA1SLpKH670eiTa/pOrXwPcD6vc6EwWMzN
	iOgYTcSqC/eM+wSpiXZmNkYaMtBd0gsZkHNEKzxZpPPU5bhMTmdzG5DvXZtjFQ==
Message-ID: <875527abdf9df0393ade872c6df3612ae9945b44.camel@mailbox.org>
Subject: Re: [PATCH] Doc: process: Getting rid of OProfile url enlisting
From: Manuel Ebner <manuelebner@mailbox.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, corbet@lwn.net, 
 skhan@linuxfoundation.org, rdunlap@infradead.org,
 workflows@vger.kernel.org,  linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Sun, 16 Aug 2026 10:24:27 +0200
In-Reply-To: <20260815220029.3711742-1-unixbhaskar@gmail.com>
References: <20260815220029.3711742-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: ak3noa4aufdzr97r53euyrogk5jbpmcx
X-MBO-RS-ID: 30b7fb18d6f49153120

On Sun, 2026-08-16 at 03:23 +0530, Bhaskar Chowdhury wrote:
> Aren't we done with this damn tool from a kernel perspective?? Thought,th=
e link
> could be removed.

This would finalize (fix?) this commit 8e9fa2f21151 (oprofiled version
output line removed from the list)

Maybe add some reasoning (To reduce it's OS jitter or because it's a leftov=
er link)

And if it's the way to handle translations remove:
Documentation/translations/it_IT/process/changes.rst:- <https://oprofile.sf=
.net/download/>
Documentation/translations/pt_BR/process/changes.rst:- <https://oprofile.sf=
.net/download/>

I have no clue about the technical side, that's why I'm asking:
Can this be removed aswell?
arch/sparc/kernel/nmi.c:atomic_t nmi_active =3D ATOMIC_INIT(0);           /=
* oprofile uses this */

Thanks
 Manuel

>=20
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
> =C2=A0Documentation/process/changes.rst | 4 ----
> =C2=A01 file changed, 4 deletions(-)
>=20
> diff --git a/Documentation/process/changes.rst b/Documentation/process/ch=
anges.rst
> index 0aa232b117b5..336c07190c9b 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -556,10 +556,6 @@ Ip-route2
>=20
> =C2=A0- <https://www.kernel.org/pub/linux/utils/net/iproute2/>
>=20
> -OProfile
> ---------
> -
> -- <https://oprofile.sf.net/download/>
>=20
> =C2=A0Kernel documentation
> =C2=A0********************
> --
> 2.54.0
>=20


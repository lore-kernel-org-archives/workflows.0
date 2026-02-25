Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1582E2EACF9;
	Wed, 25 Feb 2026 22:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772058385; cv=none; b=SUEB+5K2YTAeXy6APgGLZQNsqiEBOr5qbfiUkRF4hUKjIpBxEzNibcTiOcndOKnXCH7Gh2nZuEHb4W+N4llJPLPEXJ8k87lFwIxpI4ewfDz6NQtmJdQmWv5/fEkP8BqNfDqqU3ody25XNAGhe/wrzKg+Ae/Ytdqori1p3M4syG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772058385; c=relaxed/simple;
	bh=myuqzZpfSnza4NILBUJDVnpMkwG5FlqWwZRrMXE/HPU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=soxluVRKCXbZd2K9Dpmlet3cQBt685wBYlEpUMrO82pxuOF+QL0BQH/IHr8iaHWPQTwkowZLbS+et62gY8obw95eA6n6+2emt6PspobKiVp92/CVank/8hRJb1CC9dDLTD/zJo+d9lfXdPqvir4t4fiycF3Vt+1hPGnraD1TCWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=mjCBY0xh; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="mjCBY0xh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Fy3cH2rzILpqMLlhVdZJPMYEJrn96kG/FRu7cB1YPhc=; b=mjCBY0xh1Nnoc77+L4ZqWWDucC
	3RmbQIZj9JZxWebvCUqEjzH/E5pFYOAZ3MjDgs4Pq9IBbDK28l9AP5z/blC54d/Mno5zdloMEqRrg
	2oGgJA+MDFLz2kkIe2yXOIPL9XFX0GN9Q9ksN+pJPmGINnBGXqKMlVOloh2PfAcIFlU10aKTqFVJJ
	8EGBa2LBODEI2Ll2FZySxmdhhMnFH4XxKZoXhzyIW/jx24z95eOaFsDv5PMMqxJZoktS41M5YINDp
	kIAE3D4juyMIjN0118BY4L4Izjbxewkej/1TEp3q7F9CUbe4aWVoXZULO0o8o4gwYDUO/869N4wtT
	QtoIVwcg==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1vvNKT-000000001pm-3AfW;
	Wed, 25 Feb 2026 17:26:02 -0500
Message-ID: <9476ab2ff783c77ff4f1d323fad3e356bb172fcd.camel@surriel.com>
Subject: Re: [PATCH] kfence: add kfence.fault parameter
From: Rik van Riel <riel@surriel.com>
To: Marco Elver <elver@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov
 <dvyukov@google.com>,  Jonathan Corbet	 <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	kasan-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-mm@kvack.org,  Ernesto Martinez Garcia
 <ernesto.martinezgarcia@tugraz.at>, Kees Cook <kees@kernel.org>
Date: Wed, 25 Feb 2026 17:26:02 -0500
In-Reply-To: <20260225203639.3159463-1-elver@google.com>
References: <20260225203639.3159463-1-elver@google.com>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-02-25 at 21:36 +0100, Marco Elver wrote:
>=20
> +static int __init early_kfence_fault(char *arg)
> +{
> +	if (!arg)
> +		return -EINVAL;
> +
> +	if (!strcmp(arg, "report"))
> +		kfence_fault =3D KFENCE_FAULT_REPORT;
> +	else if (!strcmp(arg, "oops"))
> +		kfence_fault =3D KFENCE_FAULT_OOPS;
> +	else if (!strcmp(arg, "panic"))
> +		kfence_fault =3D KFENCE_FAULT_PANIC;
> +	else
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +early_param("kfence.fault", early_kfence_fault);

The other parameters in mm/kfence/ seem to be module_param,
which make them tunable at run time through
/sys/module/kfence/parameters/*

Why is this one different?

And, does this one show up as /sys/module/kfence/parameters/fault?

Having the ability to tweak this behavior at run time, without
requiring a system reboot, could be really useful for people
unexpectedly triggering kernel panics across a fleet of servers,
and deciding they would rather not.

--=20
All Rights Reversed.

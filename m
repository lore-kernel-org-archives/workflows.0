Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D353ACF1A
	for <workflows@vger.kernel.org>; Fri, 15 May 2026 09:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837493; cv=none; b=uf9hzOeOw1wwpqZTBTiy/sVGdxhnC9833edm8mCqXZPPbaIouE5yNSCK25yXgtI0tnraQrwypEUUUa4rTeW2TKOdo61A9Ni9JsnU1ft7zvkmC0s07rxkx7ZMp2TBOYkKe7dkQPnTEB1rRMRgPQWjSZ57M2X30+kMDarpjbrIej8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837493; c=relaxed/simple;
	bh=ihXGMwI9HKziM3oJP/L4COg+vtW7X6bZgQ61DgnepQA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmgyEn/dqBm7sutRkxHxwzRT09Otm7KuAA4vaD4yus49nO73S+ZWae9qjkz27nbEzWNNJsGhLmgyPvBSgX+p0mbbMKsAqYh4o4fOxnhkEnIbjB1/NcB8T+tayuzw38buvps+5rljuqB/QJedhA+hSmyxHe6mVUiDOF/M1OyDrfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggZV1Vaw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggZV1Vaw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48d102471a4so87582095e9.2
        for <workflows@vger.kernel.org>; Fri, 15 May 2026 02:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778837491; x=1779442291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBkHEZtZGZd4AhluodDreLYAV0s6Gw1zv9m84/i9HII=;
        b=ggZV1Vaw6EqINErgoParu2vIJcoBkFBCKdYJCvnZi3Wtg5fHQSk8ANUUMIGc1am+70
         SPzuUSc0OqSECu09FDHeyvRcqcDdZdPeksgOQ125DzB49MgdT7hzi1kBieEesaIt1Sxw
         RT3u+vy3FMDquwN0VqehnCQeOEfO4f5UctWJnuhjKY7CFCoi2kj6VTunuE+qDnbQGe5T
         J7RP0mCla/JWauxdgdmz16UgK1RPFLvzsVc89zBBfXIExKhWuXFT32+WiVchBJ5tET6v
         ZVGSnrU2yvfBnMBIVxQ8SgmvGxtfPQs1Z2Pvk+wcWR5ShckhIY23WicOOlMG25oTD8hu
         5DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837491; x=1779442291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MBkHEZtZGZd4AhluodDreLYAV0s6Gw1zv9m84/i9HII=;
        b=XGSQD1ewIEieX2xFTpAGS9PbnawXCmeVfjFT6TXtyz1bAnwfEqgJDe2lTZ+p8Co5Jh
         B5ZUhZC49smcqqs0lX+pQYkgaoP3phu8SPy+7M2NGceOGaOF6kx2OKEfpOFhNHC3SHZV
         qKBiO6TEqg+euy6pvTPcDpxACTvJX3JPsLfjcCXhvnbQy7htCeIkw+yKF6V6Rkd14IHv
         aI1G1979arnYRh9jMmpN33Z1+FBdjDXTorpOpcnPXbFo2R+hLVyieXob3FAQ8TZXXxB3
         pso5oOG6In4zGIO94/eQGo6uCJB5NZQIT6pVtlYtSnm7uW6MdSldKh//XSBwMkX8teip
         3TlA==
X-Forwarded-Encrypted: i=1; AFNElJ8jYikF7U4mSKI8urotlMNPfu0xvq2rjcYSWBwakoY5hkGeLRXYbo6hUl38+kQCodMW9VInCL+m8uY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK4eTGoNoVdqLciTLrdiNMs+k1eZNPVE6xETDstleZ4thP19Ol
	AjqEGgKmoRgRNGpARh7F6nz53CiaGcjHav0GXqq27GliUO6HKxXyE+3H
X-Gm-Gg: Acq92OF1VAhC7DhrhfDuB+2LC8D13I5Cr8CINAvmR2N1IwOFjysCwwmQNdJXXyXLPhy
	GhPVrU0BPZj5tMO/4wgmh+ClnXzNx6rHFPA4ahB0TQJnmSjC74+7YTfWJKU41a+2AYWjPZymXEJ
	17iadf+RmOw+dMl0nPfJJNE8YBAwhVZtbSfIWCABR1xaf/I89Zf8HNlLaQQagTZ0UYkzh7qRIi9
	YSRrko04fm6oHC+FWrI2qBR9wRknzpwZjrGtVnzmtegnKmVWLelbg8Zlf9uDQ7P9Ie7JnDJbo2n
	bIS+9OVbj3V1oWW9RYNXDkt508qwBvx6wtY7rjmm+D9e1WrYWf2/Jl/sMZXZUd5HR2mZnCZ+Mnf
	CsdntHJF6Q3w5lN8f7XswNZzFLhIN+bn9DnxXL6F03/QOISCWbBXxGPhh9MZOnuoojrgltaRM7W
	Ui2qkX6Z6RzfBhMrSK35NV5D6SGNEnPJoD1MhutJdYW8BRcvFLj5IRZcmMwiYxDWNMmSNxvk0=
X-Received: by 2002:a05:600c:34ce:b0:48a:592c:e63d with SMTP id 5b1f17b1804b1-48fe60d7832mr45420365e9.14.1778837490737;
        Fri, 15 May 2026 02:31:30 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fcasm43875125e9.5.2026.05.15.02.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:31:30 -0700 (PDT)
Date: Fri, 15 May 2026 10:31:28 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Manuel Ebner
 <manuelebner@mailbox.org>, Kees Cook <kees@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Andy Whitcroft
 <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Randy
 Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, Heiko
 Carstens <hca@linux.ibm.com>, "open list:DOCUMENTATION PROCESS"
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
Message-ID: <20260515103128.323da7e4@pumpkin>
In-Reply-To: <CAMuHMdW12mAV2YROUiFLoKKmtNS=tYNZs7pWN0e4wTKkSMA2xQ@mail.gmail.com>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
	<20260514163033.108009-2-manuelebner@mailbox.org>
	<CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
	<CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
	<CAMuHMdW12mAV2YROUiFLoKKmtNS=tYNZs7pWN0e4wTKkSMA2xQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 15 May 2026 09:32:06 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Andy,
>=20
> On Fri, 15 May 2026 at 09:31, Andy Shevchenko <andy.shevchenko@gmail.com>=
 wrote:
> > On Fri, May 15, 2026 at 10:23=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote: =20
> > > On Thu, 14 May 2026 at 18:32, Manuel Ebner <manuelebner@mailbox.org> =
wrote: =20
> > > > add kernel-doc comment to strlcat() function definitions =20
> >
> > ...
> > =20
> > > > +/**
> > > > + * strlcat - Append a string to an existing string
> > > > + *
> > > > + * @dest: pointer to %NUL-terminated string to append to
> > > > + * @src: pointer to %NUL-terminated string to append from
> > > > + * @count: Maximum bytes available in @dest
> > > > + * =20
> > >
> > > Missing "Returns ...". =20
> >
> > Documentation says "Return:" as
> > - the section (note important colon)
> > - the singular (however plural is undocumented and supported) =20
>=20
> Trailing "s" is not always plural in English ;-)

It is for 'Return' :-)
Most of the exceptions are words taken directly from Latin,
where something that might be a Latin plural is used (who knows what
the Romans actually used).
It many cases the 's' plural is also valid.

-- David

>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20


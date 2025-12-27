Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862953A1E8C
	for <workflows@vger.kernel.org>; Sat, 27 Dec 2025 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766847086; cv=none; b=UdigDy25vIA83VivhoCpdYZ6vPuNT4QM7xUjtHv/8Rl2YQKK9YgZhCoHo76AG+9FhON8gByXmwWEz8WyzAgjuy9P3gGOuPrJ3DjQ6ctrJ9a+xQWyFk/qUQZMDaDzNqTF3k6aGLh6tktyGZVAlZVcLPvFNZHwDrg0H/EsgcI05Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766847086; c=relaxed/simple;
	bh=j8SyGAyZfKbZl/a6r25CdYeE+e9xvvgyWaPH15mAVfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ii4va4Szooq0ruFNfHWmldXlngxrQXO/i65l9lPNVBKY4/D/l3DJoGrwU7a6ypkP+BA0OaCj2ycbXkDdmLHmpKBqoeMHyUQRh0W1CjaIpvOUM8CINt0cOyEreKwLLEGtht4pJ42VyP8J+ebMH7na28KlUs1ys5463cSaVOslkQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6/yvtIO; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6/yvtIO"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-598f8136a24so8903525e87.3
        for <workflows@vger.kernel.org>; Sat, 27 Dec 2025 06:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766847083; x=1767451883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i1NV4oGkSQ++8XTsYpBz/iBSph1QD948iS4Wd1AoGGM=;
        b=i6/yvtIOXFuAmNmUC9H6T0BTKRHTFJKjydNFaHl38R0NWZgrG9NpvX6HpVPgRyUs86
         S5ieSBEHpJVps11u0soqR4c+lUI5AcGT+1nTTGeKTOZB8rcI9Q3imQB8a0o2JamuduJZ
         7llzGTMSMC26LHC7th2AXhvannbj2u2isRbuA4qdpW57Fmq1nZ8aGak2dQhXPSsGM1GQ
         PxuoPrJWHOeIz1AkPuv2OwlOSEeJPszQ3sXJVlmQDT8gxVefD7QRdtoVmEdY4IYPBZHU
         ChVN3AFgKVbmZJGPxnVNr57YMHXFPIRoYFbxtxyXgU9JeZ8q32R4Cv0ljOjlMgGMli7B
         4JGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766847083; x=1767451883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1NV4oGkSQ++8XTsYpBz/iBSph1QD948iS4Wd1AoGGM=;
        b=SmV1fAMwHqz5rLQDTbmYbQMfzqga0n7RLVV56FC/BDKJPkHF9P9jJanxuEF83Zismc
         n0q7jeZYzJ34YzclTH6GvAlA6/Df0aV839nwZbWIdPlfgB/mKX3viN3ZcpLdZ2/V3ZAg
         SOFzNw+4D9REMdRgD9Xci1KTnfXV4ANDd14u9rLQGY/RG+1wA13muHte6sBp0D+TK0K9
         T0eFoFLi9c2UOds1WkA7ThiOe1phq+LhRk4gpfkweNRUzlzg2BLV5LGGulBszshAWBSY
         wOQrphKLmJS/YKiz0QXPNf3GIzAzl6uAeZXyZKfy1pOdmdx0/4BJC/uTayOtHDl/1d3p
         gD1g==
X-Forwarded-Encrypted: i=1; AJvYcCWcIKq4AlRj18SK526Km0oyUYnZeqecWUfqcrrC6TslncinU3thD35wTEJ+69TtGizVuO/qemAQr7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YygISaln5UPOfxyyutDAL1Tg8GCRJsBgxHrQpD7+/KWUpV4YgiO
	ONwbKtd5os9cURORdoPlqduBEZg1/jYxu9tDFKInuQBDgyGXSpZ3Xse/x5Nz7nQ=
X-Gm-Gg: AY/fxX6fE8fLwDgZHKq7T6WxW8/ht9H8qdJxDglzH6SCr5dW0Dmnb0sKKo37BtE85HU
	+0YadjEKjD0v6IGCb+rRCaGc5qd7QcYu0M6DrgmI+B4HvUzyk46kSZ0HaMwwOZk52SKx+2VeH/7
	GmO0E+SQKnNA3Y2uWn2iLymr4sGWQbEOFYn1PWCXVXXVclEModWZD445JumGHmnNdb+uSUCbjsy
	MUEb9w6eWbz9A5QeAGXA31ZoT/ibIlB9+Vm7qU58fmZgvrSgAbc+H8PDzhRq4ZvXCXQ+l6eCNut
	zVkopxY0iVD9Zz+591HtvUaVTAdABi7ijv0qc/OhT79qq7Y1/A4RfvFDurmY6P6Z6gmDQyydfCs
	UK6ThG5YjOk3LqnRgI3nPgJRd2bv1pU6ID09sIF8htbXVcyOY38gHBh1exBactn/P3BWcQn+8uq
	k=
X-Google-Smtp-Source: AGHT+IFITWCqUFrabITrYo1vQh+T6Hzw3ZVjIVADy8Z4iFYe7nyGQIlSeJ5hgj4SPvDzdbPCGpWk6A==
X-Received: by 2002:a05:6512:2250:b0:598:f1a9:7c5e with SMTP id 2adb3069b0e04-59a17d492cdmr7608423e87.2.1766847082286;
        Sat, 27 Dec 2025 06:51:22 -0800 (PST)
Received: from p183 ([178.172.146.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18618d90sm7481489e87.56.2025.12.27.06.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 06:51:21 -0800 (PST)
Date: Sat, 27 Dec 2025 17:51:49 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] CodingStyle: recommend static_assert/_Static_assert
Message-ID: <c6f0c3d8-eb2b-49e1-b874-610fbeb248e4@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-6-adobriyan@gmail.com>
 <20250513204031.26f50209@pumpkin>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250513204031.26f50209@pumpkin>

On Tue, May 13, 2025 at 08:40:31PM +0100, David Laight wrote:
> On Fri,  9 May 2025 23:34:27 +0300
> Alexey Dobriyan <adobriyan@gmail.com> wrote:
> 
> > Linux's BUG_ON is done backwards (condition is inverted).
> > But it is a long story.
> > 
> > However C11/C23 allow to partially transition to what all normal
> > programmers are used to, namely assert().
> > 
> > Deprecate BUILD_BUG_ON, recommend static_assert/_Static_assert.
> > And then some day BUG_ON will be flipped as well.
> 
> _Static_assert() is broken by design and only usable for trival tests.

It is not broken by design. I was going to recommend it
for "static_assert(sizeof(struct S) == ...)" type of things. For ABI types and
similar stuff.

BTW BUILD_BUG_ON is broken by design too, there are places with fake functions
for a block so that they can put statement in.

> clang also output the entire expansion of the conditional (even when
> a message is specified) which can lead to very very very very long lines.

Oh, that's very unfortunate.

> It isn't at all suitable for many of the checks in the kernel.

STATIC_ASSERT could be arranged.

> Look at the signedness test in min() as an example.

The very fact you all made giant mess trying to imitate min<T, U>()
should not block progress of using standard (and better!) stuff.

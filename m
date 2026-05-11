Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5903A1A2F
	for <workflows@vger.kernel.org>; Mon, 11 May 2026 13:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506014; cv=none; b=tmPPNxq2eFGTWcIpARXtNBvQi3nFFfhuRaOQm2/0EplquvZw01OEVyuSaBH3f91oF9FYVlPv+FIKYmeEk4mGS+o7okvzuv+ZSyG1ZiOLmGXWQ5khS9WAoi3ZzAn1XV49FvQozu560Wz3A7cky3ZEUH9NP5i8Br0VCBjZQj7e5Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506014; c=relaxed/simple;
	bh=z1hwDVt92XOAnihS7s6RxQLFhGGvzqHcP+pj4GoLieI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m7p4j7DPboww/6Or7o+LiBu0yrvb9UHOfIWSWNVggGM5COAxTx5IIW4Qo0dm3mWrscxSe10D5H7EvJSX2//eMSGz+unNFe1ljgSrQ5XB0rTEZoXIkRxGbSYsZ89I2O0rbOOfBv44gXUvKvEBU1D4tsCmMopppWNCUZKiQL6H3xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9xQ3b8d; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9xQ3b8d"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so73721545e9.2
        for <workflows@vger.kernel.org>; Mon, 11 May 2026 06:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778506011; x=1779110811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mzrS4VJwJCC0yKNEXMEo8xy6/BimLXjTtOtcr2CuV4=;
        b=U9xQ3b8dehb4HpbBamWXYPXXriLPmK0wxf9ygRRaBUbwoP7HwrvB665GfnY+gbFkY7
         bZTjeT4cQiz+8rN3lcosfc5JrqznAOytUemSR6eatB1VSMnnP35rwYxX6qgZAac0JNok
         stjFTTK8K56xhLmJBiNjtbdgWgfP17mF0bgi4+Lhpg6JGODIVL22kmwXje+Y/yhavl+M
         85PoO18U7hupM1SS3EYvG0vXl4s+IpBSVHj7pdL6n7tzgKLr/OM6ZzWMhPSZQjQkNgRf
         lBO5Rvip4sp6UQGmp4Qk2fmpb6mTAeMa4nfSNlxGAipe1kBSDhe52aE4qvA9X1gxYCY5
         7LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506011; x=1779110811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2mzrS4VJwJCC0yKNEXMEo8xy6/BimLXjTtOtcr2CuV4=;
        b=XWonYkF1QDXxKDl0eEMqXY53It/fhquKkTiiUbMrs7sbPGPPsgPMWg27hSvELskqma
         9yzq62DN48KeqgjM56FyEABonSWBBnp7tD8BljMa/jthoqJBgVzzM7EAktTQQuNiBsUy
         xZBGs6tRocpdg8ziX4lEZh70t3xeo3BPDaFgid3Bm2/a5cfgfV/YN9WF8zjtzqTznGy2
         yw6X7UFgxcELlA7kSyDSXWIrIDNqQA+EKWvDMoFdgVJRMuvnjetJ0qR/jSVJwM7kY7yA
         RprtlTGhNT+HNs8I/EvQ116DIbHx7PLkUb/Vz1M70MQh70raN/a5p55suWuK0IXFg50r
         cMwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+RsbTk3i8gwfsFON06gxGP/lYnqcOEqHewxn8+zGEjdnarYkBCX0JoExhABqYzV2JxTUQPSans+8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKCWQHZRks9R13qxJXNwQgl56+OAQyO8qmiE+IS+qfvKNo4bsU
	TRZRzok16eMUlJX30XwWTlwvu6yrMyIYi2cliQ5Gb09b9z4PMdC7gzGR
X-Gm-Gg: Acq92OHMyytGpZNI2eTbFp5f5iAps/vldrJlEo5tTFwEKQau2zHa80Fy1PlNKW9H4Z1
	eDK4MUnwkg2xPhueDMsOXQATSlydpquCFyLbQV1vjCCD7VHI5b7ACJysgIyuTiQvpnPauj/bCpH
	DCFSyLHy3NjB5Zj4tvv2e20U5tvd+QOK9QVvYN0e38jv3+37S6t1wqrwsivZ41y9WB2RnB4yZKY
	7NvD6adhPMJHGG6ITTC0i4PtRiXyJiUgJLStIDNfUaoAkTF/6Rhqz+U6DpzTHANI5SbSYfROobf
	xCK/kzKbkot5UBLQTnOPsPjaRJ2AQGwXXGEBiFbXhcYenGUVtHdGX3Osk3qpNSa4OvIUfpqLlCb
	f4ZYgWvZtrGZrQYaGXJ3WgmLWxf/3ogoGmerhlROfzzAHjY5EThpk5s/dMVG/byVM1i0DaRvXBH
	RRqQrreIE1Bl9RQwVox+9Al2RdzLwx5wWAGRVh+J1hd2c+tfd7VaSFULO1v47v
X-Received: by 2002:a05:600c:c094:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-48e51dd89ffmr280640045e9.0.1778506010795;
        Mon, 11 May 2026 06:26:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6f9fbf12sm200982065e9.0.2026.05.11.06.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:26:50 -0700 (PDT)
Date: Mon, 11 May 2026 14:26:49 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>, andy.shevchenko@gmail.com,
 apw@canonical.com, corbet@lwn.net, dwaipayanray1@gmail.com,
 joe@perches.com, kees@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com,
 skhan@linuxfoundation.org, workflows@vger.kernel.org
Subject: Re: [PATCH 1/2] [PATCH 1/2] Doc: deprecated.rst: add strlcat()
Message-ID: <20260511142649.463c3ea5@pumpkin>
In-Reply-To: <CAMuHMdWchXXcMyShiMZrhFTrHoB-TcKQEBcRoCTJFpwJsxxdhg@mail.gmail.com>
References: <20260510164907.57176-2-manuelebner@mailbox.org>
	<20260510165159.57457-2-manuelebner@mailbox.org>
	<CAMuHMdWchXXcMyShiMZrhFTrHoB-TcKQEBcRoCTJFpwJsxxdhg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 11 May 2026 13:40:55 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Manuel,
> 
> On Sun, 10 May 2026 at 18:52, Manuel Ebner <manuelebner@mailbox.org> wrote:
> > add strlcat and alternatives  
> 
> Thanks for your patch!
> 
> > --- a/Documentation/process/deprecated.rst
> > +++ b/Documentation/process/deprecated.rst
> > @@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The safe replacement is strscpy(),
> >  though care must be given to any cases where the return value of strlcpy()
> >  is used, since strscpy() will return negative errno values when it truncates.
> >
> > +strlcat()
> > +---------
> > +strlcat() must re-scan the destination string from the beginning on each
> > +call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_printf(),
> > +snprintf() and scnprintf()  
> 
> The last two not only require the caller to keep track of the offset
> in the buffer, but also using "%s" when storing passed strings.

Which also means they are significantly slower.
Mind you, some code has:
	strlcat(buf, "\n", SIZE);
	return strlen(buf);
which carefully scans the string twice.
Since the '\0' isn't always needed (eg 'show' functions), this can be:
	len = strlen(buf);
	buf[len] ='\n';
	return len + 1;
Of course, the code could often easily get the length by other means.

-- David

> 
> I hope we won't see mindless conversions lacking the "%s",
> introducing new security issues:
> 
>     -strlcat(buf, s, size);
>     +scnprintf(buf + off, size - off, s);
> 
> > +
> >  %p format specifier
> >  -------------------
> >  Traditionally, using "%p" in format strings would lead to regular address  
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 


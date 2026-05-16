Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431AF1946DA
	for <workflows@vger.kernel.org>; Sat, 16 May 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778949329; cv=none; b=DpUGaMPjXaQQ/EbBTF6uK2EAUmPpsWEc8gHBZwt55CDCCKk66mCuTXBiy4SsMTD1tpvO9q3h9vjYaful2A8hB7fezqd54QTLApD6yxA31vXHN9xzFBfeGUGZjsXJhydVH1uNnXLFstb2V7O95Yq8OfZy3sDpjRUZI2vdz97pZMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778949329; c=relaxed/simple;
	bh=ObeT11Yua0BV4EJOKCJX/brzVfO/DD/aReuB3TectNA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HHslUn6qJxlQ7dU6nSXLahJWrpPHa7F8S6dhW/8auYBg0+P/q4XlW0y5tlr/iU8ZHgF6a6z3oD3filam3xefajnbyaRhvKSPNkErfpdSXtpicmSStfaawMUaX9qn59mxGRgLesOkDjQNoBP51hzYmfzlbPqYNUbeopHL81nUo7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AavyMMsL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AavyMMsL"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so4237805e9.1
        for <workflows@vger.kernel.org>; Sat, 16 May 2026 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778949327; x=1779554127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZeZfDIT56zPfGGUkR4CImZ1hE92727R56H7iAHBklM=;
        b=AavyMMsLjPzrM/9co6HPLUCovA1mkQz+IQ9CLAnbMKZe7Q2OfhEgzIvlefLWV072u5
         caW9LLwa9+dnudCva5YbXi5SwesQeWGefJW0prZC0cDtABDhVubtzwZH/wMFXxilRvzX
         4fZHzmeGvR7v0g/pmsceY5mIVh9mhlx9xbXnJHWzYrOkOplJBwydY0lNzRKhgIY6mmaV
         JeUa+j/3SAqauhuEQnR6n2VoKncRDKlgJqISmO/JWTVVYHy56nKF26XfAVWcjRrtb8aV
         bqmuUgATVXXkm+Gi/EmFL1lMZyzdkpxg6Oo7hHh2urUc+WSg4MBQoGQsV+2PGxa8l4Wh
         Cd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778949327; x=1779554127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZeZfDIT56zPfGGUkR4CImZ1hE92727R56H7iAHBklM=;
        b=jtHcyau97y7gsnMygeZZfPLsgnzaM7vTyeFrp9NL4eBfLJrW/3iQlSD1S3C1EqpS3U
         XMfVYFdqOx988CZKRelvK+j6GTbygTS22GyzxgkLN0hr8CU1xYNwp8CJQBqGBzZiSjx1
         7jPYrckZY2qLRw9DUoCNXd1E1m/x8/SPWYhF+SgGHvpJVM8BpeoBfaV9yG/yU7lEF6Ys
         nVCC5B07fndZcLO3W8Ld2ldC7BsUd41Mvnp1FKLsA/7HT5bgfAFW9o0QdOxKWSIxOObj
         DqZZYJ2ifVwlU+0WXWsbBO3igylXLMRw4apxPG2fkudw90Xr/UFXTJ8OCUuH8qIkKdFU
         +16Q==
X-Forwarded-Encrypted: i=1; AFNElJ9nTofxqQurE2xLSpZ+lj5jbMUizpYAQjdba1Xu0ZZZ5pnYJO3z04g3qVcJAPJHs1LtHlJXNDvKaMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YztMaYzMnObjMBv4XS7ty/UxK16JLLWxNG5JN7Z0wiTQo+x+1ab
	iBtgsqGJ5v/UKtsRUmnpfhxGd5hX93aFjAU6X+/h03V8WZJTvaeYFeQU
X-Gm-Gg: Acq92OEhF1JxXb1VbpzpwvlEtJufq4Bd32v46BrEYUDg8rcFAi2h5bp3xFJMqbVHW9O
	c0O3Pd4/wtaHEMDRaXsKmO2rsbVU37JvikKftDWehY5s94B7HRXq4w8aW3miDgKX2yuGTElhLnM
	lrWpjTqV/JiR4JaLfhJPNk7xdpQJZdhIheaO7oRlTD2VVYJwELhSZDFl2fpFEhK02F0Aiz5V+Lj
	K0RU1UTO90tBKAszWf3tzvZiQ+UuqJZ3133KkIMLKa6fmlDMT8QgX87PJXQEpfwo6NKyi1FoEQW
	9D0qxZU8YltKirWjrHiFWe2YznK2+ou2obx9mUoMOIjUumwUyV1kf59zwFXsJYGvG4pfYl46o6L
	u+7xTPXPaZaobJSX9VWWalDu0qR16mENT56M6jbfs91MextzC9U7n8HKcexU5VqRiTYwgmVeoj1
	dinZqgCFkYTPCQpCI16uej8an4B1dbSh3j+htjS1hk+/TeQSlb2o0+tKmUQMvoJcniMtmmua8=
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48feea99dc7mr50647655e9.7.1778949326439;
        Sat, 16 May 2026 09:35:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm41831365e9.31.2026.05.16.09.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 09:35:26 -0700 (PDT)
Date: Sat, 16 May 2026 17:35:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Kees Cook <kees@kernel.org>, Manuel Ebner <manuelebner@mailbox.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Andy Whitcroft
 <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@intel.com>, "open list:DOCUMENTATION PROCESS"
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] Doc: deprecated.rst: add strlcat()
Message-ID: <20260516173524.498984d0@pumpkin>
In-Reply-To: <20260516152819.14597A76-hca@linux.ibm.com>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
	<20260514162652.107714-2-manuelebner@mailbox.org>
	<202605140931.913048A68B@keescook>
	<20260516152819.14597A76-hca@linux.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 16 May 2026 17:28:19 +0200
Heiko Carstens <hca@linux.ibm.com> wrote:

> On Thu, May 14, 2026 at 09:31:46AM -0700, Kees Cook wrote:
> > On Thu, May 14, 2026 at 06:26:53PM +0200, Manuel Ebner wrote:  
> > > add strlcat and alternatives
> > > 
> > > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > > ---
> > >  Documentation/process/deprecated.rst | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> > > index fed56864d036..06e802f4bbfd 100644
> > > --- a/Documentation/process/deprecated.rst
> > > +++ b/Documentation/process/deprecated.rst
> > > @@ -153,6 +153,13 @@ used, and the destinations should be marked with the `__nonstring
> > >  attribute to avoid future compiler warnings. For cases still needing
> > >  NUL-padding, strtomem_pad() can be used.
> > >  
> > > +strlcat()
> > > +---------
> > > +strlcat() must re-scan the destination string from the beginning on each
> > > +call (O(n^2) behavior). Alternatives are seq_buf_puts() and seq_buf_printf().
> > > +snprintf(), scnprintf() and sysfs_emit() are possible aswell, but the adoption
> > > +of the arguments needs to be taken care off.
> > > +  
> > 
> > How about just:
> > 
> > strlcat() must re-scan the destination string from the beginning on each
> > call (O(n^2) behavior). Use the seq_buf API or similar instead.  
> 
> seq_buf API for appending something to e.g. boot_command_line seems to be odd,
> since boot_command_line is usually "just there" (depending on architecture and
> boot loader).

Indeed, but ISTR that code uses strcat() a lot of the time.
The lengths are all known, so memcpy() can be used.

I don't really see why strlcat() should be deprecated.
Clearly there are many cases where there are better ways to do things.
The only problem with strlcat() is that it returns the 'required length'.
So there are some broken uses.
- fs/nfs/flexfilelayout/flexfilelayout.c
- lib/kunit/string-stream.c (although the preceding vsnprintf() looks like the actual bug).
There is also some very strange code in security/selinus/ima.c - but it may be ok.

In reality the return value of strlcat() isn't really much worse that that
of snprintf().

-- David

> 
> So if I would remove strlcat() from appending something to boot_command_line I
> would end up open-coding strlcat(), including the chance for the usual
> off-by-one bugs. Looks like this would be true for nearly all architectures.
> 
> Is performance really the only reason to deprecate strlcat()? This seems to be
> a bit questionable to me.


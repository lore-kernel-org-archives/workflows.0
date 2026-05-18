Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE303DFC7E
	for <workflows@vger.kernel.org>; Mon, 18 May 2026 07:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088280; cv=none; b=fYoUpjRmWHSexIwHN6JHSy4+/7WVOKdJJeH0yedrle8jr58lPgWCQSrFzkQ+HWDfJm+z2mGuUyPgge4z2jtf1iIlVot6vYPSeUbnR7+c/12Q62NDBad4OdmIy3zduEKEQB5S2Lm6lthKfd5AAP0MA89wg+iljJGxlzvKbHzKa9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088280; c=relaxed/simple;
	bh=cyWuVwLRQLpT7xz29PUQuHjEYuN+4ZC70xzc/efPtS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1cjx+qOdk0h8E50G0kl1ByZYr6Cfnw5grgX99dtuV3qlIthXTWatzmWWzQQasi8cH7eBIPtYuhTruaDmXzOv0pvN2M5ApEcobNL+6+AyRIYOpokOeYVA2ZPt+jlyQKzD17qc7IiHFA/KI6NgZEeP75bYxWrROdr2hKFIg+Ebc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-575602688deso578401e0c.1
        for <workflows@vger.kernel.org>; Mon, 18 May 2026 00:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088277; x=1779693077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EIGjfBvuROVNG6/dQkUTLDceab7IJyeycExzDXofB30=;
        b=PnmIAtjhP1dxQU2diNH/VuR890rqu1rIOwH1MsfkxWW9k6ZLlIZ0Ng0QV/ZB60NByc
         /JbWPTboY3fiWGyRD9zHMCGVxiMNKaZrVHKmQxbyPY4MVTVj8wh83vCCnyHhbDVUtDMB
         OKEbIBX1qOeNfrJJ7libNbIux/XklScSwJeY09yqaZRSN6r0d2t90ZbCUWExFmmnIO/t
         ArDrmKPcyRrA4ePV0psKvSy6elMPvxj2cVzrI22n0oQmZ/c62SCuhvygIAnbNThw1SYz
         NhZe+mwq3o10kw8tvwfI55egivz1UggY8wxhOwJtkfilGhElJ/EC1EcyER3AMbigl0U+
         uSNw==
X-Forwarded-Encrypted: i=1; AFNElJ8AeM6mdF0/qwCGFBM6AbVaINhqJ8EgGu1Gy72R0MAG6GbzZnjSpJVQmiZa1fYm4i70BWc0D497bR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwevN8EZw0pIg8VR8//AGMjH3olOLNjjZDzrv7qSKEKMAYJWHld
	4ZRcfeObJ6mtLL4cBhuzQqKTRugD7vlxTbApwH75fZ7gxFl8uCgVXhUVKcPRcHv7
X-Gm-Gg: Acq92OFOVbxW4viM86bOqwXsGg98drpPJD0i+v+t0dF9Kbf2QKYjZN+AaYBhRNXVghu
	1HWkN84TAvPQNR1gMAJgZjj1JwtgSDKDxAchwDPHJbsk+2x6wMC51lFgesUyHbDwec61juaRAjn
	cyDWlzW7NJ+ZhaTa7HEwKfyN3snG6NKGb8p0O6WR5ly7EUmkITi3pThCA3looQo2w73wD01Jv5l
	7vCzfji7fYo8lzjVuBWHbzZpbx8D4WHUkYAvAtcVkuFUX+pGLA1EMl+TN8qHXMbvQcbHHDxA2uu
	P7NLn8H4M7uK/Npl0tjtyt+etuwpXFIdF4EBtZQByySpSMi/exqnkCXk60Wya3BbOBDeL0g/diA
	GBaApubHv1ZPpguGz0WzszC/pwEVyv2blYMDVJLIGmSWX8+jlwp3JSYNb4HyN+UKk7EIxqizNjq
	nNHUkPQcOnN5L4HPErHSlj7wQJfbKR4PwQceRmP0lovCAGB6z2h/VAGsccWmUs
X-Received: by 2002:a05:6122:f93:b0:575:a5b5:3233 with SMTP id 71dfb90a1353d-5760bfec79amr6744384e0c.4.1779088277062;
        Mon, 18 May 2026 00:11:17 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760fa5c008sm5824858e0c.12.2026.05.18.00.11.16
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:11:16 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-631333ee9e4so445781137.0
        for <workflows@vger.kernel.org>; Mon, 18 May 2026 00:11:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+pV30+PL/rHoO3VRKCQesDEsx05FHnr2t/pooOYvrW52P90ckasBbyu7GwjdWlc1g7NpYALiIlveA=@vger.kernel.org
X-Received: by 2002:a05:6102:6886:b0:631:4580:6a3f with SMTP id
 ada2fe7eead31-63a3d6298dfmr6188657137.7.1779088275779; Mon, 18 May 2026
 00:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514162652.107714-2-manuelebner@mailbox.org> <202605140931.913048A68B@keescook>
 <20260516152819.14597A76-hca@linux.ibm.com> <20260516173524.498984d0@pumpkin>
In-Reply-To: <20260516173524.498984d0@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 09:11:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEezxGi1d=BCiQ57cbnG4D2PPXvt_FAHcyT5mgR7md3g@mail.gmail.com>
X-Gm-Features: AVHnY4IbEzWMc0omNdrAHsjpA1BjY_2vqo_EEYOf8Iom3gzLQpq_q79rQP695-g
Message-ID: <CAMuHMdXEezxGi1d=BCiQ57cbnG4D2PPXvt_FAHcyT5mgR7md3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] Doc: deprecated.rst: add strlcat()
To: David Laight <david.laight.linux@gmail.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, Kees Cook <kees@kernel.org>, 
	Manuel Ebner <manuelebner@mailbox.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Sat, 16 May 2026 at 18:35, David Laight <david.laight.linux@gmail.com> wrote:
> On Sat, 16 May 2026 17:28:19 +0200
> Heiko Carstens <hca@linux.ibm.com> wrote:
>
> > On Thu, May 14, 2026 at 09:31:46AM -0700, Kees Cook wrote:
> > > On Thu, May 14, 2026 at 06:26:53PM +0200, Manuel Ebner wrote:
> > > > add strlcat and alternatives
> > > >
> > > > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > > > ---
> > > >  Documentation/process/deprecated.rst | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> > > > index fed56864d036..06e802f4bbfd 100644
> > > > --- a/Documentation/process/deprecated.rst
> > > > +++ b/Documentation/process/deprecated.rst
> > > > @@ -153,6 +153,13 @@ used, and the destinations should be marked with the `__nonstring
> > > >  attribute to avoid future compiler warnings. For cases still needing
> > > >  NUL-padding, strtomem_pad() can be used.
> > > >
> > > > +strlcat()
> > > > +---------
> > > > +strlcat() must re-scan the destination string from the beginning on each
> > > > +call (O(n^2) behavior). Alternatives are seq_buf_puts() and seq_buf_printf().
> > > > +snprintf(), scnprintf() and sysfs_emit() are possible aswell, but the adoption
> > > > +of the arguments needs to be taken care off.
> > > > +
> > >
> > > How about just:
> > >
> > > strlcat() must re-scan the destination string from the beginning on each
> > > call (O(n^2) behavior). Use the seq_buf API or similar instead.
> >
> > seq_buf API for appending something to e.g. boot_command_line seems to be odd,
> > since boot_command_line is usually "just there" (depending on architecture and
> > boot loader).
>
> Indeed, but ISTR that code uses strcat() a lot of the time.
> The lengths are all known, so memcpy() can be used.
>
> I don't really see why strlcat() should be deprecated.
> Clearly there are many cases where there are better ways to do things.

https://elixir.bootlin.com/linux/v7.0.8/source/include/linux/fortify-string.h#L346
already says "Do not use this function. [...] Prefer building the
 * string with formatting, via scnprintf(), seq_buf, or similar.".

> The only problem with strlcat() is that it returns the 'required length'.
> So there are some broken uses.
> - fs/nfs/flexfilelayout/flexfilelayout.c
> - lib/kunit/string-stream.c (although the preceding vsnprintf() looks like the actual bug).
> There is also some very strange code in security/selinus/ima.c - but it may be ok.
>
> In reality the return value of strlcat() isn't really much worse that that
> of snprintf().

So we need strscat()? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

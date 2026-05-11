Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9551B79CD
	for <workflows@vger.kernel.org>; Mon, 11 May 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499669; cv=none; b=ShIkyAdMUFPs19HVD3P74rQjgK8vOxZ37+PGhe74/HqjzZL/0b3+KWrp4t31jElYBMViLeRfopPr5ffmV5hmAqNCO679dzTZdbp/sHlxGZcc5pk9g7vzkMTLO8uHBM6HxXmwUGPvtxufChVYqSl9TAfmGlkk8ytTcnP19Ac9rIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499669; c=relaxed/simple;
	bh=J1mvWJW2oCBok8Riaab8tqKELNru6gCS/PJVbbJOYS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h65RQAh3tgHS6yqOvpzFSBc/V0+/88D9ij4JfQwqYwsk0DpnmovrpomqaK7rhu3gsl2+4oGlpRJCWx+AxXN0Kt1296PcAMVS7NaJIJKQegya1TE2FcXK964SCRaY20nRQ+AVok991IQiu7HeZKcZ8O1/fgmsKExJ3FapNFWCZRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94de664b541so1285126241.1
        for <workflows@vger.kernel.org>; Mon, 11 May 2026 04:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499667; x=1779104467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C22/kjYSfB+yUgZZw3ZuBJFKG5aBQVepFgZk32x5tBE=;
        b=o7CeSScaAyBZLSD/4Z1Ws5thxXi3p55NOYSrrX5JKsvmfTBwmvK4D4miE0dqh/9Vbf
         4kwn0FF9ldTV2N6ypajVm8LrNgGs6AkBRKTLRQ90B2WNmKlVnwJl3Lc+0rHzpBYQ/0oh
         TBld07Sb7++xBer3yxv+gw/Z/QLLHeFxmEbhN5G69MRLLbRFxIm4sOFDPOsHBZQT+h/t
         SVRvbemvZlJeV3e99E+lbQ+FHRrYXM3ZelJh0k2b7PJUVmTbCC2C3QGvKrnMy4l2GWG7
         LV7DYUt/HTdayIG7/yUR52Ey+O9BhxlEQDgc8u6S8+rsiYJSSAtR6/kkXJeA05l8cH80
         sPQg==
X-Forwarded-Encrypted: i=1; AFNElJ+RKGOVTtgeEdXXdpcHMln1mpf9qScoXoj15oe3DO+1Hep36xAa22dPkjzvvoZGwbR+IipAiRX0wkY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2WyfBFNxu5PW9oT2UrcEPTf15Iyg0ZTF29kAm+6COzMbTu3VE
	m8wap86LtjxF7wUqH45b7knv3Q4nmVAkwbh4YmoX3xznSebNIVKbh8FrlsAuMP80
X-Gm-Gg: Acq92OGNqGYW1qm0IoXU9XDqgir7sZfxQAH7JruZzFebbBMisuKprFaPQgp88u2nIUE
	XDK6wuHOhZLylerasMvpwNcIgpKvsj0X1K5GH2cAdI4Us1+ykLSeuMO3MIFoWILHc/+HU40UWTC
	rdRUML5iqmYwSKMi02Gf3zav22GnMmL7fN7x1JlAk0kufxyrBvcIrOv9SVAvGbpddYpDmwT0hWY
	lIxYw3x2LHW+pGZ9nkGP+GywH76awt8Oul/lHu4ItZ/NbHmMqv8VsG2xYudjo1mihGe54zZrhYY
	619bCWCAGBz/OusxI4vBT857rrACdsPb2TucoigYu9dkAKU8fJGdl6OCu691LmHZH0Y7MoagrUp
	JoGMufw7o+ezDYe40dbf2ZBEiJYXAyH/0hRZfXTG0VnbH11A8Qv0ZODnZVl8v1ZxxPZ77NhWBBC
	lNazjCqjFxcbHl3I8izcyvGfsu70P5qYzgtbTOwx/21IKkaMpqljxJFpkGn7lJ0NmY5+svWTI=
X-Received: by 2002:a05:6102:809c:b0:631:3b92:9d9f with SMTP id ada2fe7eead31-6313b92abc7mr5876338137.23.1778499667582;
        Mon, 11 May 2026 04:41:07 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f219c78f9sm5118685241.1.2026.05.11.04.41.06
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 04:41:06 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-63124a80693so1362398137.3
        for <workflows@vger.kernel.org>; Mon, 11 May 2026 04:41:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ92SzupRYSnniJCl+QVh30+cMzDRD6S8QQd9xl+z9RvAYJl/zRlz3o20lTOpJLzazaPlxN6w/FtDp8=@vger.kernel.org
X-Received: by 2002:a05:6102:809c:b0:631:3b92:9d9f with SMTP id
 ada2fe7eead31-6313b92abc7mr5876321137.23.1778499666060; Mon, 11 May 2026
 04:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510164907.57176-2-manuelebner@mailbox.org> <20260510165159.57457-2-manuelebner@mailbox.org>
In-Reply-To: <20260510165159.57457-2-manuelebner@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 13:40:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWchXXcMyShiMZrhFTrHoB-TcKQEBcRoCTJFpwJsxxdhg@mail.gmail.com>
X-Gm-Features: AVHnY4KiXj1yHPwMyogp79HByon-acSWkydfvm9oUlpH2lGIbbScMPZbFEOzbds
Message-ID: <CAMuHMdWchXXcMyShiMZrhFTrHoB-TcKQEBcRoCTJFpwJsxxdhg@mail.gmail.com>
Subject: Re: [PATCH 1/2] [PATCH 1/2] Doc: deprecated.rst: add strlcat()
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: andy.shevchenko@gmail.com, apw@canonical.com, corbet@lwn.net, 
	dwaipayanray1@gmail.com, joe@perches.com, kees@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lukas.bulwahn@gmail.com, skhan@linuxfoundation.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manuel,

On Sun, 10 May 2026 at 18:52, Manuel Ebner <manuelebner@mailbox.org> wrote:
> add strlcat and alternatives

Thanks for your patch!

> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -162,6 +162,12 @@ if a source string is not NUL-terminated. The safe replacement is strscpy(),
>  though care must be given to any cases where the return value of strlcpy()
>  is used, since strscpy() will return negative errno values when it truncates.
>
> +strlcat()
> +---------
> +strlcat() must re-scan the destination string from the beginning on each
> +call (O(n^2) behavior). Alternatives are seq_buf_puts(), seq_buf_printf(),
> +snprintf() and scnprintf()

The last two not only require the caller to keep track of the offset
in the buffer, but also using "%s" when storing passed strings.

I hope we won't see mindless conversions lacking the "%s",
introducing new security issues:

    -strlcat(buf, s, size);
    +scnprintf(buf + off, size - off, s);

> +
>  %p format specifier
>  -------------------
>  Traditionally, using "%p" in format strings would lead to regular address

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

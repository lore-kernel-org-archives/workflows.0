Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695DC28E16
	for <workflows@vger.kernel.org>; Fri, 22 Dec 2023 18:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3bb6ed2b913so1612708b6e.2
        for <workflows@vger.kernel.org>; Fri, 22 Dec 2023 10:21:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703269316; x=1703874116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tywb/k7MV49ZDNzLyU+9prKsXBV9AzKJkeR9ldE3ugY=;
        b=XMCzpVv9lcuqP2NtuJoOp3qnk/p3n6EY8GX/spchFHVQzR4f0/osJ20e/YXrpzsdZV
         9j2unk0YJiv6rcm7Xq0jZ/CdNj7M9hKkaDZUQL2QDPNVGn+dGKJ+xf76VtxbGUzArlVJ
         udo0PvJMexKj6Pth9L2HiH6k9fm0LXh+R139vZsH0WUcivVQG5FouyGdn72v0D+vz8kK
         2eeAgWAdX76rojWSNAZJWYhrPKSn6JT9B0+DwccPOe0iJqrhglBC8o6XO1aY7lZLNgYm
         9bccDNUwTX98sI9+72ZfBWliTkG0p62h6ZGsnCF1cccl0WyyOw7ZfUV+lXUBkjD5GyVH
         F3bA==
X-Gm-Message-State: AOJu0YzPgWep6mbVcIcetpYCGlZVGoK0GCgHKXqtdZcw4Q9HMixufgkR
	W5gnPxc4FjW0yr4h5AHqyfK6YNlC1MLfRA==
X-Google-Smtp-Source: AGHT+IHF5Na1mq+Xz6d40lgT1JBJxTEJvXEPf9UvlW6fxEzOKM3yqyZ+lCz7Mubq7ufTHJdJPBOFoQ==
X-Received: by 2002:a05:6808:6487:b0:3ae:16b6:6338 with SMTP id fh7-20020a056808648700b003ae16b66338mr1949715oib.3.1703269316296;
        Fri, 22 Dec 2023 10:21:56 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id p139-20020a25d891000000b00d9cbf2aabc6sm1703815ybg.14.2023.12.22.10.21.55
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 10:21:56 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dbd73ac40ecso1937810276.1
        for <workflows@vger.kernel.org>; Fri, 22 Dec 2023 10:21:55 -0800 (PST)
X-Received: by 2002:a81:5403:0:b0:5de:8547:a6a5 with SMTP id
 i3-20020a815403000000b005de8547a6a5mr1613474ywb.70.1703269315456; Fri, 22 Dec
 2023 10:21:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231221112533.5259-4-alx@kernel.org>
In-Reply-To: <20231221112533.5259-4-alx@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Dec 2023 19:21:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXO58KyZF2TuUaS-HrK6ry2ARHtDntbGT86YQTwieXs4Q@mail.gmail.com>
Message-ID: <CAMuHMdXO58KyZF2TuUaS-HrK6ry2ARHtDntbGT86YQTwieXs4Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS, docs/process/howto: Update man-pages' maintainer
To: Alejandro Colomar <alx@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, 
	=?UTF-8?Q?Ahelenia_Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alejandro,

On Thu, Dec 21, 2023 at 12:27=E2=80=AFPM Alejandro Colomar <alx@kernel.org>=
 wrote:
> Michael retired from maintaining the Linux man-pages project in 2021.
> See commit 06e72cb19c74d3b1d661609c698ee26d7b6e4d7e ("CONTRIBUTING,
> README, lsm: Remove mtk as maintainer") in the Linux man-pages
> repository.
>
> Reported-by: Ahelenia Ziemia=C5=84ska <nabijaczleweli@nabijaczleweli.xyz>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>

Thanks for your patch!

> ---
>  Documentation/process/howto.rst | 3 +--
>  MAINTAINERS                     | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)

I think Michael deserves an entry in CREDITS.

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12745,7 +12745,7 @@ F:      drivers/mailbox/arm_mhuv2.c
>  F:     include/linux/mailbox/arm_mhuv2_message.h
>
>  MAN-PAGES: MANUAL PAGES FOR LINUX -- Sections 2, 3, 4, 5, and 7
> -M:     Michael Kerrisk <mtk.manpages@gmail.com>
> +M:     Alejandro Colomar <alx@kernel.org>
>  L:     linux-man@vger.kernel.org
>  S:     Maintained
>  W:     http://www.kernel.org/doc/man-pages

This page links to https://www.kernel.org/doc/man-pages/maintaining.html,
which needs an update, too.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

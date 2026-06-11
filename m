Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE84370D52
	for <workflows@vger.kernel.org>; Thu, 11 Jun 2026 08:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164914; cv=none; b=kUovTat4o1uBVHw3JBSCaUdQVc//rMe+++dcmqKrxXvJ4Nz+H6UUGcoHYL/IuW6UkOgqEcWRMZ6vxTnjDlHLCHcudvRgy+xB0ET/qgX3r8oCQkd0ZobvPu5kAcErsWepyDm/oH1jX9pMR1qhwH/i783rXxu3wWSpKmvczuKG8PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164914; c=relaxed/simple;
	bh=jSMxOhDU8zVnFnk8me8GJwE6z7sdluDZVTn7lZPrqGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cp+lY3tdrZQ8AxRqkjhdX4TpV0pNKCLWtgtmlIMLYPv5hxiU7DrwqrcMOYR8i81hIe618cixJ023SR0+twacgnUo9+Rpz5nU+dk504xu2OUxv3nehuWleWVdpraFKyifHVEtXDF7ptbu907bJs+FAKzlNv9UxNggQr8B7fY8mOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-59ebb89109aso5055224e0c.1
        for <workflows@vger.kernel.org>; Thu, 11 Jun 2026 01:01:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164912; x=1781769712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60RbendQYft/sNgfb1Bs6AggE3FT/n1bmhTOtIuhojs=;
        b=oPSD41ZSFGUWRFMt5wi+sR6OYJAdwcsKmojBZBblUOaeRF4ek4p3WqmgS0QWvw08jq
         /atF1J9Qn91SUlQ08Jt1oCYTaYWsjV3jxBy2Jji43nX3dPiPs2fhES8lqFH19Au4Cv7C
         Kf9X/GBF2hFxykrx2999FgtPn2SwTORkcC4MRqYWE8OzpqdATvbXBuJ5Kdj2RrSUgFwc
         bh4tQ1Fs5p5ct3XFfV+DimJCnrojG3FjxypLERMdu9/9MCSZ88Mem70QRREXqNDfMhe7
         +oPm6w+ZYuMkWlnBMm0ZF/9eR0VNkLRfjbkBtcDReedIhkyeO2UkWEmHrmfXKo4523BV
         vckA==
X-Forwarded-Encrypted: i=1; AFNElJ/BizqQX1I5aW9v/Za30IqsPyRz+QmPFo5KuBjfeXpLKKblWiXqCSFPpn1GiCOgqEKgwJhNWIu88ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC1q364NrbgN33Bm7NSGxUSr7i9AL1ibmDflpMqzC0PD4RaSK1
	2Kq4gjvZNPYcR5L7TXSFDaZwdn3wIwvwJYtOZoBpXyBbdEAVTx7h9XRmf0MO1+kWIU0=
X-Gm-Gg: Acq92OESJspCtTEx/trQfWFW1mw3lrFnm39Zw7yNfuUHEzPjuHemo1MjxyObPtUFX3F
	43zsARz2GJ6Selu5WyxPLS6bpPbnkjlVqJE0Pm7YJNqD2m7APnRh3mUT38nLQD9BCrGOzFKXvfk
	xOR4J+H8Dwv1BeUuor6Km42zrsa8DqA/+C+XjYn7KC6aBfqBLUcjj+JuuBYXNThgrCWMYg4xobb
	zxRQnXS7DKCQg8xqpwUnWO+Wu85H/Phr3XBK3vDv6tXXbRlFWRsbJl505UsQAwX+eSRdRPP0dZL
	jEggAVCMh+mHGy/eTQt7TsehOcOgRUN6DzK7NPEYg+DPOLeAl0jsY3vGhFQF0sokdK0krxaLs8M
	LEpZHoJxyYBP4FcXGjgmvBICBCgV3kfm8fvso3A/xYtr+SG0lBhzvyxLrqVt8hWoslaj2lIdo9y
	z4xhvXBpQX1x4x9EVQgQes6aYSIOKNBWiSOEJS1gnuYMeN6YABEpMsYW3v19QWK9Qdw3mlNTlma
	98=
X-Received: by 2002:a05:6122:16a2:b0:56b:579c:82e with SMTP id 71dfb90a1353d-5bb002bb79bmr489922e0c.5.1781164912263;
        Thu, 11 Jun 2026 01:01:52 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb06a96fc9sm799391e0c.1.2026.06.11.01.01.51
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:01:51 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59ebb89109aso5055210e0c.1
        for <workflows@vger.kernel.org>; Thu, 11 Jun 2026 01:01:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9120IxjzK+R2bvXTbXjtB86WQKJ4kotVdy3xN/9tacZaF2OIMQ+9RzB4MbkE6PzhtcZJ1tZW+NvbE=@vger.kernel.org
X-Received: by 2002:a05:6122:3122:b0:55b:d85:5073 with SMTP id
 71dfb90a1353d-5bb001ba5e4mr521214e0c.4.1781164911136; Thu, 11 Jun 2026
 01:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611064311.117023-2-manuelebner@mailbox.org>
In-Reply-To: <20260611064311.117023-2-manuelebner@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jun 2026 10:01:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX4VDS-ZWBANpZy0S58tRTbeGNUrqTLuTmM5y1mz=JQDg@mail.gmail.com>
X-Gm-Features: AVVi8Cd8S_bg0KDtLSPgvAoO5y-R6PyIxq-9ujefOKwFWzNe4lJGKujrXnVSGpE
Message-ID: <CAMuHMdX4VDS-ZWBANpZy0S58tRTbeGNUrqTLuTmM5y1mz=JQDg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: process: fix brackets
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Kees Cook <kees@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

CC kees, krzk

On Thu, 11 Jun 2026 at 08:43, Manuel Ebner <manuelebner@mailbox.org> wrote:
>
> Fix missing ')' and needless ')'
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> This is the first patch of a 'series', but I won't send them together
> because I'm still producing the patches and it will take me a couple weeks.
>  Documentation/process/deprecated.rst     | 2 +-
>  Documentation/process/maintainer-soc.rst | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index ac75b7ecac47..03de71f654c7 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -388,7 +388,7 @@ allocations. For example, these open coded assignments::
>         ptr = kmalloc_array(count, sizeof(*ptr), gfp);
>         ptr = kcalloc(count, sizeof(*ptr), gfp);
>         ptr = kmalloc(struct_size(ptr, flex_member, count), gfp);
> -       ptr = kmalloc(sizeof(struct foo, gfp);
> +       ptr = kmalloc(sizeof(struct foo), gfp);
>
>  become, respectively::
>
> diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
> index a3a90a7d4c68..fa91dfc53783 100644
> --- a/Documentation/process/maintainer-soc.rst
> +++ b/Documentation/process/maintainer-soc.rst
> @@ -60,7 +60,7 @@ All typical platform related patches should be sent via SoC submaintainers
>  shared defconfigs. Note that scripts/get_maintainer.pl might not provide
>  correct addresses for the shared defconfig, so ignore its output and manually
>  create CC-list based on MAINTAINERS file or use something like
> -``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
> +``scripts/get_maintainer.pl -f drivers/soc/FOO/``.
>
>  Submitting Patches to the Main SoC Maintainers
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

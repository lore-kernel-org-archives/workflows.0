Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016F43E558F
	for <workflows@vger.kernel.org>; Fri, 15 May 2026 07:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829788; cv=none; b=cWmJ/jDOtJHzh/4RhGx8ZywhFcUjUo0N4RhIagWzlNLnudQjLYxskSsdnx7BpQcjQQbqmMw3RKnfKvK4XScnJul3wLbdeptulD+g48NribqSCacGg8xmbMmDidHvj7R9GqnKEytpXdjx0xB3KgaPYkkciWr67d1jPXROwjU6d0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829788; c=relaxed/simple;
	bh=WDXBiiLRQ+cnIkPtBFai4dV2XY4iQ3MbFINXL6aaFZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEWXXHtg9zqGCVORKVMdB3dvfHHhTmrsdVfUrKZbgfxs74tSooOL+fnH3LzqL3whtHbOygd7IMPyNT0wERFNt1nqnbOTwubReTRvnlcLohahxmIBkn47s1Jjn0SjJrZnxu+DBrSXdX1Zqku1b/rRKHTVTwg4EvxrlMDqXQ+BflU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56739adfa1aso5924847e0c.0
        for <workflows@vger.kernel.org>; Fri, 15 May 2026 00:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778829786; x=1779434586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQ5RBOWsy2pjrWMr0RMv9fap7/8a0cVfFC6ukoDY6tk=;
        b=QTrha6ufIT1qc7knWwOzFyr3K7uJW2y5tEcXMZIN12SKxCp58wzPmqKfQKD4TWwOr6
         2egmisQkZtRhD6pGJpXw0q0bMMX0QoPcSSi+De7a1fXdjbHo4E1J7BCSJpkP+ZH5E1wI
         ajeaIkPLjo4IYsgLD5Djzp3gx+2YNw2Oua2NWh5RKkC/FWnpz7fH57yNPCLMjP/Q18ie
         7dNcA08djTxc4K+2je0osux0VLHQWSzpGz5Tua6+zbT0KvKWZCUcQY2pMGVjq88i1ku3
         3+llW3MGneIeFZBBM6SJ3H8BQrOQADRtFfK3rHugYWqhMJ3ylIYo7yeM5FlxtwQ4xZa5
         PBjA==
X-Forwarded-Encrypted: i=1; AFNElJ8vkJcF5zCv2GlPzVRA+zVxOFeXWGSbHBcsbOrxrBjdjM0uHIRiZTyjCeMagYtHN13dIOHrXYsc1hU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHRRs+taC8+3HaYP5YL1XjNlexGLjpjSRQN+YmDNBIbEvwsbqi
	QoACjdYVBbq5pp60YkaIe2J2sP0pGeEs26kE6fbsn30MwAfblVlytQ8U8p17fhNd
X-Gm-Gg: Acq92OHQ5rMiIMQw0HBrn13LGut609EWZpxftt5XwRDggCRNTpQ3tN56EJWPDJ5FPGq
	2ECVY+/XmNRAeorGsn7TSz1of5+HLurO9iBUh4kyprMA7PraNZGosrZvUITctTbQSqE3RuJBrcn
	AU9fZnCbKj+DciybbI1Cp1YRHVm5KKcsFskGgxoPXD35896nNQqj3jX/hkimxLCic4uxwuoWjUw
	ngadPAG8R375nNeoA9gihsE7OjypzPA1m4Hne4dkZYdSXcDJJiZeDF4ggrjvYpeUlKjmhi0/Bwv
	qWGG5GB5Gmaw/90uip5yHPoIQCodKmfra51ZWKlMAUG5+OlvAgvMt/ziECRdS0bCBY5kCevGBDe
	6VS8YVx3rmBPB3YFQkkiTT+lEAguhTMvq9ZbIEOggN1Vc9DpOyO/roBWMPAvVObbjAR1BLyl2Yv
	b8CAWTkKmqurFLQISoc3iIdqCXZ4MUxXZQZ0T5YEd9OLHEumozPXLM8Ns7YVMu
X-Received: by 2002:a05:6122:224:b0:56b:815c:961d with SMTP id 71dfb90a1353d-5760bfebc46mr1608324e0c.5.1778829785870;
        Fri, 15 May 2026 00:23:05 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760fafd4casm845775e0c.18.2026.05.15.00.23.05
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:23:05 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-63127c440ccso5406356137.3
        for <workflows@vger.kernel.org>; Fri, 15 May 2026 00:23:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8445Ptki5+7p8cVeyKohYvLHRpRrz1G5G8wTjUynrn/wW8ZBUoWaOd0qjK/5ZAdbdzaq0ZpyVAYlI=@vger.kernel.org
X-Received: by 2002:a67:e70b:0:b0:62f:46be:8318 with SMTP id
 ada2fe7eead31-63a3cc0e937mr1352640137.6.1778829785291; Fri, 15 May 2026
 00:23:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org> <20260514163033.108009-2-manuelebner@mailbox.org>
In-Reply-To: <20260514163033.108009-2-manuelebner@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 09:22:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
X-Gm-Features: AVHnY4LGl4P6WNOMa9bDezqn485AYzWDM-crQmUPyotGmG4vZndSGxZ0L9rGxs8
Message-ID: <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	David Laight <david.laight.linux@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Manuel,

On Thu, 14 May 2026 at 18:32, Manuel Ebner <manuelebner@mailbox.org> wrote:
> add kernel-doc comment to strlcat() function definitions
>
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Thanks for your patch!

> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -249,6 +249,17 @@ EXPORT_SYMBOL(strncat);
>  #endif
>
>  #ifndef __HAVE_ARCH_STRLCAT
> +/**
> + * strlcat - Append a string to an existing string
> + *
> + * @dest: pointer to %NUL-terminated string to append to
> + * @src: pointer to %NUL-terminated string to append from
> + * @count: Maximum bytes available in @dest
> + *

Missing "Returns ...".

> + * Do not use this function. Prefer building the string with
> + * formatting, via scnprintf(), seq_buf, or similar.
> + *
> + */
>  size_t strlcat(char *dest, const char *src, size_t count)
>  {
>         size_t dsize = strlen(dest);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

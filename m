Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A68936BCCA
	for <workflows@vger.kernel.org>; Wed, 22 Apr 2026 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776842077; cv=none; b=PedIdC3X1PflwJDRQ22qQeeLkyr/KAmNVVmJB+HxZ0z7Kdxnga5Xp4YNQMJ8VWACn+Ze/QnCuAyUHfgt56tr61/mRIpo7YHOLLpjLaSJwqSFLk/3AB3tvpo6nXYyVZ52Pafa15BTlsIRI49UgqVBgVMwWg+58y0RmPa1BFdaspo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776842077; c=relaxed/simple;
	bh=AbzpDKzpLYQIZR15eURcndnlfeJe1EZuRfwEYj2NPqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edF3KVUd5QP3fGXnju6lc4qPeAdsjNpEo+4jOaUzDgSk2ZwH69Cl9N6tVEoe2Cl33OKvIpFizjoJbL47lkCD+wUAlSCgMdglR7LMmErDYR8TeaDdzC/XnkKk6Z5fzNj1avnlhaFGDHS/UslJhw9cax8OicF/oNvqeLa2bUeleto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6120528b8b4so1510436137.0
        for <workflows@vger.kernel.org>; Wed, 22 Apr 2026 00:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776842075; x=1777446875;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmC7oEX4WOhO7INFTkL7vh68afbkhaCccrhJH6rlX5E=;
        b=E54O8vaAo7QzqLofCIxWrBS9f3TliUZHxEXPftqbE/ruORS/NSIGvfb/Vo1IdcypJM
         om4teaOdrPjyX3rFny8Wug18AvVkO+0wNS22XTN+3pEQkpx0zSHyq+WEMTUlWTTdG/br
         JQDjRfTrKBZQLzNHYGRWHOYpMfMisFoHcSWnuDClqmnPc/GrIYg/34vaWSiY4qCaWOHS
         7QYshxucDeUCdUkJmTq0v9kcPOKPITjYpXAkkxKXwKartKrc53eFOaV4/BR1PIdg+Oq7
         SAnl9sPBcbkYHMYIpLdZjgztrJw6/pliaBOiLLE+KgCfztGrkTeNc+jfZ7As1PhPjpg9
         7sig==
X-Forwarded-Encrypted: i=1; AFNElJ/uQMktNTLc2Fj9vhTHhzUXWHh4r60sqCW9VoQA+ZVAZNDAe1man9YbOOiv9k/UHAYyYLZrrELtu7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc5OzpE/LFSDw98o7Ke3NLyecX8mDGvpBwnHSg6axVIqhckVtS
	ueAKKOAY43HiU/igxXtLS+7G0KWlUUk4SsPjcnzvabuA8qu/aeij5aUy5CUtmZ5EVbc=
X-Gm-Gg: AeBDietlx4Er5cowZpCMvKehDjhYcybQFGszmgZIY0SZwJSSVONw4iul50EW1uXW7Vx
	9hD3gNVSOJUgEQYfYYhvePmwDfI8a3U6nIP5byqOBBhMwX64VhFFXRGV1nXDa/EVVsMOCiM++Rn
	o/vCIZU6OTXXdSTZdlqFyrwR3QhxYlm0jFGxdN6c07mU4pwnQFLvxyIcaviR/PHPCgPrhSWtDo5
	enVgNuMUaAuHZbDTpOTVtmM7l+EfqlWiHmFwWSWyfUlepAGt6OBgd4edVzNnoo1w1xcOPEPosqd
	Z8F5hU7QXUVgsiKNywV1injV3Fc587XSttUxkTy/qoauiqklZcC2nWqxsDOrePETjJPbhvoAnLR
	T4XfqBdb0y/8+JtNw3kPPRzt0Pkyc8UvuWlDQaA3JhGpBfLNXuoRnHbn4VAmblwQirROCSOy7Of
	Y4g6aXu0KHwT1fUetPo/PfL2zF/kRnva1cf8Qksl7A7DwFl/TxMHzCtwliFV3A9o8f1HOnIMSmc
	oI=
X-Received: by 2002:a05:6102:26c3:b0:60a:9cac:d286 with SMTP id ada2fe7eead31-616f4f7be9cmr9426797137.12.1776842075493;
        Wed, 22 Apr 2026 00:14:35 -0700 (PDT)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95890bc746bsm7567975241.8.2026.04.22.00.14.34
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 00:14:35 -0700 (PDT)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56f79717413so1521939e0c.2
        for <workflows@vger.kernel.org>; Wed, 22 Apr 2026 00:14:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8dhSn9obL3imIXgizln8W0CGkBDJD6vgYFjMDsoyU4+28GJr8LEwJmZCK61LSiZOXtzqs5THywalo=@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:608:6b33:5bdc with SMTP id
 ada2fe7eead31-616f4b542a0mr8946296137.7.1776842074572; Wed, 22 Apr 2026
 00:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421175516.224960-2-manuelebner@mailbox.org> <20260421180902.225560-2-manuelebner@mailbox.org>
In-Reply-To: <20260421180902.225560-2-manuelebner@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV70GhNsxPiuhY92seZRMkr6jk9eFCke7shc08GYerLpg@mail.gmail.com>
X-Gm-Features: AQROBzAo_jIuXmlZfjuZHOt5CL-8nlD60dqKXL2GlBfrNb8xjB9gDFy88OEvZac
Message-ID: <CAMuHMdV70GhNsxPiuhY92seZRMkr6jk9eFCke7shc08GYerLpg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] Documentation: deprecated.rst: kmalloc-family:
 mark argument as optional
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Manuel,

Thanks for your patch!

On Tue, 21 Apr 2026 at 20:09, Manuel Ebner <manuelebner@mailbox.org> wrote:
> put the optional argument (gfp) in square brackets
>
> eg. ptr = kmalloc_obj(*ptr, gfp);
>  -> ptr = kmalloc_obj(*ptr, [gfp]);

Shouldn't that be "[, gfp]", e.g.

    kmalloc_obj(*ptr [, gfp]);

everywhere?

> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

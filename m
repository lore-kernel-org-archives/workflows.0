Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121B73254B9
	for <workflows@vger.kernel.org>; Tue,  4 Nov 2025 13:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762262951; cv=none; b=SY5CIMZPV2hxe2JMbfUgSr3c/OWvVEHde7afdKpx9FgmdAC7Oppfq6VvICq2lEZNxDv4Q2X1zfMnfeE31VKMKoe5KeZW7K5EFMqrg+aM/DGV6Dp0ZEVmrD3qiPqUt3KSGTjHc0rxF+x+yICPE+B8LmWUbgoHqwjbnmH9kswL5n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762262951; c=relaxed/simple;
	bh=jz4XbMEhT14ABokNLSyNocUWmIjvQFrqSNdxYOhl118=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pr/3KNLXHxdwgf+wOiTf069Dz0KHNR9+1mz83vDYk/ens/8fA21f6t47bXHd1CoJok1xai2uoDJfSY8y68SmLZfel7y4Bznx6q6ZAMgjBmcQkWphqb0rEIynIOikvcs4hdeiR0Yi/AJXPJ6H9JGeNspyBdUhY0s5n/8oncvNKUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-557a56aa93fso655559e0c.3
        for <workflows@vger.kernel.org>; Tue, 04 Nov 2025 05:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762262948; x=1762867748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYDUlHzikfVS+CmiS/PszA+brPtjo5Wdl3Z2oI+5wg4=;
        b=j9dCmuSmYB+dcCNKE/ZwefNKnhqAvbYiXhGALt202NyRejba0NcaFOOyhObyQGANLa
         QUKTCPpaKdPhRO0czDnfTusBfs84SPuWhqzViFiPdW68aqcZiL6Q4X4x7fH68MpTNwZP
         7EQx6grPbUtyaKum06TBxhT/qp1FyfaYLfgmURuOP8BnqKmC/A7c8be8ecLYP4NEuqc6
         F8M6qlZJq/QWVXxnEtQJn2gV67Dbuw2JFEM1hL53dzVIYxzzDrQwTStwORKgabBmXza6
         38wMwcrKgrvPLPDY8rzKKPPtDoVilq0yovmdA9EfsYX2PGNTIb+46+hiV5Noj2gZ4Mgn
         8F6A==
X-Forwarded-Encrypted: i=1; AJvYcCWx57oQcBMUlbCufsDdxZ5dJW/iPlmOgbmceyvYtfXE4yCfJIKPaQnlgL80iFZHh7T4hcwcr2cFgAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI6kGuSAGX7yWT7hASzizuTOC+c6plyegyDCF62H75V+NO5OQB
	SanqYS0yylPDKYmnpGzn+TyMqETw0LMXpqcw46pGiQ2QQNkk09lkyfSY/L+ji1hR
X-Gm-Gg: ASbGncuNuD+Y72vKV90D3jcU51mtWdAogC63t4CMem1vvnjjQFrgaoRAotp25wC+neg
	uWZfiXeXsydYB5I6EVb/ZvT/nJIJAT4sdNMRsqQaGl3ENumyYCaRMCXW+TjzyAJ18n+RZvNCMS2
	ERbXJeRUu74RYlDwyyH0xjskl8Q+7FYio/SUXsUCYoRwg713khlU9FubwhJS+Cb/KyFMXvcgDww
	odFZiT0zANIQG7fogswZ6HPrQoTmW3Zet5MB5V+kdaCquAuWiZZqJJZ7FaKYAf0OtKGVh/9gu8M
	4xPEqM+ab8AqmOREOvqYJt1Qxk8nHiYwghldI+9XoGf/0jJ5hOlIHkjclJYOI7a2czXH1OeijRO
	ZmN9TCYOVq5QUhVvmXpxAzfS6BT5zibBwAgJ34jGBF3J6n47eCb843YtFo3NTVe8JQlCSW+JID6
	sgAPGWAij/M4MYZhlhMllYpNhIJ/3nFk9M9+qqSEsuNrNUb+s1fJTP
X-Google-Smtp-Source: AGHT+IEY17OXJD45hbL29F0yQUXQoOXy9aZNaRR+7WJg9JlephSSW6AOiEzPUmBSFLqMSuFYhTOVsw==
X-Received: by 2002:a05:6102:f06:b0:5db:e909:aa0d with SMTP id ada2fe7eead31-5dbe909adcamr1999551137.37.1762262947621;
        Tue, 04 Nov 2025 05:29:07 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93542852924sm1133163241.0.2025.11.04.05.29.05
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 05:29:06 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54a86cc950dso983786e0c.2
        for <workflows@vger.kernel.org>; Tue, 04 Nov 2025 05:29:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5ulDPF1WD131E9yZ2xIcWjqq8yg+WWh2cxaIaqHo3IUT69GV36UpPY/TpqkJrlA3ZODl0apYE1O4=@vger.kernel.org
X-Received: by 2002:a05:6102:4409:b0:5db:ecdd:1819 with SMTP id
 ada2fe7eead31-5dbecdd1f41mr1520007137.4.1762262945679; Tue, 04 Nov 2025
 05:29:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104-aheev-checkpatch-uninitialized-free-v3-1-d94ccef4917a@gmail.com>
In-Reply-To: <20251104-aheev-checkpatch-uninitialized-free-v3-1-d94ccef4917a@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Nov 2025 14:28:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+12MoAGNHC9kf==Bt0cLuJ39Fs+W61DN67sE_p-u=og@mail.gmail.com>
X-Gm-Features: AWmQ_blcNEGb9JhXjFZhCY93PMFoseFIULDniUnWfKSfhj8iZuZ5UaoNxtqoLrc
Message-ID: <CAMuHMdV+12MoAGNHC9kf==Bt0cLuJ39Fs+W61DN67sE_p-u=og@mail.gmail.com>
Subject: Re: [PATCH RESEND v3] checkpatch: add uninitialized pointer with
 __free attribute check
To: Ally Heev <allyheev@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
	David Hunter <david.hunter.linux@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-pm <linux-pm@vger.kernel.org>, dan.j.williams@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Ally,

On Tue, 4 Nov 2025 at 10:58, Ally Heev <allyheev@gmail.com> wrote:
> uninitialized pointers with __free attribute can cause undefined
> behaviour as the memory allocated to the pointer is freed
> automatically when the pointer goes out of scope.
> add check in checkpatch to detect such issues
>
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Link: https://lore.kernel.org/all/8a4c0b43-cf63-400d-b33d-d9c447b7e0b9@suswa.mountain/
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Ally Heev <allyheev@gmail.com>

Thanks for your patch!

> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -1009,6 +1009,11 @@ Functions and Variables
>
>        return bar;
>
> +  **UNINITIALIZED_PTR_WITH_FREE**
> +    Pointers with __free attribute should be initialized. Not doing so
> +    may lead to undefined behavior as the memory allocated (garbage,
> +    in case not initialized) to the pointer is freed automatically
> +    when the pointer goes out of scope.

I think this is misleading, and can be improved: if the pointer is
uninitialized, no memory was allocated?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFB73D9DC1
	for <workflows@vger.kernel.org>; Tue,  7 Jul 2026 10:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783418517; cv=none; b=e20U/bnjhqSaTHztIwRlgLFgQwoKvNPSPrjXIksite4cT4Nf/ofakeV9NigFOZ5pn0CyWNPowE3FpMkH180+iTfaAcYZsRX9aODKo06RYfBVRskYVpisjagCPwsNx57B742YPehgkkstVVqce+M7pqrM48mi1YWnPWBB24tPT1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783418517; c=relaxed/simple;
	bh=7r4FNXz3y2SeMtN857p6fIJ0YRE5//VC9c/D4GkSxkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4+gsXk6Uw3HGppjXhiNalfryxdpjpEEh8RsVsArLkNIZW7BXaN9smdTNapjiEyyoh1gPjeJ/EQNJ4XWqRL9euBDdtUKceMQ7X6KHemQmzj93iLoZOwQUC8iJL/Fx2eiqEP9/W5nzoOVMENJAcXV1mPZhdIS1I8iotddU0d7HlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bdc4fc26bfso296228e0c.0
        for <workflows@vger.kernel.org>; Tue, 07 Jul 2026 03:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783418514; x=1784023314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/8oL4ZxZEt7wgfC7AXxJt5fFWTGlq2rIUB5JaRFMzY=;
        b=MRHu2QsathY+je66/JRYmu85horjGnpKxFELwqc6Qlvh/ofrKD+cLggmJm7E5noZvS
         RMP0t4yMzsTU1ceiLe3W62JitrAcP5ZwmoDudekeuHUysE4x+YTe0hXdgJBmFwFMuFLL
         gZ8PC/+f+xEoqiKRRVgpRqC//m6XSNe3icXsE4qFCvWsJmwWz1mZD2Iy4kzg2O7vb7vO
         SyXk7vyzd9tjvjitvS4MOfpFWXKjeLNokaNJWwQXV6ETBRKhUF6lKbk3hze0/0Yo1hW4
         o1zklx5hZ95cR173KSdFeWWm4+LbTDZtTVbd50dJNUkS0vTSXWFstSP8OciFZJHEbWY9
         6K2A==
X-Forwarded-Encrypted: i=1; AHgh+RpLJ9+f2jwfeYA8021HMA8fJGn/rF3GdD3W2jzfHrFs/kAlrUcKLne+0gilNY3YN+1oQUU8sposYqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbVLHSYX/WrgIwo5gTTqoLF5ASYoD+A9fW7pVmC66GTVPK+Ufr
	6ABEY7AscuSBtFEhDJYoZM4Lw5iND8LR4ZV5I3V/WRE6qVyxAXuOYJs5kErUhAcO
X-Gm-Gg: AfdE7cmL2COsM5qzI2NNtgLHXsUtwU1Sm/fJLl4u5b31ifPyv6Msh0fT6j3aRB0pvUD
	YbfRy0oUYhyMkD0O1GPUpXsSC/SypNdgJw5EOGg54vKKDA7LbAmzBm7swTMfxFHSycYeQYgDMC4
	4L8DNeSwY7NgeLBxniUv8VcCKtIJvO95zUzKDQHunlrACDrUCCisxZRhlqsKNL8baO4DXrdG6yG
	ROSpP7kYV77M8ZJ9V5l6zoBFAloxknjGcK06FqXIknNABdtxafvF2EdyFDp9U+flMvIgAs6IdWq
	s2pUnkVwJUwNFyl1BMkAl8QCokA42uTqGNnCxhcykld2IMVm0iIz66ly69UINM20pYqdW73rEST
	kmU6yvo/8gbn5VI7HVsnnM65a4pxY930l0zlBIgEHwzRAgvhPvl/ItNrdsPsJ2laRBvO8G1AfTA
	h1rFSfjgWJwF6GWFvwdT7XdJxl7WGNlDo4Ygt547KIIcgP8TR2jw0lLQuHXSNs/pap
X-Received: by 2002:a05:6122:6a4:b0:59a:7b23:16f5 with SMTP id 71dfb90a1353d-5bf5d23e1cdmr791179e0c.1.1783418514529;
        Tue, 07 Jul 2026 03:01:54 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-969838c1449sm6523705241.5.2026.07.07.03.01.52
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:01:53 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bbfc48715fso318417e0c.0
        for <workflows@vger.kernel.org>; Tue, 07 Jul 2026 03:01:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpDqD1sQeFQGtgHIi9X7VCgrw5ndJB600xxcFlJcCKeRW+Rb85tJPF7gdO2eRNiTsHo90DceC/hNzM=@vger.kernel.org
X-Received: by 2002:a05:6122:a1b:b0:5bd:b19a:f7f8 with SMTP id
 71dfb90a1353d-5bf5d253f06mr1049634e0c.2.1783418512547; Tue, 07 Jul 2026
 03:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2114bb79bb5b6e5584a8236de3590e2f4bf0899f.camel@kernel.org>
 <20260702161330.GH3534761@killaraus.ideasonboard.com> <2026070227-payroll-eradicate-8f66@gregkh>
 <16c507cea8f2873766e1de586d9a0d73234a3038.camel@kernel.org>
 <akaWnQ5Pkg_676B-@lucifer> <20260702211740.GA639365@zen.localdomain>
 <3f447113-4407-471f-878f-e6d6edafee71@kernel.org> <akez23ZhLRSGMFQ1@lucifer>
 <20260703163251.GB3734786@killaraus.ideasonboard.com> <e93d28e4-750c-4a4f-8bfd-7a0b404cd05c@kernel.org>
 <akzETpsps4TMfqpC@lucifer> <0ba6bf66-e48f-40df-a953-503d317b3dbe@kernel.org>
In-Reply-To: <0ba6bf66-e48f-40df-a953-503d317b3dbe@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jul 2026 12:01:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUPe=Lv+_KcUV8S6aNrwBFxP2AaU7Oq9J6PMjhuXDn-ZQ@mail.gmail.com>
X-Gm-Features: AVVi8CePvv2v_fHi093eoEEy2a9Qf_HkTTE0sUWj6yZ-0WNa75KMlBmez4XW1WE
Message-ID: <CAMuHMdUPe=Lv+_KcUV8S6aNrwBFxP2AaU7Oq9J6PMjhuXDn-ZQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: remove the requirement for LLM attribution
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Boris Burkov <boris@bur.io>, Jeff Layton <jlayton@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Justin Stitt <justinstitt@google.com>, Carlos Maiolino <cem@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Brian Foster <bfoster@redhat.com>, 
	Christoph Hellwig <hch@infradead.org>, David Disseldorp <ddiss@suse.de>, Mark Brown <broonie@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Jens Axboe <axboe@kernel.dk>, 
	Vlastimil Babka <vbabka@kernel.org>, "Christian Brauner (Amutable)" <brauner@kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David,

Thanks for your patch!

On Tue, 7 Jul 2026 at 11:53, David Hildenbrand (Arm) <david@kernel.org> wrote:
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -40,20 +40,37 @@ Attribution
>  ===========
>
>  When AI tools contribute to kernel development, proper attribution
> -helps track the evolving role of AI in the development process.
> -Contributions should include an Assisted-by tag in the following format::
> +helps track the evolving role of AI in the development process. Further,
> +for reviewers and maintainers it is also crucially important to know how
> +AI tools were used.
>
> -  Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
> +Contributions that used AI to generate significant portions of code,
> +comments, or patch descriptions must include an Assisted-by tag in the
> +following format::
>
> -Where (preferred):
> +  Assisted-by: LLM # brief description of usage
> +
> +Or alternatively::
> +
> +  Assisted-by: AGENT_NAME:MODEL_VERSION # brief description of usage
> +
> +Where::
>
>  * ``AGENT_NAME`` is the name of the AI tool or framework
>  * ``MODEL_VERSION`` is the specific model version used
> -* ``[TOOL1] [TOOL2]`` are optional specialized analysis tools used
> -  (e.g., coccinelle, sparse, smatch, clang-tidy)
> +
> +If other tools were used, they should be specified through a dedicated
> +Assisted-by tag in the following format::
> +
> +  Assisted-by: [TOOL1] [TOOL2]
> +
> +Where ``[TOOL1] [TOOL2]`` are specialized analysis tools used
> +(e.g., coccinelle, sparse, smatch, clang-tidy)

Unlike LLMs above, all of these are deterministic...

>
>  Basic development tools (git, gcc, make, editors) should not be listed.

... just like these.
So why treat them different?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

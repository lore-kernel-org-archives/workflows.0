Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663510;
	b=K1HUjCmTmz8sVALCc+ywpcCO/YdNSH/cD8dInooHaihAqiQJh+QKzNMk/N/xfMA0btKB
	 iCf/swfOGxWqOomBbNWnceaydLlje/quRdHW0KKSO9H67QcXELSC+y0JIRLkBczVUAu7Q
	 hpXv8sUjyQLS53aFPazs2Wn/EiHoUGL0//XSypjmAip3NcCXvHaMrnufG2UKrW/ibVLXx
	 RAMQqPI1eZ9VyQg3XG8/ZQtoBT3+OSmB+HmoN6u34W95bNwumdfpeyt9O8u+PIajR3v9p
	 imN5OIU34A4c7pTa54rsNzsQxaSn+BCAq6dZlNN1k8labLhUwLZj9BxBy/xA98eyFcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663510;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=AmtBa+LxL4SvVmJcPn57Ipgp4NVdoxGD7DbFVBLBg0I=;
	b=dZcAdPRkxZciwBh7JFxBHhCLCZPOFpC0V+PgyTufeWv//tq/qypzhpSmHEkY1tJjS6Lt
	 ZRst072BVW9pos9jlskJm40oFutum0ehRoanYX7nSL64TC4UdRpyWj9uYqiPdd3b6Kjib
	 BTv+mnG7J+Gl7anALW88pkAk+pGxfESxIr5Zm+9gYZ3kImyRodIPMZMY0SuxwoJRLTG/h
	 HylpNZKhhkBa3ZgBKOZ91mg22IZ/NMk0GLdES8EKGNOB8LWu/kEW9Oh1Yr1U65O0HAXAE
	 x+L4kDNNePeMtC5wRkzi2b0yY7ocChLRFa7CXL4BJA56JPszrqK3DWzS+VlRR0xe3tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4910F606A320
	for <workflows@vger.kernel.org>; Thu, 22 Oct 2026 10:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4910F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5eaefe5b523so1077946e0c.0
        for <workflows@vger.kernel.org>; Thu, 22 Oct 2026 03:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663509; x=1793268309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AmtBa+LxL4SvVmJcPn57Ipgp4NVdoxGD7DbFVBLBg0I=;
        b=r0WJVd0E1umVCk8SbjWiEgaVkiWMkJsiE5GQuj1lZGa/01tyVDW33+6brJ2jqrZyyD
         HUXl8s/bODJI/vsx9xOZ3J8PFJI2SGyKITmY+/nlNBt8gqKY4RQ93R3ZJRmuWXca0wWu
         tizhEvwqqA/Jbs78BsMrX+waGWihmT+c9MbLSzb+u1ACbfxL/R98BQsU/Y1QpJzNNA4O
         TX6vqbR5P7L3NckR1hKtU8v4CYjazvrEBHpPgmPMBpkIlI22I0RFRiFxc0A+CIm+GVL9
         o3bp0P+XGe4t0GeuZ0zPMVOhy1aZ/ukFwBkJ3DzzFCAasqwZUSdxLjYkUYWl3v0AyWBr
         D49w==
X-Forwarded-Encrypted: i=1; AKwUvBxAxFWSWiach+AclcleZzD4Y6wHzcwWceRN0bIORKpCCozLZrSEi2rNXrR3uzgkNDFLcyM0ZCKx25s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOcWPVemjBFB+oHf/+L9uy6xS1pOva9bj8x/ab/mtsi5SpGjXx
	m5PDPWvCIQ41FrHZw5eDJOENpDFyp62AJ9G9IlEjx8JwHhVFem2jaP6M3yze3kHk
X-Gm-Gg: AYBFou1N0lO3SbaL/VCl54KVBsFBS0NrXE0seB2DjiisXWyUcs5Bmo8GvYyR0AY8yRd
	QqfbZVsu3m9LspdvtAOA/RtRcdEHpdYcjTDZ662sbRBlQ1jE1ATvYJ1O4gBxj+40eXnNQI5ug1Z
	CGfY1nair/1vIqce6xc7qUYnSVEkDmjhUlgdfbGBqAqGqgdGKFwF+Bt1wmTmTluIlgGgeAeIiWl
	Rkq/qpqWQQ4dLgLTPG5GFr/namFSJ4ohCmy3jcQ/EPRTvV7HlwWY+mp7Jqur1dFHl87cgWGpGAR
	RJWj+bU6iHNWHVaYulaLsMdBnL/ckJncIswCF2w91gzNzvGMVliB2HRd6+DMOuQMWCbgT4m9kp3
	3tZSpBqq7gmCeJWpzjv8jciGM9fLfxp+VCfGv2lyRIlNbnuzTdBmH8ZtonAt+tXCy1od/AM7wBc
	eVIpzSEC3rLodIfJuiSITqaFqJEAl+46/qhCRNqolqbhmyWuRL5OZfzJZqx1mHYLZKbmf5b5c7q
	DZrqn5SJqLmcQ/JN2rhhKk8/RObx/pcg2zCjjbwkKJfFB3hYoj7P+frnQ89yhwumUIQKTmU6mIv
	xfuhmJg7WVKbSMNEBg==
X-Received: by 2002:a05:6102:4426:b0:7c1:9286:296f with SMTP id ada2fe7eead31-7cc926de9admr1777402137.25.1792663509293;
        Thu, 22 Oct 2026 03:05:09 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d104017bsm5817434241.4.2026.10.22.03.05.07
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:05:08 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-990703f817fso798691241.1
        for <workflows@vger.kernel.org>; Thu, 22 Oct 2026 03:05:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw1O5UwdQh1DOBcPbDRaJKMsMz2mcQl8kiwQrWekV/kmn6lhNGXhpLFsm4SrDEa+6yl7uElSC8o2K8=@vger.kernel.org
X-Received: by 2002:a05:6102:4410:b0:7cc:2946:7f80 with SMTP id
 ada2fe7eead31-7cc927441e4mr2229849137.35.1792663507671; Thu, 22 Oct 2026
 03:05:07 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020212235.1143086-1-ebiggers@kernel.org> <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <87y0br3zln.fsf@trenco.lwn.net> <9704f11c-4c2e-426b-87df-13ea2ffdca3c@kernel.org>
In-Reply-To: <9704f11c-4c2e-426b-87df-13ea2ffdca3c@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Oct 2026 12:04:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6fLN66GzWt1C+zpCwW99UCaN=C2xCrxL9k1P7K7VKHg@mail.gmail.com>
X-Gm-Features: AclHuK_CDyU6-9WYZXLSnQ7yP-CtCllBONPjh-ERk93EX-FDKMuOE4BuJWpX_k8
Message-ID: <CAMuHMdW6fLN66GzWt1C+zpCwW99UCaN=C2xCrxL9k1P7K7VKHg@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 21 Oct 2026 at 18:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/10/2026 16:19, Jonathan Corbet wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> writes:
> >
> >> For many of my contributions base is obvious and not needed to be
> >> explicitly defined. For all the patches I accept, answer is the same -
> >> base is either obvious or if not and patch does not apply, then the base
> >> does not matter.
> >>
> >> Requiring it is just bureaucracy without actual benefit.
> >>
> >> The only benefit would be if maintainer COULD change its base to apply
> >> some patch with odd base... but this cannot happen. Maintainer base is
> >> fixed - it's the HEAD of his development branch for given category of
> >> commits (e.g. DTS branch for SoC maintainers).
> >
> > I fairly routinely get docs patches that don't apply to docs-next; when
> > I'm in the mood, I'll try to figure what they *do* apply to, then
> > cherry-pick them over.  Base information would make that process easier,
> > and even automatable.
> >
>
> Some maintainers do that indeed and I propose not to. Every two months I
> see one of my or other folks around my area patch which is being changed
> in incorrect way between mailing list and Git. Change is done because:
>
> 1. Patch did not apply cleanly (a lot of simultaneous work, so base is
> obviously old the moment the maintainer applies such patch)
>
> 2. Maintainer tried to resolve that by applying to the correct base (so
> followed your process) and then did git rebase or cherry pick to his
> final development branch.
>
> 3. Maintainer is overloaded and has no time to investigate whether
> rebase/cherry-pick from above is truly correct, except building the
> code, so every two months result of such rebase is wrong.
>
> This is a real issue because it is very difficult to spot - your commit
> is applied, but you never verify whether is applied THE SAME way and
> maintainer thinks everything was applied cleanly.
>
> If (1) happens and patch does not apply, the solution is to ask the
> contributor to rebase.

This happens a lot in DTS-enablement patches: multiple people are
working on different devices for the same SoC/board, so half of their
patches insert new device nodes at the same conflicting location.
Perhaps we can teach to git how to handle DTS addition conflicts?

So your solution is that I apply one new patch every day and publish
the result, and ask all other N-1 series to be rebased? Obviously this
not only applies to queuing patches, but also to applying patches for
build/run testing during review?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

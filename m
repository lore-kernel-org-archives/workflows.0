Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084191;
	b=ek6tMol/DckmkQn7MWmCfzEqXeBnenNvVbLHEYX06uVLDX1row/sZMzr+1YW5YED20T5
	 CJ+CunvMC/f0LpQS6pShpnyVb/qA9l5BtEs7VKTjqLt3VpVL6Lf8ND+E+9KK4yHKWAgwf
	 4n47RE7K5WjWG+Hce78WqZBlx5QnBUD4wMuoR+wDvrzQmh6VOVzUnw9Qc+IkkYYREdcVD
	 DKqoIjetGq0E3/C+kPY3JeuTaq+8harkCxgIPA78VRgw5OCNGXp8rHvyaSfGyLgCSvTIK
	 AhgWOToLAwW/y9032m5PqttPjEPq82NDt9AYdIPVuwwbuLN5cW0R0YECnRY8Wrzt+RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084191;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=0WpfOI5xeWJOkMh3kbT3N5kNiSFKYr6MVMM+doisFww=;
	b=1ypb1HOgPk/ZQwJ5V9RewmtnOghVyh034UPT5bSwP8ICwxy4Tz9kgrifalsGGkHEbmiI
	 RYzWHd6Oaxj0IaT1colJFzwilX3ARMgSEOoJWey5vIln+qB6ANbtB5SXHxaLjjTQE5IBr
	 zXvIry95GjAAZ0M09AZJVIf9Zv972OW+aHc3hb8lLp4OEsvsEHwHpwreXua2SFk36TtyN
	 enO7ZRcQfSISaUB2DVelIfPlpe/2jNmXMg0I2baopcwClcPEULLgElv09aJ35ZRUqsu4/
	 TewAu8UUtEFRkkvmodo9rdie1OmmlkzRzwvReYKLmNzrUkHAxZgjV8+RIWLcftcErqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC61F606A324
	for <workflows@vger.kernel.org>; Thu, 19 Nov 2026 10:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC61F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7a6e560f580so1364964137.1
        for <workflows@vger.kernel.org>; Thu, 19 Nov 2026 02:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084190; x=1795688990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0WpfOI5xeWJOkMh3kbT3N5kNiSFKYr6MVMM+doisFww=;
        b=pxGPHfmuLTcb1ovB2lJu7V1LO5z69D7Q1/cFRM6IKfj/C6FSyE4ZoyrCIeB/nveWkT
         FFn0lqcHOfX9I3Hy6p60xH+uRkp6oWMOszgdUrUba2HmMrOj/lErrUDlpGxpeAkomCjA
         eOV3D+2i0XilAcq2Il02aihyOIyC0c2SrMNda71lk2cfv3crR+O/xltOh1zLuG2ZuusP
         Qy9GWxgxVwidXLhgej0Q3iHuW7r2gQFu5CG2j5OxfD6GpeJYZEpmzbpXE4ZaLXHF81J5
         47gvXfPL/bkII/8tlqGNNyd3esUHdZdxgcNds+hQdhIhQr8ujE50++4YIvitv50fNB7v
         ZAJQ==
X-Forwarded-Encrypted: i=1; AL+hErFi0OwAMSaKNz9vVVKANDWxo9LMpsSFSf141gYDzv0pYof2oDfFfAhellVeco7mGiumspxs8eOa4Fc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gUSGT37Eb1SuR7c0RjxesG/1nqqbLYnNupkt/4NU0SbNJ3us4
	FLjj2LwLxrtb+Z6M2JmfG9JfilwoUslmQIHp3mLOJtlwEOKu0T8IoVlTUqFELnS1
X-Gm-Gg: AYBFou2WlspoH5b355a4jOSUFR+KFD9LfQ0owdc4toUdNz12WDHu7A4tv7Xj9zM0z6J
	j0F6wLXWbCopyMPilorvF8GmuZxrx1QwoLEyEvX14jjxH7T4JL4+1EZ79O78Vq1WOVL5lKlzVHs
	kJ6N8Q4C4KmsrqcHTjazQkljgH2hQBqV6reM1t9RrVIKPqGrw9AsrEeCjzjwD6CWMclFMgO9bmK
	Vijib5gkB1ZZ4b5xY2WOJ+zSBD2p4mlgOX1UuPPxWXZDlkMZALjNBG9pOEX//W0x/OINhxeoD5q
	8ez+gzvzUkIkhY0VWUlRl3TVhcEE7KiUjdGVOBScEeRoeO3OpsstEr7m2Z9PQUIHjwNL/ASruJS
	GlUxHGTABKoL6jR9ngyJvCRZYN/dFTi04TSCmRHTgTcYmw/iw2uM/wqv37SP6TCCMuSMcQMo8GF
	1FFg3FpUU5IQXi8bU9oNTZNuzBbWtkrNYvc8BxBZhJvMChe4iEkerjtwq7uabfWOvMq2FCS0Iol
	MW0KQlQBNgEe0A8ix13guzClkvF2ghKnTG2GM1dtXJ1Q1rtJRozU3Y8h/trFae51tBqDVYfnDgX
	HepAwbTikIFNGMqvnsXOmN8u30e/BPGDHUkQhwHeY87MlyOgcCjfPsfZqjgqvyHBN5w=
X-Received: by 2002:a05:6102:f11:b0:7cc:776:6c5c with SMTP id ada2fe7eead31-7d6ba3c135bmr2515438137.7.1795084189735;
        Thu, 19 Nov 2026 02:29:49 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b918db2bsm3883089137.6.2026.11.19.02.29.49
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:29:49 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so1215549241.0
        for <workflows@vger.kernel.org>; Thu, 19 Nov 2026 02:29:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHaEhWViJqcX7RPsKTNvUJxOBA2qENIGkOZR7Mid5mAk5iJj87WquoET/DPqg26dXotIgTXZ39B5LQ=@vger.kernel.org
X-Received: by 2002:a05:6102:5695:b0:7a6:85d6:84c3 with SMTP id
 ada2fe7eead31-7d6ba17d7b3mr2441645137.3.1795084189032; Thu, 19 Nov 2026
 02:29:49 -0800 (PST)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116200515.352387-1-sashal@kernel.org> <20261117092723.GA124972@unreal>
 <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
In-Reply-To: <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 11:29:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=5q0rBbZEzLXeJPP998Jqcrxu4EGv8Jn4GYdsCRje0A@mail.gmail.com>
X-Gm-Features: Aa3M54oHwNvpgtGGkx_hv66KseZDPeTjivSHlg9HiVrcMy2kadRraoCGcLtBLg0
Message-ID: <CAMuHMdV=5q0rBbZEzLXeJPP998Jqcrxu4EGv8Jn4GYdsCRje0A@mail.gmail.com>
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	David Hildenbrand <david@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Nov 2026 at 11:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 17/11/2026 10:27, Leon Romanovsky wrote:
> > Since you're already making changes in that area, could you add a sentence
> > asking reporters to provide the full dmesg stack trace?
>
> If so, then trimmed. We do not need all addresses and registers and the
> [time markers], but rather the calltrace from decode_stacktrace.sh.
> That's often review feedback, btw, people just paste huge bunch of dmesg
> without thinking what is useful there.

And full build logs, to prove their patch built fine:
https://lore.kernel.org/all/tencent_684DDE3E94F7C2470E5E02BF79AB1A1DB906@qq.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321626;
	b=gxcGMkR+fZPqtj+IpPCmA06Xg4wHs5YDW/NnCqFHNQkuPdPuq7XsmN1OPJitkhELxFsx
	 0QBqAyshvjaGIj4uhGC/65NAm2sClQqfd3v/loyDDzbIqDGOlYeX5QVek5qxLxkUo6y5h
	 3SJ66ai+ydDNyze02MFPqtK2QpoiI106hMPsy9QILJbf8DCnWNHVcgszG22wtDESfJ92f
	 gK+PtNz4c2fPqjz671dVk+MujYjjj2lu6uXrrQmk+Opz3Zbcn+T1fm7ojPFPlN5vm+HUT
	 xwyiPG5iVRMtBZldoaUViNkiL+pCn/yHkyTlJfMYxtbIBHLxVUR/Q2+hogt3E4B4gGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321626;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=NdsGEmcnwDERcnYVwxnzF5K4RGP76a4vobMfRThtHus=;
	b=RtfCkEYFqtvi3XtJ7vF3V9LVTrKLgENREbPgEl/18InHQgIAAm0luTskqHjxmA9tUC/X
	 XDKm+9ykX5eTZAP6f6wQXrqIVF2Pp3c1ael+r9t0Ro46cLaMVu4iNT49GDf6/mq0j/JuB
	 R/sVkBwYdKMtd/D7JPz7lgUnwr12aBSnzUyPoR3CK9k12t+cGrrhfXK/aTXQzveBvAFYE
	 lOsi6SpdsD8INB18TNWn4oARoOHv8Apmkt4jUt8QnMmi8Vga5TBzOmM8/Gs97MDMvN7Yw
	 BLZzBuqUg1A7FF0r54RX5yH19B+sWJS6owBVyKhmqG9H6eJH9s30yqGlu3p14xmA/5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A203606A325
	for <workflows@vger.kernel.org>; Tue, 10 Nov 2026 14:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A203606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso319624866b.2
        for <workflows@vger.kernel.org>; Tue, 10 Nov 2026 06:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321624; x=1794926424;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NdsGEmcnwDERcnYVwxnzF5K4RGP76a4vobMfRThtHus=;
        b=jtCir1G3H2Fulfs6cTT5dzKyybpKjGvbU1MaE+Pfe9pXAREDQoBXZI2NH/+0M80Ufk
         N4MTr0nViDI1vMAX6GfPD6SE0lCE/o06vbjaVqTyOluTpMy4aVJUAjc6V5IZYDKAHxep
         W3J7HqXZ36NdmwpdSBOwT2D3v8zDAGFRrer2Wl+XaOAzGT0Py6rDCXGwd9b2ce0i0TsB
         BS7J8OKasSpAbx18m4pP6Z9baLnK9yQatV6NDYDOZ9Vw1w4icXWcKOkxm94bGR9BE5jm
         JPlwm7LxrYKEiBU1NXp63UHPjdqSMIq3+T2LyAb952IfYmmOBiGAPMzerRs1COhQe0ip
         adiA==
X-Forwarded-Encrypted: i=1; AL+hErGhnkRKUHd0DkS8adiSjzPiK3kURzHbzavgtysp1QjCKBQJAKS6795iQSqNc53WN1F3f6RyYy3OY2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WGtEvUlhZ3mv2d6zH4H+2KRny5ua1QEXwU2CqANULrrjRATgU
	6KzT+vP/+ish/NZlX1cXX8L6cE+m0dQ+WuN3fYZd39mlQuc59MHcqIOBivuwBTxOYao=
X-Gm-Gg: AYBFou0AYkEf1++wWwX96cnPBZU0qaBotUO/ne27GRKWQGQWk0GOKlMYfjRc0EuG/N7
	CIfSCERuwWFT4YMg4gK8shNvktYIPhSqZvJXGP/1a5PoOHZeLtzr5nKCAQRgHI9xAVSrQtFAdpc
	Tdr+no8mSy7CIHoWE6d01fMlYu0jwEjOaAW5eVj5scFkg7qeM3mNRohLxjUo4h5UKpOVrRmVfnT
	18RCB/MtH8wGEn5UarOoba9xuk0xcIdNPgM7xiHexIfy7AARnYWnHIX6YuC15Pw/9QUFuOTagHR
	cdpyYJPkAd0ayLW1sRISiYrMDwFHWfURIVGUeM+KCZpkhvhue6xVnEQ1z0A/1x5teIo/AnMOmCv
	HSXEnq7JCeKFj/kpVHJoP8yil+QY3PxMkRZ9DxWd6zAajHv8Zccae19JM8D0wUKjgbKKiHwAo4Q
	XlpIXwMEO9u/8BzYR05Zg5XkIAgUZdFXMoxa6MPDXAw2EH8F1OwcUMRG4lxuYtG2Wpx5TRdGYBi
	nh5miyCypT87CjE25jpdO1ZfduI0EUXoZAXm8HCB+e8Tg3S1m84Bf7NcjjY8HD6tvDtsJ3ksUo1
	+AWmqhoBBce0MvV9UnnrE5CQXOFmqcKXag7dYLtQICcCbKq6CC533eSHbRu0+GdfjlQ=
X-Received: by 2002:a17:906:f58d:b0:c46:7ec3:fdfc with SMTP id a640c23a62f3a-c5049655093mr304084266b.34.1794321624365;
        Tue, 10 Nov 2026 06:40:24 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6d65sm114763066b.8.2026.11.10.06.40.20
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:40:20 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so2872216a12.2
        for <workflows@vger.kernel.org>; Tue, 10 Nov 2026 06:40:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG1hoeezHGN1nFmmAqye3xNTdG8M/J120FW32a2QhQ3rKq6NbX7h5Q+nxXwFOx0JVPhgnsP4qkioDk=@vger.kernel.org
X-Received: by 2002:aa7:d78b:0:b0:6b5:9150:edf3 with SMTP id
 4fb4d7f45d1cf-6b756b12aeemr1910612a12.43.1794321620553; Tue, 10 Nov 2026
 06:40:20 -0800 (PST)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110141429.149451-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261110141429.149451-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 15:40:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWOgiYZmK52--Dcuat-gHtW-GOhiQfHBoSDMcefWzUx+A@mail.gmail.com>
X-Gm-Features: AclHuK-vciKQvIOU3wexWocdK7lSDvoS7oWEizuJMJhyo6occ__o2qwUAjcDY0U
Message-ID: <CAMuHMdWOgiYZmK52--Dcuat-gHtW-GOhiQfHBoSDMcefWzUx+A@mail.gmail.com>
Subject: Re: [PATCH v3] docs: submitting-patches: Clarify partial review tags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 15:36, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> Refactoring of driver subsystems or some core driver parts often come
> with change of the actual drivers.  If that happens within one patch,
> people giving "Reviewed-by" tag only to piece of the patch, like one
> driver, and ignoring the rest including the main concept of the patch,
> are not really reviewing "the patch".
>
> As explained in the Submitting Patches document, the "Reviewer's
> statement of oversight" is for patch as in "entire patch" meaning:
>
>   (a) I have carried out a technical review of this patch to
>       evaluate its appropriateness and readiness for inclusion into
>       the mainline kernel.
>
> The sentence is explicit, exhaustive and complete, meaning it does not
> allow implicit variations like: "this patch or part of this patch".
>
> Reviewing pieces of the patch while ignoring the main part of it, is
> much closer to Acknowledgment, thus Ack or at least "Reviewed-by" should
> be followed by '# subpart' suffix.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> Changes in v3:
> 1. Minor commit msg adjustments
> 2. Use  Driver X author <foo@example.org> # for Driver
> 3. Tag

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

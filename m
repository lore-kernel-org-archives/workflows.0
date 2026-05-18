Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7B844DB6E
	for <workflows@vger.kernel.org>; Mon, 18 May 2026 12:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108873; cv=none; b=pvvbtQ3poVo9m6kEdhwq5X+LA237kZXYWMGhwOl/bNtd5+larOXB+dirtGeZuZrVck9aiUtkgdwGhzkFmQzDpFHf/VLoozYNS2FRhdbJVgzhXhE6ULN4Xltjw6DNj22e/VpK6QWavFsnQT3MG8fu8vA6x9WlZk8Lcr8F9VGV7kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108873; c=relaxed/simple;
	bh=kzq6fXO5xH0JFrRrfpeplkkfdRb3ESDVhUgoGp4aY8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpAuDeH2YZkJwnLjw8xRx/9n5yJuys83gIQGvG6qWnDEs47NSnVQ5MRLouAOdybbXGlFtbNfgQdCF3gU5bMp7HK2dTXyO2mCp8Laasx3EqSMlvb/jRQ+VaF9EnsTrak8lDN/RQBb0Bix9lcLiemuz/n6T7MEdYyXJwPH3Snqyug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94de68feaf4so1415862241.0
        for <workflows@vger.kernel.org>; Mon, 18 May 2026 05:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779108871; x=1779713671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXfE2Lz48kTNKntKaUoznm2p2xW5+qum7mp86cRTvX8=;
        b=bQ3l0cRyVHwEg1kJtaXORg2NnVuHHjm0/uO+MdvhDQ7usqD3YUvLPdlKBGfw784Wd2
         jfjyTBA+Y+Qd8br4n9fxplFeFFMejdJGwPd2HqkMcbM7iz991EhXDOGdfL9My3XC26F9
         66ghJtFQto8VYF9CktTnfTdDvvEBVN/qzXhXmDtmKSWsabSS/ocOeTrCVFQiLNaPA/bx
         9bw1f7Q8cC9EkFuspMEa1FU60fRdDJ+8B63lL38aXGWhqV4mDxIDrGjj1TdOH6t0yDc2
         idopsWzn/5kpf+geANeDENIkR+pd4V7qCmIhHkGv8lOMpwQyFBAW7LACPykrt518Y749
         NOog==
X-Forwarded-Encrypted: i=1; AFNElJ8MAwWQQZ2QP1uv1+q9KsiOCBdO8cJWf1BUiGlwDiCn/DWXLeCqi8lSjrxR6VVHZOhkQW/q1pEuMzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxE+ttjvVpFZRBhUULAJYPqPb3AjMKROGZoaniZCKyclAtrCQ3g
	ZxXpxLbaof7fnBMdEu7IveUPppufy4EwcGRivh6CoqEFtJi3PABlNor+x+0p/Pkx
X-Gm-Gg: Acq92OHLqA3XrTVAdq8/DEr4lUSm4vPDN7abFKkAPrlrFXsv9aPdYWEzfTcof+50SWY
	PRFVXniHlyU3IvCvYdspapJFqCeEFMxVyI/PJ0pyHoNTrj+FrMi+oFWpjB3ee/Xu4XvI4egEpD9
	v9wvaLSCgQRN7hXFGyp/zWIMx+wf8FnPI7tKYVs2JtVRQ8Zb4HOA97tRz1+xEqtaV1PHUiNoOY5
	RahiY0x/zwyAQL0ks8Y6wtx5xszruAc/d8DCpNgbmleWA702g+567FwgnOu4HcGvI1yr9Jd/ctl
	Q1psGlxx6dfx7aV9T0dBZruU4iSEJV+/sS97gxc1ufEP68nu1pzOw1zeakkaUoG7HN6uaMbYutD
	WSmvdaOYV/vuHY79zM5qfWQf+Oa9kKiiUPancjBRx1WA6sbiTP//jZ9o8FAgryThXil/C1loQtX
	iwhrLgE3WYDtI1SKhyxjFDRJwL4dSHV7x27hnBtoRd25sIdKIwQzRkW30lwm4p
X-Received: by 2002:a05:6102:1610:b0:631:4580:6a33 with SMTP id ada2fe7eead31-63a3f38a953mr7541348137.21.1779108870816;
        Mon, 18 May 2026 05:54:30 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2f874easm4634353241.9.2026.05.18.05.54.28
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 05:54:29 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-95fb6411e01so937439241.1
        for <workflows@vger.kernel.org>; Mon, 18 May 2026 05:54:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8qXJHkxsZ69eT1f/V/gjmNogzYihxiQBj44xfgjc85Eclt6eXGWAaXEkGMFjVGXIL8lQWMxP8v37o=@vger.kernel.org
X-Received: by 2002:a05:6102:946:b0:631:ab8b:c348 with SMTP id
 ada2fe7eead31-63a3cf12325mr7789460137.8.1779108868589; Mon, 18 May 2026
 05:54:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4f3d7f48-5766-425b-91f6-0acdb5554584@kernel.org>
 <07602616-412B-4ED8-95D7-588C0D077EE3@linux.dev> <2e20badf27b6910d619329841e37d2961556056f@intel.com>
 <20260518121601.GA87957@macsyma-wired.lan>
In-Reply-To: <20260518121601.GA87957@macsyma-wired.lan>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 May 2026 14:54:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKONz_jCAedOWQ7Oqza8DDXt5hBqB1ZvO-1s2pvwsbUw@mail.gmail.com>
X-Gm-Features: AVHnY4JEQspflVlWQjqPB-ZT9trO0h2lQBDWUevKp9TlFoxeoXF1KrY6M5cCx8Q
Message-ID: <CAMuHMdXKONz_jCAedOWQ7Oqza8DDXt5hBqB1ZvO-1s2pvwsbUw@mail.gmail.com>
Subject: Re: Stop false review statements
To: Theodore Tso <tytso@mit.edu>
Cc: Jani Nikula <jani.nikula@intel.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Krzysztof Kozlowski <krzk@kernel.org>, debarbos@redhat.com, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Konstantin Ryabitsev <mricon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, sashiko-bot@kernel.org, 
	sashiko-reviews@lists.linux.dev, sashiko@lists.linux.dev, 
	Linux Kernel Workflows <workflows@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, kfree@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ted,

On Mon, 18 May 2026 at 14:26, Theodore Tso <tytso@mit.edu> wrote:
> On Mon, May 18, 2026 at 11:04:29AM +0300, Jani Nikula wrote:
> > > Sashiko is supporting various LLMs, including open models - it=E2=80=
=99s just a practical
> > > choice: to my knowledge the quality of open models is not on par with=
 frontier closed
> > > models and it would require a non-trivial amount of hardware and infr=
astructure to run
> > > an open model at the required scale.
> >
> > In the context of the "Reviewed-by: Sashiko" discussion, this actually
> > makes it really hard to assess the quality of those reviews.
>
> Agreed.  There's a reason why the coding-assistants.rst specifies the
> model which is used:
>
>   Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
>
> The problem is that (as Jon has pointed out) coding-assistants.rst was
> intended for use when the tool was beging used to help create the code
> --- that is, "Coding Assistants".  What we're doing here is more of a
> reviewer assistance.  Something like:
>
>   Scanned-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2]
>
> Would be more interesting, but it doesn't actually tell us anything
> about what the results were of the scan.

Indeed.

Scanned-by: Geert Uytterhoeven <geert@linux-m68k.org>

Doesn't say much more than the RFC2822 "Receved:"-header,
and thus not meant to be saved for posterity in git history ;-)

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

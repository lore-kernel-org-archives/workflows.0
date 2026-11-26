Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686330;
	b=zQj8FDlP+JrjSr7dNwnOy8F2BfWmQ6nGY51Vez0VhLxflFY7y435EHVKTp2uI2X4QF/I
	 X6uTy9GxL4nRNJs1D41IZRjpftOmzkEFhruhUuBEaPP18lykeJMx/HJROsGYZgihONOG5
	 MeZgOkZAxTn2fYqkVbcCdDEKhe7oewnNF1e9XvawQZoKZTECm2qld249ecExXHVYgm+d0
	 ZV9exy3P/W0vgimflJncAS1QvBiMo1aS/Lf8AgYg/IDjoU9sOL0oy6seMHtPJ1STcW+kZ
	 1U9Q+yp52+812SHse5GKGNMgW1zvFv1DDad6SJDKfCPQsLu1jcXf5RUuY/czKPclOgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686330;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=RHMpBqQRoMtd9sTA0lpFlz4dxCc29ZbqLl0UJOwJgLQ=;
	b=ajomlx0oB8uy4rvqrrdliPCo+cSPkNPwvbHTLdW/38v4EVUPczCxBEWcdqzcltjyOgdb
	 T4jXfHzYMWTWcksOtQBldjQkMhGh1GJuk6WzDCK15V6JHawLY2l295IIeLuXIIoByBb6z
	 OcRXKCb5VuRh6cgu1xVC9lW86A6pcZoJm9A2CFnSOdCpMAumW7swu5ZYheoswowUWptui
	 ydz9nBYZ+bR3AsdrRL5nn4RYbyjZA3mD7hKK16LoNNA2ON8/U7ifI8+GVR3VAujvY3gU8
	 W/ybDvVoHcI1Ak8OCiiKT5YE8pj/Ax08nNYwmPYOLlMhLNoa60SjFRsUrG9MZG/2Tgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568C2606A31E
	for <workflows@vger.kernel.org>; Thu, 26 Nov 2026 09:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 568C2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9906a5410f5so6086632241.0
        for <workflows@vger.kernel.org>; Thu, 26 Nov 2026 01:45:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686329; x=1796291129;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RHMpBqQRoMtd9sTA0lpFlz4dxCc29ZbqLl0UJOwJgLQ=;
        b=viisYrbtFtWl6Jg9aRS/EKdV1fb5BpWD2YEeTeYxY683y6Y6tSDIW6ivsylmNQz6Zb
         MbEtzVyqnlCE+VCLQ5liXHOXMymcE2ehzMO2Drkwj+1jV8jVw65U1zk5p/wTIep0enlA
         2RFMqzZWFfv+/R4bvhRrHg5wjnY6J9aXSukQJfd1FuKbt9nOK1qpTwrJbldr7t4E9CmZ
         NWLFmQgefNwn7IsPd8lM7WHMub0VwDcH5kqzQe6jxZIfQ7qUL/U/uhmDEzPQGr1wASRE
         ghLG3m5iL6/j3u4Zys+yHOZbkW0CaUyaMeOVKZ6a18PgH9UUJXYYmDHRH2LqOH0YqslS
         nxKg==
X-Forwarded-Encrypted: i=1; AL+hErF0Y/XndEB/SsYykM63TuT2HA0neVP/6ogIbAOl1IqohRbfwCWqVpWu07GFtB2wlUl43AQkBFDzC4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I+1w1U7mu3JBGotUUcAihOIPCMi9j0eTFv0VYNtWIj4OowzwC
	6dMRPNmS0EBmkPGkVHOATIEfpn1lRjQQCwnfC64MrVcDx8cPtfctS3PTawhkdnek
X-Gm-Gg: AZFdTZc9BN6VaRnivhgLY3kP9mHKVRLPc74+LI2BwMDGLWVIrjwPUazuVZHAkIjPPLr
	zVsXKvH88zT1ZufR8l+PW37BAJMrsgnXZ9Mw5knVERihYfROFmByU/QmxsKT5dLzIUHMk/5Qj1O
	MZnxaQytutN3vwJH6U94WewmPTvaOhFVrFj+K03y1sVvQ7adBCe/TBdf2E/zqUU02F43U9ffyb7
	RwXK6vMAeW+Lugc7TUSRHOo44AHxA6QOn7TW3h6yzQPqA6Erh8Tj4qeVmJKZrLtEkI8l8ahuQcO
	uevBUvQOxq/fIUTGvKrOkV1CM21Xm0mv5P8MMLeg/7j4+xYKaKdEDSpZOLuANNHbloF/BcEuiSD
	OmzFxN09sve8kgSqZfSe8tQwmwUxzMa6XnampoXQ1RrEadCIsuaMgNMaNWDvn/ezdbpb+IenIiP
	9dRxNK4pnliehWYTJl7sN/tV6toYxLlOzGA97AuUy+DzoRDxABTjfWdmLkGGeVo7WC0GOQCTEH3
	VKr5i0w5HGHvbQysyH42f1qWJa1/RD81YzlyLCANr8SI/OTc8M7KWolyFWdG1JdG5RueIKlsvnk
	xer64CR8/Xnd2OZOE2AjDiVsZd8KWrg/M4fvtYfWNdZ+W7kMRqzo8qKf3inzsFa4ZVw=
X-Received: by 2002:a05:6102:5086:b0:7d2:f14a:bbb5 with SMTP id ada2fe7eead31-7d6db84e233mr8470816137.5.1795686329037;
        Thu, 26 Nov 2026 01:45:29 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a28dsm21312220241.4.2026.11.26.01.45.28
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:45:28 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-78fb1fb9508so5761834137.1
        for <workflows@vger.kernel.org>; Thu, 26 Nov 2026 01:45:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHnbmh7Kn7udpgcGvWE32eWTYclb6nR64dn6+2FllPBLOrghaZY61qp1jjEQBWc4kXQbrldH4RUCKE=@vger.kernel.org
X-Received: by 2002:a05:6102:688a:b0:7ce:a873:731e with SMTP id
 ada2fe7eead31-7d6dba02e20mr8198948137.29.1795686328507; Thu, 26 Nov 2026
 01:45:28 -0800 (PST)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
In-Reply-To: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2026 10:45:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5mxjaAXcu6nAiK1k6umpCVbfCpPPofPCbv6f9xr3_dg@mail.gmail.com>
X-Gm-Features: Aa3M54rURvENVkVkA3PAfM0AQ_OwL72uCl2_qD-V9nn44piqg3in3pY-rY30d-U
Message-ID: <CAMuHMdW5mxjaAXcu6nAiK1k6umpCVbfCpPPofPCbv6f9xr3_dg@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Limit backtrace trimming to timestamps
To: Leon Romanovsky <leon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Nov 2026 at 09:13, Leon Romanovsky <leon@kernel.org> wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
>
> AI tools tend to trim backtraces too far. Taint flags, module lists and
> module names disappear, which hides that an out-of-tree module was
> involved or that an in-kernel API was misused, especially a driver API
> that is not meant for general use.
>
> Ask authors to remove only the timestamps and drop the example, which
> shows a trace reduced to bare function names. Timestamps are the one
> part of a dump that adds only noise.
>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  Documentation/process/submitting-patches.rst | 20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 85ba046d66fbf..56b1b38ac59cf 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -763,22 +763,10 @@ phrase``, it is important to be both succinct as well as descriptive.
>  Backtraces in commit messages
>  """""""""""""""""""""""""""""
>
> -Backtraces help document the call chain leading to a problem. However,
> -not all backtraces are helpful. For example, early boot call chains are
> -unique and obvious. Copying the full dmesg output verbatim, however,
> -adds distracting information like timestamps, module lists, register and
> -stack dumps.
> -
> -Therefore, the most useful backtraces should distill the relevant
> -information from the dump, which makes it easier to focus on the real
> -issue. Here is an example of a well-trimmed backtrace::
> -
> -  unchecked MSR access error: WRMSR to 0xd51 (tried to write 0x0000000000000064)
> -  at rIP: 0xffffffffae059994 (native_write_msr+0x4/0x20)
> -  Call Trace:
> -  mba_wrmsr
> -  update_domains
> -  rdtgroup_mkdir
> +Backtraces help document the call chain leading to a problem. Remove
> +only the timestamps and keep the rest of the dump unchanged. Taint
> +flags, module lists and module names show whether an out-of-tree module
> +was involved or an in-kernel API was misused.

Please don't move the burden of distilling the relevant information
from the (single) sender to the (multiple) receivers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

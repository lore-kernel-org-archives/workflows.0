Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597088;
	b=IELzbBAd1GIArfgEajfBRLKuuqPjTmxNUs8I9l+BZXWjQNckiaUkJaghBlA+PMoT/m4l
	 Ut1f2VBT6iCYsfCNnPyySgBJxP/qjW39Jafv3Qc8mcQz1RuTQ1fDE8rMcQRdYZGgQuiIf
	 B7b02kmYIuNqi3TlRWNYNbM/Dp/Srnw06upJSPA6ZrDloJvbS7W/XeLwm48/9XY22AFRq
	 kgNcU5FBBBOJRZ+2P3JgHapKrLhsNs8/k9CLiaj6Nxi7gahAf8DjXIP2sIwPVBefwqmEr
	 oAJCravYusyinCM10no9YuV4PwxI1R/PE3/U/dTH0enS/uoq1n2TGU3XydHcAxFpZbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597088;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=mVMrsFYyFATOUmkvDDEKuZs5AfG2ET/j4dYuZDcY0kQ=;
	b=1AjVSWWQZF16N0of/E6XhYS6LgntJoByO+OGlFMI/FQuvK0tCWtlJKNrrGH7PRhbOUEP
	 kR03AgQRyDhdpzqd9QuKoFZkm2/eO4+LgiedPtoQ9HlY/0ieV4yEe1nSC7ouFNtT0JpVV
	 fThD3AovN5lODxE+lcCGxHwyf2frDftwFj6xQrBHP2ri0olBDhNYdHEAEK/r3ys6LkmMJ
	 p9FT3V252atg84jwiLdV+Lgv15LWyAzMzKhwcx1DsbTWS6DPcfYAOZ+uDMeytrYj8NEeB
	 obOrjH51CuGz2pV9HiL/BJeIAH8B9AR2jcveb6mmr5FYIdlcBqjji4GYPSePp2bRdLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFCE606A326
	for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 08:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAFCE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7a6e560f580so3442119137.1
        for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 00:58:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597087; x=1796201887;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mVMrsFYyFATOUmkvDDEKuZs5AfG2ET/j4dYuZDcY0kQ=;
        b=GrpJcvCEZqfnQkT/2Pl1aJtsVuzszVEfF90DiR0dTIWGad9T0PWlu4O7zfF9KA/BjF
         87lRiUAzHvqiyGkEkGntGMChRVF/ZdhjWEtAQqqqoZsnyNz9nFU13ieHapAEV8ZuHX9S
         5Y/hMgO7Cp9RAUL0/VyNKoSxnRGum8kphAfxzYNDFopC/cncwcIGRwEUekvmNV71eB3z
         MXHCEIz/VmvCFAOABHCXdFkYtJzbr5Q+pBOS1w3TERXmNb6Q99lkOdBuzosAR5GQF4wm
         duZfNRvgXjL6BcJRaMF9ro4KkD1gYZuwHtdeyhtgnMesZCJFuZENsqL4k70ZMWIC1B6J
         EStQ==
X-Forwarded-Encrypted: i=1; AL+hErHhYUi9lpQTnFesL+6GgGTDZd2trhPAV0Evzia0tlFpwRaNWzbBlLxHdKTmzTb4O89Fh5bW2bF2Avs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H8Hb58W/FySnS7o9a4kwBb/1+uQ+PtCFD99APtqFWcYDn0lJx
	PKCcdd5/Vmtr4zr1tGeFd5XoLoIcRGTuwuQtqmej8nwtsxMxoms4bcn86AkbdeNU
X-Gm-Gg: AZFdTZdFweXe0kLbJ8zOOjKEDIxMLsnczZI0ZhUk6XS7RY3gQPp5wtjz7xD1bRyznMU
	xynrhCYf2DbyLCwRUFuRfYL8QWaUsXUMs0eaAdcPImGsrD5N2rAQ/oNhY7GAUa/qU1p8RfJ7G/L
	rWPYR5pMVh7xZDhfJ6AOWC0t/VKCCUpNWWc/we9KSdaPyQm6n1vQIVNahFLi+G26szvWN3ixDOo
	nWBOdtrd1LCwuzuOKRiVjPV3F4cIbWjeWIihwmsRqk7WRQINphHvcNHt5aaEHSU3h/aIJ0lzNAp
	nUiMovC/7IEOdz8xNX51vdKdk2P2nwVQrJNDP3CXKIQhraezETP5LUhXqA2xjpmtRCFkm5rBR8W
	32wnmkbrU2z0v065iQY5Oo4LQgDlYzjOZCN3TU7k6iJz3IvnvQfOkZIaPhbPBiwSB+yTcKAPq63
	cQvX4cRaroM4TpnJ6X1dNWqf/Q5bbnik5hdKTxb4lGzLXrLikfAx3FlLVjf3gzFtSbBvXu1j+tI
	QxvqRhtxJNCI637pfTJrgYRv2o3TkPPl7cROoM12Y0yWSlUZVHGnyMi3UxcwhTJaG1G7cHxnLct
	5U5u0t1ZDh3z4xMk6CMWQArxbGkHO3R6TqRVO1kSi0GFGmkTlR8mr2uoHUuCbS+cPlI=
X-Received: by 2002:a05:6102:6f07:b0:7cc:25bc:3b30 with SMTP id ada2fe7eead31-7d73942e622mr7984239137.21.1795597086764;
        Wed, 25 Nov 2026 00:58:06 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a28dsm17883471241.4.2026.11.25.00.58.06
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:58:06 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-99e81f5ec91so2063297241.2
        for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 00:58:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGelSCWYL3PMreLgQDdwMJDaTRj+uLR6avxacggp0qG74zxQdYcXQkAYWgL+SCaZd8hm+qEYuS+uI0=@vger.kernel.org
X-Received: by 2002:a05:6102:50a4:b0:7cc:2bb7:1335 with SMTP id
 ada2fe7eead31-7d7395e01b0mr9404227137.33.1795597085866; Wed, 25 Nov 2026
 00:58:05 -0800 (PST)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179558805924.3383392.1456615917266025706.ref@yahoo.com> <179558805924.3383392.1456615917266025706@yahoo.com>
In-Reply-To: <179558805924.3383392.1456615917266025706@yahoo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Nov 2026 09:57:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNqQCKFnpxzHVaFM0deF0VdyJSvLzmy6JT46sRA9kJow@mail.gmail.com>
X-Gm-Features: Aa3M54psEuOxhCRq9HluWMLPt6_pP0Ynh7Bge75tt4s9aGAJoNbnstuvmOdPM-E
Message-ID: <CAMuHMdXNqQCKFnpxzHVaFM0deF0VdyJSvLzmy6JT46sRA9kJow@mail.gmail.com>
Subject: Re: [PATCH] agents: add a skill to determine the target tree of a change
To: Daniel Ramos <capitain_jack@yahoo.com>
Cc: Sasha Levin <sashal@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Wed, 25 Nov 2026 at 07:34, Daniel Ramos <capitain_jack@yahoo.com> wrote:
> From: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
>
> Whether a change goes into the current release during its -rc weeks or
> waits for the next merge window is decided by hand, and being a fix is
> often taken as enough. Linus asked that new development and test cases
> be kept on a separate branch so that they can be merged during the merge
> window, and noted that fixes for subtle bugs that went unnoticed for a
> long time can themselves be buggy.
>
> Add a skill that sends the agent to the parts of 2.Process.rst,
> howto.rst and handling-regressions.rst that describe the cycle, and to
> the maintainer profiles of the changed files, and adds the checks agents
> tend to get wrong: reading where the cycle stands, using the kernel's
> meaning of a regression, keeping fixes for old bugs, new tests, cleanups
> and new development for the next merge window, splitting mixed changes,
> and counting every added line when judging a change sent during the -rc
> weeks. The skill proposes a target; the maintainer decides.
>
> Most of the skill points at existing documents. Keeping new tests on a
> separate branch for the merge window, and counting lines that are not
> built by default, come from Linus's mail and are not in Documentation/
> yet.
>
> Point the bug-fix procedure in coding-assistants.rst at the skill.
>
> Link: https://lore.kernel.org/r/CAHk-=whyUfwzMDMTpih8Xs1MxmhwTCDAc_YwUSZG79vXFMLU=Q@mail.gmail.com
> Link: https://lore.kernel.org/r/CAHk-=whOCnAwXz-FMRdQEDJQ+9b2YXh9M=GHgRay0o4cxSmPVg@mail.gmail.com
> Signed-off-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>

Thanks for your patch!

> --- /dev/null
> +++ b/agents/skills/target-tree/SKILL.md

[...]

All of this seems to apply to humans, too.
Either this duplicates existing general documentation, or fills in
gaps in general documentation.
So IMHO it does not belong under agents.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

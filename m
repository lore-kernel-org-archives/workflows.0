Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F75D48124E
	for <workflows@vger.kernel.org>; Tue, 19 May 2026 11:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188882; cv=pass; b=K/Xxbzw4ekW+qj6VAjMIEnVR2CTO/2jEVPHiKuIKOeStH567V+HglhMzUN0f+vwjch/GjNck8MDhcqgCVZ3pUyIXNSW0/oPaoKWLrY46IexY3VXqMrlAzxr5gj7ZegbbGlrU5arTYSJrZeOmfQRWM6h8JOnjQvjbFdGTuqW55xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188882; c=relaxed/simple;
	bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJx5MlhHfBSkXLWTKL7ijyMk0UCVz0wXrZhLAdoS5GvW96IM8hwpNRp/yloWdxYYVNxq2ksSQ5daxuGt+MJL5Z2IR5zemuz3IsB6101k31Q39pFxVqT4UJNG91Q+z/fDmxRhMau7OUWxqCDbmtbXL5Z09chLOtDkyhdhoL188P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkzOT8mX; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkzOT8mX"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bda3b4318dso271295eec.1
        for <workflows@vger.kernel.org>; Tue, 19 May 2026 04:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779188879; cv=none;
        d=google.com; s=arc-20240605;
        b=FT4MefDhiSWx413n+JYwg62HiZloi4F56pg0hZbJf5+eEs8GNIyarkKh6GZ4pu2BhR
         9vlv6KxeX7BHGgRGAiVSTJjp3SpvBe/r6xZuycJwOBoqcIDgPHz+DAX+6uOKz4GLHX/O
         Xr2A5QNuLk1ySpPyTZWgaMy09P+FZTfOPGctQvpDbMVfMDW8ZU/HwuJOZ0gvlw4sd8Ta
         Pj7Y3ll7s2LATtfxPPfTX/UrasvL9/ieTOTjNmtMzhkEtKzYgTb9kHL2t8A8Maj3MAFC
         H0iqKlmjKg1wQkSSxU+pFXQEHBlFJQFx4a0qsNh0CTdwDAk3PgRaQkhIxznMAtJwNkV4
         kYwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
        fh=lhro7NaWbIYP8trl/ZxLoZ3AuHOrALKHwQz4dJ2lxLk=;
        b=RWFV3iT192tpolpvoMcJxp6mNDuHjjtX81MpevuL/yf099s8ab2irthtlKUaVBsGvs
         8m13sjgbd20kw7Y4sOk4AHevia6JRmzdLAorebhlaSZ7ZV2EgReDI9NxEfSzTJHFpQdq
         dd+46NeXHtnlvQL08HQHv9QDbprOyKkKnsW54LhO3IduPVSPmpuEL+z8BpP9pznf9+UX
         vsidvui7nrASjrImw3DmxtcHfKAU/rknMwNrchrNe2YFBt/dY+/L89Sy/4n53gzdZptX
         GAvS6cBBj5dCYmgu8mfHkz0802VrV2j8RyEZ59bl9RE+Osb7cnRfz9UYTagEG8QY+K2b
         US5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779188879; x=1779793679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
        b=NkzOT8mXh6bXhnJvqEtApaE4S4veNhy2u4ev1hghBlqH6x0n92yVBDsJ2dVI/ZJivu
         9A8hpggl+UV+EG+gZ3coLNVauocffm06kPS6Vsilr4oCfGSd+pU0V/7UWBN7MJ69Qwj4
         R1O1gypG77mvtOgIEZmtoiOoxIxx/0pznmMVmWyQ4agGZcSLDIFoxyo9RDUI+MxRlN+5
         IdgW+epOIw+p0gT6dT9gkmNG7DD8Tr7Gq7TAph8w2yFKfIgDr2gJ4ppcyT6UkCIFCNyf
         8Jw0CWqYMJEIAQUcdMZMca1DkDroniAfLQjNSAqdcZYDK/d8nqv1CAJ1GQZJXX93ZFJ9
         eCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779188879; x=1779793679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nhTmhA7EtvBhVzOtpkjubbcdCBekT90z9FnlkG56Nt4=;
        b=GPPVMkl8gVm2V51r8CBWpCH4XZrzPRcRTRVqFDjB2Syzk+2VNv5ZobJj2kYNlSco2e
         Px8vQxlDmfxk2T3ochC2aKi5PNnNEDTdk7D/AXmdNhpnOaebLsfkzGnasmsiijLFM+0M
         fnKYUZX8391sVuMemHoE2vK12OD4eIo1Y2CLeG4e7Xz3Js2h+/roV3WZfTRbioaGE6jB
         bz82GM15kiM+kk9/twOl/K0CiFFqSk8p/LLp5MuEZ5WA25Ky5Y5CYJ/vjF7nQ2Hm/aL+
         kEcE7/NsyVm7aHyTqoIgSCRtT6pqUxBlekLN/31E4iN+THY9rNRlVPe0K2uQhukL2mxr
         aPgw==
X-Forwarded-Encrypted: i=1; AFNElJ+PAdvLO/ERmkUDgI+xQiK+PLNR0hJ+UgI6p1jrk5bW6O7oT5/7/WBbaO6iePK7iBt7MbbNs8NQlaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuHOco1dwVsNWs+qcoZefKQ5/FhnIl3LpLr/8a2vGYsy1qTdDG
	F4SZJWc+hlplm13DIxGaCQ7ET769RQLJBPSUiSkb26CmxThzjTCIOudLO5R8Gp+odUDRM7n2X8o
	uLs0TyD7//Hxkuc83D8Gk9pU2XnXbBQk=
X-Gm-Gg: Acq92OEBVEZCsVbYJj4DxhJMG0ewiJ8fkxCezPjlYlSmwHJghcZthh9YD0EMZwpA0my
	ge6ULl0Bc2q6MBn9m0pLDGSZfFhaNfKjSfT8qaqgngsYq7HtGkzygLPESG+4fIZQtj3i8S5RVZu
	r1NVIthboP9hsqi4bW+/qJAwvC2s4tnEbWDfakbgRwlcS1ef8V+jcoBsCy7PWr2h2Eb8WPOeGHP
	iWg9CRv+llmRMHMkvYxf1EHhcNMfe+TEledUJmUUo4I1qg2kjekhc9bTM30rWEKqigUiYBJgSX3
	dG2G31JQCJhWTYi2vSSgFeGvm4i0kJtzVGN5ZdEtEk715SHkMKegEoQC0Ivk0ty9ANQHoNAPifa
	9EtwL0yziqDH5cTl7VABLl2U=
X-Received: by 2002:a05:7301:6785:b0:2f3:3835:2010 with SMTP id
 5a478bee46e88-3039870650cmr4323491eec.6.1779188879399; Tue, 19 May 2026
 04:07:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518042833.272221-1-enelsonmoore@gmail.com>
 <d40b1e80-37fc-4c88-9d7f-dae6458efe6c@app.fastmail.com> <20260518105735.GW3126523@noisy.programming.kicks-ass.net>
 <20260518172444.zyd47mcagrcwu7wt@dev-vm-schuster> <CADkSEUjhq6HSdg4ignzbuJiN5uXATsTdxFbRJ3BMxs5=WUWLDg@mail.gmail.com>
 <20260519103012.blot4bssgiqfer6p@dev-vm-schuster>
In-Reply-To: <20260519103012.blot4bssgiqfer6p@dev-vm-schuster>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 May 2026 13:07:46 +0200
X-Gm-Features: AVHnY4KWOiWEY77zuE66kq3xKsBRyVSkUGj1e6jCXaPb6QA3ygej9CY3aqSmM8c
Message-ID: <CANiq72=6oYtHf0Q1NaLXZ+25uQyYbej2xnvUhtgpHyvozhP7_Q@mail.gmail.com>
Subject: Re: [PATCH] nios2: remove the architecture
To: Simon Schuster <schuster.simon@siemens-energy.com>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	workflows@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-iio@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Kees Cook <kees@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Dave Penkler <dpenkler@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof WilczyDski <kwilczynski@kernel.org>, 
	Andreas Oetken <andreas.oetken@siemens-energy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:41=E2=80=AFPM Simon Schuster
<schuster.simon@siemens-energy.com> wrote:
>
> Sure, I'd be glad to do so, but so far I refrained from it as I was a bit
> unsure about the netiquette (can I simply do so by self-proclamation? At
> least the git history seems to suggest so...).

Up to the existing maintainer, in general.

I would also suggest changing the support level to "Supported",
instead of "Maintained" -- that would help justify keeping it in
mainline.

I hope that helps a bit...

Cheers,
Miguel

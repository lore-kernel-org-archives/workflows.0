Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBC1405C4C
	for <workflows@vger.kernel.org>; Tue, 19 May 2026 00:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779149651; cv=pass; b=Mv4OvvITMAZrbc2rSf1ma7olpaHEClujNHXl+IeU3UDSJnbU3DMd/fsw5r/BSlNuV2u2Vpj7WZsF4L0JNHogN3VgQqOjYSufq3x6B/uFrmefp3TuuHJcxG3qxqflpu3MMPNHQ0gEkmjh1PHSOMI7d1dfMp/DA04anxE/IJ1PLyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779149651; c=relaxed/simple;
	bh=LPwsRaL3/VhQKGJMHLIVfCwqYVCTUXR7opK9047JBWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TO4rv0ZmDgwtf/X3u+bgNYl8NnGyi2bM9eJNazdUgYTQrcnEFKOd+KIAWYUwEYjO6/FdSd9IuVTOvjLDJEq1GWKM/xXRXrozF8oYTAl/DZ3knFp4X/C1XvCpT3UIrFLyhvmdplXqc22W7Di5rLQVReHwaHZ/ejSnvYhg6W8wGhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d59lwcl8; arc=pass smtp.client-ip=209.85.160.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d59lwcl8"
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-50fbd79350dso34670981cf.3
        for <workflows@vger.kernel.org>; Mon, 18 May 2026 17:14:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779149649; cv=none;
        d=google.com; s=arc-20240605;
        b=LVE2F7qjHiqAHLaJmKccrPE2t85rqzL62GDeq6vETQp1vb/QcOsYo1CpbaEueacfwJ
         42qtbq5IfiBFWDNlWaocsdvFbL9TRY83CLZvy4xYSsPHZSp/RhlqLdWo55BypP6h2t9x
         Ga6t154s+9RQexjDEpzYCt8UQSf7kYcgRGhsYQuwehTx8C9RTnQfqbMTXuS/StPBv8PP
         UQ8mm2fLDGw5glUV63mpJJmOD7uyueSmkI08UxfrW+KbozGsdMfX69Tri9JqxvNYFlxU
         mD1r7uUvhfAoibo22vsRr3yARxU7OG3IIsohLtcUWXFrU4U4eAnquny9r4Vm3xAA+8p7
         HZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LPwsRaL3/VhQKGJMHLIVfCwqYVCTUXR7opK9047JBWk=;
        fh=vgWCYfLgTMFxrtM/ST0p5R7HJC7DKAoBmrfl9CAkRx4=;
        b=XszGbqfEmF7uL5WKA9PLJ/eG8323Ij6TlC02DuvWfqmU47xThm6pvVufzI8qudgAYh
         N1Y9/jgfmqjrSVde5lpgOjuYPWAAshfqDrrgL+Ouv+pe2wRyIl8dopghZmoFGrQkWra5
         aQSjb4VH8pff97IwsX9pOhuiUyMmKGH/92ONMVfbXaxVx8T3aMj3a/t0cPHluk5F0w75
         KZDrhy0ij4winsTUPRS4WwDQ2cpDgPOww8pq6EFg9dxfzjhfDK+aaYOKKC2dNwBWkeRc
         EPrrcBcKN7h40MjQ01LDzNpDngJaTZVY4VH6HMnOFkSqay0Bg0NW4hu1gEPetWQi8o9N
         RT3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779149649; x=1779754449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPwsRaL3/VhQKGJMHLIVfCwqYVCTUXR7opK9047JBWk=;
        b=d59lwcl8NvuOHlMwJ/jtLfvIVKwSl887jI0zUq+n+MokZhIz5kSNG+Q7m83cRRj++o
         7S3rzqts7N4yutIkInkFXV9kygWG7yxiMPc0JWryBnFhkU7pGX5375FZhqllLsu46QxD
         yqRXefPbKqpNqDqlvNkmKy9NH53MH/MzNhs5i0t6EGN/qbHwnG3z9w6y+vTpWbbm4ui8
         +Y/emkK8/ZzUeQNXSb3F20EcO2qGGKw0KLfo5yfAg9tQxjLb8ir1PQn5DJpL6n74Uv7I
         Kzy/KgWqFZU9F5z3/y0h3xh8lwac6mtJi6nFuR/ealUBmYZWKM9xgcZKuPtDs3lS0PL6
         E+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779149649; x=1779754449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LPwsRaL3/VhQKGJMHLIVfCwqYVCTUXR7opK9047JBWk=;
        b=I0WEAt878UlvlKFJTQCIl5dypudGeb2S6CYiFUbxm7UhTB/Iq4q5C8ofDIKWeOsJcq
         rphxPOieVywRXbToCm6Rt11EU/e7q+UlUZdiwP8qOCbtsQ0SNgS9UaZmbi/wd2WYo35M
         qcN++55n32R6QhjZ0E644lL9qWQcatVNzoe96tt81P0h/zCVBP39u7CuWiQTwGA6H89W
         DW3IUVAGs8F8P4X/Wu5ONEQFNEqeusSTDPbKoqoqdYcFyq5ITJbwvz4BSzebOSHXodty
         bBmm1MoFLe8CGL8lxXbzi2N6KesnStfn+K3QTXVxqNWCzZLdpgrmh5CeMXkrPzzJlQYm
         10Cg==
X-Forwarded-Encrypted: i=1; AFNElJ9UvcVuroa8i/mW/8rKEPF4gmQT3v2tciGo7eDd2/3Zg+gOkrtMzfAoFpTWbawxAQCOxYNG8UAfO8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZPN0+q4xVGtHAnqi2cZxAwE6ZRAxlkfNWyxPu9zGaUPsqmNhv
	WruS/QrJIHd+7FZcII86rj9DupcR/HTZQXV+OJDRDEF3TBwhMjS4SRSTgOyhFRHYz3clnuG4Gw3
	mOf5Irpnp2DNhCHzQ7Ma9Gy6BjU548LQ=
X-Gm-Gg: Acq92OGqTLPIcQwdTgKhbyhgqs3JqKOvJQMnc2LGT5gZW5HYTGgXPAmA+I1M0pcBLQJ
	y2KXysixMf8eKXfUQl6pqopn8SBFLWwJ3uceIyaxrYDOZPNmXZ7ZzZeP2cYsFAn8M8J2aWRkY3p
	eui8Yxk4VfIF91iyvH9XRDJA+BHARbHjmcy2l45zkkRCrRdTPORoPNhDxO2cY3iJ4DzIEssI8KI
	dWAVFRT3uR5VZIcy4ksJ4P6BbNFCaCvdu8Xy5JRLAt4ZCBPViLs+WM5fzvKojybhNol7H8wTkth
	Z4xYLgG6F6B7AKc/TVJzXpcqFne1De53icRH/p3aw6wGgrnHP2LXInGzuYiP7pa6Y/j96y939Z5
	La5Q=
X-Received: by 2002:a05:622a:d0e:b0:516:707a:cf8 with SMTP id
 d75a77b69052e-516707a0e9amr149948671cf.44.1779149648695; Mon, 18 May 2026
 17:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518042833.272221-1-enelsonmoore@gmail.com>
 <d40b1e80-37fc-4c88-9d7f-dae6458efe6c@app.fastmail.com> <20260518105735.GW3126523@noisy.programming.kicks-ass.net>
 <20260518172444.zyd47mcagrcwu7wt@dev-vm-schuster>
In-Reply-To: <20260518172444.zyd47mcagrcwu7wt@dev-vm-schuster>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Mon, 18 May 2026 17:13:58 -0700
X-Gm-Features: AVHnY4ICd7H9-70Xucdx9uJAfA9u6BhUaXyRyteuNE6Jo8mNtePRuTvmeSFjqyQ
Message-ID: <CADkSEUjhq6HSdg4ignzbuJiN5uXATsTdxFbRJ3BMxs5=WUWLDg@mail.gmail.com>
Subject: Re: [PATCH] nios2: remove the architecture
To: Simon Schuster <schuster.simon@siemens-energy.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
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

Hi, Simon,

Thank you for notifying us of your continued use of the Nios II architectur=
e.

On Mon, May 18, 2026 at 10:24=E2=80=AFAM Simon Schuster
<schuster.simon@siemens-energy.com> wrote:
> Unfortunately, as we are an infrastructure provider for civil energy
> infrastructure, the refurbishment cycle is a bit slower than for
> traditional consumer systems. This implies that the traditional LTS
> support duration (max. Dec 2028 as of writing [1]) is rather short, and
> we would be glad if we could keep the architecture in mainline for at
> least 5 years and only then "decay" to LTS.

Your reasoning makes complete sense. However, there is an alternative
to maintaining the architecture in mainline.

The Civil Infrastructure Platform project maintains super-LTS kernels
(and a set of base Debian packages) for 10 years. They are intended to
be used for exactly these kinds of devices.
See here: https://wiki.linuxfoundation.org/civilinfrastructureplatform/star=
t#kernel_maintainership
and here: https://cip-project.org/about/linux-kernel-core-packages

CIP will maintain kernel 6.12 until 2035. Is this long enough for your
lifecycle? What kernel are you currently using? If it's newer than
6.12, we can easily wait until the next CIP SLTS release to remove
Nios II support to avoid a downgrade.

One important thing to note is that the default CIP kernel branches
are not equivalent to standard LTS branches and include new hardware
support, which has a higher likelihood of introducing regressions.
However, the -st branches do not include these changes and follow the
same patch acceptance rules as standard LTS, so they are likely a
better fit for your use case.

Also, CIP focuses on architectures used by CIP members - currently I
think they are x86 (32 and 64-bit), ARM (32 and 64-bit) and RISC-V.
Since Siemens is already a CIP member, you can simply ask them to add
Nios II to the list, and you can assist them with testing and directly
submit patches to them once the standard 6.12 LTS period ends.

I hope this information helps you decide on the best course of action.

Ethan

Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26372305E2F
	for <workflows@vger.kernel.org>; Thu, 23 Oct 2025 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761216131; cv=none; b=aiMQiWE3GEZEJL/bUvXsH8JXwpsKSNxD/f7zXbVlmdE2BnIYtCh608Ke8lhf7eCjrJPged/8NhLoYJwTKqOoN8Ixhr/oksss1bBvue7XOH9USwS/h9lHUQzl6Sii65ln7zEu5ysntsF6Ub8AQEqbSKXcQofwK4KBcUtA2pwvDls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761216131; c=relaxed/simple;
	bh=jyg2eZ/1XdoAlTqduehdddaNsDWPY2qdFBzk6zBgRik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h1hNw4aKUq9C5GUv0iyQZYdfmyxWJUslIDWecDnbiwMWpgTg0WIzB83/xGeBwxHM1CqPeqnwL94Tvp4eKevV9aHZWVQGH5l9Lx6e2CbXo0u1aZlYadK7wHJLg8ZcgLD4ryqBc87MAGW72nqg+TD2mZZV7bWdO3quWFMk0XdVGDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMZmyn7B; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMZmyn7B"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-63e0abe71a1so1068492a12.1
        for <workflows@vger.kernel.org>; Thu, 23 Oct 2025 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761216127; x=1761820927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNwYeVe3zrzgI77kfJc6mmnbUyU3J+W0mAD5mBv2bvM=;
        b=KMZmyn7B/WFxXkWm30Gzod9FYX4imYKhDQ9n1mJTerhcsgny+cgqDx+hERs+OAOARl
         j9j5G0crdnySPQ0Tuv7uzQkUTF6OaFlYnvKyzM4BzQAq4w0DOUxGTwVD5dzewb8DajjA
         NfH5APIxlzWnR3+FoRyz67FRmy7k4mtHcfxlTM0TFbOn+G52nu0pPdcWyvTTKw0BIPpM
         Mp6Cp2v+WWHTERxkowt5/9tOkSaorOxci/ahr5N+pC2w/lUua6eEjg6bKgR658/nxFE2
         ffjOM/9n7vSEYkTvjkSH4Wsabm3gcHPe5YBtV2VwoOK/UX3Yq8pidgxPDkUwIKcGkSnb
         H2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761216127; x=1761820927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNwYeVe3zrzgI77kfJc6mmnbUyU3J+W0mAD5mBv2bvM=;
        b=dJu3IATe/t1v38iZPX4zI0MI5cpy/vvgGjhWixu2nEhMeKW3Q/N1TErW8bfqLr+f/a
         96V80N+6iZ7ssHmnZWk65I/M4tKqoDjwh85wR9qQ+nirfJI49El5DJgemnTx9B+WMOmv
         sOnngW8YR2wukOcRgkxUdkBWPoJ43/VWlu2pMxylWU1lBx5JUrnPqYan5oRhDjZjyG4e
         c56XI4zjkvB25akIs3i/OmDEhS/42DLJkYPLCGAhxl/FVvIHWABMuDNf/2iE921emLod
         p6km44L5CWvcgEHI110OCgDJD4myX+76talh8hNtm1LTdtNE88ZfUSqQp+qK3rytsq18
         8oeg==
X-Forwarded-Encrypted: i=1; AJvYcCXnJ1DNUwieN9BOoJeBJMb12pBZVJKoefd+4Bc0sKCcKy7aolQnzRPGZAAcpGXW6eiYhoJfL2Vm36c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVv0WVjkCTDIiwWXOnfw5tK/FFRXWC3oU7YntwBUYcRG6b75so
	GY3y7066iZjhNFjPmyA72/XFvkUq1X8nBgwAPWwVDgWri/v36/rC0LGa0/HzPBv/mtDU526BF0v
	Z4NmLHiN7oupTFX0waq3RXHiTLUzgCR0=
X-Gm-Gg: ASbGnculjUk3kI/BJjgKOlZ094jbPahsivxf9uJUy6HD43QF6qX1WNNSz1pUxtjylNW
	yjGcv38XWD96t/KOSreKu6AAhYFcNm3dr59yCSKcEK0+nlFj4XbkL+NL7G8YV/ah8f+Br8QbgAT
	JObVUGGdjd6/i6idRL9tSa4GAc34LugovIp9UpgvINYqkc6DI3TLsDKxMaDI6LJxStrxtfnlQci
	7F5Mi9EqKUIj9hSM1jMQFDGphuUQZVRgipUFToG1B6zSe36p0ciSagKLQwNXjggU5EGnF37FqHG
	kPCUnGYEjxEZ9e3dlY1SGQ4JhpyqMQ==
X-Google-Smtp-Source: AGHT+IHj9sqZlFAd6qPNTa4C/OpRKo92Gcn6zexlmgF4iPE+98wHJzEkw8o+T+JQbLSjLVQOB0m1KT0oZjfCmtuivL8=
X-Received: by 2002:a05:6402:90c:b0:63c:489f:df5 with SMTP id
 4fb4d7f45d1cf-63e3e10eee3mr2179427a12.16.1761216127196; Thu, 23 Oct 2025
 03:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>
 <aPiG_F5EBQUjZqsl@stanley.mountain>
In-Reply-To: <aPiG_F5EBQUjZqsl@stanley.mountain>
From: ally heev <allyheev@gmail.com>
Date: Thu, 23 Oct 2025 16:11:55 +0530
X-Gm-Features: AS18NWBdMh0RmpDPGmhjn_SnwsO6o_RPLnVM52wrjLiLq5epUawW0vv-w1GvPEY
Message-ID: <CAMB6jUGhcJ=W3s96jRBHHTyPfBm+-+d6-VQQ3mXft7=fBJ0jvg@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: add uninitialized pointer with __free
 attribute check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hunter <david.hunter.linux@gmail.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 12:55=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> I made a list of the warnings this generates (on Monday's linux-next).
>
> None of the warnings are real bugs.  Every single one of these has the
> assignment as the first statement after the declaration block.  We have
> had bugs because of this before but Smatch and (I think) Clang detect
> them so they don't last for long.
>
> regards,
> dan carpenter
>
> arch/powerpc/platforms/82xx/km82xx.c:30:
> crypto/asymmetric_keys/x509_cert_parser.c:63:
> crypto/asymmetric_keys/x509_public_key.c:151:
> drivers/firmware/arm_scmi/shmem.c:199:
> drivers/net/ethernet/intel/ice/ice_flow.c:1576:
> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1015:
> drivers/net/ethernet/microsoft/mana/gdma_main.c:1508:
> drivers/net/wireless/intel/iwlwifi/fw/uefi.c:821:
> drivers/net/wireless/intel/iwlwifi/mld/d3.c:1788:
> drivers/opp/core.c:1413:
> drivers/opp/core.c:1480:
> drivers/opp/core.c:1797:
> drivers/opp/core.c:1888:
> drivers/opp/core.c:2874:
> drivers/opp/core.c:2935:
> drivers/opp/core.c:2989:
> drivers/opp/core.c:3065:
> drivers/opp/core.c:3085:
> drivers/opp/core.c:3104:
> drivers/opp/core.c:312:
> drivers/opp/core.c:330:
> drivers/opp/core.c:412:
> drivers/opp/core.c:450:
> drivers/opp/core.c:608:
> drivers/opp/cpu.c:157:
> drivers/opp/cpu.c:204:
> drivers/opp/cpu.c:59:
> drivers/opp/of.c:1272:
> drivers/opp/of.c:1331:
> drivers/opp/of.c:1428:
> drivers/opp/of.c:1469:
> drivers/opp/of.c:149:
> drivers/opp/of.c:1505:
> drivers/opp/of.c:174:
> drivers/opp/of.c:276:
> drivers/opp/of.c:352:
> drivers/opp/of.c:409:
> drivers/opp/of.c:48:
> drivers/opp/of.c:98:
> drivers/scsi/scsi_debug.c:2964:
> drivers/tee/qcomtee/call.c:648:
> fs/overlayfs/params.c:451:

Thanks for reporting these. I will try to get to these in later
patches. But, how do we test the changes?
KTODO: run checkpatch with uninitialized pointer with __free attribute
check and fix the errors

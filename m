Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792492027;
	b=Hf+3hRSeCP3Lf3GF7aKljnfJJSfCO9CudC8uZ2HrqzTkHHSC/I80ZSQdXxZa06x4fw56
	 HqrXFo5CJMIm2QjKwH+SBupItq1czCeuvIinnZIFU0/EYAZj7/kNOQGkuQ9orhW/r5Wdw
	 nrSS+UbuqK+7V4UyL7/UopxsqlK1CPX1JfDquSZK75w+5vACrrgKGpARNKFQojOJwaEnL
	 7wAy9LJyRWw3d19eieudLoD+GjWEIYVXHe1wnfhONz8I4JBfmGLDWFVC1XtuhmZ4LHJyw
	 qCFh0vEFJUTl9jg5OItCv4z5r5nV6qv8KCxWCjEdvXlq1T0hBMZRHlgL+kHT3QTy2mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
	b=iKQZiI+Fectddq2GdfoPvBNXTh79Ud0MermHEcr8xGjNbdDNGVeJpCbOF/FIsyK640mh
	 uiuF1piYEteUGGGLMJHNE7DtiEWe4BDDd7v9vsA9obbjkSsx3LEvLEUoewPWz6nzZ8RHI
	 ukpmbhyVi0XxB2LiLQ2A6TlAxM2xr30Dca0A0m08CUKrh2p25NAqXcmyvm+jRHV4pQeEM
	 ArfdKMCK79CD6bFWib9547Uoo+OyrxMo1iC9Lc1rwvh0Ya8mOWBEJ5V28deI396RadA0c
	 O/pIK5dAH1Y2CZOb6NyQmdq03BHzrzHNDeSfhjxD1LrsGnFeWLYRIMgujak2DIS6OQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eK+TzsrG;
	arc=fail smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677EE606A31D
	for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 10:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 677EE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eK+TzsrG
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35e8253292cso203202eec.3
        for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 03:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492026; cv=none;
        d=google.com; s=arc-20260327;
        b=fMzsFLaguH/dbmu78WJiUvw4bT282N9/27e7EQNJDhtt/fNXO8OPMVXmqe7A6gA1+G
         RGU+xWPTvMF/kR9e1zomyC4VQwt+FdMaeLHwoKqSkM6X+ejx2AgmxR97L0i8FdvQ6wsD
         gjPTsMSh7c3hp97hTDL52c5+4aa4e6LwiZSldomVelAuUTcKzRhp5YErSanx4d5VvN40
         jKAWaqV1wsFIUsbaybRw7slr+r/3/1exIwwNUVnEYQMZSJgQnPgSVhN4gt8cidKRiyg5
         KHl4k2ViapExNAxy2j5ddtV8juomxVU6vnLLRSU55aaXdlJJPuim92wxWsyH3mOyrDFp
         9wtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        fh=6lTFj8ZqHKX++CuFvrWShOh3Vj3j5NUsuRPTjG2X59k=;
        b=MqukzkOXZZ1rvjrh2WCtJMzKny9bf/tutdFObKSzDOI05sgWZn2BCvvOpp8Vckq4DM
         9emCmBUs7XaKGcc6/IymR9rn2tIpYYRrCt8LR4pmvZmBMFqLaj5b52iRIeOUlH66YhYf
         B66o48h7mUK1SwMj+Dvi0bQMqOu4G3VQHcx3FnfpCcjvUZIBvBnm0QcwRsw4a+khQo4G
         E06mEJD7yN+Gsajo+4yzJ2aQJNUfPLmZhyfbqCDsTe+JV2GM7/ZG8mirB/WK911vb2mB
         5Mv4MTiesyX3NolDsggN/2rCADtN9Kh2615SYfuQu6lVM2bRc++DIlC6/D9VVn34WWtr
         GpIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792492026; x=1793096826; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        b=eK+TzsrG8ppsuUBTMaNmtZbCwx1Zipxq05QH5xDzFvCB8pUTqpe+AMfkezQc9FE4q+
         47eMC81vpyd1Omv5sO+zDkakHWpHql5m6bNxnQrVrvxr67vRPTY6ommHrH46rl4pbAGe
         oX6tn5uuhJ0Pny2Z7AimovUIRmVppIjpaIUGRyBcLReYhmWvOUSr+tvqcrmE8j6JqQ5P
         zlspHWJBGuPxO2SoBJ4XJKzWF7VFR+Lxl+xi39nnPAMB8SGoovD6X8OZvLAh4PTir1zc
         7fQxEGw85RUrzwIka79bjhAwvI/G9PAfrDnYuaEL7jdUzxlwUMz0LmM6SSEsa902xGjR
         EmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492026; x=1793096826;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5joQeDuaNbWkhSZiYGsKQCTB9a364Yr0MCQ6LWBnYBo=;
        b=PhVuBdv+mC3ur6q0Qukt2/c+Jld94vy0+i+iL5muyMAmniIRoO9pIs7OVyUM7GRc4K
         QpBcKV0+F5a+0wRdtf6NEixAzH2y0xZiuAvLxEsGZ+E3hKuIvJx4cL7I6Ceic0gXBwgB
         3qbJ2QKJjf6ivyVT070trzffPTJ7osS8N+8RO4qMKKQPzkPbaBTzcrDXO2lk91LolThZ
         r4eo/utg/lIKhwo87gBFloH186PmFExt7w+8IH42KfKJXdesgsqJVl5W0poZCSQMBeIO
         9opfUrJpQY65G9T/DDDsY4uJ9X+ExJGx1TX4CBGuUfli6sFaZk7gIsPqP569JKEvIL4S
         RqdA==
X-Forwarded-Encrypted: i=1; AKwUvBxxRIFUKdoeFnp9kcMZDk3qmpQCxJxX2PLiOJA8CbLOFc4/kd0NgCwf83lSLdmBK5RIW0kD18Bidww=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhyNer8NxmdoAPLlhbaT5DIhTLqUdDD/1basHvAohRt+hZeTDy
	Q14psO2sOnOeOi/vIsC49KX+CEeqkPvHApC6SyJniFUQSR0iuMmSriQIr27tQ5sn1+Hr4nuVlun
	xvfwEMylFjBOzqKfQ/q7/HX6B9aoo4BQ=
X-Gm-Gg: AYBFou2JVIaUv7w9OAqFxQ3ETzoqoy7OBLMCsGoyLvHrAn+mkuTbryadL9P/5GlMtU9
	YPL7b3+qjck8uez/jQdOgLGMSvevzG//T67Ibm2k6MMWRNAz3XzpyV+/3K3W6/hcsirjq6CbneV
	67g+8fX6MXtCzvRKReORd4pJreneFUxVT2QgtBNT4BW7XfpE3+qgm+NZPd+MNUriGAjmnzGHBah
	GL0oSrJloydedRxRoqhdeOT4aOC64Wl0bWlW9+zigUFmb5R3lekI/d+EjGLxqY+w1y1jOkxxKAn
	0+fAHSAtJ+eMdQonQmG+NFCpu8PjIfHoNMM+zOO0KoTOe/W6bSkkrnlzeRmhZ6wjQIURQVtCKC7
	6oGaQz9jhFJeaKcQycO+nNJQwQR09UrzOe5jN2OsCBaSbpawi+Hhn1aHU4pa4phl+sMnrBr1XyN
	BSo41Ibe8XEeKcwvLehpV+qfScekxiAzR2SFfdPBQ79TLX1fSZ/f4=
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id
 5a478bee46e88-361a136a601mr21744064eec.2.1792492026480; Tue, 20 Oct 2026
 03:27:06 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
In-Reply-To: <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 12:26:52 +0200
X-Gm-Features: AclHuK-QCNlJqtXqMEy-POlR7cKE_rSWRMxYBpanQuZ3UPD3z8WuYE16A81SYDk
Message-ID: <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 11:59=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Which tree should this go through? The Rust tree? Probably too late
> for this cycle.

I think you send KCSAN PRs, so I thought you would use that, thus the
Acked-bys (I suspect others thought the same). But the Rust or Kbuild
trees are also a possibility, yeah.

In any case, at least for Kbuild and Rust, the PRs were already sent
(and, generally speaking, I would have expected a patch like this to
be in the list for longer anyway).

Thanks!

Cheers,
Miguel

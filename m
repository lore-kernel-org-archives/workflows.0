Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792520558;
	b=hczLw7K928ihvXbuWiQveUnVIam9K+jwkjB9yT75nISNBfb3m8ttQJtcEDP7LuikUZTc
	 1mzlZUBlC65nR0wSeAb8Yp0l0bxJOB9wLJnkD2Yjfdy4wG1uUUKjYsmiIalwbNVMDyByJ
	 tYz9Lhdruarp2XJwmMrclNq7enAtsZz2OExIMHR6hj5owTw8Q212U+suZjulKtmaZr3aR
	 Qs4ARQQEt+ctKODTRsXhtlcJraYejrNBVcopVz2UqPOWeJMi3h4n86+YNvmgWcuHLamzA
	 9GXTtNBgrkjhZBek/lW1OHVJBYsyVZ6LSh9OfRlckzrPi0rxOxNTkt6vbHTw9qrtpHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
	b=ZSReWj39qZ3cqxHuKrF2uth1An4Xo9L1vAQeK5ZtFFjcnrrymSxjZxzHWSQ3rpUxZf7H
	 vlKNlZRsGOYXSSJrn3AKks4B2UmysBqPmQuNW4UwWDvAOTEcGLhzh4aU5HcX5zhDd25Jh
	 WA/oRha6WKuxg9pGJ7XHpnlfXYY0YBZOTk0VJbmghPGdepHEjaLntQF97Zl3qZYVa1EF5
	 Wr1dKTbi46NDsfgLI6MkdzW9qLplja9zOXLYHvBnLRHFsq7XbTcm0BOaxyNjF7IjZ/W04
	 tCwHYvw2YMT2UjjZVYGwBAz6xGpd1Yiuu5NKf8X2xNsXfYg8V21sfZ6QSILTZGNijtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jCpPoMO5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10582606A320
	for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 18:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10582606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jCpPoMO5
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-679e6ab6471so919578d50.0
        for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 11:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792520557; cv=none;
        d=google.com; s=arc-20260327;
        b=B79m6TKebawLZLKGPLZJddgfaD9gczqlc5MYN6u4oAQtAPCaJVCnuONdIgkk++X5zQ
         +c0iswrCcMJgK0NVbfGkb3V5QjZHbTYArHhG6Vd6AC0FVqPH6GWoQOydpKJYpJs9qAup
         K6V2LpvcvoaeBFsE+HSMc501XESirY0S89+hVnF4U+/OTnDs9CoUtiCfEG+jwrP4gx0Z
         XLuur488Z0cf+RD+Z2Arl1967Vx/tMIjESByScHbKZFF/he5HphKDP9Zo+f7+Vm+uVah
         v2s0IJUJiZG+n9X4/4vPsuICH5IE8Tlk27O8sUwu6rmFtLC++xsiVDgkp9a8ZwKDvHLL
         ulhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        fh=cR2jMBJ55xupKOiSakJeSwQ2wNpzx9m5YcVy9tmpugE=;
        b=gwV+eDIe+qEF4I3vnjMFGHaj1Hc81iJsOcvCqO3XPgDCifACruZWS4W789Tyvsw0y6
         2ya8+0siuuKbYf14WPTseVtmzBQKUXmDhFxuGk5Nk4ocf0up98uQS1sx8IsT1A7tHgGN
         yvO8cfDznvaz3jdsxJGf9hHyR6jLmhN2gZXiM5ib4Eg8dBJZP9WHjt39hfA5ysgQCGjr
         v+0pYqPhw8I++fQBvQ0kmvNItSRyE93e0FLtus848RCqwiNpra62XmYP+DK533WQj1hD
         e8tEw6h/tH6Tn0f7piCXNfIP8M003vRmT80lvxDCel+KIDzemies4YIOry+UKca93vbp
         GFdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520557; x=1793125357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        b=jCpPoMO58y6sJRNyUMWUWt3Xaw377KaYeVqrCJswRAQ7oKQE3kKZ95epr4PHsw8jDo
         +Vymhp4pDTcYix/GYcYigVbhJ1c35neN7bD/cng2pd+6S7s+QzkwOXRmFWhmrZrBgKtS
         uF9e/+MT5cJsEuOOvqCc7whuK+e6LEQbbFr6JTp6HpsdMQassQUMqaIylxCgHB7Nna4X
         DLnrnpOCODqRFSx8BjU8GCmq/xzr12NndAQ9cVvg0WQ8c0FEhJ/i5779DSYCzc6Mmt29
         TZInkgPURMOVAxBDShoWsPQiMMC6ZVT87Cq5hblK6YvF0yoLo69dvfI3KNOWArT7GB0M
         CZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520557; x=1793125357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        b=0KPBbrsIl+xNCPq5CJl6sjmhRS8ebq1IeeY4s3xi3mk1y0/Fqw1aQINyt6brZPQRQX
         yszFg3r4ESR+0v5+bu1Glwihx92gFqNcCrDliKpIElaeOdSlk9wOKk6d9Hd4ub3E3/TC
         F9GNOZtV1snzOz4mV25AQ05RwZpcQIkwOP7Avsah5G5Neu+X59cNeOE4ATCsITnsZ2TB
         Gxpkqz8C99fyRpsghlgaKRUPf623yn4AyjLeLS4VyT+wCZuyZk/o63rtJCRGzCW7JEtr
         2IQ3aU6p63LQoL+wmdxnJO6b1YkwzJATacKtwNTm2iSr8+ENWDIq/O7SDvoX7cJjj0M9
         DYag==
X-Forwarded-Encrypted: i=1; AKwUvBz65wElzDhCMBEEVcqEltrT8d4NSQRfgT5GXe/sXGhjQx8Qz6yr58mZWO9j5ZqyIGhBh4eTBGaqFCg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtPAXGbk/u5/7lru/My+2D5Fwo+ShAeMBn46Vt33ownX0oO96D
	kEb4G+L7lqKuxLeuR4P58AGY5JhbNBrCuVVa8/LkvO1joLjNw45Ve6HeTamEyN0HwerlaN5xqsv
	KhfGDiinRLSFG3r4jYId5AB/PI7XRiZ47J9UGUt3A
X-Gm-Gg: AYBFou2thfPkh3UIQC1M3KEQ0gD7r56a3Lk1ZKSeIJGFGy89NwPO5nw1B+s9G6CVPhk
	9MbEbKpnAgIm3huDMnSeJhvI+BB8G8mvBfXLER+UCeuPRAvl9uj0pW2ygelMNsUOXXjFTDOD45o
	JppLUUoQX4h0c2sVM/IhgZUJe+LguI4pUubnBMdhSDRIkgDQKfzY1QUpfUk4Bc9YidCoo3GjOpB
	jcPea0/UWz573D8xaSeR1myC+Mkt0iDOrwUZ1xCLs/4uT8tIUKBsAMitOHSN7pyUtLRSaC0Jrnx
	U6x+iUOnWv2aiWIYD/8s1jPu6B1bJPACUa3SxykMjAxjOMmGNR4j/pWD9z2Uhqjce6w94hpJ32L
	MGXiHa6OdaXI=
X-Received: by 2002:a05:690e:1508:b0:675:61ed:ae79 with SMTP id
 956f58d0204a3-67a0e53f3camr15368d50.40.1792520555651; Tue, 20 Oct 2026
 11:22:35 -0700 (PDT)
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
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
 <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com> <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
In-Reply-To: <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 20:21:56 +0200
X-Gm-Features: AclHuK_xIgQ2EfRpHmzLAMkZfp67LMe6ufygxtV1abJhpWdiWd3lua4TQ51kRJc
Message-ID: <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Tue, 20 Oct 2026 at 19:09, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Tue, Oct 20, 2026 at 12:34=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Happy to take it - but in the interest of avoiding conflicts, thought
> > it might be better suited for the Rust (or Kbuild trees).
>
> Same -- happy to take it too next cycle, whatever you prefer.

If you think there's a low risk of conflict, I'll take it.

> > Needs some -next time, too.
> >
> > If I don't hear otherwise, I'll pick it up later this week / next week.
>
> Do you mean for this cycle? Linus may not like that, but up to you of cou=
rse.

No, next cycle. I'd pick it up next week, push it to a branch the test
robots see, and then update my -next branch after the current cycle.

Thanks,
-- Marco

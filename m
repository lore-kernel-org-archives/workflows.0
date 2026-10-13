Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F1C48D879
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 09:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884329; cv=pass; b=L5qVF7iHc1qCxXDHm+b6gB5AJFc4srVk8YAQYuZ0pNAl2NIJNJlS94MyJuxVAty1QYQPxdsClTJj7+q72OpKm+AOAM2VJSsJZI4T1bs02IEf+I4OznVQskwan54OYqKYjtMwjSdYu/+sKxfEZt2+zOEOX3fHRaIVj+MOwRaBpKk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884329; c=relaxed/simple;
	bh=8mVe66GEzd6sAkunACXVynKdmNft5klxWxxBXtRex2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jEKnBYLmD+VGiYT+6orxNxU5TgJXq06+u3saTA6IITPP4qepXtRaEjPqoBYKHueJIYbN+9v5kwgqhDSQYzLc2RNS6WKmAhwf4UYgRiviW9TIbyE5WMsFJY/j40LiNMHUhoOhcTP0YxP/+M1yQH4roA5IEC6R0E0pFVsLZXLoHf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fMRxOVnx; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fMRxOVnx"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-157fe9d771bso684369c88.0
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 02:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791884327; cv=none;
        d=google.com; s=arc-20260327;
        b=HPooaAxNPiRPpUQoq7KHF3P4M3H+55LXuQrumxlQM/eqccZhzG9w6GcVrXrH9T5RgF
         10/zpgOQG2uKG9e2Uu8/Ygg7wpNoa7+pJtEPf+Jt4BhyE2m0rHSzv2duht/eTDZwVoZR
         q4VmfJg/f7zJatgV72gtopugAdU375m0NBhLciN0AFTOT19zOm6jODAcEDWHd96dH/RR
         i6gWRhFTsPt2n8UOnmzZOU5VV7bcQuT/hNif6+mHTji9F3CHkzkRN6Bz2z96lXKhek6u
         FPMxiSzxjoaGG602tqNdEKVIOzxswnI0s04k+8vhcRttfA5OMvl2cG7NMzZDvBAFpqbi
         l6Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hjiBRpMUG3UtZRbPmQwOuJtx4+jqLwpDEaQOQPQts0M=;
        fh=nQaHvc4+oC8rqDZrqt/Q6nLZEOpC12KThMKcngGay7M=;
        b=Tzc6Vy9IaOEfrxgjYIo70M8JwjpaatclWZwTsGMdDPvE18RXFnlQWPh+Ry5L266Edz
         6iPSxrs/BIkEnp6bZq1PLzix1xvbF7yJJGEk4Hq94QGzrz6vWYZQ+mb3LBupLdAFuW0d
         O5PbwTYzD2omsgRihqCu2bLc/SkLj0eQjVf+jcvLI6mnWj+NPs14Qf18ao3mFzTAtVHQ
         QABU2IHVdTSluUg4gxAxKg6uKdfX9qOxYQnRruIHmUYVa0AoApTUuTHtqra11mUg6m8u
         JqVWgnm8dMGFvsyhckm+phPN+VTojEzhBi4lcyApAGewUjqjVDbTWh31CsFD7MISiBhs
         fnLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791884327; x=1792489127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hjiBRpMUG3UtZRbPmQwOuJtx4+jqLwpDEaQOQPQts0M=;
        b=fMRxOVnxfGiRtuHQ9si2tnCUNmkYVlpuZbNO4B59qRQJs2WZVkN7Hc4e9FI4NnP2LM
         5x+bmnQHAe+kOpwNrB8QQChHXAExdMJWVwh8TMgelJmsK4lqhoZXUo0eAksT+Rh1gtIl
         zzjIR48i0ZQle18ZwgutnUmgorlj10HKyXOTbOynbog+3XPnAlqaClZOKNxuyKNohRGc
         /yGnP0zNrfL+QEPlLuWDACcB+IsrXCaJuNI8cfhJyQNPXyshX5xERUlvpZRShgJPORfg
         QLLeVg3U7N2iiA+HblkOI2vjOsDOaFaGgmOoW2+tms4zWVO4qq6K8loph1sr0+XXsVL/
         xsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884327; x=1792489127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjiBRpMUG3UtZRbPmQwOuJtx4+jqLwpDEaQOQPQts0M=;
        b=xxhiaxjSEiTLg3Hk0yMVpun7QwbP3fJ4j5AWROKQv5XYk8lz3V2y0RWwqNp5Zxsos6
         lewJkYXgZX9bd4t1KtbaWKYCQxWrSRDLBqaF2Xhf1lo1J/tTeRArxPXQx9XISg+8PDGl
         kmhDp8V2xPC6gktc52pe5HbUb4mqARH1TXjBiXB80Mt+YlKkkDuI0Qdupo6EWaEcbUiR
         flc0vPiSEnlUFQc+bd9liEGjnEZaI2dVx9Vrny9gk3yTJjeWerGCHsO7pwKhf8fo+iu+
         +TSxltADl/h80bcwKxOYOHKhzNL38zR6NoYB2GpLs8Pqi/j9qXr1nO6zdmA9GCbGXPHU
         joqw==
X-Forwarded-Encrypted: i=1; AKwUvBxMujhf8+YXK+tYDmD5l1yhxusa4XjNuf9O8BK6cD/HpbrtcV9EKazdpQhJJl2ELDBZi8ma/A0iUI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIV7NBwXbHJ5gbzgeYmzFJ1jcxhM/p+jrerqKROk64kZWVtajDd
	Fg2hFssPhuE4s+bwYGkUNFV1iHKIzJMg9p9639/uA+VXc67Gm+7wHMvKLz/O/Shss1GA4IvvlZE
	v/nzEfGCTLEx9Ct4eUw7FGq2mDEaINSSLj43DepoM
X-Gm-Gg: AYBFou23597kkYQnS/Fkk3gnl4m5JB5zfQzBJHAmTrFqP/jR5VpFNTQA/6FCASt/+kZ
	skDzNStG/ZPVmFbcIFDT9SulhKW51fQFP95NBPZ+mqcBlz6eFJYLU/LRcNS1mzB5dC4xhdcyQvP
	/7yj0QWsYW7h7UqNNqEN8dDyIegdccGaY7urmaHLUzLYI/tBvXeFje5s2UKoiP9vZoOQC2dnVt8
	QqOOmdQNkbQ7cTpj6H0NeB5zpOMPZZaYMFVHX5UbZSpenUpKI+xpXOicmPUoDAtXfbAe3f/dzUA
	mtyYVsLyFa7ayzuw7ueObiDz+TRvU+sQM0A7YW0QIjxmLr2gfMYrM0UE7rsOZCmyJ2Tt0+ichz6
	urNYdF8VcJQ==
X-Received: by 2002:a05:7022:3c89:b0:164:4e36:f956 with SMTP id
 a92af1059eb24-16a5dcf688emr13638519c88.16.1791884325804; Tue, 13 Oct 2026
 02:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
In-Reply-To: <20261012134159.912183-2-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 13 Oct 2026 11:38:08 +0200
X-Gm-Features: AclHuK_RWeXl8fcFHu9JpahURaqcaQuQAyqWtIrLMC7fvirHYIMspTeFsZ9obG8
Message-ID: <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> +        // SAFETY: `probe_console` has the signature expected by the `co=
nsole` tracepoint. Being
> +        // part of the kernel image, it and `OBSERVED` outlive the regis=
tration, so there is no
> +        // need to synchronize with in-flight probes after unregistering=
.
> +        to_result(unsafe {
> +            bindings::tracepoint_probe_register(
> +                &raw mut bindings::__tracepoint_console,
> +                probe_console as *mut c_void,
> +                ptr::null_mut(),
> +            )
> +        })?;
> +        let _unregister =3D ScopeGuard::new(|| {
> +            // SAFETY: The probe was registered above.
> +            unsafe {
> +                bindings::tracepoint_probe_unregister(
> +                    &raw mut bindings::__tracepoint_console,
> +                    probe_console as *mut c_void,
> +                    ptr::null_mut(),
> +                );
> +            }
> +        });
> +
> +        let worker =3D ctx.clone();
> +        workqueue::system_unbound().try_spawn(GFP_KERNEL, move || {

I ran this locally and got the following warning:

[  623.232012] workqueue: work func
_RNvXsb_NtCskctMpSfuwL9_6kernel9workqueueINtNtCs1G77UTwpz6o_4core3pin3PinIN=
tNtNtB7_5alloc4kbox3BoxINtB5_11ClosureWorkNCNvNtNtB7_10kcsan_test5tests9dat=
a_races_0ENtNtB1d_9allocator7KmallocEEINtB5_15WorkItemPointerKy0_E3runB7_
enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.

Do we need to use a different workqueue?


> +            while !worker.stop.load(Relaxed) {
> +                racy_inc();
> +            }
> +            worker.done.complete_all();
> +        })?;
> +
> +        let start =3D Instant::<Monotonic>::now();
> +        while !OBSERVED.load(Relaxed) && start.elapsed() < Delta::from_s=
ecs(10) {
> +            racy_inc();
> +        }
> +
> +        ctx.stop.store(true, Relaxed);
> +        ctx.done.wait_for_completion();
> +        drop(_unregister);
> +
> +        assert!(OBSERVED.load(Relaxed));
> +        Ok(())
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 4d5c96ddc49c..009efda9e7a4 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -94,6 +94,8 @@
>  pub mod iov;
>  pub mod irq;
>  pub mod jump_label;
> +#[cfg(CONFIG_RUST_KCSAN_KUNIT_TEST)]
> +mod kcsan_test;
>  #[cfg(CONFIG_KUNIT)]
>  pub mod kunit;
>  pub mod list;
> --
> 2.56.0.385.gd3acb90ef8-goog
>


--
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg

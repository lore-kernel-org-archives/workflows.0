Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2593D667D
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 09:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884208; cv=pass; b=p0v+qFVFZSnP2APGFEXFpkLb1f//7639fQGE5a+2vmWEPcdYopBv54FXNwjmTccL5qQEF5Ip9gSyP/6fGkGxv9XpTlp/B1PvQSPep5lWBVPJMChQc85VtE9bTlXb8OH6Q/zmDhk+UywK6rvF8NHdfr6i7NByVmhvXbDioQwWLSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884208; c=relaxed/simple;
	bh=I2RdC5E/xdt6kf39B4bXuZ6oTCgSZu3FzLdqV73aXEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kIz1hinuw1njcLE65D71sydD3j0CD/rBJFSlbsHEmgvSDa+y8zCTmzFs7slAo0QGGlggFhWffMHxULXsS5d/5fSssAHWGTV1UZPb2pxIJuDwN1N05VzkBtSrPnhbyunykBEedn8T6M9tiYj+yZ1liPUkiNqGlKXe1uFNlf9WDkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jkmEkFH+; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jkmEkFH+"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-141395927feso4948242c88.0
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 02:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791884206; cv=none;
        d=google.com; s=arc-20260327;
        b=G/1DL9qZcm70vli1EsU+FA1asxwJCmJxfx6qaWi9ov1qYHLkaS/58QIKONFDZ7n8v4
         z/T1nGYggHsl0P8q49HHOswOJdXHa9PHKlmyo+n4kn8fnuj7vWlAWufwV10xFNl3Rg3F
         NwmgG0VYOyDbMw0tc4w6hi9t7DNcBGsUNd3mh8IdJ7DmdH0j2TMb16SpuGoAMz1nBj/n
         NrYFNEEeszVGZSOnrWEqQTxQcz2TP8Sx1jgRr3NjAZHmKM1MPW+SbvmEIUbA/UUVQJLr
         Xb2GUR0QdL79+vdyR2pxJ/fff6Myc79gOo3+1naGViAo2TT6mJhfZUZoivyntn2c5OSx
         b/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncnpTCvGaFuShJ4tLE6dDK3qF1yOJrFsdmhxteIUYa4=;
        fh=82U9gK8Nzw0DOhI8s87gmzFBDdurgBgsBLbcsUoZWwI=;
        b=kowH7bwVZWiFAu0NvVkSGljvN1myk/pNPoKf47OnpqdichLkeCpoVW4aNujrammJD1
         /BeZsuUTVlxd3MP03ESIko+caWkVU6ct0YgPfHcepubZdaOu/Sus6Eds9t3NrBt0SQtl
         81VQhUJObOZjk3+G0VeYnmqbxxKVaCT56qQNohGmZeUs4maTM7MIT/aY0eAEqdedJSFP
         wNw+9Ao6zsKqEPw0nnjVjV0Z0hn9y/5ZvxClRw3enETizVWxqXue5VGXwE6oejekWAG+
         QNss0+HTKUK9FH+Pu+3aUg7JlKt5RbASR2/MuHc4cRopmq9YU7D6AsxzC6wkTiOvBIX+
         gl3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791884206; x=1792489006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncnpTCvGaFuShJ4tLE6dDK3qF1yOJrFsdmhxteIUYa4=;
        b=jkmEkFH+T3MyeQjhmros28hqe0uiimDW20NShlJw9F/0Tlf/TWlx8270B9ZUpH+S4Y
         fdviQ4G9wAntYM0lOgf3UxP/AXBy31A8ktqu/2Nva+3mMtKUONhwzthwXfZptuaoP7oc
         Reo3vqOs6hGfaL3/qnHWDXL3/lj2hlEQ6s8oHgExR7tE2moOSR5rgy2ZdTvCrjJZ5OEL
         qcYvIm5svJ6VmU7G1LQ8hC6vzkoGYwi5hjF6H2H579WDijm9QqQuTpV9wKXkJBY1lbPv
         pKrq6zvIfgGajbsCLnbmKB/zINRFK84+fqjGUGVdVu36KV64qYGysfKSS0+fDbbQKCEh
         TxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791884206; x=1792489006;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncnpTCvGaFuShJ4tLE6dDK3qF1yOJrFsdmhxteIUYa4=;
        b=Av1brr8QH6/h5qcjPO13ybF9IXovZk9vcTPWN1HU6eDhXmn33CNFyiZjbjsuvfnF4t
         2MV6u6qhWD2VGCXafdftkWA8QAT6f4s8QiBtIWF9yN5jYhjRiXGvHvequ9Mc8DUBR8HG
         j9dkTMafSNeDXPFlBNSjVtpms6CjjBpX4IxXwoJRuKMDroSNPWtejSrYrkUhdCeU0nfJ
         IIq5Lfkkl3TWk7fQte2fDqfYgolywLmK92CKjiD56yAwqzy1ObgalS14Vw6uuCE+65zK
         mu/0WbkiFgYll+6vLAVNA9ZAdOWJ3XsWn4OyGdBkYlvkornkF0ZTg/N8Roam67Azczei
         cYfQ==
X-Forwarded-Encrypted: i=1; AKwUvBweMoMS0GfpxYt07EltbsL9ShFALKIM5eyFSK5zPsf/knmJd2NpZyPNhT7ryyur1tpAgChcIbAVsps=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCHMP/8tQfGA8B/rweLTAqjFcFNkdmBKYB9T4dElHg7hB4ek+w
	vwjMLtBgjZVM9VaK34Q0OZ8PcHklMmC/fgFTOV9Bx1Nkpt8gxYudBW4IestvWf4R4I0MY8/OjzX
	4nNehawxNEuMiduoEQBI3fG9Jo6X/FGdiIDCQnzx517sphMgA6zNqeqokz6GyOA==
X-Gm-Gg: AYBFou34ES9LnkI4dm5O+ZCiGVnbvDNv29MDm6Z0aKM5oxSOdzT3d4nUS0tSPnGmDdD
	NVtLG8Ma5cfjkK2pukRndn1C3E3olvJQ3mEbxIZLmluC5xTciwHSqO9iqCmErANeeFGmiEg6t6r
	rp4cQsEQnop6pTswl8xb21r5vDUut0Dk42qvndOJeHAIZsixjqNhCQxC8l/dP85tTr4SJPiWt+9
	+kIzmUIBQr838vGbcx7/3qqQ0yc50np8X5e43E2f6e3XpRR1RD+QUyXyZPKP0/BetVrTJPHQv32
	vLM5Q7SNigmWHxo28VrWlMVpY9QIjS+lwvzU27AM15Zs3ZUKRAhGHOGO9D5ptl5LXe/PSodMWz3
	zSAI7eiLEXA==
X-Received: by 2002:a05:701b:260c:b0:14e:8d1:1012 with SMTP id
 a92af1059eb24-16a5eb5248bmr15061808c88.19.1791884204773; Tue, 13 Oct 2026
 02:36:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com>
In-Reply-To: <20261012134159.912183-1-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 13 Oct 2026 11:36:07 +0200
X-Gm-Features: AclHuK_Q4zmkgXJ_aRet6tsAebmNwBt0xYiVjRfJ2laZogHRXSQmQgE1FE155EE
Message-ID: <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
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

> +ifdef CONFIG_HAVE_KCSAN_RUSTC
> +# The minimum supported rustc's LLVM supports all of these options.
> +rustc-param =3D -Cllvm-args=3D-$(1)
> +kcsan-rustflags :=3D -Zsanitizer=3Dthread \
> +       $(call rustc-param,tsan-compound-read-before-write=3D1) \
> +       $(call rustc-param,tsan-distinguish-volatile=3D1)

Do we also need -fno-optimize-sibling-calls here?


> +ifndef CONFIG_KCSAN_WEAK_MEMORY
> +kcsan-rustflags +=3D $(call rustc-param,tsan-instrument-func-entry-exit=
=3D0)
> +endif
> +endif
> +
> +export RUSTFLAGS_KCSAN :=3D $(kcsan-rustflags)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 0a4fdd8bd975..78f1c23e54be 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -98,6 +98,9 @@ ifeq ($(CONFIG_KCSAN),y)
>  _c_flags +=3D $(if $(patsubst n%,, \
>         $(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-ob=
ject)), \
>         $(CFLAGS_KCSAN))
> +_rust_flags +=3D $(if $(patsubst n%,, \
> +       $(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-ob=
ject)), \
> +       $(RUSTFLAGS_KCSAN))
>  # Some uninstrumented files provide implied barriers required to avoid f=
alse
>  # positives: set KCSAN_INSTRUMENT_BARRIERS for barrier instrumentation o=
nly.
>  _c_flags +=3D $(if $(patsubst n%,, \
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_targ=
et.rs
> index 7687b0dd5474..4b02bffa6b46 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -231,7 +231,7 @@ fn main() {
>          }
>          ts.push("features", features);
>          ts.push("llvm-target", "x86_64-linux-gnu");
> -        ts.push("supported-sanitizers", ["kcfi", "kernel-address"]);
> +        ts.push("supported-sanitizers", ["kcfi", "kernel-address", "thre=
ad"]);
>          if cfg.rustc_version_atleast(1, 91, 0) {
>              ts.push("target-pointer-width", 64);
>          } else {
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

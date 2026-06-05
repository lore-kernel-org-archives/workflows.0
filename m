Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF693CFF45
	for <workflows@vger.kernel.org>; Fri,  5 Jun 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673395; cv=pass; b=duhgcBQ87DZsOnzNkvKiZVigTDESTZD0pGWIdssJUGD6vgy9/UTnQBxoYSE+foPYQiThkTwFhaVZBD+j49w8zQ2sqoVne6S7YIew/aiKcrb7E13/R7xa4wbD16irCvDnRDAMuiNUud7pqXU7BSbZ3VdeyffA/bNohnsCQ7RorEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673395; c=relaxed/simple;
	bh=HON0Vmc+Uv2m+9L/ARZIecJdRDIMB40cGZIqinKUDVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3joPW7TA8mFxPaUsaxpOubYy88ZJat9Ob1e4E8GF7vgjVzXRFLG1qJL6nPAz18iC5Jl005GbkYutwNbY/vayYXopdTkO/EG19y+7mTYkKQxHLmGA/EX579Q34sK5bEB+Q6imP2er7ClSjcH3ChMTNiZWYGdaHCzrDrR1nqfRUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vfjKaH31; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vfjKaH31"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-66077c46c5cso2026011d50.1
        for <workflows@vger.kernel.org>; Fri, 05 Jun 2026 08:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780673393; cv=none;
        d=google.com; s=arc-20240605;
        b=RNwdzVJ+wsFAHtwh9x7M9uqBxY0d3R8KlS92fPqWvESy40iDZSPUVnWu8s3k4EqvYn
         hJhEFaWq1EImns+KL7eSWYayKmXe9jYAgCVrxkjo0C9tCVDffuRZIqW0KAvmrOopZ4kI
         BidR4JbcUPHbelWeuWB/l7RNNZycYwXfXUPNRXzWDJoAAQg3qbYGLnTVWVTrbMun0h2V
         0mXuYpBpP7IDkv/OwDOxIjbmBrGYBnKpvueaBTrxQYBkJFJaEHJCGeEdtRRvh2+al6D0
         4AyZ3ItBIsZPctMT2tryy/6uGGptTYQe3+FY4G3gfAgsKC28VNABbBDn28J78NtuuAgH
         scjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        fh=3K7DNwMU1O3xGuJUBhre4L920Q5Z3atsHXnsqj8A9S0=;
        b=e4fI/vmksU8Sm88FmOgCJHiqCCdLkYs4uMdX5+h2do1BlxNFIJcupwWLE3H4yzgQ0/
         9Wglz1TCpeUN+yzm8OszdA6mIInMf7Yz7MdBQudC0wE6pGud4n2jpI5mQZD1dfRwFjW6
         Zrou2OXuIa0Ag6Iu0Xrt5cBXkdQHuEMBulf+TFuy4+S+QOmAeas8mHBUWzzkVhQDL27U
         WK6Ia5WUtaDv+scPEtWqZ455xJv6EKneH2m5JJVeUMZxpIaEo8bKtR8HAiiL+xutJWpC
         jyVHCWAEzfYHGQX80jrwWIQ515N6gQHV/yF+IKvVA+Lfttpn/JP05iIkVt7qHHLHvsOL
         yZJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780673393; x=1781278193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        b=vfjKaH31f+6lQ3upr3PyLRn7MmHU83cfe6ChRbWCt6goUMmPn2jl0rIxPRuESMehyx
         JlwTecA2zsdBdZC4wNajqJ5tDdRhJQGdek1KUAkuSSHnGu5wWNW2zv1FfOB0xlenlvV/
         VHn7ZyBcjHa6J95xUq4/ZAtc8sWgBoZ77jSXpA7Pz0m0mi/AmFceYT5SX8KeR4OKbF8i
         ca4ZQHinJp2Df2RyuEkyXaob7WN7ZZYduCGItkdoLSb9PG3FCvNHZhWe0xqF+DjyL434
         KWUAuftviQm5BlqZ+VUauwjVyT3tZBBP5xYBIFkV3yzuE+6AZODAPGchOCzvtd8BH/4r
         jiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780673393; x=1781278193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pGE5at90J4zPleIdiXtGRgIUFnfxghG8AWeqoh9Pscw=;
        b=H7WSn6cWnJ7PLv9OblJ1hQvu63HJqQEzyAWy+fCqYJ110Egv726imGbIlYnyRWPvsb
         A0KjVYnAq46v/8KbmAQoiKJZtHhA8s/Zo4OqcvsoDrIR//7Trfc4DmnVj9kno1tSEh8r
         Y+f5DcCYKhg3yk2DAvBjBbjxcoI+kS44gZJ2p+AYsgnfWjfu3IFGM2b3PEeqfnJlFct7
         CcKd3z9xT0ZQTJ7WpBDDCtiRLigo5VNeok4e1kOOwVaXYTqHd0+v3LcHTPT/6xWKUq1I
         W23eFMpRtS/mtBhY06DSVpDguUnpnveZc7Pn1npvpXj1MVd5NpALq7lpc6LpDLQDXg5E
         sfcA==
X-Forwarded-Encrypted: i=1; AFNElJ+FWwoVaHO+RzmyrL4thHKhsCcteqmZvknRkyXcB4E0ExHd4bsri7f+oYO73GlgwRtfpNNQ7ow1KRk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvc6zfuk7sxOAuehgY+MLvGfU2TUv0GcVzRPm3CDKiepHxlAaO
	LKZIMwVCAox7HPDcNMUIbz3j0Z1yR0zsXJW/BPFjMVeOegJq7h5eoZziMfv4aGCyhQ25ml55flz
	xAackRPvc0NPCc9/EZ/2hMOE2kW0AubUE1jdb2jiO
X-Gm-Gg: Acq92OETbmf3u1ZjEKK3CFpm8oPM/bhuxiIUZr8iRN991baVYr7OQyP2AXvPbeEsfoY
	9XpFTPgMogKb49XlImBlw7X+xeqYYeSAl7Yib1Ab0r9R2lo1HO7GvN2IvOUhuRNdjbxtrN3ij05
	ybht5D1jW49n7xFaCDVHJIseXJ/ougd2e3lSG4AlWhzb5Dv+GyqpXKS07c6mf4qqX1FipbAuqnH
	I16BTyNIFBaIb74muSH1bqCQV2kaJ1BvIAa7DwC9lsh/itFoLP4pjTCWrAHHYByl3M7wTj2g3LV
	xLRoXKprgbHSgpg6JaVBC3JtPEnrMzimOkDA4AlBu4nZAizuc5s=
X-Received: by 2002:a05:690e:4848:b0:660:8e61:1a3a with SMTP id
 956f58d0204a3-66106e3f6aamr2683179d50.19.1780673392488; Fri, 05 Jun 2026
 08:29:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech> <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 17:29:12 +0200
X-Gm-Features: AVVi8CexkL34vp_i1CuA85Czs2clQeB-m5POHKFPZIkxmr9X1YgpCn5QeGEQ9Pc
Message-ID: <CAG_fn=WavwJakpE35nc+SC2pdhu7zAtS-NTGuzsnDo=84pX8zQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/6] kcov: add build system support for dataflow instrumentation
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 7:43=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Add CFLAGS_KCOV_DATAFLOW and RUSTFLAGS_KCOV_DATAFLOW exports to
> scripts/Makefile.kcov, containing:
>   -fsanitize-coverage=3Ddataflow-args,dataflow-ret -g
>   (with optional -fno-inline via CONFIG_KCOV_DATAFLOW_NO_INLINE)
>
> scripts/Makefile.lib applies these flags when a module's Makefile sets:
>   KCOV_DATAFLOW_file.o :=3D y   (per-file)
>   KCOV_DATAFLOW :=3D y          (per-directory)
>
> Also supports CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for global enablement.
> The flags are only applied to kernel objects (same guard as basic KCOV).
>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 7 +++++++
>  2 files changed, 13 insertions(+)
>
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 78305a84ba9d..101173fe194b 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -2,10 +2,16 @@
>  kcov-flags-y                                   +=3D -fsanitize-coverage=
=3Dtrace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   +=3D -fsanitize-coverage=
=3Dtrace-cmp
>
> +# KCOV dataflow: trace function args and return values
> +kcov-dataflow-flags-y :=3D -fsanitize-coverage=3Ddataflow-args,dataflow-=
ret -g

Instead of adding debug info here, consider adding a dependency on
CONFIG_DEBUG_INFO.


>  export CFLAGS_KCOV :=3D $(kcov-flags-y)
> +export CFLAGS_KCOV_DATAFLOW :=3D $(kcov-dataflow-flags-y)
> +export RUSTFLAGS_KCOV_DATAFLOW :=3D -Cpasses=3Dsancov-module -Cllvm-args=
=3D-sanitizer-coverage-level=3D3 -Cllvm-args=3D-sanitizer-coverage-dataflow=
-args -Cllvm-args=3D-sanitizer-coverage-dataflow-ret -Cdebuginfo=3D2

Ditto.

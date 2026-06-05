Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECD4347BA5
	for <workflows@vger.kernel.org>; Fri,  5 Jun 2026 16:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675576; cv=pass; b=P9R4BemWRmfSp7rXrk0hHCGegZN7nNSObv3eQQYddiSfWr8DkRzikLg79J/TP3ixajd/vYVSHZQmnTZlUqdRR6IP7OXRGxA+euDHNA3r8SG3Yt8ozcvHL+z+v6SVxwMoDXMz1s28tHH9GCW0R0+i0Y4jkcb4+wQDJOZif7AKeWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675576; c=relaxed/simple;
	bh=CYocm5u0+pg9o3aIVAE3m5a3oTIe6F5o9fKMKsoF8EI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rh2x083tktdm0l4AB2kHTG9CngXb0r7+qz6cAxo/DHkk86frWbuPRhus59xO7ryYEkZOJ+3HKs/qb3sX97HpZaXG0Rm/11QSk9nhiT9JfWQQ1mrO3L0eEJyOqNLPe56Iumlv0L7XdfRlI6SaaB+3jXEVbHBaVF44tKEXJGxcyas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WYw2iXHO; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WYw2iXHO"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6611669cd16so120262d50.0
        for <workflows@vger.kernel.org>; Fri, 05 Jun 2026 09:06:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780675574; cv=none;
        d=google.com; s=arc-20240605;
        b=BF7Y7l2T1uPE6SOjk6mTiJBM8q5+ZBJU33MRNMxnD2l9TJJx0X7qQztgvywO9y9531
         fWhEwah49J3+VwGo+VHCR7cZkZmZy1a4sr+sjcfroD0sSqzQ2js9WYC8va0Lv87U9kPP
         iJQ98N7N5EkSYLP2nQZ9uEOiItXg/HXMK/6vCLX389bNK0OP5TOm6RLfgjFTUp3f0kdy
         RmfF6NIPoh6bba5D0RQaruLY/1bWfM91u+8nJQ/A4H4yYPtJ9OH/PK83GMbXR+F858Cy
         KtYq2fWTC613an2mOivFJsBH0He+eoyWCUKZlpWjgL7A25CBoAdG/Vc5Ro/xduLMel85
         P8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qpweCGcPTYVu/t4xYY3lqhavrFen0DWkq0lhTltrHoo=;
        fh=FdCr8/gF5mdhvW0vXmpzo7MJIwVuWmZ/DGVsUGim6t8=;
        b=etnRsndejk+wAusM1zS4RG39AF7UJbhre+txZarXgJ8IwkDhvywYnEqYsLDdSyUAUa
         uvf827E4JesLexb896M6SIoTq25d4IoX8gV56K38Og6XArl56fqNKnQJvufRO9d8O7iX
         mTDyXBJm/h1n6PKybIvOjYpbeBVVZ1GY03bypZ49mgEktYlVSbbV2dE9HxJy3bMo4Ke4
         SaGFgagn0v4mqcbE7djXEZjEp1tuVpe8/TG5ZYVVKwjJqMDV7KcSSX7C+q8i2soK6BC7
         ggygMMsVDnKVDg4u6EktGBsm09YWM1VNr9olbuQvd3NS943mTxSto8eShVXn3f+N2bfK
         kZcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780675574; x=1781280374; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpweCGcPTYVu/t4xYY3lqhavrFen0DWkq0lhTltrHoo=;
        b=WYw2iXHOew+BVshvJs3UfrU4HFPekt6Fb8/tqKm4amfDigUZ6hWHjh7r8YmjoU9Ce9
         fBHImGVFkweW4lLujv8L1j3m0/zSU9xH6jtigm2fcG96IxbZIqOpUMWi7lliz0/Hrtnk
         vevzrHl0YIIsR/g7BcnK3ryi1PLU+zA4Q/NgwHHv+XEsErNfiJK2fpTL8tpYeGAdhZjd
         jZp/Rp4d68R4LkJB4UHFMslX+FEClMg1Zdt4YADT+WQ6HPD4x0ptwJ4yTKrEaw1M/YLy
         08DZyxvggsVzvq4Eqjvw8U7OiQWeMk7jdRsrmh2m/UpyZI5Pf6uu6ZZtKerOAGuVB1fM
         md5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780675574; x=1781280374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qpweCGcPTYVu/t4xYY3lqhavrFen0DWkq0lhTltrHoo=;
        b=YDNetixCMJmZWi2dw4nmdCZtCvUAcmh3cLKv/eobY18dfB43zMYITttE+jXgzMYjBM
         yygcMa/z8yhxFiCgGv8kWHcvbagTHF14AJ7bU3D/BziYUKVboh13nybqiQN4oLrx+8WQ
         pDwoM8WwoLRC61De87R9JOlXkZhvyfHYwEE1tApm8W2+CaO9M/X/PbvYGW4UfLw0qdIz
         kb6cspwYShsZdiryQNQyIXEGw6nxClAabPZMMlA3tf5fzW5+X+AFWf07HVZ86lEaXXuI
         B29Y45Fu2XhLFm98TbT9raI0gEQuVWea68pguHdbJuKQ52xtDy27hOWS9le67segLILI
         2xJw==
X-Forwarded-Encrypted: i=1; AFNElJ+S01hGG6gksCVMVjNS9buGpBhfhh4EipzMxnhS4cVwFwZ+RrCC5c/fU2c1ZWTrf+JlAHIYTolgW+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YycDiiyLVpDWewfga3a09L40kkbMXAjCPkJBzfZtrnJbfDyBv8s
	KyJVeWYpG41EC3zWBsspSLnsjhEudtUk2LmnY9fsBH3atoI/E53k7j1A8iTaUjwYSNNQeGm1P3n
	JsaCY+EKM0VFoe2pnqGnBgFcvcY5URIX0n3sAjj6e
X-Gm-Gg: Acq92OFE/BwQfXDfFmfcJZD9IazMWpSZW4TKXpyDMJD5EI97IgdAKXXTogXsyINzRFq
	U+ojyOjL4CmpuSmOpIROk4GcxoM4TM+CqGZke+cJOOW7vtRc/sqJXXaSPbjcJBStiivAhOsRMg7
	TpVyrffj9Kawec4xkISxdu/WeznaMeCV72PUNPJsafwqB+K6meCCPkSvBLZBn2SaeKCo6ATFtSP
	02W9o1d1T0bVIN1+yp1QSnehKXZC1SN9y0WLmQTZgNIe6khOHeLNPkaO/EHFxREfs1HP9vw7YI7
	BjBQYKgK/UvY/SoqTVrk5+2qg8Mvw29BWT9YG62mJqE/RJLuaV4=
X-Received: by 2002:a53:e306:0:b0:660:3426:3ff1 with SMTP id
 956f58d0204a3-66106f583b0mr2916376d50.34.1780675573532; Fri, 05 Jun 2026
 09:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech> <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 18:05:34 +0200
X-Gm-Features: AVVi8CdtIWJrRUEJnQQQB7BanVCY0Gd9ha8SThOa2A947QiJHGGMsBgLigo__P8
Message-ID: <CAG_fn=UMJJz+3zipowaC4uTvcbC0gvXbBRaF0UUJ_1AW+oWNGA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/6] kcov: add per-task dataflow tracking for
 function arguments/return values
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

> - Per-task buffer: task->kcov_df_area with atomic xadd reservation

I don't understand this line...

> - Recursion-safe: notrace __no_sanitize_coverage noinline
> - ERR_PTR aware: skips struct expansion for error pointers

... and this.

>
> The callbacks (__sanitizer_cov_trace_args/ret) are inserted by the
> compiler when -fsanitize-coverage=3Ddataflow-args,dataflow-ret is used.
> The Kconfig options depend on cc-option to verify compiler support.
>
> Buffer format (TLV records, all u64):
>   area[0]: atomic word count
>   [pos+0]: type_and_seq (0xE=3Dentry, 0xF=3Dreturn in upper 4 bits)
>   [pos+1]: PC
>   [pos+2]: meta (arg_idx | arg_size | ptr)
>   [pos+3..N]: field values read via copy_from_kernel_nofault()
>
> This is completely independent from legacy /sys/kernel/debug/kcov.
> Existing users (syzkaller, oss-fuzz) are unaffected.

Does oss-fuzz even use kcov?

>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  include/linux/sched.h |   8 ++
>  kernel/kcov.c         | 291 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  lib/Kconfig.debug     |  22 ++++
>  3 files changed, 321 insertions(+)
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index c4433c185ad8..03be4b495f70 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1533,6 +1533,14 @@ struct task_struct {
>         /* KCOV sequence number: */
>         int                             kcov_sequence;
>
> +       /* KCOV dataflow per-task sequence counter for TLV records: */
> +       u32                             kcov_dataflow_seq;
> +
> +       /* KCOV dataflow: separate buffer for trace-args/trace-ret */
> +       unsigned int                    kcov_df_size;
> +       void                            *kcov_df_area;
> +       bool                            kcov_df_enabled;
> +
>         /* Collect coverage from softirq context: */
>         unsigned int                    kcov_softirq;
>  #endif
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 1df373fb562b..d3c9c0efe961 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -353,6 +353,288 @@ void notrace __sanitizer_cov_trace_switch(kcov_u64 =
val, void *arg)
>  EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
>  #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
>
> +#if defined(CONFIG_KCOV_DATAFLOW_ARGS) || defined(CONFIG_KCOV_DATAFLOW_R=
ET)
> +/*
> + * KCOV Dataflow: /sys/kernel/debug/kcov_dataflow
> + *
> + * Completely separate from legacy /sys/kernel/debug/kcov.

Since this code is completely separate, could it be put into a separate fil=
e?
I think kcov.c is too big already.

> + * Own buffer, own ioctl, own mmap. No printk =E2=80=94 buffer only.

Can you please not use these long dashes in C code?

> +/*
> + * Core write function =E2=80=94 no printk, no locks, just atomic buffer=
 write.

I think it's okay to omit what this function is not doing.


> +
> +       /* Atomic reservation */
> +       pos =3D 1 + xadd((unsigned long *)&area[0], record_len);
> +       if (unlikely(pos + record_len > max_pos)) {
> +               xadd((unsigned long *)&area[0], -(long)record_len);
> +               return;
> +       }

Have you tried compiling this code on ARM64?
I am pretty sure they don't have xadd(), so it won't work.
But why do we need an atomic increment here at all? write_comp_data()
performs the same job, and does not need it.
Or am I missing something?

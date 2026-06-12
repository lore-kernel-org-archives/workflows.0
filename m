Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E33B346AE3
	for <workflows@vger.kernel.org>; Fri, 12 Jun 2026 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249464; cv=pass; b=pm3QF2NuTVMll+e4awiobtDEkBsadjXBPJOq8cyGXamlOajlZt6uyF++w2cKHvEbLDC2H6y4gJ/01aQOcGbNPNFmK3WvVnHZEiriPzbDxZSTQvNPCRShgCei9QRsWvaJdE+bV7bJi1ICXzGEGlUkFKimkTA3AK+gm5Bogbqs0ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249464; c=relaxed/simple;
	bh=TJhwC0TjtETgO7UDDcPQsbkdSGcQTc0ybmTI+jD//dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xec5gRO8t+48/PTZjilkSzjyLvucWHo7BSymRV/Z1VjPWJVaV6kve8EleFX5OJcC/NZArEkns+tjjidoatey/I5fTjH98ge9T4GyOIyS+ZLUwLz8hSEC5mqZXXrxEovfh3YnQQWTZJP2FO8rvRh7tqNl5o5qgT+KZ9ngedOioe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L58aOBc1; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L58aOBc1"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so1199537a12.0
        for <workflows@vger.kernel.org>; Fri, 12 Jun 2026 00:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249462; cv=none;
        d=google.com; s=arc-20240605;
        b=Fy8l7/OobSoY0U/dLJk+FMf/CaH8gg14+NzDz7b9MmL0sMOSov/Flx4k0y2KUASqXh
         xw2UjAnK/BDkcYYZP+IPl9zetTznO/0lCkhxIq1pXFG/Tw+H/FvqTc8twEc0mH+NDFSs
         mCtVs2uytPHNWcbtYSCEyWdpQRW6gVPCqz8iGvc1kG/vuAHzv81uyk8vf0fAD6vewojh
         r0w4E+uRKWQBjhLdpSbJl882xECktrb3ZfGDq2+O7bpANJOQfki4Jy6+oQ6oTG9AxK2G
         QqPnVpm1nbLupi4006JEbcCyS3hcfo6OxY2dFIgQk9dqWnh+EpE0jupbgIB3Bm8RyKof
         hqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        fh=wSYg/d7VUfT0NDeGmh6zfxqEjeWAye4lhEVR4DxKdVQ=;
        b=hJdfmdOhqPaD2AJz0iYweEq/nutiwhak8w/aQCeLbCskLKRSokPKgFwJT8IJSV0nPh
         5hfHa+Co8X7KPrVQmWwNWR1w49emRDgUmmn7p90eP5Fe6El/1WSWb3iFsmJ5E8ArVBPx
         BhBbDJFeknKMQrj9a84IjpIsQ/D1qI32HtapXml2HqecbfI2YYRmqvMIjluaDSz8ssQw
         9wUtHINqdsfc6umFp8/lNXtALlLaURQQnSiv0w19Hz40Sqxk1QUJbz1+ru+Je4bqjtOZ
         kyEJ2oHVG1wiTUFUI/iVGG9trlUiWfsdScfJ7JPDfdb3paLAfST/ygq6zJlhpEpk9it+
         3SmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249462; x=1781854262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        b=L58aOBc1t+GGEQcW9ZUCClwQvWRVSfh0l0dwUX8RnHUPdAiHfoAgoY/hLcJF5PqmDz
         wD8Dm+3RibTWmuGetriZAkwjyoP2m+Q4jWl7sqx5+R0KFi0niCRZuAdEfb7uJHjaLBIs
         buBnyvjXmSXIzid5o7u60MGJ5+6TJrjvLQfTIaiUjxT7msImLvAEluy5rwmU3flVIOmT
         6gWjbSPp4E9eYP8MuxGF+1HB8FU2Rwrdd5LhA+49UXBs0si3uKubqA6+S+ONUEfSN359
         OEJcXHBCDuoFF8wcGR8XNKobiWWA3Bo0w18RacL+2ijuRLf/mOQ6KqaZNYaAj0u6AMh5
         5/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249462; x=1781854262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        b=l5aRaq6nQmQ2mI4BWNpYQunh2q2jZsayTBSuVhCiAg6Z3HqqiRphEQ1Zt6BJ8O8/rz
         D1l7NQhNB6nxZCgH00j/RlQegjTVA9ilPsqaH4PzwdKnW2AUF+kLxC6N1Wtx8pOyw/x+
         /+/f+8LrYfKSou5ODi3xPOLUOyFo6E8BkIgCAA42NV6viDNefJ8bX8ujJ8GWSj2GFVG0
         5A/m9B73wtk7MQLY/mV85LguJY6wRomZuJ0IZ6MxeDuGrH+6P2lHkP12I/BRST1xHsx6
         p2PfAm687tUi+REK5JQAvjyCSO/a98LibnKb2KbJmrvlSkCpYofvL2ugZRSZRIO95vC3
         cV4w==
X-Forwarded-Encrypted: i=1; AFNElJ/S6Z2sZ9mbzr47J1keYgQ4jOnd4XekPUnZU2pP6golCsHHm8H20BdBKUoZQHDF8kizqH+xIHSsSyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH9c5lZjgH2VPAbgixssnj3Gk3wFr6x7taz3ibKO77AaEp8/kw
	PzVSMazBeh4xYNM5iXLBtpV2uECJWIxH0Kx6m50/IsUuQDV4emzr5M2iAEAojEpEO959Y1OPeHg
	w4d81tiEhQiSt8z2FKVvG2ulzRe7AvkiUgASkrk7P
X-Gm-Gg: Acq92OGzI0xQk/l8NADtvoGEO0Ijc4Yfl967nCkiYI2N7PqOX3Kymfqw2vjEewTp9uV
	GmicdzHmcR2SLHsdZJlCU6fVb5riZt4adGo/8NNjtvK18XwgjuNnxgjl9aTxizG/u2AQ3QLFYTf
	cdrLXpc4wx5DzULvvGM7/OXw4jGDr1MUJgGYvC5DtoEh9YfCQKMCLh8uIABeeTdqjfnmHQuu5b2
	q7jC2qNbdi0K+if9RYKiwTKYV/lQdqIfGcd0GuHTAqhyBd6jOTwpnuYM54mwmLx7GLnx43pxX5t
	czWd6McZ+k3mlgXoehC4xmXb1ri0eALtQABQ3g==
X-Received: by 2002:a05:6402:360e:b0:691:ad29:ea33 with SMTP id
 4fb4d7f45d1cf-693779d1edfmr692502a12.12.1781249461160; Fri, 12 Jun 2026
 00:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:30:22 +0200
X-Gm-Features: AVVi8CevQ1ha7IS1m5wrojNeqF7AokFDz6V9vLKSYwmszS5cFjeqHBoSGHAAq9c
Message-ID: <CAG_fn=XRzSuFrxtFbz2t9jjY8HPUUhhnU3iWJiSV-X4+hg66cw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/14] kcov: add barriers to recursion guard in kcov_df_write
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> The recursion guard (bit-31 of kcov_df_seq) prevents reentry when
> copy_from_kernel_nofault() or other called functions are instrumented
> with INSTRUMENT_ALL. Without compiler barriers, the guard set/clear
> can be reordered relative to the function body, making the protection
> ineffective under optimization.
>
> Add barrier() after setting the guard and before clearing it, ensuring
> the compiler does not move instrumented operations outside the guarded
> region.
>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  kernel/kcov_dataflow.c | 2 ++

Please merge this patch into the one introducing kcov_dataflow.c


>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
> index df7e8bf70bfa..5248293280d5 100644
> --- a/kernel/kcov_dataflow.c
> +++ b/kernel/kcov_dataflow.c
> @@ -86,6 +86,7 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *=
ptr,
>         if (t->kcov_df_seq & (1U << 31))
>                 return;
>         t->kcov_df_seq |=3D (1U << 31);
> +       barrier();

Please make sure barriers have comments explaining which barriers they
pair with (see kernel/kcov.c)

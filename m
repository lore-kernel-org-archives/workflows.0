Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419653D648A
	for <workflows@vger.kernel.org>; Fri, 12 Jun 2026 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249605; cv=pass; b=DsNwJJ0fW4Q6xWU3JJNjGHVgxk3hubLf7FHR0+Y27aQAqzxa5mmOTt0KHYnR71h96CLpegYsOg8mzdr7cpu9MVZEM21dCjerr4UrLbcKt33NO1crLbLMQijUV3cfVoNzOgFcA/RyYzVHpDFRq++u15+j6n3eOG2wUe+VoQfUBw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249605; c=relaxed/simple;
	bh=+CK+tt771npQ32DrjHpsZa5xuUy11BpcBUH4eDrxn4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NZyG2dRHA4Wepyd5nhO+TASEoJiAeQQqCqI454PVsXl24FCvYerHmpMSzhUeY1w4l4tFZ0WaIulZ1AMxgZJrHEtClCq94fXKQDzRsycdy++fH1mioAffDALEIsumi+JoqU/k2I/uzmRwfzF1KCBFIELuJEy6DE1G5OkKIYCi3UI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tutk9yub; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tutk9yub"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7dc67a5e102so6501607b3.1
        for <workflows@vger.kernel.org>; Fri, 12 Jun 2026 00:33:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249603; cv=none;
        d=google.com; s=arc-20240605;
        b=c0Yc+86T4xaCK+AgkjmusrMh7/rms1BVA++9QY6wEjQFyq/eN8WTU6nt8oKcytVSj/
         2ehyl+Vn3HmUuGEqExs7QSM5wSda9b9Eso2MSrVdGoSvaWAz5Eqsy/aGpO3/65U5mHDB
         QsY3RnjX+VOxz9qUuSCb/+d+KG0z3KbE3l45FshB43g8hJP+mk7kGzwiSDLrgdS8+QYv
         gj5lU4lm2SCyMypBUXS2BMA3TuXHXLU1b9X3GOVaZUqztWWP9W4LA7WmI8ZBRMJC+7ao
         1UJKHe9VXdniwBAVpnkz3TQNGUQFIDDWEs3fLf+YGfUoB12jgjZ3Juq6gKu73JwcyR+x
         jhjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=37yHv6yFdGH61lIGAgzgwqwgl+igTLCwlH4B//p5pEE=;
        fh=sCxmsx6YhuMy2ov+6IinAeYtE8suhhWGd1ztwOi/S5E=;
        b=MNagZR5ao1TZSCHmoaaS4K8eaBso9b/mNgs71Wjgz+T+Ix0cg+TZuConqBIHX6Y+rC
         gB+MKnNvDV6EooFSPYbJX1XerWeKJtcOMAWqhMe7sOFpLg/1HoqfK8ZwnxGqDdKHTy/x
         mWNfVmRljt0QdJzfBqFzxKH0UKqTEThu98yTcx84YvxiZOHQiM5NCQoAahyOnqDjfPeC
         cPLf1LRDL9e9/p2y8MUg1aC//VWPi36pwQK4aBhHHUqLspYOV2b00K+c/xqvXLwBBiwX
         sZfcZ8KN/qman1rxnT89/hRhdhIB04xN4kEIW6t10ROwMWA9MPi3AzqBql7lIGcH0N9E
         mjCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249603; x=1781854403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37yHv6yFdGH61lIGAgzgwqwgl+igTLCwlH4B//p5pEE=;
        b=tutk9yubKt7rHGQInrqHwM30HuPbjoAYyeaA/DlyS9ulVx7Xam6hQFFnFX0Mntw92w
         FP29nQouQzxm7wsKMLZY9u7LhPVrwxPgreKyPQz+S+b1V9tFNgpbFHN2YWIMM0RIMHcr
         zjt2S4JuWLGXVZYA3yuWEPE/YdiePv9l1bm1gYpu0qFrN2+JVUvGRAWCLC/ID3UaDJzJ
         fJwS58v324aOEln5ZKPwjAIJ1a4KXwF0TgrBZ8fzjZo6bgxDwdDdbqNfcCRbmwpHVJO/
         g2b2lpak3J2s9Dxyk6EQrBvA9Hail/tGrtjlGeqQbgRdwbiFAyEv1Ls+u9aS+jjcRX5E
         O/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249603; x=1781854403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=37yHv6yFdGH61lIGAgzgwqwgl+igTLCwlH4B//p5pEE=;
        b=o+fNMYJ6NKGIcs/+xfmUi9KdLE0Itd8aMoAD6b0OMlznhxkORlT36f6BXj6/YPs+y8
         ZMpk1ASw99BIdp28wxFtQ2d7S4KnXQ2ChLpwAlYuKphg3/yNLulT1Pev7FjUI609ixD1
         LpW9oaRMV/MPXvbuU4QYSa0aaoXcm9rp8Her5TYlzK9NmcyAYYGs9W9RYSkk6F0BXXt+
         ZcrEt6wZOHkWTw4bB+OBnWtXX87un1QLI6e3jW2VkAw5D3y0hihlVk4n5nzs6GNtmRaJ
         hlzr3Y6FGQjXB4ELzuyZfddVRcU0hmLWIOVdVtSBPyT1evaVqW1WXOY3WRf07ovLDtlz
         /Ziw==
X-Forwarded-Encrypted: i=1; AFNElJ+kAEltqyYrV3AimTPs+mFanR9RwhbUenkUfOWl895s9TQuaf8KilhFPwtr3WqYm2zX1fp5lwKASOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXJs7v/fjZQkwZTDA/+cofsvis6MOVXQiXV23mX+MIsBVPFVia
	2SoYEcMrxWudnqErks022sCc/5oAgHznW8HY/ikMSK754VqaHz/Be8gwujxI6cP5Ani3vjKbkug
	24s16f/wQFDfzA34SfWUzm8l1pT7ytN79o4cfV+Bi
X-Gm-Gg: Acq92OGLqPWjDYRVRjhAI9ZyHXxBH5JZT8ZpyR4qBagEcA52J7mPGNQgvcVFhZwGiUS
	hqU1crvPdD+jm6JB7BcZ9WStYpbchVS0HFdiPV/Dm+FOfJ+/O0LoCs/Gbeu3Dyx4YLteszvnEZK
	z4N9bb35sUUrfRtdK330hPBB42do0do3QPHhY5qkbdXnbDDcCupbOvYd6GK7P5DAKR4p0nKLHMc
	wpSKORetPpY9Hhai8Z/+irrDkmv02o6S+D19+0JKars82IxdzTo8bcwnchZJ5570RzhcFpHVarC
	mb7+7L6jSYAlCng6exWm0D2z09TSImgxnpTe4A==
X-Received: by 2002:a05:690c:c502:b0:7bd:8752:cdbd with SMTP id
 00721157ae682-7f7bdb01a78mr15009497b3.41.1781249602660; Fri, 12 Jun 2026
 00:33:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-4-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-4-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:32:43 +0200
X-Gm-Features: AVVi8CfstzQNbiRE_Nzp0e98G9-7hbopDZWc7hVRExeHcpnRY99AeT5FguWPzQ8
Message-ID: <CAG_fn=UJTVm+XVjq-wq1GsfFLvQuET7N1A6ZF_BWtYwmDab_TQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/14] kcov: reject enable on multiple dataflow fds simultaneously
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
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>, 
	sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> A task could enable tracing on multiple kcov_dataflow file descriptors,
> corrupting the internal tracking state when one is subsequently closed.
>
> Check current->kcov_df_enabled before allowing KCOV_DF_ENABLE and
> return -EBUSY if already active. This matches kcov's check of
> t->kcov !=3D NULL in the KCOV_ENABLE path.
>
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202606=
03-v2-0-fee0939de2c4%40est.tech
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  kernel/kcov_dataflow.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
> index 5248293280d5..27587b8ceeab 100644
> --- a/kernel/kcov_dataflow.c
> +++ b/kernel/kcov_dataflow.c

Please merge this patch into the one introducing kcov_dataflow.c

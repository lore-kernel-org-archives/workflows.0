Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500A93AA1B8
	for <workflows@vger.kernel.org>; Fri, 12 Jun 2026 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781247395; cv=pass; b=MaXqBnItHkZcmS5PeGq16GWvvxxI1PS4yDOJbmCEjYKWvgjT1B5eXOelSyQoa6lPFSl8DIcgURwRipQAw0x1fHBItKmQS+YvXocP0bP6gReIqCHLvrbm3IZR0cHTqWvHni0aMDJaO6oX6+3AprJdqYaIQOz7UZeNT7ySfJd69zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781247395; c=relaxed/simple;
	bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+rjp/pYUHRr3VwJEESOhSMg7A1qq3mm/wLrNCaomJhTv6JqQd6LmQUt+cqdhyKUK8M5xO5hnoM6Q3GhJhv6hKINT8hAkvMa3WOY3iQKU0s0eAjdwp4Qp2HcbUg1EttmuzkibiLh4ZvkxnO9rh1HnKMm60WZM3oPmOZDnZUsShs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EqDjjaIn; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EqDjjaIn"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6924a68e3f3so1109828a12.1
        for <workflows@vger.kernel.org>; Thu, 11 Jun 2026 23:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781247393; cv=none;
        d=google.com; s=arc-20240605;
        b=QGoS7t7aXIxdjxaGuNeEtxlAB1QCBMyUL9cJAqSMNr2aJqwRawo2kv51Wv3cNiqevc
         gxHY1bKYbK7eAJM1+MvSfaFBkGwlklS66OzTfUz2OwEBaoxOGOYgeqRxw0J64WWhE3jY
         oVA1H1Z+YfeamG8Konj+4+KB6HqzoBGuxIdBKmVKKZSdK5340s3EOH8rS+wfWaiJUgPw
         YpXdcK+elyp0chBMWdHtPcxyNVZEeBIMTwx6L0FoYp5ktgDs3OVhcH6/9vgYW62QHgbc
         OawHyCdNGlboemHqvZPvGkawx9rp0t778DcJ6wz8zo4Iz4q8tdwP81tAf3qFZNrhV4XL
         Uz2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        fh=j4AY4LVCnH0scBI+dInUDqUbbHAA0F27cT3MBflYckw=;
        b=SHdlFPhJ8T05yr93JhB96zIXUNsbuFrFObX3De1O1+8k1oS3rUvo83yJK4NBywhyjk
         xd7oWkaL9M9me3hyDJudtGqk/vC6HQNrcpx7MfuLKcYCgEYUYn6hpptoPyVvi1O0geaD
         JQ9hghy7Llh+Uxqvx2UiL3xdAtqxYJdZXvaz+68KbRlqr0iXiTA6UB3VJlGuZY/XDjLm
         d57s5SeYz7s4pyJ8hXZ50PvHvhrTY817Y7M+DEr8Z3SBOH8mw/n1kVkyp0Jig6ViNr/y
         cHsEqI1iVMzH2ZCTJB5I8QeMKrsju2XeYCPMb/jyiEUoj+xxhwEWbP6LPn9BYnRHB6Tz
         LqnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781247393; x=1781852193; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        b=EqDjjaInov0ka4alN+yEFWBFuaxhdbrfTeM99dBjBHVH1TGqPNOwMXvp3aBAtkNwGy
         wuUszsiCnccC+mXgVgklYrmJpM4ITNLR+1Pdq81iYB9iH8fIQ4Bj7siJSio/GUKufXNx
         uXLplkNvuYKJ356p1ai5tl+9d3qggFzGRiMQ0Y85CiE+L3Q12ToW+x1COpZlQo+fpOZE
         Apr3vb1VXwL/9IHBFx3WjOH6ceWGtdi2t3QdLCyf1j21yuQZfrSPzo1HjsEevZyy96Wl
         FDOKchXplfC1MTsnyxN7ZPsFme7ZJTfu3QPEZC/sMXV7SCV1Jl+fh+kNG5QUGdXfpb45
         NfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781247393; x=1781852193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3lBHS9HDKEcHXBILsrP2x1PQFt4q9srNsFjMrwfX9Vs=;
        b=TfuF4sBUOx3DTE+JS1F3EwPIVao/pzgXUapxJiU32eU01ut94MKhdTidNjXRGuajto
         4KsRvC2t/6CrYLriTdN+5zDCHUZrtSf3W9FMEZZ9ejODkVRlBPwepFugcKezjt92clRz
         DTm9uK9WWTbDHslqAB1TshWF8loHRseFABjN8UBccPLmgwTDq2c+oMW+Ofz3CRsWdSmI
         wmEk+fUtdaZiAETew64jVTwZ4wDnwulVpBbZ+T1DHvV3DVIhGLGRizK28KLO71mdpDEu
         wFBasbF0PXA5cJwCx72/yVp5rvwnEL3XQuKakbW4AmhFTpj1xhM2O/V954+vXF4e4Vbq
         3RCw==
X-Forwarded-Encrypted: i=1; AFNElJ9ncygG64KCbfPAQzl8M2760Wyf7Quxy5iLFSTm+M7xTb6m2XdOVHjEWk+PkpajIHB6Tr8NcQasabo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM+/63RIHBqhpAIZUyX1Qlkd3RSegEgrfuAM/AZgytI2Jo/gTy
	qbcGeqY85FV1a+EUvd5z68keTpV/cSVN0mTIJJGaHHW/Yst4d+Ir1iEsrHxmdzvn6PW+9Xa+EwI
	IZpb/UXefV3gWAZugfP2rccFkA8Jd0yTTPDh5K035
X-Gm-Gg: Acq92OGGLg5y8zTUWuqHo6U0W+c1CXFcyi1q7OotLf9gN2vAtqGWQpn92WeAn+cmyQj
	oxWJeeLrG4qElj3bFSYqNwK/QSiRmRxAi9X+JgvSPNRkE2rQtSPjsKfq1JUutD/GsGpVAGHTVj0
	VnM9rCpP/hLorvFMZ5G6d2AMxShv4a+2yA14WxwENtpstuJUE6FdQn4GW3ToiCa0oESkO2Cmrvn
	K7AMpIlbMjbVUPfY3X6ADqsYKEw+s3zbMEIEEEGUai2oVJG3wzPEhFUjOiUR73tVbkNrkUD2Fnj
	OiccSzZ8bTz+TrDhn5ZLnMS7cLXZzVte7k0hHg==
X-Received: by 2002:a05:6402:434b:b0:68b:d10a:a48a with SMTP id
 4fb4d7f45d1cf-693784fb02dmr602313a12.11.1781247392123; Thu, 11 Jun 2026
 23:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 08:55:54 +0200
X-Gm-Features: AVVi8CdLRn3HUIKr4oSFNxeMmeQ95IhSWpzIU1V25ylhb68DqGsVy-9EpMVuQUY
Message-ID: <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/14] kcov: fix INIT_TRACK race in kcov_dataflow
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
> Two threads calling KCOV_DF_INIT_TRACK concurrently could both observe
> df->area =3D=3D NULL, drop the lock to allocate, and then both assign the=
ir
> allocation to df->area, leaking one buffer.
>
> Fix by rechecking df->area after re-acquiring the lock. If another
> thread won the race, free the allocation and return -EBUSY. This
> matches the pattern used by KCOV_INIT_TRACE in kernel/kcov.c.
>
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202606=
03-v2-0-fee0939de2c4%40est.tech
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>

Can we please avoid this?
kcov_dataflow.c is being introduced in the same series, there is no
need to send a buggy commit and a follow-up fix - just squash the two
together and note the changes after Signed-off-by: separated by a
triple dash.

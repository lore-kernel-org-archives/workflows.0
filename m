Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9F6318ECD
	for <workflows@vger.kernel.org>; Fri, 12 Jun 2026 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251249; cv=pass; b=hdOHb1wcL2WPGHnI5SCRWg+vWrgIPvWML3AxdTxUMTfRvLWpWN4fz8WZUV2ZwvSg0glGoJmQI9ETFhQNPsOBz/FLQQxakgQOjkEPLKBcrprCLhmsdeAf2Z4W1b65NLeSWEdKXlCtbAo8qhxEB4MfQregT2TOaWylCrdqjxogD90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251249; c=relaxed/simple;
	bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVKMfF7my1u66aw6YS546tDmm3t9PqinnZ/P/Ag+IbX1hIzsGAuGBKb+PG1PAgaoin70gBGTOCguSoZg2oHN01dR1xYYez523+mD+5L/UOaOPbJEIGLqXR6gm/XZy+pCVJ/EMGcii04MMlrfm1b5X/EZVxphdwZHic5MXl9Coss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/KaT+yK; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v/KaT+yK"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7dd3f176f84so7398907b3.0
        for <workflows@vger.kernel.org>; Fri, 12 Jun 2026 01:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781251246; cv=none;
        d=google.com; s=arc-20240605;
        b=UsHOHeCHw9iMmw4zfaTnD4vkcbw3btJi7NiKXvJ85UGWgAjLtqu1VY0tGxlRov4bBr
         pIQMC3ZQq8ZzxaRjQj8AlWGHJ4wBe7gSnYrMGugPlOwkGnbPKXXXByVp4jN8puDaBU/l
         cxiyza3PMYZnsh3KXncY9bCIM8uzXV9v0vGjEdT72VaRtmg373Xh+t3HNT8aRmJ26n6p
         aM1ehNOwv7d+1dKWO2trTmBx2vo+UTC9lE4mXWAR9Aceh+THgGOhz6Kxh/rcay56sqF1
         IRv1DW9zjxFN1AKr6yIc1QggXAm4LDPpDNdyGHZS7+A+Ki7rffFr+NkYXwxvs4gXPZLf
         /FUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        fh=CsfbM3PA3ToUYsZldzqduCEZwDsazeOYNS8M7h4xjno=;
        b=ZNpeOZOzS8hMJz8A9JzN/RimvE8FYfN/D6zTH4wDPjThlLbEmZosMs5/H0G+EDvn/r
         cAh/NWI/AIpXmiKqSfoboeEF9LTlxssNgWA5jXqmp/0Pbr6jXi50rrJ/AXCq4VbAiqUr
         mt/kFXbGz/N0RjabnvhwTiSPQckC1EoR9nf84EUw64HQ/9DcEJD9xR5dc0yggTt9znze
         EktjVLQ5hGX+PqYUl2k3E4cJOc/Cq/OQL2tM5nbrd/oEaS8vpFM0IuSz4N6HYdDmlt0b
         i8EPxzChSIq7PgTDfL7MEMhh0IYCr6Y+LSxbdSyKBy1VaGGEA8DZE1ugNgJpmNISImXJ
         R10w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781251246; x=1781856046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        b=v/KaT+yKVuYKxugk9GOkU+ByBS5tAuu8BM52P0ROYU/zA36UgpEdVVgn/Siw7JATqN
         eJF4aDW9cpF4phgd8eNvDOGOd9fp9S8mgtqPR02h49maNhy6DW+9FDBxBrjYkfilUXtp
         173US70nRQrPQjMz5ChJs4F6QYj0e7NO90jIwHXCCGmxmrKjfghm4AUxd6eNSQnUkwhv
         qhzkHeddM8HkbCVyqW5biYj9jbh+zqe62E968ClSB4V9Jym2H+hq4cbAz5RcxrpaBwN0
         YrF2QYkryG1AYMaCgXfsQ29oUL+6fvYeXb34RP+xlfGbfPJUeBhB9XEnPQWC03zgAE84
         CQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251246; x=1781856046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        b=rNnS9kHIKdnZCT0Yrw3+22bU8KEb7onAsL7gF2XdBEXz9C3+totEhfKBpvbfRQYkni
         HPROZYgSqF5AcEyUuEC9TqRirkybkfD7hw4GfarTPbiq18dQglqNqkiHpVWPg9flwQ/R
         EGoLj2v+iR+j6MMu58DdBC1L96lPtG0Q2wJbBLrOLT0XMfxO0/Ye3g1JI8P7qugXh5Y6
         qgAicIbAabBQIUH+zOZKJn0eZz2r5FmwidRedsHsXLIYFz+hrjpXoMAM9YwxFHu8SNp8
         9lcU0Gr3/bEAKvCU65kK6HgACmWiugrqJ8R7ZCwm+hU0Dew8idzFXJzJf6fClPikYknc
         6bzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Xi15mr1FgAWIE2kAKCWdEkQrdreDInlHfe5vBbwy+Q5l3YyyjbNlFx18mtxOAghHO8wQg7oLbCJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEKIGOl/gKforKnDgzJFZCHrSJcdcwDzcO1dz5YPoN/6URVfCv
	EfXHfHkVThJaPYmfNSPvPuqhknMWFw/BmfUeHD6YMyiPGuL41TwvsvYJnaAPuo2u4jqYK/s1lF1
	58a0T6PoxKM+9+2fPPMKszXQ4WMg5wAqmnfVnxnt0
X-Gm-Gg: Acq92OHZOK7B6rQvUtSxIWBtWM3Pk61gRoIjAs23BH/QpoSovz/4In6b/BttXbraGlc
	/xJRShjT6Hw6tNlW8LDrYifYrPIU/UW7zw7n2yCwytgmzjh5cILQvx3KRVYSRAl9FYBj6q5n+ZJ
	6efqrvTGkunoEVAyzTw/6cC+PWRB4fRLTljtYTisZL/p5eAHCWmoa50fCGWuDNslEBOJ9bKM+vK
	I9DNt88UStd2/h403me1JiCmbWzFymOZ8U3wVS/E62DWo4AlbQX9kE5mC/T2PSitvXBJ4ey+5JC
	t7lqr9ma0J3Nt02K7OTW2i6SEqNeSmrer2edWQ==
X-Received: by 2002:a05:690c:6201:b0:7db:f8b1:cd80 with SMTP id
 00721157ae682-7f7bac02970mr15863297b3.2.1781251245971; Fri, 12 Jun 2026
 01:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech> <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
 <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
In-Reply-To: <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 10:00:07 +0200
X-Gm-Features: AVVi8CdEFjoun-R64CqbvYJPTnaS_E7TDNryUpyw-2UHJoZxcDfdiOQP2RCPBTE
Message-ID: <CAG_fn=XB7_zbjGzpgwEzm5dqcwehqvB+=SpJhHvw9QdETberAg@mail.gmail.com>
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

On Fri, Jun 12, 2026 at 9:25=E2=80=AFAM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Hi Alexander,
>
> > On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.=
tech> wrote:
> >>
> >> [snip...]
> >> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> >> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202=
60603-v2-0-fee0939de2c4%40est.tech
> >> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> >
> > Can we please avoid this?
> > kcov_dataflow.c is being introduced in the same series, there is no
> > need to send a buggy commit and a follow-up fix - just squash the two
> > together and note the changes after Signed-off-by: separated by a
> > triple dash.
>
> Thank you for your guide. I'll remove it in the next patch set.
Also please make sure to update the patch version. It's really hard to
distinguish between "[RFC PATCH v2 n/6]" and "[RFC PATCH v2 m/14]"
when both series pop up in the inbox.

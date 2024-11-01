Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EEB1CDFC0
	for <workflows@vger.kernel.org>; Fri,  1 Nov 2024 18:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730486250; cv=none; b=ATvNiwt72uq6VFSoGly8sPH/uF2d/mchKkZ5TycawfQrvzpc2+T+K6gbjrBxvjslE6/43vnlsVH02Dtu6ULZgPH7alDg8t5+Y7P4JLEz9beiS57250SdfMhhqSm5r6K5WFmw9yPow2foZz5IVZSIX72WjRbwqcOpQbvc1gT4D24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730486250; c=relaxed/simple;
	bh=jKoboGztv7bSsKkIlP79WvPeyrvZcZXc4ISTP2ydXJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stFVJulqBsIeaT0IqGTaA309nm8lsucr1fLm4nHRHXCs058V3VrsK+vtMzr2Tgx6r5v6rOMytW7yGkX12Hfm3Bc9MgYH/+vv3xc1OV2s7HEJKMDpFPiopgBIPlTOuuv+1+yHhaDvEuhycTrIbI2h8eRdBmGHyKTsd1lB7rAfLP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oltBx3FM; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oltBx3FM"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-460a8d1a9b7so49381cf.1
        for <workflows@vger.kernel.org>; Fri, 01 Nov 2024 11:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730486247; x=1731091047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ra0xT/SkPUuyvhZ+lS69adyS93PRUWclgK8p/jLJodM=;
        b=oltBx3FM9RjUFhJ3FKiKhEBsEHo5X60UjnD7Ejme7FJqLN2lxXoMUGvE2LGNYkqoU1
         GlP8V9+o45STfQwHcQv/EuPMorA9lXVxAIpluQK4mQwfFdlB2xUkUrsM4KEe2sHuxnqF
         pwe36gOFfaXeaQlYGxKrul0OnGpndwpcEYykqrFlmeCQzmT/cIO8xByYYf0o7RBOAVAQ
         agx77Vwr18pr8bt9osuYzixhgZzFLNZUQ/vTQzKbyTkXVJHFkNRheozCJw12f9m8yzuK
         nLDB5FxyOjrbp1awvbrbITv6EvkMqb4OPSUaNb8DI1yHEzBm1vCFWyhOOZ6WqOzQ0yX4
         rjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730486247; x=1731091047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ra0xT/SkPUuyvhZ+lS69adyS93PRUWclgK8p/jLJodM=;
        b=vs/Thk4XiiEQgmKpVLglBFX0sV/wvHU1MFEuzUZsrp2ndTdgEZS1BdQX5bDI/pB4Rk
         PWn9uOY2xXOZjZuK/RmDTBKzOJ2PeoQrjoX4qgSO1fcds727bv6LVBPGUuAx5is1wD4B
         XJ71H+ub0aGG6F0WUzeDdtwhse9rA4sYfyR33616dynvDxBFuDQ0JJZ9Kgrzq+X7ZkPJ
         FrBVvwOkGM6A0vtpvB2GxfsevFnDNcsKq2ycQrZCOVAArfr8VyVSa5l+9OTa0GbfUts8
         JOMpW7cMgH8nWHGukrCm7iSdNWEqUdVTrme9twTUTiOU6RzQgIGzug99p4G6xTg6ODhX
         HFow==
X-Forwarded-Encrypted: i=1; AJvYcCW4So9nR8+nO9LGokzBj3l9IEaSl3JjEXgkXO9rpL490Ii7zJrGfQ2fnhe7P4/gxSsIlxto5LTln7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36Bm+ZrFC1Ka9ZfDa51CVK0sHsZZN66NYJTlMdcaIL5dOYF5N
	pnG+/69t4HA5nIZdqpuStAfnNo3QpramZxZ3N97G8cDN+Y4yDZV0FgWfYBGDIo28iDtXs77gmL3
	wNPcaYTl+PZksX0/ak9Uj4RPiof226uWYAxQf
X-Gm-Gg: ASbGncv2ftNiYGYXdOQPX2bhWTd/A9wemUHfHsYEyUBQ87CQZJiFjMZ1qot33AARG6G
	WsGUi+yLU01WP/m1xZWjolYztCNMwt6/2IRnFxPROTv9h9vMhRAkm8d1wagpx
X-Google-Smtp-Source: AGHT+IFXHlNZolCtvQqrkR9hwhUI8RViuIj2smBYH8pafbRsbRshQf8L/zWcjJGkwIIhtoJd28KJvaEPAg+jH8b1gU0=
X-Received: by 2002:a05:622a:1350:b0:462:b6c6:8246 with SMTP id
 d75a77b69052e-462c5f02ebamr346081cf.14.1730486247209; Fri, 01 Nov 2024
 11:37:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com> <20241026051410.2819338-4-xur@google.com>
 <CAK7LNAR6Ni5FZJBK_FZXWZpMZG2ppvZFCtwjx9Z=o8L1e-CyjA@mail.gmail.com>
In-Reply-To: <CAK7LNAR6Ni5FZJBK_FZXWZpMZG2ppvZFCtwjx9Z=o8L1e-CyjA@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Fri, 1 Nov 2024 11:37:13 -0700
Message-ID: <CAF1bQ=TjpUrEgiqepyaGAiDoFM8jzozzxW=0YvTXpFY64YoTzw@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] Adjust symbol ordering in text output section
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>, x86@kernel.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current order is:
.text.hot, .text, .text_unlikely, .text.unknown, .text.asan

The patch reorders them to:
.text.asan, .text.unknown, .text_unlikely, .text.hot, .text

The majority of the code resides in three sections: .text.hot, .text, and
 .text.unlikely, with .text.unknown containing a negligible amount.
.text.asan is only generated in ASAN builds.

Our primary goal is to group code segments based on their execution
frequency (hotness).

First, we want to place .text.hot adjacent to .text. Since we cannot put
.text.hot after .text (Due to constraints with -ffunction-sections,
placing .text.hot after .text is problematic), we need to put
.text.hot before .text.

Then it comes to .text.unlikely, we cannot put it after .text
(same -ffunction-sections issue) . Therefore, we'll position .text.unlikely
before .text.hot.

.text.unknown and .tex.asan follow the same logic.

This revised ordering effectively reverses the original arrangement (for
.text.unlikely, .text.unknown, and .tex.asan), maintaining a similar level =
of
affinity between sections.

I hope this explains the reason for the new ordering.

-Rong

On Fri, Nov 1, 2024 at 11:06=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sat, Oct 26, 2024 at 7:14=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > When the -ffunction-sections compiler option is enabled, each function
> > is placed in a separate section named .text.function_name rather than
> > putting all functions in a single .text section.
> >
> > However, using -function-sections can cause problems with the
> > linker script. The comments included in include/asm-generic/vmlinux.lds=
.h
> > note these issues.:
> >   =E2=80=9CTEXT_MAIN here will match .text.fixup and .text.unlikely if =
dead
> >    code elimination is enabled, so these sections should be converted
> >    to use ".." first.=E2=80=9D
> >
> > It is unclear whether there is a straightforward method for converting
> > a suffix to "..".
> >
> > This patch modifies the order of subsections within the text output
> > section. Specifically, it repositions sections with certain fixed patte=
rns
> > (for example .text.unlikely) before TEXT_MAIN, ensuring that they are
> > grouped and matched together. It also places .text.hot section at the
> > beginning of a page to help the TLB performance.
>
>
> The fixed patterns are currently listed in this order:
>
>   .text.hot, .text_unlikely, .text.unknown, .text.asan.
>
> You reorder them to:
>
>   .text.asan, .text.unknown, .text.unlikely, .text.hot
>
>
> I believe it is better to describe your thoughts
> about the reshuffling among the fixed pattern sections.
>
> Otherwise, It is unclear to me.
>
>
>
>
> --
> Best Regards
> Masahiro Yamada

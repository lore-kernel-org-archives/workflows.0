Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF4A19F489
	for <workflows@vger.kernel.org>; Mon,  9 Dec 2024 23:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733788309; cv=none; b=nDjGfOlDwkdA1672yCbVrjcBThAmwzHKQEfcg9yfPkjcxNFBBexdosbCWp79GYX9t1tqydoCwv8O0nrn0YsAud99G0JMFCasrdUNBDkJWcmd0wXNAnR+W1pmoOiRONA8IfWR+QEigdIjv4MUXp3kLBJI1T8GnZwLyG2iBb53CB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733788309; c=relaxed/simple;
	bh=4Nn+t2Yjyce34wgCQ3ETEjPe8rZLcWfxBP8EUFN0Dy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AKEGuRAvB8jrXMZFfedhoxyHXIWFPMQXyJKgYQ/7rs5RTd8K+nr6xLgQbN3PI3V462W1WyrC7hNqjIMQV7i5yWv0Cmsx9G/MptRFCikIDMEpyH760GZxarjY6ul23+8OL3dL7HWsvF/66YVAJX9uW9gMer4OWTVDWtMFe42BfsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aDwfwm+3; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aDwfwm+3"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee6c2d6db0so4404093a91.1
        for <workflows@vger.kernel.org>; Mon, 09 Dec 2024 15:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733788307; x=1734393107; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSUQjXvXCX7n0zlIPB3T1YFCaCdLs1ofM4KWIMrWBKg=;
        b=aDwfwm+3OsDJ+hy8Yi+maopD92U+iq0Z6QXOZqANjwd6n669vFFVzlPoWRW/0jVQhY
         SCCEBweGkwc8VMyZRzsQu0Hk2ZBndjIbEyWkAbEzeqdNY138WjEQjvdaB2shwOqwVNHM
         dFZDRFhOlBnncBM/tK/w5BhXccL9RfamfIMy7RrJS0z5EyjJm0G42BX44Z3WV8Yttnu2
         i+9cZYl25pvQpmpvn84R3oVANouhiaNIahg+ff1Nl+jA+Alj7MmhVNoqCgFMueuYHaI8
         ejNunuELGOHp/lGILu0zicsTZWwRp3x6561ivktOwFxl/YZp2UB/2sYiv5S40qh4P+1v
         PQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733788307; x=1734393107;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSUQjXvXCX7n0zlIPB3T1YFCaCdLs1ofM4KWIMrWBKg=;
        b=PvNLeKCzVxV6d7+GJme7b6WPu9zX52lwTnmG/dJ6NHCqVdxq84V6aZ9fwtKOJUXDUR
         nHXP7qQjT0FD/TMdOjmQ0lje9/zhpAsR/rXjKZOqS+qlUzmCaPE3MwZEuZLtlJ5MKz5q
         A0kZbDUHMmmSHYBr3I/z5wH0N2Z8HhZyTgnXnu/gLMdX+aIZ+Q1y9Jk40UTODQUQfk58
         gpe62plKjedQAnTZsN+UBNVWhfK7CTuW5MaW15QoZCiiEtbytNPEAd0cM/MNc4uBeqRv
         CK27pMrH9tmfpvC/SLfDAH9whi36LWwqGsC1J/SLF/DXyosbrA2maOxfZKk/YWG9VvjB
         PfNg==
X-Forwarded-Encrypted: i=1; AJvYcCXYj5ePYYEzqmtk4x8ZXfVsmkPV0uFOjZ/7kHS+XkD3wnzRFySd+W8OWTL+rfEnHmYb5uKQuvexd8M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0WSjKMQE4oyAfe7NYyrzhe52aNz82m4QJ+GMaJV0bCFP18b83
	8emyibu5ecVASt7JojN7ba4blsommRXGqfer2Tzs121pMNmtg5rUnmlIqzjgoOgQDlrZ3PXFZsT
	PrzMuFhclDH9PWohlDA2b/fzHBBxmQazKmsBvGev2A5VNA+g7zq9uyw==
X-Gm-Gg: ASbGncuIGrYB1mMN8DjNA8TTqhGURv1ncWXc0MwX9tcTtv0N1W20bTE0S253KQkw5kz
	pEL9y7dehQfEErLDTtVM0JkV59O12r4IvHAbK/x60rd9jPT6VCPy1XoSzeoKWaGrs
X-Google-Smtp-Source: AGHT+IH/zZbQB//HIrX1JNipWnHUi43H4PwqcC6flKakC4Wp5vy64rAYnKcCmJw4Ryeyp5nKhAclTMf/QPAcT0muhIo=
X-Received: by 2002:a17:90b:4cce:b0:2ea:696d:732f with SMTP id
 98e67ed59e1d1-2efcf29a179mr3714478a91.29.1733788307107; Mon, 09 Dec 2024
 15:51:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241118222540.27495-1-yabinc@google.com> <20241209162028.GD12428@willie-the-truck>
 <CAF1bQ=SiHi8oCyo5YnXGpQGofM1zAsnBdqSEet1mS-BYNKVU8A@mail.gmail.com> <20241209185623.GA13084@willie-the-truck>
In-Reply-To: <20241209185623.GA13084@willie-the-truck>
From: Yabin Cui <yabinc@google.com>
Date: Mon, 9 Dec 2024 15:51:34 -0800
X-Gm-Features: AZHOrDkYQ4V69Y7vLhOpgw-bfrlmqVn8MSQhz800aNeQq_Tq1k4ujC1njQBPuGU
Message-ID: <CALJ9ZPNfUFF8OrpvziTnTvGU7OxEgyy9ZTc3aF-NhZ5hMbp7RQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
To: Will Deacon <will@kernel.org>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Kees Cook <kees@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 On Mon, Dec 9, 2024 at 10:56=E2=80=AFAM Will Deacon <will@kernel.org> wrot=
e:
>
> (Aside: please try to avoid top-posting on the public lists as it messes =
up
> the flow of conversation; I'll try to piece this back together.)
>
> On Mon, Dec 09, 2024 at 09:30:50AM -0800, Rong Xu wrote:
> > On Mon, Dec 9, 2024 at 8:20=E2=80=AFAM Will Deacon <will@kernel.org> wr=
ote:
> > > On Mon, Nov 18, 2024 at 02:25:40PM -0800, Yabin Cui wrote:
> > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > > index fd9df6dcc593..c3814df5e391 100644
> > > > --- a/arch/arm64/Kconfig
> > > > +++ b/arch/arm64/Kconfig
> > > > @@ -103,6 +103,7 @@ config ARM64
> > > >       select ARCH_SUPPORTS_PER_VMA_LOCK
> > > >       select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
> > > >       select ARCH_SUPPORTS_RT
> > > > +     select ARCH_SUPPORTS_AUTOFDO_CLANG
> > > >       select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> > > >       select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> > > >       select ARCH_WANT_DEFAULT_BPF_JIT
> > >
> > > After this change, both arm64 and x86 select this option unconditiona=
lly
> > > and with no apparent support code being added. So what is actually
> > > required in order to select ARCH_SUPPORTS_AUTOFDO_CLANG and why isn't
> > > it just available for all architectures instead?

I think it's similar to ARCH_SUPPORTS_LTO_CLANG, which also doesn't need an=
y
support code but requires testing to ensure it works on a specific architec=
ture.

>
> > Enabling an AutoFDO build requires users to explicitly set CONFIG_AUTOF=
DO_CLANG.
> > The support code is in Commit 315ad8780a129e82 (kbuild: Add AutoFDO
> > support for Clang build).
>
> Yes, that is precisely my point. The user has to enable
> CONFIG_AUTOFDO_CLANG anyway, so what is the point in having
> ARCH_SUPPORTS_AUTOFDO_CLANG. Why would an architecture _not_ want to
> select that?
>
> > We are not enabling this for all architectures because AutoFDO's optimi=
zed build
> > relies on Last Branch Records (LBR) which aren't available on all archi=
tectures.
>
> So? ETM isn't available on all arm64 machines and I doubt whether LBR is
> available on _all_ x86 machines either. So there's a runtime failure
> mode that needs to be handled anyway and I don't think the arch-specific
> Kconfig option is really doing anything useful.

My understanding of the benefits of ARCH_SUPPORTS_AUTOFDO_CLANG is:
1. Generally, we don't prefer to collect an AutoFDO profile on one
architecture and use it to build the kernel for another architecture.
This is because the profile misses data for architecture-dependent
code. ARCH_SUPPORTS_AUTOFDO_CLANG can partially prevent this from
happening.

2. Building a kernel with an AutoFDO profile involves using new
optimization flags for clang.  Having ARCH_SUPPORTS_AUTOFDO_CLANG=3Dy
for one architecture means someone has tested building a kernel with
an AutoFDO profile on this architecture.
>
> Will

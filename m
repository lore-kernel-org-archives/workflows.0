Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E821A3AA7
	for <workflows@vger.kernel.org>; Thu,  3 Oct 2024 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727970729; cv=none; b=aa7ZHfyER0TyjFE36/18ghq1JS7026veEhm9RThQdM1CFv75YNeG57+2QU7CSWWkBlL7SN8wvFZasVWXNs7nFUuTZayLW3TqwUCZNACuMafpXFxEPznUJ/nyEwQpe2H7j4feyMPXhKDEjuwI/hhD5y1kg7SehypH1RxVGFBSJ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727970729; c=relaxed/simple;
	bh=R5rdrwIK8Uzh/sQ+IM2Lv+MemaBwurDAhyD5kocYkJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZnnitJWt4XsN1hr7a0VyyPMd8BXzA3X13ZKvyoWncrVBqJKB5WUdtEtf0FeN9daPceZVUnA7IQFUio+Ff644Hks4CJh/uhbUuP5YIADs/6OJy4yWZuTIzJJ09lNGje0Z4r82KegvAb35cbIT89xlaNU3YIkyRIOdutfF7Bt/Pmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Am9ZW23H; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Am9ZW23H"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d00322446so1140900f8f.2
        for <workflows@vger.kernel.org>; Thu, 03 Oct 2024 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727970726; x=1728575526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBzNppjoku0r7wseF+PbhPszUDrB/uxiwrRiITy3hfY=;
        b=Am9ZW23HkBdVYjxGfFylBtYCQvG8UjM6gcyb/rL24FjDGxFIaMqSMwLmG6iIEsNpBs
         zZGw+pb/StzUq6CDM2xPym9zAwwFv4mDBjom9t024O8vAQ/uC9k4cqipyb1c8Br7bdaO
         k09sdfe4TXzhiV5RUDbktkEoTVwuBh70W14wdtfQfkC7a1jgqXdvFWkpeGi3am6nrbQf
         NI+paVSiatVeXy6eXXbEZVmQb+K8HVA49wbL1yzRMyfvKjK5xYNdEWxmHS5b4bbFkBAb
         JCdkCuyuctew8zlMaisS+u10paiRekD5pFlpsHea+91pr19SI/WcfFFcRvfScKGZUslW
         1DnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727970726; x=1728575526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBzNppjoku0r7wseF+PbhPszUDrB/uxiwrRiITy3hfY=;
        b=VC8GP0aya2bvA+oqL9IDKgYrf630WkbTJqIfak0qm8lLlx1H1G428DJBlp+u/On5HN
         t4Aavy/F86RVwslcswRULhn/Ooe2GvhoM9qzxGcy9kfGINg/1O3xcNst40HMwlrUaUDI
         /DMhQib4WzH0DKYLa9XKg9oAmoBzpObtdLX212aTyGKI8bQ4Q87fMXAXmqSFgqD96rEM
         dXuA01l59rkQeUpbKUJNq4gl7KH8sO1DirIDj1g71lCpzaBX9TeKTLUcDUYLLaRnemav
         30V5U+I1OF9ieWYITs00FSDj1BO/SboemZNOqV1JU+WuW2KPymSK2h8/ktiTrbTzJ0bC
         oPqg==
X-Forwarded-Encrypted: i=1; AJvYcCU6JqSXu162IBQ3UboG2FA/I5OM6n3e0vnAGFTBy7ONKRRgYhLKv3Kyqm9ym994bd2o/pC0xN4HSms=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW2SUcbWPwBS+Hx+4VwgbrYRh3cnY+Qw+gA0B/HmEYZqurNXK8
	Ng/4YNMN0czOmR5Lh2CTvNqSsOwgZBTO/nBwQZtYNKF7TfX+CNGil3HQ76KYs0IUo/AqPjy6wNy
	ne4sN7Mclt04BAJpTssWA3C50vKDBic8nSpsi
X-Google-Smtp-Source: AGHT+IGPEhCP23/1eAR/xoiZesp8muQ06ZiL+lHkT4wcjYh5BmgAWPboo+L38mnUbZhHPjyv0/bIj8PqGVc9tATpGig=
X-Received: by 2002:adf:a2d4:0:b0:37c:ca21:bc53 with SMTP id
 ffacd0b85a97d-37cfb9c54a8mr4724671f8f.26.1727970726177; Thu, 03 Oct 2024
 08:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net>
In-Reply-To: <20241003154143.GW5594@noisy.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Oct 2024 08:51:51 -0700
Message-ID: <CAKwvOdnS-vyTXHaGm4XiLMtg4rsTuUTJ6ao7Ji-fUobZjdBVLw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Peter Zijlstra <peterz@infradead.org>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Masahiro Yamada <masahiroy@kernel.org>, 
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, x86@kernel.org, "Xin Li (Intel)" <xin@zytor.com>, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 8:42=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Wed, Oct 02, 2024 at 04:34:00PM -0700, Rong Xu wrote:
> > +6) Rebuild the kernel using the AutoFDO profile file with the same con=
fig as step 1,
> > +    (Note CONFIG_AUTOFDO_CLANG needs to be enabled):
> > +
> > +      .. code-block:: sh
> > +
> > +         $ make LLVM=3D1 CLANG_AUTOFDO_PROFILE=3D<profile_file
> > +
>
>
> Can this be done without the endless ... code-block nonsense?

Dunno, I think it looks pretty nice once rendered. Makes it
straightforward for a user to copy+paste. I asked Rong explicitly to
make sure the documentation made it so that non-googler or folks not
working on autofdo or propellor could reproduce (since we'll probably
end up standing up CI for these newer configs, and BOLT).
--=20
Thanks,
~Nick Desaulniers

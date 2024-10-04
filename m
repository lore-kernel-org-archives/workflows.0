Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693B01428E7
	for <workflows@vger.kernel.org>; Fri,  4 Oct 2024 21:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728077040; cv=none; b=I40NNaFu8qM+0HszCLBgIlsi+llr+r7sEuXWnP3G3Gm18Vw1gLLzYrFvb1zjcbWIH7q7ofcWH4CRrl+LHFJLYJskzltyhrUkqZKQP2Bgi12Oye+2qKbdf8ODQIMfUKini8lFI/W7RpLbD6WU+EWvKQ+A7YmxscnsdRqF0i3m/nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728077040; c=relaxed/simple;
	bh=1OR4Ve0G8ozTpeMWZS3Lij1bBkuy08uUBWlqH40INcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUGQApFKxtuVX11jtHA9yAfH3QhvTRLyFIl92OO+5cmHfmplhFd+K6QEH9yvuP+wwn6Dfl+GJF6oQM6C7l/r+uViCmd+TwReUo85i4YmGDIftAGQooreUfQayk/1q/NNeisGOWe6G0SJmfMkpdjGznBp2DQAsMk9wbndpPG38wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gDsYUpBO; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gDsYUpBO"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-84ea1516673so699008241.3
        for <workflows@vger.kernel.org>; Fri, 04 Oct 2024 14:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728077038; x=1728681838; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AS2Tt07mNVpSQvOxW3B3xdNnuSdtzeSrYZ225ecdgxI=;
        b=gDsYUpBOUyOIK/chD/NhLydvOrzS2gaKMidbSVxMQN9DT1PUbO6eAhnqArl7rVoKGG
         +tV7a2xc9axU7/VlOs+isSemXOM93zY89NKJlE5wmgY0l4KLI6ENuPIf/lXbmmiRIamA
         hkqPmMC4Qbab33wThEfwnEz8UmH99GDDtpvqvU4x9zsP/5nQuXTiIoJMG+UWHA1wUhhM
         VvREyW8nFq2whOVYifvVD6sc3nX9x3O7aR98wjfGV/xuU920polsh6Hav/okronQITL1
         zIWf4oLNxzgVyUMckRphL/Jstlusc1zIQ4+W2rHRTapfQzqMpeWteNWCp7/CmP6eKLHS
         5J2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728077038; x=1728681838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS2Tt07mNVpSQvOxW3B3xdNnuSdtzeSrYZ225ecdgxI=;
        b=Ei6a+BQFx/n/JicpOu8vYGgqxa2U/Fsd3HXY6YAXxet/CPTUUws1HsV4RK5SEkCNTc
         KMU8kfsdDpxqhYW2tN62m3POHZlD59AobcB84LzwpWDlOSLTcrx/RIHGDHF+RoyhE2iT
         XpOihOUnJ5sHhCBxGgAXoooGyksYISfXRCkVgTnZOFo27v3BVdefka9WZ/Rw2CVdAKhf
         TKUCJu0zqDl9Gu7z7gS1zniVqcHk1YIR3R07I+j/5W5QlGT+e7IrwvfRfQYJZ/8Dj2nr
         qffjy8NCwA4Xtz7Z3RrJ7BGniY7Z0UL0QU1WCBwfdwIhhqyWNLRVNVY/OR5kEHEpXjzn
         WdpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmEYltbQ8TiSSVzYlck5qIFjjQo4ralgLgSJwP89SWs6kxlCU2uZ+kPZhYnimYjd7701KQdbcvzFU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1qV168/wQxpuGbXS8gMhfl6bfjVyx0lXKFeGUOUWnxGGh4nVu
	z8gd5kiX8HBUO4EQWsNAsBxwT5xHwZPn6qAcNIqPEOLvCe65aAFYMduxH1G5WJCX2THChRDdTkQ
	9Xr9bZAmUyI3RrU+X+ctc9BXh8AucGY7b9H6O
X-Google-Smtp-Source: AGHT+IHirBWZiJ7avVL8zp5O8TKnny8LN6+S0bUCwVjwrwc/DYRkrAgQjSc8Xmqms5tSFJGQ8crQgjb9ejhVAZBSMZc=
X-Received: by 2002:a67:fbcd:0:b0:4a3:ac2b:bffb with SMTP id
 ada2fe7eead31-4a4058e1360mr4377858137.22.1728077038261; Fri, 04 Oct 2024
 14:23:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net> <202410041106.6C1BC9BDA@keescook>
 <20241004182847.GU18071@noisy.programming.kicks-ass.net>
In-Reply-To: <20241004182847.GU18071@noisy.programming.kicks-ass.net>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 4 Oct 2024 14:23:45 -0700
Message-ID: <CAFhGd8rPLoufNx4BMV993c+S_6psLGU6Ow49Frc9s88cStcuCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
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

On Fri, Oct 4, 2024 at 11:29=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Fri, Oct 04, 2024 at 11:10:04AM -0700, Kees Cook wrote:
>
> > +Configure the kernel with::(make)
> > +
> > +     CONFIG_AUTOFDO_CLANG=3Dy
> >
> > Then we could avoid the extra 2 lines but still gain the rendered langu=
age
> > highlights?
>
> The whole double-colon thing is already a pain to read; you're making it
> worse again.

Lots of people read docs on the web and having code blocks with
monospaced fonts (+syntax highlighting) makes them easier to read
there.

Configure the kernel with:

     CONFIG_AUTOFDO_CLANG=3Dy

--versus--

Configure the kernel with::

     CONFIG_AUTOFDO_CLANG=3Dy

This renders better for html through Sphinx and really can't be that
bad to read in vim, can it?

two cents and such,
Justin

Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84052170C2
	for <workflows@vger.kernel.org>; Thu,  7 Nov 2024 21:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731016461; cv=none; b=SoZFwXDNuCUP3EJZTV4YqWOWbN2G1ISKqD5TpU79L+auwvVMuf7TQ4M3cJMtUQdPa1UV6Xj0fURTnc2fDOcvEJFJCfo+C0Xp2D4XpmlHuFl7C6DY/vFrp24ucCtIl7rfshpn2rFGAj3yr4VB0FQKRfpzmomjCeh6nGpCUxgSsqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731016461; c=relaxed/simple;
	bh=L2z5Im7eApEYnSF6VAAS12BUcltczp7EaP9nsBPNtgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZf/zU/mscLrCsXz2zbk2Vjs8oSQNxmH2I3Jn6go2TH0X3b/kTPhvsDMsjk9WoSxwp9ZLhaU6kENSH5n2PltwNdNfmYUzD8kBC4jyZW6VW0BO7L70i+nGuKzdCVX4rfosL8qzVtADG2hxeSlo6QjRByVVkEHTm17L1v2FD71pcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BQ0ookEI; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BQ0ookEI"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4608dddaa35so88771cf.0
        for <workflows@vger.kernel.org>; Thu, 07 Nov 2024 13:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731016459; x=1731621259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXyRMpyA+Wotd0AmuT5vj1vIpPFJGkQFHScvE/Azn4Q=;
        b=BQ0ookEIX3hz8qB0+WTx3crlIJ/BaR1qbqucW2T4SDddVR0ckxwtuNhYEXj563QkxY
         AGaHJRubLcHlSvCoZjPI6zHAOkUP3jhieIyKyjUFXgCqckT4ClEVBUSbQnMOxe+CGNCQ
         QO4esPxA09ImVMnrdQYrwiGQvtYXpWmy/sizV49Y5jo6lXIMIpApZiEPZJSrwOp74uLl
         mYjrV3H/NDDWfOijAUFu2ZjtJJVp0eNQ31Umrysqcupo30+AN4pd4rQXLTUCup+0WtVG
         AyTCph81uuGplCW2JqZftYaBnNksG2cQ03t9CGbDe5TYXxOYkNdQv+jtQYlne2TV0dUa
         3KIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731016459; x=1731621259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXyRMpyA+Wotd0AmuT5vj1vIpPFJGkQFHScvE/Azn4Q=;
        b=Ts3RhmcaH2ioPIEOmTS4qpyv0wf/v7VrUEcUbp7fMkeOplc86a7GVd7fBVdF3ShUNR
         rocwzKR4cvrnlBQawVe3vsNoKmbDLULw+0Ph5lsU/2cEPdNGL8sgXTmWXGzWnL6N2D3H
         muH2fBkZmxoZC6PgWenRVMiIim0HtQ/xF3LfljqHz4Ys/wx38t6LOd1f8vHhBiXpq7/F
         ijvsaFSKW9AZdJGWF7/b6pw07fRWwySXJzcTCDzE5UokpH6f1J3Frl/lBwdJdSuCDWMG
         OqhIu/Nwqsrz4bS0Zk3qYjf472mC9wmW2mRSYcQ3gcV69KnyzkVFNv8xQK9QwNW1NIf4
         WmvA==
X-Forwarded-Encrypted: i=1; AJvYcCVMPiwjlTTzu3+UWg2OJcm4xp+8A00SJPVSS+WWwUJty+u8kf/gWr+HwaEiyvS8AtWOfRdUMV+jc/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpFvfpVm9rp1ETNsILpO7FBuo4LIWQHWYf7pmPN6PyDmsahc2a
	h+TPVRsX99oSpsoz1t1Um/hVoiFzizsunSogSaqTGuffpy2rin3EzDPCzE+5HwQWtR28JvxS427
	hiNYHhnHDW+M2LvY3RPPaPCkPWonON+Sf4H8A
X-Gm-Gg: ASbGncslGCIfHKzeoQVxjEfMbaL9DBlDEp1hAnJtMOvusbnfBWfCsTI+WNREXibTQt8
	LsLuMX5sizcYDND/qJfc2hazklkIhb6hwN4LaNMDlIvgLw5c+sDvbD3sw3naE
X-Google-Smtp-Source: AGHT+IFdkSoHyavqa/rWYWexCV5GeErWCgxte9R1lHiqNRFVJXCyk2W6mdtD7fnvhuSYzrquH11z1oepbqTe6XTTqdc=
X-Received: by 2002:ac8:5f06:0:b0:462:ad94:3555 with SMTP id
 d75a77b69052e-462fa646403mr5858781cf.25.1731016458594; Thu, 07 Nov 2024
 13:54:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241102175115.1769468-1-xur@google.com> <20241102175115.1769468-8-xur@google.com>
 <20241107204504.GA3432398@thelio-3990X>
In-Reply-To: <20241107204504.GA3432398@thelio-3990X>
From: Rong Xu <xur@google.com>
Date: Thu, 7 Nov 2024 13:54:06 -0800
Message-ID: <CAF1bQ=TNOs7shXMbgY3UYzDZyF3ge=6hUdfEJvHV4LOo--tqVA@mail.gmail.com>
Subject: Re: [PATCH v7 7/7] Add Propeller configuration for kernel build
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
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

Thanks Nathan for finding this out!

We changed the propeller option with this patch:
https://github.com/llvm/llvm-project/pull/110039

Currently, this patch is only in the ToT clang (v20) and not yet
released in v19.
I'll add a compiler version check to the patch: if the clang version >=3D 2=
0,
use the new option.

If this patch is later released in v19.x clang, I'll have to update the che=
ck
accordingly.

If I don't hear objections, I'll send a fixup on top of Masahiro's branch.

Thanks,

-Rong

On Thu, Nov 7, 2024 at 12:45=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Rong,
>
> On Sat, Nov 02, 2024 at 10:51:14AM -0700, Rong Xu wrote:
> > diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
> > new file mode 100644
> > index 0000000000000..344190717e471
> > --- /dev/null
> > +++ b/scripts/Makefile.propeller
> > @@ -0,0 +1,28 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +# Enable available and selected Clang Propeller features.
> > +ifdef CLANG_PROPELLER_PROFILE_PREFIX
> > +  CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-sections=3Dlist=3D$(CLANG_=
PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
> > +  KBUILD_LDFLAGS +=3D --symbol-ordering-file=3D$(CLANG_PROPELLER_PROFI=
LE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
> > +else
> > +  CFLAGS_PROPELLER_CLANG :=3D -fbasic-block-sections=3Dlabels
> > +endif
>
> It appears that '-fbasic-block-sections=3Dlabels' has been deprecated in
> the main branch of LLVM, as I see a warning repeated over and over when
> building allmodconfig:
>
>   clang: warning: argument '-fbasic-block-sections=3Dlabels' is deprecate=
d, use '-fbasic-block-address-map' instead [-Wdeprecated]
>
> https://github.com/llvm/llvm-project/commit/7b7747dc1d3da1a829503ea9505b4=
cecce4f5bda
>
> Sorry that I missed this during testing, as I was only using clang-19 at
> the time.
>
> I think you can send a fixup on top of Masahiro's branch:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.gi=
t/log/?h=3Dkbuild
>
> > +# Propeller requires debug information to embed module names in the pr=
ofiles.
> > +# If CONFIG_DEBUG_INFO is not enabled, set -gmlt option. Skip this for=
 AutoFDO,
> > +# as the option should already be set.
> > +ifndef CONFIG_DEBUG_INFO
> > +  ifndef CONFIG_AUTOFDO_CLANG
> > +    CFLAGS_PROPELLER_CLANG +=3D -gmlt
> > +  endif
> > +endif
> > +
> > +ifdef CONFIG_LTO_CLANG_THIN
> > +  ifdef CLANG_PROPELLER_PROFILE_PREFIX
> > +    KBUILD_LDFLAGS +=3D --lto-basic-block-sections=3D$(CLANG_PROPELLER=
_PROFILE_PREFIX)_cc_profile.txt
> > +  else
> > +    KBUILD_LDFLAGS +=3D --lto-basic-block-sections=3Dlabels
>
> I think this might have a similar problem but I have not tested.
>
> > +  endif
> > +endif
> > +
> > +export CFLAGS_PROPELLER_CLANG
>
> Cheers,
> Nathan

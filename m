Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB943B14B8
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885149; cv=pass; b=YBFMQMrsdMGUclJk6MFutSJ5JrCiCDXGL/zv6BNXMI/OQRaYSo0Pq/Lu3I14/9NZY0WDeoAdI5biV/R+GZnREfaepwihTAgFJubTBypJmji6GlIaKm6JgfxUf/ORxxws8fFavILS3hC3tZL1htX0T2FvXlniEvGiMh0E1MQbhP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885149; c=relaxed/simple;
	bh=TyAuVkyMsHJJREXO1/HTkl4JIBxp9Fm42OQD2fqAPFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4zqlECUq22kXyw73s0NJ06LwEcoDcebu8Q2IPjdCBay7hxK4SydQAFQZUhkDP0HTKLL2kQpWfa00dHoo5ff8DVeZdlbmpbKzOjafgJKpQosdRqVkCEakQjl+dAeRkjMEwGKpP4DHA6PLpfXHaGuKUZEhoAhi2OqSdE+yPmENDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OUe1p8Js; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OUe1p8Js"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1419d3416ceso4096428c88.0
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 02:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791885147; cv=none;
        d=google.com; s=arc-20260327;
        b=hVwvH9EtoYjVQN1ukuFOB/yEHC5iDevVqDGp5DuEb1Mx2E5ZjZgi756DvVZa8yeN40
         Gx2KlkjU7Wmu8XLhcv58vlwOC8Y5u7IAkJNo3QkGixdanxSNQKsNZDavCx1DKph/l1c8
         aVFnjpJoQ+UtuJoZy+J3/lW9RLDY5/CylpAzGkZDivS2KjbLyQAtOWGFbh27/wdtwF/y
         coXdnrxvF0Hpu3eouV9pUaR2DjajWo9uKbj32bw6aL02/REPAxzIL5VnL/ktldOS1ral
         tgwt7WPi5VAaGs8qlIZTpJaRy9hSpsoe6Co+4kb+2Wkd2Dq+N1Wpmb5jDdA5/3kFxZ0U
         exQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        fh=4KdD6/vilkfN44l3iQAjECCwZCz6i5Bfx5cOw+5mMBE=;
        b=qxL3nQu8gOVbxpvn6ZjuSKe50kfww3CdcbtX2WnheqnCORfV4qUIHCEFu8apJa6rMu
         n/tSpK9FraSrn/JpqGdNqEh7e0/uYg2u3h07B8HSbyVlpLfGdIasux++VA2+WqxjDKaE
         0z5CGSpi7HwlJdUT1oZgfLW28mjkSqMdLgrRqxcdggTDjqB43B6GxJJTMsqxWfeGIwYN
         etlrICFVBLZPNhWDBA43adSOYY6LG8w2xaYA//aUA6HW9Jk07o+WRFS6EJv582GTJqDV
         VqBO3lCuv0z/N6k/ZRyF3vyhP5FF0iDfBjNvuuROClvbSwS8vWYNGnOlPZqVfYLbpMqo
         z+1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791885147; x=1792489947; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        b=OUe1p8JsbeOEmdidmgAwZjuQYWObCln0UY6mN2eUEQlLo8RQwV3Wez4R6Toconn+2u
         SwPGP8b+GpqrAeyfYZLM692dVCl8k5vn4xCfNuGKRAfvfdLW4KGBVya1t4RWLKH6ELWD
         9A6WuTcdLUTdhNf/MuIce3PoimcZODZ0HtnvYu+7q5io1IQl6ksS99sdaHam2o+3ZYqL
         niW9YVjN+cw91gOGKi1XQJ3scIcybviJt/gxM/9I12iEZMz/64ksZfQ8QV7Zh7qg+gew
         8cSgZD1M0cXsfyOnBJpvjsn9WE/cAIIzU57mjE7HVw0PwvaLRqH0Jo+eujidbn8w+Y/Z
         fV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885147; x=1792489947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        b=cnrhkR7eh1/PxXfhFFbIJqPg1I9XTwSEBARQpXm94yQMTn4mr4LFLHiEImElJ9YfSe
         +JOx2O0zRh1F/716GOPAuxfE4iXGA1rn1n/X+cSfDhHhLgaTA336MdAzcqbiQvypgXFW
         kHXl2zMXcp3M/IcR9pK5Ltz8Bo/0zG/lamw35ErNa5A/BQmtKyRLlh64mrSemEkw9DUP
         V+mXezH9iEq7yw5Iym4O4/cF+jKKQEqUcjvD6BLqbeF5bkYRL/rMfJfWQvzlFJelpvXk
         n5u9j20UJAG+JAdjGDTNhIuOIDvYZTqlEouBaOdJw3ZHp2+He7jarVeVeRZESARBmEiw
         HLHQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2J0cCSTwdH2KhF6dKhpix8e67RsWrlx8aPEejChE0Z/VyU/9bre+G1uPmSck2dF39en/ay7tb4N4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfMwlHEdBFdfnE8F+YhTYMfAjkDgi8I9cY2kWrVRThImgS3GYj
	rf4ToBVjIObHeZNw83f04TlrIfN38+TEBTKp9h+KScwm7O3OvaSxJD/PE5fCc/GJmRh2QXRmsLN
	qx80y2gg4GO865ekoN1GmQuR6s9Tv6sfHpTa0Ycjk
X-Gm-Gg: AYBFou2eTCtJRQ0GRW17H5RNPbnxEbkmO8RRyFpip1HnXut1OwtTIJTy3RaPri0vl5a
	Rg3lXiUeM7JxuYPuVC1RsvV0ZUczTh6RkldDhtcjOrPwp/sFeRoaIj4EvIoT6IiflXbF1Bf3VD3
	8fclbrUKxNHVYcIbv44seOfxwkTGb7hrh62rURtSy4HeT54PmeCNKqRFjSsaHWL6Mhi1AyLTvYf
	QUP4PONYMcXv+b+Hm1Q/ooRe0XnYnqRwNk/XkjQCqCSCHjNMsHxc26ESqd2eX1k/IhaLT0CUNL9
	5pQAoiQDQZsfMTQ4S1CWXIiHP/wiXO6vqTaxKXS9j00CW0RvMmQNk2J4Sn7WPBLRtkJerS8pR9F
	o5kB9okEYTA==
X-Received: by 2002:a05:7022:92c:b0:165:8e0c:1886 with SMTP id
 a92af1059eb24-16a610c9bedmr22542241c88.25.1791885146407; Tue, 13 Oct 2026
 02:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
In-Reply-To: <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 13 Oct 2026 11:51:49 +0200
X-Gm-Features: AclHuK_xfsOoDi6wrmohki4XfQkFak1e3ZKbYQiASZjaKFsec73Ai0xMvJurni8
Message-ID: <CANpmjNOdnZw7kgjruLikbyPK2fqLgtndMdnX5osWtShP0Wh_UQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 at 11:36, Alexander Potapenko <glider@google.com> wrote:
>
> > +ifdef CONFIG_HAVE_KCSAN_RUSTC
> > +# The minimum supported rustc's LLVM supports all of these options.
> > +rustc-param = -Cllvm-args=-$(1)
> > +kcsan-rustflags := -Zsanitizer=thread \
> > +       $(call rustc-param,tsan-compound-read-before-write=1) \
> > +       $(call rustc-param,tsan-distinguish-volatile=1)
>
> Do we also need -fno-optimize-sibling-calls here?

It's optional - I added it for Clang so that stack traces are always
complete. But rustc doesn't have an equivalent option (neither do some
of the hidden llvm options work). So this is the best we can do for
now. I might want to note it in the commit message, though.

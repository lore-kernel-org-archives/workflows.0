Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBB13B19BC
	for <workflows@vger.kernel.org>; Mon, 12 Oct 2026 14:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814695; cv=pass; b=I9FWqG1up4rrQYz/hLzE2hAYf4TbNBByvie5FWNNg3gJt0ju9UYHeOAs7CqMUysTUT7gj3hAvdDWQ23fGEQ9DbZJSdpNCX61QiPSTS+Ah1+ScPUbhX1StXqolUihXXlXPCkg7B3Hek3NL+zokCzSgpy7WgllHZ+50BFKDULT2os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814695; c=relaxed/simple;
	bh=g/BhmG4j9ffr0oFBvhz7lb5ueTvQbhXIGndnnY78eok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ucnwNGjPfP7RB82j1jkKE3B7x0v0JGJWbE8srUHYtLZwL0XcbcYt2VQchFmSFqkKdrDHgnumL1ozY1eHFq8SjAjAkOH5faJKxOi2+r+Ao0+vd8Bv7Tu4xDQ7Q2DM5abG4At9A+bwAFPiz7rwF/ocK4IcqoHw2isT0rxiS4PVsek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My1OId9A; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My1OId9A"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bb5afa736so189725eec.1
        for <workflows@vger.kernel.org>; Mon, 12 Oct 2026 07:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791814693; cv=none;
        d=google.com; s=arc-20260327;
        b=FthObQBZ5j+PWg1L4JoneYRxFtt41Eu7vWvV15S8dvKpAHLjwISLSN4OexhqXx+bjN
         31KMnPiZ2M+2oGHVYCdBQeNY4tqRaRsZph/xITOc1G8R5rY5Wa5R5LQeYHlRZZBlMe0/
         RbnFXo8s7U0pHXCaz0+Pv3j+Gi6hT/uKZEjXGwr8qy8tNFeyIP4TQakhmhVb3uneF7nB
         SkaZA1rou45W36uyhljiFGNYop24/kuH9FevWyPY2GgIthhVtI0a6ljkmcNrRxn3C8m1
         riaUd43u8EQaukH+bCNc6PVCPNIZEgNFItMJ+SSZmUhdZQ8MqXsRmzASbkX5R16LpgHd
         sSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        fh=Z60bx6dbW/kkNoe3jZ6GKViPtYisa4/LhKtlhGPSEcU=;
        b=ShLebTS5sAoiTCOIz2XW5kTnl5IBiaamhQxNVGSb6+w+N8pWMPK7afaNaJ8+UGOTeB
         Mg2+6TPmSjOY5OIw5Y0MnF8IAIgrGxpUxrMKeoYLiJMHk6F5C165r4eL8ZBw1JC9Sqlu
         zxVTbY6iBtcY4PMitNZpv8aS2OaCsgPxyoyPf+i+fZ07amsdzRh6GRgZ3hkT3FRwFxIx
         d6iMa8yTQijs4HJavUs+lR5jYnkLgnaa0XH+17jOgFEDRIlQc6yS3AoC1Vzmb556RgXH
         gM46gokcnhEgnZ9b6AGfH93XLBIxCILsxj1UpQaaZGepDh9CobvaRMjKK1/MypoRzgMq
         BQ0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791814693; x=1792419493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        b=My1OId9Afu44hbY9lwaqcKNK3hVPzp8rPSGYolT6JXNPvKYoq4DQfBxJm5eeoJXLPE
         LnEVGTrZuX+RqYI1veoEBDoEaHJ0XGtbCfJOw1YNRELMGZDHnFsmI08VMwcpW8q0F+AD
         v5ZfpZVhTLtHNjxeG3QnsaMv1jj4zddz1L4yMn0P2j8BpqLraO8mASnlHu8kXrlT4G0c
         MLRzDVtTDHSq9ocOFjs9CL4dC5zfsgE9m84pKgazql+TJ1BP5kNcPCNMod6lrfmLJDoC
         aKqrtBEw69cKrJ/QfHKwQnTNVLNkRGOqTs66ioJZ3oD84yrKdYtggQ11+otgINcck2Wl
         kEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814693; x=1792419493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN3n/cIMeW0sefgec1U1C0Bcl140fSse8+Pudd7plIQ=;
        b=qsA/kz6sjcToj+1MYIYH+kAcItVEW6dvq/iqR8DrhW67RY58MixFb/J3pieqcntHL6
         GMJfd/OnZc418suiaIW6GSCI/3wIIWZs5f/Pin9qWKxCYDihajdqd9RAVMMn1a4h9USA
         ZjJ9f77U+MvfYyHrD9lYmomjUXUNRWCgj5e3bU0vOB3zgexEfF2EMEBh46OjBed4PLzO
         s/FweWg4C0ZJsIVMSQLeEl+CexIhJJk/w+fHq+PBuStdlo2XglSX0y1OYh+cCMHxwESj
         svpvkabNcMfg36rpivyoptia7UidTLu/5kKwxdkUXWBnIDklr+g17CEYQ7svwnthOwOm
         NvqA==
X-Forwarded-Encrypted: i=1; AKwUvBx7zzh1YyzQ1ohstniVlHtAhzfM/x73whPPExKbGb0/Kzu0O2//n7fCNtVhF0tz2ARS0kPQGAvaQj4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfomK7hReVPErEG/3PeZH0tffJbLokPqVUrNoqqWIVCfLCWKP2
	pFqkZaBtEhRSlc9s7hgxnjE1rVvfKvPQMYFhvRLsdisWWbV16QQBEXaXGONiK5PbQveEI2mU/Do
	4Z9VHhhdJiIeMER/CEOVblkvYbkurkdQ=
X-Gm-Gg: AYBFou30RMQ6TX0o5bw5vHqqm5j88QFLuXnubtRp4xMV15SAz2CjZZyrT7hbrlEalBy
	/w9QPfD/2AM3H1j6XGNYsMnyEpn2W7jYKDpvqMdvCHZQeBnWWHEAx6cVgh33LKQMcg8UDlxi3Tq
	Z711VPsd2PfwUIfOvmUajlyWZ2TDcmj/oMCduHEShTwrQ7hkAHMybDgDLaRBLJf4BoE3/i9kNCz
	csXIhs5BO4gB4bBiv2xpdtiwgOUhxaeulxPS5n/64dX2b2KNVyE62sot7SOfGguEvYNGuPoUG97
	bpxoAEDVcQpgLC34TWXUVMQX0DAZN9yvwdXZae+WJTC4Cdq9nrY7ha/fsaOFk8K0f/qQcxng55Q
	p8Fc9s0jg03qHv5zWwmc5lZkXK1qpVHjIxy05mVJNDJFsG7rYDWVI4tfyvnYzIZoizFzhhOtMEy
	PEoO2wFLwiJcdtmZCZtXcdH3+nAy+F3LYkHeKnox7b8EkZAnPCDTnXxPkJjb8ehQ==
X-Received: by 2002:a05:7301:428b:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3587ee40938mr13997955eec.0.1791814693087; Mon, 12 Oct 2026
 07:18:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com>
In-Reply-To: <20261012134159.912183-1-elver@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 16:17:59 +0200
X-Gm-Features: AclHuK-Ywlbcl-S8KQPaD-1cIH6SBhIHUu2wWCV_8Z4IN4dYEXXQbTyoeFpEilQ
Message-ID: <CANiq72nsJw25w6sFbLKKSaWog5_2cpmBmJMat-zQW1rcveJA_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 3:42=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> +Rust code is instrumented as well on architectures whose Rust target sup=
ports
> +it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).

Maybe we can omit the x86_64 bit, to avoid maintaining the list in two
places, although it is convenient to know in the docs (but risks
getting out of date, of course).

> +  Note that ``rustc`` rejects linking crates built with and without KCSA=
N
> +  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>.o=
``
> +  cannot currently be used for Rust code.

Would `-Cunsafe-allow-abi-mismatch=3Dsanitizer` work? Not a blocker for
the patch (and in fact I don't know if we would like to actually
support it even if it works), but perhaps in the future we can relax
it using that.

(If it doesn't work for some reason, and we want it, then we can ask
upstream for an "escape hatch" as we usually do, since things like
this should normally have one...)

> +# The minimum supported rustc's LLVM supports all of these options.

Just to double-check: does this refer to the LLVM version of the
upstream `rustc` binary (LLVM 19.1.7) or the actual minimum they
support in that minimum `rustc` version (LLVM 18 major)?

I think all the options exist for a long time, so it doesn't matter,
but just to confirm...

In any case, this sounds all reasonable:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel

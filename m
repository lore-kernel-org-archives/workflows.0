Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447155;
	b=pNoqK2GVfOne6GG1AAmK+BH9MmcOBjzW4xwxaYw+HijMG+hm5jaMatwF2wsDr1fEsOwq
	 esICB4k/9KwLHqiUqzNNY/9r1wN8d942xr1Nu/8PTl7/zsmAMC9xTfP8Y+HFRnRC11gFd
	 7umAgc8aFV/jYJPk8lxm5ywROE3TZVImrdih6WGbxXRXXEUXJPBs0q6Y/eP739HPUUntM
	 voUUIYdx7Z/98Vl/oifObc8wk5NFfazY2t7YY+Je5vPC3ys81JAWfhrkhDgaRjIeCHJWt
	 Sn87XCaiSuDvO6x5/weCrUnoW9ZOw5jaTR+WfVx7pjv6rjY5K9Aezjwk6ndduFg9ScQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
	b=LvWpYn0SnCYObiLPYEUw/mQbAMlA3aDh/s4a3aE1u0z1r+Sds8yl4FVbHds1+Jzca68i
	 IRJQu7JGea+6iEqYSAjdxXskW0p1jhlYSm1RpMN+/3hkf3FKgPPQfKVMSihI9jx3gTHL0
	 PU+BX//viPme0cUA6vu6HJ/5hKvoiq9W5XRjwZVRal1G1mypSZyNLhOXF3zdIVQsQ9+Ug
	 R51++QrFJUw0B2xk8IXXWbBlWN+QNQXNUAvJPMLvfcRXS+sGYozD5ci1y3Nvv0GiflD3T
	 sTB1/2A0KD+0VNu0OLkUMdVc3rHHVBRrxGWYmHEJ9Mo6O4BaI6O1nlw6IYh9Y2gaajw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LX1cEARj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75C0606A31D
	for <workflows@vger.kernel.org>; Mon, 19 Oct 2026 21:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B75C0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LX1cEARj
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so6768984eec.1
        for <workflows@vger.kernel.org>; Mon, 19 Oct 2026 14:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792447154; cv=none;
        d=google.com; s=arc-20260327;
        b=GfZLPZstqBnsK3jUdumL8gkPMc6Huw2m22DGBrGK2pkn+NSv9aAlyYjZowoXZxc27c
         BX/mpNtfOGDKME4Ew7nuKkNP14+tx6a9Fj/Wgz3jEjac6ex2SNzmC0bsYdqc6I2eT/0G
         UY2UxUmswj5HC4qV2pCfEWiEqS+DkOAL250Kgef4fJ1OiA+dq5V3Y651lLY7C2++5YKh
         mT6DQtLaQ16BIAy51JTC5yjvWrtQmsmKLqyZ/rvY56b4tWRks/vvk/c9wP+NZEJwO/z/
         5Vjb7jmGzUsiBB+okz89XSzkDHq6cOmWOGRkxODdjKYYZZt+wM0GB0T47ZEm9R1cnuQv
         8tcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        fh=jJ9g7BEpbKfmf4FugCjmC2P1NMRE5FQDBKfGGSJ7Cqk=;
        b=VJFSsJNOLZ/wThTHP237O6S/FazpiMDYo5Z9+bjUqM2gZjchMu043r6KMKmLwXASGe
         VJa+CNisBeeBtbeW91Dvbz/HcD/3yvy+a4nvsFPVXmCVB/rXTG0WpuP8CsTLB4QX11Q7
         OIfi2RE0HtxyOjVlQhwYi+lxPOSHwJ3gHHBqpDJvWA8LphVUZluvVEDOwnICr0zesQ13
         xQYgImMyhokQRTiejREsqKVsq8BMjiprXwXRHjbtkamGWnFvUTMihdmHXlQct2MRd2Fr
         XJdxu37qek69f8M/DhUTIH2Qd6U/Hq6oi4KCxHOsZYbWynxijg82PYFO9UuwuUj7nLfz
         yJsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792447154; x=1793051954; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        b=LX1cEARjYjyLWsHVq0TnFadifJpMl1riEBFE/Xx8mL8ByCwynKD6qynI1EhJIyeHh3
         KzObEBds2ULVeYU3xtibaPVku7fXs8HIAaTa3IL8EqkJGKqsm5ZEnk2LuCr7nouCAPHL
         EEGupoMs35LpI0T8ZPFeezaSAVyDuCMdBUu4DOHGL/2xcMYSI+AosaGkmZdwQJaIiQBj
         micsO+P2ZUueb9J4/4bAfcId3doFTPR+MlqzRxN9HYoDSz2wConPCJdJWMLwmtKXs/wF
         85Zk/FzK0k1omjubufQ2cY8dCOMFq2UeQrg2Tng76mJCvceisZ2bPXPqk3aX3zkdqdid
         4gdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447154; x=1793051954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        b=m6p1APsCMmrymwcPU83M5dqCHMlETlkCWoZx581RT5beFgdj8dbZVJ9DxyvdI0rdef
         1JbT54T3HY6vwBcWEa7HkoJM0qjv4rHjws/GVkZViJ6nxsQ0JFLCmFMCu8+crWvgteJ6
         vEWbOkUVsWdq8cysFIG7JrW4a17aehbd6D5EbLUFaFpZW3LguerUvnGACulg3EoOtmnS
         FlLz8jzbrMQwZTYKSQU7ZezJWwmU6VWhptGv2B0aVBJahNbowwpUWMOIym7PgXM5lrTJ
         xExPpdL8kWecbEbfntne/qkug2ZwdeaDFgQEflAUgQsTLQOXBXoCOMWoCrWqqqhwG7Ad
         MbZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQNGE4vj8AD7Nbyn59vyMwgx0Q6pcV3VP3AAEXq8kSKEN21XONXOwF5Xwag7xUeRrM7AfrCXt59aM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZhfs2Ce84ZpoW9pS6UyGc02smmnp629J9yq4nnWlbgfRCbd24
	QJpOWSqE9laiFvmYFedSMUeqDNLvjAeej99B6TYGMQfsT54yMMMvsaL3RxGWM2SBhHgWhJ9c8sM
	k7J7DtGCHJl2qtdAxFIYwlnlht1P8viJi/zn1K7Sl
X-Gm-Gg: AYBFou0VEHUC8IYabx2mkpMP3miWkcXej6v0sYqsfbvZL98OSwpvmtUpE96MtBKBwng
	cljxcxZwCUn1Vk/BX6xE06ZqqGWI6QKJc59dPTDWtOKttOv0rs4+Ofx+I4EKnzjwaV90EAS1Y3T
	oMWbXP3vkZEz3F+4HkoZ0HkxTf0ST4pJk+rTmTdsJk/2Zkkr6oV7MpD4IvH84TBva8V1NgQaHiL
	y8UbE16rJWAqRWbE3Irpy7XhMJoCYyTh84E5YUl9q8jlBhFRUwDMZGAAlGx7fN+k++hbF1kQfHZ
	SdYCysL4NL27VGr3ONo7NhyNk9tScJ4T/H5COs3LKwudg781Qm5boMlZaMYj1pvlZcx8KqXccb3
	JNCxFXA74RWo=
X-Received: by 2002:a05:701b:2207:b0:136:c443:80e5 with SMTP id
 a92af1059eb24-1876658f6c4mr9237879c88.6.1792447152061; Mon, 19 Oct 2026
 14:59:12 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
In-Reply-To: <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
From: Marco Elver <elver@google.com>
Date: Mon, 19 Oct 2026 23:58:26 +0200
X-Gm-Features: AclHuK_qWUQb64XA37ScTQq_ZMKUMtenjdgDmPfnErmCHixLBqORRUjuSE_XZSQ
Message-ID: <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Gary Guo <gary@garyguo.net>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 17:27, Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Oct 15, 2026 at 3:56 PM BST, Marco Elver wrote:
> > Rust supports ThreadSanitizer instrumentation via LLVM, which is what
> > KCSAN relies on; however, Rust code is not currently instrumented.
> >
> > Pass -Zsanitizer=thread and the same TSan backend options used for C
> > code to rustc. Wire up KCSAN_SANITIZE in scripts/Makefile.lib for parity
> > with C (though rustc currently rejects linking crates with mismatched
> > instrumentation).
> >
> > rustc only accepts -Zsanitizer=thread for targets that declare support
> > for it. Of the targets used by the kernel, this is only possible for the
> > generated x86_64 target specification, so restrict instrumentation of
> > Rust code to x86_64 for now via HAVE_KCSAN_RUSTC. On other architectures
> > Rust code remains uninstrumented as before.
> >
> > All TSan options used are supported by the LLVM versions of the minimum
> > supported rustc, so no rustc-option checks are needed (they would also
> > fail, because x86_64-unknown-none used for option checks does not
> > support -Zsanitizer=thread).
> >
> > Unlike Clang and GCC, an equivalent to -fno-optimize-sibling-calls is
> > omitted for Rust because rustc provides no corresponding option. While
> > disabling tail-call optimizations helps preserve complete stacks traces
> > in reports, it is optional and not required for KCSAN to function.
> >
> > With this enabled we can detect data races in kernel Rust code and
> > between Rust and C code.
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
> > Acked-by: Boqun Feng <boqun@kernel.org>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Acked-by: Gary Guo <gary@garyguo.net>

Thanks!

Which tree should this go through? The Rust tree? Probably too late
for this cycle.

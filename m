Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6021F4176
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895220; cv=pass; b=qSXWu5ozExxR5qI8Vh9miZB4ijDziqQSFp89BJD101N2zKQ8ANdECOmKubJEmm+VUfRfK9Lbg5GHTdqA+0eNdJfwobOv1vaxCjOwOF9ra9Rb3Qjc2Z1016ZV0FV4f9ymHuKPWcCyjSZ57P+GKAk0MKZTD0zo2GDfx9DdltQTYhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895220; c=relaxed/simple;
	bh=2xcKVenmsOkTL/dR7a9UaRkSdDoYvwvb2hQq8wsPR50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mm2pXiFz2Xw178aKLKjx2clFYwzTd7Pwcsj0b5eBM0lvQpKDzW/chBMJglNWKs6xDff4k33sBAd9zfu4SowewjZmvL0UwwDPJCI5iI1CiCKenc7f5r/GjeRvSOElwR0YGhAXt5dUzDOK3Fp+6/q8ZWHKfmIwBkXoe2xkCQinShM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L8DrU4pZ; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L8DrU4pZ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2069357f8f.2
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 05:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895216; cv=none;
        d=google.com; s=arc-20260327;
        b=hz6XHSBHuB4anHdcmXAvCh2Ep0Pe0hQ3kcgXftIvwJ3eACaMCzAImwST1ACsS4m1Qs
         YLZjVrj52kV2MvbpzQNZvRZ9ikAMbDVHkOzHHiayTTsZotCHN9lUkw5hhbzQ3yLg/sWo
         wLE5ct5a2Bpi5/ZKbHLHAboiC+l2Fc2QEPA5I+mNxumn/GXLDlc8aKnElblwMTwgxyms
         opq9Qr1QrRy1bjdYmCILQHQZvAPKQ23Vi7DxDsi67bt+kS+4ky6zaMAQ1gELMRbqteoN
         SUpJBj73ia2sLGTDrxz8lm5X5g6VpYk6yuXHB4lE4padlyNEUU3xlFU+ysd+SfQICsht
         xySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        fh=fXizBo7n1tvR6YnsozB49VicDU+8tssyycDr3Gq3a0o=;
        b=jOgFEHzLaIkIMZ26ziQ+q/x3eaLVPj9a0DcxSPa900OrsqmficyQSQdSA2wOqaDN1p
         bPQvbA7I/T1Nn/FrcQbAg/WMV0zd131rteS1C3QMhjjrB/jyqHi4O6Ao4GlRlj49Ia3X
         xbBhITllehBLg4pehR2Phttqj9R1EXRd2No62o2Z5OUyHkB2x9XYa2NfzO24EIAHu26e
         K4kikPF01t+mILkbuUufAeETrIyYo6F29+lSqRNXqXfumZjEn9sAMd5OCgU5ycNfHQab
         9Yd24q04kp25+wigMut1LHtpqN9J3e6Qg9AoKaF8b5+ZWrz6d87jAatquYatfbYXL7Z1
         gD/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791895216; x=1792500016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        b=L8DrU4pZy6lObZsY3CcCLNFY6pLCfmuKnb5MhJbhxEbXnEtHWeVBDHA/xYQ6FC4TGL
         V5XNDn8fJdNx/uI3DEUeswYU8Kolgk7PP8Jfz5PL9EDloPkBgLKpL2UHOxWv4PmG0LOk
         5T8mw6OC03YMpzP/Bu22TpMc4b8HYLJcJwHEXWKXyGTtTmAvoxlwCfHV/rsgAPAKu5Bj
         WkBrlHdIBl+eclwY7V97giPr9FpbVb0wVkAEJxHwM7JI1YsENcXY0LUXsFKnzKGYbZXy
         INifoEBz8db9sTW33xlVj6OnsCVhVtIyZx3x71VRWhc4Xnfc/3oytpCoro0rd982wx3T
         Nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895216; x=1792500016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        b=dIKOdRF8Xl3AThtw68+YSUTkLiwDdkLDmDowCAp2PZlI+0KT5YwUI2tqoJFJA9J1Fu
         VBe2yhhcKeSsmUXcPp8rqKX7hZAkJxbzSwY0qxO+TnnY9sHgLNj0J2sgsBPD1Rk0dKGP
         Fz0iVHnyUj1icUfHaec1OZtuFnk0PXrXwPdpJSkPFOTwC/JuXQ7yEuPPO1xiDLwOqTHe
         RMoz8KPX9zzUm+PyNgAc8GzIPS3qZ6+bpTtv5MQCeZ6GxEU4iBKCHlEa6DD3NYk76UIw
         6+dWF4L1ausLKzSLp1Ry4BSN2XsdCC7z+CZCBvQOHtkG5i8pkyqp8tIez7WqE28sQZ14
         A1dg==
X-Forwarded-Encrypted: i=1; AKwUvBwuqEiew5rmbBYhHYaE0NxsljSrdNjIOm+QIbg3OLKgY5JOq5M4OJ3UfhsSgz0uyZy/2jMYQSp5dIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKq6BbxJTg5pBsBVoieIKGZ67rOdn8vGdnqiI38AM7XHgw7njv9
	LuwLMAgdyJXFj9mnpk/wbQ3ZwTbCoTvPVeFQbzvfUrz1Vk0CeP1ravx6S+p5M2hZAHu7qchzsKg
	h5VWDAlhRy1AlBWqnhiBYBM8i3oDKafZnBhVKQ5uY
X-Gm-Gg: AYBFou00UiCxCvkYaQJmUrItgNIcDxVDi1KmMDIRFxpBdUz1kdFOImR36z3T596Nj0e
	YtH9YuRCVn0rEyYB9413l4QRD6p9H2dwHxU+1WIqxI/7aE++7A++glFo8UreKtTNrr1Eyd1Vnqg
	ih24otqrEgIGjWy3OLKUlIYgI+JnmNRVR++Bdvz9q0wYD7lfCbAGFRQy4PacN/8FsYcIwSaI996
	+moQTJVcQrU7krmhCx9A0GzGxCqoEUji/2aNFfEACoPaO2W2g/Eldn0Nh2XIusNhnzZiri7HzHe
	0vY+YjwsH766KriBh1RqOfXbRgWV9ZU7dRNYezznDcpddKOHRVW7VEyXlj4IumP/IzaROCUMKmi
	vZKa1CMAHfnbyOVpImlCZCII=
X-Received: by 2002:a05:6000:43c5:20b0:487:27f6:a4df with SMTP id
 ffacd0b85a97d-48dbad3c1e2mr17146863f8f.47.1791895214991; Tue, 13 Oct 2026
 05:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
 <as4DdRqFKxuJNDnS@elver.google.com> <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
In-Reply-To: <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 13 Oct 2026 14:40:01 +0200
X-Gm-Features: AclHuK-baEW0UEHM2ney0XhOi65COv0qWM-kqnIhtWfQmlen933Tf5epqt03if4
Message-ID: <CAH5fLgh=TkPnycdZ8_yQKaVeufN1YUS-MTo3EoMVhZzOdpKwYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Marco Elver <elver@google.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:32=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 13, 2026 at 12:10=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Looks like it, and we need this patch to use system_dfl_wq:
> >
> >
> > From: Marco Elver <elver@google.com>
> > Date: Tue, 13 Oct 2026 10:05:52 +0000
> > Subject: [PATCH] rust: workqueue: add system_dfl()
> >
> > The C kernel deprecated system_unbound_wq in favor of system_dfl_wq
> > (commit 64d8eae3f895 ("workqueue: Add warnings and fallback if
> > system_{unbound}_wq is used")).
> >
> > Add `system_dfl()` to provide a safe wrapper around `system_dfl_wq`.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  rust/kernel/workqueue.rs | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > index 7e253b6f299c..e46d3acf903d 100644
> > --- a/rust/kernel/workqueue.rs
> > +++ b/rust/kernel/workqueue.rs
> > @@ -1063,6 +1063,16 @@ pub fn system_unbound() -> &'static Queue {
> >      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
> >  }
> >
> > +/// Returns the system default work queue (`system_dfl_wq`).
> > +///
> > +/// Workers are not bound to any specific CPU, not concurrency managed=
, and all queued work items
> > +/// are executed immediately as long as `max_active` limit is not reac=
hed and resources are
> > +/// available.
> > +pub fn system_dfl() -> &'static Queue {
> > +    // SAFETY: `system_dfl_wq` is a C global, always available.
> > +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
> > +}
> > +
> >  /// Returns the system freezable work queue (`system_freezable_wq`).
> >  ///
> >  /// It is equivalent to the one returned by [`system`] except that it'=
s freezable.
> > --
> > 2.56.0.385.gd3acb90ef8-goog
>
> This is:
>
>   https://lore.kernel.org/rust-for-linux/20260807165252.3849875-2-dakr@ke=
rnel.org/
>
> i.e. we have had a warning like that in one of our current tests for a
> while, it would be nice to clean it up:
>
>     workqueue: work func
>     _RNvXs8_NtCs5lxGbhOOw2k_6kernel9workqueueINtNtNtB7_4sync3arc3ArcNtNtN=
tNtBH_4lock8spinlock5tests4TestEINtB5_15WorkItemPointerKy0_E3runB7_
>     enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Cc'ing workqueue: Tejun and Lai.

I was actually working on resending that workqueue patch series, but I
think this particular patch should be split out as a separate fix, so
I'll go ahead and do that.

Alice

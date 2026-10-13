Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4EC4E325C
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 11:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890213; cv=pass; b=j76iBlS3WzpDGNliOt0/EdhhQ5kGw+ZaNqdZhiWWHx7RjsUlZBA6X1CP7E/NYtVkTc0fWA5pFl08zeGICjEZiE38uhkRJeKovBO8XySBWzvRxNrqbq971qV+bJugvtdjoOoJRR9+8hzDnHb7VTh0cIqrgH8Ayx6g7yallKlCjQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890213; c=relaxed/simple;
	bh=rc9KLx7EvkpoTqaPj95lDAq+Pysu5EXwOszhQEsLWbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K5z5ghytL2RWsE9lAcVsnCPDskxEU58E7TCdmEyId+dt7hTwQtRRKAKSGGwyjPbJ9ZwijRrkerDUeEuEx6mNSRFBxSjkCpoaTb9OIwVXpU2CN+YPlx4yher/8Rr8YOBgB4Z/1Zrd8eCU6M4C3As6wMXTGv2q4stHXSrdDJXN1CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A3ZlYpbr; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A3ZlYpbr"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so1599711c88.1
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 04:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791890210; cv=none;
        d=google.com; s=arc-20260327;
        b=iq/MoDIPLSxNFqQTZOx+ciC5B99gDUH+8t7S00iNel7bkHoibsUMS6eU86HHsk0hZO
         CWwEviKg7OorEO8yBx0OfdHq5AI8pURlXjZbn7LE1FF1hOUhI3ZcYgRjhCJEWm+cbTrl
         dx5ZyhSGhuO73YSEMtju2UpvXeJgpdh6VLtoYBTZEJ+CHqz/9XHHQgt7Tj6d8Fgkzee7
         k+5uyuX7LXpAwfxtz8s2OwDiEtjuMkVoMAtOy2/gpjZIzTaYfBCnIL8jG1/j/ZuNG5iI
         MkGCeGPjO+XSOO3RLp+TLO9PD1/obFTGJ+f6J5rmGpykMt2X+7VXikBp/P/MHzFhx+aP
         yhUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Pk1PNEkQwFyLoSgGMUVJrjEgd7crJB7H/ePjfgBSkQ=;
        fh=btUOqfFyJJsYkKCLTjxc6ScOhBZQTQ1zqGKnD2S4ND8=;
        b=JOeJAQRUjOs0+OSNdB6A5kC8u0cmUFLHMYyfcctMZNOd9xlScqtRqvjvT9Y+uJfk1P
         QkDIHl3Fg3miX2fSVQOAaHaXVJP/kEas2vag1ze/KKcp/K04jP2bnYJWR/ukeO4B1ttP
         TIUewUqwWJkSX7lhfotM61MeDDdnbumaykJ839WNsvMkHJrzpY+YqMK2w21aWNYnJCwr
         slO/yLsAjyCipGeKcIbErfyduRSSZ8jFBQ45TTTbHBiGaVIo/195mGayjtdjjiWduk4f
         lNblskhOAHBeNBXnks7Vw2IpqIw6vHiERY4kU2x7OgzlAP+eqZAFLOz8NT23q1BXvx7j
         vkvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791890210; x=1792495010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Pk1PNEkQwFyLoSgGMUVJrjEgd7crJB7H/ePjfgBSkQ=;
        b=A3ZlYpbrCMhPs5+cCvMHyG4Dt/GJNOSkar8RTlB/eYtos4nF2wpMS1UCuqjKTnHVJj
         zeJRM+sfSBzkl1cA8brd97RyiXeyHGY1pUI8wMNAG0JH+N9fSkcoG7bF9kGGq221BP4t
         Hkiq5QoArAlinOIdSCY8ND9zOYpvpuhmfcNq98ge/eIfBt0nH87mTlEPsBYjQ/xCrloU
         vCeSLYikfo7Z00MdQtd1JUW+6P4GQb/R+ZI9FSmmXowwHldsG0WbOgvyEYUpM95bJRGn
         WwD8Z/7C+bEeOvnAuP7YwIoX5GH7G2prBYapdc4slS5neEVGihIvYBlbK6Y4yqroW0Of
         poAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890210; x=1792495010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Pk1PNEkQwFyLoSgGMUVJrjEgd7crJB7H/ePjfgBSkQ=;
        b=DZlw3ZT33VTN5io3CjyNXAXeb3dtUld0mLadp70EcUksZP+R70mr7i4Mkb2vqaNHSL
         yMXWjPDWvoccNA9SvI9D8/VPZfAg9rAar9gJCoTd3SnsV/tgMTCPE5w6aouA5+zMjiHf
         hac+8OBgSLs0S+KHQqQJI1/jAx4KvomLn/qa+pXKIHp6gR0/yqnGQf3HGCebzLHRpM1/
         AHc6hLgkOcskfseZ2usUxOfE5mouGWHFAg30pG1713I+p19/6JlZKynKGEnfBgAauO7y
         V4aeQ+LwfwAnmvgXug7kTuAHh6UCpX33LPR+97K30TG9d7VmwcerRZN82xzqToFE9gpU
         k6vQ==
X-Forwarded-Encrypted: i=1; AKwUvByQsYhOfnZ2dWtfe4AjTTbNB4/CpoOflg3GBv/8jJc/5MXO56VX0JqBk60u3J0xu4fV1m9q4JJv2x0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxXNEcITN00co/zMbpWwBpZaKCeg1tWeXoqkIVRhlHmPvR6KB8
	z6a7jBi39QNp8ydfcDGOII8AG3lluiyfHDq3rHdszRkJWF+RWdN6osS9tDvD7gJh9dkWE+YOmbP
	GT1fvUo1vMzGgeTMG7ibxD85TqlvddY2nm5RgXMQP
X-Gm-Gg: AYBFou0brv3wN4K8Pye75py2waLNSBjtMPXcfx1m7c9H3QLchOWVqGzLchDlIQ0C/Mj
	t5Q7nJYYzunFydUyD8b/gzPBfdD/hs8BzD4OFUWbm6EI6vGziCtqwU9v6J3KwjlhBJ0EsyOvLPL
	k/u6CNo9YoQfUOBDQUR65koIsXcEsDIUxrBBw9hgcPatKXM2kAQEFlY6cxmJhOpi+n83l4IoPNv
	AnQjA7c+ri0RvR8YfnlfN+AirVjmuNR2hf3TQLLyhTImLj00Yy8vrsQcP8uWerWFk7mc2yRlInS
	F6Un2i3iU0ZCXHs+5168X8Ib8gzu/QGzFoPXA06BvH2qn3EUi+5DJnCLt+K7l/dzKTRNy4AzwWy
	Mdn59d+8jwQ==
X-Received: by 2002:a05:7022:f50a:b0:17c:393d:a0c8 with SMTP id
 a92af1059eb24-17c393da495mr248774c88.5.1791890209700; Tue, 13 Oct 2026
 04:16:49 -0700 (PDT)
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
From: Marco Elver <elver@google.com>
Date: Tue, 13 Oct 2026 13:16:12 +0200
X-Gm-Features: AclHuK_P6PU5CrwSXdVV6i-xG77HwukstjFkP0Kjvw_NwxgzqD24Q_xKBYjksY0
Message-ID: <CANpmjNNu6VEXtr5zUWAiAP4rPiM9jgE-1ai91+Fpxg2ABeKYFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com, 
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

On Tue, 13 Oct 2026 at 12:32, Miguel Ojeda
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

But I take it that the series above is not yet merged?

So I'll keep the previous interface for my test to avoid introducing
conflicting patches.

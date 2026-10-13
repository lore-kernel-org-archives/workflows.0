Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9FB408617
	for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887542; cv=pass; b=tzbt8aK4qA/DPQYi4r61di7gceFR0snze+erfX/KKXFUl2tvAQCtKrgnzKCKfCcDb0Sn7KEsOrtL3851ENv0BuOLqZwqDNFf3ZIMLxe5+WTtznpm8sbX1TRs6cB0b6o0rY+cafm6Z9jFclIxCv0yYssyPECB2XBS+QvdNGkiCnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887542; c=relaxed/simple;
	bh=IAfkKA0U+QL1NU6vVqFogpbTbIovJwScmPrSbAdsIoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJg3SIxrhuPYD6FsPKUao4wFoNlBFgeyjzFklK+NJt0I0ubSZ6Pt6pCblpPzD0I3k8fj5I5iBP548S1NJ+1k+bmxufw66AcCXU2PdHP4Mr0I19Q4fBrwQ86jL7bncQE2EhpJAGNOSA9vA8JbMzxIYkG95bKEk7ovTmZErB37Cao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/tLEpBd; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/tLEpBd"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3584f70a5aaso331468eec.1
        for <workflows@vger.kernel.org>; Tue, 13 Oct 2026 03:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887540; cv=none;
        d=google.com; s=arc-20260327;
        b=Qnq/gZFz64T9VwNGC5pAwN0cGpYWUgvi5Qy9iwLIuM9Xx8BMb3IUyjntwAS8nYhAsw
         F/L0Y1BKayg4NajPlctgUWX8st+Q0mcBQIWI/bhwXtU/pBvBGFenwnTix+apF8smeT48
         N19HIooMG0FWxvumBmBrVvdwFD/ra5CmPb1ZfI7smSye4XwRmKQedWkGL+kfhpatYzVA
         hgldzfJz7OgnvLOnsyt5GWc1xkJgPrD+W5P6ugjvyJcxojI81ZVpoXJYqXxotZCX9kUo
         t9xvtdGJag+/a0Nq6QLBHUb4O7DFaLxZyexWYldHay9Oc9S3rHJACeohxJX7TDyGjv3S
         fX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SYwDmHP5gC698Sj67HNGApHy2r5CrxT42QNJMV7RL6o=;
        fh=zp0f3L3zx+cGln2x7x5/t6+P7N/6cd5lcJPOtKZy5l4=;
        b=mYoco0Q3qJoSvvpzh2wE79KbaPjRvVwjX/pbv+GTL8Cr82HX4QJ8+1XfC98nZcchoY
         KmSJWGYOrQO8OrINAIRvbXg5oJ1FKONCVuOobmSCLdc0NGzg/45yC0AdiyaBmcV97jwT
         WZZImlMfMZ+ryaerLLImZD1YV/vsWIXvNALDoCMQY9jgr8yFi9lDt6dRk3itDyub2ULZ
         wIt0/iWFpMUSoKM+Svi9K8WxPuDkOJFGGNVch/qyA5uLQlCa7uJWCXBEC9lLeFr8wJPt
         b9TcoGtvQlPdKa0wC17r5rSZxBhGHT3phEZ+rDmaURiyVm/W0szVYlVOUYu+M4rZRy2y
         3PWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887540; x=1792492340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SYwDmHP5gC698Sj67HNGApHy2r5CrxT42QNJMV7RL6o=;
        b=Y/tLEpBdP24lKTF7jvb/dKv6TxqZVNFs2Pj2CuqXfO5HRD5Aw3vsmFxQcyBhBQqIYR
         6VD893zgvpKQyC6jITbu+iO/lTmW2wNinSIm3iwrbo9Bzh+Jy7pf8SLCtAkmC8UO/2rj
         1WfajpWd1PMk08oyfSh/2BRM1CLPz9VY8hyxJi+v/GzeH1q4XQ81JbnU4WwZwMMC8IvA
         s5799Wvbj8ILnxG54laGxLd7PtbjP+1QgTjRr1yMdxJAVLbyKa9Lp95VhByaHTuAZSOV
         pYSN3xFzmqHDUpvJx4c84viFlMPH8qAK71b7LVrKoNeyNqe03FpwDiPelUrxVEvFuBRQ
         jG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887540; x=1792492340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYwDmHP5gC698Sj67HNGApHy2r5CrxT42QNJMV7RL6o=;
        b=sbzPR6DNDo9xV3M+D3Sbd/kRyJ1QE9vRTOg3TACnLWaw9CLKhY1UR+pzkKDocyrWJ9
         WwpP+hbS4nUjLYM3QLw2Z/2p5p2uhPfzHtdhYA9BL5Uqz4AWacitDpR0kYi8I8HlDjPx
         FeZuQ9gqCpzTa0mRPJd5hJ4ElIjGOizSc3FsNXMBkumvs4uQ7L1vMJ3kb3IrMzYjp8br
         xj3QxrK6ifuoZ47N0ZPk+B7AV9Bs0a9HwK/EA97X7Gsgta5qM7s2zoks9NFa0fehhgoR
         VenC/JX02ij3fNG0kkAUiLvL5cRzR2tsqq6bh2I0h1JGxL+eVeD5J8ybzpalBrn7dlWA
         CheQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyLQUSGnr1w2aWTjRkR0Ox+xdTW1BEZxq3fMNv0JuFB+vbJEAPaHrW29yayu27q4i2MtuOBiHbNwM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdp+2uvvVhzjjSbnbGekPwKuhfGqi285MLUBOaKgNk3wc/RIWJ
	uAu6FXUE75TqaypQ+rAiDT3fBB3evO2vai/uYrIPSDdQOxwQ/FuBBNyP0CkBwVg5Ku/X2g5lQcx
	Jd3rwUvLmKdzvY7Py2yKacvVluiz1X4M=
X-Gm-Gg: AYBFou2PX59whVBjXpHeqUVxoM9U4ZtidzH56sfZQiWrmN3waGW+FoiDYs4oBQV8cM2
	YQpOlvkSR/rAv+buwx/LDw6TAIv26a2esK2l6r2wbB7uQt2rUZH4ylIInVRnvQu/zGJ+HftRCOI
	3DSrcAEILt55MOjR8TSWX84ezYTBBv19WaqCYuOf+qTtAJgkAYwntoIu6QGBXmomDrpYU7ztptq
	o27rtbjs9VlZEmCiLalMnTI9a7JKl+tvmkqQzqJCtolpVSVs1+6xI7AQMGSUwkYFU4tPmnLlPJq
	reJ1B+txD6iBYVDa8X4PaLVXribQChOjOWiqKaFXEIX1SM1srN/Z4J3o57ZAPio0S2T88u/EgEb
	ryjGOLeEnuJdu6whFRPs3I7Ks85NNi0KpvsgEoOWV/7+LSB/9J5xKeLP0C/ZxvDNIhnuv0fnWP2
	PfdZmpngrU2KN/gVK+j1lHxJvk6b5bTWi13FV523e2bmvkkX1WLQYerH2jM+AiCQ==
X-Received: by 2002:a05:7300:c8c5:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3537dc89f58mr25702764eec.0.1791887539654; Tue, 13 Oct 2026
 03:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com> <as4DdRqFKxuJNDnS@elver.google.com>
In-Reply-To: <as4DdRqFKxuJNDnS@elver.google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 12:32:07 +0200
X-Gm-Features: AclHuK-e9pojF-4-sUhcctzSu2Lj9dg88Qjibnm7E2u4bDLqEx7YvHBlJNvxTnE
Message-ID: <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
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

On Tue, Oct 13, 2026 at 12:10=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Looks like it, and we need this patch to use system_dfl_wq:
>
>
> From: Marco Elver <elver@google.com>
> Date: Tue, 13 Oct 2026 10:05:52 +0000
> Subject: [PATCH] rust: workqueue: add system_dfl()
>
> The C kernel deprecated system_unbound_wq in favor of system_dfl_wq
> (commit 64d8eae3f895 ("workqueue: Add warnings and fallback if
> system_{unbound}_wq is used")).
>
> Add `system_dfl()` to provide a safe wrapper around `system_dfl_wq`.
>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  rust/kernel/workqueue.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 7e253b6f299c..e46d3acf903d 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -1063,6 +1063,16 @@ pub fn system_unbound() -> &'static Queue {
>      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
>  }
>
> +/// Returns the system default work queue (`system_dfl_wq`).
> +///
> +/// Workers are not bound to any specific CPU, not concurrency managed, =
and all queued work items
> +/// are executed immediately as long as `max_active` limit is not reache=
d and resources are
> +/// available.
> +pub fn system_dfl() -> &'static Queue {
> +    // SAFETY: `system_dfl_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
> +}
> +
>  /// Returns the system freezable work queue (`system_freezable_wq`).
>  ///
>  /// It is equivalent to the one returned by [`system`] except that it's =
freezable.
> --
> 2.56.0.385.gd3acb90ef8-goog

This is:

  https://lore.kernel.org/rust-for-linux/20260807165252.3849875-2-dakr@kern=
el.org/

i.e. we have had a warning like that in one of our current tests for a
while, it would be nice to clean it up:

    workqueue: work func
    _RNvXs8_NtCs5lxGbhOOw2k_6kernel9workqueueINtNtNtB7_4sync3arc3ArcNtNtNtN=
tBH_4lock8spinlock5tests4TestEINtB5_15WorkItemPointerKy0_E3runB7_
    enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.

Cc'ing workqueue: Tejun and Lai.

Cheers,
Miguel

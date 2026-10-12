Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B78249504C
	for <workflows@vger.kernel.org>; Mon, 12 Oct 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817455; cv=pass; b=Dsq9K0vio79AnliYdv4mCOmEPGtPdy4L04H8nu3rLgkb+FiinWwplM3Lwucnga/1mPxU64MlNl2wqDGgRi+JsCFwHuktxtv+NHMrnHrf9StiZVHCtGJaAEH1MVNXTFloxOPVCVTrVCTLB/brDi5bbS/zaC+EHY187UO7UzNnH9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817455; c=relaxed/simple;
	bh=ct2YHHtAR1NATrFfSOMu/0HJEb3d5oH3R82Bkhe1BMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrJO2JywRsBTv+wutKXF4IcS4PlkBfT1YiF5CDWe/nzESSb7voK4bo1W013mmd6Oj9JdAIAcWuMkAP7EYRomK6vdnbRnnbg5KOxqSS+bmPTBPywzxO3CP2GU8dhG0hLWdJqXPPwDj3bhWCq5RRK6yiahLZ3npHKA1d/jsfNlkW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HKw0COGX; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HKw0COGX"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-141395927feso3522122c88.0
        for <workflows@vger.kernel.org>; Mon, 12 Oct 2026 08:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791817452; cv=none;
        d=google.com; s=arc-20260327;
        b=BZl58Mx04Tt8D1d7Ldv4NCt1sz5pxR5FKfH2xCx7/vML+ZHw1UaKrtw9SsxK032i6u
         D1Aorl8GcEQjE0kOs4X9RgXrawoGlVyCURW9n1DjBitVX0j3kSsnAkEpKYXLvJZ/Zpd6
         0RWVBWEruYsUtBmNKMaqJ2/miNZfl4w77VgXrdztnq5AJDHRRFBcL1u/yac97WFQMuJo
         5+4651EjQvstKQYd9VPC54Ih4by2/ZAX/sr+t69W52iyB1uKe7yfFvT/1NoRVfLanDEM
         g8Z7cPkUPRGS6nWGJ2HfGwLizXQsgwIxngiHLo5NkDw5zsfi4ru0nEVcVnm/+iE2Mx0z
         A+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        fh=KU1BWE9eUD6EOsHs73zVKGpb+8PGGAPNAOpqqNTYq5o=;
        b=ZDE04QkZnkXdlBkMag7Allcwuf7H0s1Vwko4n5LHjT1qLpJjnd4nXn0OYJyQx9Ynyu
         FbX+a+OYo9zlxCi4yMK10AndYdrUG7Y6LphoF29HgimrjNzIL+tW2lkk7GDywh5ZbCcw
         +Gc/X1BET1h9eqBU2PkcHcA1WZv/DNU0AqWG59MX+ZJl34tW0AORbKYvxE5v2M1zvTGa
         IPZdBuK3gNaDHEhhx1bm3KBR6N/RjOccKoPo4fsTf2Bubg30i0/qRcJcz+b8AUUFaWuE
         UEm9mf299QOz4di5mU1//USBAR/e/TfO9FIltklciVs8G+0IgQuegPw12XQ9lzPyGtrJ
         dUxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791817452; x=1792422252; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        b=HKw0COGX9Ot2fd1g2rSqSxW9WorjwKzFbnZBPRmuYheEoiNNqEeriMmw16r4lieTfb
         Sal9x/w7lL7N+4n1RjZM4lfzI1mTypDafCvVTrmlz9u5fztU64oxznlBDZk9t9H6+NPa
         jjDWxMeqWrT9i3wksytlwMPNdzo25VCkqTHq2xFzBLeHthnCG4jY0M2+rtTvCiK9T/KQ
         17+OOu4pmHQZa4qCYCiEwlFCQH5Oz5mdAOCUdi5RuvuQTigFNKygGiDIh3QMpyULNw3N
         JeKmUAOjn6qiEL+8h6CXLKoRJXjzdp3mqCzhPYnsSF4BcacUqlOUuftE31fqu+/WUOKT
         N3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817452; x=1792422252;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        b=pCieihj/CNJ79trMV6mqES8GKZWcb6w64cVQYsRn3kjan0kexiGhrODcjh9gG5mg0Z
         p/gzN5x9t/xE9o+Y0AffbTw31e1peYSEkWK7WjWYcGKLvFb0V9RcyGTuSa19afZgdbh9
         h+BKp2JvlbCtI0P3HrYGukpN7U78FMy/pFLJmcpNMMCd/hspTDNBn4cdMGBJOq5wpQF6
         EK5+pD/YT+hBhIZ2U1l7BA0AGNntz/LbfbcHtLE2F2ss+/bIJuIATbsKr6kGZFfzrFvT
         CN4+gtpdZAL3WWbQxdu/y4QCpraJqxC2Qclf2XffB0BV79Tx5O6/2e7vEqrM3znHYVlP
         Zohw==
X-Forwarded-Encrypted: i=1; AKwUvBw3RkaPZnW4urTkezstaJq/g924IoaPIzlwxAaqd2miONIJw/Ko/EeyqrYbd0V6pXY4HKx2owsAq/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxg14/dO6fUX42/38h+U2yTuQj8+ACIj48d60NzXYG4eNRU1mp
	ZIEATS0GfiAw1bqLlNDj3R25HczcDvtWtECWDG2Kk68lxi09XGvV+wYBYVSZI4HT+LuEagBhNeX
	NDCjJ6doPO6ZF+BNJN4MYjsE6n8hxcvKbWuXKxz3y
X-Gm-Gg: AYBFou0vRGC30vKH6OskTvloBCdUofExyOQ/98ajoRdoCkZXNgz0xbc6/8CgU5qIPMh
	GpEokqZRxmKlRHI6GPX9xfMeEx4DNofXbSLMJ11BLsaKQKiuVdaPir6tl/XLh6nJ0PMGv5Y5XAB
	Fq9p++7ROSo1Scnj5HbscnIpyf0GSHOFSmqKgS21WkeDZh58ReIyrkRNqn839BBHpdUSb5UkDQA
	b0t5cnhl4iVdjvdzULcrBrjar4tGbsAoQ4alwIeIEDmVfgvniXgM3ruB077MFYy5G+OLkHTg6cc
	PEREzbhrK79B7+WcXEhTRvb0bQdCblLocSM4081UPGipqtaUdppVxwfEL0o+BohOJlsci6dQT4T
	YoqmYfDJ2AA==
X-Received: by 2002:a05:7022:3f0c:b0:168:3243:c91a with SMTP id
 a92af1059eb24-16a5dbfde08mr14809417c88.13.1791817451365; Mon, 12 Oct 2026
 08:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
In-Reply-To: <20261012134159.912183-2-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 12 Oct 2026 17:03:34 +0200
X-Gm-Features: AclHuK88gg1MNQf0tKC3CQVs4jdrfXCck0NjLOHXH7T1xUhHlrbtWu0XiGM6pmY
Message-ID: <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
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

>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/Kconfig.test        |  11 +++
>  rust/kernel/kcsan_test.rs       | 120 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  5 files changed, 135 insertions(+)
>  create mode 100644 rust/kernel/kcsan_test.rs

FWIW `make rustfmtcheck` fails for me on kcsan_test.rs

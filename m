Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5377449B1EF
	for <workflows@vger.kernel.org>; Mon, 12 Oct 2026 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818166; cv=pass; b=ShJ3DDeGnGzwyt2YfcxXsO2sFuQV48Tr6hau4cJ9id4z12hyHZIiosHk2NnXHZD0K3O7/JhnYiadfO/cfua5A+pyrx6G5MV3xsWMlaRci09+baaEfADGHUN7suytPIA0P5xVON1u7dF/wlF2047JVTzhmzrL3YyGGO+Jvggq1lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818166; c=relaxed/simple;
	bh=Qh8/jPpdQb1uoYLtiV+P2F0fMSrInIfSg+J+6byfOcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtRrmp0eHWMlVavxrdDJQHo7LAulLLhXF8ioIc6dGaETyNllSzG9WLjJX2lMRI8Mt13FKvoXc+JQ4s0AFRKvDb6RbXEEPR9Dg0hzTXy6RDYXDjFI6t7eKMhPqpt751L1mdcUponVi+D2jxU/ITZPSdfmBJwK/lxcGkp3UV/90pI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H0BgTGEn; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H0BgTGEn"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ad98c3fb15so13615867b3.2
        for <workflows@vger.kernel.org>; Mon, 12 Oct 2026 08:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818164; cv=none;
        d=google.com; s=arc-20260327;
        b=AzYknHQEUjs3TuwrW0E1chgKvhgIHfwhQyM/8VyxCyqAwYpwXHEWsuxlywztLx90Ju
         3FV692ZkWYcr3yJmXwapCNai5/3tZnazRjDWmULrQm+5gzo0CoQCowuu0E2s+Dula1dw
         8Xg+c5YMmjey8529S2qpLxrLxiW5wJl2JzkgrT8e68BlYs0bnB2EUoQPZW4VseypV5qX
         sRpTXf4VAGKAGorxRrnDWUl8xsLr8o+muNqoYGQtnaH78HgGXnWTtcg7f7E+F1KV5dkp
         zabetiRxvimZ4tFPKR8d50+fPXrQV1Je5G0GHUMNXysq8HGUpcVNY5YB71lHBKKyIdl5
         HKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        fh=KB1pd6KUGqG5QxvIXzYmtLqWi0r0/pxmj8t/+z8Q3hM=;
        b=g0wicPHP0dJHv28hE0S0i6ov/lmgoy1DbeyU34qt/KV4MZEeLJAcnCguo38y0q8mvJ
         dYQpmw6NyrOWF1MC0f3+Hcn2lxOO7UJhw5kJ2/P2SqVRiKNxpd35pSJ5RGF7RfomTxE6
         VhwhOVC40IYAxqJ4sN/nHC3IC+wOxshN/LgU8nNVIAnlim+SGTizkXVhA8DF2NIinhCN
         njE57DovTniqfXTdbt7wnqmxDV1/hl1oglTq8oKiMlPEucEBHrnRD3F3evL4lE/SpGlA
         NWyY8zNBLaxM1AIBDyPDmPHxUiCkeKlk2WnGxsuwrByc7OkWSeyKykmiNzWb8gIyk1OJ
         nAhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791818164; x=1792422964; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        b=H0BgTGEnjHPsOpry8zM372M3cPbee1W5JIY+k1KGqv8WNzGyYlMWruUcNGXNpqKqHv
         qAht/Fg1XEZo8JjFRoEHFhUiRD8Q5cYqy8MKiZYc5LQtEbtjmhvyhG/D2J4elSaSnKUV
         ZM8MXqxhRXUvbFnlIr9rEEaR8zAMYY5wS09xL9mUt1dlIaceViENwfpBgQUtW3eVOGlU
         pDKwvkrYloE/6nhq3HRdIEjN85hfMhGmgpxKiemxr8Ipgmoo4uHaSrLyQls+oGGVrOtN
         wPBentZQM0axYBEPhSU6pemvJTTbrMwGD/WXXj/XHgW/LcIPOfUMxG79B8fdKd97k9XK
         U3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818164; x=1792422964;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        b=en8cAvWYwa1v/8NRSJ1Y9W86Sp5QT0vKte6uaVTzBPEmgkKkks9dndr2nsVQonarJW
         sbimKCHp9ZyvMEISDpPypXgO0PNv3F/Y5NZkKFgboJDXp1s3Tmgl/I4e680s3w+gZnHS
         KAdfxTXwhYNgvej1/SEXSwPvmYuAMwmC2uJpMoQbxMOzyrNjKuz9JngZhmNcl839Tjqp
         GPr5ICU4J3fxnP6iQ7bMAK4o2JtWyiyMFy2sa/bfmXCXSVwazdg5tRdge7c1J7yRRFdF
         HzDJxOXcjS7Om4xaf2nqPX7qbGmZTyr0xadrdvUYR9v050RM7CWbmexKaaoPq2XPsJ6H
         QVLw==
X-Forwarded-Encrypted: i=1; AKwUvBy45Y0BnAG7Nj1fgEzt7+GaBbTc/ULoJBFO7qrn5ZoFK9iKvdYXNhqOPwiQPArVmRaPHQntzjIcepM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8hlUUNBeoT4H3gsrexP6D9T19SR55YTl+6LsOfd/WeWp83vpe
	AXssAxKIwNWz4HQ59p+6tjsKqlrjamInoJfF9unBJhjQyn6G26DoJ32iHUXotR1YPk0SjsjS7ig
	i2NKy6IcxywBckBr8xozgb750Mw1Ao/KCCKX8sjkQ
X-Gm-Gg: AYBFou29fkfPjRI4PsDcixz1OTxMvAp94Vp2LYpWeBEvHYv7P9RxsIxS/xsEUlStQV5
	Oc14zV+dRiemZescPA/xXA4y/eNCCVxGnRMTdMaGQjXX+HGGmfWtmHPP85ggPCDvkWh9MUEbbSR
	F3fG/E1kInFGZrccUfOAvemQMZyA3AZWEwpwF8/GtQJO6xdFmMFthyukwicSN237LFXNsIzBXey
	qTC3Po6Rrd29/eF8t+3cmtqSAYYmsR1KH0OWWUEUyeB9zPlzZ0oIqsMQq36sQG1GnNzO9PwOoem
	uWTe/CfVFwzVF5/Qfi6LtCEwozjKLY0QU7gUqTH09ULcs7SCmFl4S172ulSKMg0ZXlToX1oli9c
	6ibe76ZpCKMuBFcDt2Nbg
X-Received: by 2002:a05:690c:f04:b0:8ae:b617:713d with SMTP id
 00721157ae682-8b07edfaf6amr35969547b3.19.1791818163556; Mon, 12 Oct 2026
 08:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
In-Reply-To: <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 12 Oct 2026 17:15:25 +0200
X-Gm-Features: AclHuK-ngdayfpaG9DdBIWGDrVoRKwhiuwWtMtaRRkzMdsYW60BnSKb-GUjELAE
Message-ID: <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
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

On Mon, 12 Oct 2026 at 17:04, Alexander Potapenko <glider@google.com> wrote:
>
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/kernel/Kconfig.test        |  11 +++
> >  rust/kernel/kcsan_test.rs       | 120 ++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs              |   2 +
> >  5 files changed, 135 insertions(+)
> >  create mode 100644 rust/kernel/kcsan_test.rs
>
> FWIW `make rustfmtcheck` fails for me on kcsan_test.rs

Oops. I guess we'll make a v2.

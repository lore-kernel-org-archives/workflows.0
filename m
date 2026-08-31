Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C132549DB8A
	for <workflows@vger.kernel.org>; Mon, 31 Aug 2026 16:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193983; cv=pass; b=a5ygvhsTMMaLyHYfSCN0m5c3E7NaB2CTVCJMSZI1c5CnVQF8eBBGA3E8rU4EZLaXZNJVyBec7aKHbHj2DlodixU4RTSgsHlBaThDmmlUQx518XO+I4xcPpUUl6csd4tnGvtHCLLMfsnn/GEupq0lgZ17t8xgorPLCk29OxP8mtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193983; c=relaxed/simple;
	bh=WAb2HioeKt8yQ4+e2mWpoQ1jc7oIFNQVMnrcZ1VNVk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/CAcnW9ceMApQDT2W3nBAdbr2c/zpiia6q74hO/VUBRRMLNts97W1e4u6LOVDVmH+bTmxfxUdE0fvCFdUNSOOHGx/NMvv8VZGgJP0ZKXoslVI246jhI/ZioYbW+F/FzTrz4s1A5WELxwVT558+kduyvpPCcyVreQQpXDQ+gI9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=refBrwGZ; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="refBrwGZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d900ac39ffso1984895ad.1
        for <workflows@vger.kernel.org>; Mon, 31 Aug 2026 09:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788193981; cv=none;
        d=google.com; s=arc-20260327;
        b=K8AxdKUwxdbeyLA8t2M8jodfcqjKBw9GYyax0V1PdBP5ieC7QOxL2ravivQpYux9Hr
         NHkrgzLtLKusFN2ZQ0n/wGvKwWE7mdlNkgAhSMRDUsPlZQuof1mVW+lbgYl8zyu1bcAD
         Ceosd0tXJcHbv1tm0Fz88k6pW8E/E17qKHUIikNjALJs3exERtS5LUm2nXadQCRK0Dnu
         G6xFFL1l1WmElRWRdtr1E6KQ42cdoHtFwKYJUMZPc9KAM6lANmd0exVsoqrDRRgVCrNZ
         2YIiXmg5kSRb9reJ7H6u7CtuRRrpaIbZ9BO5pFC6r3bXowmN3IPTesNvmV2XH8P3VQxB
         H6Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        fh=A57g/e0iYC4t4GbNQYk2PHPtX/01ikvKDOqGdsbjFKw=;
        b=QRc6mJsEhAfGkmfwVGtdlbt18sjJQSglIA5n6sFAemnRAPPbu7mrONJvuFRpOXHizi
         t7piqNIpEsg+8/aG6DQoDEtJaJgfLKnPmbprH4PpxcHthHTvW5j4KIFbmp62j9A/M8gd
         BJjrZkA8UfQZE/NHCmVl+1O8kiQW/8rcjm+6mDs4IKk8SQOgkVxjcn7+i1/jWjy2FOEm
         h/cFgdsKrLWj17moRWMD+eI7VT50Yb60d0IMydgpzOx2Wk69HLSDZIkDpSeWkxBGaOmb
         //sdqQCKDbmScUmNqTY89jGmk9lrEdz76pbUDl7MS9ePsAsuxi/kCB0xPPNGYEP0YWth
         SRCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788193981; x=1788798781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        b=refBrwGZujpvTpihy/NZH9EfEJJVQmjGZhkmcPyHkrJnQJ4uxgMRAQ9qdfAmyXc03L
         LstKISwlWnno/B83pwbIRnUCpigRdbTki/T8o4RL0DdE1mBNwkYNrwXIWkrQZ+S9+hCB
         UNdkFis7VHdX0p4bOSIFoIhPK0E8qrTrv30nvRPTzN1A4fJSUlvLDQzUWVojRbyj4oV1
         Mste31TatK15L0BlxNuCEGPhA8sNxxbmaTrjPTdJBAMEKpm1ncqMeMjRg8oCVYtHZrC6
         qGn/Zx3v/TECkieM3oZCrNErFrlwDqzajUw7EmZPLT4TMWHiJYlTF69pnx9q6XmOqawM
         Zn2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193981; x=1788798781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        b=H/hyDIWtjPiieQeI6ghIC0+eNAHukxk0r0cV1lkkjp4+ilAZpdYOS+IVNn0w4gIIU6
         jAzTbcCYxRze12u+AqC8Ho54PRdkY/KfvOgsVKO1CTDrT83i9xexq6B+aiqMB+8ZZiLz
         ov9FR1oj0y/3rYrhDNUbSWtYVZ3pvlhuXYdfquyHMZRa7/0NxjQq8Rl2pMCPHVKnylOY
         ymBUoSD5T0eTTp4pPDysJHrM3TWajB6C5uBvout8eeszi8T4wmXphlrqVX6ZO6hmC2Vw
         8eIypKUzRo/bQjYo/q+v0NMFUVUpd4eBYIXCO4g3j3oM4i1AH0HWlS8e50X3g8uw7Lc5
         aNkw==
X-Forwarded-Encrypted: i=1; AKwUvBzgUaJeQ4d/8xiPa9TM9FPj7uJkH2ZPRa+fjENPiXuD19+nbSG4kia62cpkxesLk9YnWPk4bMy2ZDs=@vger.kernel.org
X-Gm-Message-State: AFuF++mFR7dKbAAKD0eQ4+qUNGqv2SZwGEgkQK7n8z2/9/rqsdmCTQGY
	FN9B450qJYaPxWJKSHHjMKMCtO0/eqvXPfX+Idrbzu+ECZzE9DmTC+UgNyWf/v4GLS+TcS5a2PN
	fx5guqHfNDLUdnOFHSc6CJdm/1ZMovwo=
X-Gm-Gg: AYBFou0P7068/6vS7Qj5yTwVWHFzXZJEJRqo3I5rkjh2qQ21EmuUBWkGo+nsBcHl6rt
	O54IYYlD0uUegdoUbLgWJFz/AudCicOY4wPwjMZU4Czh2Rt3EcgcSinjJZ8k84o2D2Quiu2DhOK
	YzUTvLVO1h0s8ql0y9P52bDIcs9U5Eljs81WZBYdKsDKD7HYJLq1b/vi0dAlGUW96ebQee0OhiA
	lBBqCIUE/WCchSAZnTynWtsHnAUzVyAhM0qgnvp1olTKmKAqnlXzNqB6nS8LAXFa14fdwG4B3Ej
	Nv0bc9PBQDORwYPxf9H+io3eJ55Xb6FYOLl701XHKGIaqJ+mrXR6hXyfE7gma026chwMH6WnlQb
	WzdQeYOZ9X7WQ8lBCP/3WUZbdCX0gZChNSXQLsb8CmUUd4YkPQSuIeStAvbgK
X-Received: by 2002:a17:902:c94e:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d74ce5e476mr224272585ad.0.1788193980913; Mon, 31 Aug 2026
 09:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831151605.638172-2-manuelebnerli@mailbox.org> <20260831152523.638881-1-manuelebnerli@mailbox.org>
In-Reply-To: <20260831152523.638881-1-manuelebnerli@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Aug 2026 18:32:46 +0200
X-Gm-Features: AcwNN1WxT2qUEpoESa1nnOxcvqd-4guXTylAIIzIEvrVEhydUWRkwim0NkJ623s
Message-ID: <CANiq72=TYcLdj0t2DbboS31L4BNrSg-0bRmHZe4SDnbRLeoy9g@mail.gmail.com>
Subject: Re: [PATCH] v2 Docs: changes.rst: introduce optional column
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Guillaume Tucker <gtucker@gtucker.io>, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:25=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> +bindgen                0.71.1           generate Rust bindings

Should this simply say `CONFIG_RUST=3Dy` too?

> +Clang/LLVM             17.0.1           alternative to GNU C (gcc)

Should we add an equivalent one to GNU C?

> +gtags (optional)       6.6.5

It seems the patch missed this one?

> +Sphinx\ [#f1]_         3.4.3

Should the footnote be moved into the new column?

> xfsprogs               2.6.0

Is this always required? There may be others that are actually optional too=
.

Cc'ing Guillaume and Nicolas -- we were discussing Python in this thread:

  https://lore.kernel.org/all/apG3hwaPA8f7SJeI@levanger/

Thanks!

Cheers,
Miguel

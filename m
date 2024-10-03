Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF4A1AB50C
	for <workflows@vger.kernel.org>; Thu,  3 Oct 2024 18:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727979632; cv=none; b=DI6m/IAPwe0a9h1kEU4vsKWKcCfaordR8x5AhGmhdjxzYnCa88FhIQnJkXr+YEkhGdufOlit4x1da1hsrpwgVTfQ2m/qgt3F1BfYukwHVJE5agjv0RCBjlYcHQkUy1pLrSQQPMp5/t+oO+43hRvRffTywzgei008xobwUb76e6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727979632; c=relaxed/simple;
	bh=OPHzpIyuAEVyuENdRsgtRgBjbI78VqztnMoMxs6v4zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XqanMni0rfcsSjnXnVubgZyrFCeztO6LDBQIr25dN8kWw4eScoit0X+H4S7cg0nN5PZtkYy68hM1rCVcWqcp5MbgXloN69bcQpC+GN+OoCad4/75PEGnePecgLecsTUuPT+Qz5az3fEoPwJ0dGfml7R8MJqai37frwEvSOJaEn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ClGcGw1p; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ClGcGw1p"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4582fa01090so34711cf.0
        for <workflows@vger.kernel.org>; Thu, 03 Oct 2024 11:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727979629; x=1728584429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPHzpIyuAEVyuENdRsgtRgBjbI78VqztnMoMxs6v4zo=;
        b=ClGcGw1p0bf1ArtsX7OK/wC0c9Bx8FL0YNtsf/Go1BxFWpP9Y82VMGn/lgdNr6aX7T
         mSS6YHsoUkZRTP9Rw57FLtY9zl3e9r0Sf1L8Zd+/afWCfCpZwWvITUJnS/JuFjujh+sB
         KuBKSVUDSG80czxLY28ki+7eXH2Fk7/38BjwriS2XPX/VAWgeB5sj7dz/yGC2+4mACsV
         fsY2HDLIDCa5iZwXKk0JbOgLAr5qgkqs/fa2MlczJZL8Ap89irZRsWfObDYPRzg6ilRj
         tH0FKXBZT7QBKvlgaXW9n10cOuoaceYgdtx8FK9OO22X6jcVWWYaZ6BVjVWhd6pirlmc
         inqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727979629; x=1728584429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPHzpIyuAEVyuENdRsgtRgBjbI78VqztnMoMxs6v4zo=;
        b=RqAHlYBEpxVAxwg4qWhKll6TfJrGa7/UzuLxn4cSL1GKSZbN/SfIeP8clbTYGDQQoD
         218IYn1tCBpfGR+d62EGjSi4jpT2yzWqlllzA5fNTBX6gOtlzhvpJIjCtVwqP1+BiZJw
         D9fyALrL9TbnsfWqysfeweXDmaONO9zeyAdfpbjZR6Kd0ZiOSLDo0G8Uj2eOpAWrkuI6
         ZROffG3ZNwfOYcTN8+gzuEnaY3ZUMep4X9QSrHpPTbwFdngOKKRRyOJhE0LQh9UjFez+
         pBAU3RTZgjOSQMuyMegEb3Wqy7bDLHhRk1HmZy5o9ttAeI5QK2ryPAmSeowMx8j/5OtB
         vOOw==
X-Forwarded-Encrypted: i=1; AJvYcCWDNwFPUhK27glPw2w2Yz4jh4Z0Il8oXPMvJ4Z8MZICsnHM71hopbaTZxH8ScTZY7BXKajoiXzdCQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZDD1jZgolmiDdC6v9NfHCU2hIbzxDR4dG5wkCuofLEhjwOO5B
	Vt3scxQYzVxBUD2WkfSU5jVR74h8lDFge92dt/nvriNHirYDY7ebFOuR/DXCiRLpCj7nnv3+3NR
	qJRnXV8UVCfcPtPSE6KcetHBc4NQZg/rdNKDb
X-Google-Smtp-Source: AGHT+IHGZSKF56BASKK8GozB2yF2V8PIyDPsPS4fr3yQFHFDS0HG9quwxCeJ5MiYAd0srYGtlNnDajEe0HNMh2na5RM=
X-Received: by 2002:a05:622a:5687:b0:44f:e12e:3015 with SMTP id
 d75a77b69052e-45d9b947144mr205851cf.25.1727979629144; Thu, 03 Oct 2024
 11:20:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net> <CAKwvOdnS-vyTXHaGm4XiLMtg4rsTuUTJ6ao7Ji-fUobZjdBVLw@mail.gmail.com>
 <20241003160309.GY5594@noisy.programming.kicks-ass.net> <CAKwvOd=CRiHitKeYtHH=tmT8yfDa2RSALbYn5uCC8nRq8ud79g@mail.gmail.com>
 <20241003161257.GZ5594@noisy.programming.kicks-ass.net>
In-Reply-To: <20241003161257.GZ5594@noisy.programming.kicks-ass.net>
From: Rong Xu <xur@google.com>
Date: Thu, 3 Oct 2024 11:20:17 -0700
Message-ID: <CAF1bQ=RAizpP-T_sRGpE2-Kjsk_RZD3r_iz_dpn25W+uDzpWOw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Han Shen <shenhan@google.com>, Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, x86@kernel.org, "Xin Li (Intel)" <xin@zytor.com>, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Writing the doc with all these code-blocks was not fun either.
We are happy to change if there is a better way for this.

-Rong

On Thu, Oct 3, 2024 at 9:13=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Thu, Oct 03, 2024 at 09:11:34AM -0700, Nick Desaulniers wrote:
>
> > > It makes it absolute crap for all of us who 'render' text documents
> > > using less or vi.
> >
> > "It hurts when I punch myself in the face."
>
> Weirdly enough I have a job that entails staring at text documents in
> text editors all day every day :-) sorry for thinking that's a sane
> thing to do.

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792523381;
	b=gf00qBvzLsaHFWRWKOMD5KRhCK6Texw9mi3N6bCHGRwdOXFf+hneWbHYcXKh5xENmofd
	 XEnlKLTjWZmo689zCGQ8JFne4oVA5Fdfm3Q5bitv7325iwIsNVScT8Lj14kgyZsYGz6fd
	 Z+49K/GwiaIFO/u/q1wkV696PaFl+rusvrcV+b2b59lKiy8VICB3kMSSVR5vxcIOPquuL
	 aa04Bak+JoyMKmCIVsexok6fONzDHF7zBpsOV0cLm91ozYzB1iAjHmNokTPzy6j4HCGvH
	 gbUCCALdceT8Bj25yglzMJUMkYLcjmG+ksUcp/JJZw7CvA76wflNTzhQCWfgWCvUl/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
	b=JmUtQiNWvevyCfSOCgp7RcqBkMDRIrrmYXdJvuEyw09N1OoYcx+2YYSuCED3xVzHjn8l
	 YgAJE20j7gBehhf8ZGNme/cybknCevkEQCzXHazVbddfEE07X1SUiTrEJx+c8au3eu3/9
	 yjG4o5v+zYI2uPPH3C9YaJt5+a1WK+kPjYQlvK3uZl5or+rfmpAdyes/dVBpcO6FySXj/
	 qk03x5t1VJDEQo10k5toTgGBPjYjvAMQ26lsydHqIEYn6jryb5bwzHH4x5kLf5raWkSCQ
	 rrEOhODCjm3Xf4Nby0Tc3urAltEQp4UNukjUQPgxXICASd796MzQG0LhccQYGMXderQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IygMgcs6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A037C606A31A
	for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 19:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A037C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IygMgcs6
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35ca5244753so425676eec.2
        for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 12:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792523380; cv=none;
        d=google.com; s=arc-20260327;
        b=VPNeICy9mmd8XfKh9HWrL+pFptpYJRGOfljCaVvGGgGkRFTkAxcV+8GxkYLzSce2Ng
         ubl4s0y8bJbxWkp0wfUPxZZnbJ5tjEeqqxmMPe6IGkkJFQSh5v0MXwKT6eW+G/Y+iedW
         Hl6Oqg73Y0nyL2jQBMmhZIvE0MGwGE8x//oJfaoGf7nlcObKoNPngUxe/5JCcgUvhnUx
         XdLgaB26ZuLd+xpSWmXoiRlKyy00LJmq8lWhoN82nWlYgYYSQh9YrRVGTUPfqJlQ2xYJ
         WiJn97MOHHLltI6k/eN+jcwbVaTohjqUX07OANB5k81OJJ17yZ7yABzmEy+dWW4yhZoV
         jiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        fh=Vh9WUVsZ/dq5sS7rpJahxfQjUtmyL8M3YG9vD+wCQJ8=;
        b=M+slodKcIFpPhVblH9ZvlEeUdZU6/Rno2qLtYNEJjNrCZbLfGaq/ed7+YtSou3PqYM
         xxjhrcm7N31mksbAqhdLOr9xpChzLA6O/VPyKca8ixW80KkdbYnEa00NpnANmyfW7xjr
         4coPW3YircYPua3ZxZJvrZ+552hnw1FWVmBk1x984aV7q79CWE/I3R1R+nyLkSGfzQDn
         cWaCq6WKrDv02JBmobWei+fnUW2OSWffz1b0f7Y1gApxhzQgJeYrdXP9hRl9069p6d4a
         8/HRN6WROwiYjW2Tpe0ya06c+ahqBlltCyqMErxLxVQ/M/TVJB6E5AYH5sBAtOA6ixzP
         b2/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523380; x=1793128180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        b=IygMgcs6Wkd11h28ba3ojzsoJTpJa94odgDpgzrul6leMm134UWAt/R1EWFLQ7KrD7
         cBSCFOQ7MVWcZDDh+NFWLTMz20zU5V4OtYha/Dt/ndOifBmQqWKbEPWCSAUmQUCztPrU
         lV/rb5aZyojz0KbkWV7UxioMmIVCAOfmPB183Z6/VcaAHY/R7bG+jTfqiIfMVDC+L9J7
         Ru+qT/CBDKbmkkQdRKoQq1VXCffrvFzcO+E4IgTEus+geEGk8m379SuKk4YQ5MAzXfhX
         dJhCDvgLPUuAjgpRnNwG6zwIfkaC4zt+/JtE4MTaMLMyHELdf2YxSGLFrPDVCiXvHLUX
         iOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523380; x=1793128180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        b=KQSn0Bf032ml/tbVOr8dNbPtuvq4ePR8pfK9Wq+/VRUVNt773FsXyoQxkT8rh0Q8oe
         jggAWxfLr8ufRxR3mdy51h1DhtVSg4bTCAqGbLM1rG5TifIu6N8X62H2dG4tZJZ0kffD
         2q05Y0PJVIuwc01WBqHfI83tJsMiMtL09qikLDgDzviwRiVOLIOXq8CTJFJNzgjcF5hB
         gX2cB9fPxhkYeIXhB9Hx/4UZjxMBwOn69GNppVcEAhIAHJ98d/W1Eh45gMtWdWdnTYMa
         4RQqnlwW9kifsDi7TsEn0aY4g3ZjRoq4nr8f6JAr+Ff3CbMAz9Uw0DYHD2yZ6lohKb0i
         id/A==
X-Forwarded-Encrypted: i=1; AKwUvBy32g9GR8l4VG1T8gxJNvrFH9RckQ/v1bzjlDCE/y8QM0HzSDevms0qikvYfBxB0P1o4NFIMprlsPk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQlf2mrfNE2BMgua+9IxbcKHuf4nX6MEhOQiujt6XhPYiZlpPs
	suUDKIuqWcxIAj+AOcBAxUkNdafzVnLIMx1joLyN7Q61R7Opw1W6hUvhjGeND3kou6YmY+pmoTT
	Y6B1wFSLl270PaXRuNK03jCGfSiay3MQ=
X-Gm-Gg: AYBFou2CHUPjGvXzNRFIP0dReQU3xRLmycOE5N3D1xNAoex9XyVkLHLByf7lpyAYYih
	DSmvXwHY7TpokZqzTjWdafZK5xJjosugntVd5k4UEklPb8trk91rdUUYs3s97p/sgvZpwAT3q8d
	e55YD0Xn8IWM9c5jw9Ny19DVEoK4Pn+C0lmhak7mblbTEAYKjQ3qCIwHxEOjvwaxPHhGgZTV+FX
	RoGVNRxR7z0vRSlJ2+oYsCkyrF2k/jhns/Tr9J3M3w+tKO+r0Y2+k5ICg01BynlsRETq6KZC0+S
	Lhn7RKeJNda9MzVZMSVhnERPch17wDFExoB4mHUED+CJul35VqgEM49UEn/OzxLu3S4Judejdg/
	AJwa+xN8h/jgRZ493pB0QNzda2UC7zLYUVEWvpNpyQSzT9lQVonGXE6tpaqZ+UJTP5U8kfji6f3
	+RLx+egntfqEmFBvCJxhVZRMOAMBkOWbwesYbpQIc7JZC96WZcfhg=
X-Received: by 2002:a05:701b:4510:20b0:16b:4f52:a08 with SMTP id
 a92af1059eb24-18507ce1c04mr25464534c88.0.1792523379507; Tue, 20 Oct 2026
 12:09:39 -0700 (PDT)
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
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
 <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
 <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com> <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
In-Reply-To: <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 21:09:24 +0200
X-Gm-Features: AclHuK__St0uTCw1avvWmNXKKyd1psXINLsd-c9PUmbMZ1zOmfz4IJPwzKvtrCE
Message-ID: <CANiq72mcCErQoK6wmtOcAZ+SOgRNZO2fPoZ1dac1Now6txy=MQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 8:22=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> If you think there's a low risk of conflict, I'll take it.

Hard to predict everything... but conflicts are generally fine anyway.

Thanks!

Cheers,
Miguel

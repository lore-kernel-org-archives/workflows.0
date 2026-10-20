Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792492487;
	b=gi/kRMI81uOtul5HOe8smw7u6MOaFgAzzwyDdr0IQIcUs4ZeR0BE2/Pjs5mmmjfviMdJ
	 CQNT5ARlHPkENLHuM1jbBLm5Kt9b5IHnlHmTwSGFuCHnwHCG54oCJBkoxqxNQK8zXNbWs
	 1oLsezJ44UlBIPsIvtdKovKFr38tZsD4CrBNjKuvgYR/+nuRklakmrlrqyfgpPOT/yIq/
	 P/8VwABfpYpk5EFPEwETcBycmgeiz43pMe+GJSdb639T6qxDQp+UHHz3IkWBd2FUwBsw5
	 kTWFT1CSAcza+iMqDYT7CQKKgoDdUxZYtQSjM6TI7iQrarDq2DBESx0I4NkWHvr0Hdw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
	b=nUV9u9pNmlseluOHy5VvGTg3YrIPKzrz8klxZzyfY6eAg+fczPbitP2xiJIqWuX2zk6K
	 HQrSQiDklhIRSe+glDxgRs2hrHzhqcToDHj60OGlzmCSD8AY7mT6Fv719Ve3Tj83vhDbl
	 +tE+y0x0h5YCGBOktcldvVSv+g1P0IK/T/NACYOgnApRqfnzxKXOGf89rwSyxODyZ5Lu0
	 EbGz8EoV9MZU6uQUzfUv/AagqjL8XrBl4B1B9nLZISf+rp11kkESoCftslKzSKOVaFpCO
	 Vs48bnlgT8STUB1/DVCaQsEwS8CslvqDHkkiHgGPEvN6yyMkZvJQOoOLgWd+qu8b9FQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cI4IJybI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75EF606A321
	for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C75EF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cI4IJybI
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1811507c88.1
        for <workflows@vger.kernel.org>; Tue, 20 Oct 2026 03:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492486; cv=none;
        d=google.com; s=arc-20260327;
        b=KXYNuDxm2fxSJ8sjvRkCDb2thK43qv6LhP+Dqi754p+t2qrriNz8zu4qYY+Nk/AwVE
         6b9oZBCbI0d5XXWRH2OuCbZN0Cq5C/6QFwb7b2RSbNDsrNhLH4GaOuFfn5d/NZDhqACf
         aD0U13pxb1HKnChdvvgyO8etd7F3uSrNbHTL/7e9BTo+0LqtyCGVEFGRWTQIf3V8MlDS
         lnjMWlwXA+rIcgcoMrr25aBuFt2JsV/4rSoIQcFRUQXgejtCPIsUXz4il1H3TnQIsa3E
         rMxWLyJ3PzIDEyPtdQ7dLgUEvkBQQ7KAJ2EGmt2FtcGtHQ95jTffmMCxm0RsBqPnAicX
         qDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        fh=dcDxQA/AYd3WdyZroEpG8mJvUua9fuk2bHixxJiMORs=;
        b=DkJt7CZnYKrklWxAEqff1LJFeETUkNNGXBgKqA6YI41iX27WHPni+1V3ZIkvinZRYf
         QjbGi0yiaNkAi4j4VpR0vJqLSWmZundFfyF06Hg+Tq32kcs/60wBNR2MI0Fosy3NKnEr
         VQiQ/8Ay3jG63ogwi1ApEUiyQOh/Llw/Rx1XBP1lY+Jz3C+EkXsW+KvOXUS+wuxnrVAI
         DkmGM2ZKl6CSY3eDZk7jmoUX2s5nFErKPAwkQ1pec1zY4HOpFFmy69JBbzLOQON/5tD1
         bNvN/JiFyR/m7haQNF2+jtgCY5/zYQF3QuKjpH+NACwGVH+0eHweaUUTk5ML1FsdSg8m
         SpSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792492486; x=1793097286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        b=cI4IJybIWAFbUhFgiqBGwhfqjgpLGre5R3ot79Ke3zI83Rv8hsE7zK5rQQywe4d1ep
         r23usjXDN6ONg5MR+VjsdgsKNHxDDg0RrsGtvGgLLY7pBHRzQC8h3/H7kxTnExzE6Qmo
         QpZbMR5D5TDURKfX9iAKFDKoEOuHC/IePb6qiP33yxaGOZL4qmuyU3HaaGQSjnc/0vAN
         VhzGtkVCEK9aZxDzOsE877SK4MI9vgdKQQaC/5Oj8b/f1ETaawk5swZ6s8fSIdJzKSFn
         lbaG7dr3LzHW2i+qbB5nZmgclId/Y+2MInJaqBdwT014/GtR7t3ednJvS8omieNK8REW
         ob7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492486; x=1793097286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        b=NsYvR3lqkKKsat4P5/cvPBMEgu/LCs80oLJhhaoI7JHs787bPW6Di4IU+tc/vmZbFi
         mHYSCVIqZnYZOXB4sowXWwwWW8jh/qpyPX3gxHMSU7TeSJT/1xDpgWIPScqyEl9i3TAZ
         9W7vbRLIwObZVf4qexg02nr/B2NU0+ywUU6tp89IcbQFlyBygaNf6YRcfmV5nIscYcNN
         5zq4mALcBICLsRpGlEyOXRu3eveoaQJ9e/zDW8VnXI3JelTUuEwmR9PGTQs2qatQeEWW
         yDv37u0WRJ/744u9uFhw2YSu0Hq6FDOmCF/ZSPddGLx2fGipppqy5mR7KcnFOL2yNjy9
         Yrjw==
X-Forwarded-Encrypted: i=1; AKwUvBziIYSh/uTpjQPXASt45Ne6SRTyx081E54BgXlZIgDO+gLgDGH1MJyPgjbMhzpdSLZRF1E0ZqROOqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4pTYNCgHNDRgmoyCyVwk1k3nFfcjnI4VA58PH7cZnB+i8mCKq
	rFPso0zX/j4EsYyZuJyMk8wCfwKzUa9kppP81qawQC/HJzl9De1sH1eTQyROwORAwxM7nCR/tfF
	6Gsfgy3bRW8CicUVMBJ8RGDM7wQnl+1CYwUXbVzlU
X-Gm-Gg: AYBFou2iZmvK9a9gKOP5u1N0E9ZFONqAAJ6+NgVCZFCvqC6HCJxsH4UcEpXW3dyTOdL
	xCnRdd75i6KItqLOFkOXQB1/E07/bFs2G4XFviJE+yHwg104hCf2rmN6QVvgcTEAORwph4fP1nC
	YMNrWdcOr/Xz/6jogKRjHgRgYwDyMHXisNOdJBCIrwhSS8GkgxVbwjuLfA96854781/9KvhNn5H
	GlCHOZ0j5P20aU+iYPDxVqjA10s2VQQ7pX2F39kfGnlQ/sOq9pu1N5m2B1ti1AM+Fuhd2bY5oYg
	EVW6p1qItsUPh1PUoU/aR9mF17cJ7MPOMAPFM7pSsmxfNttSP2oEV/Tg1XSIbFSOZE7V0Sm/K8N
	27tQGXLws2EXueFuCHg8MRQ==
X-Received: by 2002:a05:701b:4657:b0:183:bebb:e93b with SMTP id
 a92af1059eb24-1850d3705c0mr13844857c88.6.1792492484834; Tue, 20 Oct 2026
 03:34:44 -0700 (PDT)
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
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com> <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
In-Reply-To: <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 12:34:07 +0200
X-Gm-Features: AclHuK9vxwrK8NaLvu2ec0o5N9md4lXO8zMypsPDxXbgQlLlX57bi1hqfmPPF_I
Message-ID: <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Tue, 20 Oct 2026 at 12:27, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 11:59=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Which tree should this go through? The Rust tree? Probably too late
> > for this cycle.
>
> I think you send KCSAN PRs, so I thought you would use that, thus the
> Acked-bys (I suspect others thought the same). But the Rust or Kbuild
> trees are also a possibility, yeah.

Happy to take it - but in the interest of avoiding conflicts, thought
it might be better suited for the Rust (or Kbuild trees).

> In any case, at least for Kbuild and Rust, the PRs were already sent
> (and, generally speaking, I would have expected a patch like this to
> be in the list for longer anyway).

Needs some -next time, too.

If I don't hear otherwise, I'll pick it up later this week / next week.

Thanks,
-- Marco

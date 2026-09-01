Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC22390991
	for <workflows@vger.kernel.org>; Tue,  1 Sep 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257015; cv=pass; b=bcYI13azvCX4a229sSPxMlVHKqlKE8u3/vRyYiJ/WioApPXaRXKMOqv8Bcce7o9TvyUabLqwXi1DOdUxKUfJAo2+FprkIORlW+wd2GOq/LR8zMTc83RFdwFcxcIEC33t0CyDvM+FuUvyoUNNpRfRDyG05CPWMx4pElgnOagFwV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257015; c=relaxed/simple;
	bh=dtC2b9rE2+PvqyfvIQpFBFFgI4ZlT+seDQ76UBcyXhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1FeLG0ukfAtwQKbaDNKzj75K9mZqvEnqUldEjfCHuOArknWC1A3W8hfVxLzE5+JPlygcFtobeWOInaqq9RGATM9RxTpW1pZ9maCZAM48GU9rw1SE3sjwD3K6okfwVe+dwHesn9bx7YYX5U+b385DO+DdrOmr2/1cVm4peCEAbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2rRfVrQ; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2rRfVrQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d5862bc921so10386175ad.1
        for <workflows@vger.kernel.org>; Tue, 01 Sep 2026 03:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788257012; cv=none;
        d=google.com; s=arc-20260327;
        b=iPTHdLk2Ut/0dc+FJmltCtQqtBIR9LAB4G7pedU9YpMkXeTJNtNjqolERJZb9SRJ2x
         Q1DmQZtnK8ru0pGZksVqB/MCnVnSIC3WKajBRxkNHl5klemDBHL0Id+IoWE2u8DvAHpx
         xFKgKrT17UfXQWQZSDQdhjhDsk7GLrIuyyPMXYkDIgKpdamV67V1VOMAHONS0aVxoIZ5
         4zwMt7PbtC6XFq1H6zy+CRtYm5x19apOS5bYM5pmaF+2Fn4vJeZPU1dyjoF+JFd75Y4W
         6JcfJuMjv8woIE2xrP2dXbSVLGQn+hymjFeBGspSu1oZrmNY3XEIu+hSRvrNKWGyYJAz
         KrMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        fh=wtLw8rTTMMNzKo+7XS5K7L5n666qhRIGgIwdhQB4JgE=;
        b=Vd8fwwhVHxwSrHZ2Z6dTGQuh3X7vEheY/kAsxFPR+KBN1ubKrgDi4Bm2FmqaJGlO7q
         ql9JkSb4oyJAuhpiK7dirR5yiK6S+4HUlc7wL69Q+rZCvzeXM0Whd67c5Rs9DAz082dz
         bUmX/QkBVvWPxU8jZsZ891Y6GTCZyN301dq3XcAVlKsZ8m0E9kdtMa+bJfHGqzmgv+gb
         CQh8gCpVmirSeFK/xsIHCRzBB2IBjLXpn0SMn78IiGa/MuXEwM2xK1/us+vSqIk87ygI
         4NyvEG2881+WadZeOlWQdu6g7ItWXY8mLsXIZYlL1K61fEtKp6DajfEAyFNXbYlxSTQQ
         oLtQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788257012; x=1788861812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        b=m2rRfVrQUF+pl/kSam6VyJuJMlKFCpKV113UKvrgRdbCvB+LA8c1VZE60GMGuqVK0d
         Iynnc2jkGkjmV+FADIvZDGIfWpB1e2SqBZEG8A0/PyhgPZ7CUF7+rNci/JpNI/hH9xUX
         ItKTfLWTFEF3CZmK6D6Eb3GH1L2nz/f0j8MtgnYnwFlS9yOvj4Kfd4kDh+IDsJ9IQG9a
         iD4E76b+B1l0G2UyVgguZLJCQ5WwLFaMlhwHwhbBfdWXGKQrtiDudtCOIRET4udMU+Fz
         zIkZS8Vw9HuFOiDEgzzDYq3/UiIFvnq4clS3Yg8ljZgZBq3W4grGnoJZbsSpslzK4Yvg
         rPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788257012; x=1788861812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        b=IGheTdb8wiRyZpqCCMajTVAWFsGFk362cL3lF2oQJzgKh/Zulgz3lquWzmHSHcGgIm
         sRKnhxawW08eu2Mggc0Ou6pkhd+LHqQlsNqFUgWsH6X+yuq6+3/p6D/hQ5bEjfjSjZ2n
         Yb0x4NJo/w/ODQmwEBiC4OsH7Njc2sOpUT7Gou260MUacKU+eA017H0STu/jGPkFoi05
         lPIO+4EuuEnTqmizSQA6s+kZs2vkbO6phb3d0T6p3Ysk7K+OJ/mU5g6rKAMFrEFq9L7y
         kk+ih18y4Yq57W4zUQoOiSyL5EMFX4bjimR+9VL8SmKGhIgcsmzxZlJfrcbsHqe++438
         l6Jw==
X-Forwarded-Encrypted: i=1; AKwUvBw5cRkar1MSbuZxSTvxSZa1gr6W9bnHoHF0wyx1kw13yFyaG6kSYZvskdcBm3aKGh7MhcjqX91uYIY=@vger.kernel.org
X-Gm-Message-State: AFuF++la94tgAFfULQ8JLEM3mtcqEpnP6cpFk6S3kfmC8ajVDHY/nFF5
	Wd4+hnYLA1s/fPAKFef2Ovp3SbbxB9ZkpZ3iGL3nxW/R19Zd2M2CodsnMr73q4H6Df8u+ona56P
	C/y8LoHizK8wcONTWDdpXKFVJtc90Xr0=
X-Gm-Gg: AR+sD13F3m9xyUeQlu6GrVnHCueWZQ3OSdsyikBR6dJr5wW9QIp/69jsl1KJabXNQzd
	uY85u0gWvx2kwYHO5peFacfH2Lu1TZEDp6WX2PqRkDCweniznxEzOmQ/VuZ3n16FUxBbtxOGqZf
	BD6cjhYSevL387y0CCOtkZ7DiSk4HXzHtm+SXM4pewqtZMzjTrk8YChi/fUEKaQ2bsw5Z/wMyok
	l32wGwefd3mzpYxsU85GkyvwTnF7iZ1r+FopE/XuucZySsK8/UfR81msiBIQwP6Pe8enlQ5rb/X
	UyF/kw+K9EcbBKZTZQuy+JFsy8dzdlRWpeqDg87HfES1UEjLYmZNI8RLnvdtTGYoIDd4zIKFROg
	w+d2CCMCPkR0TJtP1/SIAN8Y+Syu6sXSjOH1tTioVeW474hZqRqYDkv+JOM+D
X-Received: by 2002:a17:902:d2c7:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d74ce38075mr274123155ad.0.1788257012245; Tue, 01 Sep 2026
 03:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831151605.638172-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260831151605.638172-2-manuelebnerli@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 12:03:18 +0200
X-Gm-Features: AcwNN1VbNKqeV_yey9Jhr55AwO_DusZQ-wcQLGmrDCepzJ3Tk4JUYrXX-Z1lHAo
Message-ID: <CANiq72m0xHD1YTADnmQ-fqMPSNHrMGwfPBbT7V4crBgu7B_ecg@mail.gmail.com>
Subject: Re: [PATCH 0/4 v2] Docs: changes.rst: rework
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Pereira <danielmaraboo@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:17=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> ->[v2]
> Ditch the name change [PATCH 1/5 v1]
> Add Acked-by: Randy Dunlap to [PATCH 1/4 v2], [PATCH 2/4 v2]
> Add genisoimage, mtools and syslinux to list [PATCH 2/4 v2]
> Ditch footnotes in favor of a column [PATCH 4/4 v2]
>
> [v1]
>  https://lore.kernel.org/all/20260812120805.1631430-3-manuelebnerli@mailb=
ox.org/

In my usual go-through-the-ML exercise, I noticed that the subjects of
these emails look a bit strange: one is missing the version, the
version is at the end, and they seem to be out of order:

  https://lore.kernel.org/all/20260831151605.638172-2-manuelebnerli@mailbox=
.org/

I would suggest using `-vN` in `git-format-patch` or `b4` to handle
this instead.

In addition, if the changes on a given version are local to each
patch, you may add them per patch instead, after the `---` line, if
that makes it easier to track.

I hope that helps.

Cheers,
Miguel

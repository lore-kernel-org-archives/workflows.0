Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794467232;
	b=lf951I3+a245sXliIKjJZ6GCaBPQ5le5IxisK/4MNOqGz2JyjxsM5FXmiM+8HrR2NjWM
	 zrXrDdl4jAb0/dFAuPEXHZnkFpxgJyd4lUi8BqWJO+3HkrZ57Ci9HGE4uITtlvRM9s82g
	 pV3m6+H8YFp32fOaNlui9y7RkGPJg6mOQxIHDN6Syn3j0nthA1MoQ5n/LCg1fFrXlIgyY
	 gJgnGN+f28sj6Dt0AehD/zDcLvKcYCBVeI9XTlU/G+hFPR+SP42M2D7zaNO5yMdklpuvT
	 h5CHiW9b2Jmjf7PUpFsuWzwmBlrIZPHFv3y3vYiS2xftIPFIwpqbP+Ce5bxoZHKWJkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=fKnVCHN7E/hSBh2v2WAaZgbrM1NIrcwDb5EE6y41Z7Q=;
	b=aePxzcFt3A0c+FK6T0PbYvs0v44lD27Z6x/0/0itD+G16P3Vg0FSIOsJEAKq3ssku3Wb
	 T+sOhOHyygkHAktZt2bGIFmGz93tHL6HlKTZoymroUy8moDd0S4jrIUZpzY3NgBJ0WSCD
	 VCV9YqUR3p7o47ROhBSWNdQG0MYOcxPM4a86WgSAI9PefXJ2ch1vU/erpxGTOn/fUQlqS
	 A44pgGQHHiVIPlE6MfuDpnGL/1slgE5U8iDZGcGJLT3YXoIfs1f/P7+e6hgOsAfYrK31b
	 FGClpeLgjhig4Fvyp9KamRXte02UcQHDaJYAmH4oFReU/wPb5kIFx46s8cHiz+fz2oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc44pbNc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2537606A32A
	for <workflows@vger.kernel.org>; Thu, 12 Nov 2026 07:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2537606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xc44pbNc
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36e90071735so221839eec.0
        for <workflows@vger.kernel.org>; Wed, 11 Nov 2026 23:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794467231; cv=none;
        d=google.com; s=arc-20260327;
        b=Joy4EaDdrLfFF7ZoBgCgcLldsor0QFLJPbvjOsMwmxeqgQ7uEXKGf4bVEwVa9S/cK5
         gmPYXFC3TsCrF0I8OBCeT7mDlDCWe+1IFBVUN/vnGpUkPb8oVrtYdHkVVjmJ0VV/f03u
         XoUKrlbbjg7BaT2Ddbgl1LXIqp9jX3LS0VEcq9+6dmjRaCQBfYdrtOQNeoN149gqRENZ
         YF5sIYo2lXv5FkV7oLcMOoW2bS8VJL/w7OiGqVQ8bVDcWIVqNx2Tya+O147qs6NAJWGE
         Hu/PHGmTYE1mdMSnz3/6h4rnQFehsTrq4Q9wLb8xbHPk0emQTsYK1B2tKCi98unDGih9
         1soQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fKnVCHN7E/hSBh2v2WAaZgbrM1NIrcwDb5EE6y41Z7Q=;
        fh=6LC0YXTb5sCOjVnB9MdoIOwsSsMt6i++q8AK8yisv18=;
        b=Xu+rEk4/Rj48Edtf4RXrJUZGU0JxYOVV0ZeZ0WwoeEGUr8M3beJaHqp2VADRb8tjp4
         9/rd6QvQumcHzbbmRvryxke2icNBDGkmYX0MTIuwY4pGhMCKKTdUOpsgbXl2Ytv3PZZ5
         aMR6EK2R9BSnluOmiHB/H/uvnxRy6zY8VE+fQu3dZk75cGRMhAx7/A7qJDQjdJlb5oTQ
         8eX70f6CB/m49iUzWV6G23HYF1rqNKlp+xWo8BnqgzkeC+F+C1ezH+jRcamPd1deMfSm
         dKwOniOq2ZK2mth7/0YvfjL21/MKdlu2KwFsUVxvXW2iXe/MxY+LEBlUahtlggh+OoNX
         b9vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467231; x=1795072031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fKnVCHN7E/hSBh2v2WAaZgbrM1NIrcwDb5EE6y41Z7Q=;
        b=xc44pbNcxltUHGg4tunSUmN04e2U/jKsJUsnxPYcvA+qqm01NnKPXgtlnQekS7ByVq
         4AtP7iHvVolgk7MNR4QfFlGkEmt+3sBlL6oSmEktDhFPu/wHAnGbFh0jsqXMaougHBpI
         gHoW2ClvogVyVXvDiOeyl/DtSGsaERvHOwPNTFiQwuYZ3N87WzCUKI1ouIuw2rv1rSJu
         ocHwePSnJq+Q8ldOoYCTJCmzWnVlmSFv49wORYfLbrRHdk5QrrM3JmrTCLlA9wX6en6t
         KdeT0dTF/ux5bGGwY8xtfpaAQ0WlrEw0/9zk41gT10dn7W8jceJBbGr8FB+1KspVxMe7
         9xnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467231; x=1795072031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fKnVCHN7E/hSBh2v2WAaZgbrM1NIrcwDb5EE6y41Z7Q=;
        b=1ehE1yC0jcyUrZ5ZYoSGYLR31VAePbCzNIIqIQSAmMBB7k24PsPWLetEAVsvrrAHQK
         MzB8FaFd27t1yeHe34ELveq+wZcv0htdLyVgnbrGjrZdBeL2QIJeZnjjUyIuZIv79vmu
         pCvLDknaBIsExkd5tJjPWTrrOAMNGp5AzUHhOSDy6JOieL6D4TyF4zNehJKSYtpoa6l6
         Pllr7aqJCfZ4ywNkVK/cq2i+Fq+PUw8u1nXKmZNHrA86UNzbgaeLgbyhEM5bvnxPFB9o
         MoRFHxnvMmWODQiKpWG5cJvxl+xwlUx3xQcjpopwxD2EQiDcXM9351Pt9DFFZBSGivQX
         fuUg==
X-Gm-Message-State: APuU4Z+NTMocY3kBkWHJA7a4j7TncKdHGdB4Yg05z4dVh+DVQaJk8wxH
	jZAvDGBDpFMnSpmcAcG02S+R8dBBCfTHfObIj4PY8F7oVC+17AvdHKu3BbkmhtJr8OP2MaycTRc
	2BDzVQebh+nsPtHnXQsy9fvPLC2K5AAs=
X-Gm-Gg: AYBFou0cvaxxmRyQ+vsDJpVZeP3jUzjWw9O6JkWaCIE9DaT9huBFx9cISTCiG+oynx0
	RzxWa1ga0vFHNqbv2oLOgq4JKOc6y2VNBV9EFaFdgEpubAtuPfrBWr8MuUw50J+ix9zxvP9cWSL
	D9AvLmpPov7W2aHEPoVea37EkrdukNs6BzV8UaXtQdy34SpGEfCf74fOpvGiR45sQlR0MLiZGNH
	NDF/mEloxBTPzgq7swEHQpraWCbPibVYG4dqOP75K/8U6EMDdSx4rm5Z9jjyeA2vX+tucd8TWa7
	u1fGwkF9GYitDqujWJ/vd3MPS3QAUF1+zRXKWyuD3tNGdvPq/+lG4Au9uX1TjnOdzwmbq69ZCTW
	fPu/2sG5CZ3RjiIj3eV+2hS8a9WkC0rWRZ5EHNN3li0JTt6KuwKkLZRSrs0dkKRTu+Ccd/slyrV
	3nSdso06eyLYcWruPSDdyXHcyWUh1pOFEi+E6MVruciXAHuM13XsHc8nfu+yp5Qs+SVNBph2G7I
	Et5kYCD4TpYtDl6rj6Vq83ZmRHUX5XSgbHxhxcC8k9bqqSNyjQbKiDXG+rljcVp5nh+7gFwpDzm
	LlBcRiDUWMMtUgWT
X-Received: by 2002:a05:693c:20cd:20b0:375:f846:5b3f with SMTP id
 5a478bee46e88-3767fe8f34bmr7678043eec.0.1794467230848; Wed, 11 Nov 2026
 23:07:10 -0800 (PST)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111225940.1573565-1-tytso@mit.edu> <20261111225940.1573565-4-tytso@mit.edu>
In-Reply-To: <20261111225940.1573565-4-tytso@mit.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Nov 2026 08:06:56 +0100
X-Gm-Features: AclHuK-0Vjsbk82ppS8gYU_c-KZHXRP49X84VVchA17Y0XwPYJKcU9nKf-NQksU
Message-ID: <CANiq72mNefHqXnfy_mh_kyRT0SfM8rLj1kRnc-Y-qmdaDq0nvw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] agents: add a skill to determine stable tags
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev, 
	Sasha Levin <sashal@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Mark Brown <broonie@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Leon Romanovsky <leon@kernel.org>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dan Carpenter <error27@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Julia Lawall <julia.lawall@inria.fr>, SJ Park <sj@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:00=E2=80=AFAM Theodore Ts'o <tytso@mit.edu> wrot=
e:
>
> +Read Documentation/process/stable-kernel-rules.rst. It says which change=
s go

If the LLM is going to read the file, then I wonder if we should just
clarify this (i.e. the list given below) in that document directly (as
a guide, i.e. still acknowledging that the stable team decides in the
end).

> +Judge a change by what it does, not by how its description labels it: a
> +"cleanup" that releases a resource on an error path fixes a leak. In pra=
ctice,
> +the stable trees take:

We are adding Rust soundness issues to `stable-kernel-rules.rst` [1],
so if we are going to have this detailed list here, could we please
add a bullet point somewhere in this list like:

  - Fixes for Rust soundness issues.

?

Thanks!

[1] https://lore.kernel.org/all/20261020163358.176088-1-ojeda@kernel.org/

> +  the code it changes. Otherwise, if the Fixes tags are unresolved, so i=
s the
> +  stable decision.

When I was reading this, I wondered if "unresolved" had a particular
meaning here. I assume it is referring to the output of the call to
`find-fixes` and how that affects the output of this one. Perhaps
something like:

    Otherwise, if the find-fixes skill cannot determine the Fixes tags,
    the stable decision cannot be made either.

is clearer, i.e. being a bit more explicit and using the same words as
the last paragraph?

I hope that helps!

Cheers,
Miguel

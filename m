Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028643290B8
	for <workflows@vger.kernel.org>; Fri, 15 May 2026 07:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778830696; cv=none; b=aM7d0H/sskEfTj5rj93f7rZjnaqT8P8myBqI7RecHIxyi8AnQ4wnPcvMp5GQ1sD97pz+BTQUvSVc/bt0DSuxVATWq/BwK/VqIyUgBOawyTvRJepR1GS3SFIAX3/p+vq2SbrZ4o7xFs4qyfDNZs2pgAuk34u6/GZGEWwh5pFNkpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778830696; c=relaxed/simple;
	bh=bqIKwetgvyPbdIBtN/C+CmOaxgR4H+tRYRMQodr3O0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJ1pKqY0MXGU18jbnqCcZOWiHipNy25FOx8gPmplxfWJb2tMe00aqC8eE6Fmb+3n+N/l1ShW1BfH3sbc1mGNqEexksE33SO/L74UJcP800jYajLNzZM+b4/Ujs53RjiuTgZLDIgEgh6lg8ht2Wfo/BEAoEDevli9mrdrcKfr3EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bcd730e090so41390575ad.2
        for <workflows@vger.kernel.org>; Fri, 15 May 2026 00:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778830694; x=1779435494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O3dzUv+TE8ATZ9NbLM1tSEflsQ+HaYW1+/8hUhwNmHA=;
        b=ha01fZDooZPRh/Zvpfr7pDUj17j4+7INqZ6ldh5GKeYqWVTML916L6rFvSxb2I41nZ
         2dOtusjrkbM85HB/kxQhFpah84S1Sjk2Z/1Ts+69r89sR8QCiLf1k+BFGt8461T/lrvR
         7PLUg09fCuixVxt1uhWgLS/Ps6cbUHAvLAtWw4UkaQFwFoKePm0J/NZ8oAHb0DUQeUPo
         lE2FXfSOHZFlvJemB35oxu7w6RQQyBQDSeYrYLHbnc+FfaUZBFGkm5GICKQEhZLhHzV0
         yW0KxbE/aV8HO5JE/0Ob3R1op4Dek4jGYY1VkWCzpy77NLBP5DrU47vuYePB0YW2vQ+4
         2gMg==
X-Forwarded-Encrypted: i=1; AFNElJ804iDGg9IO3ZriGryed+8m8yE/tC/bqbOO/Ot0TmPT91LSR7tiZ9y411VNR9oFfYoRfwMbgLe9xx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn8roAQonm/BPpiF4gkO7e4L+HGsAymgNJrmEwY/rz9S13/Cjd
	M1emshUXyQ6r3jzVNYGP6+kXmuvufOzlCoYKdZ/+zu8PRpGcH1qNkMn3pmIKEURj
X-Gm-Gg: Acq92OF0XGW5Go+A//tbxhoTS+pq3mruQK9kb9SjoBnsyhUXN58IDPG1d2zESQN3psG
	ddPUZ3JutPagEdxu6xDzgBoUun02tS7HGdHopdtiungqI0roStZegZ7GKsiUbR7NR8MHO85vykE
	PhZM32LZv8eUQLGlfyZ/0eNbP9BrRdtmmtLRvdk3ReyzJLzOJ5Pb2BaptCHE4zAkmIMz7gBs2+s
	zhIFFHO9ewAd8xgCc6CHbq5c1tYZAoE/HpYakhwHc2rEW1DtlyONFWqRS6g1JNL3Z5Rolxfbxg2
	84pUaaFv9DHawmFOYEzZJOCIV0u/rWl3zXpYnc3DWcCSB0Xxzf+UepS4rTCPAItmsrClt8rY19i
	HtE/1UKUlq5YFSLm3VhL5Ha4vD8lDrLgDQk5uwyeo2Dsfy8pTgJ0TCravOjVIIJFRFgdLnG+Lo8
	5YWJN7LwlNc5KjoFJo/loXfm+el0rVFIb7Q9PZ7iZqszNbppxBk5/yXLJuzAGagtI=
X-Received: by 2002:a17:903:2284:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2bd7e949015mr34877595ad.33.1778830693934;
        Fri, 15 May 2026 00:38:13 -0700 (PDT)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc60sm51668905ad.9.2026.05.15.00.38.13
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 00:38:13 -0700 (PDT)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30246cfd41aso3638479eec.1
        for <workflows@vger.kernel.org>; Fri, 15 May 2026 00:38:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/aiPYVkNY5Uoh3R9hg51+cHQNHcC9QzFpkKNFARMxO0TS0LZa77+fSQ/YrH0LBkaNYOEJXKC4/V2c=@vger.kernel.org
X-Received: by 2002:a05:6102:f85:b0:631:4d87:ba5f with SMTP id
 ada2fe7eead31-63a3d0182e9mr1369077137.3.1778830338737; Fri, 15 May 2026
 00:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514163033.108009-2-manuelebner@mailbox.org> <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
 <CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
In-Reply-To: <CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 09:32:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW12mAV2YROUiFLoKKmtNS=tYNZs7pWN0e4wTKkSMA2xQ@mail.gmail.com>
X-Gm-Features: AVHnY4LaUL6_HTTIWfCYvORX1aBWZfLLK8XImRY-EBwryuYA4LTpz94PBFit1wU
Message-ID: <CAMuHMdW12mAV2YROUiFLoKKmtNS=tYNZs7pWN0e4wTKkSMA2xQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	David Laight <david.laight.linux@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Jani Nikula <jani.nikula@intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, 15 May 2026 at 09:31, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
> On Fri, May 15, 2026 at 10:23=E2=80=AFAM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Thu, 14 May 2026 at 18:32, Manuel Ebner <manuelebner@mailbox.org> wr=
ote:
> > > add kernel-doc comment to strlcat() function definitions
>
> ...
>
> > > +/**
> > > + * strlcat - Append a string to an existing string
> > > + *
> > > + * @dest: pointer to %NUL-terminated string to append to
> > > + * @src: pointer to %NUL-terminated string to append from
> > > + * @count: Maximum bytes available in @dest
> > > + *
> >
> > Missing "Returns ...".
>
> Documentation says "Return:" as
> - the section (note important colon)
> - the singular (however plural is undocumented and supported)

Trailing "s" is not always plural in English ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

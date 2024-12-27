Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF03745005;
	Fri, 27 Dec 2024 18:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735324427; cv=none; b=kKDQjkOIhW1bRcPx3yQrLSsMwQDybMREgzd63MZ61xw+B42FCfuZJ1YpUl2tcG7kA4N4/AXP6A8ZR7SHv4Hzjvl+FXklln/14Zl76T/ZTG7e1SNebPEIURnFrX/GsmNcdm83EzkKQVtM6Wzi26mq5d97yL58YQkDrc2D9SrEax4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735324427; c=relaxed/simple;
	bh=DSTiftUs8qF1/6Wr752qm3Y0VS1FLtxBd9NtQKkmyCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keUpjD9RgpdmKeZ4VmxqOx2yoancr8aK4ZEYZSmQuyA6rVMYwY/676i62oE0SlVGZ8ZZ6jy0nB2QS51s1b95V51vFsWRBiYS6LfGvuy+EF+A1Rfaoa2kgrpb9C2dzCEY0PI/buCQYmeNeydC4HwI311xKJ+NsIUKmh2TbGDwdok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afdd15db60so1976665137.1;
        Fri, 27 Dec 2024 10:33:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735324423; x=1735929223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Md4pV1r9X3VCMc00BOlMTRYThFiWZ5TnfPwGhk1/R7o=;
        b=q6lEj93umRqCkh02whjA00ctdqlPe9qQtAujlrGrSqyoq7bW15vUSYW3Si7ei20GMK
         sPIgW3qs4O58bhjlyJiwl37jLzxdKbRNqV3NyDXTWlGqYEc+tMoQM7YZCeax7Ez683Uo
         W/TpCK/LMOkZ30CMsHV33ArEBDVMbCA28Ysos0R6IxXmd5+SMkd9er0Px5BRfeeqAOmx
         Kl4zAqPZpEGk2gJcbpvtE3etbUh+mlAXcnnXwjl3KzEp/4hL9Y8nWovnH93mJJdEZC7L
         PgOnYF4SbBq7msH/L6Y3yStW8jCX5e6he1pxtaerZMfuQjiHbv5wtbZdYLtXQK4ABfwI
         ErGg==
X-Forwarded-Encrypted: i=1; AJvYcCUGLHz3PlYs6FE30fnqbCikmIjpGPVznWPZ8kRWjdIgB0hN9kFsfN//mExW0roDOX5NtCwZ9VDRP7o=@vger.kernel.org, AJvYcCWI1oIZQrjSqn7gmqgb7EcUJAovc904svP3KkNtrlnaSKCik/YAoxN0HK0q1hRigT+6MyFqf6KTdW+fdGVc@vger.kernel.org, AJvYcCX+2k7FFdJOEWBlRK8fXwFI7AEBcB2OJtPlqAJD/myf2wUQrh/o1TuzjRdbCSYbqYDkCr99D3WaJw2a@vger.kernel.org
X-Gm-Message-State: AOJu0YzT9c1T3tEYQUuKSYYv8LQs94g/SZ8BMma/kzhV0rvxjwqIvnY0
	6Ikq35hqGJQ6k3Np78ICJwEHABgzU6cRuDJQhOC7SNoCTS6upeUd1jE2TUoY
X-Gm-Gg: ASbGncvM577w1kVbUen5Hhb0QVOf1SkFBUZa6Yte8wFk3NxfUthyGEs/H6cYBwA0k1a
	yuuta/oXT99uensa665ljrOSxjj4xwKACek/fKkq0P83mGcV4FPUAzE1qkJeU5I8Ij3wSdwO4LL
	vDbNuEKR/ogr/viLGOaiOszlTfLcwsbfpY9k44MPDFM19qZ2PNT3c59lqmYSMz1I6Yr6xGwO4nQ
	1RTkh4tr+hXYATFznZL2OO99eVClAqsTk3zvYGwmWNee8Dy6DIvxNuQ4PKGzKJ6SI/8D6f9/Gd3
	hmNa19XoVDKS1a9D8ts=
X-Google-Smtp-Source: AGHT+IFDZEwD2HH1KFQSCT+Qw8UcIH7qSulRt4V8pZ0gsLEsLsDjlP1HZbHQ6ZFK/HYYE8e78TOOtQ==
X-Received: by 2002:a05:6102:fa5:b0:4b2:4877:2de1 with SMTP id ada2fe7eead31-4b2cc456fa0mr26613612137.17.1735324423447;
        Fri, 27 Dec 2024 10:33:43 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ac6b800sm3126062241.15.2024.12.27.10.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Dec 2024 10:33:43 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4afe4f1ce18so2078738137.3;
        Fri, 27 Dec 2024 10:33:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVHj9y2CXEClxsurK0Oyz2B8KBP5AHhp9H4qQ/kFaEjC2tH1NOyeEXNSEHo84xvRS8SBhqVF05MjnLC@vger.kernel.org, AJvYcCWnTbi8XfM/RBBN8Lf+Kck35rhAUio9wKKU5J0xVZX7zRSkoBd7snOCxP1obbJ2FIq1sDaLlIfHwg3MduSh@vger.kernel.org, AJvYcCXkBxoWB2lnAJnN+pZwygaFc6n/VwHEjZoLgsCjAZgvZTB3c7XGBZFRmlWBvv/MX91/ssUDbIa/Pos=@vger.kernel.org
X-Received: by 2002:a05:6102:3707:b0:4af:f6ab:9f9c with SMTP id
 ada2fe7eead31-4b2cc487ca5mr19322059137.23.1735324422583; Fri, 27 Dec 2024
 10:33:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226220555.3540872-1-sashal@kernel.org> <Z23ZmVwgS2ErX-dj@lappy>
 <CAHk-=wiPNpQ=zmGvPoZRMFZ7a7mm2pzSoOsuQPdDRaSF7gbw9w@mail.gmail.com>
 <Z237CwC_YKhoZubs@lappy> <CAHk-=wiH=HH9CfFFuBwAwDdfZAjCzN=yAhzWehCAR8bg_-2CAA@mail.gmail.com>
 <Z27TkUSmM1sCTslO@lappy>
In-Reply-To: <Z27TkUSmM1sCTslO@lappy>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Dec 2024 19:33:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUT0ZBwVZMPMuJnHy+-DS0zqLV3t4MRhSQVpLjEsNuHgw@mail.gmail.com>
Message-ID: <CAMuHMdUT0ZBwVZMPMuJnHy+-DS0zqLV3t4MRhSQVpLjEsNuHgw@mail.gmail.com>
Subject: Re: [PATCH] git-disambiguate: disambiguate shorthand git ids
To: Sasha Levin <sashal@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, apw@canonical.com, conor@kernel.org, 
	corbet@lwn.net, dwaipayanray1@gmail.com, gitster@pobox.com, horms@kernel.org, 
	joe@perches.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@leemhuis.info, lukas.bulwahn@gmail.com, miguel.ojeda.sandonis@gmail.com, 
	niklas.soderlund@corigine.com, willy@infradead.org, workflows@vger.kernel.org, 
	kees@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sasha,

On Fri, Dec 27, 2024 at 5:19=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
> No, it's not a problem. In my mind, I figured we could use shorter
> hashes in mail message to make it easier to communicate.
>
> It doesn't have to be formal, but for example if we exchange mails about
> an issue, and I end up referring to '1d1a ("arm64/sme: ...")' it both
> makes the mail more readable, but still someone who doesn't have context
> can still easily get to the commit I was referring to.

Is that 1d1a commit something in your local tree? I don't seem to have it.

A few other comments:
  1. Please add support for --help. It took me a while to find out I
     need to call the script without parameters to get the help.
  2. The passed commit-subject needs to be the full commit subject.
     It would be nice to support abbreviations, too.

BTW, I am a heavy user of looking up commits (recent and old ;-)
My .vimrc has:

    noremap ;gs "zyiw:exe "new \| setlocal buftype=3Dnofile
bufhidden=3Dhide noswapfile syntax=3Dgit \| 0r ! git show ".@z."" \|
:0<CR><CR>

So I can move the cursor to a git commit ID, and type ";gs" to open
the commit in a throw-away split window.
Adding full support for commit-subjects may be challenging, especially
if they are split across multiple lines (i.e. not Fixes: tags, but
mentioned in the description).

Thanks!

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

Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C5C1465A5;
	Sun, 12 Jan 2025 10:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736679277; cv=none; b=rw02grCfbWqhQuzf/hESWjX8gVLeS2KCDKPYuO6Sv3nqgSwhq438XXRpTQejDHsbtrQqMuK1bpwYgC0a/LJYunxyyzmgoQgdtKNN/iMPFxGUE2A8LG2zcGBgrRkpG1t+vtGh1dnISKLgp3vgo3fLYkJWBRIwsD3zG5IvR7cLhD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736679277; c=relaxed/simple;
	bh=tsu/pUIVQMSANOGKXx/ye25i/RfVf9ppAdxgP3tlJJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hl9eCyouxvBp3rUE/4RG2gnSWtHyix9AfxiNRsPq4yD+srMXIHpoTsYLIGDEzXltcc1gEWkMS+4FTa/Fj6ez4rf1JvTJZpbxS4FoWc9cAbrYYYAzyDX35ghwS32aKQkPoNc7fTpYTDQhuTHnKzvXspe/kEWqbWQVs4pX93A3KQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85ba92b3acfso1580772241.1;
        Sun, 12 Jan 2025 02:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736679274; x=1737284074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRgOV65ZBzyKNAloWHfMUJcB+IW/ajMq0Yt82HQb7B0=;
        b=Y1mPi0vP8O3rAMNs6trcVB/USMoiHY8883EYOVFZg5xvIJ+VQeTy45ORdUnRTP0psX
         4ic3AI+qm279C5EjVWWskRCv34Ij9ib8Yn3MD19axclQ5VjwZtJ1346imAQfpb8htOZp
         Smi2Gi40gf6Gbyn37QNjbieE89fNZz4lXymv/qN9tXlcv7xNXMIqcvhEc5KV7wG9B/qL
         Q1NI+EsXWnXb7xixP0tBil5Pu6fqgn1jWElGU6LwFbTTTxX3owJ9INrJPy7Wl5LV/5wf
         zEt2XhXYjY5dowH2eK6qd8qvFGdf49TQLnznxViKz92QPpptP2DbigIpVcVl9OglCtFo
         ZGFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDi/gRKMN7hrjNb8UH7lDqQGu8DEgRNKOqWyfTr/RiW+Gxu83OwQnCc8Ss16Lv94j8As4VQpiMyHuTjzRO@vger.kernel.org, AJvYcCW+q6odZmVm/cb7YAyf65VA+0DcqMJXbL7xwMc5qCSVQYsXlU2HQI9/8s1FZuPtDZamPfNmKmv/6D0=@vger.kernel.org, AJvYcCX51xBVgWcZUrTOuvVFtd3JNzZ1+jDE6DlTbcfvC2UFP3rthsNaWx8aSY8OIy24nqoERAPhKf9c2pmz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3gcOu5lsZNZskbm2Nl3GL7uE5C+lIVdnSdUn73vDwlZI8Ugpk
	IeH93WU7ZQfzRXIfjzjY084gO/an/ONt573+7s2msAdk+c8xFB090z/ELiL3
X-Gm-Gg: ASbGnctvgaklkRdPgnXmc0ETlJWRh1QdZ0UiO3K1rXb+CMClkdKbrZew/lPFu43mHfI
	GwmLd4iXgRNuYD42+AcjSjeNIIbSElAO/3h9T2TiVoGKDnNiLS+laTqzTjU/U2vajbokqa96Kct
	iLIqPvi+j5/5k7sGDJElMtAK1cKcEx+iDIkQQbPChgq1Zi24jkqDLyXfTxDIIsac/TuDhErETln
	Sp36M5xmfd8xdsrO1YMtyqNVoDTVqtrdA5cpm2H6+2wP/Zyq3RXTsx91rptAnzclCEVeKcUV0px
	dHcJPlIEfw1l10GfBNJcicI=
X-Google-Smtp-Source: AGHT+IE/PCWsD0QjFga2NeWyXkubnzhjEhUFCTZDGGxV7by+nqx19h5myQzusmntGjaaXFib4bRtJg==
X-Received: by 2002:a05:6102:38c8:b0:4b2:5ca3:f82a with SMTP id ada2fe7eead31-4b3d0dd08b6mr15826988137.7.1736679273719;
        Sun, 12 Jan 2025 02:54:33 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b608f86a63sm3741758137.16.2025.01.12.02.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 02:54:33 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5189105c5f5so2112714e0c.0;
        Sun, 12 Jan 2025 02:54:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7LCXL/k3fAi782k0+X+oZrVTF6B4T27JjkbSuMGZyYjoiRKY4DOwffHIK6M4zIKy6VLcGqd36mB2x2d+h@vger.kernel.org, AJvYcCWLWa6hi+2dBonwV2peT+BY0fbQ8wZHhfoBU3KK22NeBBMnCP4YoCdaOOi2i9dk4sSZORbteCA1Bhc=@vger.kernel.org, AJvYcCWxZUz19WAz6+N/r45HmD57uh81NG3PvMviGacp6uV8C83CiScMzqLNID5HTTf+FYvJpIMnnZ9okoeq@vger.kernel.org
X-Received: by 2002:a05:6102:38c8:b0:4b2:5ca3:f82a with SMTP id
 ada2fe7eead31-4b3d0dd08b6mr15826979137.7.1736679272990; Sun, 12 Jan 2025
 02:54:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_6CF6E720909156A227D23AE8CFE4F9BA5D05@qq.com>
 <tencent_F8CFC8ED723F6E8103B4AF3D98D63D7F1F08@qq.com> <20250110080331.04645768@gandalf.local.home>
 <52541f79-ba1c-49c9-a576-45c3472d1c79@intel.com> <20250111120935.769ab9a3@gandalf.local.home>
In-Reply-To: <20250111120935.769ab9a3@gandalf.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 Jan 2025 11:54:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU095ySTFJEs7bvX8kN2kBcnnUkec3hbUxUbJBGf8B=pA@mail.gmail.com>
X-Gm-Features: AbW1kvZA6Tb8TFzuviqQnF-fwAUNvyH5HZEKrzD7_oBtcZOXXyKMxvDdqMHE6SA
Message-ID: <CAMuHMdU095ySTFJEs7bvX8kN2kBcnnUkec3hbUxUbJBGf8B=pA@mail.gmail.com>
Subject: Re: [PATCH] Add short author date to Fixes tag
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com, kuba@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, "Theodore Ts'o" <tytso@mit.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven,

On Sat, Jan 11, 2025 at 6:08=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
> On Fri, 10 Jan 2025 16:21:35 -0800
> Jacob Keller <jacob.e.keller@intel.com> wrote:
>
> > I personally find the date helpful as it can help place a commit withou=
t
> > needing to take the extra time to do a lookup.
>
> I've never found dates to be meaningful. I'm always more concerned about
> when a commit was added to mainline. Thus the version where the commit wa=
s
> added is very important for me. This is why I keep a bare clone of Linus'=
s
> tree and commonly do:
>
>  $ git describe --contains fd3040b9394c
> v5.19-rc1~159^2~154^2
>  $ git describe --contains a76053707dbf
> v5.15-rc1~157^2~376^2~4
>
> I can easily see that a76053707dbf was added in 5.15 and fd3040b9394c was
> added in 5.19. The amount of work needed to add dates to Fixes tags would
> greatly exceed the amount of added work someone would need to do to do th=
e
> above operations if they wanted to know the order of commits.

FTR, while I do not support adding dates to Fixes-tags, I would just
need to make a small modification to my fixes alias:

$ git help fixes
'fixes' is aliased to 'show --format=3D'Fixes: %h ("%s")' -s'

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

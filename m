Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89B13DFC60
	for <workflows@vger.kernel.org>; Fri, 15 May 2026 09:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838102; cv=none; b=QaxldhpJMpTHJ5DaF9Z3/hLgvsgvTM7xqsvsHLLLOGF2kr/xB7H4z1DuC0CVjwiVD7ZiZcPGFG/JTdnCcOnbiXEKTWcbEVOW6aZ/EN6K6OcH6ZeTVtYNeY4Y600thjCEVo9cnj5yC/m3lGQQPtgGMVRxL4NAaAu8pOaF/+Ayn88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838102; c=relaxed/simple;
	bh=Wof7AgSd8sIA/vdyBQ5k/kduJ2ZOxVJGQ1EgYiJEMdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGZnrYKdVyKjiD8U/ngCWLoN0+g+Q09puEjvZUdE12IAtni/795LkkE4H4cBYRtf1SIHEQ2t6mCgAUneIaS/XwSeITefCl+S//Gp6U8iTooXaoFbqvDJTlEqrbVyyu2WHcEQP0YD0MNzrGolZyZUYk4klUqQxNuU//BZcAEvLpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-575171b1ce7so2757535e0c.1
        for <workflows@vger.kernel.org>; Fri, 15 May 2026 02:41:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778838100; x=1779442900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v5QRWoJ9yDPgCZj1zmcAmkVsMq9UQ41W+/TqEWDopDs=;
        b=sTNNbPyAe/ivSPeFUfJlXi/p/ngRSwtkJ/aybRQO+ffGUJnQgk4aG+q49YXzFhNxKc
         lxJymH94oYVtFLp88BhkyIN541Hzv88i8E8JkDZOT8TAm9ilfQvqT3F1CoZiY6DIODRB
         cOmYBbcoPkuqDCQvvcVHG+wteG9yklhDz8UBrYIR1EPfFmetIEMsheRMo9KKSt8f4y1j
         8JnFWllSswPhPnlF+lawQlrF5B4y5/01vHuj9b2CoWtPiZmaLMoT7/VwggsRXy1wdCzH
         sro+ZzxIgSIJxw7GV2Bveyfvtm57ousEXAhtkm8IA/u3QQlIAsoKu0elnfE2kbuHBrhE
         PVpA==
X-Forwarded-Encrypted: i=1; AFNElJ+vR3lnWx/M53PKfDaVFOsIS7jX+OYWEmN13GXZGfCuYkYprg/KTrG7mjcGQYePjYh0qe8e6NVsW3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFLw+bkbwCmywIcwC45fxjGU5a2ACQ7OZtJiawDXP1t+YXFAyB
	KNjh2u0WxiSwZnN+Gs7i3dinQMrAvCQrZYe5Cu/am0Dcy/NbgQK1sX77uxxCD9wm
X-Gm-Gg: Acq92OEYxYPKU/jmTj5CCJK3CCxuq0j4OWCiOvx45bNlmrV2x9OrGW1vJUEF1gLmLmZ
	+WMQXd1csZfzRQ18eK7gVte+g/X0HQ2WS/9IX3UhGNw/io9Spr0f5DGff+hA1nsobTfc1tWS/Rh
	8we/xdi+pcJU0EGaV4ezWrlwVyC4NWb/yhCaKOr9pgy9obcp+jnXjWABvlEMRvtpEMqAdKVE+pO
	Zc803fvVs3fGZiaE7SLEqUdGC7lnrj1fjw0js32KS3/ygIdsUbyuYeJWPiQPcDld6C0III4hYK/
	vlsyoU3ZIpe69fCvpwbqJNTHDnfZVEX1De22P2mX4sx2TKDzK2oZJOp0uNINAFy0n2EobT+hsoo
	05O+5hrRp19x6uJfO9htmJKB+oQgw8Fl0iQtD0AWEWeGbLejZnmEizQyVGuOozA58jCt4FNkcVq
	f2+EtbvaGCPdJosHDrMls347Kh7ys1BrW7czTG0ktB4a9qyLniyZ69v5Mmp5PL
X-Received: by 2002:a05:6122:8b17:b0:56c:db8b:504e with SMTP id 71dfb90a1353d-5760c060419mr1676520e0c.13.1778838099819;
        Fri, 15 May 2026 02:41:39 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760f58eb0esm955473e0c.2.2026.05.15.02.41.38
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:41:38 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6314d2e31d6so2364478137.0
        for <workflows@vger.kernel.org>; Fri, 15 May 2026 02:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ92N5g1DIZfLlTBGz1tQnYa1K/Z0RL++wrKsqKqA+RTgwCn9Tpg3vbBHStFdaHyHdl+4OopX9h7LLQ=@vger.kernel.org
X-Received: by 2002:a05:6102:6058:b0:62f:406b:1baf with SMTP id
 ada2fe7eead31-63a3f592865mr1212495137.20.1778838098416; Fri, 15 May 2026
 02:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514163033.108009-2-manuelebner@mailbox.org> <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
 <CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
 <CAMuHMdW12mAV2YROUiFLoKKmtNS=tYNZs7pWN0e4wTKkSMA2xQ@mail.gmail.com> <20260515103128.323da7e4@pumpkin>
In-Reply-To: <20260515103128.323da7e4@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 11:41:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWZ-WuD6Sq1BMS5eGm+xLm1Kr+C+AtkXmFjfkhk30SWZQ@mail.gmail.com>
X-Gm-Features: AVHnY4KVvgbTckqXRqXJl8Bd2ZRL_yVxqSUWHvERpCogGm0yfZ4-yEUQ2KLTAjI
Message-ID: <CAMuHMdWZ-WuD6Sq1BMS5eGm+xLm1Kr+C+AtkXmFjfkhk30SWZQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
To: David Laight <david.laight.linux@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Manuel Ebner <manuelebner@mailbox.org>, 
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, 15 May 2026 at 11:31, David Laight <david.laight.linux@gmail.com> w=
rote:
> On Fri, 15 May 2026 09:32:06 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, 15 May 2026 at 09:31, Andy Shevchenko <andy.shevchenko@gmail.co=
m> wrote:
> > > On Fri, May 15, 2026 at 10:23=E2=80=AFAM Geert Uytterhoeven
> > > <geert@linux-m68k.org> wrote:
> > > > On Thu, 14 May 2026 at 18:32, Manuel Ebner <manuelebner@mailbox.org=
> wrote:
> > > > > add kernel-doc comment to strlcat() function definitions
> > >
> > > ...
> > >
> > > > > +/**
> > > > > + * strlcat - Append a string to an existing string
> > > > > + *
> > > > > + * @dest: pointer to %NUL-terminated string to append to
> > > > > + * @src: pointer to %NUL-terminated string to append from
> > > > > + * @count: Maximum bytes available in @dest
> > > > > + *
> > > >
> > > > Missing "Returns ...".
> > >
> > > Documentation says "Return:" as
> > > - the section (note important colon)
> > > - the singular (however plural is undocumented and supported)
> >
> > Trailing "s" is not always plural in English ;-)
>
> It is for 'Return' :-)

In case "returns" is a shorthand for "return values", it indeed is ;-)
I meant a conjugation of the verb "to return".

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

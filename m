Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088647;
	b=QcVo74VyAz3p2hT8PVFBcDSleOaJ3SnIrbBq7eTqRVKrPJBfhjXH97kOnIAHgUBrweeA
	 eDl6T22WwXH5GFNnj2GedzB3ezAAMCY6zTuM8v9sVjkrKuyvVU0uXXfcOsEAsg6UYO8Ry
	 lqhvNBhgJpvHsbcVI/sYzLi89SE1PnYlMiUml96QrFOxvzaTDWWEy3e5r8Qw0tyHDDRDg
	 Db0Y377dZ7tSkrOsl1TTKdc+uT0VGtlOpsyJjDunguSjnb6iIZnjjKVQGMjIBJbTcbds0
	 OMw3pYtBrcD+Fcyino7Rjvi+GxRBoQW8WflowI4Sp9rxg+o/YyupqK1X6fc07960HAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088647;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DnTyS8CiLp9kXhmJQ0XYx6IOZxT93PhaPAXeNnfkOEs=;
	b=L4LHSLtgWWiKJ/1xA6GadeCJOzjl05uIyjxhwOcDl2dcXexmzKKsaTOQVya2MAcMUHJy
	 v96ZDc6/iMvlnwdRveSAbjp9+C+fyKlXXtiMWTTwSQhj2ccFy9eC5kXrrKcBBWthNPBcP
	 FFUuCHX+1L7TCAgPI5PYfu/DrLoK6CXx8mSTbpg1u+pe/VuYa7QQHMdYKdejU8/TSno5t
	 AEzLYettAE8dLGzCmZ/1JSAgrU8iXHVQHLq7G2DtwIRc9NytLyNuWX/TTZfa78VL+1kwp
	 jWI21lrsCjgE1dQKhnKzvlvJ7sOgWTQHvNut34f4k6afJStys7HhapWxoM4GtlD3/JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D89E606A328
	for <workflows@vger.kernel.org>; Tue, 27 Oct 2026 08:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D89E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cccb2c96d0so778961137.0
        for <workflows@vger.kernel.org>; Tue, 27 Oct 2026 01:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088646; x=1793693446;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnTyS8CiLp9kXhmJQ0XYx6IOZxT93PhaPAXeNnfkOEs=;
        b=mI0SMBs1X739ZwclN4Ry76vW699GLDxZ13GOzaomgcVGTy8ZoYVZzwEUgCo0yXB1iq
         XHL29dQIz4aetax4Fs48kQyJ3kxVvjIyMqq6ogfo+7DH2ahrdcKBmSO5mSIgAxN+Jshg
         R3wf6UVen/SJ/128k/yzGAZejZOaEQakmuy93YfFVBcUXsAQ3PuR8p0z4stYUmnIbJZ2
         WTyPEBHpfeAGwfkOi1cHA8+CEPu9PdUL+9GCf3cMBQ1+w3hxrQUjtZU+gc4TZofCaKqL
         63Nw9dpIH6AR5kH/xfS+I5gH8WOhVacE30+QQSPJWw4MOv2IEf/uDRm9AjAj7z86XHKp
         8cww==
X-Forwarded-Encrypted: i=1; AKwUvBwoY2cZNIwJwSN3WqxcsqGfdWmsy5kd6AkWfLd0xIrsTi6dGpzn82/xb4jV4eNhMhqiDqK6lg+IsZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhIQaVnSJUB3icST3diqVrKzXfQqHIxvDAKoSymjVNsV/h+0Dn
	wbq+CRRl3+37qPW1p6hMeJVF70G9DECo798uEYRSHV8jEE9iaKgiMcG/aOlGw7Zrf3k=
X-Gm-Gg: AYBFou1CZNulXdS7yUojl61qscAofhe4qlrJu2zo6Od3/fm54b2IPs6NkGFXomuc2i8
	uzGBNuXTc9gzioXQLD3dwH4zgtIRYIIXTmyJExYk2WbS2yWMooBxn/0TQeMwBrqTvzXh5VUMAum
	GotC3XBsCbAQr6+evJ9uhX5HABwOUIaoTjr717rPE4JSNx38HFFKprWBKejZSb6qMUcBlxBLunE
	o/SpBBRtAyaHeMJL3mspfdDHe4dwx00VTNSdt40e91ZbxJmWzjyt57k7Vplgs6IUfk6JTjqjTyq
	MuDoLMNk48apf41aDuQiriKOpkyIHNuh/N5n7dnCOviNBJ4bvUEa3pkMJjTyne3OHGUPYetWDJf
	gc1776VrcscaOXB1f3nIkkY8vuOrwCn52CSbuREUT7OpgnupXo9t3jUQWTyjgov6a7SuVYeXhHt
	gt/8ktSIpEGZWPDuiDtjUtx+4FHMQXFGza9dfUP5sbWF9SCCVhAUMYbbu4ZxYRH6t3J8DhqZvn3
	ZCZGqFyzmJ0AmNupv2ftJYYnsCoM2gTisHq1GEGylqL/oQhX54fYYtql3/avV4KOYS3dszrE0t8
	nJYUmjNjaSXoELbkjg==
X-Received: by 2002:a05:6102:3e89:b0:7cc:2b48:cb1b with SMTP id ada2fe7eead31-7ce5ce76692mr3321653137.35.1793088646178;
        Tue, 27 Oct 2026 01:10:46 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3caf553sm1660205137.7.2026.10.27.01.10.44
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:10:44 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so894663137.1
        for <workflows@vger.kernel.org>; Tue, 27 Oct 2026 01:10:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzNGXNBVC4z14fuLFoKpriywsLPpLgJmwkKc+cDAdSLzVwkgAXtZNiHPd5xrB389uZK7enJEUVCixY=@vger.kernel.org
X-Received: by 2002:a05:6102:6a85:b0:7cb:288a:b68b with SMTP id
 ada2fe7eead31-7ce5ceb4cddmr2598661137.37.1793088644228; Tue, 27 Oct 2026
 01:10:44 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020212235.1143086-1-ebiggers@kernel.org> <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol> <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol> <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <CAL_JsqLA2F0oB=7LsoxZe-=AboOJu7FotpMACNsuV==jGWB8nw@mail.gmail.com>
In-Reply-To: <CAL_JsqLA2F0oB=7LsoxZe-=AboOJu7FotpMACNsuV==jGWB8nw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Oct 2026 09:10:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX22CEnzQr8MuVftdVK23=ZpGoomGQuM-H8pw=x-Fsi-A@mail.gmail.com>
X-Gm-Features: AclHuK_1hOMOvqhIVfJ47rUg7hn4eoGYJnc5iIPXkduWeAV9hHcxdetyXE5uQ4g
Message-ID: <CAMuHMdX22CEnzQr8MuVftdVK23=ZpGoomGQuM-H8pw=x-Fsi-A@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Mon, 26 Oct 2026 at 21:12, Rob Herring <robh@kernel.org> wrote:
> On Wed, Oct 21, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> > On 21/10/2026 08:49, Eric Biggers wrote:
> > > On Wed, Oct 21, 2026 at 08:41:47AM +0200, Krzysztof Kozlowski wrote:
> > >> On 21/10/2026 08:39, Eric Biggers wrote:
> > >>> On Wed, Oct 21, 2026 at 08:26:28AM +0200, Krzysztof Kozlowski wrote=
:
> > >>>> On 20/10/2026 23:22, Eric Biggers wrote:
> > >>>>> -Make sure that base commit is in an official maintainer/mainline=
 tree
> > >>>>> -and not in some internal, accessible only to you tree - otherwis=
e it
> > >>>>> -would be worthless.
> > >>>>> +    If ``git format-patch`` with ``--base=3Dauto`` (or
> > >>>>> +    ``format.useAutoBase=3Dtrue``) can't detect a base commit, e=
.g. due to
> > >>>>> +    the current branch having no upstream tracking branch, it ex=
its with
> > >>>>> +    an error. In such cases, pass an explicit base commit to ``-=
-base``
> > >>>>> +    instead. This is also needed if git detects the wrong base c=
ommit,
> > >>>>> +    such as when the upstream branch has local, unpublished comm=
its.
> > >>>>> +
> > >>>>> +The base commit must be in a well-known public tree, such as the
> > >>>>> +subsystem development branch the patch is targeting. See
> > >>>>> +:ref:`obtain_a_current_source_tree`. Mainline or the latest linu=
x-next
> > >>>>> +can also be acceptable bases, depending on the subsystem.
> > >>>>
> > >>>> I disagree, that's pointlessly too hard requirement.
> > >>>>
> > >>>> For many of my contributions base is obvious and not needed to be
> > >>>> explicitly defined. For all the patches I accept, answer is the sa=
me -
> > >>>> base is either obvious or if not and patch does not apply, then th=
e base
> > >>>> does not matter.
> > >>>>
> > >>>> Requiring it is just bureaucracy without actual benefit.
> > >>>>
> > >>>> The only benefit would be if maintainer COULD change its base to a=
pply
> > >>>> some patch with odd base... but this cannot happen. Maintainer bas=
e is
> > >>>> fixed - it's the HEAD of his development branch for given category=
 of
> > >>>> commits (e.g. DTS branch for SoC maintainers).
> > >>>
> > >>> There are many use cases for applying patches besides the final pat=
ch
> > >>> acceptance, such as review (by anyone, not just a maintainer), test=
ing,
> > >>> CI systems, etc.
> > >>>
> > >>> HEAD of a branch is of course not fixed, and changes every time a p=
atch
> > >>> gets applied.  That's especially relevant when wanting to check out=
 an
> > >>> old patch for any reason.  Trying to guess a base commit based on t=
he
> > >>> date and patch subject is a waste of time.
> > >>
> > >> All these tools should just work on top of linux-next. Requiring peo=
ple
> > >> to add base like "next-20261021" or "tip-of-obvious-maintainer-tree"=
 is
> > >> pointless. I understand that base is helping, but helping and requir=
ing
> > >> an obvious information just do not go together.
> > >>
> > >> So again: base has ZERO meaning to the maintainer process. It has
> > >> meaning to tools, so fix the tools to work on known and obvious tree=
s.
> > >
> > > So what is your proposed algorithm to apply an arbitrary patch when
> >
> > Already provided that, so to recap:
> >
> > > there's no base-commit?  Including any historical patch (from
> > > months/years ago), patches with dependencies, etc.
> >
> > Dependency is something else, but for every other patch:
> > 1. For testing/CI: you apply on top of next
> > 2. Every other case the maintainer knows where to apply it, because it
> > is his HEAD of next-branch.
> >
> > I am repeating myself, but I really had no single problem of lack of
> > knowledge where to apply a patch as a maintainer or reviewer of some
> > subsystem, thus maybe I do not understand the actual problem you are
> > experiencing.
>
> Look at our DT PW. There are numerous patches that don't apply and
> then we silently don't test them at all. Here's one example[1] (3

That's a false positive, as the first two patches (the ones that really
matter for you as DT maintainer) do apply to yesterday's linux-next ;-)

> actually as the whole series doesn't apply). The more base-commit

There are indeed patches in that series that cannot be applied, which
is explained in the cover letter.

The problem boils down to how to present work that touches multiple
target trees, and where some parts depend on other work that is
not yet finished. Do you post it as single series, so people get an
overview? Do you split it in multiple small series (which may still
have interdependencies), so everybody looses context?

> [1] https://patchwork.kernel.org/project/devicetree/patch/8b2c7719c301a44=
5891fc6c5309456327ec8a94c.1793026273.git.geert+renesas@glider.be/

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

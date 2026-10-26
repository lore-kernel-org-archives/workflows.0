Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023370;
	b=fL4P1sAsprdibQxKlshUaSg6LVBtTmv9uTURn9qJxNuylhSI5PBBZsOCkZKJXBcjLjQv
	 dEiXSEHiE6Rq7KF32YZQtm71KzBHXexMhh9D1zmB0+lsH1tbkdHe8FdC5RedDJAZtxYY3
	 QtmITlr8psCxaAWPzJFTA+kQXfPEn/FKJo4bpjzrc/KTE1oHdkBRo1w16+fVXyXUzWmiu
	 +OlAalWsEeKB08AmEVfMRfzrZ7GqwIrwX9aJptwmmJg1ONcK8WC8WibwshsRzJAU0UvDm
	 zkJQoA3Mcp393uvrkQBRQgBiCISnY9A9YYJYRnqVOoH/5Hmu/mgULQOf++iY7XeayOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023370;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=DMhcNiE7UFYB2cSErcXu0ACNivDw3qmsy4U7nmgAHio=;
	b=Jys3WgOsAUpkkX2mKiFBf3Eif1GBJc1JjV1Tfsi+Bf4G1fjRI1Zfh2Qi0vYQQDzY+f8I
	 Dh/7T61dwNR7TxzC5nVRMuDsmBJNyGar/NpfcLMA+LtfQGF5zEvnNgchQadr1lArbE5TH
	 rNJvaUYPJ2g6FkG/XHZZn3UCnMsHaT2lU0diGU7KtC3wJ7XpSGV6G9cT5OwGulC0U9WRx
	 TXqFwBIvgmnsxGOx845XZKe6jICVsH+dXJGkYNkdmLw5uEyakFrevxuzYrZ6obBZJf37g
	 vPVpSu82DcDU/JYzzRyDLBIzNOVe8pdYk9lAk+KpEPX+O+q10kizseZOoGRJcn6AbtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36936606A31F
	for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 14:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36936606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so3880191a12.3
        for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 07:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023367; x=1793628167;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DMhcNiE7UFYB2cSErcXu0ACNivDw3qmsy4U7nmgAHio=;
        b=byuDh7H7BJX71hRS4CbqwIe31dvvoMYXacDlUKYPvp0XBUIxOD05zIlxgqWxv+aJkG
         UjqAN4eNO2pkWX91pZ/+lWxwSfAyZse+dcm61CSzf/LfeLrtfAgJ9IxMrk0gzIkKJbRL
         2QRdz8QxQq3yDRkM8tW5T7k6XlOvq60dj0m7RXz+CxoeAiudegw7kWbo9aCOMWJKO5u5
         iaOAxdlWRUYILdzVK+gwEfPwTOtw3dRpfV2SQ+NEyGqrK3VaVTgaApsznviVZGdnd7Q4
         tKF0ff79FAnqbd3czndHLBCjHmd9FheYxXxRjWpFAcCZm81x+G5kOb0BpAeUSWyVxxRl
         uMtA==
X-Forwarded-Encrypted: i=1; AKwUvBxUTaP5vAyfZcdAD1KClkOSliKrYoDHy/QwsOjF7VeAHaxqA5HdPJs5zDbhb6y5ytqpw/m/7bB5tkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVQusnKsPhc2NLgRLztAO8xxFy1ZIZLAS85guMscVNsHVnkG0M
	TQZKYR/+ws6AEUqAWCmJByjnT0ieAwKbOcEKjUV/CJC+mLKf5w/UL2CryABu4lOgYCU=
X-Gm-Gg: AYBFou2cmTQAYNTH1V98kBLE9Ar2ESEoY3PBvI4E295fjLFxGaF4CvaS+lfL1exCbg7
	GcQmsXycNtCSy7Ti79ofM9iPIArXmsWiaQ92PDWgjSTfZGGOEBn5wk/3EClIYVy7xvLI/b9edtA
	Fqt4ewybfbZboNpoi7Tfgdesva2bp5bWPYYdEuPXfl1bWqk7tjaXmxQrEh6xL6pANj7yKPXWK7y
	NmkJ0Yx9KEmEhdKPMdHQFecMbqpUrIDF5pGvRN5zDP0Aombl26M0Igsk0DmGZ6SFtcTa/qbxELX
	PSBRz/bPW8jhm+x+55EDGoFJmVtKDr0VLJGyfzSrXIzFtPHGCS7+XSHVxA31tMcSzB6F4TeaF0z
	ztzXJ9spVeXwSpRZbvOTiU3NlKOW7fjCLx7WLgefXrs2Ln7qwv2Y/eJ2/wm+rxcrOv2ROXfx93m
	pkaxwIFucC0HpcoQR+oB3q5p5e8gGMj6mOu4o6mU6skWY8wc9dryhF2HAYpSPFkeuCPQWFc/21U
	XqJfZP8vkrMk0jpFy0RIAIIPAlpKAMTpzC1awjWXD8mO/W+gMkxksd18MYercE5GjpROrnqsevV
	xLFZnMB2H8wEcKXfLA==
X-Received: by 2002:a17:907:6e86:b0:c42:e6c8:e494 with SMTP id a640c23a62f3a-c46bde8d6a4mr763125166b.37.1793023366179;
        Mon, 26 Oct 2026 07:02:46 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7984e9sm322152066b.74.2026.10.26.07.02.42
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:02:44 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c2e8c710847so363362466b.0
        for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 07:02:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQjwSTOhgHnt9kVp1TqraJ5FihqL+7Cw0rM7NKKkooIJndNoeUD79/FZDwTAbJtGwQydXsad8DYDo=@vger.kernel.org
X-Received: by 2002:a17:907:6ea5:b0:c40:5ee3:8698 with SMTP id
 a640c23a62f3a-c46bde6b2f6mr794454566b.31.1793023362379; Mon, 26 Oct 2026
 07:02:42 -0700 (PDT)
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
 <20261021163242.GB325924@killaraus.ideasonboard.com> <73d01869-b536-4fcd-a139-6f9d0a043347@kernel.org>
 <20261026104056.GH15441@killaraus.ideasonboard.com>
In-Reply-To: <20261026104056.GH15441@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2026 15:02:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
X-Gm-Features: AclHuK_QORKnSpnPhJrLo9VkZNodz3Epw-au-jT1DhXUiuoeiO-TMI6o_74xEFM
Message-ID: <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 26 Oct 2026 at 11:48, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
> > On 21/10/2026 18:32, Laurent Pinchart wrote:
> > > On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> > >>
> > >>> there's no base-commit?  Including any historical patch (from
> > >>> months/years ago), patches with dependencies, etc.
> > >>
> > >> Dependency is something else, but for every other patch:
> > >> 1. For testing/CI: you apply on top of next
> > >> 2. Every other case the maintainer knows where to apply it, because it
> > >> is his HEAD of next-branch.
> > >>
> > >> I am repeating myself, but I really had no single problem of lack of
> > >> knowledge where to apply a patch as a maintainer or reviewer of some
> > >> subsystem, thus maybe I do not understand the actual problem you are
> > >> experiencing.
> > >
> > > When I review patches, I often need to apply them to a tree, mainly to
> > > see the context, but sometimes also to test them. I have encountered
> > > many cases where the patch wouldn't apply on the current for-next branch
> > > of the relevant subsystem. That's often because the patch had
> > > dependencies. When I'm lucky they are listed manually in the cover
> > > letter with a link to a branch, but that's far from being the common
> > > case. I then have to ask the submitter to provide a branch, or enough
> > > information to recreate a branch. Having base information (base-commit,
> > > prerequisite-patch-id, and possibly base-tree) would save me quite some
> > > time.
> > >
> > > I understand your concern about maintainers cherry-picking and sometimes
> > > introducing issues as a result. In that case I also prefer asking the
> > > submitter to rebase, retest, and resubmit. That's not what I want to use
> > > base information for, in my case it helps with the review process.
> >
> > That's valid and for 95% (guessing the number...) of cases will be
> > solved by having linux-next as a base, thus requiring the base
> > information is redundant. It's just linux-next.
> >
> > When patchset does NOT apply on linux-next or maintainer tree is
> > non-obvious, the base should be provided, but that is only "if ->
> > should". I think the proposal here is a bit different.
>
> What's the downside though ? As git can easily provide the base
> information once configured to do so, what's the downside of asking
> contributors to include it ?

My base is usually not in your or anyone else's tree...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

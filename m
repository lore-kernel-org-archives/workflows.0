Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029062;
	b=pC0lQausymkplS4ZeTeeMC+z/QHE1x4MRVAiBweWPMiLEcVaBQm0Az6a/7ssJ95/db0q
	 D/6m59lX06uRS4w6bViip0iSUevifmxdwmXy0CN1ewDgc9qbQsgrD0O+BDKm4ezrRXUma
	 SgNoN1p/usSTkYYB5Tebb7dCvtys+tEMGdknU0In2MyG9khk01/sBjLkm/b4tbu/M61gA
	 7S10Q48jab6METu2SiGcpAZzxhjEUI+eP4OQHyKH+JvmY+3kicSZ/GxaSeKNtXNRLjF3C
	 l3moms8e1P6vVpxKpcZKP0JxnrGTfuS+UefjvPFIBmt5E1H2blNXEgrdJyR5taTKTDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029062;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/PEvxgbJJKZEuYVwcskTn7V7+CdtxzeB5F8EsgIEQd8=;
	b=f8x5V4kj75aVWM6dAyDSVpAMs7JGltJNXB7dxJM5W4uqjfqbCGQtJmOQqnTa2vQikEMg
	 8cdbu9lNI+j9jduumjIWpEsXunV60DSX4unXULWey3/U5T2RyczIO7ple8pTIyOndIvJv
	 g2JzpIoN6u7AU1OfKDnujvF+T8iaxynGOijZhuLp1Rpf+FfhOcaaoVdEq8RSzQeldPr9A
	 FSFd2Rk+BLNcnmwGnLeDm7vx/1YLe6vuO0/llRjqlmdd+AxlMb7aX96mNXAJRG985Q3up
	 TH+g6bSCX2uyuh3pch5dK8icr/ucxG0UmDJNjE+W6Y7ej4jcofzkqfBK8RX3nu2KxtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA04606A31B
	for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 15:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA04606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-77bf892b496so997906137.0
        for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 08:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029061; x=1793633861;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PEvxgbJJKZEuYVwcskTn7V7+CdtxzeB5F8EsgIEQd8=;
        b=cefMXG0NJNlzEmhvssaGQ3ZOVdQqAp73QTBnpVqE3sC5HPvfmKlKL0Vq9xtMe1ytW9
         jga4UZ31th1dtYkqWhrmUUY2Wd+aCului2EqW3Buw3CT9McX31eO0ur+xbNNzwzz8jHn
         WFd0DY3LmxSm5v8vrEy4a70f9c0HacyMZk8IpXQW0VmfFSWtBjGYZhvLapk6rMfJDHXt
         BRZgTBk1K2WcVY7cuoO67qEUfaFp+3aFEIyZuqPPkgrqTWSllzEqtQU+dn3ZdlGrknv8
         lI3zHSC1ZJC683YOLo3AQloD+wUBrnzu3qr/cQ/cY6pYSBX/G2lD3sFIqoxl6kLbYyFY
         QMUA==
X-Forwarded-Encrypted: i=1; AKwUvBxTJ7UDtQf1YQJk5ZFctspX+eNyDVAyLt2peixs5nOmu1heeqFRQyLoegiRF/HdV/ijF16Ss7Nzt8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYD1KfvdnERAXIFgj3KQaRyFXCYDdnxap6Wuswan1v+sFYZHJ8
	PW3no0I0ZSvgzils5E7MjrrZN7GgBHrnyGgbv1lrAS+m/V4u6CaNiDifWtKPzaC5cdo=
X-Gm-Gg: AYBFou3k0T4OAV2eeBe6o2F/apqElj0wl3q896RUdtQTPSmhcL+yM3LAimL+tYoE/zq
	fbDXvWq7UzHJPUdliPzPn5uFG7clOPrh6MPAVZDSzyF6QSwxyfHiqU2hR2R3NO20kmdEXHI+CqV
	5xC5QtrP+kIZZKccsznFlSqZ/P2L2x0kKl2+5wo9VHcs6CRMwwnlmCx8mh0WCK/chTdoZGouiZN
	vi3qr+B+Pl2twwOzEpqsWIGz1aQZh//w7WhOhf+z2PAgB3kG1SHcqSfsh1rnHJpkGkEHvLxcU+I
	fkg9/2LGkxPnCacz8KItjh3LfpVJV5wVCcIrVcsMjbpiU8a2qJtVsr7+oExZotfR7EO3awl3q1y
	55ZyLLK4psDYZPCVL2CqhZKhDPynOw775phSNYR8Ic3iI3osaOdfF/222GQLmPOdFZvtZPd7PjV
	UTJOxjgVb3FMEjcyW0NYoZvJNVkavN/LFGR2jjwllsg1GC9lEbRxT0/tiIqr5Kh3wgxc1TtlcL/
	pRNGR+NIrFDZNX614okeYEJivR/W23pK3aa5faLHXnxpOprxc1mDHeuxP9YpSkXv/b35sQ2PaEw
	Rrz9NnscKGSKTYUIkttg7g==
X-Received: by 2002:a67:e114:0:b0:7cc:2c29:54ef with SMTP id ada2fe7eead31-7ce5cd3482bmr1542473137.19.1793029060895;
        Mon, 26 Oct 2026 08:37:40 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b7069sm8746545241.3.2026.10.26.08.37.40
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 08:37:40 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eae12762c9so1426351e0c.1
        for <workflows@vger.kernel.org>; Mon, 26 Oct 2026 08:37:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwn0JJZWUzOc+ewKad49M9GqWi/6Lb/0JTIzuSIX3zm9S1A4y9BwW2I88XNFwp7eYm3BkPvmPaZ0lc=@vger.kernel.org
X-Received: by 2002:a05:6102:f86:b0:7b4:bdf5:9307 with SMTP id
 ada2fe7eead31-7ce5ce24986mr1893457137.30.1793029060367; Mon, 26 Oct 2026
 08:37:40 -0700 (PDT)
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
 <20261026104056.GH15441@killaraus.ideasonboard.com> <CAMuHMdV7Mz0WgaNP_B8FG6OxLBqqnWwMqWJKNFBDkF2i=55fVQ@mail.gmail.com>
 <20261026145343.GC1001933@killaraus.ideasonboard.com>
In-Reply-To: <20261026145343.GC1001933@killaraus.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2026 16:37:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdOAYifLgmeguqMwE4kkyJ8NDbA4niZkuEUMYBPxBBSw@mail.gmail.com>
X-Gm-Features: AclHuK9NkUp6rJz4jccHSR8LbKSfbJD7mhN8jXTqeuqbOAgqsCvTqyecvNO-blg
Message-ID: <CAMuHMdXdOAYifLgmeguqMwE4kkyJ8NDbA4niZkuEUMYBPxBBSw@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 26 Oct 2026 at 15:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Oct 26, 2026 at 03:02:27PM +0100, Geert Uytterhoeven wrote:
> > On Mon, 26 Oct 2026 at 11:48, Laurent Pinchart wrote:
> > > On Thu, Oct 22, 2026 at 08:57:55AM +0200, Krzysztof Kozlowski wrote:
> > > > On 21/10/2026 18:32, Laurent Pinchart wrote:
> > > > > On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> > > > >>> there's no base-commit?  Including any historical patch (from
> > > > >>> months/years ago), patches with dependencies, etc.
> > > > >>
> > > > >> Dependency is something else, but for every other patch:
> > > > >> 1. For testing/CI: you apply on top of next
> > > > >> 2. Every other case the maintainer knows where to apply it, because it
> > > > >> is his HEAD of next-branch.
> > > > >>
> > > > >> I am repeating myself, but I really had no single problem of lack of
> > > > >> knowledge where to apply a patch as a maintainer or reviewer of some
> > > > >> subsystem, thus maybe I do not understand the actual problem you are
> > > > >> experiencing.
> > > > >
> > > > > When I review patches, I often need to apply them to a tree, mainly to
> > > > > see the context, but sometimes also to test them. I have encountered
> > > > > many cases where the patch wouldn't apply on the current for-next branch
> > > > > of the relevant subsystem. That's often because the patch had
> > > > > dependencies. When I'm lucky they are listed manually in the cover
> > > > > letter with a link to a branch, but that's far from being the common
> > > > > case. I then have to ask the submitter to provide a branch, or enough
> > > > > information to recreate a branch. Having base information (base-commit,
> > > > > prerequisite-patch-id, and possibly base-tree) would save me quite some
> > > > > time.
> > > > >
> > > > > I understand your concern about maintainers cherry-picking and sometimes
> > > > > introducing issues as a result. In that case I also prefer asking the
> > > > > submitter to rebase, retest, and resubmit. That's not what I want to use
> > > > > base information for, in my case it helps with the review process.
> > > >
> > > > That's valid and for 95% (guessing the number...) of cases will be
> > > > solved by having linux-next as a base, thus requiring the base
> > > > information is redundant. It's just linux-next.
> > > >
> > > > When patchset does NOT apply on linux-next or maintainer tree is
> > > > non-obvious, the base should be provided, but that is only "if ->
> > > > should". I think the proposal here is a bit different.
> > >
> > > What's the downside though ? As git can easily provide the base
> > > information once configured to do so, what's the downside of asking
> > > contributors to include it ?
> >
> > My base is usually not in your or anyone else's tree...
>
> Hence the prerequisite-patch-id and base tree information. Or do you
> mean your base is not public at all, neither in the form of a branch
> pushed to a public tree, nor as prerequisite patches sent to a public
> list ?

Correct.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

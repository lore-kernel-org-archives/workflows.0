Return-Path: <SRS0=qi7Q=4Q=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A81AC3F2D2
	for <workflows@archiver.kernel.org>; Fri, 28 Feb 2020 17:54:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48F002469F
	for <workflows@archiver.kernel.org>; Fri, 28 Feb 2020 17:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582912456;
	bh=jVBzFOsqJxx1L2ueyayEEOX3GgO9prMM+TiChprSJpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=tLoOQV9bI+SWvow4S2lFgYPXPVUHaQiEEpYt0Ssk37CmX5+oJ7tYal+Qil96F26U8
	 zo3fcPV0zNJH+pcp9KzHHmU4M6EDqwS08Xl0KKjFXJRIGM5bo4vgCTwYUc0AcoTAER
	 r+cwV+sGhpza5RK5gJoWz+ybLnl59aZl4XddT2qE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgB1RyQ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 28 Feb 2020 12:54:16 -0500
Received: from mail-wr1-f45.google.com ([209.85.221.45]:33897 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgB1RyP (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 28 Feb 2020 12:54:15 -0500
Received: by mail-wr1-f45.google.com with SMTP id z15so4005521wrl.1
        for <workflows@vger.kernel.org>; Fri, 28 Feb 2020 09:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=vd3oApHcOqNzVoNYFgWpTAeT0iB472Ap8r5W/c+DMKo=;
        b=HfjtK3IWS5WjtWofWpODGo6Ggj9D3grc/GgvMeT1CEzIQ8ar0+fs2+HoFQhP/QJVeT
         b3H8Kh+RcsLkIIq+ctgHPOsWImxbe7KNSJcMnh0YzpqCSLPwYMp0+A9gyWRCsqw+GkdW
         bxOPz2/0X3eN3wMMJ/dpq/ZjzGEYvYzG3G2qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=vd3oApHcOqNzVoNYFgWpTAeT0iB472Ap8r5W/c+DMKo=;
        b=MzumNFwR/K/+ylB/GeXrSvPaEfNyvWY/9c2dQsfHmTwlRXOdVFU+Hhmv1odFgYbZbL
         /hK/Vg6D2TZAMU/MrujWp3kJbUW+BkQuf0rMQch4a8zOIeMqRtuWeHQMWI1uCzPPcwVH
         1gZSJXku8brwKGzJC+NII9mZ8rzNa247q8T583o2xR0YxnR0w6c/nCPiZIAepJt+NjmK
         vYw18DZAQMvt58p5XROtgDJS/2IK00hWYx/Bjimcl8ajvVxblPLo9WuaragTkUpQkTcs
         GgQzXuJwHyKgvWxOB9wuJeLtqSDcxYkqgXEyD+/AcVjJ/rLP5Rym7+hlK4XLlUUzz2ve
         2CbA==
X-Gm-Message-State: APjAAAV7nM0tn2JGAeL5CPyWMrse16XCAkY/P16wkckPaimS1xai3YZk
        RxDOR4XulruPCI20PS2vu+43NNJyfSBEng==
X-Google-Smtp-Source: APXvYqwSstMsZB2Q8nFEu1/VJ76pgYomx9/I6Q3woTON4DKEzIWcP/e+J6LzZf73VWYDpfKd5EmGAg==
X-Received: by 2002:a5d:5301:: with SMTP id e1mr5508064wrv.44.1582912452456;
        Fri, 28 Feb 2020 09:54:12 -0800 (PST)
Received: from chatter.i7.local (tor-exit-12.zbau.f3netze.de. [185.220.100.251])
        by smtp.gmail.com with ESMTPSA id h3sm14224912wrb.23.2020.02.28.09.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 09:54:11 -0800 (PST)
Date:   Fri, 28 Feb 2020 12:54:06 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     workflows@vger.kernel.org
Subject: Re: Patch attestation RFC + proof of concept
Message-ID: <20200228175406.tnxcvoyhfsppdxyr@chatter.i7.local>
Mail-Followup-To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
        workflows@vger.kernel.org
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
 <20200227041144.GA36493@zx2c4.com>
 <20200227142935.4ulyjoodgyeu4uoz@chatter.i7.local>
 <CAHmME9rkCgQwUnwUoOCzDzLi1biECs3ZwzApsPDKXykKPitZew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9rkCgQwUnwUoOCzDzLi1biECs3ZwzApsPDKXykKPitZew@mail.gmail.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Feb 28, 2020 at 09:57:47AM +0800, Jason A. Donenfeld wrote:
> On Thu, Feb 27, 2020 at 10:29 PM Konstantin Ryabitsev
> <konstantin@linuxfoundation.org> wrote:
> > This is why I've been keeping pgpkeys.git repository around.
> > https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git
> 
> Ah, right, that seems good. There's also signify, by the way, if you
> ever feel the urge to jump ship from pgp. We can add cgit support for
> it too.

I like minisign/signify, but not for this. It would be a great addition 
to signing tarballs and other project releases, but it is poorly suited 
for inter-developer attestation, for the following reasons:

- There is no key management framework. If I lose access to my key, or 
  it's stolen, or whatever else, I have no mechanism for revoking the 
  old key beyond sending out a "please don't trust my old key." PGP is 
  not great for this either, because we have to rely on the rotting
  remains of the keyservers network, but at least there is *some* 
  mechanism for propagating key revocation.
- There is no support for cross-attestation, so owner trust must be 
  bootstrapped via some other mechanism -- either via TOFU, or via 
  delegating it to HTTPS (I trust that this key belongs to Alex Dev 
  because I downloaded it from https://alexdev.foo). Everyone likes to 
  dump on the Web of Trust because it is hard to grok and can't possibly 
  scale, but for niche applications like development communities it 
  actually works reasonably well and serves its purpose.
- There is no support for offloading crypto operations to specialized 
  portable hardware tokens (Yubikeys, Nitrokeys, whatnot). This means 
  that unless you always protect your minisign key with a passphrase, it 
  can leak off your disk in any number of ways (careless backups, 
  fat-fingered rsync jobs, vulnerable browsers, etc). If you *do* 
  protect your key with a strong passphrase, though...
- There is no support for any kind of PIN entry agent. If you need to 
  invoke minisign 50 times, then you will be typing in that passphrase 
  50 times. Or you will be copy-pasting it, which means it'll be 
  floating in your copypaste buffer for hours or days after you're done.

Sure, the answer to many of the above is "provide wrapper tooling that 
does what you need" -- but if we provide that kind of tooling for 
minisign, then we will end up with something that is similar to GnuPG 
and everyone will start hating on it just as much as they hate on PGP 
(me included). :)

PGP sucks not because its core concepts suck -- it sucks because 
implementing delegated trust in something resembling a secure way is 
super hard to do. That, and because GnuPG tries to remain compatible 
with all of the legacy crypto of the past 30 years. If it drops support 
for that legacy, it will start sucking a lot less.

The only way I see being able to use signify-style signatures is if 
there is broad adoption of did:git or any number of other nascent 
"sovereign identity" proposals. At this time, PGP/GnuPG is the best tool 
for decentralized delegated trust that we have.

> > This doesn't really concern me as much. Anyone can submit 
> > attestation
> > signatures, true, but we throw out anything that doesn't validate and
> > also any PGP keys where none of the UIDs match the From: header. So, if
> > a malicious person sends a bunch of attestations, then they will just be
> > noise and fail at the "gpg --verify" stage because you won't have that
> > key on your keyring.
> 
> That From header is forgeable too, by the way. (Some patches even have
> two From headers -- one in the body of the email for git and one that
> actually sent the email.)

Right, git-mailinfo will pick the one that's in the body. To reiterate, 
git-mailinfo returns whatever Git decides to use for its commit 
purposes, which is why I defer to it for most decisions.

> > Why does it matter?
> 
> You send the patch to lkml. Then your Internet cuts out while the
> firemen deal with an unidentified creature stuck in a nearby tree
> meowing loudly. Finally it's back on and you submit the attestation.
> However, while the cat was ruining your workflow, tglx went to apply
> your patch but wasn't able to find the signature email, since you
> hadn't posted it yet. Hence, a better flow is to just post the
> signature email first.

I'd expect him to treat it in the same way as "you forgot to 
Signed-off-by your patches, please resubmit." However, signing before 
you send is fine, too, I'm not picky. :)

> > I agree that Attestation-verified is redundant with Signed-off-by. I
> > think Attestation-by is helpful for the purposes of seeing the
> > attestation chain. If Developer A sent patches to Submaintainer B, and
> > Submaintainer B sent it to Maintainer C, these headers will help us
> > figure out which steps were attested. If you only see:
> >
> > Attestation-by: Submaintainer B
> >
> > You'll know that there probably was no attestation submitted/checked for
> > when the patches travelled between Developer A and Submaintainer B.
> >
> > However, I don't feel strongly about this. If the community decides that
> > these trailers are not useful, we can drop them. Most of this can be
> > otherwise traced via Link: trailers.
> 
> I think this too is redundant and mostly theater. Those trailers
> aren't authenticated, so they communicate basically nothing useful
> except, "I'm one of the cool maintainers who use this thing!" For
> everyone else, it's just clutter.

Okay, like I said, I don't feel strongly about it.

> I like that this all uses email and simple python command line tools
> and whatnot. But the whole scheme just seems kind of brittle and
> clunky.

It's not any more brittle and clunky than using email for patches. :)

-K

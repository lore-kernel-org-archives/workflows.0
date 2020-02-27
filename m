Return-Path: <SRS0=vuSN=4P=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91941C3F35B
	for <workflows@archiver.kernel.org>; Thu, 27 Feb 2020 14:29:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6059821D7E
	for <workflows@archiver.kernel.org>; Thu, 27 Feb 2020 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582813785;
	bh=aGuTK3y6W39insePAFFEYiuB1NOC4Y5mhFz3Wa/t+Cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DElaVtoOkiyVyqv99vP1jwV/J3ZHk04GfXRO5NXvwmoyLvx9/eSyxvKcgvoEWQUk/
	 L31GkvnCQ29vEfs2kpg1rEG/kfW9pD+wHNOXh1VT873sLBTS0qpALFNwY4YfERFg0j
	 ikL/wb8jiJmJcIdc88EMu637aOl8uy2Y4d5e6bJo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387599AbgB0O3n (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 27 Feb 2020 09:29:43 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:40736 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731106AbgB0O3m (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 27 Feb 2020 09:29:42 -0500
Received: by mail-wm1-f44.google.com with SMTP id t14so3657248wmi.5
        for <workflows@vger.kernel.org>; Thu, 27 Feb 2020 06:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=HzpZc/bzCuWlMviQAfj1LaiJrr3qvGurpdqgf4hfxrM=;
        b=a2hnb/wrWOumECMqJLQHtdKo/iAVTSRP2pvMbMdvT6F8QeXtsisWUcShwiSNcakggU
         1Er+H+rhys67YuKjZ37KeoGi0oA7EgkbMJY4i1nM5D8T8d1lMrIqVDww2pllHsmms3Pi
         nBOaU/ZRx4HAEze5IlvIY+a0NiuCRx+KXPnqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=HzpZc/bzCuWlMviQAfj1LaiJrr3qvGurpdqgf4hfxrM=;
        b=k9jY4G0lr1g2w/c4bFuUW5bBImA6KnN6QicqucitthimDbN6Fn2CTcFrkutjfYiq+j
         MFfOPgBEt5dxOX+eHFFhslvgLFxDJvBnEBPw0s9+zprKP8tZaxrZVDOQpnyGkZ2iK/5g
         lzsJljpVYgoflrB4pLoW4UV6Bj2Zrnsh5Z6Ar3NBO6ELixIN9thBjEgsZt4fvaLsXtGu
         D8efa0nkUVxV6VFYWG48OaTqjDyCZ9PsM71PT4jSYYtVapbiU7Cfgg5etYPOTgc9Iv8c
         pZaHZ8nJKRSSQ/HSpftioarDwl+tEARDb7zNAgCe7qyWR7K5acjK96l6neIXGlleOG8J
         5Uqw==
X-Gm-Message-State: APjAAAVOrF3/iiZLwwo+g4ntUjlJyGrQd07BO0k9NrmWbVhhNaQFU+6N
        7ykoA1tNGzso/zY1q8J49AcyQg==
X-Google-Smtp-Source: APXvYqwXdmdKbTGwow6g/sI3j0zQ9gBFJfX5VNV0ia8vg1DxjtSLgypRUsJIEIT4intoGBr2gz+LWQ==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr5857938wmi.152.1582813780349;
        Thu, 27 Feb 2020 06:29:40 -0800 (PST)
Received: from chatter.i7.local ([185.220.102.6])
        by smtp.gmail.com with ESMTPSA id t13sm7923156wrw.19.2020.02.27.06.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 06:29:39 -0800 (PST)
Date:   Thu, 27 Feb 2020 09:29:35 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     workflows@vger.kernel.org
Subject: Re: Patch attestation RFC + proof of concept
Message-ID: <20200227142935.4ulyjoodgyeu4uoz@chatter.i7.local>
Mail-Followup-To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
        workflows@vger.kernel.org
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
 <20200227041144.GA36493@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200227041144.GA36493@zx2c4.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Feb 27, 2020 at 12:11:44PM +0800, Jason A. Donenfeld wrote:
> Hi Konstantin,
> 
> A few comments on the proposal, inline below:
> 
> On Wed, Feb 26, 2020 at 12:25:02PM -0500, Konstantin Ryabitsev wrote:
> 
> > 4. gpg --locate-keys kees@kernel.org
> 
> I suppose you have in mind WKD instead of the now-DoS-broken key
> servers?

I am not fond of WKD because it stupidly strips all UIDs that don't 
match kernel.org. In fact, if someone has a kernel.org account but 
didn't put their kernel.org UID on the key, the WKD lookup will fail.  
This is why I've been keeping pgpkeys.git repository around.
https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

> > $ egrep '^(Author|Email|Subject)' i | sha256sum
> > 2a02abe02216f626105622aee2f26ab10c155b6442e23441d90fc5fe4071b86e  -
> 
> What if there are multiple such lines? What if there's
> Subject-justkidding? That grep doesn't use a colon in it. Are there
> other malleability issues to account for here?

I leave all this to be handled by git-mailinfo. We don't process the 
message directly, and whatever is returned by git-mailinfo is what git 
decides to use when you run "git am".

> > To calculate the "p" hash, we first need to remove any surrounding 
> > junk that isn't just the patch itself.
> 
> This has to be done extremely carefully, and it's probably worth reading
> the source of git apply and gnu patch and such to find any edge cases.
> Again, potential malleability issues which could be exploitable if not
> done carefully.

Yes, fully agreed. I am hoping to convince git folks that we need this 
functionality natively present in git-mailinfo:
https://lore.kernel.org/git/20200221171312.xyzsrvebuwiw6pgj@chatter.i7.local/

To reiterate, I want to use whatever git uses and make as few design 
decisions as possible.

> > We then take the first 8 characters of the i-m-p hash to create the
> > attestation-ID: 2a02abe0-215cf3f1-2acb5798.
> 
> It's now easy to forge collisions and complicate the lookup process by
> forcing clients to do lots of trial hashing and lore fetching. Remember:
> anybody can submit to the signatures list. If you want an attestation ID
> that uses each of the three hashes, hash the hashes together instead of
> truncating and concatenating them.

This doesn't really concern me as much. Anyone can submit attestation 
signatures, true, but we throw out anything that doesn't validate and 
also any PGP keys where none of the UIDs match the From: header. So, if 
a malicious person sends a bunch of attestations, then they will just be 
noise and fail at the "gpg --verify" stage because you won't have that 
key on your keyring.

> Shouldn't this step:
> 
> > - the developer executes "git-send-email"
> 
> be after these steps:
> 
> > - the developer runs "attest-patches -a *.patches"
> > - the developer sends attestation.eml to signatures@kernel.org
> >   (or the tool auto-POSTs it to the submission URL, as mentioned)
> 
> ? Otherwise there's a small race window.

Why does it matter? I envision cases where you'd send attestation full 
days or weeks later. As long as what the maintainer received matches 
what is on the developer's system, the validity time window can be large 
enough to cover a few weeks.

> > - if attestation passes, get-lore-mbox adds two trailers to each 
> > patch: "Attestation-by:" and "Attestation-verified:". In our example 
> > case those are:
> >   Attestation-by: Kees Cook <kees@kernel.org> (pgp:8972F4DFDC6DC026)
> >   Attestation-verified: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> 
> What do these lines actually add that is useful? The Signed-off-by is
> already a non-cryptographic trail of which maintainers patches flow
> through. These two add another, also non-cryptographic, summary. If
> they're forgible, then what's the point? Seems like clutter. If
> anything, these signatures help maintainers verify that the sender
> actually sent it before they merge it into their trees. But after that,
> those commit messages could contain anything, including bogus
> "Attestation-by" lines. It seems like it's basically just tinfoil virtue
> signaling at that point? Ostensibly the maintainers should also be
> reading the patches for content anyway...

I agree that Attestation-verified is redundant with Signed-off-by. I 
think Attestation-by is helpful for the purposes of seeing the 
attestation chain. If Developer A sent patches to Submaintainer B, and 
Submaintainer B sent it to Maintainer C, these headers will help us 
figure out which steps were attested. If you only see:

Attestation-by: Submaintainer B

You'll know that there probably was no attestation submitted/checked for 
when the patches travelled between Developer A and Submaintainer B.

However, I don't feel strongly about this. If the community decides that 
these trailers are not useful, we can drop them. Most of this can be 
otherwise traced via Link: trailers.

> > Okay, what do you all think? I believe this scheme has the following 
> > merits:
> > Downsides:
> > 
> > - we aren't solving the problem of delegated trust, which will continue 
> >   to be the hardest part behind any distributed development effort
> > 
> 
> Another odd quirk worth considering: vanilla patches aren't tied to a
> specific commit base, so there could be a "replay attack" where an
> attacker resends an old patch that still applies without issue, but
> means a different thing in the present state of the tree. For example,
> Alice sends patch P in November 2019. Bob discovers it causes a remotely
> exploitable vulnerability in December 2019 and submits a revert patch.
> The seasons change a few times, and it's now March 2025, maintainers
> have changed a bit, but the code is still mostly the same. Eve resubmits
> P which has Alice's name on it. Signature verifies. Doom ensues. Real
> git pgp signing involves a signature over the whole object, which
> contains the hash of the parent, which avoids this issue.

PGP signatures include time of signing, so this is covered:

$ curl -s https://lore.kernel.org/signatures/202002251425.E7847687B@keescook/raw | gpg --verify
gpg: Signature made Tue 25 Feb 2020 05:25:19 PM EST
gpg:                using RSA key A5C3F68F229DD60F723E6E138972F4DFDC6DC026
gpg: Good signature from "Kees Cook <kees@outflux.net>" [full]

The proof-of-concept tool doesn't do anything with this info, but the 
real tool can implement a "window of validity" check that would reject 
attestation if signatures are too old.

> General reflection: this is solving a odd "problem". As mentioned above,
> maintainers should be reading commits as they come in on the mailing
> list. There might be a practical argument to be made, though, that
> sometimes they trust things on face value, even emailed commits, and so
> this gives some extra assurance. I also wonder if this adds even more
> overhead to what hipsters are already decrying as an overly clunky
> contribution process. Even more generally, is the lack of signatures on
> email patches a real problem we're facing?

So, I have two risk scenarios here:

1. An overworked, tired maintainer that sees the name of a trusted 
   developer on the From: line and doesn't go over the code as 
   thoroughly as they should. I share the "constant vigilance" 
   sentiment, but I also know that humans are fallible and giving 
   maintainers an auxiliary mechanism to verify trust chains will do 
   more good than harm.

2. A maintainer reviews patches that arrived in their mailbox and finds 
   them perfectly good. Then they run "get-lore-mbox" or "git pw" to get 
   these patches in a format that's easy to apply to their git repo, but 
   they suddenly get a *slightly different* set of patches, because now 
   we explicitly trust that whoever is in charge of 
   lore.kernel.org/patchwork.kernel.org isn't being malicious. I don't 
   want us to trust any piece of infrastructure that sits between the 
   developer and the maintainer.

I hope that the procedure I'm proposing is convenient and unobtrusive 
enough to be accepted and used. In my view, it is not significantly more 
cumbersome than adding signatures to git tags.

-K

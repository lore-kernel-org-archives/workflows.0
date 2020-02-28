Return-Path: <SRS0=qi7Q=4Q=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765EBC3F2CE
	for <workflows@archiver.kernel.org>; Fri, 28 Feb 2020 01:58:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36FD82469F
	for <workflows@archiver.kernel.org>; Fri, 28 Feb 2020 01:58:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="AggnMVmW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730439AbgB1B6B (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 27 Feb 2020 20:58:01 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:46933 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730438AbgB1B6B (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 27 Feb 2020 20:58:01 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ffeae92
        for <workflows@vger.kernel.org>;
        Fri, 28 Feb 2020 01:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to
        :content-type; s=mail; bh=WFwawjPEhzxsd4zqyDijJ7A6tgY=; b=AggnMV
        mWkuxuzGjcLCtkkqiJHLtzr2boO4i4tikNOMlPRuNejLh1eCD8gyWCB87sfRExCU
        vqGTrXCCQql2m5hnwWkUDTVXfbwkB5hNZUHzyt7tKszuSUfSKyFpyBHtHeMntsW1
        SHQx4VLueI9uUIQ4LcB2zDt5eNtuZHVIT+EtAA781slgV8+WFjj6jE0iFFuFG4Am
        kpr7oYAheNZH1o4AOAHWF2VgyoRoEqAMFLIeO9mQ5V3dNZq0c+EmOP98pVlERmIp
        7nho69t7LJd0Srbsq7k1NwnYLD1WrTB6+LSGlBuTphz4MMRl3QTGlfFXyrpjApwR
        PfHxfYDU5jd1GFyQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 109b5a64 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
        for <workflows@vger.kernel.org>;
        Fri, 28 Feb 2020 01:54:09 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 59so1150447otp.12
        for <workflows@vger.kernel.org>; Thu, 27 Feb 2020 17:58:00 -0800 (PST)
X-Gm-Message-State: APjAAAWRcpa0NCWzs3XS/wxwas9cy9LRI2mVKX/dzEpcnKJOtkkrhfqk
        1Gbvi7jDSLPiq6exykYmKWXK91c0mCTWjIHLM/s=
X-Google-Smtp-Source: APXvYqyLtmGytrS9XYd9IbGmjSP4eMQO+gZmyjOaaQvmN/+wC0SDWhMEzms1JNpyfbc+OVNtwl8ra2YygTp/qhtYGB0=
X-Received: by 2002:a9d:aa7:: with SMTP id 36mr1543058otq.52.1582855079323;
 Thu, 27 Feb 2020 17:57:59 -0800 (PST)
MIME-Version: 1.0
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
 <20200227041144.GA36493@zx2c4.com> <20200227142935.4ulyjoodgyeu4uoz@chatter.i7.local>
In-Reply-To: <20200227142935.4ulyjoodgyeu4uoz@chatter.i7.local>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Fri, 28 Feb 2020 09:57:47 +0800
X-Gmail-Original-Message-ID: <CAHmME9rkCgQwUnwUoOCzDzLi1biECs3ZwzApsPDKXykKPitZew@mail.gmail.com>
Message-ID: <CAHmME9rkCgQwUnwUoOCzDzLi1biECs3ZwzApsPDKXykKPitZew@mail.gmail.com>
Subject: Re: Patch attestation RFC + proof of concept
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, Feb 27, 2020 at 10:29 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> This is why I've been keeping pgpkeys.git repository around.
> https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git

Ah, right, that seems good. There's also signify, by the way, if you
ever feel the urge to jump ship from pgp. We can add cgit support for
it too.

> I leave all this to be handled by git-mailinfo. We don't process the
> message directly, and whatever is returned by git-mailinfo is what git
> decides to use when you run "git am".
> Yes, fully agreed. I am hoping to convince git folks that we need this
> functionality natively present in git-mailinfo:
> https://lore.kernel.org/git/20200221171312.xyzsrvebuwiw6pgj@chatter.i7.local/
> To reiterate, I want to use whatever git uses and make as few design
> decisions as possible.

Probably wise. But it doesn't really "solve" the problem, since
somebody still needs to write the code to have the set of properties
you care about for signatures. No matter who you foist the
responsibility on to, you'll probably need to audit it pretty
carefully.

> This doesn't really concern me as much. Anyone can submit attestation
> signatures, true, but we throw out anything that doesn't validate and
> also any PGP keys where none of the UIDs match the From: header. So, if
> a malicious person sends a bunch of attestations, then they will just be
> noise and fail at the "gpg --verify" stage because you won't have that
> key on your keyring.

That From header is forgeable too, by the way. (Some patches even have
two From headers -- one in the body of the email for git and one that
actually sent the email.)

> Why does it matter?

You send the patch to lkml. Then your Internet cuts out while the
firemen deal with an unidentified creature stuck in a nearby tree
meowing loudly. Finally it's back on and you submit the attestation.
However, while the cat was ruining your workflow, tglx went to apply
your patch but wasn't able to find the signature email, since you
hadn't posted it yet. Hence, a better flow is to just post the
signature email first.


> I agree that Attestation-verified is redundant with Signed-off-by. I
> think Attestation-by is helpful for the purposes of seeing the
> attestation chain. If Developer A sent patches to Submaintainer B, and
> Submaintainer B sent it to Maintainer C, these headers will help us
> figure out which steps were attested. If you only see:
>
> Attestation-by: Submaintainer B
>
> You'll know that there probably was no attestation submitted/checked for
> when the patches travelled between Developer A and Submaintainer B.
>
> However, I don't feel strongly about this. If the community decides that
> these trailers are not useful, we can drop them. Most of this can be
> otherwise traced via Link: trailers.

I think this too is redundant and mostly theater. Those trailers
aren't authenticated, so they communicate basically nothing useful
except, "I'm one of the cool maintainers who use this thing!" For
everyone else, it's just clutter.

> The proof-of-concept tool doesn't do anything with this info, but the
> real tool can implement a "window of validity" check that would reject
> attestation if signatures are too old.

Or at least warn in bright red or something. But do note: this is
mostly a compromise-hack to work around a fundamental design issue
here, and it doesn't actually solve all cases; i.e. it depends on
humans having some short term memory during the validity period about
what's going on too.

> 2. A maintainer reviews patches that arrived in their mailbox and finds
>    them perfectly good. Then they run "get-lore-mbox" or "git pw" to get
>    these patches in a format that's easy to apply to their git repo, but
>    they suddenly get a *slightly different* set of patches, because now
>    we explicitly trust that whoever is in charge of
>    lore.kernel.org/patchwork.kernel.org isn't being malicious.

It doesn't help with the reverse scenario, where what's in the
developer's inbox or displayed on the lore webserver running a
backdoored nginx doesn't match the patches that they eventually apply.
That might seem like an unrealistic attack scenario, but then think
about it combined with the get-lore-mbox feature to grab the latest
patchset version and other similar shenanigans. Or, maybe Eve reposts
v1 as v20, and this mailing list thread convinces you to ignore the
[PATCH vX] from the metadata hash, or maintainers don't care about
that hash verifying anyway since it tends to get mangled.


I like that this all uses email and simple python command line tools
and whatnot. But the whole scheme just seems kind of brittle and
clunky.

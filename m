Return-Path: <SRS0=Scut=4O=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD56C4BA1E
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 17:50:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E9C92067C
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 17:50:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gqie737v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgBZRuy (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Feb 2020 12:50:54 -0500
Received: from mail-pf1-f173.google.com ([209.85.210.173]:43304 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgBZRuy (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Feb 2020 12:50:54 -0500
Received: by mail-pf1-f173.google.com with SMTP id s1so132156pfh.10
        for <workflows@vger.kernel.org>; Wed, 26 Feb 2020 09:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g6puoa1muo4ac3vA790hwuFHaPkViX219laP4HdHz30=;
        b=gqie737ve9SydPqUemqxvVB2bbz/XCSt784ZvnU/x4tHA1+t3Wnej151+tkNowBdXU
         YIb2/KQFDu+wQmVKCchPZX79ZqfJqk0qsnAYZiGp+K1//SQyIZvaJLwo4GBqG0mFPLCK
         Bh5junLXD5fd2cqXlts37nxwaVs254bHGYdWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g6puoa1muo4ac3vA790hwuFHaPkViX219laP4HdHz30=;
        b=iZj+gyesczdS7gXrtHHmuet7Xo1ONysLg4AOAmOxlERDibDx3bA9zkaiQUA+8uOmrZ
         Pu4EOoGV4jOSbBHIChv4s8+QeWIV08jFs6bSGBnEfJXEY6koBdhHshMBlVWu3PScaWWI
         VGWOKWzt5V11Eio02CVFfJ3JcFep6Tl5wX8zVAsN+xv9c5EWI4+LTSZ4NKQwDIOAiKm0
         tt9pNSF8nGEYNKW3cC3gl2SLa7MbSM3gP9skOTeWBgcF1/x0H8JCGojt53OhzkmDNy1R
         Z9fsGVDeBpokj8UrhsWi/z6AtPwYel/5H2YSjIy+Cr1D8UL1tYSgB7PQgavuTD7V1mlE
         c8DQ==
X-Gm-Message-State: APjAAAXKnQPzZDCGJiXH20ZA06f+pyja+8mAgrsfi+gukKH9MqoNaxlO
        eb1tNYz4F55s5n6JNVbVD5zVkHrlto4=
X-Google-Smtp-Source: APXvYqwD3SXdAXDMpyEgqTiidwAgM7pIOUHNQvLEG5e7LgUvR3bvKhKNIcOv6DoINld44Qw55DRF+w==
X-Received: by 2002:a63:1245:: with SMTP id 5mr17011pgs.55.1582739452955;
        Wed, 26 Feb 2020 09:50:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c15sm3739768pfo.137.2020.02.26.09.50.51
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 09:50:51 -0800 (PST)
Date:   Wed, 26 Feb 2020 09:50:50 -0800
From:   Kees Cook <keescook@chromium.org>
To:     workflows@vger.kernel.org
Subject: Re: Patch attestation RFC + proof of concept
Message-ID: <202002260938.BFA7FA03@keescook>
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Feb 26, 2020 at 12:25:02PM -0500, Konstantin Ryabitsev wrote:
> ## The submitter workflow
> 
> As I envision it, the submitter workflow would look as follows:
> 
> - the developer runs "git-format-patch"
> - the developer reviews the changes and makes any last-minute edits they 
>   deem necessary before submitting their work to the list/maintainer
> - the developer executes "git-send-email"
> - the developer runs "attest-patches -a *.patches"
> - the developer sends attestation.eml to signatures@kernel.org
>   (or the tool auto-POSTs it to the submission URL, as mentioned)
> 
> There can even be a fairly simple wrapper around git-send-email that 
> would perform attestation as part of the "sending patches" stage.

FWIW, I would find this utterly trivial to add to my workflow. (The only
minor difference that doesn't really matter is that in addition to
series-style patches, I also regularly send one-offs, but that would
just be a short attestation email.)

> ## The reviewer workflow
> 
> The reviewer does not need to concern themselves with attestation until 
> they are ready to apply the patches to their git tree. When that moment 
> comes:
> 
> - the maintainer runs get-lore-mbox -aA (-A is not implemented yet)
> - get-lore-mbox performs attestation before generating the am-ready mbox
> - if attestation passes, get-lore-mbox adds two trailers to each patch: 
>   "Attestation-by:" and "Attestation-verified:". In our example case 
>   those are:
>   Attestation-by: Kees Cook <kees@kernel.org> (pgp:8972F4DFDC6DC026)
>   Attestation-verified: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

We'll probably need to have a stable way to deal with key aliases. Even
in this example my email addresses are keescook@chromium.org (patches
and attestation sender), kees@outflux.net (comment in gpg sig), and
kees@kernel.org (since that's what Konstantin used to fetch my key).

And perhaps I lack imagination, but what is the overall purpose of these
proposed tags? If it's just a hint to whether the patch has attestation,
the '-verified:' isn't needed. Anyone wanting to check attestation would
always need to do the full heavy lifting anyway.

> # Thoughts?
> 
> Okay, what do you all think? I believe this scheme has the following 
> merits:
> 
> - it is opt-in and can be adopted by individual subsystem maintainers
> - it builds on top of the PGP trust framework already used extensively 
>   by the kernel developers
> - it doesn't litter mailing lists with non-human-readable attestation 
>   junk
> - it doesn't require that attestation data is created at the time when 
>   patches are submitted for review; the maintainer can request that it 
>   is provided at a later time when they are ready to apply the series to 
>   their git tree and want attestation data for the final sanity check 
>   and record-keeping
> - all attestations are recorded in the public-inbox "signatures" feed 
>   that can be mirrored along all other public-inbox repositories on 
>   lore.kernel.org

Moar blockchains! ;) But, yes, it provides a signed path from author to
committer without interfering with existing workflows. I like it!

> Downsides:
> 
> - we aren't solving the problem of delegated trust, which will continue 
>   to be the hardest part behind any distributed development effort

This was immediately my first question. How does a committer choose the
correct GPG key? /me waits for the kernel.org key server to appear...

Thanks for working on this! It was fun being the alpha guinea pig. ;)

-- 
Kees Cook

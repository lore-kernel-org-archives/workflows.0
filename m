Return-Path: <SRS0=qi7Q=4Q=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1136BC3F2CD
	for <workflows@archiver.kernel.org>; Fri, 28 Feb 2020 18:33:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFF3A246A3
	for <workflows@archiver.kernel.org>; Fri, 28 Feb 2020 18:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582914817;
	bh=qlL+lx7ipNV0prkkqZBrdEaU2USAH1bcg0YcG0N+2WU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zEZ0jRwR2UCiE8tTns/CtSmdpb/AjuaIqAkd7sqa9En882XKLfYna+u/fW8iTfhZC
	 BzuVHN5ri+75Rz5s97lE+qGU3mSRG7y2THmJQ3/pM9iqjcntu1pl6b6IkjP8WxNCzn
	 NQ2K7CjaBL/NVOYAmULQgq55wUlCo8VBuAWDbpys=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgB1Sdh (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 28 Feb 2020 13:33:37 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:41735 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbgB1Sdh (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 28 Feb 2020 13:33:37 -0500
Received: by mail-qv1-f66.google.com with SMTP id s15so1616250qvn.8
        for <workflows@vger.kernel.org>; Fri, 28 Feb 2020 10:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=s63NL65KjXZN/JSbYtZvVwep7NWHf0WGob8jnW6yGK0=;
        b=Thnnta66wXRfuaMaqWvqVhtaB9pgLPhifZrArAlR4QFUNYYAUj4NFCQ68it7slVjDk
         gaDHTd46nlnahUxo9OnphZZpCxpgc1FQj2JYdVUCW0QYCwA6js+QVgj176pTMeVXrjBl
         q28CJ3BYZ+jlpRvLW6j8dT31gCpD+7iYT0BmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=s63NL65KjXZN/JSbYtZvVwep7NWHf0WGob8jnW6yGK0=;
        b=BtNWJacwy5I59aRjHeaOttJnZuo6TUwB5jf/jOrE+v9iX1bNcpCmPNfi+Hneui/ecl
         4A+qFDXeDQn8lkCSE52o2pbQWN9jrm+mNwSJChjoq7aAgkXxQRyexKyX9SRpnJo7lifM
         HC8oqoo+JxKJhfdH7M1l9AbPiZNAjPWrJk5rHUvSyMS1cfsIzF4wAUxJSoU2q5ZiS1Pk
         /Y+NNjaIEdPImbOX/UJGWL1v0VqLeehZdlA2JlZODAFdpsiRtVIOxdmYiniYCjwjMDKR
         JqqCEQ1M9xnnNCYakWbycp1gGC3VPnXcXg1wwMK1f4YVE4Xu2CAWGSx8COmuXXZMSq63
         Zo3Q==
X-Gm-Message-State: APjAAAUunso9rXqIF9yGp6N6ZWnE92vhvm1sIWyYQY5DjidGhPYHXNgn
        Jste2+p/GvjfQUTjXPg4ViMF2Z3cLh0G8A==
X-Google-Smtp-Source: APXvYqwCW7qp6Hic/HMPkY8OoTTUXYbb8V38OXoYWNRUi796IzuCSTUNv/01sDtzaxIlBhvWMMVx+A==
X-Received: by 2002:ad4:44ee:: with SMTP id p14mr4779247qvt.114.1582914814458;
        Fri, 28 Feb 2020 10:33:34 -0800 (PST)
Received: from chatter.i7.local (wholesomeserver.media.mit.edu. [18.27.197.252])
        by smtp.gmail.com with ESMTPSA id q1sm829147qkm.11.2020.02.28.10.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 10:33:33 -0800 (PST)
Date:   Fri, 28 Feb 2020 13:33:29 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     workflows@vger.kernel.org
Subject: Re: Patch attestation RFC + proof of concept
Message-ID: <20200228183329.bxblehurcfx5ov2h@chatter.i7.local>
Mail-Followup-To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
        workflows@vger.kernel.org
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
 <20200227041144.GA36493@zx2c4.com>
 <20200227142935.4ulyjoodgyeu4uoz@chatter.i7.local>
 <CAHmME9rkCgQwUnwUoOCzDzLi1biECs3ZwzApsPDKXykKPitZew@mail.gmail.com>
 <20200228023023.GA34515@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200228023023.GA34515@zx2c4.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, Feb 28, 2020 at 10:30:23AM +0800, Jason A. Donenfeld wrote:
> Some constructive suggestions that might address some (but not all!)
> maliability concerns and some clunkiness concerns:
> 
> A. What data are you signing?
> 
> Your current approach is to split up the email into parts, canonicalize
> them, hash them, and then sign those hashes. Instead you could actually
> more easily canonicalize the applied email. That is: when you have a
> commit in a git tree, you can always git-format-patch it into the same
> format. So, if you git-am an email, and then git-format-patch it out,
> you'll get some standard format. You could insist all signatures are
> made over this standard format. There's still the same set of attacks I
> mentioned earlier here, but it's a bit less frail.

This won't work because we can't count on the "Date" field to remain the 
same between when "git-format-patch" is run on the developer's 
workstation vs. when it's run on the maintainer's workstation. The 
outputs will not be the same.

Furthermore, we need to be able to git-am the patches in order to attest 
them, which poses the following difficulties:

- we need to have the git tree locally
- we need to be able to fork it
- we need to be able to cleanly git-am the patches, which means that
- we need to know at least the base-commit info

This will also break down if series have inter-dependencies that require 
that Series A is applied before Series B can be cleanly applied.

> B. How are you communicating the signatures?
> 
> Your approach sticks these on a separate mailing list, linked by some
> hash prefixes. Two approaches that would make the whole thing a lot less
> clunky:

I don't think it's clunky, because we're gearing up to spend a lot of 
effort enhancing public-inbox cross-list search capabilities. It's 
clunky *right now* because the proof-of-concept script uses a 
search-based atom feed to look up attestation messages, but that 
interface should be dramatically better in the near future. Looking up 
attestation will be a REST call to lore.kernel.org. Once that happens, 
we won't need to care on which list the attestation document is present.  
It can just as well exist on the developer's personal outbox feed -- 
lore.kernel.org or any of its mirrors will be able to find it based on 
the attestation ID.

> 1. Include it as a separate part in a multi-part mime message. Lore web
> interface could bury it someplace reasonable. vger could learn to accept
> these parts, and since hashing is already mega fast, it could even
> validate that the hashes are correct and reject emails with bad (or
> missing) hashes. (I'm not suggesting validating the signature, but
> rather just the hashes.)

Sure, mime-attaching it to the cover letter is one of the options I 
mentioned, but if we call it something other than text/plain, mailman 
will probably strip it off (or corporate MTAs will helpfully quarantine 
it); and if we stick with text/plain, everyone will see it in their mail 
client anyway, so there is little reason to mime-attach it in the first 
place. I'm actually considering making it possible to send it as a 
separate message in the series:

[PATCH 00/10] Implement adding foo to bar
[PATCH 01/10] Move foo into libfoo
...
[PATCH 10/10] Remove old bar interface
[PSIGN XX/10] Attestation: Implement adding foo to bar

I'm just worried that this will create too much clutter, especially on 
lists that mostly see one-off patches. I can imagine it will be annoying 
if most of the stuff you receive is:

[PATCH] Add foo to bar
[PSIGN] Add foo to bar

So, I'm sticking it into signatures@kernel.org for now and using the 
search interface to find it.

> 2. Switch to using the tiny ed25519 signatures provided by
> signify/minisign -- which has numerous benefits over gpg alone -- and
> stick it in the mail headers. This is something git-send-email could
> learn to add.
> 
> X-Git-Format-Patch-Hash: aC1ywMbaJpiMFJY7vK/62eBKtrgKiVIXFHa+WPQwBJk=
> X-Git-Format-Patch-Ed25519-Signature: aSscBu2pXbIEDCuRZ7E0uKWVsE5SitNM8UA44tuFc/rg3GQwv5Ur/mpOk2mQJbT6dPDghuxJ1gwZKAZK20BXAQ==
> 
> I prefer (2), but (1) would be acceptable if you're some how wedded to
> pgp and I can't talk you out of it. I can write whatever cryptographic
> code we need to do (2), but I suspect signify/minisign have everything
> we need.

I'd much rather that git gained the ability to incorporate full commit 
metadata into git-format-patch output. Then we won't have to invent 
anything at all -- we can just "git am" the series, then "git 
verify-commit HEAD" and let git handle all the crypto for us, whatever 
it happens to be (pgp, s/mime, minisign, or any other crypto ability it 
gains in the future). There are still problems with this approach (see 
my comments about git-am above), but at least we can work with this and 
depend on it not suddenly breaking.

However, quite a few of existing developers and maintainers don't work 
directly with git -- they prefer to queue things up with quilt or 
similar tools, so we cannot approach this purely from the git workflow 
perspective. For this reason, I'm pursuing both strategies:

- make git-format-patch/git-am a lossless operation
- provide an out-of-band attestation mechanism


Best,
-K

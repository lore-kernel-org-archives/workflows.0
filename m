Return-Path: <SRS0=vuSN=4P=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73187C4BA24
	for <workflows@archiver.kernel.org>; Thu, 27 Feb 2020 04:11:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48AE924679
	for <workflows@archiver.kernel.org>; Thu, 27 Feb 2020 04:11:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eFAzA3cE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgB0ELv (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Feb 2020 23:11:51 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:37395 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727735AbgB0ELv (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 26 Feb 2020 23:11:51 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c61df3c;
        Thu, 27 Feb 2020 04:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
        :cc:subject:message-id:references:mime-version:content-type
        :in-reply-to; s=mail; bh=vAEZi7CnKe9ufERg+SN3R/oESvw=; b=eFAzA3c
        EnXig2WXNwK8TCpJqu6i2SMd+QfsBTJUc+9hxfIjPeVxtrxnHa61xrAwKHUZsGql
        c5y5gwaMAPgoaECcw4/n4K3LwK6fVUw4KZbw3zn/+BnR0KWDXoax84zhWgOWsEKj
        Bg7gJPPuqty3nrzROfbgD6hInTbwdHakxq6JZeYFJv9xT3T4iwC2yKKPT+MKSJdO
        2PjmzhVX/LhdvlCmB2B8eP78OVVDZQaSkjddiaVVj4Vy1CDrRhC+or1eBNKn/Plt
        U/u/0F2VVriUiI+dpXupJ8AWQHICKR45xL4grf8Q2CC4NXqAFBdpS9NEb5QfJkUY
        ZvhgtzjtqJRe6NA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 281ac432 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Thu, 27 Feb 2020 04:08:05 +0000 (UTC)
Date:   Thu, 27 Feb 2020 12:11:44 +0800
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     workflows@vger.kernel.org
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Patch attestation RFC + proof of concept
Message-ID: <20200227041144.GA36493@zx2c4.com>
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi Konstantin,

A few comments on the proposal, inline below:

On Wed, Feb 26, 2020 at 12:25:02PM -0500, Konstantin Ryabitsev wrote:

> 4. gpg --locate-keys kees@kernel.org

I suppose you have in mind WKD instead of the now-DoS-broken key
servers?
 
> $ egrep '^(Author|Email|Subject)' i | sha256sum
> 2a02abe02216f626105622aee2f26ab10c155b6442e23441d90fc5fe4071b86e  -

What if there are multiple such lines? What if there's
Subject-justkidding? That grep doesn't use a colon in it. Are there
other malleability issues to account for here?

> To calculate the "p" hash, we first need to remove any surrounding junk 
> that isn't just the patch itself.

This has to be done extremely carefully, and it's probably worth reading
the source of git apply and gnu patch and such to find any edge cases.
Again, potential malleability issues which could be exploitable if not
done carefully.

> We then take the first 8 characters of the i-m-p hash to create the
> attestation-ID: 2a02abe0-215cf3f1-2acb5798.

It's now easy to forge collisions and complicate the lookup process by
forcing clients to do lots of trial hashing and lore fetching. Remember:
anybody can submit to the signatures list. If you want an attestation ID
that uses each of the three hashes, hash the hashes together instead of
truncating and concatenating them.


Shouldn't this step:

> - the developer executes "git-send-email"

be after these steps:

> - the developer runs "attest-patches -a *.patches"
> - the developer sends attestation.eml to signatures@kernel.org
>   (or the tool auto-POSTs it to the submission URL, as mentioned)

? Otherwise there's a small race window.


> - if attestation passes, get-lore-mbox adds two trailers to each patch: 
>   "Attestation-by:" and "Attestation-verified:". In our example case 
>   those are:
>   Attestation-by: Kees Cook <kees@kernel.org> (pgp:8972F4DFDC6DC026)
>   Attestation-verified: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

What do these lines actually add that is useful? The Signed-off-by is
already a non-cryptographic trail of which maintainers patches flow
through. These two add another, also non-cryptographic, summary. If
they're forgible, then what's the point? Seems like clutter. If
anything, these signatures help maintainers verify that the sender
actually sent it before they merge it into their trees. But after that,
those commit messages could contain anything, including bogus
"Attestation-by" lines. It seems like it's basically just tinfoil virtue
signaling at that point? Ostensibly the maintainers should also be
reading the patches for content anyway...

> Okay, what do you all think? I believe this scheme has the following 
> merits:
> Downsides:
> 
> - we aren't solving the problem of delegated trust, which will continue 
>   to be the hardest part behind any distributed development effort
> 

Another odd quirk worth considering: vanilla patches aren't tied to a
specific commit base, so there could be a "replay attack" where an
attacker resends an old patch that still applies without issue, but
means a different thing in the present state of the tree. For example,
Alice sends patch P in November 2019. Bob discovers it causes a remotely
exploitable vulnerability in December 2019 and submits a revert patch.
The seasons change a few times, and it's now March 2025, maintainers
have changed a bit, but the code is still mostly the same. Eve resubmits
P which has Alice's name on it. Signature verifies. Doom ensues. Real
git pgp signing involves a signature over the whole object, which
contains the hash of the parent, which avoids this issue.

General reflection: this is solving a odd "problem". As mentioned above,
maintainers should be reading commits as they come in on the mailing
list. There might be a practical argument to be made, though, that
sometimes they trust things on face value, even emailed commits, and so
this gives some extra assurance. I also wonder if this adds even more
overhead to what hipsters are already decrying as an overly clunky
contribution process. Even more generally, is the lack of signatures on
email patches a real problem we're facing?

Regards,
Jason

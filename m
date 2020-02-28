Return-Path: <SRS0=qi7Q=4Q=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9326BC3F2CE
	for <workflows@archiver.kernel.org>; Fri, 28 Feb 2020 02:30:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62A82246A3
	for <workflows@archiver.kernel.org>; Fri, 28 Feb 2020 02:30:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Db5kWWOT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730442AbgB1Cab (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 27 Feb 2020 21:30:31 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:53201 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726943AbgB1Caa (ORCPT <rfc822;workflows@vger.kernel.org>);
        Thu, 27 Feb 2020 21:30:30 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 487743b5
        for <workflows@vger.kernel.org>;
        Fri, 28 Feb 2020 02:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
        :subject:message-id:references:mime-version:content-type
        :in-reply-to; s=mail; bh=YRCNTiu4W0pG44zZOHx9DWsd9o8=; b=Db5kWWO
        T35rJzgEr9FP9aLr6oWLsHnbA8Mt4NBEC7+fnB5Xb9x2SHSJHI+ZPU03Dp1L4DDn
        pv+Tcham+uFtPl29Cvkt/QwU74YayonMKq531f3NXhdc75tfW4c17ghRVzScAlrD
        OjWu24d4m3pDa+0BERb06JEkvnIyXxCJ5S20sY6wu0V+kxN9uCyAB+4m3XzO1kT/
        AIvS8C8VEpQNZw5AT4l/B6p+vK8CDSclemJe+vNi2mtuMwXeRWAZ/PGRE0IMzANa
        UtGAZnvfazFefMrd5yPgsO/mPQ3eUsAzZqstBpQOHZ/8VSTjnkrkUHNBvCp5u5As
        gKkI5dwjC+Ny0/w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b8709062 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
        for <workflows@vger.kernel.org>;
        Fri, 28 Feb 2020 02:26:37 +0000 (UTC)
Date:   Fri, 28 Feb 2020 10:30:23 +0800
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     workflows@vger.kernel.org
Subject: Re: Patch attestation RFC + proof of concept
Message-ID: <20200228023023.GA34515@zx2c4.com>
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

Some constructive suggestions that might address some (but not all!)
maliability concerns and some clunkiness concerns:

A. What data are you signing?

Your current approach is to split up the email into parts, canonicalize
them, hash them, and then sign those hashes. Instead you could actually
more easily canonicalize the applied email. That is: when you have a
commit in a git tree, you can always git-format-patch it into the same
format. So, if you git-am an email, and then git-format-patch it out,
you'll get some standard format. You could insist all signatures are
made over this standard format. There's still the same set of attacks I
mentioned earlier here, but it's a bit less frail.

B. How are you communicating the signatures?

Your approach sticks these on a separate mailing list, linked by some
hash prefixes. Two approaches that would make the whole thing a lot less
clunky:

1. Include it as a separate part in a multi-part mime message. Lore web
interface could bury it someplace reasonable. vger could learn to accept
these parts, and since hashing is already mega fast, it could even
validate that the hashes are correct and reject emails with bad (or
missing) hashes. (I'm not suggesting validating the signature, but
rather just the hashes.)

2. Switch to using the tiny ed25519 signatures provided by
signify/minisign -- which has numerous benefits over gpg alone -- and
stick it in the mail headers. This is something git-send-email could
learn to add.

X-Git-Format-Patch-Hash: aC1ywMbaJpiMFJY7vK/62eBKtrgKiVIXFHa+WPQwBJk=
X-Git-Format-Patch-Ed25519-Signature: aSscBu2pXbIEDCuRZ7E0uKWVsE5SitNM8UA44tuFc/rg3GQwv5Ur/mpOk2mQJbT6dPDghuxJ1gwZKAZK20BXAQ==

I prefer (2), but (1) would be acceptable if you're some how wedded to
pgp and I can't talk you out of it. I can write whatever cryptographic
code we need to do (2), but I suspect signify/minisign have everything
we need.

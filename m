Return-Path: <SRS0=Scut=4O=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EEFC4BA21
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 21:04:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F5A121D7E
	for <workflows@archiver.kernel.org>; Wed, 26 Feb 2020 21:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="W6hXOPuG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbgBZVEq (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 26 Feb 2020 16:04:46 -0500
Received: from mail-qv1-f65.google.com ([209.85.219.65]:46210 "EHLO
        mail-qv1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727501AbgBZVEp (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 26 Feb 2020 16:04:45 -0500
Received: by mail-qv1-f65.google.com with SMTP id y2so475104qvu.13
        for <workflows@vger.kernel.org>; Wed, 26 Feb 2020 13:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MoEQumUJZ11WS3W2q9sLXSWWJ6hmoFJudFrezyaqRtg=;
        b=W6hXOPuGZPAsTXxgCxKfLX3o7sH9H9e7arUvmJE5tOvk7Hv2VKTEh7YnzKIS9Jh+Cu
         /HyAXo+J9bVh67Zk0TE/6lylYRKH6aD4Lj51UnLURur6eTqIlJqRjQFZTpE4PNVWgP7p
         DvsrdSOqf9XASLOVRxgfFDa4QwRHVH11q4F74QWK/gCgM6ElawvEsA4h2zs9UO+a7Ypf
         LE4xloIXr8IKFvdVl8VQ+v2+3DCZQHHWK2Z4TjduF/UuyMc9AxOvsv5KZxfn2Yy0VXdq
         ZBY+LAYYDTunEF12eqKmNvJLdd4Yik2j+JCiJZFd8G+UjjGoZxvOHq1jVa2dugdJnIyK
         egkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MoEQumUJZ11WS3W2q9sLXSWWJ6hmoFJudFrezyaqRtg=;
        b=aQKHhwxfd51HB+TRTL56/uj7VavGN4BfRiF1J8YMVzuX9m92MAz2edEiNGUkD5e1WN
         EfcQVhqwRPSxxk6FORT4dSOYKxN97b3iY/2BWOBjY46uQNKDImdLrSVpuWPLW7EG8dHh
         gDNbkr7/UixAbiVWTg0mV9K1lsthf+4AzXGFJlcpsxb5v+iN0kVePW89cNIp2Q5v47K5
         V+6M6Gv9kRstN/GyQ5/XUnY6DYWKTaD+mg+JrZIl0wr0zyJc9zp38zEwQuAqq9FhubWH
         nWlE5Nmdk0u6gfokulJ905mF0p/hfjWRlOcp1WqqaWoN4jbJ8Cg6hZ2lwEUAGBVIW6Se
         K62w==
X-Gm-Message-State: APjAAAVuxbEERhTF4+iPk2iLKKQYufgjbMRgAbzKz+3mqmeNHCQ0CGse
        Rm+wElpQM/G/eZUBdUy1fMoPGyTb0FkCPQ==
X-Google-Smtp-Source: APXvYqydtb/taAIx/Mz8nHaraiml4sMoeGaSCUZG2MJJpIaQGuz8leRgRxARB7JJduRsFa8dz9dihQ==
X-Received: by 2002:a0c:a910:: with SMTP id y16mr1119069qva.139.1582751082967;
        Wed, 26 Feb 2020 13:04:42 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.57.212])
        by smtp.gmail.com with ESMTPSA id j11sm1799786qkl.97.2020.02.26.13.04.42
        for <workflows@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 13:04:42 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1j73rG-0007RA-1D
        for workflows@vger.kernel.org; Wed, 26 Feb 2020 17:04:42 -0400
Date:   Wed, 26 Feb 2020 17:04:42 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     workflows@vger.kernel.org
Subject: Re: Patch attestation RFC + proof of concept
Message-ID: <20200226210442.GE31668@ziepe.ca>
References: <20200226172502.q3fl67ealxsonfgp@chatter.i7.local>
 <20200226201140.GA24263@ziepe.ca>
 <20200226204231.x5jbqgmkedtgpkmn@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200226204231.x5jbqgmkedtgpkmn@chatter.i7.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Feb 26, 2020 at 03:42:31PM -0500, Konstantin Ryabitsev wrote:
> On Wed, Feb 26, 2020 at 04:11:40PM -0400, Jason Gunthorpe wrote:
> > > If you look at the contents of the patch attestation message 
> > > (https://lore.kernel.org/signatures/202002251425.E7847687B@keescook/), 
> > > you will notice a yaml-style formatted document with a series of 
> > > three hashes. Let's take the first one as example:
> > > 
> > > 2a02abe0-215cf3f1-2acb5798:
> > >   i: 2a02abe02216f626105622aee2f26ab10c155b6442e23441d90fc5fe4071b86e
> > >   m: 215cf3f133478917ad147a6eda1010a9c4bba1846e7dd35295e9a0081559e9b0
> > >   p: 2acb5798c366f97501f8feacb873327bac161951ce83e90f04bbcde32e993865
> > > 
> > > The source of these hashes is the following patch:
> > > https://lore.kernel.org/kernel-hardening/20200225051307.6401-2-keescook@chromium.org/
> > 
> > If you define an alternative message signature algorithm like this,
> > then is there still value in detatching the PGP signature from the
> > patch email?
> 
> I believe that yes, because it offers better workflows around the
> following scenarios:
> 
> - developer does all their work on a remote VM that doesn't have access 
>   to their PGP keys and submits actual attestation when they get back to 
>   their workstation

Unfortunately this is a challenging work flow for a lot of reasons. :(

> - developer configures their smartcard to require a PIN during each 
>   operation and disables the pgp-agent; sending a series of 40 patches 
>   requires a single PIN entry instead of 40

This is certainly my situation, my PGP key lives in a yubikey token
configured for physical presence to confirm. :\

> - developer submits a v1 of the patch that they don't expect to pass on
>   the first try and doesn't bother submitting attestation; shockingly,
>   the maintainer accepts it as-is and the developer can attest their 
>   patches post-fact *without* needing to collect all the acked-by's 
>   reviewed-by's etc from all others who have already responded to the v1 
>   submission

But there won't be tags in this case, so how do we learn the original
attestation-id to find the detatched signature?

> For example, a maintainer will almost certainly edit the message content 
> to add their own Signed-off-by, and may edit the patch for minor 
> nitpicking. 

The i/p/m will always change once in git:
   - The commit message is always changed, at least to add sign off
   - The email Subject is always changed to strip [PATCH xxx]
   - The diff is almost always changed because the patch is applied
     to a different tree. The git blob IDs will be different at a
     minimum, at a maximum the context lines will be different

If we know the expected ID then you could do some fuzzy scheme to
cancel out, or at least check, the differences..

We have many patches now that have Link: trailer. I think it would be
useful to run some analysis:
 - Fetch the original patch email from the Link and compute the
   detached signature hashes
 - Attempt to validate this sigature against the git commit
 - Is there a fuzzy algorithm that brings this rate higher?

What is the pass/fail rate? It would say a lot about the strength of
this scheme through to the final git commit and thus if post-fact is
relevant or not.

> Full i-m-p attestation will fail in this case, but we can 
> then query the signatures archive for each individual hash to identify 
> which part of the submission fails validation:
> https://lore.kernel.org/signatures/?q=2a02abe02216f626105622aee2f26ab10c155b6442e23441d90fc5fe4071b86e
>
> This lets us present the maintainer with more useful info, like: "full 
> attestation failed, but the only changed part is actually the message 
> and not the patch content, so it's probably still okay to apply."

How does the message body get changed in transit from the submitter to
the maintainer?

> I still think that one of the key benefits of this proposal is being 
> able to submit patch attestation data post-fact. For signatures included 
> with patches, I'd rather see this happen during the git-format-patch 
> step following Vagard Nossum's work of fully reconstructing commits from 
> patches -- see my email to the git list here:
> https://lore.kernel.org/git/20200226200929.z4aej74ohbkgcdza@chatter.i7.local/T/#u

It is too bad that the email flow for git cannot, at least optionally,
reconstruct losslessly the original commit hashes. It would be very
nice if this were possible.

Jason
